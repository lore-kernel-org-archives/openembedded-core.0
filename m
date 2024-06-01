Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2292BC25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 08:07:45 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.55])
 by mx.groups.io with SMTP id smtpd.web10.33335.1717229249081586077
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 01:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=QQb/zDo0;
 spf=pass (domain: outlook.com, ip: 40.92.73.55, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPhbNWk4cARreSC97y8ZDNK4z0xtY08C2ldM7TTj09k29QKZlURLR8ScS5+xmp9wzPTWJh0xm8Y3+QEG49kyFOoTsQDiLXz0JpqmPukZ+85uYuJJjRTL+HOA8lAhbl9DnKP+e5NAzEBoBDn+Gdo4ydohcjaPRoIUw2XJcFgLqdzQ3V6/SHo2i8Dqj8XOsUn7Zw0s0FU+PXEJRM/ieIQkAR5U+RnomaBytL8AdJo9OWTyqq2lGrG8mJFTeEEbWRz17oMecrEeg6SphuA3VkSkzuezsfXlkNdPJ8qHRcp2snhiH7f2jptIaYwZ/UsSKam++qpswWH6k4FP9m6gVPLhfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrvaCx6iCT/fmf+eFkou9v655bYgG+IDhX2FOZXrtGk=;
 b=iZP4vtHVRayfjTZvPLNDltJY+QJxZDuL/YEbSEgW3elC7Jsxpcq/yW8o3auudHPCEiwxDpmEn1zgc3vO11rDcwGEdJznT0a+DqGKzucuWc/PNoMu6cTCDcsMRaXOAYcgEbo8u5gHetTMn8zJ0lnuSKuOkI7dOnYfyoLkQ8M420MDlHNcf6DWTSHV6/L6Pbt5kBVy3k5QoWZb87YZ+4fvu8MUFXcbSTsdCBzTSCWEfgbnDs8hF+O+niYD9EyUKsu0Y0MbIspKUhoCuUZis416flW3eeXFQY6ABjWwTw344Vq1p+DwoO7xZ19LM09dgTMvV27hoafXiHoxM5zS2BzSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrvaCx6iCT/fmf+eFkou9v655bYgG+IDhX2FOZXrtGk=;
 b=QQb/zDo0HpzI/Qa8wqIqb1R66fTMY5LiOFtPA6+LGukONm6HaADJohXcf2okPgsu1dUdO7J1BnczRnXVwffQGMHKhKZmlwE4znBfKoC6mpIfJJFiv/dKZrW6q3obWgvY0Ocy7zaqlmZ/I6a8WABmKC6DoCJl0YYgHmtDOEJaXxRt3wlhkblglgszC30vBMsyu5e0rCNmZvdBCNA+04snRZj1O6iGWNPMdZS61T4l02tiYpULTyVJ8tSuBdWCxMejy3S62ZbNHzRa89DItfUNuJktEwPexR6l/KrT7MWK2pr6mndxkEn7ukdE4yausM2k7R0gEMwtNCF7k5iIYcp2kA==
Received: from PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23f::20)
 by PAWPR10MB7719.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:368::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Sat, 1 Jun
 2024 08:07:26 +0000
Received: from PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::102d:f539:7c01:f07d]) by PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::102d:f539:7c01:f07d%3]) with mapi id 15.20.7633.021; Sat, 1 Jun 2024
 08:07:26 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] insane: error out on UNPACKDIR = WORKDIR
Date: Sat,  1 Jun 2024 08:07:03 +0000
Message-ID: <PAXPR10MB55419F67875ED049CAA8DA88A8FD2@PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [IUrrTYFbcI5vRAlzWa+chS0as8qH3LxMPWFHoGY4kmOmCXPiteEHipHuFLbSPWZu]
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:23f::20)
X-Microsoft-Original-Message-ID: <20240601080703.305612-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR10MB5541:EE_|PAWPR10MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1062ac-5501-4db3-a79a-08dc8211dfeb
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info: 
	ScPSwCN4d14uvC6f9kUXGKLFFpk0pAsQG420a8UBdgvjwsSGAOs5zcwEjHh+o6HzbZwCxQTebtaUNCPQvhiW1WDDMgFKqjpHegZKLmntKaFM9WYzm6PoiEQED8MGC/O4TDWf9y79UBeAEl6JcUurexxXMcRxxbjcXlhln94dQuuJgfRtPSCwsmwQUOn7tu40DXP4N+pZ9qoN539HNTksxdrKhi4m+RCliEcwL9e09jkCKYdmsB454xKIpbTNO8wDQFYME8UoQYBwEq7e73HQWyjLxI9pw0qZ+iDROVDKaFKIEIWGgutI0KK5rZcTjnKXTuXC4QRxafA0H2P0Jgp5YPJlM1ryrQ7pMJ+UEjeQlC8JNNkubntKdz7u+37sNtT6LkuldBYtrd/TEn5KP96NYks/w5pMCQp7/laObDBXtUI/8CtBoRtiLvi9dMSqTKpe2X3ok1jyl056VV7qOS5spfRkHdGnWfPRCarInoPAIh/YqBkS15O6WLoVl5fKsKQDj2aU0to4f4tRTUyvE6TIH3Axfs6vBrBbDWE16GP4bCE+RZPOnR251hvdjOJyZ9gNr4ixCGJF2ETC0AtnscKZBsAH6hzqJX4wu84CdcWSzRJbZyomaS59kYmIF8DF3QSd
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KSCH99l7A3vQSuoxHqe2PrUMPe5iy9RlHed38lUWX1yygSX+LeYeTkxJ/IcM?=
 =?us-ascii?Q?M7cm50KbUQTlSU9aN6MT0fW2ce36cQOclJ79mwnn+MnKITiOcQI4Phyl4oH+?=
 =?us-ascii?Q?3dnhBm2VYK/o8yO98xCi8IBWFzVcR8r84StjwC6C/B4U8R3yrjOXD28nxKMT?=
 =?us-ascii?Q?vHenNgefaAjthplDcZJZxfJ6e1uIKnOQdOs4BQbTGrGieNtBu7scLSt8XI/g?=
 =?us-ascii?Q?mvDP+FYmw7+6EN8/8iUPmtcZ2YBltwHblNaGnVQrEbb85Lil8Pwbs7BQlG/D?=
 =?us-ascii?Q?yYEQvUVr9hvGxK6rjlTBuJe0u83zyyj0qHdMByroAPN5nCqw9qX/wwWotqxB?=
 =?us-ascii?Q?Zf+/28yqVVlnUukV/pdIwGJ8oyzJbhxbJ/c8PM+4KQ0mHcObvC2u5ulP46hY?=
 =?us-ascii?Q?KKBRpeuKMgebEKuhudoZuYabqoKuY8xekTFbpB2PCU2IOm6ccXLXMeAbEdA8?=
 =?us-ascii?Q?OumPXFBbibw0GLtJQ+1NwNWszGe7oTO79OPA+QlHunN3Ljs/C2mA0EbSne6R?=
 =?us-ascii?Q?v6jNkugHK19KBmMal0OWtNIxenHhvzODbWGgqsKDIL5YIbi6WHBNj4V0+tvW?=
 =?us-ascii?Q?jX6HQhM2ibpf2VSSpp1VQk6pazN4kHDzdUeXgIep/Gvz98moFhnlPiKMfykf?=
 =?us-ascii?Q?93Xb8AOcd7AICQp8/ju/YoRm1rYEW9cOJMjsbzBvP0OMzuobJjvxhBmGbsow?=
 =?us-ascii?Q?8ICpBhE8neh4Rvx9upRATQK/fLYvalB1TaxGEAyl5HlD/bbmsxhn2t4gviah?=
 =?us-ascii?Q?SZUkOZ/RqOE4e5G+MY1pdwEc/YOxTzkvHkmBxJovKpf5/+xlldmIJkBrPFbW?=
 =?us-ascii?Q?EJJJubtcHo6wNQVO5w4bfQp6B5jRJrBqwvZ+OERjOurbwQopjcpVw3Oj0E/1?=
 =?us-ascii?Q?8Yspe+PmX/yPK4vlVj8gy99+8smjMTgmTQl/waKUDnMQDKWaaO3HSawkZZuX?=
 =?us-ascii?Q?LQl8ZSJjB+HyZM/2ySR0KmTEqpQaH2B67du6gLiA6KHQmkV/TPiRC2fFXYNY?=
 =?us-ascii?Q?oZARR8arbO2suI2fqSvttEy37E3aSy+/4qSTi/zbdEmYAegrjhoiba6CgR53?=
 =?us-ascii?Q?2IO8SeQbWGPBaUhxmm7DkllRcKQk1OJeKj7YeZVng5h/DzTZL+CJSFwFMAda?=
 =?us-ascii?Q?zHvZRRx4qOTpi+Tb50ubeIxAn903SFghA3L8QSPv3WPxZe/2U9h925JAzQJ0?=
 =?us-ascii?Q?COYjQYciedOZRZEFtINeNFZLDnHZkgvD7+g/aVYmng/0nQ/NQRFheG+tnQ6I?=
 =?us-ascii?Q?IcNIjGso0J8dvqYtFdW4RuWW0hQ4BOLceNW48LnBZekCb4s/67rb5zDWMA+P?=
 =?us-ascii?Q?j64=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1062ac-5501-4db3-a79a-08dc8211dfeb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2024 08:07:26.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 08:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200094

as this will clear WORKDIR and create race conditions
across various handling tasks

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes-global/insane.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 99736830b9..32d3d7637a 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1605,10 +1605,13 @@ python () {
     sourcedir =3D d.getVar("S")
     builddir =3D d.getVar("B")
     workdir =3D d.getVar("WORKDIR")
+    unpackdir =3D d.getVar("UNPACKDIR")
     if sourcedir =3D=3D workdir:
         bb.fatal("Using S =3D ${WORKDIR} is no longer supported")
     if builddir =3D=3D workdir:
         bb.fatal("Using B =3D ${WORKDIR} is no longer supported")
+    if unpackdir =3D=3D workdir:
+        bb.fatal("Using UNPACKDIR =3D ${WORKDIR} is not supported")
     if sourcedir[-1] =3D=3D '/':
         bb.warn("Recipe %s sets S variable with trailing slash '%s', remov=
e it" % (d.getVar("PN"), d.getVar("S")))
     if builddir[-1] =3D=3D '/':
--=20
2.34.1


