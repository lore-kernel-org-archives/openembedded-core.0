Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CDEC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 16:00:21 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.45])
 by mx.groups.io with SMTP id smtpd.web12.9429.1645632018317371538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 08:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=vOSNazZQ;
 spf=pass (domain: weidmueller.com, ip: 40.107.15.45,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyMd+90HchcfnSqXlVJxIVs2kmJnLvYaWQS0mBEEqnET1bDnSzA6mZdnaSJKqGX7igyLiw83B86p0OHHFRUuOTQCWpbbDucwgGAbIr/VnRrktOeELBGWZSyaAiyOqtfJdyVZfLL9/yrNoT127Ukgb5dF+ZXQMSS4YuCGe+vdVVQrxmZTpeY1qd2SIwdZ4D3CHzAsK2wUS6FTLhsKQHfheaBj78SCKktCqHpHjoNDTEnq1onYuzVPVG5gKyYFnyKp3y7qIUIeZ1jbNd9r8mkP08FsWlNQdm8nRMoc97Y1rDO8Q3lsgGMRcIkUuc/Bf5/D6FNNnBdCQf4DZ4CQmbM8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YkFR/Rv1n814PqwKWEPfGQvGe+ItuIGIj2shMTpLCM=;
 b=Ble9PXrrD5/pV3Qebjmfidw/ZMyrOyFT8tqjf2auKW9E//KWWcRPtFDvtj2MnXupLzEU/FHh5+rd9QMovPJ2dWnGzOAm+M8L5ZMxF+0whRZIygVa8njB9Bor6JI9NFSSjX04SpALjTq5GEmWZxVhr/k+fbWxbJf2vC956O5SGYh9Emb+8ULjhLx6Ou5n78Moh5nYahnjwEDA+dBmn/gN9/5awX+NX+UijZmIlEc8NCyQiCRfznjG9wmLSwZI2hptW9tdBr0+OnLfh3j6blY8uucl9Bq633uGepmyXAAWK9ituxJ4Mlf/HgT0l6GmFqjrT1ADUfggCTKhAnviO1XCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YkFR/Rv1n814PqwKWEPfGQvGe+ItuIGIj2shMTpLCM=;
 b=vOSNazZQNe6FO0m37gNioJiVWd1Qb2EpMA10pylkzYLIUvY60adhA23ahQilt6WmU9YU1eGMfL5oPMQ73tQOsl4q/p04mK12eRUMG9qbkebsWAekt1EBMPzUFmnwWXFTjqI5E1a9Y6HYU7J8mhNEEPKUo/qwRASv0GQ+7Cbc6lE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM0PR08MB3012.eurprd08.prod.outlook.com (2603:10a6:208:5b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 16:00:15 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 16:00:15 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	mingli.yu@windriver.com
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] systemd: move systemd shared library into its own package
Date: Wed, 23 Feb 2022 16:59:54 +0100
Message-ID: 
 <20220223155954.11408-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0119.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::24) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bed45cdc-96ae-4e4f-a246-08d9f6e59492
X-MS-TrafficTypeDiagnostic: AM0PR08MB3012:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3012F6540111ADF28567E34CD73C9@AM0PR08MB3012.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qeuu6wt5ZgL7g+LZkHz9fpkvRjoAAoqFcOda+6uY9xg4LVTaN9PzqaCNwku3dMoWTGBZN+nBrFecDdfwcie2WMcnKKj5Y2IjVG//ZlJgY2uqPqzN+DHg8oFwvlKgRgnHxEKsUPOc0vmALu4jWEtN4jGcg9xhCm92+IRym6wvyT2ddno7iOJ9cShL0Vb5C0eHfTSFstjQoTbVAbdvpiAqrDQ4b0Agc0uoyjqf5DlOFKKF3EauLP19n1HoGFKoGIsxS7bmnaScU3tsxHVrfy/g5M2r9qU++3pDML8nkk2IR3vZf7R+0nGpp7EEjh+RqXWPtnjlqeialQ6S1h6AfLIgqfc4r+SU1kr5A927DdJi/Bm2x1mZsi7UpB9Ia8q3AsjztzW+oW708NOxNjNRI/IOCzcdSmrK5yJTqjFpYL5eUNY8VHUc+yBpio7+6ZjuS7+0MlaAygTNXbMVP91sXk4vzYZLC9zu6d9tB2BOCauDzCbP9GPRW0apxvBvQzsMzURARdFrHrcAgoTiItwrOi2a9ymEWjdvFmREPPVRMyw+AeDvlUvTaYa7OeDuKKdlCKWQU8MYC1RL0gSMOSCYhPm8JRrxIIJW6B67F0qGWykVWLJkaZiGFzYZ1ESfY46I04ch5+eXqDQAITcXUP8XSgFxVejNl6dr6SCvEtJCyZMiTOi2HXirAVr5p6x6bsHRhasGIel7y1Cz3uCIR4UtVQVWew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(66556008)(316002)(66946007)(38100700002)(66476007)(4326008)(8676002)(38350700002)(86362001)(5660300002)(6666004)(508600001)(8936002)(6512007)(1076003)(2616005)(107886003)(83380400001)(6486002)(26005)(6506007)(52116002)(36756003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uCbS/y83xnZ8eALeKCnYdSZL7R2lHjAprkboBb42Uf1jVu0Il6QcRXFgHotY?=
 =?us-ascii?Q?ZLLWLGhJZwUkHqkQmJouNFOlzRAhbTdwQznu06vz/KzbxSPxgXEZF/Bjwcli?=
 =?us-ascii?Q?T/cjh/aU7pa9147Tj2oyAAl+VmcHkhXnRBhpKsRir5GeEnLULa8p7Xtu3K11?=
 =?us-ascii?Q?iI9gBkpWFxsdl6KEUoYlc/hNMOq7CpPW5GU2j81bI8iu5cSSxT10Cpj3Av1i?=
 =?us-ascii?Q?hJGXEzvbdlfNUrvWTcE1IGWU4dO978Lo66CwHqdd4xa5LWvSiOqyXSSwsZuI?=
 =?us-ascii?Q?flEgM+1oaGtTnRwqLOLSCcVGfA/QjlZYWmgZg09twFXHExaca75f6cEJUtEQ?=
 =?us-ascii?Q?7LzkxtarNPJ/MY0ieHMavatLQx+7Mx2A5DnEs/JbsClYejkFBVayi3UU5fab?=
 =?us-ascii?Q?cYIxFcsCQC69GYrYqxjO22VtLBAL2wdZ75LsDbg+S7pVQb7VZ1K3Km6tInGW?=
 =?us-ascii?Q?J98tJVbovtErBLBk/r8EqaRiYQ3Ydd6swy/ff/HRs3Ve5PhawcW/lT6GwMBS?=
 =?us-ascii?Q?tZSzkTVQowksGsnMo26C2TmCD/k3rsqtMmZ83u43Yr0/Yo9t3n4xBAarifR2?=
 =?us-ascii?Q?NhwuMnztL1wq5Q165ZWeY4qSYUQRThEBoYObFI0Z2WFCM8NBTdukxUC8GErH?=
 =?us-ascii?Q?uB6+buhv95FfmtE3uonR1IkE9BUt7YRVODrqKQYV7Vj9RGUwsNMuAwCj7Prc?=
 =?us-ascii?Q?AfxhF33+b1tNrB8IgI884Z8gRyduRuIZaSKpziTdEOCTc7CEHbOg8wdWk7t7?=
 =?us-ascii?Q?gzsCA0tJ5waLiiaHygSblMKrBbMd0g3d/VgXbVdlGmk3wKlxAeXfS1UhriEX?=
 =?us-ascii?Q?qwCfkDpCtGCk3dYVLVGBnJ88++U/VTGq7Gxp/82t78fwRq8d+VbxfVEEOA4f?=
 =?us-ascii?Q?GLB4wsuUR1G7uhiDvyD7JF1KEDw8MnIHtUy/nHTVcL0JGSJjSw4b5f0fEIQH?=
 =?us-ascii?Q?fFE2oqwUfSG6Ye2ZRy4j3aoz+Bl5oGvPlO3k2ccKSOOAPjCo/oyG72UA+ozj?=
 =?us-ascii?Q?SNiyIpt+gIjIv081bBjTTCH8aO1vE9A6gpSqXTV9+BdXEQvoYGbO9il9j41H?=
 =?us-ascii?Q?3D+BQl3Lh7XbuGkqkDHy4DersnmRrixpFY4kTB2s9YxCgftNUbyZ4WiF5qCl?=
 =?us-ascii?Q?gfa5y+hReSJIdtqefDTjdnEhtSFR8TA5rDne10Y8AfVl+uzLdI9xwE8JHmO7?=
 =?us-ascii?Q?U5+QfLgS4PwkFrTcGwPKInP31cBR5KgUUWvKTRLoN0ftrl1jQIqXTYQD3FvU?=
 =?us-ascii?Q?rPB1U9i18acH/IQHb1a/rPuLYYPC/yCYSJ8VfF/HrFwApZGUeaEs/ppMQgWz?=
 =?us-ascii?Q?NR+C/ojlw/gAicUoYM5Bhrinqug1isTXXNMRpgOUvdFOgXvO70w7Zs/FuUOz?=
 =?us-ascii?Q?uubETSGaMgQEgvyvxwbPy7HL+1Iw4LXwSwDfvF/N/yLxGLMfjL2Q+97KUVky?=
 =?us-ascii?Q?OIVpC0nmkJjQAbn6ROwf5qxnoz3+KlzcVwWJsX2rxpQHq5d3PkvZUhjBepXI?=
 =?us-ascii?Q?oNFqamO+RRz3ebLWY2G99J8lSL3GClBvYqzOrhFog914lMjVd0oRo+HiUdqm?=
 =?us-ascii?Q?iN+LmpO8XH4MP29kqdtH69HpieaQ4y1CltdFyxZfghXSYoW/+09o/8g1N8IG?=
 =?us-ascii?Q?BTy2E/WSYjJQtEdUV+E0pzU=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bed45cdc-96ae-4e4f-a246-08d9f6e59492
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:00:15.1154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cJulpKv3NwsE+QQDMa6F8SPBG4sRzEFS3yGlN6Xy1LHmHief/nafIXwyrER+wTX2DazE3XM1MPksEwvZFP85Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 16:00:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162267

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Move the systemd shared library (libsystemd-shared.so) into its own
package to prevent a runtime dependency from udev package to systemd
package and thereby to a second init manager.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/recipes-core/systemd/systemd_250.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-core=
/systemd/systemd_250.3.bb
index 9121333f56..43ac66da62 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.3.bb
@@ -371,6 +371,7 @@ PACKAGE_BEFORE_PN =3D "\
     ${PN}-journal-remote \
     ${PN}-extra-utils \
     ${PN}-udev-rules \
+    libsystemd-shared \
     udev \
     udev-hwdb \
 "
@@ -387,6 +388,8 @@ DESCRIPTION:${PN}-journal-upload =3D "systemd-journal-u=
pload uploads journal entri
 SUMMARY:${PN}-journal-remote =3D "Receive journal messages over the networ=
k"
 DESCRIPTION:${PN}-journal-remote =3D "systemd-journal-remote is a command =
to receive serialized journal events and store them to journal files."
=20
+SUMMARY:${PN}-container =3D "Systemd shared library"
+
 SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${P=
N}-binfmt', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '$=
{PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '$=
{PN}-journal-remote', '', d)} \
@@ -654,6 +657,8 @@ INSANE_SKIP:${PN} +=3D "dev-so libdir"
 INSANE_SKIP:${PN}-dbg +=3D "libdir"
 INSANE_SKIP:${PN}-doc +=3D " libdir"
=20
+FILES:libsystemd-shared =3D "${rootlibexecdir}/systemd/libsystemd-shared*.=
so"
+
 RPROVIDES:udev =3D "hotplug"
=20
 RDEPENDS:udev-hwdb +=3D "udev"
--=20
2.30.2


