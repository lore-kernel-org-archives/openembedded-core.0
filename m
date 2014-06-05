Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 444DB6B7F9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 15:25:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jun 2014 08:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,981,1392192000"; d="scan'208";a="552137702"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 05 Jun 2014 08:25:08 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 18:28:41 +0300
Message-Id: <a264b6b001d534658fd5ae8451b755e3092df6a7.1401981928.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1401981928.git.cristian.iorga@intel.com>
References: <cover.1401981928.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1401981928.git.cristian.iorga@intel.com>
References: <cover.1401981928.git.cristian.iorga@intel.com>
Subject: [PATCH v2 1/1] neard: fix for parallel build
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
X-List-Received-Date: Thu, 05 Jun 2014 15:25:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

for neard tools/snep-send object might cause a
parallel build failure,due to undetected
dependency on dbus.h header file.

Patch will be submitted upstream.

Fixes [YOCTO #6389].

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../neard/neard/Fix-snep-send-parallel-build.patch | 31 ++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.14.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch

diff --git a/meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch b/meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch
new file mode 100644
index 0000000..f302992
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch
@@ -0,0 +1,31 @@
+From fbbf600df474865172b47212d94e3dc5013cc2df Mon Sep 17 00:00:00 2001
+From: Cristian Iorga <cristian.iorga@intel.com>
+Date: Wed, 4 Jun 2014 16:40:18 +0300
+Subject: [PATCH] tools: Fix snep-send parallel build
+
+tools/snep-send object might cause a
+parallel build failure,due to undetected
+dependency on dbus.h header file.
+
+Upstream-Status: Pending
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+---
+ Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 26f49e7..0e4a5b5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -169,6 +169,8 @@ tools_snep_send_SOURCES = $(gdbus_sources) src/log.c src/dbus.c \
+ 					src/agent.c
+ tools_snep_send_LDADD = ${GLIB_LIBS} ${DBUS_LIBS}
+ 
++tools/snep-send.$(OBJEXT): include/near/dbus.h
++
+ tools_nfctool_nfctool_SOURCES = tools/nfctool/main.c \
+ 					tools/nfctool/nfctool.h \
+ 					tools/nfctool/adapter.h \
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb b/meta/recipes-connectivity/neard/neard_0.14.bb
index ac9aaf1..663d7ea 100644
--- a/meta/recipes-connectivity/neard/neard_0.14.bb
+++ b/meta/recipes-connectivity/neard/neard_0.14.bb
@@ -1,6 +1,7 @@
 require neard.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
+           file://Fix-snep-send-parallel-build.patch \
            file://neard.in \
            file://neard.service.in \
           "
-- 
1.9.1


