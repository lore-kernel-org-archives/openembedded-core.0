Received: from elite.brightsigndigital.co.uk ([81.142.160.137] helo=elite.roku)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1QwaGa-0007xm-Vn
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 15:46:45 +0200
Received: from lander.roku ([172.30.1.6]) by elite.roku with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1QwZWt-0004Bb-GT; Thu, 25 Aug 2011 13:59:31 +0100
Received: from mac by lander.roku with local (Exim 4.72)
	(envelope-from <mac@lander.roku>)
	id 1QwZWt-00018N-Eo; Thu, 25 Aug 2011 13:59:31 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2011 13:59:28 +0100
Message-Id: <1314277168-4324-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1314277168-4324-1-git-send-email-mac@mcrowe.com>
References: <1314277168-4324-1-git-send-email-mac@mcrowe.com>
Subject: [PATCH 2/2] kernel.bbclass: support kernel image type of vmlinux.gz
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
X-List-Received-Date: Thu, 25 Aug 2011 13:46:45 -0000

Add support for a gzipped vmlinux kernel by specifying:

  KERNEL_IMAGETYPE = "vmlinux.gz"

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 04e673a..15e3518 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -75,10 +75,15 @@ EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
+KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(bb.data.getVar('KERNEL_IMAGETYPE', d, 1))}"
+
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-	oe_runmake ${KERNEL_IMAGETYPE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
+		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
+	fi
 }
 
 do_compile_kernelmodules() {
-- 
1.7.2.5



