Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 14BA96EAFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:51:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2014 14:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,588,1389772800"; d="scan'208";a="492416811"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.227])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2014 14:51:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 14:51:02 -0800
Message-Id: <f4a8117a063733ed6353baf0eb89377ec9ba26c8.1393973357.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <c8001854a355061a1c36a51eced9f72f2ce294d3.1393973357.git.sgw@linux.intel.com>
References: <c8001854a355061a1c36a51eced9f72f2ce294d3.1393973357.git.sgw@linux.intel.com>
In-Reply-To: <cover.1393973357.git.sgw@linux.intel.com>
References: <cover.1393973357.git.sgw@linux.intel.com>
Subject: [PATCH 5/6] parted: add patch to handle deprecated readline function
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
X-List-Received-Date: Tue, 04 Mar 2014 22:51:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../parted-3.1/fix-deprecated-readline.patch       | 34 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.1.bb         |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch

diff --git a/meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch b/meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch
new file mode 100644
index 0000000..c4ca06d
--- /dev/null
+++ b/meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch
@@ -0,0 +1,34 @@
+
+From: Gustavo Zacarias
+Subject: bug#16929: [PATCH] ui: switch to new-style readline typedef
+Date: Mon, 3 Mar 2014 10:40:08 -0300
+
+The CPPFunction typedef (among others) have been deprecated in favour of
+specific prototyped typedefs since readline 4.2 (circa 2001).
+It's been working since because compatibility typedefs have been in
+place until they where removed in the recent readline 6.3 release.
+Switch to the new style to avoid build breakage.
+
+Signed-off-by: Gustavo Zacarias <address@hidden>
+
+Upstream-Status: Backport
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+---
+ parted/ui.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parted/ui.c b/parted/ui.c
+index 786deed..b33f6fc 100644
+--- a/parted/ui.c
++++ b/parted/ui.c
+@@ -1470,7 +1470,7 @@ init_readline (void)
+ #ifdef HAVE_LIBREADLINE
+   if (!opt_script_mode) {
+     rl_initialize ();
+-    rl_attempted_completion_function = (CPPFunction*) complete_function;
++    rl_attempted_completion_function = (rl_completion_func_t *) complete_function;
+     readline_state.in_readline = 0;
+   }
+ #endif
diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.1.bb
index 1e07da4..8344ea8 100644
--- a/meta/recipes-extended/parted/parted_3.1.bb
+++ b/meta/recipes-extended/parted/parted_3.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-git-version-gen.patch \
            file://fix-doc-mandir.patch \
            file://fix-dvh-overflows.patch \
+           file://fix-deprecated-readline.patch \
            file://run-ptest \
            file://Makefile \
 "
-- 
1.8.3.1


