Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 913C072748
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 02:24:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45389388"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Dec 2014 10:21:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBI2OBVN027083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 10:24:11 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Dec 2014 10:24:36 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Dec 2014 10:23:49 +0800
Message-ID: <1418869429-4521-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH] file: upgrade to 5.21
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
X-List-Received-Date: Thu, 18 Dec 2014 02:24:46 -0000
Content-Type: text/plain

file 5.21 fix CVE-2014-8116 and CVE-2014-8117.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../file/file/debian-742262-backport.patch         | 32 ++++++++++++++++++++
 .../recipes-devtools/file/file/debian-742262.patch | 19 ------------
 meta/recipes-devtools/file/file_5.18.bb            | 35 ----------------------
 meta/recipes-devtools/file/file_5.21.bb            | 35 ++++++++++++++++++++++
 4 files changed, 67 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file/debian-742262-backport.patch
 delete mode 100644 meta/recipes-devtools/file/file/debian-742262.patch
 delete mode 100644 meta/recipes-devtools/file/file_5.18.bb
 create mode 100644 meta/recipes-devtools/file/file_5.21.bb

diff --git a/meta/recipes-devtools/file/file/debian-742262-backport.patch b/meta/recipes-devtools/file/file/debian-742262-backport.patch
new file mode 100644
index 0000000..8c68d62
--- /dev/null
+++ b/meta/recipes-devtools/file/file/debian-742262-backport.patch
@@ -0,0 +1,32 @@
+From 1d147dd57a63003da63a2df32030b17d5f1c08b6 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Thu, 18 Dec 2014 10:39:29 +0900
+Subject: [PATCH] The awk pattern was checked *before* the Perl pattern, so the
+  perl script with BEGIN{...} would be reported as awk, this patch fixes it.
+
+Upstream-Status: Backport [debian]
+
+the author of this patch is Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
+and Robert Yang <liezhi.yang@windriver.com>
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ magic/Magdir/commands | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/magic/Magdir/commands b/magic/Magdir/commands
+index 3d97489..689caa5 100644
+--- a/magic/Magdir/commands
++++ b/magic/Magdir/commands
+@@ -57,7 +57,7 @@
+ 0	string/wt	#!\ /usr/bin/awk	awk script text executable
+ !:mime	text/x-awk
+ 0	regex/4096	=^\\s{0,100}BEGIN\\s{0,100}[{]	awk or perl script text
+-
++!:strength - 12
+ # AT&T Bell Labs' Plan 9 shell
+ 0	string/wt	#!\ /bin/rc	Plan 9 rc shell script text executable
+ 
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-devtools/file/file/debian-742262.patch b/meta/recipes-devtools/file/file/debian-742262.patch
deleted file mode 100644
index d57258c..0000000
--- a/meta/recipes-devtools/file/file/debian-742262.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-The awk pattern was checked *before* the Perl pattern, so the perl
-script with BEGIN{...} would be reported as awk, this patch fixes it.
-
-Upstream-Status: Backport [debian]
-
-Signed-off-by: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
-diff --git a/magic/Magdir/commands b/magic/Magdir/commands
---- a/magic/Magdir/commands
-+++ b/magic/Magdir/commands
-@@ -50,6 +50,7 @@
- 0	string/wt	#!\ /usr/bin/awk	awk script text executable
- !:mime	text/x-awk
- 0	regex		=^\\s{0,100}BEGIN\\s{0,100}[{]	awk script text
-+!:strength - 12
- 
- # AT&T Bell Labs' Plan 9 shell
- 0	string/wt	#!\ /bin/rc	Plan 9 rc shell script text executable
diff --git a/meta/recipes-devtools/file/file_5.18.bb b/meta/recipes-devtools/file/file_5.18.bb
deleted file mode 100644
index 9068b93..0000000
--- a/meta/recipes-devtools/file/file_5.18.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "File classification tool"
-DESCRIPTION = "File attempts to classify files depending \
-on their contents and prints a description if a match is found."
-HOMEPAGE = "http://www.darwinsys.com/file/"
-SECTION = "console/utils"
-
-# two clause BSD
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
-
-DEPENDS = "zlib file-native"
-DEPENDS_class-native = "zlib-native"
-
-SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
-           file://debian-742262.patch \
-          "
-
-SRC_URI[md5sum] = "d420d8f2990cd344673acfbf8d76ff5a"
-SRC_URI[sha256sum] = "6519fb706d583231c2419592ebecdbb21d33c62eaf7a1a0b24ddfcb80c08bf07"
-
-inherit autotools
-
-FILES_${PN} += "${datadir}/misc/*.mgc"
-
-do_install_append_class-native() {
-	create_cmdline_wrapper ${D}/${bindir}/file \
-		--magic-file ${datadir}/misc/magic.mgc
-}
-
-do_install_append_class-nativesdk() {
-	create_cmdline_wrapper ${D}/${bindir}/file \
-		--magic-file ${datadir}/misc/magic.mgc
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/file/file_5.21.bb b/meta/recipes-devtools/file/file_5.21.bb
new file mode 100644
index 0000000..c61954b
--- /dev/null
+++ b/meta/recipes-devtools/file/file_5.21.bb
@@ -0,0 +1,35 @@
+SUMMARY = "File classification tool"
+DESCRIPTION = "File attempts to classify files depending \
+on their contents and prints a description if a match is found."
+HOMEPAGE = "http://www.darwinsys.com/file/"
+SECTION = "console/utils"
+
+# two clause BSD
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
+
+DEPENDS = "zlib file-native"
+DEPENDS_class-native = "zlib-native"
+
+SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
+    file://debian-742262.patch \
+"
+
+SRC_URI[md5sum] = "549fe96e09041eabece9de2bb28ef923"
+SRC_URI[sha256sum] = "1a48741d3923c4cc73267109b8a396c0ce3aebe004181f3efb1b0a228d230bb6"
+
+inherit autotools
+
+FILES_${PN} += "${datadir}/misc/*.mgc"
+
+do_install_append_class-native() {
+	create_cmdline_wrapper ${D}/${bindir}/file \
+		--magic-file ${datadir}/misc/magic.mgc
+}
+
+do_install_append_class-nativesdk() {
+	create_cmdline_wrapper ${D}/${bindir}/file \
+		--magic-file ${datadir}/misc/magic.mgc
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.4.2


