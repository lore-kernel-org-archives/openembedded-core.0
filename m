Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TqXNM-0006Fb-TY
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 00:05:34 +0100
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id AF6E52088F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2013 17:50:31 -0500 (EST)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Wed, 02 Jan 2013 17:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:content-type:date
	:message-id:mime-version; s=smtpout; bh=rYk0NJf5jPxwhEa6jr3EAdtt
	PRo=; b=tlagPp3/HgXqYJDlKPU3hZJFb/WuMx1rXUMDNN8qYqr0SBGkBgX1v8H1
	Yj9YaHfi3vytUXoe2F00S17FeCWgFrFAtXy0hhDbkKxlT0Az0yNyOhtSvzxj+mqM
	rg3JFYUOL6PYGYn8TwvsgGyy5HcgYyyYHgH65Z5rjvDeAQfAErI=
X-Sasl-enc: bTdPiA/kl0eiqWJQeHc7atfD0YH2TCsIjDItSnNqnkSa 1357167031
Received: from [172.30.200.54] (unknown [153.120.232.4])
	by mail.messagingengine.com (Postfix) with ESMTPA id EC7B84824E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2013 17:50:30 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 02 Jan 2013 17:50:14 -0500
Message-ID: <1357167014.14851.18.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-27.el6) 
Subject: locale packages patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2013 23:05:34 -0000
X-Groupsio-MsgNum: 33222
Content-Type: multipart/mixed; boundary="=-o0cok4hHFnJNipmyljD8"

--=-o0cok4hHFnJNipmyljD8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

A GNOME contributor submitted the following patch to the gnome-ostree
system (Yocto-derived base):

https://bugzilla.gnome.org/show_bug.cgi?id=690959#c3

Any comments on whether this could be upstreamable?  While we're already
carrying a few patches to oe-core, I'd obviously like to keep them as
minimal as possible.

Hmmm...in our case, we may be able to set PACKAGE_NO_LOCALE globally to
avoid split locales?  But this patch may be more broadly useful if there
are projects that want say just all eglibc locales, but not translations
for everything.

For convenience, the full patch is attached.


--=-o0cok4hHFnJNipmyljD8
Content-Disposition: attachment; filename="oe-locales.patch"
Content-Type: text/x-patch; name="oe-locales.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 171a0fc3c034a8c723263f785c8524c263af8c4b Mon Sep 17 00:00:00 2001
From: Giovanni Campagna <gcampagna@src.gnome.org>
Date: Sun, 30 Dec 2012 18:15:14 +0100
Subject: [PATCH] Fix locale package generation

The package class has code to generate split language pack packages,
one, and each of those provides ${PN}-locale, so installing ${PN}-locale
ends up installing a language at random. Make ${PN}-locale a meta package
instead, and have it RDEPEND on the actual locale packages.
This allows a distro to install all translations without caring of which
are actually shipped by a particular package.
The dependency for individual locale packages on virtual-locale-* is
removed, to allow installing eglibc-locale-locale.alias (otherwise depending
on a non-existing virtual-locale-locale.alias)

https://bugzilla.gnome.org/show_bug.cgi?id=690959
---
 meta/classes/package.bbclass | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 73c4358..4258dee 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -446,17 +446,28 @@ python package_do_split_locales() {
     locale_section = d.getVar('LOCALE_SECTION', True)
     mlprefix = d.getVar('MLPREFIX', True) or ""
     pndep = base_contains('PACKAGES', pn, '%s ' % pn, '', d)
+
+    base_locale_pkg = pn + '-locale'
+    packages.append(base_locale_pkg)
+    d.setVar('ALLOW_EMPTY_' + base_locale_pkg, '1')
+    d.setVar('SUMMARY_' + base_locale_pkg, '%s - all translations' % (summary,))
+    d.setVar('DESCRIPTION_' + base_locale_pkg, '%s  This metapackage depends on packages providing language translation files.' % (description,))
+    d.setVar('RDEPENDS_' + base_locale_pkg, '')
+    d.setVar('FILES_' + base_locale_pkg, '')
+    if locale_section:
+        d.setVar('SECTION_' + pkg, locale_section)
+
     for l in sorted(locales):
         ln = legitimize_package_name(l)
         pkg = pn + '-locale-' + ln
         packages.append(pkg)
         d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
-        d.setVar('RDEPENDS_' + pkg, '%s%svirtual-locale-%s' % (pndep, mlprefix, ln))
-        d.setVar('RPROVIDES_' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
+        d.setVar('RDEPENDS_' + pkg, pndep)
         d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l))
         d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
         if locale_section:
             d.setVar('SECTION_' + pkg, locale_section)
+        d.setVar('RDEPENDS_' + base_locale_pkg, '%s %s' % (d.getVar('RDEPENDS_' + base_locale_pkg, True), pkg))
 
     d.setVar('PACKAGES', ' '.join(packages))
 
-- 
1.8.0.1

--=-o0cok4hHFnJNipmyljD8--
