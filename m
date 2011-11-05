Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3Z-00065F-Nw
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625132"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:50 -0700
Message-Id: <50e4a410c374a52f002fd9aa17c5ca187393d261.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/28] libnl-2.0: add patch from meta-openembedded to fix pkg-config file
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:26 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libnl/libnl-2.0/fix-pc-file.patch              |   17 +++++++++++++++++
 meta/recipes-support/libnl/libnl_2.0.bb            |    1 +
 2 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch

diff --git a/meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch b/meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
new file mode 100644
index 0000000..85afe8f
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Some packages are asking only for libnl-2.0, but expects to get also
+libnl-genl, libnl-nf libnl-route, easiest way to fix them is here.
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Index: libnl-2.0/libnl-2.0.pc.in
+===================================================================
+--- libnl-2.0.orig/libnl-2.0.pc.in
++++ libnl-2.0/libnl-2.0.pc.in
+@@ -6,5 +6,5 @@
+ Name: libnl
+ Description: Convenience library for netlink sockets
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -lnl
++Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
+ Cflags: -I${includedir}
diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-support/libnl/libnl_2.0.bb
index f783867..32705b9 100644
--- a/meta/recipes-support/libnl/libnl_2.0.bb
+++ b/meta/recipes-support/libnl/libnl_2.0.bb
@@ -11,6 +11,7 @@ PR = "r3"
 SRC_URI = "\
   http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
   file://fix-pktloc_syntax_h-race.patch \
+  file://fix-pc-file.patch \
 "
 
 SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
-- 
1.7.6.4



