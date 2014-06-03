Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 89D6365F11
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 13:41:26 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jun 2014 06:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,965,1392192000"; d="scan'208";a="440291654"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 03 Jun 2014 06:41:16 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jun 2014 16:44:50 +0300
Message-Id: <f62ff18463dc8745512d04d1360c7a5ab7d0a931.1401803047.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1401803047.git.cristian.iorga@intel.com>
References: <cover.1401803047.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1401803047.git.cristian.iorga@intel.com>
References: <cover.1401803047.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] neard: fix for parallel build
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
X-List-Received-Date: Tue, 03 Jun 2014 13:41:33 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

for neard tools/snep-send object might cause a
parallel build failure,due to undetected
dependency on dbus.h header file.

Patch will be submitted upstream.

Fixes [YOCTO #6389].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/neard/neard/parallelmake.patch | 16 ++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.14.bb            |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/parallelmake.patch

diff --git a/meta/recipes-connectivity/neard/neard/parallelmake.patch b/meta/recipes-connectivity/neard/neard/parallelmake.patch
new file mode 100644
index 0000000..0eda4b2
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/parallelmake.patch
@@ -0,0 +1,16 @@
+Index: neard-0.14/Makefile.am
+
+Upstream-Status: Pending
+
+===================================================================
+--- neard-0.14.orig/Makefile.am
++++ neard-0.14/Makefile.am
+@@ -99,6 +99,8 @@ tools_snep_send_SOURCES = $(gdbus_source
+ 					src/agent.c
+ tools_snep_send_LDADD = @GLIB_LIBS@ @DBUS_LIBS@
+ 
++tools/snep-send.$(OBJEXT): include/near/dbus.h
++
+ tools_nfctool_nfctool_SOURCES = tools/nfctool/main.c \
+ 					tools/nfctool/nfctool.h \
+ 					tools/nfctool/adapter.h \
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb b/meta/recipes-connectivity/neard/neard_0.14.bb
index ac9aaf1..e875729 100644
--- a/meta/recipes-connectivity/neard/neard_0.14.bb
+++ b/meta/recipes-connectivity/neard/neard_0.14.bb
@@ -1,6 +1,7 @@
 require neard.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
+           file://parallelmake.patch \
            file://neard.in \
            file://neard.service.in \
           "
-- 
1.9.1


