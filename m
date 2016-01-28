Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 14BF77719B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 12:35:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jan 2016 04:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,358,1449561600"; d="scan'208";a="870690270"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2016 04:35:08 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 482462C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 05:23:02 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2016 14:37:21 +0200
Message-Id: <1453984641-1849-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
References: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] connman: fix crash with iptables 1.6
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
X-List-Received-Date: Thu, 28 Jan 2016 12:35:16 -0000

The struct of xtables_globals has been modified in iptables 1.6.
If connman runs with iptables 1.6, it can crash.

Program received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()
0xb7dea89c in xtables_find_target () from /usr/lib/libxtables.so.11
0xb7deac1c in ?? () from /usr/lib/libxtables.so.11
0xb7dea793 in xtables_find_target () from /usr/lib/libxtables.so.11

The the missing function item of xtables is added to xtables_globals.
It can fix the above issue.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...d-missing-function-item-of-xtables-to-mat.patch | 42 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.31.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch b/meta/recipes-connectivity/connman/connman/0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch
new file mode 100644
index 0000000..1b5a3e4
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch
@@ -0,0 +1,42 @@
+From acea08a0e4234a4c1a87bedc087c73ff36de0c7b Mon Sep 17 00:00:00 2001
+From: Wu Zheng <wu.zheng@intel.com>
+Date: Thu, 28 Jan 2016 18:04:17 +0800
+Subject: [PATCH] iptables: Add missing function item of xtables to match
+ iptables 1.6
+
+The struct of xtables_globals has been modified in iptables 1.6.
+If connman runs with iptables 1.6, it can crash.
+
+Program received signal SIGSEGV, Segmentation fault.
+0x00000000 in ?? ()
+0xb7dea89c in xtables_find_target () from /usr/lib/libxtables.so.11
+0xb7deac1c in ?? () from /usr/lib/libxtables.so.11
+0xb7dea793 in xtables_find_target () from /usr/lib/libxtables.so.11
+
+The the missing function item of xtables is added to xtables_globals.
+
+Upstream-Status: Backport
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Signed-off-by: Wu Zheng <wu.zheng@intel.com>
+---
+ src/iptables.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/iptables.c b/src/iptables.c
+index bc0c763..5ef757a 100644
+--- a/src/iptables.c
++++ b/src/iptables.c
+@@ -1566,6 +1566,9 @@ struct xtables_globals iptables_globals = {
+ 	.option_offset = 0,
+ 	.opts = iptables_opts,
+ 	.orig_opts = iptables_opts,
++#if XTABLES_VERSION_CODE > 10
++	.compat_rev = xtables_compatible_revision,
++#endif
+ };
+ 
+ static struct xtables_target *prepare_target(struct connman_iptables *table,
+-- 
+2.4.0
+
diff --git a/meta/recipes-connectivity/connman/connman_1.31.bb b/meta/recipes-connectivity/connman/connman_1.31.bb
index 7b6bcfb..e71d221 100644
--- a/meta/recipes-connectivity/connman/connman_1.31.bb
+++ b/meta/recipes-connectivity/connman/connman_1.31.bb
@@ -5,6 +5,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-Detect-backtrace-API-availability-before-using-it.patch \
             file://0002-resolve-musl-does-not-implement-res_ninit.patch \
             file://0003-Fix-header-inclusions-for-musl.patch \
+            file://0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch \
             file://connman \
             "
 SRC_URI[md5sum] = "cb1c413fcc4f49430294bbd7a92f5f3c"
-- 
2.4.0


