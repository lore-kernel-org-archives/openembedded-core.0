Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7O-0005xk-SP
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167885"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:11 -0700
Message-Id: <0aeb24aef8ddd98e001c6b663dee5afe427eec48.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/43] kbd: Use update-alternatives
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:36 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Change to use ALTERNATIVE_LINKS from update-alternatives.  This ensures
the links are created consistently and the package provides are
correct.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |   34 +++++++---------------------------
 1 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index eea04a0..99a6a50 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -10,7 +10,7 @@ RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
@@ -23,29 +23,9 @@ FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-keymaps = "${datadir}/keymaps"
 FILES_${PN}-unimaps = "${datadir}/unimaps"
 
-ALTERNATIVE_NAMES_USRBIN = "chvt deallocvt fgconsole openvt"
-
-do_install_append() {
-  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
-  for p in $usrbinprogs_a; do
-    if [ -f "${D}${bindir}/$p" ]; then
-      mv "${D}${bindir}/$p" "${D}${bindir}/$p.${PN}"
-    fi
-  done
-}
-
-pkg_postinst_${PN} () {
-  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
-  for p in $usrbinprogs_a; do
-    if [ -f "$D${bindir}/$p" ]; then
-      update-alternatives --install ${bindir}/$p $p $p.${PN} 100
-    fi
-  done
-}
-
-pkg_postrm_${PN} () {
-  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
-  for p in $usrbinprogs_a; do
-    update-alternatives --remove $p $p.${PN}
-  done
-}
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+bindir_progs = "chvt deallocvt fgconsole openvt"
+ALTERNATIVE_LINKS = "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
-- 
1.7.7.6



