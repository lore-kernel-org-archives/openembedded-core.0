Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8E46C877
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:57:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2013 06:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,923,1371106800"; d="scan'208";a="403027518"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.194])
	by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2013 06:57:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2013 14:57:46 +0100
Message-Id: <1379426266-16725-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] cmake-native: fix dependencies
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
X-List-Received-Date: Tue, 17 Sep 2013 13:57:59 -0000

When building cmake for native, we don't use the system libraries and
thus cmake builds its own internal version of libarchive; this requires
zlib, bzip2, and e2fsprogs. We can add to DEPENDS for the two former
libraries and patch out the latter.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../cmake/cmake-native_2.8.11.2.bb                 |  5 +++++
 .../cmake/cmake/cmlibarchive-disable-ext2fs.patch  | 26 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/cmlibarchive-disable-ext2fs.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
index ab31049..e2a157b 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
@@ -1,5 +1,10 @@
 require cmake.inc
 inherit native
 
+# Using cmake's internal libarchive, so some dependencies are needed
+DEPENDS += "bzip2-native zlib-native"
+
+SRC_URI += "file://cmlibarchive-disable-ext2fs.patch"
+
 SRC_URI[md5sum] = "6f5d7b8e7534a5d9e1a7664ba63cf882"
 SRC_URI[sha256sum] = "b32acb483afdd14339941c6e4ec25f633d916a7a472653a0b00838771a6c0562"
diff --git a/meta/recipes-devtools/cmake/cmake/cmlibarchive-disable-ext2fs.patch b/meta/recipes-devtools/cmake/cmake/cmlibarchive-disable-ext2fs.patch
new file mode 100644
index 0000000..bf36712
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/cmlibarchive-disable-ext2fs.patch
@@ -0,0 +1,26 @@
+Disable use of ext2fs/ext2_fs.h by cmake's internal libarchive copy
+
+We don't want to add a dependency on e2fsprogs-native for cmake-native,
+and we don't use CPack so just disable this functionality.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- a/Utilities/cmlibarchive/CMakeLists.txt
++++ b/Utilities/cmlibarchive/CMakeLists.txt
+@@ -237,12 +237,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+ LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
+ LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
+ LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
+-LA_CHECK_INCLUDE_FILE("ext2fs/ext2_fs.h" HAVE_EXT2FS_EXT2_FS_H)
+-
+-CHECK_C_SOURCE_COMPILES("#include <sys/ioctl.h>
+-#include <ext2fs/ext2_fs.h>
+-int main(void) { return EXT2_IOC_GETFLAGS; }" HAVE_WORKING_EXT2_IOC_GETFLAGS)
+-
++SET(HAVE_EXT2FS_EXT2_FS_H 0)
++SET(HAVE_WORKING_EXT2_IOC_GETFLAGS 0)
+ LA_CHECK_INCLUDE_FILE("fcntl.h" HAVE_FCNTL_H)
+ LA_CHECK_INCLUDE_FILE("grp.h" HAVE_GRP_H)
+ LA_CHECK_INCLUDE_FILE("inttypes.h" HAVE_INTTYPES_H)
-- 
1.8.1.2


