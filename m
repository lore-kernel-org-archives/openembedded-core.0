Received: from elite.brightsigndigital.co.uk ([81.142.160.137] helo=elite.roku)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1QwaGb-0007xs-AQ
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 15:46:45 +0200
Received: from lander.roku ([172.30.1.6]) by elite.roku with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1QwZWs-0004BX-KI; Thu, 25 Aug 2011 13:59:30 +0100
Received: from mac by lander.roku with local (Exim 4.72)
	(envelope-from <mac@lander.roku>)
	id 1QwZWs-00018K-Hl; Thu, 25 Aug 2011 13:59:30 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2011 13:59:27 +0100
Message-Id: <1314277168-4324-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/2] kernel.bbclass: Find the kernel consistently.
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

Use KERNEL_OUTPUT variable to find the generated kernel image rather than
duplicating the existing path. This also means it can be overridden simply.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a2b10f2..04e673a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -476,7 +476,7 @@ KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 
 kernel_do_deploy() {
-	install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
 	fi
-- 
1.7.2.5



