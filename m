Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F98B783EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:05:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8C85Dsw011241
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Sep 2017 01:05:13 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 12 Sep 2017 01:05:11 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>, <patrick.ohly@intel.com>
Date: Tue, 12 Sep 2017 04:05:09 -0400
Message-ID: <70a427e914c866d90949df92b10332ec762ab22f.1505203270.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1505203270.git.dengke.du@windriver.com>
References: <cover.1505203270.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V3 1/1] ovmf: fix do_compile error when len(tmp)=410
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
X-List-Received-Date: Tue, 12 Sep 2017 08:05:13 -0000
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
index 0000000..35fc3ac
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch
@@ -0,0 +1,28 @@
+From 49d0923dce509127828b0867c2af31ec84a5c2a9 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Mon, 11 Sep 2017 02:21:55 -0400
+Subject: [PATCH] ovmf: enable long path file
+
+Upstream-Status: Inappropriate
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


