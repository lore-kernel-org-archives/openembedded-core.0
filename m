Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29340C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 20:07:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2739.1705954025923841298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 12:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IEV/j+K5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40MK75Qm006185
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:07:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705954025;
	bh=arrPgMLM65C+fVsXxWNGVEIehkg+oqWaMTCMJ1J/v1w=;
	h=From:To:Subject:Date;
	b=IEV/j+K5QW96WM5SZRtRcl7yiBhtjONu0jTeSO3T6YvFJ9qCLQaJeE6upH/kmo+nY
	 PMJnknW2dcjqbjX7VYZD01WOnxym6s4vcacWxZKujhqBuI4i8XvVo1ch1eSAflthmR
	 a0xvoOOfyOrfG/5iyIFuAv8QlnTPTh1UEL1vua78=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40MK75b0049882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:07:05 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jan 2024 14:07:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jan 2024 14:07:04 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40MK74bZ061601
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:07:04 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rS0ZU-0005Th-FS
	for openembedded-core@lists.openembedded.org; Mon, 22 Jan 2024 14:07:04 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] python3-yamllint: Add recipe
Date: Mon, 22 Jan 2024 14:07:04 -0600
Message-ID: <20240122200704.21018-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 20:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194192

Add recipe for yamllint.  There is an upcoming change in u-boot where
the binman tool is now configured to call yamllint to verify the configs
during compile time.

There was a previous patch a year ago from Trevor Woerner that never
made it into oe-core.  This patch is a reworking of his patch but
pointing to a newer version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../python/python3-yamllint_1.33.0.bb             | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-yamllint_1.33.0.bb

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb b/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
new file mode 100644
index 0000000000..4b7bd065f9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A linter for YAML files."
+HOMEPAGE = "https://github.com/adrienverge/yamllint"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "yamllint"
+
+SRC_URI[sha256sum] = "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS:${PN} += "${PYTHON_PN}-pyyaml"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


