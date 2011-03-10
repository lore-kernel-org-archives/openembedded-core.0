Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pxj6X-0004Bm-Uk
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2011 17:52:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Mar 2011 08:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,297,1297065600"; d="scan'208";a="400701618"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by azsmga001.ch.intel.com with ESMTP; 10 Mar 2011 08:51:01 -0800
Message-Id: <e1692bf2937813717780e2c58a0fb803bb190fa3.1299775598.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299775598.git.sgw@linux.intel.com>
References: <cover.1299775598.git.sgw@linux.intel.com>
Old-Date: Wed, 9 Mar 2011 18:28:22 +0800
Date: Thu, 10 Mar 2011  8:50:56 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Liping Ke <liping.ke@intel.com>
Subject: [PATCH 1/8] oprofileui: upgrade to the latest version maintained by the Yocto project
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
X-List-Received-Date: Thu, 10 Mar 2011 16:52:50 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Oprofileui at http://labs.o-hand.com/oprofileui/ is not maintained now, so
we should change SRC_URI to the one maintained by the Yocto project. This
one includes new bugfixes.

This fixes [YOCTO #820]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 meta/recipes-kernel/oprofile/oprofileui-git.inc    |   10 ++++++++++
 meta/recipes-kernel/oprofile/oprofileui-svn.inc    |    9 ---------
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 ++
 meta/recipes-kernel/oprofile/oprofileui_svn.bb     |    2 --
 5 files changed, 13 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui-git.inc
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui-svn.inc
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui_git.bb
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui_svn.bb

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index 36202a1..aee1749 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -146,7 +146,7 @@ SRCREV_pn-opkg-nogpg-native ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-nogpg-nativesdk ??= "${OPKGSRCREV}"
 SRCREV_pn-opkg-utils-native ??= "4747"
 SRCREV_pn-opkg-utils ??= "4747"
-SRCREV_pn-oprofileui ??= "197"
+SRCREV_pn-oprofileui ??= "e2d998d8a55dc1e49d1588841f83eff8e6809753"
 SRCREV_pn-tcf-agent ??= "1078"
 SRCREV_pn-osc-native ??= "9096"
 SRCREV_pn-owl-video ??= "394"
diff --git a/meta/recipes-kernel/oprofile/oprofileui-git.inc b/meta/recipes-kernel/oprofile/oprofileui-git.inc
new file mode 100644
index 0000000..b4a573b
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofileui-git.inc
@@ -0,0 +1,10 @@
+require oprofileui.inc
+
+PV = "0.0+git${SRCPV}"
+PR = "r2"
+
+S = "${WORKDIR}/git"
+
+# Oprofileui at http://labs.o-hand.com/oprofileui/ is not maintained now.
+SRC_URI = "git://git.pokylinux.org/oprofileui;protocol=git \
+           file://dso_linking_change_build_fix.patch "
diff --git a/meta/recipes-kernel/oprofile/oprofileui-svn.inc b/meta/recipes-kernel/oprofile/oprofileui-svn.inc
deleted file mode 100644
index 5d40914..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui-svn.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-require oprofileui.inc
-
-PV = "0.0+svnr${SRCPV}"
-PR = "r1"
-
-S = "${WORKDIR}/trunk"
-
-SRC_URI = "svn://svn.o-hand.com/repos/oprofileui;module=trunk;proto=http \
-           file://dso_linking_change_build_fix.patch "
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
new file mode 100644
index 0000000..705f4e1
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -0,0 +1,2 @@
+require oprofileui-git.inc
+
diff --git a/meta/recipes-kernel/oprofile/oprofileui_svn.bb b/meta/recipes-kernel/oprofile/oprofileui_svn.bb
deleted file mode 100644
index 39e10b4..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui_svn.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require oprofileui-svn.inc
-
-- 
1.7.1.1



