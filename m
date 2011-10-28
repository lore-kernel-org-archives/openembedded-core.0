Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd7F-0006Bu-N3
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 20:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,416,1315206000"; d="scan'208";a="83351178"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 20:22:19 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:49 +0800
Message-Id: <16bb0ee2a7c85139970f8ce6cdf0a4c41df60a7c.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 10/11] connman: add xtables_version to fix xtables API change
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:23 -0000

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



