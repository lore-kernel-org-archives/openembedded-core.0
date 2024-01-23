Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEEEC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 16:39:59 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.17783.1706027998406166551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 08:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iRmqm6nU;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NGdvKB097650
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 10:39:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706027997;
	bh=mG8jImJVu/4zZJLn1/aoiWjaiFQfLiE4O4rso9BxWsE=;
	h=From:To:Subject:Date;
	b=iRmqm6nUS4n1WTh4IXJ7BVEkBrJJ+KT+hsappAgGu87g9GAmFhd3CmRBCXJgciPCE
	 U1+w/ksJ/LKZA0rtRx0+G8IGyGkootpGDL8X0F4r9rMwnkbrBq2+aGnVZbCT0BMM0O
	 vjL4fRgaMZFlN2+aWF2CY6FpiqsxG0UzElsET4wo=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NGdvSP036872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 10:39:57 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 10:39:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 10:39:57 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NGdvlR126933
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 10:39:57 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rSJob-0005g2-A1
	for openembedded-core@lists.openembedded.org; Tue, 23 Jan 2024 10:39:57 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2] python3-yamllint: Add recipe
Date: Tue, 23 Jan 2024 10:39:57 -0600
Message-ID: <20240123163957.21782-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 16:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194246

Add recipe for yamllint.  There is an upcoming change in u-boot where
the binman tool is now configured to call yamllint to verify the configs
during compile time.

There was a previous patch a year ago from Trevor Woerner that never
made it into oe-core.  This patch is a reworking of his patch but
pointing to a newer version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added entry in maintainers.inc

 meta/conf/distro/include/maintainers.inc          |  1 +
 .../python/python3-yamllint_1.33.0.bb             | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-yamllint_1.33.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8dc63b138e..b0625a1097 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -724,6 +724,7 @@ RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wheel = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-xmltodict = "Leon Anavi <leon.anavi@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-yamllint = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
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


