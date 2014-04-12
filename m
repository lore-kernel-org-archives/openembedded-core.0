Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3018365D9E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Apr 2014 04:10:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3C4AQLm019382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Apr 2014 21:10:27 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 11 Apr 2014 21:10:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 12 Apr 2014 00:10:11 -0400
Message-ID: <a112c85c02f161dc03bf71cdb9d2b3557999bbfd.1397275530.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397275530.git.bruce.ashfield@windriver.com>
References: <cover.1397275530.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.14: aufs, edgerouter config and -rt
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
X-List-Received-Date: Sat, 12 Apr 2014 04:10:28 -0000
Content-Type: text/plain

Updating the 3.14 SRCREVs to import the following changes:

  - enable AUFS: a missing Kbuild patch was preventing aufs from compiling
  - edgerouter: remove RTC configuration options
  - preempt-rt recipe. The patch for 3.14 is availble, so we populate the recipe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   | 27 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++-------
 3 files changed, 37 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
new file mode 100644
index 000000000000..bc447c14fcc4
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -0,0 +1,27 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH = "standard/preempt-rt/base"
+KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
+
+SRCREV_machine ?= "b5ed38affb23ff64a0382ee0dd116ffe74c4a379"
+SRCREV_machine_qemuppc ?= "79cb133d2d1b0b816cc1cd888f4ed4ef81570793"
+SRCREV_meta ?= "09424cee646626c04105f08455a58fabb27eff31"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+LINUX_VERSION ?= "3.14"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "meta"
+
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index a441a53fb95b..c4cd331ab789 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-SRCREV_meta ?= "928d7b2ddad0abc8827055c51ba34225878344a0"
+SRCREV_machine ?= "144595ef6215a0febfb8ee7d0c9e4eb2eaf93d61"
+SRCREV_meta ?= "09424cee646626c04105f08455a58fabb27eff31"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 7f0ec2b559a3..2c2cace0dd41 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c966987f88a0ee5753c3dee87e7a962d0cad5376"
-SRCREV_machine_qemumips ?= "61811c215c601ee96ccbf79333bbc73482b0f017"
-SRCREV_machine_qemuppc ?= "0d5cf5e938f4e6d3c6a398e98c8ece3ce05539f7"
-SRCREV_machine_qemux86 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-SRCREV_machine_qemux86-64 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-SRCREV_machine_qemumips64 ?= "ccb2a788551a7951563ac44a27175c6f28501008"
-SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-SRCREV_meta ?= "928d7b2ddad0abc8827055c51ba34225878344a0"
+SRCREV_machine_qemuarm ?= "d7a5330e50f78f63789b91cb9880b38633d33450"
+SRCREV_machine_qemumips ?= "38f344fcab8c0ee29f40edb92dd6612eff4579bf"
+SRCREV_machine_qemuppc ?= "b28241db34ab66f9e86718d8c94276d65d2457bb"
+SRCREV_machine_qemux86 ?= "f9048769cc178f2f64ed492a9a649827167d9a34"
+SRCREV_machine_qemux86-64 ?= "144595ef6215a0febfb8ee7d0c9e4eb2eaf93d61"
+SRCREV_machine_qemumips64 ?= "c4e08d47c5eb36ae056f2eab82a74c3638e72e06"
+SRCREV_machine ?= "144595ef6215a0febfb8ee7d0c9e4eb2eaf93d61"
+SRCREV_meta ?= "09424cee646626c04105f08455a58fabb27eff31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


