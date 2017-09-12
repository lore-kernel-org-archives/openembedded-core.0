Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04521784CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 01:20:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8C1KD4t008656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Sep 2017 18:20:13 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 11 Sep 2017 18:20:12 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 21:20:09 -0400
Message-ID: <c82454e88d60d4fdcea4fb4eddd8622df7a40caa.1505178922.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1505178922.git.dengke.du@windriver.com>
References: <cover.1505178922.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 1/1] ovmf: fix do_compile error when len(tmp)=410
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
X-List-Received-Date: Tue, 12 Sep 2017 01:20:13 -0000
Content-Type: text/plain

[YOCTO #11354]

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../ovmf/0004-ovmf-enable-long-path-file.patch     | 28 ++++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch b/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch
new file mode 100644
index 0000000..9cc85ad
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch
@@ -0,0 +1,28 @@
+From 032fc6b1f7691bd537fd2a6bd13821fcf3c45e64 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Mon, 11 Sep 2017 02:21:55 -0400
+Subject: [PATCH] ovmf: enable long path file
+
+Upstream-Status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ BaseTools/Source/C/Common/CommonLib.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/Common/CommonLib.h b/BaseTools/Source/C/Common/CommonLib.h
+index 2041b89..8116aa2 100644
+--- a/BaseTools/Source/C/Common/CommonLib.h
++++ b/BaseTools/Source/C/Common/CommonLib.h
+@@ -19,7 +19,7 @@ WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
+ #include <Common/BuildVersion.h>
+ #define PRINTED_GUID_BUFFER_SIZE  37  // including null-termination
+ 
+-#define MAX_LONG_FILE_PATH 500
++#define MAX_LONG_FILE_PATH 1023
+ 
+ #ifdef __cplusplus
+ extern "C" {
+-- 
+2.8.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 1872c95..50c01aa 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -11,10 +11,11 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[secureboot] = ",,,"
 
 SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
+	file://0001-ia32-Dont-use-pie.patch \
 	file://0002-ovmf-update-path-to-native-BaseTools.patch \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
+	file://0004-ovmf-enable-long-path-file.patch \
 	file://VfrCompile-increase-path-length-limit.patch \
-	file://0001-ia32-Dont-use-pie.patch \
 	file://no-stack-protector-all-archs.patch \
         "
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.8.1


