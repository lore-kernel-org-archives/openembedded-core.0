Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B84CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 11:09:38 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.137])
 by mx.groups.io with SMTP id smtpd.web10.36227.1725275375343850761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 04:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=IGVYMkux;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.137, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POmku58HAAxVrUWMxPkzONNdpRKsEtuu916jy4W2c0rczySKyIg9l9Q9TZ1h4auaKLkVyn3yx5WnPekjWVAVFjCwO0yJkYzQW6gOmPJ0T8QDa8OH3owl8oY1RfZhh21pfupIIFeVffcdbeb5xXnKKLAiAHnYlMd+qJHcSTMXNK71ACC/9t0nCjibrYYOhic0FxU9mnWGleu3i1eFqyG0wyZZrrQ6HYcUuHDUuEuFY3CR8Lqnw1x0yraPi9oag+bz6HOjAmTRSklmy+am4uo62TTg5PCdbDmTighVcIRjDCeoywpRQipdJxm9Ut0QpDF2X8O1/IWDOvobueKDm/cszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soR65Iv+sXXyRh6AWYfww11l38q4Q7WuT+cegg1WPrg=;
 b=PguxguYtCA/M3dDI5yF12BwtnxEsa1zPqPobiekkQybFIfdOOWGqmBHTb4Dy1xkuiKlI5OVXxlCJX6WykJ0nlG8LsQ4Tp/QXv2ZciTcBtjUXbhWZC4eMtmEOAEjiKPOiwRDaOz2wuuA2KreGZRjC/y/i4HpC8m6uz77jDkUTORPIihtsCY9ccX+NuMpizBO+Z/Fgh5NWoocID7YWJNOKNyppOHpN2oWYFyyrxyK/cGv4wiCSJ2F++ai/ozShTS1fFdVLEs6L7XMQvAQM+Qw0OLjHNZnnkqM33xzRZTUK1uc9hkAxl8I0EjcfUxF8d6SaiQO42SNJi2G1tAo1uHJfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soR65Iv+sXXyRh6AWYfww11l38q4Q7WuT+cegg1WPrg=;
 b=IGVYMkuxB8jWoRcUwsaZdXqIUFnOqtV9WKQYefQXcnV7/cHy0fsqpHGL6JI+o1ZMRgzW8C2R04TG/EIwKnMNnfEbCNb+7WNIJn9/4T+4KRuO7NMuVkVu4ruowsCUh7HS2T28rsWxFomyXcI4sFU0h9NVjWsy07FStZI6X/WhUPhw5Swg9Ju8SOblZ6YWBEQKG2uRicRL1TF0NUs03Xd1Fpo3uTDk5NF8KfCfHB/eFNRfucRLs3IzykRSSS5fgk4xkW+ITSjdAcjkUggL5fEqotLEc9o4munNRpdNfk7k2oAU/etETNYbJfNNASfb9aljrxeeVYu7YKkqJS/KBI1SYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7648.eurprd06.prod.outlook.com (2603:10a6:102:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 11:09:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 11:09:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] dejagnu: Fix LICENSE
Date: Mon,  2 Sep 2024 11:09:12 +0000
Message-ID: <20240902110912.2624917-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0040.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::14) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: c422870f-e446-4368-137f-08dccb3fb863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qMvhb06OsoQ1yntV1ShNhDe2fDlYH6xqtud7bTQpTDxellNAsHT9upvgT0mU?=
 =?us-ascii?Q?P9QQUk99SRf1KZhz+uCBwPLEkR3VrjJR05bMfl7rpSYq+n5LAEA3us/DfV7o?=
 =?us-ascii?Q?JQEKFvyugZgV1Utjj+h+DWZIMxnykAkvZTq5e+vvE/Rv0xE/6UsqMW1AHRTm?=
 =?us-ascii?Q?ohUmLBnnTgruXkSyXTw75pRrJxkF3qWYIjpS45wScp2LNYFT+ZwNr+I1z8vp?=
 =?us-ascii?Q?I5lSmz7rmsslhI4aR9asXzf4PvAwtnsMe5/IUdmVWs5CC/pdeRwMMBTnXVPB?=
 =?us-ascii?Q?4Guor9zJo22O9CIBeG6xmbx2TGGZiYX4vpYDmkiCI7QByofRTZ+s3xYt5ADM?=
 =?us-ascii?Q?98k1gIsA+mFcvSk3MjTqau1yU3Ca1s+emv+ckhDtFWn6tdEhMoaVeGVENFSX?=
 =?us-ascii?Q?w9jSymc5qLC6r7bXjEn08qNtjxfpvUyuIrfeUNdDrj4HNtSeoVXG2ZOOJLDZ?=
 =?us-ascii?Q?Vzm8P8LJBRXqy1fmP5kXe3as62f8Qo6MfGIzNASPXNsgaMuSk+/qgK4C+2JW?=
 =?us-ascii?Q?5JTjhn7p1/GhgSWrhnmYCC/JNSoYnGvfwUYkHilEKruzPbMEDd62Of6aGvQw?=
 =?us-ascii?Q?+gPnsjBMvaKg9YmObRug2u20fY3DIyylqNk3lKZHhR91UbkM8Fsn9+qtdVpK?=
 =?us-ascii?Q?36G6QBSkGMM8gWVIbkXcmhYU/Fk1nmC/qr05vjqgz0/l9K66a4LQJG/nLKOM?=
 =?us-ascii?Q?cMfKBhe7uiT3zGqevvKi6X4v0TpHRXImh8w/2l6QwPOyy+hiyIBa1fhcDZLw?=
 =?us-ascii?Q?GJebg667Hij458nZZnnRNytHHNdssDkAq3Gyv/+C2Mh8OWh++zlhYHJ28Vaf?=
 =?us-ascii?Q?fS6Zpnz2X5Fe5GzQV1YtlVpVSwuGpoHckWkU7BLJQLpjs8/c7ZspYw8vxlxX?=
 =?us-ascii?Q?5w7hxr/rUMoAErJmEY5beyjNV5hbru8OKunYt202zXoO4Wyef7COIfjEWamM?=
 =?us-ascii?Q?Vacxp8m98HcPQdDkkDz3fJ88hBQiY88GnqaYB+18uC8A5ntzG5rCxcvoBjke?=
 =?us-ascii?Q?oZXwH4ol1QBBGS7w9VcV2zrT4cepBhq+RK3GGBRNZLQ/iOApXUGnqiL3csFD?=
 =?us-ascii?Q?avtRCrCc4AFztJKMRtd/HQB9eU0yJ0ZZdQ96l2SurGHp3FNBqfZWxk3V4T94?=
 =?us-ascii?Q?l+VDtF04amgziRsCVBsjGbFCKVn80i6wnHGhJj+hdWRGYw9SmvmHkM4YEdQ3?=
 =?us-ascii?Q?z5wtF+OFkjXdpUdKGHa3NexQPumqjIbWyC3Idy2yOINT0W6QhfIDciIHK+1T?=
 =?us-ascii?Q?bMDAoiX/0amNXSadERmn8lMwQeUUWK2UsqU/0MqkMbfbaAqnBT+/LLzDz++O?=
 =?us-ascii?Q?i5vQZR997sQjGPRAVxBoMsqze0KyizO9+aRUt8MlmBArsg4pJY3k/EuL539U?=
 =?us-ascii?Q?poOdrlg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fNDHtHyTUPmCRFGuf1dZ8Rj/IjTrKpCz+Ig9dJh//KD/stltWCfPsk42Xd1c?=
 =?us-ascii?Q?K/wgx4fgVNiqTkv67MyfyO3nQYBSWXYDCQqpePACoVNDnvN5A2XLtGNHcCk+?=
 =?us-ascii?Q?pe3/rmu3+k6l/OvfTcwL3zBmk8kSYHY+8jeTWncrigpLPKsJ3GG9kQerP89Z?=
 =?us-ascii?Q?lQc6gOAbmzakEg4R1nw1VMsSID2QiYNsYZysVUjmc4x+OpvxzW31cAXhdwg9?=
 =?us-ascii?Q?hzMktgN5qcoCEQoUu6miEmsHUkSpR9MqD94VYo2wBlBUINj1WNVvZztn0htG?=
 =?us-ascii?Q?qQipfnYwO2aL6QvMVMafWUNw35fip54zIk4qqlykStsKznoz1WYXFame3br4?=
 =?us-ascii?Q?xFO8sbRSVPP/4zEcyTBQope5ZgqmparSJIqc0+APje/wOGsTGla1QFvHBNcT?=
 =?us-ascii?Q?TOZb2ZizwVN7pZLx2V33NY+pI1rGJamIUPT8JJir106WclUF0kJ7qjPHHD51?=
 =?us-ascii?Q?pRb9GBEBvTs/CT9PhuGARH3fE/4z8Dz7Q4+zsYxdN8USLsJkqtJCi9Dpwwtb?=
 =?us-ascii?Q?hbSfw2jX92SmAR7S/W4TMuqNkUUp8xzwUz1ae5WW5nb+CGR280PoIjzkX/4r?=
 =?us-ascii?Q?o2/4ZPQHcIn9CnS7UBSyevsxhqUlNfiHjRUHiA+GYDFrdoJprrk4NrUqAGNM?=
 =?us-ascii?Q?0xvXMymXh4shCBL46mMP9C81aaPJ8PWOwZF7bRKLALe6bwO39PYAN5RYagqk?=
 =?us-ascii?Q?GUZephrPfoKdyqPElc2LZweKyns5h3qzEYUXsCY0hfgZSAsRvqcID/YDGMeU?=
 =?us-ascii?Q?M9jTtUlBS1anbXFLhUpRuhr/FuCzeyAaJzwgOHH+C5NDmXwTXvA5eZG1Ki8z?=
 =?us-ascii?Q?HWAgQiQ+hKiSVuMTTexVYRvjHbH+OaLzRFUIkbBICjJGwA46tg71/cMrQngE?=
 =?us-ascii?Q?XnXx1tRUv2P2TIK+UtTWUy5cpJpt6OvZ+5FemBCoh44SXReQEz6DhHTuuRPP?=
 =?us-ascii?Q?pT56wdF2UgZLICJrtuqJWxkkjXMo3oyY+xB9yixMzDxgW/CnpicvNimkqEKr?=
 =?us-ascii?Q?fx3gbRLF64QXYMWCg5ukkwEsi5r00Jn+bKJkqdc+s51S5Af1FV6WP0Ziw1mg?=
 =?us-ascii?Q?iLoSo1PquVO9edH/TmIU9mvpAfZV9CDE33JNfZ/qhSPcJHVZKAaN0Y6+qakV?=
 =?us-ascii?Q?PngTtMq8P6BphejuJRvJbvr9fhHuY82e/2MrtaW43yMMvL+Hkj80ATWHAr2v?=
 =?us-ascii?Q?Te53KT+UkfBtNPiUbD9S1jvmWXKVbQhBtktJzDilPY7iPLWBYDXwd99ZPHRa?=
 =?us-ascii?Q?2H9s5AAiy2K+W4GRoafgkZbplIISFal3LVtGiJMwCJtSJUpYrLK0R93Vu3XY?=
 =?us-ascii?Q?mKLAbk4bSvqMzsCDJAZSLrIV970UClyE3ynKb8l3xaKsJ+aeq9brgNWVhfbV?=
 =?us-ascii?Q?WCFGSvZSvWJJUvuXGieZ+evVvJ/Ugj4cI2F12Z7Q/Cv4WEZjvNzN5WNAixc+?=
 =?us-ascii?Q?/BI6fmEbRIyExpuqiuEzKc2R5Un4Q5RvXZBsZMIMuScPjcT4Jwf7VBimmWd8?=
 =?us-ascii?Q?L7m0iPlF2n6cPXZqiCzF+1m8VNl1Wrn4iWflHmPaDdrsp8W/FHBcnCjKaqdC?=
 =?us-ascii?Q?6GBrhBRaZzVWkon/4cYdfeUCAAW2ULrAc7ROeNVjcNqnx1BoaSUZr1H2XS/M?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c422870f-e446-4368-137f-08dccb3fb863
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 11:09:31.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BJVJMzog1iyDbGJY35wdabudNxRcoX+BQ5cWvF7LoXKtalkmUwK9mIzHS0hjbTojIMnhQaXf14yPro6n73ooQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7648
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 11:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204094

The contents of the COPYING file included in the current source code
package match those of GPL-3.0-only license, which seems to have been
the case since 2008 commit
http://git.savannah.gnu.org/gitweb/?p=3Ddejagnu.git;a=3Dcommitdiff;h=3D9beb=
e7b9bfb9b02e5e4d86ad74e8ce3eb32a36b9;hp=3D50fbdd118dba066e201c73a8b0155381c=
d65a32d
("* COPYING: Update to GPL version 3.")

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb b/meta/recipes-=
devtools/dejagnu/dejagnu_1.6.3.bb
index 895f6d3b36..c6002d5e45 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "GNU unit testing framework, written in Expect =
and Tcl"
 DESCRIPTION =3D "DejaGnu is a framework for testing other programs. Its pu=
rpose \
 is to provide a single front end for all tests."
 HOMEPAGE =3D "https://www.gnu.org/software/dejagnu/"
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
 SECTION =3D "devel"
=20
--=20
2.39.2


