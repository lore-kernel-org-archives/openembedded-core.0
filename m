Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TFuDw-0008Db-Eo
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 00:00:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TFu1b-0003sO-P9
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 23:47:39 +0200
Message-ID: <1348436710.4444.247.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Sun, 23 Sep 2012 22:45:10 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] kernel.bbclass: Allow modules.tar.gz generation to be inhibited
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
X-List-Received-Date: Sun, 23 Sep 2012 22:00:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The modules.tar.gz archive is sometimes of no value and it can take
a noticeable time to build if many modules were enabled in the kernel
configuration.  The extraneous file also contributes to deploy/ clutter
and is a waste of disk space.

Allow it to be suppressed by setting KERNEL_DEPLOY_MODULE_TARBALL=0.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/kernel.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fdef1be..2896d28 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -520,9 +520,11 @@ do_uboot_mkimage() {
 
 addtask uboot_mkimage before do_install after do_compile
 
+KERNEL_DEPLOY_MODULE_TARBALL ?= "1"
+
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+	if [ ${KERNEL_DEPLOY_MODULE_TARBALL} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
 	fi
 
-- 
1.7.9





