Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UQ38F-0004im-Gx
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 00:04:45 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3ALlJ1C012987
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 16:47:20 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALlJ2D009654
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:17:19 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Apr 2013 03:17:19 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALlF4r005792;
	Thu, 11 Apr 2013 03:17:18 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2013 16:47:14 -0500
Message-ID: <1365630434-7008-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365630434-7008-1-git-send-email-Chase.Maupin@ti.com>
References: <1365630434-7008-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] kernel: Add KERNEL_LOCALVERSION to control version string
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
X-List-Received-Date: Wed, 10 Apr 2013 22:04:55 -0000
Content-Type: text/plain

* Add a variable called KERNEL_LOCALVERSION which when set will
  place a version string in the .scmversion file of the kernel
  sources.  This string will be picked up by the kernel Makefile
  and will be appended to the kernel version.  This is done to
  make it easier to identify what revision of the kernel sources
  are being run.  For example you can use a setting like the
  following to add the short commit id to the kernel version
  string:

KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/classes/kernel.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index af58887..9757465 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -48,6 +48,9 @@ export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE",1) or "ttyS0"}"
 
 KERNEL_VERSION = "${@get_kernelversion('${B}')}"
 
+# Setting KERNEL_LOCALVERSION will place a string in the .scmversion file
+# of the kernel tree.  This string will be picked up by the build system
+# of the kernel and appended to the kernel version.
 KERNEL_LOCALVERSION ?= ""
 
 # kernels are generally machine specific
@@ -210,7 +213,8 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion ${S}/.scmversion
+	echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+	echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
 
 	# Copy defconfig to .config if .config does not exist. This allows
 	# recipes to manage the .config themselves in do_configure_prepend().
-- 
1.7.0.4



