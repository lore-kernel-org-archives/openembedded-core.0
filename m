Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3EEF76F190
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 20:12:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Mar 2014 12:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,569,1389772800"; d="scan'208";a="464840693"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2014 12:12:54 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 7AEDC6A4007;
	Sat,  1 Mar 2014 12:12:43 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Mar 2014 22:12:57 +0200
Message-Id: <1393704777-30901-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] testimage: add task level lock
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
X-List-Received-Date: Sat, 01 Mar 2014 20:12:54 -0000

For machines other than qemu it will not be okay to run
multiple testimage tasks in parallel.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage-auto.bbclass | 1 +
 meta/classes/testimage.bbclass      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/testimage-auto.bbclass b/meta/classes/testimage-auto.bbclass
index a5b8f7f..860599d 100644
--- a/meta/classes/testimage-auto.bbclass
+++ b/meta/classes/testimage-auto.bbclass
@@ -20,3 +20,4 @@ python do_testimage_auto() {
 }
 addtask testimage_auto before do_build after do_rootfs
 do_testimage_auto[depends] += "${TESTIMAGEDEPENDS}"
+do_testimage_auto[lockfiles] += "${TESTIMAGELOCK}"
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 48e1032..691c7f6 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -42,12 +42,16 @@ TEST_SERVER_IP ?= ""
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
 
+TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
+TESTIMAGELOCK_qemuall = ""
+
 python do_testimage() {
     testimage_main(d)
 }
 addtask testimage
 do_testimage[nostamp] = "1"
 do_testimage[depends] += "${TESTIMAGEDEPENDS}"
+do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
 
 def get_tests_list(d):
-- 
1.8.5.3


