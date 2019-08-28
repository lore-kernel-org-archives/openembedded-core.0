Return-Path: <Daniel.Klauer@gin.de>
X-Greylist: delayed 1579 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Aug 2019 12:08:21 UTC
Received: from good-out-29.clustermail.de (good-out-29.clustermail.de
	[212.223.161.4])
	by mail.openembedded.org (Postfix) with ESMTP id C1E0F6BF37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:08:21 +0000 (UTC)
Received: from [10.0.0.8] (helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1i2wKr-0004Zm-5I
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Aug 2019 13:42:02 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1i2wKr-00059A-3H
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Aug 2019 13:41:57 +0200
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Wed, 28 Aug 2019 13:41:56 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2019 13:41:30 +0200
Message-ID: <20190828114131.10340-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: [PATCH 1/2] uboot-sign: Refactor do_deploy prefunc to do_deploy_prepend
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
X-List-Received-Date: Wed, 28 Aug 2019 12:08:23 -0000
Content-Type: text/plain

bitbake removes cleandirs once per prefunc and then again for the actual
task. By moving the concat_dtb step here from prefunc to main task we can
add
    do_deploy[cleandirs] = "${DEPLOYDIR}"
to deploy.bbclass without losing the files produced by concat_dtb.

It looks like using do_deploy(_append) was the original goal anyways.

I tested this with poky, putting the following in local.conf:
  UBOOT_SIGN_ENABLE = "1"
  KERNEL_CLASSES = " kernel-fitimage "
  KERNEL_IMAGETYPE = "fitImage"
and then doing
  bitbake core-image-minimal
  bitbake u-boot
It builds successfully, the kernel and uboot recipes' temp/run.do_deploy
scripts look good (kernel's do_deploy is not broken, and uboot's do_deploy
still calls concat_dtb).

Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
---
 meta/classes/uboot-sign.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 982ed46d01..713196df41 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -117,15 +117,16 @@ do_install_append() {
 	fi
 }
 
+do_deploy_prepend_pn-${UBOOT_PN}() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ]; then
+		concat_dtb
+	fi
+}
+
 python () {
     if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN') and d.getVar('UBOOT_DTB_BINARY'):
         kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
         # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
         d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel_pn)
-
-        # kernerl's do_deploy is a litle special, so we can't use
-        # do_deploy_append, otherwise it would override
-        # kernel_do_deploy.
-        d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
 }
-- 
2.17.1


