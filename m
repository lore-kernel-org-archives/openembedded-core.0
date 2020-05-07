Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.3894.1588821904783901008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 20:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0473OCOV018105
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2020 20:24:53 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 6 May
 2020 20:24:34 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] opkg-keyrings: check if opkg-key exists before run postinst
Date: Thu, 7 May 2020 11:24:32 +0800
Message-ID: <20200507032432.7979-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

By default, the opkg-key command is not included in pokg package because
it is only installed when gpg support is enabled. We'd better check if
it exists before run 'opkg-key populate' in pkg_postinst.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
index a20e316a3d..07e2402545 100644
--- a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
@@ -36,5 +36,8 @@ FILES_${PN} = "${datadir}/opkg/keyrings"
 RDEPENDS_${PN} = "opkg"
 
 pkg_postinst_ontarget_${PN} () {
-opkg-key populate
+    if test -x ${bindir}/opkg-key
+    then
+        ${bindir}/opkg-key populate
+    fi
 }
-- 
2.17.1

