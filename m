Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDC97898C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053986"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:49 +0200
Message-Id: <20180308181804.31261-27-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 27/42] parted: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:23 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/parted/files/no_check.patch | 10 +++++-----
 meta/recipes-extended/parted/files/syscalls.patch | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/parted/files/no_check.patch b/meta/recipes-extended/parted/files/no_check.patch
index 58d8db44264..e6a26d11a5c 100644
--- a/meta/recipes-extended/parted/files/no_check.patch
+++ b/meta/recipes-extended/parted/files/no_check.patch
@@ -5,12 +5,12 @@ it to be disabled.
 
 RP - 4/11/08
 
-Index: parted-1.9.0/configure.ac
+Index: parted-3.2/configure.ac
 ===================================================================
---- parted-1.9.0.orig/configure.ac	2009-07-23 18:52:08.000000000 +0100
-+++ parted-1.9.0/configure.ac	2010-02-02 14:13:56.013905093 +0000
-@@ -477,7 +477,7 @@
- AM_CONDITIONAL([BUILD_LINUX], [test "$OS" = linux])
+--- parted-3.2.orig/configure.ac
++++ parted-3.2/configure.ac
+@@ -555,7 +555,7 @@ AC_CHECK_HEADER([execinfo.h], [
+ AM_CONDITIONAL([COMPILE_FOR_S390], [test "$host_cpu" = s390 || test "$host_cpu" = s390x])
  
  dnl check for "check", unit testing library/header
 -PKG_CHECK_MODULES([CHECK], [check >= 0.9.3], have_check=yes, have_check=no)
diff --git a/meta/recipes-extended/parted/files/syscalls.patch b/meta/recipes-extended/parted/files/syscalls.patch
index e9bbe9a956d..93205a0a804 100644
--- a/meta/recipes-extended/parted/files/syscalls.patch
+++ b/meta/recipes-extended/parted/files/syscalls.patch
@@ -4,10 +4,10 @@ Upstream-Status: Pending
  libparted/arch/linux.c |   13 +++++++++++++
  1 file changed, 13 insertions(+)
 
-Index: parted-1.9.0/libparted/arch/linux.c
+Index: parted-3.2/libparted/arch/linux.c
 ===================================================================
---- parted-1.9.0.orig/libparted/arch/linux.c	2009-07-23 18:52:08.000000000 +0100
-+++ parted-1.9.0/libparted/arch/linux.c	2010-02-02 14:14:16.523904768 +0000
+--- parted-3.2.orig/libparted/arch/linux.c
++++ parted-3.2/libparted/arch/linux.c
 @@ -17,6 +17,8 @@
  
  #define PROC_DEVICES_BUFSIZ 16384
@@ -16,8 +16,8 @@ Index: parted-1.9.0/libparted/arch/linux.c
 +
  #include <config.h>
  #include <arch/linux.h>
- 
-@@ -1477,12 +1479,14 @@
+ #include <linux/blkpg.h>
+@@ -1696,12 +1698,14 @@ linux_refresh_close (PedDevice* dev)
  
  #if SIZEOF_OFF_T < 8
  
@@ -32,7 +32,7 @@ Index: parted-1.9.0/libparted/arch/linux.c
  
  loff_t
  llseek (unsigned int fd, loff_t offset, unsigned int whence)
-@@ -1490,11 +1494,20 @@
+@@ -1709,11 +1713,20 @@ llseek (unsigned int fd, loff_t offset,
          loff_t result;
          int retval;
  
-- 
2.16.1


