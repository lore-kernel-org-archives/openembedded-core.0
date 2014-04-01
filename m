Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C7D286E7CC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:00:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Apr 2014 03:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,771,1389772800"; d="scan'208";a="511734165"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2014 03:00:09 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id B7F3D6A4083;
	Tue,  1 Apr 2014 02:59:53 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Apr 2014 13:00:30 +0300
Message-Id: <1396346430-12927-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] qemux86-64: re-enable paravirt guest, bring it in sync with qemux86
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
X-List-Received-Date: Tue, 01 Apr 2014 10:00:36 -0000

Seems wrong that qemux86 has this enabled and qemux86-64 doesn't.
Also this will allow people to use kvm with -cpu=host.
Right now, runqemu qemux86-64 kvm uses -cpu=kvm64 because without this
feature you can't use cpu=host on newer host kernels (>= 3.8).

This basically reverts poky e6149ec6c4c14d3a939022cdc29ac94dced836dd /
oe-core 64749308fadabb4aa7c39f360c6395827bc5eb3a
The reason of that commit (which is more than a year old) was that on
the AB running old kernels (2.6.37) we would see occasional shutdown failures.
(but if memory serves me right the fix might have been just a coincidence).

I've tested this change with by:
  - run tests on runqemu qemux86-64 (without kvm) (300 seconds)
  - run tests on runqemu qemux86-64 kvm (which uses by default cpu=kvm64) - (tests
took 20 seconds)
  - run tests on runqemu qemux86-64 kvm with cpu=host - (tests took 18 seconds)

[ YOCTO #5956 ]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index d5202cd..46c4260 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -33,5 +33,5 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.9.0


