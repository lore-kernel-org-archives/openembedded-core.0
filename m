Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D86C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 08:49:00 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.56])
 by mx.groups.io with SMTP id smtpd.web10.4103.1678783731733052130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 01:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=ufzZ509J;
 spf=pass (domain: siemens.com, ip: 40.107.104.56, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWnJOuOgCyiTYCRbnb3Pi0uns2IgefSlFFmbmzrPzicilweheIFreGZDuSlItjKQddNNKo+2g0aIyOyZ1d0mayf3sRSx0sn4ZbD8cMJfs5aD9aOvSGJMNAUHJVRh0akcUrhgSf90TEld2Fg9uljzT42c/k55jtKZldHnZxaSNWWjrSuollddMekSHdG21j8s1IGizujEex4QPZMb3go3cArTaaBE5advkGn4VUfbfyteckgvaOFiYJ6vUSEkEe+WeQjAofpRpsG+C3xnasW0gP/yYAKS9z8LCAE+c8gpTJMpp1BeSDXB2+wSLxW/Y1VmbShnkss/okOE0vsj8o7axw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/60G1PXOcGmvlvLIxuv2fl7GFzHQ/OaWoHS9b2/6xb4=;
 b=SehqoVU46FDosVYc0RlMFWbYH4QU/Hi65clynTi2woZh+f4U5ii2oRH0bM7XFOvOtAZH8ZKl8FzPRBWhdinV0g0t2KxPlTMvT16609Ru2M6TgGvi7L+d7RgDDzLW8EVdQoU4HI5vkoVfKyGxslzpI7l3G4FmZWYn3IGitDlTZryqFekxP7Blte/WC7TsfMOPWrEF82FqqOSvPxT+mqGj1ogEYVvMKBprmLVgurNulJxFJ2qURN+cndbTaQWUGcdzeie8PuTz2tZWx0dG0ig2HuAQ4fXfoZH1xVz9ZhAXudu9koLNf6csSCGaXfCL4Kxh6jU14XzSveXgbcRaj98erA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/60G1PXOcGmvlvLIxuv2fl7GFzHQ/OaWoHS9b2/6xb4=;
 b=ufzZ509JEi52yvkuaTiv5bOIfVqkFQr7XF8K4HzNvl/1Qf4YfYcckq72kQI0lxyV4o6jH07lWO5R3Twc3x6cWpo4TMR84ekSD/sJui9ZSZdtf3N6g3Sm6/S6nAUVUFPrw0J5dft3rzOEiWA+JWJxlgIsikngcdVep4/aX6UBVbHx5bw6Dcalv2RpnRun4/R5XNBRrgqiznHMruZjBCZOh+4ZGtobKyvP6l6ZEiWOTR0HpgGVVsWFzeU5lD1yoS+BuKxVq4sXoE2JJmyhtAq1j+rMEu064YVn1+q+5gQScvePgOxMWjC5tXsIOgjWvfIeKr5ZWFmcoz52yrj8j1bhLQ==
Received: from DB8PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:10:100::32)
 by DU0PR10MB5411.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 08:48:49 +0000
Received: from DB5EUR01FT018.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::b0) by DB8PR06CA0019.outlook.office365.com
 (2603:10a6:10:100::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26 via Frontend
 Transport; Tue, 14 Mar 2023 08:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT018.mail.protection.outlook.com (10.152.4.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Tue, 14 Mar 2023 08:48:48 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 14 Mar 2023 09:48:48 +0100
Received: from md3hr6tc.ad001.siemens.net (139.22.33.117) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 14 Mar 2023 09:48:48 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][dunfell][PATCH] libarchive: fix CVE-2022-26280
Date: Tue, 14 Mar 2023 09:48:16 +0100
Message-ID: <20230314084816.58652-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.33.117]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT018:EE_|DU0PR10MB5411:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8aa1b2-110c-488f-ad38-08db2468edf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wGWebsEA7X47EV0qH5oYgSK+ugK0fn7CA1sAt+QdRCdA6k4EuxGAo2Vvp+xVHytKlHphdveghbgXDoWhIYIAN4/tnXIl4MSEl95ZPi9AJAg5mkqBS1ZEU8wQ5PsltvPJrZ8CVHC8zJ5KtMGZO1rOC9OTuCgWVLnkqQfRKjb7tOQDSX9XHxWxwd5wHkVRL+765j6PmWEsL0AgDs1fCZMfaUiKdoftjsh7qPR2EZFGPkDjDhoDs7F1+H+VaFjC4SDJwchNYXOSz+lYUqukTUc/i/+tG14G0CwDfJHik5QzWnYb15Eti5v8ZoXP3D0x5wA9k8pkxvKxjRhgl3PLCByIDqpOfMM584xaWdXXpR35k3Zxa0huoy0vbWK+KtT9Lsu5U6cHcntY9MR3LjfovzPzBFC+X4cCq7LkZy/F25WGnxxYz34Yvi7dkRcl5Ew/lvmpsKr4KYEk/gXDKpO2K09p7gDicQqwIVr+BzdiCHX0h/Esr6uu91ULdpFCfOXv+ViDi6vdp5GdgihelNRlMPBbnaEDsVcJyM2UqMKZxhsUYlFxjd3ZLSnvMq0n8GdW1hrtKN+thl62Fd3cIlPv4hBSCSQUSyKh2fhOj31zJfqeku0cx7/NNsUh0KscK1Al0G8pNpYRxxNXt1UFbyeimYDqlpUGlV2+Jy0LIZnag5EDeJ0d01J/91aDTICBRLEDqTkPvWItBd/N4TgP18xNB9o/IUGRVVuW8YuIuEgiFE4m2qkHHMsDklwW3fIMRLEdS0nT
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(40460700003)(5660300002)(44832011)(36756003)(83380400001)(47076005)(478600001)(82310400005)(6666004)(26005)(966005)(1076003)(107886003)(2616005)(956004)(336012)(16526019)(8676002)(356005)(40480700001)(186003)(70586007)(6916009)(4326008)(34020700004)(70206006)(8936002)(41300700001)(316002)(86362001)(36860700001)(82740400003)(7636003)(82960400001)(2906002)(7596003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 08:48:48.9775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8aa1b2-110c-488f-ad38-08db2468edf5
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT018.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5411
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178477

Backport fix from https://github.com/libarchive/libarchive/issues/1672

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libarchive/CVE-2022-26280.patch           | 29 +++++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-26=
280.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.pat=
ch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
new file mode 100644
index 0000000000..501fcc5848
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
@@ -0,0 +1,29 @@
+From cfaa28168a07ea4a53276b63068f94fce37d6aff Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Thu, 24 Mar 2022 10:35:00 +0100
+Subject: [PATCH] ZIP reader: fix possible out-of-bounds read in
+ zipx_lzma_alone_init()
+
+Fixes #1672
+
+CVE: CVE-2022-26280
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/cfaa28168a07ea4a53276b63068f94fce37d6aff]
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+---
+ libarchive/archive_read_support_format_zip.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_zip.c b/libarchive/arc=
hive_read_support_format_zip.c
+index 38ada70b5..9d6c900b2 100644
+--- a/libarchive/archive_read_support_format_zip.c
++++ b/libarchive/archive_read_support_format_zip.c
+@@ -1667,7 +1667,7 @@ zipx_lzma_alone_init(struct archive_read *a, struct =
zip *zip)
+ 	 */
+=20
+ 	/* Read magic1,magic2,lzma_params from the ZIPX stream. */
+-	if((p =3D __archive_read_ahead(a, 9, NULL)) =3D=3D NULL) {
++	if(zip->entry_bytes_remaining < 9 || (p =3D __archive_read_ahead(a, 9, N=
ULL)) =3D=3D NULL) {
+ 		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+ 		    "Truncated lzma data");
+ 		return (ARCHIVE_FATAL);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.4.2.bb
index e0a6174d8b..582787d3f3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -39,6 +39,7 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive-$=
{PV}.tar.gz \
            file://CVE-2021-23177.patch \
            file://CVE-2021-31566-01.patch \
            file://CVE-2021-31566-02.patch \
+           file://CVE-2022-26280.patch \
            file://CVE-2022-36227.patch \
 "
=20
--=20
2.39.2


