Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UQHnp-0005ZV-Vc
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:44:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3BDREND013670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 06:27:14 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 06:27:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 06:27:06 -0700
Message-ID: <c718de6273813bf98221f1060b5b2a75c62f4f3d.1365686481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365686481.git.bruce.ashfield@windriver.com>
References: <cover.1365686481.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] linux-yocto/3.8: qemumips boot fixes and netfilter kernel features
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 13:44:57 -0000
X-List-Received-Date: Thu, 11 Apr 2013 13:44:57 -0000
X-List-Received-Date: Thu, 11 Apr 2013 13:44:57 -0000
Content-Type: text/plain

Updating the linux-yocto-3.8 recipes to fix two issues:

1) qemumips boot

This is fixed by:

  Revert "Input: i8042-io - fix up region handling on MIPS"

And by disabling ftrace for qemumips boards

2) netfilter options being dropped

When KERNEL_EXTRA_FEATURES was introduced, and allowed to be
inhibited, the variable was only applied to qemux86 machines. It
should be applied ot all machine types (unless inhibited), so we
restore that functionality.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    7 ++++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |    9 +++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 05d497f..3bf937f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "0f7d294a9d07713059af345188f9cd4f549b4e77"
 SRCREV_machine_qemuppc ?= "82cdb00523b3f86219706d9f12dc80ff8d1c747a"
-SRCREV_meta ?= "1b94482e3ab8f7e495ee4d6971e13cdad1990e8e"
+SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
@@ -24,6 +24,7 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append_qemux86=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index 8bd4a0e..5a33317 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.8.4"
 KMETA = "meta"
 
 SRCREV_machine ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
-SRCREV_meta ?= "1b94482e3ab8f7e495ee4d6971e13cdad1990e8e"
+SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index c861b99..c0906e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -4,12 +4,12 @@ KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
 SRCREV_machine_qemuarm ?= "ec3299eaa89a7302009e3d46c9570f633ff32e9a"
-SRCREV_machine_qemumips  ?= "e5e37d6aab5d82398f874f623ec9b37a8274f41a"
+SRCREV_machine_qemumips  ?= "0d60789d710808e38690f27216c3ab13753e1055"
 SRCREV_machine_qemuppc ?= "223428bbc1a355200bd9a8046fd272c1b9b13e67"
 SRCREV_machine_qemux86 ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
 SRCREV_machine_qemux86-64 ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
 SRCREV_machine ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
-SRCREV_meta ?= "1b94482e3ab8f7e495ee4d6971e13cdad1990e8e"
+SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
@@ -24,6 +24,7 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append_qemux86=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.7.10.4



