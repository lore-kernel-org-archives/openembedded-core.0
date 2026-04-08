Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02A0105D9A2
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:23:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98128.1775618448657254953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Da+Rfl9p;
 spf=pass (domain: axis.com, ip: 40.107.130.39, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRuOdgeT5aRhLgR4sWm/hZqEId1Uc8xcd1ZJ/H998AVlwpIltkkrZnNdyON/HkAgflrsR7Lrq1BZ4dcNZuCpr1cNk+GSnYYxJGnKm5ZK7Uf3rGTvKR7GU/QxtjQcB9LZy7NAEZXLGcYJ9tCxRmwZf1WHqaFLKv0025tTHkVEZO7xvPzAHJ4rn203Mopwq66YALHUdGN6hzBBeKMC+JDHydK+A41xIZ+mHgfzpF1z0g611FtbVwAEQjzzjaMcDTmxMuAbBziIphyS0S0m9gQR1ZQjHgoP4/IDEmrdZx65S/Oy1qHmCNKuBl0L6Xur/7VkQoqZD6FzwBAlbr7zGAJK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OLORUxyLMbGF5F/cP6cH4e1tdHqrdLluy6Rup3tNHE=;
 b=FZdeOMXNWIPZSqZdCDVmihMEva0BfYVu7GtcGsIPjPxOOm1lDGkDVgPnaS0cCjiiZxvI1lowSb+5CeygXtNf8Dv2HvFVarwFRfdGSiVReS6c8GZM1oI+oQgkmoqP9VyrWkf597d+A/DDd/qMdb1L/Cp22zoE0aQUShy4uyJx1TK/o62+57jGsjqC5UBxzM+nerLLbfLgofyBvTzr/6uYCTri5hZlvLCFpWgH4IjOmgwlfZ9ynC1l066iotWVNDbbjxT66QJq+T691eSdM9vhMyCqvK1Bi9eIjeaL2EqBpnYhUQMWUOIrM8ja9LKu5jGz7IAj1OfIe34wyvYqo4Gt9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OLORUxyLMbGF5F/cP6cH4e1tdHqrdLluy6Rup3tNHE=;
 b=Da+Rfl9pQ0kky7yoK0kjzLJZtDZj/MqWjMEizeXPKAFGQQ/sf/05LXT7T/IYtvj1b5ZauSxTZ26HIBBt7uM2EuQdmoIi95hLo0fDj0Y/pmr9p5/En86JdTJsQeLjEvf9/sBVCFff/ADLF9QOeQlh6MkPufCJhWKG7tLTBX5aWn0=
Received: from DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) by AS5PR02MB11319.eurprd02.prod.outlook.com
 (2603:10a6:20b:6ca::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 03:20:44 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::a5) by DUZPR01CA0314.outlook.office365.com
 (2603:10a6:10:4ba::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 03:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:44 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6B05B1A5C
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 5E6BD1205FC; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 03/10] gstreamer1.0-libav: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:16 +0200
Message-ID: <20260408032023.1810147-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AS5PR02MB11319:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bb204a-6d0c-420e-f500-08de951dd207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1zoPGGxzbKJKe5Bbs3m/Q6jgvWPgLkS8n5VQPxkpiPMnsjE1xQQppfhywNNIC2kEOs8dGfS84b4pTwzSkmgNKgJnY6dRhuloXeLwh+0PEcUVAHqHqr2Rx3g8j6kEINb+OlmwwdbFZUMVQesDME+Fl5U75wf5P0p8zelc73zMT1q/UV9DsNqiGGNXtu4REKfkKY6AMT8Jv55v8e81ODmowS3N1sYlkeyTu35ge1fsoh32qwSyhrjomQhHZ1HbljWMqrgaLUi6bOzxWkWt9OdyVst1g4V2TER5fXlRYEeMaQYrlA+y1wc1RHTcvXh7zOqUwM3gHzkAcBeJNQ0d+EXc1X/rTZJHunRdXFZQAAMuTDpSjmDkAONF9bhf3lFpPlNnNZIGj3lpZrEG9xI79P0+bc4q9WvMqX4R6F++DHd/Bvqhg4qcI7fwunLMTUp7unRvgHJ/oP7/3QvrRT4a72cU7jddTvrTWPyJL5rekqB03hEGx7BaElSUu/1T+z8f+TTTbFEuhIsWFK4819nyFVq0ZBb+HQyRtZ3QCvgJxNmzfuV16VoBC3se/D5Kll14MNsF8SWNxJKZBYIBA/6L6G/dWf+hM903coB3PcwsngwjlR7raVQ4mmk3d4oVb52flXipJlCM5ET6gB4W7mwxBC8LOOCQlz/ccCupjfkTJuVcKIJSe/LT4K6wglL3obdKbCegan4nNyeW4Q6PWfQWV5K5eLnGG972PUPKcm4gF2wchBI=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EXA13TikjbtE6QBXHMWw4tuYQuCdSAs8B5q2HM80rryjmWbx9fc/zwwMPhmJOerARoMfHMV+yV8+5W7oNrYM1jSq6WAG+5Eo1/E3aXq4lalwk3jeKLSQhb8bEbr7gomqYieIsNPVDvF4oR3SFlnJR4A0lROTM1gYdG21OLcXMZAH2Uyx8/rbSN0/rkH7SotCRJMHRCv3gSpIfhuel4UI7WjqQMjvjgfxQ3PyENWTTiwMgZV6ss6fgPidBGTcBusWR7xigTbh59INp54PqUx2aCMdJLkKElu5bU8oioC3LZwpmzc3twt5FWHujZ6Ii/fGCL8WH+lmzOFyUV7Ox6mA9Q3U8q3eemu4ec7LP2RWXeYX5kwltJ2BGUJGorLPbzjyhNPcl5WUViWg8juFQrZQbB4IytJPa0QBWvGp5U1wC2IzkhfD39uKhMVPlFS6lMzB
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:44.3007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bb204a-6d0c-420e-f500-08de951dd207
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR02MB11319
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234795

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 ...streamer1.0-libav_1.26.9.bb =3D> gstreamer1.0-libav_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.9.bb =3D=
> gstreamer1.0-libav_1.28.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
index a652dbba33..70dfe3206d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb7=
7e486cc36129f7a770 \
                     "
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "08a8e944fc61ef26df515784a089c8ac41765304a5d55b9819=
9835b28a98dbdf"
+SRC_URI[sha256sum] =3D "e3c93db7da2da3b2374ccc2e7394316f9192460abdea816516=
52791d46ccb8fb"
=20
 S =3D "${UNPACKDIR}/gst-libav-${PV}"
=20

