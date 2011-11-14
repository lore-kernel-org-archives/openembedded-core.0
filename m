Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoG7-0002AH-VP
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:35:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055138"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:28:05 -0800
Message-Id: <230fcb126bc77e69e5f1ec1515a0c2a981b6c542.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/21] kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with busybox
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
X-List-Received-Date: Mon, 14 Nov 2011 04:35:05 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |   29 ++++++++++++++++++++++++++++-
 1 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index 2e0406b..eea04a0 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -10,7 +10,7 @@ RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
@@ -22,3 +22,30 @@ FILES_${PN}-consolefonts = "${datadir}/consolefonts"
 FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-keymaps = "${datadir}/keymaps"
 FILES_${PN}-unimaps = "${datadir}/unimaps"
+
+ALTERNATIVE_NAMES_USRBIN = "chvt deallocvt fgconsole openvt"
+
+do_install_append() {
+  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
+  for p in $usrbinprogs_a; do
+    if [ -f "${D}${bindir}/$p" ]; then
+      mv "${D}${bindir}/$p" "${D}${bindir}/$p.${PN}"
+    fi
+  done
+}
+
+pkg_postinst_${PN} () {
+  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
+  for p in $usrbinprogs_a; do
+    if [ -f "$D${bindir}/$p" ]; then
+      update-alternatives --install ${bindir}/$p $p $p.${PN} 100
+    fi
+  done
+}
+
+pkg_postrm_${PN} () {
+  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
+  for p in $usrbinprogs_a; do
+    update-alternatives --remove $p $p.${PN}
+  done
+}
-- 
1.7.6.4



