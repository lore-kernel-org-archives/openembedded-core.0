Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398F6C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 19:37:48 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.47])
 by mx.groups.io with SMTP id smtpd.web11.37469.1699645058804843761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 11:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=lDvMT6Va;
 spf=pass (domain: welotec.com, ip: 40.107.104.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1+JIRVTyKNRm51aQuU2PEf2m2IMtW8abHQ4JLGbdN61ESl07NoXrkBdBLqZ69pCvqIVxru1nQeLC1C5uYgryzUEsF9OT75KHEBx1kEwDrdF+VXVQfa6Tr+85CWotgb+IaEU5hI/rBl8ijN0EHZenLxbONQSSBe+/sBG75aaKjJdOk6UeY8Mm7gnGljmxYx1LguiGqrydzpvXZu/rEyFqj51ussSZTt/TS22tg0NWDssdbH9gbu3ECTXejbKI2jwuZ+v9RlxwDqQQQzbtOO6kVW/mJKmez1p532C1NgNnrWacxsfqTQ8jbdxL+rNIzaiVwyOqJoZsC/AXOvxTJObLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cn7Zn6u1i6DZWmWFmco1K18pxkhajKSADEzST0D7crc=;
 b=Id/ebNNTCZ7wnijZaBs7ltMkIoo3WtMp+RUxul3EsaZtM4MiYJkk5stXmPIOiCkzV9dgMx5w0M8HhZFcWdsg1exkGamKDiUombR4X+8Dhf02e1umzQL+WY0FfrpvUTJsv64eTpyeA7+g5cJxJAOpFFZgUJfT2fqqdcveZmti08V3eodXmaERYX69JndE8hp7Xo2pbnr8HD24w1ZRamFFXJuppSlmcy3S+3uE+Li5BJ1SNuV9K372utv/cv8hZS2HUUEmd14O6K6nHAokfdIBPezMWduMrNbzFduOWJLVIV3OgrImHezsA+IHK7f5T4SH5mRr0MODOeWpuLg7x642IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn7Zn6u1i6DZWmWFmco1K18pxkhajKSADEzST0D7crc=;
 b=lDvMT6VaNt3X/lCo4bgT9nbwd9Q0j/dGubUjOOnwINo+zqZhlXwD5fgPy6OOx1iDSkIfTF961UBcth9BrvK86EXRHZNi6ODAeQZ5ACs+8lCaEotWy3dZEvp5W0sdEnLHhjL+e/OoP33O0Jb7BdNhh9GLCFe8CD9ab7UeKVgLHWi5t88EmDEGhETAWw04cYiMZSqUqaMG5uUpCgkBl7b+fQt/B3PcG2iqoXGQxKwFJ9vjk96NWZ6yDBWilBTz28VtRh6OQMX5ApYFI3EPNxYrnNv9OyKN8g6ULfDdMp4E2XhGkZAt5dqawB9ISwdb1PMfzS7vMf9O8T4D9LqZsIhCeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8344.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.8; Fri, 10 Nov
 2023 19:37:34 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::a038:57ac:22bc:9918]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::a038:57ac:22bc:9918%6]) with mapi id 15.20.6977.016; Fri, 10 Nov 2023
 19:37:34 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt file
Date: Fri, 10 Nov 2023 20:37:16 +0100
Message-ID: <20231110193716.2198635-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: b3bdbd75-8eed-4892-bab6-08dbe2247cbb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	77KSiSBpkxdiBYTX4+qvnLby0B0OiMH0TCCQlxy92B7lJzspnOE6EoZYest1nQ9q5JdNb/7173vBDAjLxzPMEcxCmUFVOwQccz5OkcBTXH+8bj687LEjt2RJKyAXBuIN7LfaG3Lftje5tpupvmXB4iIBiY8Yyf+e00HKe/Yb2SAmbfWah5ocpeOSIEbHit+GR99tNvhdsJJBX2wUiuTxA1DZ0FyRGRDBisflxFTj9Ww3vbGr+/3CePOyBSqCP64WBCY+c4NEY+ET9l1xnw8ZEQbCBuGjIgsGqZOAU93SOvrQQBr50NC6Mj4OCq/SeWCwQbj9oUoCA1Istzi4K+AyRQm2fYmzO8+B75pIeiuq9cv18iNFXIvNoDGtugE6+fpweuPAxkM9wDW3A7ATuN1m17NNLmKOADq1hstSNBO59ErgAAMtbkbJhr/B5aJTMIgIJywnk01PeC+vsr0IlaLstB62q48/jmEE4C13KOJfwwSY9gynv83Ia2Ctzdx7MYYiwCoT6VVAMx2ptSDG5QvCmJJKKQO61huQW5c1UptlmgH5xZpJlYyQsK1eCpehU1ybfT/O0NBYqOCAGzT/sU89QklwhFFcHrxSqEolk5HtrwbJ7xcxhJfYgRCz10YNPESb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(39840400004)(396003)(451199024)(64100799003)(186009)(1800799009)(41300700001)(5660300002)(38100700002)(4744005)(86362001)(38350700005)(36756003)(2906002)(52116002)(2616005)(8936002)(8676002)(4326008)(6506007)(6486002)(6512007)(66556008)(66946007)(1076003)(107886003)(316002)(26005)(6916009)(478600001)(66476007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l9oA3NkZ2yIWV+/ibAmL5jPTt6JYC3ZQlv8xK8/LxMG+Qk0DbNAJN1V1vLzq?=
 =?us-ascii?Q?F9TURHooSKw+WlrlFfmpLl+SgWcuwoO12a0DYHo+CGhnyO2Rei+UnbHPWjPL?=
 =?us-ascii?Q?7r1x99OOXAWQxd7npzuQoFaMceEUqSTSYFxVhlE4TEn/QdPSVEAPHPU//XPq?=
 =?us-ascii?Q?jGowWpmbXrVJMdiIwunOS6r6Gb/ttldCU6W7W/elFACWfMVqzuik1jRY34fM?=
 =?us-ascii?Q?PEjiY0fzB114DW/IszRTfRXuMdNodI80NWHfuh446+SH6GUeHsFvRoOfX35V?=
 =?us-ascii?Q?/gmGsXRjMfug2WHNT2heievSVWGQefb/M3Hg6T0JUuqfMDfK5gk7oqaqsY6/?=
 =?us-ascii?Q?wdFJRk16cGw3Y2j6iM5jnDSdjgn6TJdjL2s1fe77N14VZHs2UJus5c75EbXw?=
 =?us-ascii?Q?ScXQx8oev8bXxewEulxzf1RMYIGm5WthXHxmZneo5WLj9Vdo2rLx29TG/Ay9?=
 =?us-ascii?Q?aN5LLrACBBPr5YMZkIw0KOjFqFYWY61hLeuhnvxdFxkmd3+Uq+n7tr7eGCVa?=
 =?us-ascii?Q?IRKkUUZEjiqvdA5AkKZ1IaocdFwblnz3/iLMfG7IMM/K0e3/Z5rP6CDAQRw0?=
 =?us-ascii?Q?diVoc255RtBw+5aD6sicuvnAlCB5hY62NeENmWlDqkO8f3GTdYrhjs7GcFc4?=
 =?us-ascii?Q?ZrmqrTAhEFuMtpJK8mg0xWW/yO8+TA4sKfmw7KQ6xsSid+obBW1yFPLrymPu?=
 =?us-ascii?Q?Y2b70jf2lzy18rUZXAG7nGShFYEAM+B/GIhIBJO33S9ATjC3ovMOfhoclYtL?=
 =?us-ascii?Q?fKMjLV1KZO7/TaNub72KAgcdx3QwZDU2FDwLKYDVFzzlUzxzIdH5NsgZhN5l?=
 =?us-ascii?Q?QsHeE9bKM2rjD+wygzL6Vekpg94dXQKcrQb3LQvUCR8th6zq98dTG09ZjMM/?=
 =?us-ascii?Q?fZY+2PQmUVGvIf1hGdqwt9GjwACWdjkFbefa6JBXhsGmx3/+aU/K8YFxbD59?=
 =?us-ascii?Q?6vkcq8Xhu8QXPbW2IKRP4s00gJloLgWXUtzVQ7RUaXs8No89fpjaeeqJ+l8m?=
 =?us-ascii?Q?C/01aKmpymXs7dUWox7Rl4B7R0CL/FN0/YATj62ud+nmwlZnYY8dqbaEFCeU?=
 =?us-ascii?Q?nFXzC/LhXmfU+ykwIiX7XZIIUAgQ+l8mc1fG0shyNGsHfDMSo493Kj2BZOfd?=
 =?us-ascii?Q?E0jHEHPjbnKoLln39+5WpetO6cHy4YRZ/l75vGnrQ0qhhCiFQzpogUjnNzI/?=
 =?us-ascii?Q?5me03YdIY7s5QlWWnOSgsR6f4uQiHviMR5d8Koa+hx7Khm5AdyVkB+6bzZ4z?=
 =?us-ascii?Q?d0vlHwEhEMR24rbvf/d5VUSsJPZzX5Q3FjffX32juZUnOs4lHHt/nYShrZT4?=
 =?us-ascii?Q?8aUsyyzTSEO1RLKMPF8CA72Ai/2NR2Y8L6irbgUvixRMKT8ByMe67F+iBpXA?=
 =?us-ascii?Q?mybPjre5NaTKCsbJlSWujaXuV+WXEz2NoBdwACHTgoXDixUvBaWlA2v3b15m?=
 =?us-ascii?Q?Wbi+53SWAcpcZFGar5vDLeue8vMfAixNBJhdpZuimXA8NMTPGS8G2zroITE/?=
 =?us-ascii?Q?18YbmcfGVz4P94abOWiVmQ9YA6kisGGLQFtoVHyuC9tKuFraMEJin7n9zHA4?=
 =?us-ascii?Q?QQKBuHbZR6gLhhdgDDEIbWvVr/Ca+Htx0E0R8WCB?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bdbd75-8eed-4892-bab6-08dbe2247cbb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:37:34.5269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L00aD2hMHFv/SjomhLLgLcD7Sstcen6jYkUDe4sBf4eQ+OgtSXf56i/UUjRgoUVxMYQbvVVOZKk007M4FOfDIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8344
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 19:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190409

By default curl is being configured with:

--with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt

which causes an issue for native build, when calling
curl-native command, as certificates file is missing.

This commit fixes the issue.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/recipes-support/curl/curl_8.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_8.4.0.bb b/meta/recipes-support=
/curl/curl_8.4.0.bb
index 5f97730bf4..165a116139 100644
--- a/meta/recipes-support/curl/curl_8.4.0.bb
+++ b/meta/recipes-support/curl/curl_8.4.0.bb
@@ -130,7 +130,9 @@ PACKAGES =3D+ "lib${BPN}"
=20
 FILES:lib${BPN} =3D "${libdir}/lib*.so.*"
 RRECOMMENDS:lib${BPN} +=3D "ca-certificates"
+DEPENDS:append:class-native =3D " ca-certificates-native"
=20
+SYSROOT_DIRS:append =3D" /etc/ssl/certs"
 FILES:${PN} +=3D "${datadir}/zsh"
=20
 inherit multilib_script
--=20
2.42.1


