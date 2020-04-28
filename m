Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.6711.1588078783258252789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 05:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03SCxfoP022476
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 05:59:41 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 05:59:40 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] populate_sdk_base: create_sdk_files: Use _nativesdk variants for libdir and base_libdir
Date: Tue, 28 Apr 2020 15:57:47 +0300
Message-ID: <20200428125747.27422-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428125747.27422-1-ovidiu.panait@windriver.com>
References: <20200428125747.27422-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Use the _nativesdk variants for libdir and base_libdir to fix the resulting
ld.so.conf paths in the SDK for systems with libdir=/lib64.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6a1ebc8c02..f85c3b9f62 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -187,8 +187,8 @@ fakeroot create_sdk_files() {
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 
        mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
-       echo '${SDKPATHNATIVE}${libdir}
-${SDKPATHNATIVE}${base_libdir}
+       echo '${SDKPATHNATIVE}${libdir_nativesdk}
+${SDKPATHNATIVE}${base_libdir_nativesdk}
 include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
 }
 
-- 
2.17.1

