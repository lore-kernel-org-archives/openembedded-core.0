Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id ABA0A6D2C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:05:34 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>) id 1VhJ5B-0002AY-3S
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 14:05:36 +0100
Message-ID: <1384520708.23724.12.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 13:05:08 +0000
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: The idiomatic way to reinstate the old-style initramfs
	handling
	appears to be to set: INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
	in some appropriate place. However,
	this causes INITRAMFS_TASK to end up non-empty
	even if INITRAMFS_IMAGE is blank,
	which has two undesirable consequences: [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] kernel.bbclass: Tolerate empty INITRAMFS_IMAGE when INITRAMFS_TASK is set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2013 13:05:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The idiomatic way to reinstate the old-style initramfs handling appears to be to
set:

INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"

in some appropriate place.  However, this causes INITRAMFS_TASK to end up non-empty
even if INITRAMFS_IMAGE is blank, which has two undesirable consequences:

1. The anonymous python in kernel.bbclass attempts to make the empty
string a dependency for do_configure; bitbake doesn't diagnose this
directly but it leads to subsequent build failures with slightly obscure
messages like:

Missing or unbuildable dependency chain was: [..., 'kernel-modules', '']

2. The shell code in kernel_do_compile() will set CONFIG_INITRAMFS_SOURCE to
${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio which clearly will have no useful
result if ${INITRAMFS_IMAGE} is empty.

Fix both of these by making the relevant code check for non-empty values in both
${INITRAMFS_TASK} and ${INITRAMFS_IMAGE} before attempting to use these variables.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 383043e..ef86c71 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -27,7 +27,7 @@ python __anonymous () {
     #       this INITRAMFS_TASK has circular dependency problems
     #       if the initramfs requires kernel modules
     image_task = d.getVar('INITRAMFS_TASK', True)
-    if image_task:
+    if image_task and d.getVar('INITRAMFS_IMAGE', True):
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
 }
 
@@ -163,7 +163,7 @@ kernel_do_compile() {
 	# different initramfs image.  The way to do that in the kernel
 	# is to specify:
 	# make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
-	if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
+	if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] && [ "${INITRAMFS_IMAGE}" != "" ]; then
 		# The old style way of copying an prebuilt image and building it
 		# is turned on via INTIRAMFS_TASK != ""
 		copy_initramfs
-- 
1.8.4.rc3




