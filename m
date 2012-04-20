Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7M-0005xk-2E
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167879"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:10 -0700
Message-Id: <0451a720b6cf842e6ce564dc9bb6037d6982e83e.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/43] module-init-tools: Update to use update-alternatives class
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:32 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Use the update-alternatives class and MANUAL_ALTERNATIVE_LINKs to ensure
that the produced packages specify the correct package provides.

Also change references from "bin" and "sbin" to base_bindir and base_sbindir.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../module-init-tools/module-init-tools_3.16.bb    |   35 ++++++++++++--------
 1 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb b/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
index 0248b46..cb6f425 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
@@ -1,41 +1,48 @@
 require module-init-tools.inc
-PR = "r0"
+PR = "r1"
 
 # autotools set prefix to /usr, however we want them in /bin and /sbin
-bindir = "/bin"
-sbindir = "/sbin"
+bindir = "${base_bindir}"
+sbindir = "${base_sbindir}"
 
-do_install() {
-	autotools_do_install
-	for f in bin/lsmod sbin/insmod sbin/rmmod sbin/modprobe sbin/modinfo sbin/depmod; do
+inherit update-alternatives
+MANUAL_ALTERNATIVE_LINKS  = "${base_bindir}/lsmod:${base_bindir}/lsmod.26"
+MANUAL_ALTERNATIVE_LINKS += "${base_sbindir}/insmod:${base_sbindir}/insmod.26"
+MANUAL_ALTERNATIVE_LINKS += "${base_sbindir}/rmmod:${base_sbindir}/rmmod.26"
+MANUAL_ALTERNATIVE_LINKS += "${base_sbindir}/modprobe:${base_sbindir}/modprobe.26"
+MANUAL_ALTERNATIVE_LINKS += "${base_sbindir}/modinfo:${base_sbindir}/modinfo.26"
+MANUAL_ALTERNATIVE_LINKS += "${base_sbindir}/depmod:${base_sbindir}/depmod.26"
+
+do_install_append() {
+	for f in ${base_bindir}/lsmod ${base_sbindir}/insmod ${base_sbindir}/rmmod ${base_sbindir}/modprobe ${base_sbindir}/modinfo ${base_sbindir}/depmod; do
 		mv ${D}/$f ${D}/$f.26
 	done
 }
 
 pkg_postinst_module-init-tools() {
-	for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
+	for f in ${base_sbindir}/insmod ${base_sbindir}/modprobe ${base_sbindir}/rmmod ${base_sbindir}/modinfo; do
 		bn=`basename $f`
 		update-alternatives --install /$f $bn /$f.26 60
 	done
-	update-alternatives --install /bin/lsmod bin-lsmod /bin/lsmod.26 60
-	update-alternatives --install /sbin/lsmod lsmod /bin/lsmod.26 60
+	update-alternatives --install ${base_bindir}/lsmod bin-lsmod ${base_bindir}/lsmod.26 60
+	update-alternatives --install ${base_sbindir}lsmod lsmod ${base_bindir}/lsmod.26 60
 }
 
 pkg_prerm_module-init-tools() {
-	for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
+	for f in ${base_sbindir}/insmod ${base_sbindir}/modprobe ${base_sbindir}/rmmod ${base_sbindir}/modinfo; do
 		bn=`basename $f`
 		update-alternatives --remove $bn /$f.26
 	done
-	update-alternatives --remove bin-lsmod /bin/lsmod.26
-	update-alternatives --remove lsmod /bin/lsmod.26
+	update-alternatives --remove bin-lsmod ${base_bindir}/lsmod.26
+	update-alternatives --remove lsmod ${base_bindir}/lsmod.26
 }
 
 pkg_postinst_module-init-tools-depmod() {
-	update-alternatives --install /sbin/depmod depmod /sbin/depmod.26 60
+	update-alternatives --install ${base_sbindir}depmod depmod ${base_sbindir}depmod.26 60
 }
 
 pkg_prerm_module-init-tools-depmod() {
-	update-alternatives --remove depmod /sbin/depmod.26
+	update-alternatives --remove depmod ${base_sbindir}depmod.26
 }
 
 SRC_URI[md5sum] = "bc44832c6e41707b8447e2847d2019f5"
-- 
1.7.7.6



