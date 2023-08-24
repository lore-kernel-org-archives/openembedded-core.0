Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42232C71153
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:08:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.138])
 by mx.groups.io with SMTP id smtpd.web10.11820.1692886079678444284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 07:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=AxP+SBG1;
 spf=pass (domain: prevas.dk, ip: 40.107.6.138, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/58v0kiO6uVUCuP/YWXl46fuCpQfnbfH64SfvWPh1OosDPNNJo1RHbH3FR+doUYUD6chle0zlQ7FSaya/F9zaPfxMaM2pesgWpc4a7x31/sZyEMAUpx9q41xZYvgp6/ZYzx3ydsXHAV+FdLr/yop3b9IhKSJUYsn/WB4Fo0rAlKs9WSAVaWu8AtlUjtGAAf6jyso/XV5cahpHj1Lyz6/4b/N/8GI5MuAjNKIVDLR89ZuJscDb+FPLilp1CbpsnjuI+GQG2XRjIj/ijbwg6V9kkmrDZ1ip+S1BACBHBnKMtWSO3q02URO1fSx27c8FaDHUrEE0P/2sM5ouU1F7whyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5SITEPeSIAylfPfMmvfORcirvPGboma7txnWngUwkg=;
 b=YQGVUPPAWvdf5az36it0Yc99d0g68GqGKYyqeZjrZ+ZB8N0fUPZ6A1Ef+g+hYeO/hIonbta0Sz6xQk8ccKC2ytCUJ0eTgcQrZz9KgYlKXNQZ9uKfNrxaOukJY6IEO9EUswJFu/Malwg0iUWBvFRlGSuwhWM8FdbT4VyjvlX9IiApgZ6uflW4Rt+83XyJx8dEvwX6gyR0bpH2Z3x6EVoIsntg6lvR69o/373TaOAAz1mzOohYHVXasw7d5yKNwbM0c8ffCjIaJiV6JkZWbN8SvMZh/5yiN9BSQ8gCdtVunQs28TANZaUm9BxgJdZl5102V9HJ7ecrrJ5v6mua6NkqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5SITEPeSIAylfPfMmvfORcirvPGboma7txnWngUwkg=;
 b=AxP+SBG1feuppV2IRaKv/jhgspOGOd7c/e9/CG7ORXGiJ2/Rxn/x6nelKe/ZPSCKVz2vZBP4wMt00Uhm8QJkseWO2mg40Me/AiJ+8f2AjAaNeWW7+mpNRLoMzgdsSht/fQObGqL8Nc82SwLEpYoY9Q0bav/sjaJbXszNWwP3Qw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1fe::24)
 by AS1PR10MB5263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:08:01 +0000
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6]) by DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 14:08:01 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [meta-oe][PATCH 1/3] libopus: add CVE_PRODUCT
Date: Thu, 24 Aug 2023 16:07:45 +0200
Message-ID: <20230824140747.45594-2-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824140747.45594-1-emkan@prevas.dk>
References: <20230824140747.45594-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::29) To DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4571:EE_|AS1PR10MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfbc411-08df-4311-c8e3-08dba4ab86a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/DJVTBGtAR8WAFg9eOxw0HqVf0gBN/Tpb8aqT+rh28Jf2CNn0pwdMW3yoscoo84MYYvMtKuJXMlP4TDyKCEkKxu2MZuImM8kU3I+kfjq1uPBnS/QrWzNrdE6vw6OQgBYqBYc9q8twMh8tTDTtpedIS82DGfc1jrLZt5MmDAgLhu2od3VeRNh9W6D3FE28FBSzqZPx/Ifrq4V0JTeEalh7AN57FILH2tkyGYzR543Bglse/9BVnXsh7C0gxhASC5Wj9QMaRBR25xgxVQyBlG7T0ixmRd/UYjLfPxYCUJoHRHq6mZBum9K5M59MSFqSsvDxDSmmtLZRlnw0wK54DIjSeMhrqpEGMa8yyyfQV/IhmNJaNWAhgY8TBLUf7qN5m9CfUDnxqigKcMT+WhmIL0wBGm4dNZjaFRcwkxWHJAqohlPCbGuusfSZFBBWCROISYnCT/6Z6tA0sbzy0Qm9DZWuebbuGbqc3UC9o7kBUcMVpHXI7Dy+4o4gB+aqXwPFEM/cBimKUxgpipRs1AWm4wc5E7FcXArHkh0WXg3/4NW6BZwusXak8I0jb3r1oDSPKvlPcxj2iAl4WVVr6hwbBZzVOYbQqVCfEb+PN0vg3VM3Zf/4II4MB5nKTvL3pl+N/mA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(39850400004)(396003)(451199024)(186009)(1800799009)(66946007)(66476007)(66556008)(6916009)(316002)(478600001)(38350700002)(26005)(6666004)(38100700002)(41300700001)(52116002)(6486002)(6512007)(2906002)(6506007)(8976002)(4326008)(8676002)(8936002)(1076003)(2616005)(107886003)(5660300002)(36756003)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RBuGI5c9c/NfJUPzm/4FjclHBAw6W5/kj4pPio1vDyER7t7XXqDzOYE/jRwh?=
 =?us-ascii?Q?3GkxnUJO/1+GxrqV0xzCfXWobd3BC5MRuA/psuKVlC0lSMzv3hRaOxPT8CCB?=
 =?us-ascii?Q?C0X65VzFUlz+I0WHhfXVkIvO+wgmg3z9tIoVDDnj05uJ3Os1VmbSGsybYSmS?=
 =?us-ascii?Q?aDHzGWI4YSk/KgEJGHJLu1YH0ZbbPemmMOuRqrLfCaX8FpQBW+0S8tuaduS8?=
 =?us-ascii?Q?rZo7/GWc+IxIfCzPGumnlnwy3p2i3dtSTelTlG9YqUAFx6VidCwIXESzlIf3?=
 =?us-ascii?Q?It2Qjjw3oYhxaoUMiR5W2W8CjLNDJbyfS7XD439XM65s5zpcyfjSBpEFHpID?=
 =?us-ascii?Q?AWpT6ArWjA1jCMkf4wWkOnvbr3HshyB5hCM0FSuQnhZpEhggEgDqx8QxT/e+?=
 =?us-ascii?Q?eDDsUZH6vJOxJVBtBzxbLulZjOxG6tU58kO8qLj2h5meJrzkGzNZu/xrIKq8?=
 =?us-ascii?Q?ATu47bDYTxp0Moobt9QdwM52BoN02/+mxTrCiVWO4Ssl7XBHV2qwmpmLjRq7?=
 =?us-ascii?Q?Oh0bvjpy+yrulLRTjh88GLD8TXIDrNXZw/srEVPy824HaDddKguNd1z+4372?=
 =?us-ascii?Q?WJ7RaCXaGKLEurZeKi2vM34QWaMmM/2Mrbf1oWeXrLJK0nRUK3MkSXljG+d9?=
 =?us-ascii?Q?rHQK1hgtVBGiF3DcFFS4cN2/AMLbivloDrhtfA9seRnir4O/WCyrGaNEj5qe?=
 =?us-ascii?Q?+ozUfXNRPg0WcDakA8IHe615Mac7zlFoEUjVlaCVT5y0ANM/iEHT4Qk0BCod?=
 =?us-ascii?Q?XvawWIRIQYuvTr+vbVwwZkDsZd/oLl+n4dTMQmYpcM4s0pHczTjfKwPHy6Iz?=
 =?us-ascii?Q?zWwTEuyxxuV/NP1+wFoQ0SbCnWxZ8zCjAG/c49vosXppvxNdZSWj+OsuCETw?=
 =?us-ascii?Q?TCAXSRhOa0+AnbFE87X8qNZ6HEMLnh85KRfRKpggweqjQ6q6gTicgbGBVKMF?=
 =?us-ascii?Q?F7AOzNZBCQ26K3U3mVDCE9EwJIwMXcEOzoA0j7v5SpCMXq6gbzRHzipLVIlK?=
 =?us-ascii?Q?hXIJhCuGyNfeeToymaWxzqUKDzhdoJDMl/qfiq+r37V1p0iy/kfxj59Og0Lh?=
 =?us-ascii?Q?NCwUGfrraBqLhQ9fIi2PdNnXxTJfqFAvnjXT9stizUhN62izx96b3NrC0ktp?=
 =?us-ascii?Q?n7uH+ufVvOWFrWbfKbOp/M1tTeSUeeSjAe7FduND92BWc0Zz4kvWiZliwuI1?=
 =?us-ascii?Q?cT+9YRR0dNESrNDz0jlHBT4H1Gpz1Ps9QubIh0qtCPBn+J7HyxGsb6gj22B9?=
 =?us-ascii?Q?TkQzAN/a4/bBJQFzkv4KrCodZTh/wunaktQvaV16bsFaOKlDnkZqueIp8KC+?=
 =?us-ascii?Q?dmq8EoRUNsRL8nAgOMdeZdsT6ZRTOEvDFD/Bpzrja2NPHR6ySqDw0uq3YMS3?=
 =?us-ascii?Q?tNUCjbt0n6lDcfIos/43pbZQ6yufUrzEMn1SMxiB+OfRk3k5pblAeVM7dWxZ?=
 =?us-ascii?Q?T2Ur9pwu6Ao/ShFq658dYtPUHuLqZG07yeyjHx6UoYcN0u0ZLz0IVeyyN0c/?=
 =?us-ascii?Q?AxiAU4mkW9Xthyvp/WahkVCjLwzCu7SQEc1l76EgWpzcPGT3/FPrsO9N0TnJ?=
 =?us-ascii?Q?pZkoWsAYyqsYSX5gDeD2Qc0KLTd/XyGiRCKDgeX4XrFnzD5s7nEvJFmPXc0+?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfbc411-08df-4311-c8e3-08dba4ab86a7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:08:01.0254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmMm6SFuicjw/BJjuypk0F0urZ6Z/Lnjtx6I3A05WW/DdjK0LiUlgYhPlF/WQVNrS0k3OLrz+gq3/RwOXo75Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 14:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186664

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta-oe/recipes-multimedia/libopus/libopus_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb b/meta-oe/re=
cipes-multimedia/libopus/libopus_1.4.bb
index 200211774..65ee2435b 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
@@ -52,3 +52,5 @@ python () {
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+CVE_PRODUCT +=3D "opus-codec:opus"
--=20
2.41.0


