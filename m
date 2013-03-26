Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UKVPk-0002Vu-HN
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 16:04:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2QEkmrN005924
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Mar 2013 07:46:48 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 07:46:48 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Mar 2013 07:46:34 -0700
Message-ID: <80f242ef3516ce540a614dcb8ba3f6880cff19f2.1364308617.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364308617.git.bruce.ashfield@windriver.com>
References: <cover.1364308617.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/3.8: introduce v3.8.4-rt1
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
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
Content-Type: text/plain

The -rt series has been updated for the 3.8 kernel. Updating the
SRCREVs to reflet its import into the tree.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
new file mode 100644
index 0000000..97178c7
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -0,0 +1,29 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH = "standard/preempt-rt/base"
+KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
+
+LINUX_VERSION ?= "3.8.4"
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+KMETA = "meta"
+
+SRCREV_machine ?= "e9b9f72029522ef142ab181e9f7f3ae71535181a"
+SRCREV_machine_qemuppc ?= "7443096f0bdc6522053decd10430fc96a0ef9b94"
+SRCREV_meta ?= "2a6d36e75ca0a121570a389d7bab76ec240cbfda"
+
+PR = "${INC_PR}.0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+# Omit broken machines from COMPATIBLE_MACHINE
+#   qemuppc hangs at boot
+#   qemumips panics at boot
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append_qemux86=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.7.10.4



