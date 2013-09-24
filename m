Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4D65B610FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 14:45:17 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2013 07:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,970,1371106800"; d="scan'208";a="298757483"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.44])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2013 07:45:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 07:45:16 -0700
Message-Id: <1380033916-31464-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1380033916-31464-1-git-send-email-sgw@linux.intel.com>
References: <1380033916-31464-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] base-passwd: add shutdown group
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
X-List-Received-Date: Tue, 24 Sep 2013 14:45:17 -0000

Since using useradd in sysvinit causes core-image-minimal to
gain shadow utilites instead of using busybox, we add the
shutdown group directly.

[YOCTO #5230]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../base-passwd/base-passwd-3.5.26/add_shutdown.patch | 19 +++++++++++++++++++
 meta/recipes-core/base-passwd/base-passwd_3.5.26.bb   |  4 +++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.26/add_shutdown.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.26/add_shutdown.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.26/add_shutdown.patch
new file mode 100644
index 0000000..eb75559
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd-3.5.26/add_shutdown.patch
@@ -0,0 +1,19 @@
+
+We need to have a shutdown group to allow the shutdown icon
+to work correctly. Any users that want to use shutdown like
+the xuser should be added to this group.
+
+Upstream-Status: Inapporpriate [Embedded]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Index: base-passwd-3.5.26/group.master
+===================================================================
+--- base-passwd-3.5.26.orig/group.master
++++ base-passwd-3.5.26/group.master
+@@ -36,5 +36,6 @@ sasl:*:45:
+ plugdev:*:46:
+ staff:*:50:
+ games:*:60:
++shutdown:*:70:
+ users:*:100:
+ nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
index 1c7e6b0..2181ac7 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
            file://nobash.patch \
-           file://input.patch"
+           file://input.patch \
+           file://add_shutdown.patch \
+          "
 
 SRC_URI[md5sum] = "74245e5c21dc74d9675c77cd8dfa02e6"
 SRC_URI[sha256sum] = "258a78317aa563143d10375c6e1e63a60898e503887f00fffd70b6b297c1b429"
-- 
1.8.3.1


