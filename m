Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F2FC5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 09:02:11 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.62])
 by mx.groups.io with SMTP id smtpd.web11.73298.1724749325966392664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 02:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Dk1mLprm;
 spf=pass (domain: axis.com, ip: 52.101.67.62, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4FTtbe1q5xnVwU63poMi7AXMl14rhCGBriiLFCPnlRPQuC6MCq4rJG+y8SAyaPvmViKWEEqlOI/DZA7I2pmJt4R7k/j6PazeWlSH6/ZpXkp6gmGqvX1BW+ynvWo6ltFDKRu5CxipbwhZHKM9q825LzT0XwxOgVxXTf3oCOedKtQ/YFlDtRCJe/Y0spA/4ibWfJLLtmJGWtC4qQzU99iEVGGBIBz1eLzheYrEzHpTTfynWgGqIxHi6jjwd6iDQo0MwwLgudhVfIGuAlTHrIA/fmuKAIz6OxD2H5ARhrjwvJ7plvKtTzQMBC71GOzdPvF/MK7zarzgyi8AQ1H2Qsfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FujtiAkehFVI1szvLZG0JEKuqgQJa55wtjzCW5DdnsY=;
 b=Uii7XzQWpEdY5b7L9aZbaXddCW9ZcYAoyk1/BArh/BXIo732ZUE52jHMBXRwzJ9vRz5XVbV7u7jmND54JRhuSdZCsRqydSzqCtmTD2rE/O8HogZ9kKp/k89hA/keQLyF1ixhoNFKn4wOXR9utX6spIDl2I3OS0XJwc0YYDDB+N4LWxMXNqSBiYZp+zZ5Ms0m670KCyYCZZ0eB+KnUZG8foCXWOYfGbdgjV4LiwiIkAwGIIZTYDVMI6HkOYntEXvX2XhtM0WNJpC58EuZuuVmjiISsHydY8OYHKUH3CiQy1r/b0R3bKgyhE4fgbghCCAwezDxqr7SySc7gN9uihroAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FujtiAkehFVI1szvLZG0JEKuqgQJa55wtjzCW5DdnsY=;
 b=Dk1mLprmeLLAyWio9Us0ys5ZwPPtBcVzJSFrkh9zD9ziC2MOH45OyVsEG+MkFVdGWJF0erY0uUwSaDeuJPdSFuSYlpkVPxaUXhJ17yfSYGpbtRTjlhGpEeGnTKIWt5p2YhVfdHRuT251+nYZc8l1eTYH9ai5QbqLqbPskUPZCrk=
Received: from AS9PR05CA0333.eurprd05.prod.outlook.com (2603:10a6:20b:490::19)
 by DB9PR02MB8227.eurprd02.prod.outlook.com (2603:10a6:10:306::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 09:02:01 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:490:cafe::15) by AS9PR05CA0333.outlook.office365.com
 (2603:10a6:20b:490::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26 via Frontend
 Transport; Tue, 27 Aug 2024 09:02:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 27 Aug 2024 09:02:01 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 11:02:00 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 11:02:00 +0200
Received: from pc58073-2410.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 11:02:00 +0200
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [PATCH] ffmpeg: Package example files in ffmpeg-examples
Date: Tue, 27 Aug 2024 11:02:12 +0200
Message-ID: <20240827090212.2192055-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019E:EE_|DB9PR02MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af84573-09ac-4824-74aa-08dcc676e9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dRq4kqx3Vf2yzE6GPtRYR/xurweipXm66Ap67PyZkGsJQkxZGPmCxsROldvJ?=
 =?us-ascii?Q?MrC0xQbIhbJBAP9seg4CGTFzQxim3svNC9FG+AChAYvKPU29p//US9vFKx5E?=
 =?us-ascii?Q?0W7YnS8I0SVT0X3jn5Nam5XITIV6Y+hHnFDe3mBS6pxDidotz8pN1YdZZogU?=
 =?us-ascii?Q?IG8ZCCMiANk1IB3u1vqEDoxgDY4zEKVhxAKDdoe+FRJHS/zW229W5Oizg1+M?=
 =?us-ascii?Q?AJc4faN4I1KAw8jF7gLy1/CRU2okVx0GRfOcJdWCGE/7cK5vN2JMvro1hvQ6?=
 =?us-ascii?Q?3ROj0ZbEedBPntke5Lk/w2JzYoZmKjUT6FtkwR7J2In+C+YS2pvleJSprWNn?=
 =?us-ascii?Q?fxyncMHzqCQnkjxBwIu8t6VjQhc+pjCAl4YmyhJmTI7xYG8f96eOo/46HHf8?=
 =?us-ascii?Q?IPXTeQ7rBU7U+OL8k/fk3zeIUP5PbemsKhRi6tS5EmsqY2IWyrC2UI/N6v3D?=
 =?us-ascii?Q?alCsj+rLPQx4wiJbJE7O4auERcbi/iRbQsw5SwjemBxNMnWCYDY3ZNF1NV0U?=
 =?us-ascii?Q?yvtim8rGNQxvE7Qh2gXhUgcOwSOHhbMtYiIGOnqOENNeToP2oUn5mU68+Avd?=
 =?us-ascii?Q?yKKW8Be749KOradmiQ4ToSwBYWX0lSWJaKKPifJiRKSfIJLGj2Fi99RENXF4?=
 =?us-ascii?Q?iQjk3HG/vwspODoTEB+b0sDvMf86DJ0BoIbr/2KGY+XL0FFtKJ2F5u2IiBjk?=
 =?us-ascii?Q?Xfnx/otGRnKTKl4c/CwDtk6dS8fa2HyVCBZ30YgD3fyxyyP2mB1pwx6ac9qD?=
 =?us-ascii?Q?WtjlZQK9kKoEax1RGgq7DmsyLeSovPG8mqeu7zjOrlstxpIWfJb6n2X2ux05?=
 =?us-ascii?Q?KmlSt2wlhKBr7c2H2OvLOs9QrXiuj9K4QwJZyeMgXwUKnIPz+ZwlVIfamGnO?=
 =?us-ascii?Q?BQ8IsDs6SP3xtoSskmIfeU2jet+x6Bs38PYgwAEa6MqpnI7P42EbiL5GEZVS?=
 =?us-ascii?Q?h4XK/ABpQ//g4eiw0Y6npqnlktBaya9aiRlPjZ4rtmJ+YwWt5sUEevQX0hm5?=
 =?us-ascii?Q?+nweN8UcY1JQRLv0DU7Y2cWvwm8w0MPxsi5j/f9znFd7/wqtCWob6Uj2JV/U?=
 =?us-ascii?Q?G3O3Lj1/ZnDB1E6+bvH4Uww6YxRNckZ7Nyvd6q9r9oMfNiJYxB9O/IwpKVRD?=
 =?us-ascii?Q?rIWZNT0vLTm1Ij/dvi8zSHEWlurvI7+2pEE/wtPZYtl44pi7cpNN3isJULl3?=
 =?us-ascii?Q?FN+TLjL9GLLJkNPs7MXZLMDlP5wyUjxUMIB894UkhvMRk85JaTTI94UwHqbW?=
 =?us-ascii?Q?SZFJ2MhuxLO3VO41nYIZipFEWtmHJOyJY3L017z7WZgxWIs/ay8hxDkgsfKz?=
 =?us-ascii?Q?eJj+uQf7xs8b0J1ZXUjCas43OTp8C/hGa5ltrspd2ejrigRSEgX+6jpCZ6Td?=
 =?us-ascii?Q?OT//P8xyw2tdLNjAM6LQ8CHN4mm6+SymeKIw8o0DF5RPElHZdNIWtyClfERc?=
 =?us-ascii?Q?oz0JKWYB/GZTmE+8t78y/j+dPQ2Pzf7r?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:02:01.0426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af84573-09ac-4824-74aa-08dcc676e9cf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203818

From: Ola x Nilsson <olani@axis.com>

The most future proof way to not always ship the example files is to
package them separately.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_6.1.1.bb
index fe34b87ccf..55313cc583 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -170,7 +170,8 @@ PACKAGES =3D+ "libavcodec \
              libavutil \
              libpostproc \
              libswresample \
-             libswscale"
+             libswscale \
+             ${PN}-examples"
=20
 FILES:libavcodec =3D "${libdir}/libavcodec${SOLIBS}"
 FILES:libavdevice =3D "${libdir}/libavdevice${SOLIBS}"
@@ -180,6 +181,7 @@ FILES:libavutil =3D "${libdir}/libavutil${SOLIBS}"
 FILES:libpostproc =3D "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample =3D "${libdir}/libswresample${SOLIBS}"
 FILES:libswscale =3D "${libdir}/libswscale${SOLIBS}"
+FILES:${PN}-examples =3D "${datadir}/${PN}/examples"
=20
 # ffmpeg disables PIC on some platforms (e.g. x86-32)
 INSANE_SKIP:${MLPREFIX}libavcodec =3D "textrel"
--=20
2.39.2


