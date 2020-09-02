Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.13384.1599016809269060803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 20:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0823JmTM026963
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Sep 2020 20:19:58 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Sep 2020
 20:19:38 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] kernel-yocto: Fix an inappropriate process with include path
Date: Wed, 2 Sep 2020 11:19:36 +0800
Message-ID: <20200902031936.3804-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

We just want to remove the first '-I' in $d, hence removing the
'g' of sed avoid changing the real path which is include '-I'

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 96ea612258..b672a1143a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -225,7 +225,7 @@ do_kernel_metadata() {
 		for feature in ${KERNEL_FEATURES}; do
 			feature_found=f
 			for d in $includes; do
-				path_to_check=$(echo $d | sed 's/-I//g')
+				path_to_check=$(echo $d | sed 's/-I//')
 				if [ "$feature_found" = "f" ] && [ -e "$path_to_check/$feature" ]; then
 				    feature_found=t
 				fi
-- 
2.18.2

