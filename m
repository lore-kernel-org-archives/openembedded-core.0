Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7A36059E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 06:13:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jan 2018 22:13:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,495,1508828400"; 
   d="scan'208";a="6649303"
Received: from anujm-desk.png.intel.com ([172.30.199.130])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jan 2018 22:13:06 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 14:12:59 +0800
Message-Id: <1514873579-8409-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] acpica: fix build with x32
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
X-List-Received-Date: Tue, 02 Jan 2018 06:13:06 -0000

Make sure architecture dependent defines are correct for x32 by
checking for both ILP32 and x86_64.

Fixes [YOCTO #12123]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>wq
---
 meta/recipes-extended/acpica/acpica_20170303.bb    |  1 +
 ...Linux-add-support-for-X32-ABI-compilation.patch | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/acpica/files/0001-Linux-add-support-for-X32-ABI-compilation.patch

diff --git a/meta/recipes-extended/acpica/acpica_20170303.bb b/meta/recipes-extended/acpica/acpica_20170303.bb
index 8e914cd..4c0f366 100644
--- a/meta/recipes-extended/acpica/acpica_20170303.bb
+++ b/meta/recipes-extended/acpica/acpica_20170303.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://no-werror.patch \
     file://rename-yy_scan_string-manually.patch \
     file://manipulate-fds-instead-of-FILE.patch;striplevel=2 \
+    file://0001-Linux-add-support-for-X32-ABI-compilation.patch \
     "
 SRC_URI[md5sum] = "48ef4314fb4ffdd0c96f14dcf20544e1"
 SRC_URI[sha256sum] = "b2d81e84107ac9a02be86ea43cbea7afa8fd4b4150270bc88c2d4c9fea0b8aad"
diff --git a/meta/recipes-extended/acpica/files/0001-Linux-add-support-for-X32-ABI-compilation.patch b/meta/recipes-extended/acpica/files/0001-Linux-add-support-for-X32-ABI-compilation.patch
new file mode 100644
index 0000000..df74200
--- /dev/null
+++ b/meta/recipes-extended/acpica/files/0001-Linux-add-support-for-X32-ABI-compilation.patch
@@ -0,0 +1,31 @@
+From d22241efc0708c9799f17a20eabb52a48d6d6ea1 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Tue, 2 Jan 2018 12:35:32 +0800
+Subject: [PATCH] Linux: add support for X32 ABI compilation
+
+X32 follows ILP32 model. Check for ILP32 as well when checking for
+x86_64 to ensure the defines are correct for X32 ABI.
+
+Upstream-Status: Submitted [https://github.com/acpica/acpica/pull/348]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ source/include/platform/aclinux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/include/platform/aclinux.h b/source/include/platform/aclinux.h
+index 75b1d82..6b8ff73 100644
+--- a/source/include/platform/aclinux.h
++++ b/source/include/platform/aclinux.h
+@@ -315,7 +315,7 @@
+ #define ACPI_FLUSH_CPU_CACHE()
+ #define ACPI_CAST_PTHREAD_T(Pthread) ((ACPI_THREAD_ID) (Pthread))
+ 
+-#if defined(__ia64__)    || defined(__x86_64__) ||\
++#if defined(__ia64__)    || (defined(__x86_64__) && !defined(__ILP32__)) ||\
+     defined(__aarch64__) || defined(__PPC64__) ||\
+     defined(__s390x__)
+ #define ACPI_MACHINE_WIDTH          64
+-- 
+2.7.4
+
-- 
2.7.4


