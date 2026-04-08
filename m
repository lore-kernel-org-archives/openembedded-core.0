Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C27105D99A
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:20:50 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98299.1775618448967630675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kF1xtiDg;
 spf=pass (domain: axis.com, ip: 52.101.72.26, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn00NX1mUore8N6zVIVfdRGPKMGTsxhbgJVNNiIINaI/h0l/bV1D2pYnhMzjQ/hjyfyrebWZ6kitjibpBKbZ3SbCVxC6uVCkvDACS6xAeWFmKqViA8DAMwPjY0r3QZsgozpJPsZFgZQfDtdSDG+jU2IbNyaPPUF6KCEwTQXg1mH/fgbijG2F0dNmK5kxuOvMQoZSVU3khTaDFabBo41GLEOc7R3uZwob7XE3K/1Dx5A4suNV2xpxsnaraYrOGzkAZsDEDIjB9XCRJeZGGJ+PtX4yTh7iXTlNlNFsg54hdEITSAzr2ddNlZsVPbyNy34xumkRnLe0qLujz+Rd4zu0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5k5awQHU7B/c3RwYqiUvvpRHlhQSbHLDSuXoBUsza8=;
 b=wej1jh9bFIXf7HwGnjfTV75y4UhwsRKdvUh3Mz4RuWY6XJ+Dll0FkQTPVsuYe2nSv5FuYhTBoc3hcI1wma4KizPDcYVhG5JVY02xXAXw8EVRFFLWPAigpl+0n7waYL/4p6aO7P3sFK9HoOTDpCjTY2qtvR7Vec2lOsKQ8v7ocrPqe1WJtHobaUhHd+5Upqr+cEthBc7iEGF8UfjPT4qMB9pooF98SfQvjMXcRYadWQznqUC0wtXTiwSCReKy2lyWB4H/P12IWl9lwEswusLkRGFkOyFtPwBnqBiybHnDTR/oUMY3BokiPcnG56YApvh6ytEkljl+QJRMkHyN722XYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5k5awQHU7B/c3RwYqiUvvpRHlhQSbHLDSuXoBUsza8=;
 b=kF1xtiDgtEaMCbfKYkNwQ0hltVYXy/t/W5BGDvY3icR6EAPYYZNJ8hhFFKAje1FHEgwxt+0u+BWhffNQZA4jZlp4ylwV7g545sMq9z7TvgohO5A0LMaVNuLuxBELI97A3Hk58zP4Z0s9avv0NvE+l7RPVedgZv2wgojp2DQELUg=
Received: from DU2PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:10:232::16)
 by AM9PR02MB7220.eurprd02.prod.outlook.com (2603:10a6:20b:3eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 03:20:44 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::7d) by DU2PR04CA0071.outlook.office365.com
 (2603:10a6:10:232::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 03:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:44 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 5BE761A23
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 5653C1205FC; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 01/10] gst-devtools: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:14 +0200
Message-ID: <20260408032023.1810147-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|AM9PR02MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 9063f14e-1abd-47a4-75a3-08de951dd22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uvCmWN1jWeD241ig78/7FZV/0mJJ4k7WhhRQJaBiju3RkCYhp0JNtv8Bmp3oHIEgpoJjDvrvDGPs1o7THPG80YoNsOwaR2SP+/SI299Qe7BwFYVDigZWXy1b92FvM+3h0cPscAwtxjKK80ExhJ89Ms6Quuo1q9cqpwAgds3cFHAFB43Dj892RMvFrNwJUMZ0WfRBhi55NmrKPS0lc0F21xXf0RNTzZDKH9pmVCDnBXaTqCYmYeNdCnvvXuNl50We6WcFKanSVNBWU2xgLtMneSX0YbF9OZv6O+x2MdyfkIN33azlIU4Q9n7yiw1yR39/GnCfl/0/e9UyH+nMKdvhtVQR46G+/ziXXOBT+mE4Kvea0r9P3THUe3SNJF3lZqmA4uLTBximaqFfUR7xCSv7RCwP3SYkHcYWW6Efp+++fWa9O/t8OHqtBkFDXsCazbDF0B9Zf6LodkQeBUkeHKLfVNOjjKKE/NTIeKSKTPZHdZ5cw1CefslTKdv9AmfWpL+kzlZGfxsK8JmojG2R88/BjbdAey541Jj5xpbgjrJaAOwNlTzrCcHtzOK9Xnhrfkd3N9kjp9NPfHk5w50TnKcTvHSrbYvVsd7TXjRt2Cbthe/y3IULAFHH96xhozNJ7tMXFHkiGaLvcnEPn/hcy0U0GSuQaNSlbYMyZOTQkCV1kd4plkZUxduY0usOYXG9GRuh0+jsPrgEOHqwh8Sqb7my564i1OH3aSw1psyMmPlYz/Y=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4NWKDcq/Wdznul32059yA2VPWbbBI5N5YLq9+KAMwacJN/Qp85HFEY1SBIVcFxByRL9E7baogwXCoYALUT8nnnsXzM8fCfZ2YJ0jhh2Lto9PkRX2Zdz8vaxbsOwYfkzOnabve0v8xFoLgsZfruSa4IoBjmSaPRjP3LamfJswMYiLjyVdfc6EF40DPygZvtYUF9LdWSGLaI1JmX/+Q3IlQ4gspSsWjnSE526hvJowM59MbmCs8EnjX5dErKXtHzWGALVIVd7C8L86AgMBRSGGazUsDwJB8OlB9pVTFr9WzVK4xYSYXmrl1ngU8R+SAsdqszgNibb3hzt5UYfquFPLMW7Ow9971b7lHhA5VZog0XUMQyIY6mAcc2eeJwSqC6+nPlILirvF/Rey/VhSDw0przGh0Jyu7jGWg0rgPC3Zj2phTOfJBvQdtYoCC9b2MR5D
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:44.5358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9063f14e-1abd-47a4-75a3-08de951dd22b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234796

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 .../{gst-devtools_1.26.9.bb =3D> gst-devtools_1.28.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.9.bb =3D> gst-=
devtools_1.28.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb b/met=
a/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb
index 44c579f2a4..369451ebba 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-de=
vtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
=20
-SRC_URI[sha256sum] =3D "55c7adaf9eee7a5219d44b736c401a947ebb5d0130c78e9000=
17a6812026b567"
+SRC_URI[sha256sum] =3D "184a68b2c967210c6ddacad9a8e2c7ebc5e8df9b10fd7b72b7=
f7580cc0a60fb1"
=20
 DEPENDS =3D "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-=
plugins-base"
 RRECOMMENDS:${PN} =3D "git"

