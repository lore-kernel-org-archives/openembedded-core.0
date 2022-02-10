Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91524C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:14:32 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web11.12345.1644509668910751834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=aCl9Zb0I;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.52,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTZyTkMTxHrRuy0AcKckgsAX2aFoWuU90qP4BwfdVzlnkblW1EiETpDtH7bmvafYTe8kHQqNNu+/f2Pg0vn0w49s9iPasqnZvyDRTpJ6WWq5k+B/pS34PcszOagA0pHnVZ8QAdT/nWFVlOphMbqCxdlxMm1Joto9trp+u1pb8X2FpiWPviqDKeuapIcyb890IMegN2QinaKVEj+fTLBX6rXR2QsEGTMyFX23i2lIvcpYPzTqCisGSA+hl9ebzmrR8u0ENW8EMLgf+bT8ymYkeSFqH3kY3bfWnEl8/Zq4kNEOKkMrXwA/5M136XmpglRPeqeyTo1Arf3F7XD4CRBsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLG1XQ6OiGR4YTsViPNlgSfZ5pUI6lxwWNxsBlIwEvU=;
 b=kfwhtvXX8tbj6ATO2xF6V5JbfcUyMM/oQd3AM1riFmXHSkiN1ijz1I774qdB75EbIQ6d2XgzkWiTdTgbz9h84Sh9JsSgsg7yE5aR3BkL0qdBL76OWKQTHxITIlP+q8nEFx33vXKBL9Y8dgebci1FaR17EZA3SpSgf5VVwBX/TcCIcF2THEyPA29dSnE3sUOjpQlwHsUYmOEQ2xgXC4W9tfAWB/Qpy03QeIW1vWw/5YldLMRWVDtxduZUKQbuS1DGh6Za5ijZwlgbUAMWug/ZSFYFX8e0k2dGe3HAgk+YH750h/i4tfdZDcEGX119h83t9EOCr9lrARmvFIo7dW6UlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLG1XQ6OiGR4YTsViPNlgSfZ5pUI6lxwWNxsBlIwEvU=;
 b=aCl9Zb0IbLfpTz8lrB8YWs+WAOH9eizu75Ufjq85PO5KgLRCaWM0dg9NtDBeGxk97furtblYSFOsEn8K9E8CSvhF5Sl5DycEIC18NHpGc+SFYT5y3dLwAov8bdQPlaYHS8mET7OcLRJVLjAnJThBENFyG4CFoDtJr/QusGeH5jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM5PR0801MB1747.eurprd08.prod.outlook.com (2603:10a6:203:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 16:14:25 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.018; Thu, 10 Feb 2022
 16:14:24 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 1/2] gcc-target: fix glob to remove gcc-<version> binary
Date: Thu, 10 Feb 2022 17:14:03 +0100
Message-ID: 
 <20220210161404.17199-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0309.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b006f515-0242-4337-4c13-08d9ecb06789
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1747:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB17470E644EE6B077BC31833AD72F9@AM5PR0801MB1747.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iL1IFntVZhSq2ZecepO9jitVXwmWBsGB3DmW3R2/Hkehwka1kkdYoaKuJ6XSVvFVj57U8FmWHeDKrzzmrbuPYM08GJjml2GXEzmVpLatj7b/M/91cJt6wsI2je9B2PzIIvqgI+AkFm8qzkbOGrgs9GZGg+vRO+ItEhhHdgkGUlDfIrqAc1zNbxrOW1bzV3ZayWTLIWJ8ikPOPq49Ir2nXr53PeJkgqVXPRapgPRtssndijCwYJaghyk8sT4ctFhFV8YsMH8quHl7naEiN99ZdrZKRM7rQqFrHfTii2znchebWfB0ANj30Zev4GznzFwYEXSwJxYcFNR2/FWSjuUaKbkP/CzvZha+ezSATaj1MojBhPM4aSem4I3oT47avib5yoZ2jsa8UalU6ar1+nRT8eJDd3u/EOO90CP/0aB2VB08RP2IjXDsOn43U1SVHchcSE8ZAHBCEy6Owx/McHUcwLTwYDx0jcR8TLfOsskIFSGWHLfhbs72xljmHGGo8xyI1Q+J+xFLY0e0MtQEloP5UU08bn8LSxLOUcgqo34uI52egPE2i648IYNb8O3ZNFw9SAQmlD6JvTAN/ycbRlJsLJSfXtMQmhS+/DWfRt7zBjZ3egmN4yYpgtTQs3aHqJ03hTAKvM3QCJ39nrM2tgOtSqEwIFv0zl2RYBHXokKi8xGqdtRqhV956xEsMzRHESRskGxlVvHvBlhBwuhGsxs5ew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(52116002)(508600001)(83380400001)(1076003)(2616005)(107886003)(36756003)(6506007)(6666004)(316002)(4744005)(5660300002)(8936002)(186003)(38100700002)(26005)(6916009)(38350700002)(66556008)(6512007)(8676002)(86362001)(4326008)(2906002)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wQSLQ2KfIDnk4OD5+j5yn6cEIruNYO8Z/vX5jGjamd1TYcVLJKcaeLVvWy6Y?=
 =?us-ascii?Q?SDfjyZY769qbqfKVZJJsCZeqmgZdMqJpUNDf/t35X/zftEXxPb1DuwfSFDk4?=
 =?us-ascii?Q?oUoeqCwlXmn+tZgZ9kMTwNAxdgQfkmkWpzskKFQeClJx7IVl2/LHTF1OBi7s?=
 =?us-ascii?Q?+cqXmloGUW1byilcD5Jr4aaHhZJbUZF41P8ZLkzvF40ZCZGg1gPUW0FJqREI?=
 =?us-ascii?Q?rLi3bEHk7EsgCW2r4TjTrAg0kmNh3TIdrCSOsncIv0gyLTJF0VygMvDEJali?=
 =?us-ascii?Q?STf1TqrcNi7ieq6LvV8wo4WN/QpmHdAg97G+L/lAyoWcvG6c2uXAVK++nXhS?=
 =?us-ascii?Q?6yRZNjnX8JS/O/KFYGjvZ2jZCzPEjrc/6Zl1/KKIhtPh467M/tOLQO6/p2Zj?=
 =?us-ascii?Q?wZHvDCczSKykUg0TjjJtnYFqgZlYlZAXaWC/h20H9+R8PGABhRuHYrk9JYxR?=
 =?us-ascii?Q?c21LfdR9Tp/Pu93cdN2uDRh+k/UGYnUHG4IiE/22rnmVgDyBL9T27i4q680y?=
 =?us-ascii?Q?Fi0gILl6UHCyGD0NpJpEtO4beB3stKRZaW5C15cHiy/o0SjFA5dRZh7LWFaT?=
 =?us-ascii?Q?wB2EkhBALuPYda+WlbIYOYga6p6sPtZ5l9fw2sHTS8xfW3B9WGM6W3ahyeX9?=
 =?us-ascii?Q?w2F3l0j/4otFnmR2+64dilO3CtIN5rWwU/u8Vm6Ojlz7XGr05TWIP9juAUSX?=
 =?us-ascii?Q?T3ABnGIRX+TqeQL1Qf6qND4LXhydcZ3kjwUMD6lDX2xotmAnqGG15M5ct8p7?=
 =?us-ascii?Q?STWwusHfj9yt6R4cqFh0s6zFSO0PxK7oVzsqEaFlKQE/2C53DNDNZzZiGM+i?=
 =?us-ascii?Q?FTEoBQkpQ6GNUcFRX9G/s5BQT7lcCkHNUcsubbu8fxmVVYnFxjoHNi/Ty4id?=
 =?us-ascii?Q?AZxg1u6Xf7P6yJABZYgycF7NBpqBl2YU6jsb9NNMgHNXNTQ0VuJY92MtRONo?=
 =?us-ascii?Q?IVjPan7uFor1Y5yFoZUw6vciMcIV54s/eWJ6TrpARpggjGrMS2rdU9legXC9?=
 =?us-ascii?Q?DyqbdpCQ0UXLHcL14r/+ir3AstBbH5JNcIP75gP8Xc172SiczSiyk1ybpGRH?=
 =?us-ascii?Q?XkN/sYZtGa++EUvzy7Is3NtI+O4Xl7nb6bAZEy5uI4MPj17p9yxwwOiurgmn?=
 =?us-ascii?Q?v1N2JCOpk4fHsEqUpkkcXjHUk2hW6UISO50MXkWwFmMCI22kDkaGqntqpMsH?=
 =?us-ascii?Q?DGxxJglHWSbPEgPCk0uJ9b9FNyKO7+Sh66xt/WT2E5H+gnKGG+syp4AqMfhm?=
 =?us-ascii?Q?qBck8r/NLqFHrCwfZ1V1Z0+G32lG8m1qevKX0gRjKBTytiNq2N+P6ccy4yMO?=
 =?us-ascii?Q?KgkR3U8wvXjEG5jxw47e1HIH0JR3PKPUPx/DZK6WyzitQtWk+wZ2hG9vJ2pb?=
 =?us-ascii?Q?wdJcjvPp1KP6YyZxaq6h9nnH5r1XsfJfSuEtD63dlx3xXnf/z+W9J2cPfo8s?=
 =?us-ascii?Q?UbpO+ABI0Iiu04Vlk89g9SwkVGicrMpe0ZNvJ0YBa38KBRhKEQCQQizY5Qoq?=
 =?us-ascii?Q?e6WCkWCQgD1iiIoPT9cVgrufchRmV+bPxcW1AH959Ev8NKR4wJgqOUA8plBE?=
 =?us-ascii?Q?/BCmObpIMNP5oWVk5OxhQ8MjTE89v/Hsvu7wME36Zjmmoc+oDAhjdGEMgSH0?=
 =?us-ascii?Q?h5WnS59EIzj2LMnEf3//OOs=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b006f515-0242-4337-4c13-08d9ecb06789
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 16:14:24.7742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aS9psUorzRkpN6LG19FgYFybHaW167L69L+wNqQfilK+eDIEZWzqClj00lIB++7AYXl3a+/TQoA41ws4eXw2cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 16:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161615

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The glob to remove the gcc-<version> binary expects a single-digit major
version which is no longer true.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/recipes-devtools/gcc/gcc-target.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtoo=
ls/gcc/gcc-target.inc
index bf55e692e6..bcea75b2fa 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -193,7 +193,7 @@ do_install () {
 	rm -f *c++*
=20
 	# We don't care about the gcc-<version> ones for this
-	rm -f *gcc-?.?*
+	rm -f *gcc-?*.?*
=20
 	# Not sure why we end up with these but we don't want them...
 	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
--=20
2.30.2


