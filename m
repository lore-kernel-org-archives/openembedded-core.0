Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbtV4-0001c8-Gy
	for openembedded-core@lists.linuxtogo.org;
	Wed, 29 Jun 2011 14:04:10 +0200
Received: by wwf22 with SMTP id 22so1018356wwf.6
	for <openembedded-core@lists.linuxtogo.org>;
	Wed, 29 Jun 2011 05:00:28 -0700 (PDT)
Received: by 10.227.55.69 with SMTP id t5mr617582wbg.94.1309348828211;
	Wed, 29 Jun 2011 05:00:28 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b13sm855624wbh.41.2011.06.29.05.00.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 05:00:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.linuxtogo.org
Date: Wed, 29 Jun 2011 14:00:23 +0200
Message-Id: <1309348823-29217-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] libc locale split: fix some remaining problems
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
X-List-Received-Date: Wed, 29 Jun 2011 12:04:10 -0000

* libc-{common,package}.bbclass: fix shlib renaming for the C library
	Without this you'd end up with eglibc_2.12.ipk instead of libc6_2.12.ipk as before

* eglibc-locale: don't make versions go backwards after split from eglibc
	eglibc was way beyond PR = "r1" at the time of the split, so increase PR to make package upgrades work

This still doesn't fix:

$ dpkg-deb -I ipk/armv7a/libc6_2.12-r16_armv7a.ipk
 Package: libc6
	[..]
 Depends: libc6-dev (>= 2.12)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/libc-common.bbclass           |    7 +++++++
 meta/classes/libc-package.bbclass          |    5 +----
 meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index bae0ace..5e93205 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -21,3 +21,10 @@ def get_libc_fpu_setting(bb, d):
     if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
         return "--without-fp"
     return ""
+
+python populate_packages_prepend () {
+	if bb.data.getVar('DEBIAN_NAMES', d, 1):
+		bpn = bb.data.getVar('BPN', d, 1)
+		bb.data.setVar('PKG_'+bpn, 'libc6', d)
+		bb.data.setVar('PKG_'+bpn+'-dev', 'libc6-dev', d)
+}
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 4bc58c8..695b260 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -368,9 +368,6 @@ python package_do_split_gconvs () {
 # We want to do this indirection so that we can safely 'return'
 # from the called function even though we're prepending
 python populate_packages_prepend () {
-	if bb.data.getVar('DEBIAN_NAMES', d, 1):
-		bpn = bb.data.getVar('BPN', d, 1)
-		bb.data.setVar('PKG_'+bpn, 'libc6', d)
-		bb.data.setVar('PKG_'+bpn+'-dev', 'libc6-dev', d)
 	bb.build.exec_func('package_do_split_gconvs', d)
 }
+
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 7c4b1d5..96f2d8a 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -26,7 +26,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r1"
+PR = "r16"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-- 
1.6.6.1



