Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 94E40771BE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 18:51:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jun 2016 11:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,402,1459839600"; d="scan'208";a="989084326"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 01 Jun 2016 11:51:44 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 10:46:41 +0000
Message-Id: <6323e48633880ae621e1a350d5115e2c37ce9631.1464768925.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464768925.git.mariano.lopez@linux.intel.com>
References: <cover.1464768925.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464768925.git.mariano.lopez@linux.intel.com>
References: <cover.1464768925.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/5] testimage.bbclass: Make dependency of cpio when using RPMs
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
X-List-Received-Date: Wed, 01 Jun 2016 18:51:42 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Exctraction of RPMs needs cpio, not all distros include cpio by
default, so we need to build it.

[YOCTO #8694]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass | 1 +
 meta/classes/testimage.bbclass  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index f613149d..a3c6a35 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -24,6 +24,7 @@ TEST_TARGET_IP ?= ""
 TEST_SERVER_IP ?= ""
 
 TEST_EXPORT_DEPENDS = ""
+TEST_EXPORT_DEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TEST_EXPORT_LOCK = "${TMPDIR}/testimage.lock"
 
 python do_testexport() {
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index a70d3a8..7fd0f62 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -68,6 +68,8 @@ TEST_TARGET ?= "qemu"
 
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
-- 
2.6.6


