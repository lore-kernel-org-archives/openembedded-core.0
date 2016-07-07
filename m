Return-Path: <tom.zanussi@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 690C46013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 17:10:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 07 Jul 2016 10:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,324,1464678000"; d="scan'208";a="135442445"
Received: from tzanussi-mobl.amr.corp.intel.com (HELO localhost)
	([10.254.182.227])
	by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2016 10:10:44 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 12:10:42 -0500
Message-Id: <986bed1f886d185c3fcae005c9a016b990fac717.1467911314.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1467911314.git.tom.zanussi@linux.intel.com>
References: <cover.1467911314.git.tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1][krogoth] systemtap: Add missing memory flag to fix stap module compilation
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
X-List-Received-Date: Thu, 07 Jul 2016 17:10:44 -0000

The 4.4 kernel removed some memory flag definitions, which cause
module compilation errors, rendering sytemtap essentially useless in
krogoth.

The problem is fixed in systemtap 3.0 and therefore in master, but as
mentioned in Systemtap BZ1285348, the fix for older versions is this
patch.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 ...48-by-updating-systemtap-s-memory-flag-us.patch | 73 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Fix-BZ1285348-by-updating-systemtap-s-memory-flag-us.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Fix-BZ1285348-by-updating-systemtap-s-memory-flag-us.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Fix-BZ1285348-by-updating-systemtap-s-memory-flag-us.patch
new file mode 100644
index 0000000..4c34d77
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Fix-BZ1285348-by-updating-systemtap-s-memory-flag-us.patch
@@ -0,0 +1,73 @@
+From 3d010295efd215cf83a7d07eecf89137973c154a Mon Sep 17 00:00:00 2001
+Message-Id: <3d010295efd215cf83a7d07eecf89137973c154a.1467836241.git.tom.zanussi@linux.intel.com>
+From: Jesper Brouer <jbrouer@redhat.com>
+Date: Mon, 30 Nov 2015 11:24:29 -0600
+Subject: [PATCH] Fix BZ1285348 by updating systemtap's memory flag usage.
+
+* runtime/linux/runtime_defines.h: Make sure __GFP_WAIT is defined.
+* runtime/stp_utrace.c (utrace_task_alloc): Change GFP_IOFS to
+  STP_ALLOC_FLAGS.
+  (utrace_attach_task): Ditto.
+
+Upstream-Status: Backport
+
+Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
+---
+ runtime/linux/runtime_defines.h | 23 +++++++++++++++++++++++
+ runtime/stp_utrace.c            |  5 +++--
+ 2 files changed, 26 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/linux/runtime_defines.h b/runtime/linux/runtime_defines.h
+index e69de29..6b44e0d 100644
+--- a/runtime/linux/runtime_defines.h
++++ b/runtime/linux/runtime_defines.h
+@@ -0,0 +1,23 @@
++// The following kernel commit renamed __GFP_WAIT to __GRP_RECLAIM:
++//
++//   commit 71baba4b92dc1fa1bc461742c6ab1942ec6034e9
++//   Author: Mel Gorman <mgorman@techsingularity.net>
++//   Date:   Fri Nov 6 16:28:28 2015 -0800
++// 
++//       mm, page_alloc: rename __GFP_WAIT to __GFP_RECLAIM
++//     
++//       __GFP_WAIT was used to signal that the caller was in atomic
++//       context and could not sleep.  Now it is possible to
++//       distinguish between true atomic context and callers that are
++//       not willing to sleep.  The latter should clear
++//       __GFP_DIRECT_RECLAIM so kswapd will still wake.  As clearing
++//       __GFP_WAIT behaves differently, there is a risk that people
++//       will clear the wrong flags.  This patch renames __GFP_WAIT to
++//       __GFP_RECLAIM to clearly indicate what it does -- setting it
++//       allows all reclaim activity, clearing them prevents it.
++//
++// Handle the rename by defining __GFP_WAIT as __GFP_RECLAIM.
++#include <linux/gfp.h>
++#ifndef __GFP_WAIT
++#define __GFP_WAIT __GFP_RECLAIM
++#endif
+diff --git a/runtime/stp_utrace.c b/runtime/stp_utrace.c
+index c69dec1..a8afc0d 100644
+--- a/runtime/stp_utrace.c
++++ b/runtime/stp_utrace.c
+@@ -511,7 +511,8 @@ static struct utrace *__task_utrace_struct(struct task_struct *task)
+  */
+ static bool utrace_task_alloc(struct task_struct *task)
+ {
+-	struct utrace *utrace = kmem_cache_zalloc(utrace_cachep, GFP_IOFS);
++	struct utrace *utrace = kmem_cache_zalloc(utrace_cachep,
++						  STP_ALLOC_FLAGS);
+ 	struct utrace *u;
+ 
+ 	if (unlikely(!utrace))
+@@ -782,7 +783,7 @@ static struct utrace_engine *utrace_attach_task(
+ 		utrace = task_utrace_struct(target);
+ 	}
+ 
+-	engine = kmem_cache_alloc(utrace_engine_cachep, GFP_IOFS);
++	engine = kmem_cache_alloc(utrace_engine_cachep, STP_ALLOC_FLAGS);
+ 	if (unlikely(!engine))
+ 		return ERR_PTR(-ENOMEM);
+ 
+-- 
+2.5.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 656f15f..2ea98b2 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -9,6 +9,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://system_map_location.patch \
            file://configure-allow-to-disable-libvirt.patch \
            file://x32_abi_time.patch \
+           file://0001-Fix-BZ1285348-by-updating-systemtap-s-memory-flag-us.patch \
           "
 
 # systemtap doesn't support mips
-- 
1.9.3


