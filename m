Received: from good-out-08.clustermail.de (good-out-08.clustermail.de [212.223.36.9])
 by mx.groups.io with SMTP id smtpd.web12.13367.1593517183845637368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 04:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gin.de, ip: 212.223.36.9, mailfrom: daniel.klauer@gin.de)
Received: from [10.0.0.15] (helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtp (Exim 4.92.3)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1jqEbt-0004cu-Sh; Tue, 30 Jun 2020 13:39:39 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.92.3)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1jqEbt-0004nd-Qx; Tue, 30 Jun 2020 13:39:33 +0200
Received: from daniel-desktop.fritz.box (10.176.8.42) by
 Win2012-02.gin-domain.local (10.160.128.12) with Microsoft SMTP Server (TLS)
 id 15.0.1395.4; Tue, 30 Jun 2020 13:39:33 +0200
From: "Daniel Klauer" <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
CC: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] uboot-sign: Refactor do_deploy prefunc to do_deploy_prepend
Date: Tue, 30 Jun 2020 13:38:53 +0200
Message-ID: <20200630113854.19611-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.176.8.42]
X-ClientProxiedBy: Win2012-02.gin-domain.local (10.160.128.12) To
 Win2012-02.gin-domain.local (10.160.128.12)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When inherited by the u-boot recipe (UBOOT_PN), uboot-sign.bbclass adds
a concat_dtb step, which places additional files into ${DEPLOYDIR}
before do_deploy. By turning this from a prefunc into a part of the normal
do_deploy function, it becomes possible to use
  do_deploy[cleandirs] = "${DEPLOYDIR}"
in the future, without deleting the files produced by concat_dtb.

As before, care is taken to not interfere with the kernel's do_deploy
definition, since concat_dtb was only needed for u-boot.

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
2.20.1

