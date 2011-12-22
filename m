Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RdsXm-0006g6-G6
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 00:59:26 +0100
Received: from mizar.localdomain (79.30.254.40) by smtp209.alice.it
	(8.6.023.02) id 4EF08A630059B8AE; Fri, 23 Dec 2011 00:46:21 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 00:46:12 +0100
Message-Id: <1324597572-10548-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] kernel.bbclass: fix pkg_postinst and pkg_postrm
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
X-List-Received-Date: Thu, 22 Dec 2011 23:59:26 -0000

* Symptom: kernel symlink in /boot is not created.
* Rename in order to create the expected files:
* /var/lib/opkg/info/kernel-3.1.4.postinst
* /var/lib/opkg/info/kernel-3.1.4.postrm

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 120a524..ec5d65e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -223,11 +223,11 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
-pkg_postinst_kernel () {
+pkg_postinst_kernel-base () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 }
 
-pkg_postrm_kernel () {
+pkg_postrm_kernel-base () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
 
-- 
1.7.3.4



