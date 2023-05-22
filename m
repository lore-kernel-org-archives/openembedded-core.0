Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4C8C7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 12:01:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web10.20133.1684756875797497687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 05:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ZgMGvWNw;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.7.75, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn6CEeDmkp8BRdOsNqDOoNu1GzFSMEaJ5JiAW5VsraGXDnOhRKyu2oQLPWfoEpy+5G1W2vRr+wTCQNyQnMAwscwO513TX/TB8bqkK9xzSWcYTlIZ6bndur6VW2N8odv6tr6oNnrbaOOBe8DttDc53IOPX2ANVDPYp2mHmVadgo+1UNWBg52GjlyY1MyArTeiaYK2w4W5bcsqw2RH8TK7uPwbrmXsPWmCDhaQrZW007itI3eIFhYO7cKyA0e52qXxs2L3GIuDZsdeoYyd9JftgRF9+/cpBi9rxmcTqIoJuKXAzQDwvCWXHHOCyaaLTvG6x6eIaiQeS0P9kguu9Axu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlaQjyPMgDrW48CxyX96mPc4uIosiICEi9Rgpga3a3I=;
 b=DovgUzC8HETkOUlHzTD6tZDA0htA86umO0DrV24c4g6IiQqseaB5hCydhbPQCwmfVve+Ln9xlPIfv/10vtzAWGjYxRslyCLCyyHgLHj4oljyzpUaPchvszrZWzllMRWaPh0klzFUOoUvPio2RZljz7kOrJsqet67Mdx7BuzrzDH3pFeGv+5Y/r0pBy5tJnB/jr8SB9CkoRRxaZJHd8zsiGwobGSAKGyOSSOxVX61Ep+CeIj5ktKGCXJqv3skBrZmuGlOyKfDkQ2Vt3kbdzHoFvH1X5LVUYfU105DmaOhj9CscYTzq+z4g3Dxq5k6CLUbl+DfQmBgHW3e4oufS+zJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlaQjyPMgDrW48CxyX96mPc4uIosiICEi9Rgpga3a3I=;
 b=ZgMGvWNwKE0soVm5mdRPSU9r7Wcph3LwoQWP0UGWq5I8epEapFvkUwfaKaJf0kIBDm70UxXOet8rICs8uNkQ8CjtqsFm4d5kIDcTe3HqFJrqRSR1J7zm5zQfq89JLlqcVFkPSVWlYRTIuYdg9n1fR9IlSRxbrIq8EPI13OP2CjLd8fdfvGqjJukDJEwzGImESyFLWLI8/E9xFMnTkM4lXhShyd0nEfQ1hWz/N3bwxUaL39KeqEDVVOZ+mIzVzOH/DyS9ecahuwVVc2lyudpCWmEifFdRh1frcidob1i99rifUyy+OZA62xsAw3aQWWQRdwNXzkBUal4A7RDRdYM0Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by DU2PR06MB8350.eurprd06.prod.outlook.com (2603:10a6:10:2e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:01:12 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::b4e7:5ac:7c48:4533]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::b4e7:5ac:7c48:4533%3]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 12:01:11 +0000
From: eero.aaltonen@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Eero Aaltonen <eero.aaltonen@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][kirkstone][PATCH] avahi: fix D-Bus introspection
Date: Mon, 22 May 2023 14:59:57 +0300
Message-ID: <20230522115957.1320683-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0055.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::27) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|DU2PR06MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e8865a-b409-48a7-7287-08db5abc3c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GI3x7Q+6wsGUKdLiWkaIJYF4F8sCR6az+C+ARFjDSEioXr+THEvbP22foaB5a/tCh0RRIcrOuYJbT3Fdt74+knbDxPji4SI5vonQPIpznyOfjk1lvl+YxuwoaXtdTuBKtW1T2cHgVvWVikvVwjxMOv8N4FIOhsDAow/WNfYzulGHafLfQMFwXuLl4DmaDGk6L/GHkMdmKg5hAzY4OtBONThed69X8cqg7uvnyD/8qLeBI+sruA1hYQvTt372GZHXUM9pyHycO9voInQHaYw/RtxeRgDwZfZE0+UGQ05sovAlfEBQRwCladqhtwx8qCoMTBF5vIbXtZ/0ZaphULtvU6Y9Y0wLVJZonACskWGgWML1abf/BS2YBQNwcJqR4Dj/IiFjNaOJAmW0EZ15dRCbk5/LKw4ys02K660f1yKfBWRqgvq+6zCynpN+40BCfz3IFLIpU/+/wmWQTe4MciGbd/YCNdysTj97uuXjILWKJhtEf8bvgAZ0tjT0Rc+MCL/z85mi8Z4QpxDStGVkgacub2I9eNRmGdY9bZ2n9FcTdQrioiWwEnukgUOqLVQmey9WZL5cM2dN5rj90wBEdyOxePl7AuVq9m4myTXBpUwVHrpHEjXtce4GhlkipZ2zba3m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(136003)(376002)(39850400004)(451199021)(2906002)(5660300002)(83380400001)(8676002)(8936002)(41300700001)(66946007)(66476007)(4326008)(66556008)(6916009)(54906003)(316002)(36756003)(6666004)(6486002)(478600001)(52116002)(2616005)(9686003)(6512007)(6506007)(1076003)(26005)(86362001)(186003)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wNoOoLGqcV0KtXwhK7iZNM98C6gdJe3jQB2siRGLH2axJy7+0O7QzuZWhp8p?=
 =?us-ascii?Q?4glubMkd353+vU+2a0XS45MPHgpS4ZRMHGmHO9duC7efFpgNowSg0QsKpIz3?=
 =?us-ascii?Q?Dr81R3D4mn9wPwQGGmIhx5cpsSmyN0MrTxEP8KLF84YeX/znig0umRDwqgxc?=
 =?us-ascii?Q?4ndJsA/JtKf3vZnU4tVFfR+E1UJSGVsI0tVO4R7yNSxBuYd3Ip2KRi/xNvGs?=
 =?us-ascii?Q?HzQHG9nfG1YbiwITs7iuISeDOA2MMstVZAoir2UAkc048AZpZkT2fI4Im6A/?=
 =?us-ascii?Q?Ngp/S5MXyFxKH8Bw9oAI3d8jDgFh9myByg0yRxNVgVRHCU/ykdme7cIIO+vt?=
 =?us-ascii?Q?8HgiAj/27+/PGb/buGcJC2kE4UGcbYoiYDqLVnlLspP+dJLy96nDE5Pc3A4S?=
 =?us-ascii?Q?3F5s9zPnnPeQYdiobehgExBBG14kHfpDzUmP0rHgBwRWPEWT555cyOvE9mCd?=
 =?us-ascii?Q?i9cYXin7f63ArSI5JbxrCHYwC1wbA4OVgTF4FUwTrzCpNYZCaD6U4RCq/tBl?=
 =?us-ascii?Q?UpomzyScYWYTpHcv+ZJdYun6nICI+tOi0kR0Rez2k+sM3ok9OwpMxrZacMnA?=
 =?us-ascii?Q?aUFL3eYRtsbs2dloHzskpTohg6dwgOsoy5wliMg1KB7dqBf4MhfXGG5IEpee?=
 =?us-ascii?Q?CcyPUTnwedzTI0iCXOZ/jk91HmrL1XDMmCRTxX53S1igQhEPnAcE3kPBBkHj?=
 =?us-ascii?Q?E/uIM+K/Ex2L0lOFxhUKl53mEZtnFq+hPrAGywmNm1r94JleIG51Ba38vykd?=
 =?us-ascii?Q?gI9e/dcjprh/ye/E3Cda7Wytxb2ooiOs9iMU0lgFOzE4ka2Qkxouxgr+KqoD?=
 =?us-ascii?Q?+UbqWuzKAbU7E8GJO/RUGahorZ7DpgbyTAsMBNeoGAdqbti4gP0eJVkE9ePL?=
 =?us-ascii?Q?jWf92ek5KmsQDtJun1ghI7Fs92Dkk3D0Z3t31F0LeAhlhtxWY38dJ9/tZ6oj?=
 =?us-ascii?Q?C5JnBF0UYypa6EdhnqWT0L5cSx/ntOrqm9QpFxnxVv1MPIipHh/gFD+xkDyb?=
 =?us-ascii?Q?pcy6gNlKMgUhJ1FzLYOSYfuSL9QnCcU5Hg9bCGhGe0kPDavH2bqOVoKNC+vP?=
 =?us-ascii?Q?GUyRW62ejF4pbRN64aIPt4WgkW/avBf19jRevhOSg4Umdw+B1IQ2uRUvZ4jp?=
 =?us-ascii?Q?dQAiRlhK3lmg7noBz3QoTJqcQKn5l2AGr2cQT+Gyvwmrdxfu7ZuZYgzCXh2z?=
 =?us-ascii?Q?RRB0hJo9juxOZOceupOxdVVYtuX66RF/Hf5KXjb4Wf32V0AlbbDBXPxcQrSL?=
 =?us-ascii?Q?vBTDo652ssRYZ1Ya0FirK3roxSqIGM/8PVMeiFE60eTIMpCNqpMaWcu9LT0s?=
 =?us-ascii?Q?XMlG+OBqxp9UNt1eJaXI3L+Pa92jh2rl79Ho3ZVKSmhxbcMe4L41jeEOKsU2?=
 =?us-ascii?Q?vxKieCJJZ+HAUk3BAm6TbiMfeMu6DskujgwSuEn+oW0VrX6ktWiincIhnEVC?=
 =?us-ascii?Q?wQmzLsewN91dLKZo4Hoz9iESywH3l8I8AqFKQyURtnkk5wOMLzPoYJjMOX5N?=
 =?us-ascii?Q?Wc4xTCiPy9qf/SMgeYHs57Yd+J/Vyr9xNf/jFnvxNc+d8aoj6KUA5GVkTkK9?=
 =?us-ascii?Q?+CVxGW+l/sUJBmEhVMAuxNLfOBCJotvugh4p31JGENeHnE6hIE/5c5jkPMAl?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e8865a-b409-48a7-7287-08db5abc3c68
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 12:01:11.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKQBtuUEwqqwCsnwQgZhfgnPqaEqU+1Q+4HGXHinrJ/9z/5Lrw0bcdmkGVfRX4VKJwiv+vXEbI/jbRGROnBwiYBOlHskIMRqjYVSpWtporg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR06MB8350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 12:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181593

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

Install and package the D-Bus introspection files.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b8183ad25af3bcf23f04dd649b6ef665569fac8c)
Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index 9bb5e5861e..b5c966c102 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -83,7 +83,6 @@ RRECOMMENDS:${PN}:append:libc-glibc =3D " libnss-mdns"
 do_install() {
 	autotools_do_install
 	rm -rf ${D}/run
-	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${d=
atadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
=20
@@ -135,7 +134,7 @@ FILES:avahi-daemon =3D "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/services \
                       ${sysconfdir}/dbus-1 \
                       ${sysconfdir}/init.d/avahi-daemon \
-                      ${datadir}/avahi/introspection/*.introspect \
+                      ${datadir}/dbus-1/interfaces \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
                       ${datadir}/dbus-1/system-services"
--=20
2.25.1


