Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 47CB87705D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 16:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9JGfSjs019752 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 17:41:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ruHxiL8l92x3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 17:41:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9JGfGIp019736
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 17:41:27 +0100
Message-ID: <1445272876.17974.124.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Oct 2015 17:41:16 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] libc-package: Fix localedef multilib dependency issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Oct 2015 16:41:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Building nativesdk-glibc-locale results in many messages like:

QA Issue: nativesdk-locale-base-en-sg rdepends on localedef, but it isn't a build dependency? [build-deps]

It should depend on ${MLPREFIX}localedef, not just localedef
to fix these warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 47be691..adb4230 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -236,8 +236,8 @@ python package_do_split_gconvs () {
                 supported[locale] = charset
 
     def output_locale_source(name, pkgname, locale, encoding):
-        d.setVar('RDEPENDS_%s' % pkgname, 'localedef %s-localedata-%s %s-charmap-%s' % \
-        (mlprefix+bpn, legitimize_package_name(locale), mlprefix+bpn, legitimize_package_name(encoding)))
+        d.setVar('RDEPENDS_%s' % pkgname, '%slocaledef %s-localedata-%s %s-charmap-%s' % \
+        (mlprefix, mlprefix+bpn, legitimize_package_name(locale), mlprefix+bpn, legitimize_package_name(encoding)))
         d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_postinst', True) \
         % (locale, encoding, locale))
         d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm', True) % \



