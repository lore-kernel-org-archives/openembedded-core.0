Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 743B36B5A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 21:34:44 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2013 14:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,897,1367996400"; d="scan'208";a="282999375"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.106])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2013 14:34:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2013 14:34:44 -0700
Message-Id: <1376688884-23815-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] cronie: fix out of tree build
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
X-List-Received-Date: Fri, 16 Aug 2013 21:34:45 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../cronie/cronie/fix-out-of-tree-build.patch      | 31 ++++++++++++++++++++++
 meta/recipes-extended/cronie/cronie_1.4.11.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch

diff --git a/meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch b/meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch
new file mode 100644
index 0000000..7384a0b
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch
@@ -0,0 +1,31 @@
+For an out of tree build, the cronie-common.h file was not being
+found correctly, so point it to the top_srcdir
+
+Upstream-Status: Submitted
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: cronie-1.4.11/anacron/Makefile.am
+===================================================================
+--- cronie-1.4.11.orig/anacron/Makefile.am
++++ cronie-1.4.11/anacron/Makefile.am
+@@ -9,6 +9,7 @@ common_nodist = anacron-paths.h
+ nodist_anacron_SOURCES = $(common_nodist)
+ BUILT_SOURCES = $(common_nodist)
+ 
++AM_CFLAGS = -I$(top_srcdir)
+ 
+ LDADD = $(LIBSELINUX) $(LIBPAM) $(LIBAUDIT)
+ 
+Index: cronie-1.4.11/src/Makefile.am
+===================================================================
+--- cronie-1.4.11.orig/src/Makefile.am
++++ cronie-1.4.11/src/Makefile.am
+@@ -15,6 +15,7 @@ nodist_crond_SOURCES = $(common_nodist)
+ nodist_crontab_SOURCES = $(common_nodist)
+ BUILT_SOURCES = $(common_nodist)
+ 
++AM_CFLAGS = -I$(top_srcdir)
+ 
+ LDADD = $(LIBSELINUX) $(LIBPAM) $(LIBAUDIT)
+ 
diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes-extended/cronie/cronie_1.4.11.bb
index 5b12448..aa1ba39 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.11.bb
@@ -19,6 +19,7 @@ RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '',
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
+           file://fix-out-of-tree-build.patch \
            file://crond.init \
            file://crontab \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
-- 
1.8.1.4


