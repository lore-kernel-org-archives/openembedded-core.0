Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RL53B-000277-3g
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 04:30:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Oct 2011 20:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,435,1315206000"; d="scan'208";a="69105207"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 31 Oct 2011 20:24:03 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 11:38:28 +0800
Message-Id: <5728a89450a5585a94fe71dce72c9458bfcba286.1320118475.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1320118475.git.dongxiao.xu@intel.com>
References: <cover.1320118475.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1320118475.git.dongxiao.xu@intel.com>
References: <cover.1320118475.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/2] connman: add xtables_version to fix xtables API change
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
X-List-Received-Date: Tue, 01 Nov 2011 03:30:09 -0000

After upgrade iptables to a newer version, some of its API are changed.
Therefore we add related fixes to the current connman.

Currently we don't upgrade connman since kernel.org still doesn't work
and we could not fetch the newer sources.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../connman/connman-0.75/xtables_version.patch     |   64 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.75.bb  |    3 +-
 2 files changed, 66 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch

diff --git a/meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch b/meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
new file mode 100644
index 0000000..13e2c36
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
@@ -0,0 +1,64 @@
+xtables_merge_options API change, fix its calling in connman.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Backport
+
+diff -ruN connman-0.75-orig//src/iptables.c connman-0.75/src/iptables.c
+--- connman-0.75-orig//src/iptables.c	2011-02-22 12:16:25.000000000 +0800
++++ connman-0.75/src/iptables.c	2011-10-26 09:21:33.941164000 +0800
+@@ -1089,7 +1089,11 @@
+ 			if (xt_t->init != NULL)
+ 				xt_t->init(xt_t->t);
+ 			iptables_globals.opts =
+-				xtables_merge_options(iptables_globals.opts,
++				xtables_merge_options(
++#if XTABLES_VERSION_CODE > 5
++                                                     iptables_globals.orig_opts,
++#endif
++                                                     iptables_globals.opts,
+ 						     xt_t->extra_opts,
+ 						     &xt_t->option_offset);
+ 			if (iptables_globals.opts == NULL)
+@@ -1113,7 +1117,11 @@
+ 				xt_m->init(xt_m->m);
+ 			if (xt_m != xt_m->next) {
+ 				iptables_globals.opts =
+-				xtables_merge_options(iptables_globals.opts,
++				xtables_merge_options(
++#if XTABLES_VERSION_CODE > 5
++                                                iptables_globals.orig_opts,
++#endif
++                                                iptables_globals.opts,
+ 						xt_m->extra_opts,
+ 						&xt_m->option_offset);
+ 				if (iptables_globals.opts == NULL)
+diff -ruN connman-0.75-orig//tools/iptables-test.c connman-0.75/tools/iptables-test.c
+--- connman-0.75-orig//tools/iptables-test.c	2011-02-22 12:16:25.000000000 +0800
++++ connman-0.75/tools/iptables-test.c	2011-10-26 09:23:25.701164000 +0800
+@@ -1076,7 +1076,11 @@
+ 			if (xt_t->init != NULL)
+ 				xt_t->init(xt_t->t);
+ 			connman_iptables_globals.opts =
+-				xtables_merge_options(connman_iptables_globals.opts,
++				xtables_merge_options(
++#if XTABLES_VERSION_CODE > 5
++						     connman_iptables_globals.orig_opts,
++#endif
++						     connman_iptables_globals.opts,
+ 						     xt_t->extra_opts,
+ 						     &xt_t->option_offset);
+ 			if (connman_iptables_globals.opts == NULL)
+@@ -1102,7 +1106,11 @@
+ 				xt_m->init(xt_m->m);
+ 			if (xt_m != xt_m->next) {
+ 				connman_iptables_globals.opts =
+-					xtables_merge_options(connman_iptables_globals.opts,
++					xtables_merge_options(
++#if XTABLES_VERSION_CODE > 5
++						connman_iptables_globals.orig_opts,
++#endif
++						connman_iptables_globals.opts,
+ 						xt_m->extra_opts,
+ 						&xt_m->option_offset);
+ 				if (connman_iptables_globals.opts == NULL)
diff --git a/meta/recipes-connectivity/connman/connman_0.75.bb b/meta/recipes-connectivity/connman/connman_0.75.bb
index 4c25fcc..8a02753 100644
--- a/meta/recipes-connectivity/connman/connman_0.75.bb
+++ b/meta/recipes-connectivity/connman/connman_0.75.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "\
   ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
@@ -21,6 +21,7 @@ EXTRA_OECONF += "\
 SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/connman/connman-${PV}.tar.gz \
   file://add_xuser_dbus_permission.patch \
+  file://xtables_version.patch \
   file://connman \
 "
 
-- 
1.7.1



