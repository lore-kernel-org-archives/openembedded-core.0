Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJvEh-0000RD-A3
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 01:21:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GNC5ag000673
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:12:05 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 16:12:05 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 18:16:25 -0500
Message-ID: <6fd023a6d0d72eec36e107f845c993333609938d.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 12/17] module-init-tools: Update to use update-alternatives class
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
X-List-Received-Date: Mon, 16 Apr 2012 23:21:32 -0000
Content-Type: text/plain

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
1.7.3.4



