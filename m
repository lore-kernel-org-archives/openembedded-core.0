Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2370.1589275068962137880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 02:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: wenlin.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04C9HH4V017139
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 02:17:38 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 12 May 2020
 02:17:21 -0700
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V2] populate_sdk_base.bbclass: fix warning: name not matched
Date: Tue, 12 May 2020 02:17:21 -0700
Message-ID: <20200512091721.77315-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When do populate_sdk with SDK_ARCHIVE_TYPE = "zip", have below warning
in log file, this patch fixes it.

zip warning: name not matched: sysroots/core2-64-poky-linux/etc/tmpfiles.d/etc.conf
zip warning: name not matched: sysroots/core2-64-poky-linux/etc/tmpfiles.d/home.conf
zip warning: name not matched: sysroots/core2-64-poky-linux/etc/resolv-conf.systemd
zip warning: name not matched: sysroots/core2-64-poky-linux/etc/mtab
zip warning: name not matched: sysroots/core2-64-poky-linux/etc/resolv.conf
zip warning: name not matched: sysroots/core2-64-poky-linux/var/lock
zip warning: name not matched: sysroots/core2-64-poky-linux/usr/lib/environment.d/99-environment.conf
zip warning: name not matched: sysroots/core2-64-poky-linux/sbin/klogd
zip warning: name not matched: sysroots/core2-64-poky-linux/sbin/syslogd
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/usr/bin/chfn
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/usr/bin/chsh
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/usr/bin/passwd
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/usr/bin/chpasswd
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/sbin/vipw
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/sbin/vigr
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/sbin/nologin

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index f85c3b9f62..990505e89b 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -58,7 +58,7 @@ python () {
        d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
        # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with buildpath
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
-- 
2.23.0

