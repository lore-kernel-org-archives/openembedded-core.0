Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC94C5DF67
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:03:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10467.1786705420470764022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=B1qt3Yh6;
 spf=pass (domain: est.tech, ip: 52.101.70.58, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2Bjq13aq8NDGmLSzGNbDR3o8k0Gb0mswtgPN1GreE0f6JuZHqeBsGLmExL7z0MltSa8ZmMuX7P/CC0sElJllFbZfH1jsCKTK0iZ6E3BZ2RPKAl2z56aNh2R+w5hHqmfLyz99YmqboXcwmsM4N5wdNNkA/+T/gHfHUjbTQWnOXi3uc7QdcbZqWD+B0h2cUKlKCTvoM2nc83uIEPcgu1pKSebdvXwYvVGlo7NrxYJS3SfYFRcFZAkcFXmIeK1ZmWLMp1d9yBINoK85ltU5KHnvrFdm/4vPuR47b/lwu2AEvNLLI8YsqQ8Z7w7ShbLrQ9jtu33B+AWFRACQd5/p/gj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bGruWQ1NLt/l/f7su2iAKwbhijpHwJ6C6aUQbi1xN4=;
 b=y8Lih9EDbxFC3wi/bm31UaTJWxALsCnL6zJpAhXFj7XZLpFZqoWvvFDqnl8k8dCr6gUuyIj0Spub/RxBwg4nbRYTmbe4J83HFYSZbB/usYWhL2yZ9sjAgmuqdDe5gcxOuk1D83LZDciJVYDo45hNqITtmgWexKTbKJ0A39Bu62IYp7crpVgyrK6HQD8W2Z3F5Ql2EY0sFUR5qlBPpr3J21/cwcTGsYkENkgKAyCKNQSpnFKic0paotR39SZT3mXR2u3AmHJDHcVS+UQZ7K6le4HQga0ScSJ0xo4uBgl5eXdrXLog9TqDf6qTLTIyH4C/iqHNANEcXYYOgbKuhBxIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bGruWQ1NLt/l/f7su2iAKwbhijpHwJ6C6aUQbi1xN4=;
 b=B1qt3Yh6Y8UgzFXa1LBPHTex+I+nXfhk/gjUeYppl7iN0vv+zL6BvtgyBuoyi8hpo6MUU84WmOV9oKoDQj1tXE3f9sIyvwIRyjT2FZ4LhRHu5X7Apdtr/Bwacni5iV2n1n5xPXSEb+m4Wt6fYwSMJ9w5LiMNZVis/yaShhLP6+Jz++XgPBQzV4YzId+FI2U12uAhjXuOosSZyiIVOwUlH6N19iSgqVXoPKH5bzBZaQurCQgIov1PT+LJPQQyQFAtMXjjE2qVxjKq0o9CArVTgJVEO6WlFc2gGAy4lDZk+d3yP39cKMR97yJEtPHaMs4prUFbbTxiclGYeK3siJ7s+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA3P189MB3263.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4ad::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 11:03:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 11:03:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/3] python packages upgrade
Date: Fri, 14 Aug 2026 13:03:29 +0200
Message-ID: <20260814110332.38407-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA3P189MB3263:EE_
X-MS-Office365-Filtering-Correlation-Id: dd639361-4eea-437a-0f98-08def9f3afb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|56012099006|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	bRUgcPzZzgGNDVmEvcbk2mjlc1WY+AgzaEMNbWoplnLqQqugcWjVZ6cCPisGk6CfEitd5FKowTBIHrd9FfTZnPq+odDlQoWiJCvslFiLTC2/f015Anc+YiHx7Pjxt7w0FYVNFQX4A4QqLanIO4kmgdp/mdPBTVJ8ZjqnM5Co5o1mihvjF7a42xREfAHzIuAJ5qOERT0GBA9kbAR7UAajQz1DMgY2RInFK3zKUpdZi3Gu+1D13Fjn37BMpDTgVwGVbo5rCOqq8mvdOCtF4Wwac7Ylcl+zHodafJUvhULRkZloc4KWcb6LWXOxNCVCuKqnTduOtfJqkzPoW2YpwQqhpiGm8053IFeJUqTAifxb99IsALmgxEwnYmhDnXadrs/JqDZGwa1NaYsQFTbeLnxsUsAi5KSg2hg3olMGTeE6Qa+H15mWzUS6Kb0YvEibC/kxLHcI7JGAWOUlp0YVALbJTkmEdGdz09XGao821zsTadu5o9Q1oFWvMV++nV9n7id8X1laINIBDG1gAJJ2ke25/vNpE112VXxGrX168hlZnhQaDEqlHdsBIXxVF6S/5WRUGTsb5lHMYjK1ARiCHfvW8mwCULTsyI0QRYzLg9OzMhH+oZdlRZE1Apej1ri+Y7LYBrLO9EWSIl2baElBc1ahVv/aJp6jmKjt+zSJjUZVgO4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SCyKokSZWguRS4kQHtQ028S6tiUpu/nuxHHqbKFM4EFKe50vWG23oi7cMxVy?=
 =?us-ascii?Q?s/bOpWTvznuI1b+WsQe0Z1oVLgcJRuAYKnqZov/fq9hdbYKeYS9Bmszf7vhX?=
 =?us-ascii?Q?2oXQW4s3lKLBkSmi5FKFk1do+R/5PnwiYXjr78t3ESEXqqY0YEO1MddgCx3g?=
 =?us-ascii?Q?IpPOzDokojQ8X2h9zk/l56n97iISNY3M/xDMbTvyFoSv3yadqc1KghVTC2ch?=
 =?us-ascii?Q?C2JYrN0yFdKGq5O+HHKIxmHF1KCH/LtafG+/0+uPOzbILeCX2MCCdpQqH3gc?=
 =?us-ascii?Q?7Yj5Trtm0VWF8/MGBrvTgDLanVz7pr/G72fUPg90go7QFCWsYsTL8mKRuzPR?=
 =?us-ascii?Q?z6vhoxD6wZxN6qxpYOK9x8GJp43pMg3Z6bI6FJ5N6Cgc9L4Sz4D/LmwE/ZSK?=
 =?us-ascii?Q?MMcSFoHShdvtfMKqC/najeoG8m92Y2Iu3mo7i4PPaecRE+o0X1AdXJI+AiYG?=
 =?us-ascii?Q?w+e7NkUwuSGJSHl/Um1NNn/Akri+V5p9YGT0nLgF355exYB03L4bI5DCfGFb?=
 =?us-ascii?Q?bWgllMaA57kFdB1C6UcaPOpelzyi+pmHEZYlf99nSzNd5D8uCge4pipWQdSW?=
 =?us-ascii?Q?QKnKCGFpAKn7YZXiy7y9i4hisaJ7hmi2BzLRA1QLm/NctfDQkSdKNZS3cv1V?=
 =?us-ascii?Q?yPtp/wp1NhyvQqcmSpvXOsWKZ8M9B+umFEHvCYRX0OhALMx1OFCju2fez4ig?=
 =?us-ascii?Q?1LNqyaz2rr+kTWagLWGz87qQuKtpCsU9aK1/VshRh6pjcoaed6sm4C035Wq5?=
 =?us-ascii?Q?nM/zXkVuON3krRzW4zveRBtmbYKe5BZ749jDuk6xPfmqUMLhMTvPhQ6VRWpD?=
 =?us-ascii?Q?14s9YbUh023hQEPf1XKp7cyJgAjhV6jspqJoCRxUrJKQ/STY/fUoMRqqPijR?=
 =?us-ascii?Q?8TCl8vVtmND12nIbpyM07glWnKrUddPQpwNR7S3gDdAvAnMM8vaW+mHMhPz3?=
 =?us-ascii?Q?OlVBSFJhAvq/jVVq+sTgslEPspOcxJ//rgwJH6SjAQn3paZjhB6QbggnCeQw?=
 =?us-ascii?Q?HZGSSXNvz3IcjRqaCddtySHL1oxyS9m9szGmMY8VgSdmMF+rdIhIJhyEXIpa?=
 =?us-ascii?Q?0A4Ymq5bGaN/oa3EkTg5fDYPFDz6ge5GW6wWyhHWNLfK2CWwFp9qREBQ6snN?=
 =?us-ascii?Q?QvB26YEJhp8zcLW70kIrglQbrThYNyJCoddUhsRFmxOJ39hAlBMXFtPgovpA?=
 =?us-ascii?Q?ADrqDcwkEqicqyb8I1SMhtayZCNbjij3X6fq88ONivP+r+WmsCJMcAg5zT0k?=
 =?us-ascii?Q?go7AQhtfE7TCNYjg5J5MX9hQQvMsI7Md6pE7uatoXlWLQmUJ8lrjS1Hm0shw?=
 =?us-ascii?Q?R5tvC0WVIFYo1VCqIIpIvyZSNcZ6I7LM6i+svHDK7YbcuUiGoVlD5fwzbrbJ?=
 =?us-ascii?Q?W1D2zRaKIJ/ltjtHofAh/kDTdJKCOVyIH+CEFdzLUjcGAKQ5MlzRcIqd8GQQ?=
 =?us-ascii?Q?QW5yxIeuX5Zr/L/fGYQULUYItjssEfd5j4l91aExuYG9TLQmjU1SvlCf+cEC?=
 =?us-ascii?Q?Qbq8zutEzXNImbQaRvT46Afd2467iyW23AfcXIIZqI81pAR/l2WYen1sBBu1?=
 =?us-ascii?Q?cuO0EWuvXxJtuRx05sLXMQ3zebW7GWHcIi1jedWtaaomfyEt2WoHx3QXvGoj?=
 =?us-ascii?Q?VuepsedNXaim4nO8RTzhxMJAx9fbSJ30Am4M8VO/zr9OVgMCT3a4hpOOU/1f?=
 =?us-ascii?Q?6ODn7I+lDZbq88g72zx9daKxkzahCxZNXytxgdFJmjWpfD+sHl/XBSjG0q1f?=
 =?us-ascii?Q?godWMcGL4INxZC22B00KLxvQ5MW70/4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dd639361-4eea-437a-0f98-08def9f3afb9
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 11:03:35.5434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJvNviuiAof91thzKxp/i4lFhXAM7sGHCSd2GMftNhGusmc4Amo7Hl17skfR/AQg2U1sKjCGTkp4vX+bUN1t1QRhnqX5KoCVDtlpULZk3Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 11:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243439

Jaipaul Cheernam (3):
  python3-pbr: upgrade 7.0.3 -> 7.1.0
  python3-uv-build: upgrade 0.12.3 -> 0.12.4
  python3-hypothesis: upgrade 6.165.2 -> 6.165.6

 .../python/python3-hypothesis-crates.inc      | 20 +++---
 ...165.2.bb =3D> python3-hypothesis_6.165.6.bb} |  2 +-
 ...hon3-pbr_7.0.3.bb =3D> python3-pbr_7.1.0.bb} |  2 +-
 .../python/python3-uv-build-crates.inc        | 72 +++++++++++++++----
 ...d_0.12.3.bb =3D> python3-uv-build_0.12.4.bb} |  2 +-
 5 files changed, 73 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.165.2.bb =3D> py=
thon3-hypothesis_6.165.6.bb} (92%)
 rename meta/recipes-devtools/python/{python3-pbr_7.0.3.bb =3D> python3-pbr=
_7.1.0.bb} (83%)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.3.bb =3D> pytho=
n3-uv-build_0.12.4.bb} (92%)


