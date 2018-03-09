Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 85AC478977
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652000"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:58 +0200
Message-Id: <20180309185614.31113-20-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/36] ltp: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:20 -0000

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
 ...-Add-option-to-select-libc-implementation.patch | 78 +++++++++++-----------
 ..._GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch | 29 ++++----
 2 files changed, 51 insertions(+), 56 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
index cf744639c21..84ab37ea395 100644
--- a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
@@ -22,10 +22,10 @@ Upstream-Status: Pending
  testcases/realtime/stress/pi-tests/Makefile | 5 +++++
  8 files changed, 35 insertions(+), 2 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 297f8e7..906b280 100644
---- a/Makefile
-+++ b/Makefile
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
 @@ -49,6 +49,11 @@ SKIP_IDCHECK		?= 0
  UCLINUX			?= 0
  export UCLINUX
@@ -38,11 +38,11 @@ index 297f8e7..906b280 100644
  # CLEAN_TARGETS:	Targets which exist solely in clean.
  # COMMON_TARGETS:	Targets which exist in all, clean, and install.
  # INSTALL_TARGETS:	Targets which exist in clean and install (contains
-diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
-index 50a12fa..4f1987f 100644
---- a/testcases/kernel/Makefile
-+++ b/testcases/kernel/Makefile
-@@ -47,13 +47,16 @@ SUBDIRS			+= connectors \
+Index: git/testcases/kernel/Makefile
+===================================================================
+--- git.orig/testcases/kernel/Makefile
++++ git/testcases/kernel/Makefile
+@@ -48,13 +48,16 @@ SUBDIRS			+= connectors \
  			   logging \
  			   mem \
  			   numa \
@@ -60,10 +60,10 @@ index 50a12fa..4f1987f 100644
  ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
  SUBDIRS			+= power_management
  endif
-diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Makefile
-index 6245ed0..aa4eb7f 100644
---- a/testcases/kernel/sched/Makefile
-+++ b/testcases/kernel/sched/Makefile
+Index: git/testcases/kernel/sched/Makefile
+===================================================================
+--- git.orig/testcases/kernel/sched/Makefile
++++ git/testcases/kernel/sched/Makefile
 @@ -23,5 +23,7 @@
  top_srcdir		?= ../../..
  
@@ -73,11 +73,11 @@ index 6245ed0..aa4eb7f 100644
 +	FILTER_OUT_DIRS += process_stress
 +endif
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
-diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
-index 8acb395..b749126 100644
---- a/testcases/kernel/syscalls/Makefile
-+++ b/testcases/kernel/syscalls/Makefile
-@@ -28,5 +28,10 @@ ifeq ($(UCLINUX),1)
+Index: git/testcases/kernel/syscalls/Makefile
+===================================================================
+--- git.orig/testcases/kernel/syscalls/Makefile
++++ git/testcases/kernel/syscalls/Makefile
+@@ -28,6 +28,11 @@ ifeq ($(UCLINUX),1)
  FILTER_OUT_DIRS	+= capget capset chmod chown clone fork getcontext llseek \
  		   mincore mprotect nftw profil remap_file_pages sbrk
  endif
@@ -87,12 +87,13 @@ index 8acb395..b749126 100644
 +		   ustat
 +endif
  
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
-diff --git a/testcases/network/nfsv4/acl/Makefile b/testcases/network/nfsv4/acl/Makefile
-index 8bc78c2..c36cf50 100644
---- a/testcases/network/nfsv4/acl/Makefile
-+++ b/testcases/network/nfsv4/acl/Makefile
-@@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
+ ifeq ($(UCLIBC),1)
+ FILTER_OUT_DIRS	+= profil
+Index: git/testcases/network/nfsv4/acl/Makefile
+===================================================================
+--- git.orig/testcases/network/nfsv4/acl/Makefile
++++ git/testcases/network/nfsv4/acl/Makefile
+@@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre
  
  LDLIBS			+= $(ACL_LIBS)
  
@@ -101,10 +102,10 @@ index 8bc78c2..c36cf50 100644
 +endif
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
-index 3160813..9bdf5d0 100644
---- a/testcases/network/rpc/basic_tests/Makefile
-+++ b/testcases/network/rpc/basic_tests/Makefile
+Index: git/testcases/network/rpc/basic_tests/Makefile
+===================================================================
+--- git.orig/testcases/network/rpc/basic_tests/Makefile
++++ git/testcases/network/rpc/basic_tests/Makefile
 @@ -23,4 +23,9 @@
  top_srcdir		?= ../../../..
  
@@ -115,11 +116,11 @@ index 3160813..9bdf5d0 100644
 +endif
 +
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
-diff --git a/testcases/realtime/func/pi-tests/Makefile b/testcases/realtime/func/pi-tests/Makefile
-index 7a7a57a..5808866 100644
---- a/testcases/realtime/func/pi-tests/Makefile
-+++ b/testcases/realtime/func/pi-tests/Makefile
-@@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
+Index: git/testcases/realtime/func/pi-tests/Makefile
+===================================================================
+--- git.orig/testcases/realtime/func/pi-tests/Makefile
++++ git/testcases/realtime/func/pi-tests/Makefile
+@@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre
  include $(abs_srcdir)/../../config.mk
  
  MAKE_TARGETS		:= testpi-0 testpi-1 testpi-2 testpi-4 testpi-5 testpi-6 testpi-7 sbrk_mutex
@@ -129,10 +130,10 @@ index 7a7a57a..5808866 100644
 +
  
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/realtime/stress/pi-tests/Makefile b/testcases/realtime/stress/pi-tests/Makefile
-index 5edc3b4..aa5987a 100644
---- a/testcases/realtime/stress/pi-tests/Makefile
-+++ b/testcases/realtime/stress/pi-tests/Makefile
+Index: git/testcases/realtime/stress/pi-tests/Makefile
+===================================================================
+--- git.orig/testcases/realtime/stress/pi-tests/Makefile
++++ git/testcases/realtime/stress/pi-tests/Makefile
 @@ -24,4 +24,9 @@ top_srcdir		?= ../../../..
  
  include $(top_srcdir)/include/mk/env_pre.mk
@@ -143,6 +144,3 @@ index 5edc3b4..aa5987a 100644
 +endif
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
index 3e79c9f295d..462976da42c 100644
--- a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
+++ b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
@@ -18,10 +18,10 @@ Upstream-Status: Pending
  testcases/kernel/syscalls/mremap/mremap03.c | 2 ++
  3 files changed, 7 insertions(+), 1 deletion(-)
 
-diff --git a/testcases/kernel/syscalls/mremap/mremap01.c b/testcases/kernel/syscalls/mremap/mremap01.c
-index d63d1e4..24ca174 100644
---- a/testcases/kernel/syscalls/mremap/mremap01.c
-+++ b/testcases/kernel/syscalls/mremap/mremap01.c
+Index: git/testcases/kernel/syscalls/mremap/mremap01.c
+===================================================================
+--- git.orig/testcases/kernel/syscalls/mremap/mremap01.c
++++ git/testcases/kernel/syscalls/mremap/mremap01.c
 @@ -76,10 +76,12 @@
   */
  #include <unistd.h>
@@ -35,11 +35,11 @@ index d63d1e4..24ca174 100644
 +#undef _GNU_SOURCE
  
  #include "test.h"
- 
-diff --git a/testcases/kernel/syscalls/mremap/mremap02.c b/testcases/kernel/syscalls/mremap/mremap02.c
-index 5a51b9a..a530a6b 100644
---- a/testcases/kernel/syscalls/mremap/mremap02.c
-+++ b/testcases/kernel/syscalls/mremap/mremap02.c
+ #include "safe_macros.h"
+Index: git/testcases/kernel/syscalls/mremap/mremap02.c
+===================================================================
+--- git.orig/testcases/kernel/syscalls/mremap/mremap02.c
++++ git/testcases/kernel/syscalls/mremap/mremap02.c
 @@ -75,9 +75,11 @@
  #include <errno.h>
  #include <unistd.h>
@@ -52,10 +52,10 @@ index 5a51b9a..a530a6b 100644
  
  #include "test.h"
  
-diff --git a/testcases/kernel/syscalls/mremap/mremap03.c b/testcases/kernel/syscalls/mremap/mremap03.c
-index 12e3829..9b39f8b 100644
---- a/testcases/kernel/syscalls/mremap/mremap03.c
-+++ b/testcases/kernel/syscalls/mremap/mremap03.c
+Index: git/testcases/kernel/syscalls/mremap/mremap03.c
+===================================================================
+--- git.orig/testcases/kernel/syscalls/mremap/mremap03.c
++++ git/testcases/kernel/syscalls/mremap/mremap03.c
 @@ -76,9 +76,11 @@
  #include <errno.h>
  #include <unistd.h>
@@ -68,6 +68,3 @@ index 12e3829..9b39f8b 100644
  
  #include "test.h"
  
--- 
-2.7.0
-
-- 
2.16.1


