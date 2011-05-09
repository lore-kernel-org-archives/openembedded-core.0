Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QJVIG-0003ca-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:34:56 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p49IW3FF027948;
	Mon, 9 May 2011 11:32:07 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  9 May 2011 14:34:05 -0400
Message-Id: <0cdc29c1cc8b21919c4bab1661f6603e8935b2ef.1304965560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1304965560.git.bruce.ashfield@windriver.com>
References: <cover.1304965560.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1304965560.git.bruce.ashfield@windriver.com>
References: <cover.1304965560.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, dvhart@linux.intel.com,
	openembedded-core@lists.openembedded.org, poky@yoctoproject.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: move non-core machines to meta-yocto
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
X-List-Received-Date: Mon, 09 May 2011 18:34:56 -0000

The non-qemu compatibility references have been removed from
the main linux-yocto recipe. This change restores them in the
meta-yocto layer.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Acked-by: Darren Hart <dvhart@linux.intel.com>
---
 meta-yocto/conf/layer.conf                         |    3 ++-
 .../linux/linux-yocto-stable_git.bbappend          |   12 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_git.bbappend  |   12 ++++++++++++
 3 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
 create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend

diff --git a/meta-yocto/conf/layer.conf b/meta-yocto/conf/layer.conf
index f11d8ed..68786b2 100644
--- a/meta-yocto/conf/layer.conf
+++ b/meta-yocto/conf/layer.conf
@@ -2,7 +2,8 @@
 BBPATH := "${BBPATH}:${LAYERDIR}"
 
 # We have a packages directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
+BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "yocto"
 BBFILE_PATTERN_yocto := "^${LAYERDIR}/"
diff --git a/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend b/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
new file mode 100644
index 0000000..ea0287d
--- /dev/null
+++ b/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
@@ -0,0 +1,12 @@
+KMACHINE_atom-pc  = "atom-pc"
+KMACHINE_routerstationpro = "routerstationpro"
+KMACHINE_mpc8315e-rdb = "fsl-mpc8315e-rdb"
+KMACHINE_beagleboard = "beagleboard"
+
+SRCREV_machine_atom-pc = "72ca49ab08b8eb475cec82a10049503602325791"
+SRCREV_machine_routerstationpro = "49745cd45c92a89e70c6e2334caa80818c134562"
+SRCREV_machine_mpc8315e-rdb = "a1c0ed6bf4060c10874b2a8547d81b3169dcf16a"
+SRCREV_machine_beagleboard = "ef7f944e773950d4016b7643f9ecf052bbe250cd"
+
+COMPATIBLE_MACHINE += "(atom-pc|routerstationpro|mpc8315e-rdb|beagleboard)"
+
diff --git a/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend b/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
new file mode 100644
index 0000000..e4aa7fd
--- /dev/null
+++ b/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
@@ -0,0 +1,12 @@
+KMACHINE_atom-pc  = "yocto/standard/common-pc/atom-pc"
+KMACHINE_routerstationpro = "yocto/standard/routerstationpro"
+KMACHINE_mpc8315e-rdb = "yocto/standard/fsl-mpc8315e-rdb"
+KMACHINE_beagleboard = "yocto/standard/beagleboard"
+
+SRCREV_machine_emenlow = "c3bbcb676f929c4fc0511a6e66494b8770d015a1"
+SRCREV_machine_atom-pc = "b906f358fd404a1e74a961f25079274e0d933ee1"
+SRCREV_machine_routerstationpro = "95ca94d2e71ca2db6822a37a7f575fa79c3d05d0"
+SRCREV_machine_mpc8315e-rdb = "53c800c244e73d81d2832f6da306eeae3b09e5dc"
+SRCREV_machine_beagleboard = "b906f358fd404a1e74a961f25079274e0d933ee1"
+
+COMPATIBLE_MACHINE = "(mpc8315e-rdb|routerstationpro|beagleboard)"
-- 
1.7.0.4



