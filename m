Received: from elite.brightsigndigital.co.uk ([81.142.160.137] helo=elite.roku)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1QwsgC-0003FP-1n
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 11:26:24 +0200
Received: from lander.roku ([172.30.1.6]) by elite.roku with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1QwsbX-0005In-2p; Fri, 26 Aug 2011 10:21:35 +0100
Received: from mac by lander.roku with local (Exim 4.72)
	(envelope-from <mac@lander.roku>)
	id 1QwsbW-0004fm-Od; Fri, 26 Aug 2011 10:21:34 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 10:21:19 +0100
Message-Id: <1314350479-17930-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <20110826091738.GA7969@mcrowe.com>
References: <20110826091738.GA7969@mcrowe.com>
Subject: [PATCH v2] kernel.bbclass: Find the kernel consistently.
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
X-List-Received-Date: Fri, 26 Aug 2011 09:26:24 -0000

Use KERNEL_OUTPUT variable to find the generated kernel image rather than
duplicating the existing path. This also means it can be overridden simply.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a2b10f2..6ebc7de 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -460,9 +460,9 @@ python populate_packages_prepend () {
 # with a fixed length or there is a limit in transferring the kernel to memory
 do_sizecheck() {
 	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
-        	size=`ls -l arch/${ARCH}/boot/${KERNEL_IMAGETYPE} | awk '{ print $5}'`
+		size=`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
         	if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
-                	rm arch/${ARCH}/boot/${KERNEL_IMAGETYPE}
+			rm ${KERNEL_OUTPUT}
                 	die  "This kernel (size=$size > ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the size of the kernel by making more of it modular."
         	fi
     	fi
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



