Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTy-0000TT-0b
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56mfF025914
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:48 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:48 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:40 -0500
Message-ID: <645f62e63e6205b5307ccafbca12038af68c25ad.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361940628.git.bruce.ashfield@windriver.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto: introduce 3.8 kernel recipe
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
X-List-Received-Date: Wed, 27 Feb 2013 05:23:27 -0000
Content-Type: text/plain

Introducing the linux-yocto 3.8 kernel recipe. The tools and branch structure
of this tree are the same as the previous linux-yocto recipes, while the meta
data and content have been updated for the 3.8 kernel.

build and boot tested for qemu*.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.8.bb |   30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.8.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
new file mode 100644
index 0000000..7c1dff7
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -0,0 +1,30 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH_DEFAULT = "standard/base"
+KBRANCH = "${KBRANCH_DEFAULT}"
+
+SRCREV_machine_qemuarm ?= "351d133943b50a9dfeee07661d44254722a19f04"
+SRCREV_machine_qemumips  ?= "d529d082041142435587bd442b1235dbe1c72950"
+SRCREV_machine_qemuppc ?= "8dcd155ad408658e9180d1630da2ac7e0ee70542"
+SRCREV_machine_qemux86 ?= "b170394a475b96ecc92cbc9e4b002bed0a9f69c5"
+SRCREV_machine_qemux86-64 ?= "b170394a475b96ecc92cbc9e4b002bed0a9f69c5"
+SRCREV_machine ?= "b170394a475b96ecc92cbc9e4b002bed0a9f69c5"
+SRCREV_meta ?= "c2ed0f16fdec628242a682897d5d86df4547cf24"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+
+LINUX_VERSION ?= "3.8"
+
+PR = "${INC_PR}.0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "meta"
+
+COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
+
+# Functionality flags
+KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.7.10.4



