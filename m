Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2575.1588754817426307873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 01:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: wenlin.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0468kPoe011004
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2020 01:46:45 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 01:46:29 -0700
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH] populate_sdk_base.bbclass: fix warning: name not matched
Date: Wed, 6 May 2020 01:46:29 -0700
Message-ID: <20200506084629.120567-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix below warning:
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/udev/rules.d/80-net-setup-link.rules
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/tmpfiles.d/etc.conf
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/tmpfiles.d/home.conf
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/systemd/network/80-wired.network
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/resolv.conf
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/mtab
zip warning: name not matched: sysroots/aarch64-wrs-linux/etc/resolv-conf.systemd
zip warning: name not matched: sysroots/aarch64-wrs-linux/var/lock

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index d03465b6fc..b5c004d832 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -55,7 +55,7 @@ python () {
        d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
        # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with buildpath
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 -9 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
-- 
2.23.0

