Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U2l8G-00044R-QL
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:12:31 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r15FuZtK028089;
	Tue, 5 Feb 2013 07:56:36 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  5 Feb 2013 10:56:33 -0500
Message-Id: <7a5a53edd44aa13408a5f2e09fb2ab2c657a4f91.1360079063.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079063.git.bruce.ashfield@windriver.com>
References: <cover.1360079063.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1360079063.git.bruce.ashfield@windriver.com>
References: <cover.1360079063.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/dev: linux-yocto development tree tracking recipe
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
X-List-Received-Date: Tue, 05 Feb 2013 16:12:34 -0000

The linux-yocto-dev recipe uses the upstream tracking linux-yocto-dev repository.
Since this tree is frequently updated, and periodically rebuilt, AUTOREV is used
to track its contents.

This recipe is just like other linux-yocto variants, with the only difference
being that to avoid network access during initial parsing, static SRCREVs are
provided and overridden if the preferred kernel provider is linux-yocto-dev.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb |   48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-dev.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
new file mode 100644
index 0000000..fdea085
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -0,0 +1,48 @@
+# This recipe tracks the linux-yocto-dev repository as its upstream source.
+# Since this tree is frequently updated, and periodically rebuilt, AUTOREV is
+# used to track its contents.
+#
+# This recipe is just like other linux-yocto variants, with the only difference
+# being that to avoid network access during initial parsing, static SRCREVs are
+# provided and overridden if the preferred kernel provider is linux-yocto-dev.
+#
+# To enable this recipe, set PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
+
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH = "standard/base"
+KBRANCH_DEFAULT = "${KBRANCH}"
+KMETA = "meta"
+
+SRC_URI = "git://git.pokylinux.org/linux-yocto-dev.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+
+# Set default SRCREVs. Both the machine and meta SRCREVs are statically set
+# to the korg v3.7 tag, and hence prevent network access during parsing. If
+# linux-yocto-dev is the preferred provider, they will be overridden to
+# AUTOREV in following anonymous python routine and resolved when the
+# variables are finalized.
+SRCREV_machine="29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
+SRCREV_meta="29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
+
+python () {
+    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
+        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
+    else:
+        d.setVar("SRCREV_machine", "${AUTOREV}")
+        d.setVar("SRCREV_meta", "${AUTOREV}")
+}
+
+LINUX_VERSION ?= "3.8+"
+LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+
+# Functionality flags
+KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.7.10.4



