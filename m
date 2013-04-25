Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVLVZ-0002d0-0q
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:42:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Apr 2013 05:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="292207791"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 25 Apr 2013 05:24:04 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:23:57 +0300
Message-Id: <dccffc726b66602d91dbd264542fda8b863b06d6.1366892003.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366892003.git.laurentiu.palcu@intel.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366892003.git.laurentiu.palcu@intel.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/4] qemuwrapper: use fallback in case the ELF binary is wrong
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
X-List-Received-Date: Thu, 25 Apr 2013 12:43:16 -0000

This wrapper script is called mainly from intercept hooks and allarch
packages postinstalls. When multilib is used, the qemuwrapper script
points to the binary that matches the MACHINE architecture.

For example: if MACHINE=qemux86_64 and we activate multilib, then the
postinstalls for lib32 packages would call qemu-x86_64 with 32 bit
binaries and they would certainly fail.

This patch adds just a fallback method if the exit code of the previous
qemu call corresponds to "Invalid ELF image for this architecture"
error. This will allow us to have all postinstalls run on host.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   28 +++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 41617a6..18f1892 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -9,7 +9,33 @@ do_install () {
 	install -d ${D}${bindir_crossscripts}/
 
 	echo "#!/bin/sh" > ${D}${bindir_crossscripts}/qemuwrapper
-	echo exec env ${@qemu_target_binary(d)} \"\$@\" >> ${D}${bindir_crossscripts}/qemuwrapper
+	qemu_binary=${@qemu_target_binary(d)}
+	echo "$qemu_binary \"\$@\"" >> ${D}${bindir_crossscripts}/qemuwrapper
+	fallback_qemu_bin=
+	case $qemu_binary in
+		"qemu-i386")
+			fallback_qemu_bin=qemu-x86_64
+			;;
+		"qemu-x86_64")
+			fallback_qemu_bin=qemu-i386
+			;;
+		*)
+			;;
+	esac
+
+	if [ -n "$fallback_qemu_bin" ]; then
+
+		cat >> ${D}${bindir_crossscripts}/qemuwrapper << EOF
+rc=\$?
+if [ \$rc = 255 ]; then
+	$fallback_qemu_bin "\$@"
+	rc=\$?
+fi
+exit \$rc
+EOF
+
+	fi
+
 	chmod +x ${D}${bindir_crossscripts}/qemuwrapper
 }
 
-- 
1.7.9.5



