Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-33.clustermail.de (good-out-33.clustermail.de
	[212.223.166.11])
	by mail.openembedded.org (Postfix) with ESMTP id 359057F333
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:32:20 +0000 (UTC)
Received: from [10.0.0.1] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1i3MPH-0003g3-5S; Thu, 29 Aug 2019 17:32:20 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1i3MPH-0004JR-3B; Thu, 29 Aug 2019 17:32:15 +0200
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Thu, 29 Aug 2019 17:32:14 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2019 17:31:33 +0200
Message-ID: <20190829153133.29702-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8d8cedd858a086ac4ab39f59e4a7b479b2337de9.camel@linuxfoundation.org>
References: <8d8cedd858a086ac4ab39f59e4a7b479b2337de9.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: [PATCH v2 1/2] uboot-sign: Refactor do_deploy prefunc to do_deploy_prepend
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
X-List-Received-Date: Thu, 29 Aug 2019 15:32:20 -0000
Content-Type: text/plain

When inherited by the u-boot recipe (UBOOT_PN), uboot-sign.bbclass adds
a concat_dtb step, which places additional files into ${DEPLOYDIR}
before do_deploy.

The use of prefuncs for this prevents us from adding
  do_deploy[cleandirs] = "${DEPLOYDIR}"
because that would remove the files produced by the prefunc.

Thus, it seems good to make concat_dtb a part of do_deploy, such that it
runs after removal of do_deploy's cleandirs. As before, care is taken to
not interfere with the kernel's do_deploy definition, since concat_dtb
was only needed for u-boot.

I tested this with poky, putting the following in local.conf:
  UBOOT_SIGN_ENABLE = "1"
  KERNEL_CLASSES = " kernel-fitimage "
  KERNEL_IMAGETYPE = "fitImage"
and then doing
  bitbake core-image-minimal
  bitbake u-boot
It built successfully and concat_dtb was still called.

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


