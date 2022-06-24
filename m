Return-Path: <julian.haller@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBDEC43334
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 14:18:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.115])
 by mx.groups.io with SMTP id smtpd.web10.8127.1656080324872481415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 07:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=baS++gwE;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.21.115,
 mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZd1k4p+c9v5sIhG6S7CdSB2d1FJZPJIHQ47/+AT1rXPqh5g3wzSk6mki/kcyxx3/fzoFQDe/BBoJSB/BDnU82q7x5VNs8oVluVXZtylZFU+QxAx8kVIoX8TdxHfjuKGuiMPtVtQ3eGe4L/LNGvpeL73jI9ufzytMDhQ84VGmUxXgGvD1/zwPEFTnhd+WADZ6VWk3Lo8qWsb5jOAhbF0F5hNcQSgYdsbwcr7z3EHiMgiMziwP3DKqtKrwdN8l45F4MmAvkcC3uWn6to+E4hypJNV15PMJ7/nMGgIvbJilrOMQpgWVhvx+gzhMlYSYU/ISdtQQSWkgkKVZ5AFb7pCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMetUiG+nt+Mo8fLLXGlInEsZ6isnKVWuco0ePRK47E=;
 b=GWvGWm3GPwBOKa6wZsQT7axBVSkRxAGrnT/L+CysoCa6mfVVh5Wo8BVifI2jK3X39e4ZBkW09fUUcUF0GX2UbKEui5NR3/ig6RMj3Wcb6K4u1dn2EdprmwnFRxBf3HbzrCg+gIHH9xcobe8F5QvqVb0n0yc8FGDH7kPRHyF+zgRXP0OmMZFevrwKgstgAsyub41hcGkoM5JsvaF59i7MLrTAj26Ij7Ubdy3HFEja/joPC+ovvOmDYB0/fl8YGjlGkoOEKPYK6LTwQCpMnljI508cKx2Pa0sDHuSy6p3nW63As/Ycuz++Y3ThTVetSmvTNKLoTeGzRG38XmUH1CYNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=bbl.ms.philips.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMetUiG+nt+Mo8fLLXGlInEsZ6isnKVWuco0ePRK47E=;
 b=baS++gwEKwGbVGPmWUS5ukbYgCU1v3CfV32iOL4GhRsafIPUo2L/nNO0IKv1CcpdSXzl4JdoHTOQn0oMcXxiwxT9XaF0nAQG+VM3sxP3Zwx1AkfE7mktW2zXzvOKjDFIJqb9SEqRmWMVV8FcFd2kgBwhwA4RCm1QOlqrAdhYn2Y=
Received: from OL1P279CA0009.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:12::14)
 by AMXP122MB0166.EURP122.PROD.OUTLOOK.COM (2603:10a6:209:98::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Fri, 24 Jun
 2022 14:18:40 +0000
Received: from HE1EUR01FT083.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:12:cafe::7e) by OL1P279CA0009.outlook.office365.com
 (2603:10a6:e10:12::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Fri, 24 Jun 2022 14:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bbl.ms.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 HE1EUR01FT083.mail.protection.outlook.com (10.152.1.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 14:18:39 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id 4bPdoaCpUl9Zi4k8toLiDu; Fri, 24 Jun 2022 16:18:39 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id 4k8toXg8dBXNN4k8toQ4JC; Fri, 24 Jun 2022 16:18:39 +0200
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com
 [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 57CBD183347;
	Fri, 24 Jun 2022 16:18:39 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id 51FF52A0010; Fri, 24 Jun 2022 16:18:39 +0200 (CEST)
From: Julian Haller <julian.haller@bbl.ms.philips.com>
To: openembedded-core@lists.openembedded.org
CC: Julian Haller <julian.haller@philips.com>
Subject: [meta-oe][PATCH 1/2] pcsc-lite: upgrade 1.9.0 -> 1.9.8
Date: Fri, 24 Jun 2022 16:18:26 +0200
Message-ID: <20220624141827.1204951-1-julian.haller@bbl.ms.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cd32e68a-dd34-44aa-3a9e-08da55ec6f86
X-MS-TrafficTypeDiagnostic: AMXP122MB0166:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E8IRgB/jhHuABw0ELkt+IGopIfhu0zsXup6komcHDYmily65EQkq3SVs3Ve4mAUk5lKCwVrgqDtNEknHYoeEzAOa+WrzlCy7juQnVYQcuGWM24aU9bs4Jqx0ACWcLH/i84c01kOkkJQniJCw/YI2PcOldYftMmUpJ00hm0G+nTYfkv3iR2Jqtp3iPabCIwG5jzMsA2cFZMB72nAOs13+msrJ6KZPQ/O1ok0G2KjIDeySUvmC+WqeFIbs/gl3j+qYlpX7rQBsEIRnjMuAOXN7sHVFzwtFpkUyozn2vgI4eDri7Wp4TcwlaVyqibq07e7ObYVhHgZDm8FicGenlptEKk8LJsJn4qH+RNS0rqGBz0nJelPDCpsvIwaFnCnQhNt583y5hWOoZcCeHDXT66OYyAuyvZ39InukEifFVmKChkbUZPZMJwpKBCsv3DzigayfwImrm31dcpFlX72yZUUGxfRt0EBNXClN0Hf/kgZwTJJNukmDhrFlF0QS7em0YNSBLxm6LAnU3e2ACyBDtNt1D2DglOig7VH1k69dD63CwAQhN++9nLDe9QJZpKVrX1jpo6hWt04orXWI5o/lysLASNeRJ1bzmEoqGohhPWMiiBRmZE1m/1+gbneQTW/dnfRp3hWQ99xKNrFQA6PDxlE+qo5dRZVZ63ijZX+ZY36EerNhFzNfBGaJFqFMJj0S12v29tz1qD75/cEFn5TH7qzyVA58GYYWzyXNvmG9MRpCvl9Ma9lIBTPOjJPkGqAYItliA8yiB0xa0wI0AjdQpcmneCkVKndL+npcdPo/ZxoEroRSvzNGLp3ljXtXwar5jEQWb/zl4MRi3/0jtU1ksQouwA==
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(40470700004)(36840700001)(46966006)(5660300002)(478600001)(8676002)(1076003)(83380400001)(6266002)(41300700001)(107886003)(426003)(70586007)(186003)(336012)(2616005)(47076005)(120186005)(40480700001)(44832011)(82960400001)(356005)(966005)(6666004)(26005)(2906002)(316002)(7636003)(82740400003)(40460700003)(7596003)(8936002)(42186006)(4326008)(6916009)(36860700001)(70206006)(82310400005);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 14:18:39.7168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cd32e68a-dd34-44aa-3a9e-08da55ec6f86
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT083.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMXP122MB0166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 14:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167292

From: Julian Haller <julian.haller@philips.com>

The python3 related patch is no longer due to similar changes in the
project. This also requires changing the RDEPENDS to python3-core to
avoid package QA warnings.

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 .../0001-pcsc-spy-use-python3-only.patch      | 43 -------------------
 ...{pcsc-lite_1.9.0.bb =3D> pcsc-lite_1.9.8.bb} | 12 +++---
 2 files changed, 5 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-s=
py-use-python3-only.patch
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.9.0.bb =3D> pcsc-lit=
e_1.9.8.bb} (85%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-=
python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-=
spy-use-python3-only.patch
deleted file mode 100644
index 3e7b0adda6..0000000000
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3=
-only.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
-From: Andrey Zhizhikin <andrey.z@gmail.com>
-Date: Mon, 27 Jan 2020 13:27:12 +0000
-Subject: [PATCH] pcsc-spy: use python3 only
-
-Python2 has been EOL and most distributions would not provide any
-support for it anymore. Since Python3 is available in all distributions
-now, switch pcsc-spy to use it exclusively.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
----
- src/spy/pcsc-spy | 9 ++-------
- 1 file changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
-index 85222c6..965138e 100755
---- a/src/spy/pcsc-spy
-+++ b/src/spy/pcsc-spy
-@@ -1,4 +1,4 @@
--#! /usr/bin/python
-+#!/usr/bin/env python3
-=20
- """
- #    Display PC/SC functions arguments
-@@ -22,12 +22,7 @@ from __future__ import print_function
- import os
- import signal
- import time
--try:
--    # for Python3
--    from queue import Queue
--except ImportError:
--    # for Python2
--    from Queue import Queue
-+from queue import Queue
- from threading import Thread
- from operator import attrgetter
-=20
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb b/meta-oe=
/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb
similarity index 85%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb
index 9ae091a09a..64c9c2a9da 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.8.bb
@@ -9,13 +9,11 @@ LICENSE:${PN}-dbg =3D "BSD-3-Clause & GPL-3.0-or-later"
 LICENSE:${PN}-spy =3D "GPL-3.0-or-later"
 LICENSE:${PN}-spy-dev =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D628c01ba985ecfa21677f5ee2d5202f=
6"
+DEPENDS =3D "autoconf-archive-native"
=20
-SRC_URI =3D "\
-	https://pcsclite.apdu.fr/files/${BP}.tar.bz2 \
-	file://0001-pcsc-spy-use-python3-only.patch \
-"
-SRC_URI[md5sum] =3D "eb595f2d398ff229207a6ec09fbc4e98"
-SRC_URI[sha256sum] =3D "0148d403137124552c5d0f10f8cdab2cbb8dfc7c6ce75e018f=
af667be34f2ef9"
+SRC_URI =3D "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
+SRC_URI[md5sum] =3D "d063c6ca17c17fab39a85132811e155d"
+SRC_URI[sha256sum] =3D "502d80c557ecbee285eb99fe8703eeb667bcfe067577467b50=
efe3420d1b2289"
=20
 inherit autotools systemd pkgconfig perlnative
=20
@@ -54,6 +52,6 @@ RPROVIDES:${PN} +=3D "${PN}-systemd"
 RREPLACES:${PN} +=3D "${PN}-systemd"
 RCONFLICTS:${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE:${PN} =3D "pcscd.socket"
-RDEPENDS:${PN}-spy +=3D"python3"
+RDEPENDS:${PN}-spy +=3D "python3-core"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.25.1


