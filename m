Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86004105D99F
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:21:20 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98298.1775618448699693469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=eFYa9oTk;
 spf=pass (domain: axis.com, ip: 40.107.130.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANaeNSO0C5+rpPqhifvwUlH2EnToQjqMP11/5+czQzxXfr1AUAjB/bspIt8ajr2wdmicA735ERTjkDyoBXgfUtgdJXPMvoK+DycBsaKonhGaeOvJdL2GC9gcSaP2S7fH2NmejfdIMFOA6NIz8UD+k4z2u30aGdJtU6dTP3QMCDLoA2/crXW778/NGpdJZewHe7Z2Mvfoq67MfIg1pLV0I+epzCNZFmTOBhu5Tn0rY+OWOYXT1hVFQNdjvJfIyseEe6NarH24B2dPp01Ud3rOipXoC4fT/UcCdWRoft0pTxvMM/w6B5E3N1WZ20+/NT1Gwj+NX9Vo0HibKsHjBR0YbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0vN8F9HxnuhRNbv0W+LT7HUysr+DjqSOok2qHTmD4I=;
 b=w/cqW9Ry5sAT8rhGpFHZqDOBantkQ8VxKtVKYmd/y75Tj2pAckQK+DogGaZZK3U4KAWeSePsI9W1KnVOt/JBuXzDM3j+TBUxaMwqcnASbfecRFy6CvJ+G7p25/+pUV7eGOBmGkWOI2QGoyJNN0GoY9EAfvkQgF/JLJYw0Hm/ACW/B+ck3+JXaMrVOd/IJpt22lkDDT8U8BD6xEH7PRfuzZFJ4VRDiZUqjBka8ro4GgxQOxKfOblJy6LwyMXnWwqp16nP9YomgqD5zTMXQS/8uJa8PMgKlmNeyZnd4BuKcx/wAbc9fFPBpk4XnZnRnAAHEy8Eyevprc+MLcw/WRHfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0vN8F9HxnuhRNbv0W+LT7HUysr+DjqSOok2qHTmD4I=;
 b=eFYa9oTk5lIkFM0weEuK5G+6DvN8LZEK2ANLZRr/EaJqz/zOLqxX3VtEabanngi2X3NnBFTj/MA2e1lP6slsZ7hsx2312X1KeTRh9Jm/NQbDcg3ES1/eMPyUAWUrNzIwLggNoGqWjry3j0hiZRgRv2cYAsqvZCZPLnZl4sXl53o=
Received: from DU2PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:10:232::13)
 by DB5PR02MB10120.eurprd02.prod.outlook.com (2603:10a6:10:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 03:20:44 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::c1) by DU2PR04CA0068.outlook.office365.com
 (2603:10a6:10:232::13) with Microsoft SMTP Server (version=TLS1_3,
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
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 5DB832795
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 5961F120319; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 02/10] gst-examples: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:15 +0200
Message-ID: <20260408032023.1810147-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|DB5PR02MB10120:EE_
X-MS-Office365-Filtering-Correlation-Id: 485990f3-4f61-4a02-315b-08de951dd20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JSn4+CAuu/+NhYLk3V+XwXykKckFCT8xSk78YEaNusNacwbL41xtrgGiwQQ4fk0TecEky0yI/1mGYh9culXBn52fkWssQlrj+GcnzMRqmSsaPrFj4B3t7qzxujAIKK233cX2KHvLY/e8BeiqKloz5sn6cleGKkQygWTpiGIHzel8UFHOxzlUcTKKIvabu7ifOVeUKvKb3c/F/vRIOVLJqzIATQCTCiNK5jBS/3r/4GA+Tt5R7HUbtd8IMFvSZELC8wfcSD1evRWeSkVOerwOUVKIVsNGavVbdbnCV1xhMbLBRNqkFFxdOI8BLQcgDJKkWnSyA73IUR5TMuyTD3x0Ro4GCMc9FxTNnBNxzXKyXQW52U9qa0BnNUmFdKqmOlG3lDWZ6R4+RucwwViNAVqhbh0J5JLXwJJqcnhjix5OJMYFH6KYWOr2kjyMb8cAEI5cX6YDyKcw4A4UkFdqde+S5TwuzbXzvwtYbnLMb8oOaemJQUMOK3HdwVTvDFMjqByO/lMtcSXbYemFnf3UkrsrlUGgEZ8xf7AwJgydVwg1UWT4T12JZ7YqZO9gYdbVQEam1kiAPcgEMD+Ll4U5EfGL7m2VGIsU4vI/gjdzGg0begzxvDEhX+8kV2tGQAsFHkNl7bHFVQOVuc4bzkJPGmbsJzBCMSmR0g3CU5Qi8P2mJsqC6B2ID7jfZuZwmoGMdKauRiLGZeQ0qqiZnvKAWvsNUw6PDiSMapBcp8cCkjjoslS5gvoaauYCuGw8/I3TOhdez219tCotlR3o/eOq05bcpg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VohkBUbXzPETmkxwsiQEpznmxk0jI513lAX9CNBAdA10aL/fVwuttKWUjY/p1TsfyTDrmXvTo4PEzrCbYT78xrm3bCWNqXfiz1eWWp7ypUFRuSW58UJZ53wWrBGGo+FgAQqUGUo+F3ukYgThJou5+Gfv6Czqb1rhikN9xcrBVREV0WVcxtbys05sA5fS2WWSeuHzyfeWppHCCyNtSPetb6g15luq9xo4FVmesOjFVhcfSnVEkgzXwqTWX10ysnaonMb9DA+9oaUhjt5KyE4QPnPQskQB6w4cjdksuq2EPIY4NeBsTbYPj6rOkXh8I/yB5D+ORiW6Soc/GntRsxDDsW3EQGRB56C17PDmjq4ZLLA4P3a8FfrKmTbhB1ThKWunBwT7Q0OUrP8t20nwMFxydRcyevOpzZ1qF5tWK4KB/J1/dIQUTMCMET96md7TIU5d
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:44.3180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 485990f3-4f61-4a02-315b-08de951dd20a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234794

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 .../{gst-examples_1.26.9.bb =3D> gst-examples_1.28.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.9.bb =3D> gst-=
examples_1.28.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb b/met=
a/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
index febfd6736f..066454608b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM =3D "file://playback/player/gtk/gtk-play=
.c;beginline=3D1;endline=3D20
=20
 DEPENDS =3D "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-=
plugins-bad gtk+3 json-glib glib-2.0-native"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=
=3Dhttps;branch=3D1.26;tag=3D${PV} \
+SRC_URI =3D "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=
=3Dhttps;branch=3D1.28;tag=3D${PV} \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop \
            "
=20
-SRCREV =3D "f313fae193089408e278c0dd3450145e5a12307b"
+SRCREV =3D "9058212f43074ef7df229e73cea135c4ea96e0d6"
=20
 S =3D "${UNPACKDIR}/${BP}/subprojects/gst-examples"
=20

