Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QoGJl-0003sP-T1
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 16:51:37 +0200
Received: by wwi18 with SMTP id 18so5739952wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 07:47:16 -0700 (PDT)
Received: by 10.227.174.11 with SMTP id r11mr7306492wbz.11.1312296436244;
	Tue, 02 Aug 2011 07:47:16 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fn12sm5079451wbb.21.2011.08.02.07.47.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 07:47:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 16:47:11 +0200
Message-Id: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Tue, 02 Aug 2011 14:51:38 -0000

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
index de57230..67d08c0 100644
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



