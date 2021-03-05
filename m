Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.9298.1614933053132129508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 00:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1258UeFX022741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Mar 2021 00:30:46 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Mar 2021 00:30:40 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 5 Mar 2021 00:30:40 -0800
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] rootfs-postcommands.bbclass: Print a warning when login with root is disabled
Date: Fri, 5 Mar 2021 16:49:20 +0800
Message-ID: <870b35befc0b8fa9cd1c3a03fcfd2395440c2f41.1614916931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614916931.git.liezhi.yang@windriver.com>
References: <cover.1614916931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Fixed:
EXTRA_IMAGE_FEATURES_remove = "debug-tweaks"
$ bitbake core-image-minimal

Then we can't login to the system with root without any messages. Add a warning
makes it easy to debug.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/rootfs-postcommands.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 1f27a3d07a..e4fe416ac9 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -147,7 +147,11 @@ read_only_rootfs_hook () {
 zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
 		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
-        fi
+		grep -q '^root:*:' ${IMAGE_ROOTFS}/etc/shadow
+		if [ $? -eq 0 ]; then
+			bbwarn "Login with root user is disabled since zap_empty_root_password is enabled"
+		fi
+	fi
 	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
 		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
 	fi
-- 
2.17.1

