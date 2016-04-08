Return-Path: <denis@denix.org>
X-Greylist: delayed 3601 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Apr 2016 05:57:33 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id CCE93731DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 05:57:33 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5A001EVTR9A700@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2016 23:57:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=iGHA9ds3AAAA:8
	a=42p_2lCUoWMACt-sqWUA:9
Received: by 100.15.86.14 with SMTP id 5909fb64; Fri, 08 Apr 2016 04:57:14 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 44F49161F54;	Fri,
	8 Apr 2016 00:57:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 08 Apr 2016 00:57:08 -0400
Message-id: <1460091428-15870-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] opkg-utils: re-do find/ls code to not fail on filenames with spaces
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
X-List-Received-Date: Fri, 08 Apr 2016 05:57:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...re-do-find-ls-code-to-not-fail-on-filenam.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch
new file mode 100644
index 0000000..5cbb55a
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch
@@ -0,0 +1,56 @@
+From 8e424296ce2af4a5a7392c38a31f8723f9b9fbda Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 7 Apr 2016 20:43:13 -0400
+Subject: [PATCH] opkg-build: re-do find/ls code to not fail on filenames with
+ spaces
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ opkg-build | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9ccad2..07305b2 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -6,7 +6,6 @@
+ # 2003-04-25 rea@sr.unh.edu
+ #   Updated to work on Familiar Pre0.7rc1, with busybox tar.
+ #   Note it Requires: binutils-ar (since the busybox ar can't create)
+-#   For UID debugging it needs a better "find".
+ set -e
+ 
+ version=1.0
+@@ -47,12 +46,12 @@ pkg_appears_sane() {
+ 
+ 	PKG_ERROR=0
+ 
+-	tilde_files=`find . -name '*~'`
++	tilde_files=`find . -name '*~' -ls -printf '\\\n'`
+ 	if [ -n "$tilde_files" ]; then
+ 	    if [ "$noclean" = "1" ]; then
+ 		echo "*** Warning: The following files have names ending in '~'.
+ You probably want to remove them: " >&2
+-		ls -ld $tilde_files
++		echo -e $tilde_files
+ 		if [ $? -ne 0 ]; then
+ 			echo "*** Error: Fail to list files have names ending in '~'."
+ 			exit 1
+@@ -64,12 +63,12 @@ You probably want to remove them: " >&2
+ 	    fi
+ 	fi
+ 
+-	large_uid_files=`find . -uid +99 || true`
++	large_uid_files=`find . -uid +99 -ls -printf '\\\n' || true`
+ 
+ 	if [ "$ogargs" = "" ]  && [ -n "$large_uid_files" ]; then
+ 		echo "*** Warning: The following files have a UID greater than 99.
+ You probably want to chown these to a system user: " >&2
+-		ls -ld $large_uid_files
++		echo -e $large_uid_files
+ 		if [ $? -ne 0 ]; then
+ 			echo "*** Error: Fail to list files have a UID greater than 99."
+ 			exit 1
+-- 
+2.2.0
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 22f45a1..8873b28 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -11,7 +11,8 @@ SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils \
-           file://opkg-build-Exit-when-fail-to-list-files.patch"
+           file://opkg-build-Exit-when-fail-to-list-files.patch \
+           file://0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.patch"
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 
 S = "${WORKDIR}/git"
-- 
2.2.0


