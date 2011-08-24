Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwIJs-0004x8-55
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 20:36:56 +0200
Received: by wyf19 with SMTP id 19so1160148wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 11:32:09 -0700 (PDT)
Received: by 10.227.151.200 with SMTP id d8mr599418wbw.29.1314210729612;
	Wed, 24 Aug 2011 11:32:09 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ej15sm1054506wbb.48.2011.08.24.11.32.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Aug 2011 11:32:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 20:32:00 +0200
Message-Id: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] libc-package bbclass: fix binary localedata dependency code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 18:36:56 -0000

When using binary locales rootfs generation fails with:

| Unknown package 'locale-base-en-us'.
| Collected errors:
|  * opkg_install_cmd: Cannot install package locale-base-en-us.

This is due to:

$ dpkg-deb -I ipk/armv7a/locale-base-en-us_2.12-r16_armv7a.ipk | grep Depends
 Depends: eglibc-binary-localedata-en.us

Note the '.' seperator

$ ls ipk/armv7a/ | grep binary-localedata-en | grep us
eglibc-binary-localedata-en-us_2.12-r16_armv7a.ipk

Note the '-' seperator vs the '.' in the locale-base packages.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/libc-package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 0d5ce20..d3b33d6 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -243,7 +243,7 @@ python package_do_split_gconvs () {
 	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
 		m = re.match("(.*)_(.*)", name)
 		if m:
-			libc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
+			libc_name = "%s-%s" % (m.group(1), m.group(2).lower().replace("-",""))
 		else:
 			libc_name = name
 		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('%s-binary-localedata-%s' \
-- 
1.6.6.1



