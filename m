Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4A6C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 15:02:04 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web11.15461.1709132523182410269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 07:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=RN76QIs8;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1548; q=dns/txt; s=iport;
  t=1709132523; x=1710342123;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Un4pLlQ9huVJszzn01qeByFCrXjCkPaTkqzLGBNWyaI=;
  b=RN76QIs8Jxfo3uWh8LkUVHTl9wdnlyuJST339FKfvzvzk6FBDreYUnX1
   pvhRJgevSDYmTQ7Kc8SpZyjPcgDXEQD5Uj5yRS3IDstzw09l1L2bAEuBg
   6+HXLRFxaKkTZo8GxTwXN7KdE7wavpgMQtsryYFsyw2/wh+Jre6zSp4R+
   k=;
X-CSE-ConnectionGUID: cy5zeDeiSmeon+Yu7gRPrw==
X-CSE-MsgGUID: ZihdtvtlSqebC264C9cFCw==
X-IronPort-AV: E=Sophos;i="6.06,190,1705363200"; 
   d="scan'208";a="219122933"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by alln-iport-8.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 15:02:02 +0000
Received: from sjc-ads-6997.cisco.com (sjc-ads-6997.cisco.com [10.30.218.117])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTP id 41SF2278018690;
	Wed, 28 Feb 2024 15:02:02 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bash: improve reproducibility
Date: Wed, 28 Feb 2024 15:02:01 +0000
Message-Id: <20240228150201.224875-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.117, sjc-ads-6997.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 15:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196387

Nativesdk package contains host references in output packages.
Remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
 meta/recipes-extended/bash/bash.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 2c3e605511..c8275c0443 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -74,6 +74,7 @@ do_install:append () {
 		mv ${D}${bindir}/bash ${D}${base_bindir}
 	fi
 }
+
 do_install:append:class-target () {
 	# Clean buildhost references in bashbug
 	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
@@ -93,6 +94,26 @@ do_install:append:class-target () {
 		${D}${libdir}/bash/Makefile.inc
 }
 
+
+do_install:append:class-nativesdk () {
+	# Clean buildhost references in bashbug
+	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
+		-e "s,-I${WORKDIR}/\S* ,,g" \
+		-e 's|${DEBUG_PREFIX_MAP}||g' \
+		${D}${bindir}/bashbug
+
+	# Clean buildhost references in bash.pc
+	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
+	     ${D}${libdir}/pkgconfig/bash.pc
+
+	# Clean buildhost references in Makefile.inc
+	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
+		-e 's|${DEBUG_PREFIX_MAP}||g' \
+		-e 's:${HOSTTOOLS_DIR}/::g' \
+		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+		${D}${libdir}/bash/Makefile.inc
+}
+
 do_install_ptest () {
 	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
 	cp ${B}/Makefile ${D}${PTEST_PATH}
-- 
2.33.0


