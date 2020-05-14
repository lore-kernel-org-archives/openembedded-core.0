Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.8167.1589443262015243191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 01:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: li.wang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04E811M2005001
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 01:01:01 -0700 (PDT)
Received: from pek-lwang1-u1404.wrs.com (128.224.162.178) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 14 May 2020 01:01:00 -0700
From: "Li Wang" <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] [OE-core] [PATCH] linux-modules.tgz: fix file permissions to root
Date: Thu, 14 May 2020 15:58:30 +0800
Message-ID: <1589443110-2408-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain

the files of linux-modules should be same permissions with rootfs.tar.bz2,
because it is a part of rootfs when used to install.

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645..18a11d7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -691,7 +691,7 @@ kernel_do_deploy() {
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}${root_prefix}/lib
-		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
+		tar --owner=0 --group=0 -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
 		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
-- 
1.9.1

