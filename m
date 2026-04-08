Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666E410F9943
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107437.1775657857472315488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=WDkSPF+l;
 spf=pass (domain: axis.com, ip: 52.101.66.63, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRO2c/dGkINhE6UqBJ1FB3NKJ4yiFbmlr05prTrRUinck5oQ50k2Q/G4Rq9ctTWq4tnUTxhoNlP2A1uDoZK+3kb9v8+iC16TGSknBK2nFCtfFKexY87ooeE+6z/AoDvqM9YL8hMRUo4UxaUn6AEgdDPIFy+16kTSid+/17jrJxSLBNCoCNXK7cWg2eJifnghh48yU4cvSo5Mco4Y+LCOdJ7JezXAbw+xyW+Nm1/JQHtodEFx7+ZA6gXO+TrkGTL8HwHV+p/6J+qWkLD625q5lL+css9Y6q1+Q9Tc6KjJUA6CmOEKl65hyhPWL6WG4KtxPwWiHNip4b7eS3dwb+5BTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO4jwQrDh4t8cg80pjVvpSt2Von/47SrNJe3JCNxBPE=;
 b=Ujge7nY0r7RW+91nJhKfpyVvu9eMHJLPb1eYITuZIX9Hnp1d6ehVTI3BSETo5MEx4gGPW/zuhdBsl6QiKZyY738pnpWKyv90bHsFY8Mnm6Y3G2eZjbGaM7PZExDyW7fri0LRH9xQRnjyMWTOddPpVXayS1os89rdjBO4gziYGbipEdoTxsuTOS9ikxSBTXxUhvDvUdccErrMMjoXCSaaaSP8ArMx3WXQkXoGeIHLQy2y+7RqD7oAYGnxEDgjgtK+Pv9je1YSRhZ5kQ1ls01sMbQRDN2OVdA5HeOqNkQtRkh3GlCPl9S/VHhUI7dCPlPQhLFXqqGtjZT9urajt+3RJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO4jwQrDh4t8cg80pjVvpSt2Von/47SrNJe3JCNxBPE=;
 b=WDkSPF+l9sovxXGUnutswvcVg3IItU82zCD4jGGq+EbP7QA5I6Z1Mj2qiHka99/xZmlRhB6LF0qaut1BXV66lDs29eUxk98XxB5wTiBOuZMC+AoLA85C6zeEgyT/DrrWg5sblKSTsuBVhlZTM/E4CWnscQfjFJn7gwG7pcGFnsk=
Received: from DUZPR01CA0300.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::24) by PAWPR02MB10425.eurprd02.prod.outlook.com
 (2603:10a6:102:332::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 14:17:32 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::8f) by DUZPR01CA0300.outlook.office365.com
 (2603:10a6:10:4b7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 14:17:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:31 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 965D823D2
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 9414B120831; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 09/10] gst-devtools: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:17 +0200
Message-ID: <20260408141719.1086823-10-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|PAWPR02MB10425:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d856ec-b942-4c3c-c71d-08de957992cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	DMPdrR54BTBL5tm2CSBpQSDrLKY0J+OPc8jiUHlIWV8x81Z8P/bD143HcnhJT5Ed1NpY782fvuVpVsW7CSRW9xaTU5thVWWal+l/lv74p6cBMPvVHBUCoy9Wz3yoazaEzDt5YGiC0W0M7F89SH8269eH+6ZDQn6bInqDh4WmgYllURe7PB1nuY8bFZ0cyLFBc3+ATIxUTxwv3PY1Xz3Mf+dO46534Ru7R1230puZMWQ/Sq1DXCG3aHhF6ZH3vbV4XzTG4JukFuEj6OLVPFcqzghpddWULAG7lyR6hFEK95aKbkjHvIPL6KklFBGhQLmGx55LyKXbDGghhwxzxTL/y6ZMFa9G4kgPDGZCjGfUnjH9+sBu2ahp2RUSdzK7Oz5klu2eBuPgtjzxIk8RYuVD7q8ykA6ZLHollvhU43K1Cdgd835btgS85ZD1qGra8ivJ/7BqRyF819qdImdoBGHypmrcpff5BeaQit6KoCNUalvL3Q2SLTERkO95r9GaKD9uuuvk/S41uTYY90LLaJ0hO/9cOBoSpWTM4CAHosroWFjZfzdcJ74YHheQzAmbT2tlHwG8r+ovbXtVwOjpGIeMxtFvvgtinfrdVXicKd0aDyk4fr2L64hUS3NwCOdoU9G1IbmR31G4q7ncf6mu29GQoiZ20LGyjt/FqC24AfpxezbfSWKuzsyCdmor5XSEswp+9j8/zULIDwNMBOWUenFXkF2NJ1Elrx4jBqpMqlaLBNU=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	M01TvWdi8PsTePd4FrIv1lvl40Eg5ULfNZool5FvC6bZz9I9L93pr+mDyFOR7rFCf+M+eDZynqZC9ufCDtKcGtYiotfwrF7Rueoiw0O1cHeA7oaSZKMme4r+uCK9pTj1EzdgTyrAxD78p6+dwx2iJXi+6ph8ysV0vU64OoxmHMH1yF5aPCLx4aRQIpgRjWrXQXIBs03KLJ38hiblBnp7zyOwVav8K92j+IbRMNhNKtY1qiI2T83+qe5v+MI8SWvDlWaBISC4HAX4u3AvVcPRX3V+MJwrIJIkZyUfL5umb5wBhN5+i3Extg3J92f4eIm9E2IWgEL0fSpRcMoRwMtSjB1z1jaoUwA/ISPE0SbblIE7aowWxiGK6dzp09fTI9Mkw4mNrqpPn+ocdssQXl5m6gYMM4bMYmGOCk1gTxGd3xkYsltAnr0yRvULmRprWkHY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:31.9103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d856ec-b942-4c3c-c71d-08de957992cb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10425
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234849

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 6376a84: modules: dist common files from monorepo root
* 57be895: devtools: dots-viewer: Update Rust dependencies
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../{gst-devtools_1.28.0.bb =3D> gst-devtools_1.28.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.0.bb =3D> gst-=
devtools_1.28.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb b/met=
a/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
index 369451ebba..cbe488a049 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.2.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-de=
vtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
=20
-SRC_URI[sha256sum] =3D "184a68b2c967210c6ddacad9a8e2c7ebc5e8df9b10fd7b72b7=
f7580cc0a60fb1"
+SRC_URI[sha256sum] =3D "8e012bdcb55503f466d53f1f05e13e8993c69811b9db77cd16=
a8f6467723bf91"
=20
 DEPENDS =3D "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-=
plugins-base"
 RRECOMMENDS:${PN} =3D "git"

