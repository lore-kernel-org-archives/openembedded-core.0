Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.8275.1589959808537786522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 00:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: li.wang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04K7U6dH027872
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 00:30:07 -0700 (PDT)
Received: from pek-lwang1-u1404.wrs.com (128.224.162.178) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 20 May 2020 00:29:53 -0700
From: "Li Wang" <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH V2] linux-modules.tgz: fix file permissions to root
Date: Wed, 20 May 2020 15:27:22 +0800
Message-ID: <1589959642-4059-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain

the files of linux-modules should be same permissions with rootfs.tar.bz2,
because it is a part of rootfs when used to install.

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0935196..20a0135 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -711,6 +711,7 @@ kernel_do_deploy() {
 		else
 			TAR_ARGS=""
 		fi
+		TAR_ARGS="$TAR_ARGS --owner=0 --group=0"
 		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip -9n > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
 
 		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
-- 
1.9.1

