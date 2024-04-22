Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8A7C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 14:50:53 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.67])
 by mx.groups.io with SMTP id smtpd.web10.20177.1713796776795601868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 07:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cnhind.onmicrosoft.com header.s=selector2-cnhind-onmicrosoft-com header.b=rl4RU1bf;
 spf=pass (domain: cnh.com, ip: 40.107.241.67, mailfrom: joseph.mills@cnh.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvhk42E06CIAO+fd/z9cWQb7QwhaLCy5fz6awhfNHJLKCSjeqKu3LzlL8he5bs+sCG6Xe5h2WaMII1z18FkbeWwIwJldC6WoevYmdR/6izRNFMLWf9K277h8nUlVmHPlM4/jkFBne3Qwjf6cupOoQCcMCTqVzYG3n4QUwJYMhsSFMnzcJh6LYCqLWaUBvT/PhP1n11aksAObNa4gE1f8YRUMLiE7bCAZwahr+MSsQ9zwiAYbP4PnR4Npb/2W8EwktdAWSSWwpk89oAjaxXK1M9fMmz3UJqZpsCE8nEKMa4JGx3xTvg8Y6L6ZAKygSivUPwdCnW9d0ZZyciPq2C6jkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQfP9gK8xb3YIBtQunZU2w4t1eoy1FIUi9j8RJaLlw4=;
 b=Xe1F/MldOUaVHNjeKI6JMbtAKjFqXB0FV5Ysgnxnb0v2TuIRNiuPX7ZR+NNg5d22nSTUPKXxZKTkPCTvNYYnirOKbDR5bmmbmbmtIjOPMHuHUz2qQTmyqm19NFdLKvfeqc8dBqlqO9MykiZ989Xj6YUQqrRkigNtBJDzT/pQA5nGdh2mF4ErMuMnFDadco1zefqzgTdsa91tYbB4eeGuSAPboWz7rPIw3N2NKvk6irturc/eqocWGDZesmb0+ia8NMeeqliCtmlH7hbvE1MQg10uAxpWxEn5ZECmujvSe7ybno0UObHWcdI8OR/9w1RHgcBZLZVnDJRFQx3Udi0BLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cnh.com; dmarc=pass action=none header.from=cnhind.com;
 dkim=pass header.d=cnhind.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cnhind.onmicrosoft.com; s=selector2-cnhind-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQfP9gK8xb3YIBtQunZU2w4t1eoy1FIUi9j8RJaLlw4=;
 b=rl4RU1bfp0V2z912JoPBh2STMyUDEawNtC4k/YCJ0JNJgMBwFpx4JdoYr33YhZNYC5oxpMc9m/E2xUNE0++3GOZZZbu1qaAdrWwUOjzmxp315wq0Ae5jSKmna9I99aMlA2cMt3EFTWHKHYbAPgfEIP1uD/+9+rEmFx0Udgu37Ko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cnhind.com;
Received: from AS1PR08MB7451.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::16)
 by GVXPR08MB10452.eurprd08.prod.outlook.com (2603:10a6:150:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 14:39:34 +0000
Received: from AS1PR08MB7451.eurprd08.prod.outlook.com
 ([fe80::f02a:a421:d05b:48cf]) by AS1PR08MB7451.eurprd08.prod.outlook.com
 ([fe80::f02a:a421:d05b:48cf%4]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 14:39:34 +0000
From: "Joseph Mills" <joseph.mills@cnhind.com>
To: openembedded-core@lists.openembedded.org
CC: Joseph Mills <joseph.mills@cnhind.com>
Subject: [PATCH 1/1] [mesa] Update do_install as needed per upstream changes
Date: Mon, 22 Apr 2024 09:39:21 -0500
Message-ID: <20240422143921.3187890-2-joseph.mills@cnhind.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422143921.3187890-1-joseph.mills@cnhind.com>
References: <20240422143921.3187890-1-joseph.mills@cnhind.com>
X-ClientProxiedBy: SA1P222CA0080.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::17) To AS1PR08MB7451.eurprd08.prod.outlook.com
 (2603:10a6:20b:4dd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR08MB7451:EE_|GVXPR08MB10452:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b91438d-fed3-42ee-ec57-08dc62da0729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t1p0kiYpd5CzSY2Xoz0px+d6NDqxUJAVIr5KxSDsEuPmEbzDqVOSWhuKuvlC?=
 =?us-ascii?Q?RyBR2l9U6r7BiWru4QqoRjgBJcWYRMtfpjO34AHyBGtGisM1FntINcQDj6bI?=
 =?us-ascii?Q?usyb4uF5Nh/AKR75fyQyk9PRa53ZUBni/wrVgFOckJAHOChDrdQvcF8M+yeq?=
 =?us-ascii?Q?abTXCuu1zILdfBW0YvS3fq1nk+IrS4ZSsSdPnarTx4bTL/Nvm1htrtxBPny+?=
 =?us-ascii?Q?qRXG/oMi1MvbYnPA2kt0niMWee2dcde17kOZJzY40ycNUY+odbkulL/w0GqT?=
 =?us-ascii?Q?Zt7AwpsMw0OOLNk66OhoZ31WTLlfuDXEpcZNVthjOLwFJTrT3Xl1sMCML3A4?=
 =?us-ascii?Q?zoiyUVdQagyCNLJH7WLGu0vMIhOWRTpxPSO/7wtCIE9OwXhbgPN5cwXCUQsH?=
 =?us-ascii?Q?HlvUStJm5e5Za3W97fCi/tTmHhlGC/zY/lMtsJIwuAOBCq+Hhok2BN+d2zWI?=
 =?us-ascii?Q?qKsVkGYC3y9dzB8i7rDGeytUhxLjgmutj6rxe3kVxjE//5vb27/7iZLnXtjX?=
 =?us-ascii?Q?EBydBO9mN37BMy0SbciZJrU5quBC27HLOVo0ew5awYOe3b6ThnS/a8ceWtqt?=
 =?us-ascii?Q?rPTwz+b3rElKpnqOAwFJbXqe1ZapqsL+Bufec5D9jvrkp6TPOuiZhyk5vQGw?=
 =?us-ascii?Q?yLXW+99dFa3LyTZ5xDJpQ0EOTRw038iIwi1bFxvzLGhkz6bIS8sfWWlN7wuy?=
 =?us-ascii?Q?9sfz9Z3fPCzdaK+oWN+2YctaK3dzAyV83QCjAEDvRX2iFEevImrT1NdrLrLU?=
 =?us-ascii?Q?KGaXeeeEv8XtUDPbPxUzJ3WMAdbvh9vBBkgdca8LKOD+8Ybj8HKRpXTWGiRT?=
 =?us-ascii?Q?0O4nJ4rvOCV099GwYbqtOKi29G59Vv7viLs5GZkqtq/zZ4bjxkznc1tvS7P5?=
 =?us-ascii?Q?ZgYd4yZhr8d5zY4WGcsBgVwrGHfhJGZh9FVfXAOcLth8LcGdWFGIc/f5PJL5?=
 =?us-ascii?Q?OerIaaV4HYVSJaYEfiV0HMNzera4fJXVrI7du4Y7er87Eh4VvtZwNyHEumkj?=
 =?us-ascii?Q?RyHtfv8tau1/GzchAInG4/W3w44jlyFBtZbNug9KrcojxzOLc+YPWGWGdQUz?=
 =?us-ascii?Q?GpDe+vG6QR5XcAuN3ZRUz1MZRBQZc6BTAAflVmo9lHsmQ3QHRo6No4yuWEFD?=
 =?us-ascii?Q?u+h5nwcn85honO0RgNw8M9KzR/C8oAWaEjcRhz3fc/96Rf5J6Zz/HJ3BFe//?=
 =?us-ascii?Q?3xC07KRIORxwDZLCpmggWRGgJs0VdhMr7aN4Hj1kPeUvqTkNrM5kvhvNArBf?=
 =?us-ascii?Q?i8XetxLJp9Uaxd3A/A0NQJN3f5icxq1Jo2UQ6QcAhvJZwSmPfMaoMdlatQkN?=
 =?us-ascii?Q?rBixcoGCWJP/WeZ8+JCsumdZ4lADoRAaYUKw6HJ88+Eqzw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR08MB7451.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Utgf10I2TqIgqZwry66ATBNWmLE3HvreDbfSn3jkPgdmbM8I+UYskGPXnBZ6?=
 =?us-ascii?Q?AqjoCS+qXPB4et92anZ56AGcmSnzEdleKowuoKOay3tZamMbyY/+CVhF+iZL?=
 =?us-ascii?Q?Y+XiBMe5u2y/Ko08nC6ZqRZe3QsotjGw1T6m0cuQfXu1mUqvqnxpoufhpMjt?=
 =?us-ascii?Q?iQ8eKOnLsOJyoOa9cA1xO712ZfUrsPUMQivYvleAMdpCUTcWBX4mSlPZDTbx?=
 =?us-ascii?Q?+wItxH6uljYa3hxT92PUWHiK8kMdDNaAnQpgLgC3g+bpbYRjM1jf2SWm+LDu?=
 =?us-ascii?Q?o6mBj69QLrsCTV0AS24DE+cvM0DhWnLi1UoQEuUYd1ZWk5/6bELy/34SswA/?=
 =?us-ascii?Q?eJcUw2txMMiC7pdZk6qr6mvK5bxOZrQlxdLmEEOEjYuSnVtjlcV4RHt46gk0?=
 =?us-ascii?Q?l8k+q+JL7AsPkatf2lLCEDW44aVnxbhy9SDTLVu+xolFmHtj6szatkYgCDnn?=
 =?us-ascii?Q?UAefIze9tiUrLpBuEGxdblvy9CIkCBg61QNxwmOIcmHX6HDmC5qmXte/Gzsc?=
 =?us-ascii?Q?2F6XaBywQnMfdPIi3aJ9/5DJU93ZK1/dVFhehhAHGXvrdofWE7qQBFJtJ0dw?=
 =?us-ascii?Q?PCvkjuuil8AItpPRslRpjlxLjbX8HGVuqXtmz2nmk7I3mesMZw+MBOYBme4f?=
 =?us-ascii?Q?3DuN2AHQ77pRRXFuoDodN8kLz/gURQTQeGbYa8Qtj40YFffNXm1p6bAf7IfY?=
 =?us-ascii?Q?wJGY56akBEshnH6+cUen7YAAX86LY+avnC0vmtsOJvaOazEmgc0u7Df4z043?=
 =?us-ascii?Q?D9uxJjjEao8xFOMZB23TMlisMWjLsgCoQS2G6hIosKBKALJMn6V43gbSoCMe?=
 =?us-ascii?Q?5YsyPchL/PicE7s0MFXt/HHbnWhx1+8b4BNZhE1lSaoTAlBbqrgJLopEknjr?=
 =?us-ascii?Q?l8dKbcKhNq3HCPy3jurKurwcS16rwWWg5Pq4qqOj+ebwHB61Gke9fouhWirY?=
 =?us-ascii?Q?Lmu14NLPzjMYs/f2sfpSpO0IwaPNpiajZ+ubsWweNPiheg12n+ZhjKTSLEEC?=
 =?us-ascii?Q?aFUPYU2ffwWjEhAVxjo/9gBibnDUncdTCPDf7OvNM4fUSOUYz50iSsIgyisu?=
 =?us-ascii?Q?v8CMIe7fdvXIyyDRty7Yl/e0rr83gI2f/C15zOCseic4PeH9Et103ilYFEFG?=
 =?us-ascii?Q?mwaH5U/2c4J4t9jwJiq47PzFIYOBykLCY7JxJgEh8LJn6zJU/h5eSwKWRIlP?=
 =?us-ascii?Q?gdO8eMGSswCcnwHE8q5vXp/uU52dvBjlqHdzvoayaN6mZbqEj4AjEJnDAjnC?=
 =?us-ascii?Q?EiKGGnO/zPPZfMbZ+ki+p/7pI+FSlUPOqqpyGCO5YMVwNeS5jymnm3JN0S2e?=
 =?us-ascii?Q?6k/rmXHSlcKorfSF+ogyCtqfjqNZl5r78oDntHcm2WKyybJzQVfAcLNL2bB9?=
 =?us-ascii?Q?Te3vqy9tx6L0f12VcahBthDUlYqmaKmotlkqcyH/KTdPRJuJO3jNiiTtMiwb?=
 =?us-ascii?Q?/x466GwC/p4ZCQgB9+E2ZSgAoP8zNwElWiuzX56rvKcZfFDt5YFcTlfkGaNk?=
 =?us-ascii?Q?TIa3r/VKlCNSwVr/9z9vdLvlIHS6qE0NMEu26l6eMY1TRHq8veLLNtdHzB47?=
 =?us-ascii?Q?IaWyb4CVspxrL+akmSSOj5nvTFCtVHUZBRd8Ji/01XUAtiYAMP8JAIQshGz6?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: cnhind.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b91438d-fed3-42ee-ec57-08dc62da0729
X-MS-Exchange-CrossTenant-AuthSource: AS1PR08MB7451.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 14:39:34.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79310fb0-d39b-486b-b77b-25f3e0c82a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD7coFjd0VwhjB0lwHTAf9RrxmjOqpqlyOpXkQXzK19/jcveiOlTqpFPDd4zTau4bHeCWTMaGZgEN6ZP91Jjzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10452
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 14:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198591

Signed-off-by: Joseph Mills <joseph.mills@cnhind.com>

Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 6e96190084..f4fcf31df0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -27,12 +27,12 @@ SRC_URI[sha256sum] =3D "94e28a8edad06d8ed2b83eb53f253b9=
eb5aa62c3080f939702e1b3039b
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
 #because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+#make eglplatform.h independent of USE_X11
 do_install:append() {
   # sed can't find EGL/eglplatform.h as it doesn't get installed when glvn=
d enabled.
   # So, check if EGL/eglplatform.h exists before running sed.
   if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && =
[ -f ${D}${includedir}/EGL/eglplatform.h ]; then
-      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif =
defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGE=
CONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+      sed -i -e 's/^#elif defined(USE_X11)$/#elif ${@bb.utils.contains('PA=
CKAGECONFIG', 'x11', '1', '0', d)}/' ${D}${includedir}/EGL/eglplatform.h
   fi
 }
=20
--=20
2.43.0


