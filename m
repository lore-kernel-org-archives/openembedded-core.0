Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4491F71E68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:38:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1KIc8Zb006326
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Feb 2015 10:38:08 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 20 Feb 2015 10:38:07 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 20 Feb 2015 13:38:02 -0500
Message-ID: <5dc831979e4da0ddc646647fa8ceac4484351f3c.1424456540.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424456540.git.bruce.ashfield@windriver.com>
References: <cover.1424456540.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto: introduce 3.19 versioned recipes
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
X-List-Received-Date: Fri, 20 Feb 2015 18:38:08 -0000
Content-Type: text/plain

Introducing the v3.19.x recipes for the validated linux-yocto kernel.

Build, boot and sanity testing was performed on qemu for all major
architectures.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 21 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 39 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.19.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
new file mode 100644
index 000000000000..dba163e006d3
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -0,0 +1,21 @@
+KBRANCH ?= "standard/tiny/base"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "3.19"
+
+KMETA = "meta"
+
+SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
+SRCREV_meta ?= "8897ef68b30e7426bc1d39895e71fb155d694974"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
new file mode 100644
index 000000000000..044ee7f524ca
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -0,0 +1,39 @@
+KBRANCH ?= "standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "standard/qemuarm64"
+KBRANCH_qemumips ?= "standard/mti-malta32"
+KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemux86  ?= "standard/common-pc"
+KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
+KBRANCH_qemumips64 ?= "standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "91b64df8cdcdacb9ef8d707a0c34f55a09bf170d"
+SRCREV_machine_qemuarm64 ?= "43b9eced9ba8a57add36af07736344dcc383f711"
+SRCREV_machine_qemumips ?= "7c67469a4c77a977c46f218de7e2f4699292d28b"
+SRCREV_machine_qemuppc ?= "7dc29d4265b44ad28ea3ec950b1a86be08933ce8"
+SRCREV_machine_qemux86 ?= "43b9eced9ba8a57add36af07736344dcc383f711"
+SRCREV_machine_qemux86-64 ?= "43b9eced9ba8a57add36af07736344dcc383f711"
+SRCREV_machine_qemumips64 ?= "b7ab9d4bac55415f125c81f529dbbefb07de98ad"
+SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
+SRCREV_meta ?= "8897ef68b30e7426bc1d39895e71fb155d694974"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+
+LINUX_VERSION ?= "3.19"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "meta"
+
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.1.0


