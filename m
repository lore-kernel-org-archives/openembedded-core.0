Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FAECC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 15:38:44 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16982.1791992315008548000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 08:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=l4YucLX2;
 spf=pass (domain: est.tech, ip: 52.101.84.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLHq8eKJOKMSidg2483eAk9R1fL2CNqJ2knfiqEpNUCKFwKhd23xtnWA7LXIL8Qsjfp3QtVojwxcwpaPACVUYuxDzSxu3zGOL3gbLT+zA43gkQdwZMe0sUoCSSzg3cYCUgAtY2smxjZMS6vqjYEmqo3xSNEB8WHHYQTAdCdf+Y2UdctEL/cI2Z6o57e5LQy85M3Zst8fo5zMQ8lP+l099NuIcvfShyhNrUaazssdogErsS4zkXGWS2nYoe1BOBpWyGZSKhX2zqjQi1MLHLU1NHgfmMZjuRtDYIOQhm1fcEO97X/YnNvn73rIv7993TxAGFiAMeMx6o44ovGQ4mSHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ge44jSJsKkPR1SKmyREXQJSmI+Xo80EZSOZYhsislY=;
 b=X3+ctWgKuHpnRatc3JzXMPo3y6ZBBh+nFzgKVYcmuCzmFLz0WgJKyQDoeRAdJgSpUsI2lXW5VFRSTmhMYRS8PA2Sgg6b9DQRxu45dN5ccM8YvU1IWh6ax5rAkX1XAnc8ZHhm+585ctKPmnmjUcxbRFS8i+3P8GahuhTvjO9iHshJNx6bShLv7B/yHBKRhAoDJAMnVyBP4By7P/J8AAtWWFKKMBLkazzairAzIoBPQdbKEHGHnf0K1gHbdBvTluzBsIsYo+Obn32vplbpOhHJLXAv97pzihw4FkEpFWmfk1mUdmIxoHCU1pepxzbIHchkviI+i7R7a9BhZO2emod6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ge44jSJsKkPR1SKmyREXQJSmI+Xo80EZSOZYhsislY=;
 b=l4YucLX2A749Cl3CWPA6yzzPcAmlfa6JsFw7a7tAbodOGhtWBfQ4EqPNy/hrz0F72Jn2p/S4M0XM+ukYlk5WkOcO/KRaiZPGec4xmt9mOmNGioKlv4dkaySJ9stM6hcbtx+s+cOFM3/oo/wNOdLygQPU5CJWkYrVHidfg+Mq4vyEZ7pXo4Ii9d2nQjPWeST/BkYQooI2h6Dtv00zcIrWOySUcC4xgZnNaAfS/a60mAecDKurx/wtmktkBJzrID7FM20JXtnYg9dpvfSwPrVEjDL9Wb+vRYT6BhhTGMSyGqgdjKtbtQHehblrf84FzEyYpDfEaehuMs/RtVM0jFjGAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1830.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:28a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 15:38:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 15:38:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-markdown: upgrade 3.11 -> 3.11.1
Date: Wed, 14 Oct 2026 17:38:26 +0200
Message-ID: <20261014153826.82353-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P250CA0008.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1830:EE_
X-MS-Office365-Filtering-Correlation-Id: e9082dda-a962-4e48-0850-08df2a09313c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|18002099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	l4Eqq3ReQPQngB8ideX3ydv2FGe/u3I2wOF6l7lf+cfvAEI4T1kal6QheIfRJMBUxGbjzjwlfrj1mqKF356AASGQ96K3gut6XSXVFhSrctvP3M+QrqOpNbInSxz1CcfZ1JHNGx5ab1AzZj554v1ka+3ES+coV7XKG3W3pIXjfUm+wFJwcVpU4v4SDJ21VH3nz1iAW/22shF6pKpf4C6J6+Df3NSCkkaK9j2xDQpwN3vnC1Ch6TTpZgcYeUwzM04Tw7rsQmBWj63b4mUhFYxBkmBmwJgJhatGv5vn0qpM4ieblNPiX8KEXvyf3ee6m0v3w/I+fucSTqM1JTTvKtyrAElf3MoFMH2vZrr2OEWxv++HdBSKvcWtcqlDoPjh/MsQ5yBUs+amvCtIzxHplVigJl3gZyiA4oi6jwXBKjeI/RE3KyY9u0tKIYcA3ok2z6g/6hD9zn22aPT0m8Ukj2JFpkxjSwabm87Xz/a9sOmnfuHT/nQ06Qto2cE9BDbli2gqHI1rLvTqU8uWskBuDujSztBt26w1MJVc0+VClZW7iPRUwYs1dAP7banypRrnEzCDC4rif2CdqeaZ5Ccql+/6mhAKgThgUEmMf4WWHKhUG7sqzgTu2hZMnGviA2WeeqPuB/YXWADadCuKd8/v7oB4kqbTdf8eNC0trL7T+HSP0vU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(3023799007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rEHkfN1fY+VqWrTUEVIUvbfff0kMJlni5bxgtfThMiNvvySpZB04BSija6EL?=
 =?us-ascii?Q?fPdn5bbq5EYlhnHn9A29e3CYHUmGWQfFueqCnxT6m0n3CwWZw3CHVQhE+gdC?=
 =?us-ascii?Q?d2aOJsKohjpthLPy23eYRO+jHuQE8Y34fZgQ8l+NYf2xx8MS9/LJ4WltH70d?=
 =?us-ascii?Q?N1yb9XgsyWBTiOHzIykCuIc1SbUa0WSMyVwEs7xYkCqWxfxbtnA8uAY3+WWn?=
 =?us-ascii?Q?JGWiPYJJTqIz0T/Qu1IMIcaSiEDH/3iHHTnUuYryEK3YBX0BSc2+so7rm2VK?=
 =?us-ascii?Q?ZADd1BexYrMyutYXoq3TxFsA6CVDsN+D/69J+4tpujtTucm+lgAi6jQZJBnJ?=
 =?us-ascii?Q?AF29q9l0lb/5c6dwSyydYyiWMZYYNwZi+99RNWEZxzH0wpxmlkpCcK8PcB4X?=
 =?us-ascii?Q?b6zPzBnSVxgHHCw4ZnvTAVKbaCufaksoDr0TJ4i8mX5pvKaJxdmk5jUL02n8?=
 =?us-ascii?Q?dLW0+2QbogYRdjbfm6g6cgl7w+Zoad7BCr09Xp+hnjwJGwowbaQv/T7RqxCz?=
 =?us-ascii?Q?WyrSZdUX83SNjM0uUF6Mjkk4fp9kzA2QC67L+7lEsjJbwvGSrBifTIp9npe/?=
 =?us-ascii?Q?miXNdTk0O7+fLfdRVywV/PeKTiLwBBQpI/wgroWFmj1umaBIhr60Yywv0fNH?=
 =?us-ascii?Q?/Jx8qFXuYlSr6LdO6V9Lx9DyahPQ39C18V1OmZq6UWAhoIckNGaCioa5g8oJ?=
 =?us-ascii?Q?bCr4sJZac+rGvs2pGlLLwvRJXTXOuk86AzE1ldEGQJP/2aW4fesvmBEgg7IC?=
 =?us-ascii?Q?OmN7o1bxrmWoo7BoI6t6x3lDla5XtqS9/lu+7ixlnk3iSdH3NBx9ysqBeI4C?=
 =?us-ascii?Q?6vmYvijBv77PigrakYxb4B0DwnND7mzBbJj0FeB84JMBPL2hMDl7M4a0bDLA?=
 =?us-ascii?Q?5ydU16fV3NI5nyKV1VbET0aiO0sIk86P8JLt7HWkJn9YfX9JzyXOpTmyBcyu?=
 =?us-ascii?Q?YSf0n/7BM4xN2YOShJjYGpcOKRwK0dqPswKToAPGf5fr7o0N8arqHB4X7wlL?=
 =?us-ascii?Q?5XoVMSW2GlgIFJ+ah3jh48iGZqNwtMj0TBLpjzEozRuuy3kD5+Px7DHZdZSF?=
 =?us-ascii?Q?RJ+GbYqQqhP+wq/hAl0GbnJYX4kUkoNupr1X6NDmH0SQldv2RzgMGMZ52Dux?=
 =?us-ascii?Q?beCXnaem7DEEZuPUNpkG3ZvHGbrMO640b67+tSg9RB25QXany3Y0Qu+1C9sG?=
 =?us-ascii?Q?03Y4HR++ah1XJpVdYr7yXPFd0P3e7hxWY6YDSyS7trrBW0Qz+DTU8JVey/EU?=
 =?us-ascii?Q?7vonYR8u1BnWDe5lBNphiryS8Qn+Ji42d4EiEJlcSlFiv94AcPcGWsI+kMlI?=
 =?us-ascii?Q?mmdWLOjs3GgRPsdFJ9edDqm42nMwMnAsSnPEuRKvTvZ0CBORpJjKL83tbpQ5?=
 =?us-ascii?Q?AEdj6/CWIDoP2/LjAkyDoD9JlwKXCN4MwCr1RDCMkAY9ZNrLxFsO3xjkP77A?=
 =?us-ascii?Q?3Z2ODmXYWYsC4ASniJViekPtuR6pQsMGFv/vW6AnSdWe+051qIwz1KU1e+2E?=
 =?us-ascii?Q?8hHb1Asbc9T+UwhEVkqSYw14jKCtAt3OVUAcRrRg8PY82xrScMIcPWfSRu8W?=
 =?us-ascii?Q?yHMaL87WSm3oICtPa/8Cdxv2WJ9v8mYRcOAPWVhUwAMHOX9zbe/okhqv5po0?=
 =?us-ascii?Q?PCe2K5fNDymSCEspUC8t5a5TKWIKEM5L/XzNIOZlAZLRHxsNy2e/EOsbFBS3?=
 =?us-ascii?Q?3+Pn6w8MTAQyj1K7+jQMlnTtit+cYv+No3NzPw10QbivxDp5p4Bo5q8m6A+j?=
 =?us-ascii?Q?kaMbAtCg2g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e9082dda-a962-4e48-0850-08df2a09313c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 15:38:28.0233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJNa/oBWu1+k8HYHHJn/l9bvZtuDmNwACllhOB+EQyAONcFTvd01SVz4gtss7RrhNzo+pCMI8QC/oXBpUaRf2QLwNZKh/8+GGYecq99Rkoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 15:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247782

Release: https://github.com/Python-Markdown/markdown/releases/tag/3.11.1

Fixed
    Update serializer to be non-recursive (#1644).
    Improve ancestor handling in the inline Treeprocessor (#1646).
    Keep a raw HTML comment inside an inline HTML element that closes in th=
e
    same paragraph, instead of splitting the paragraph around it (#1643).
    Fix issue where inline HTML attributes were rejected if they had < or >=
 in the attribute (#1647).
    Fix issue where an unterminated end tag (</foo) could cause all remaini=
ng content to be dropped (#1651).
    Complete rework of emphasis handling to improve nested emphasis handlin=
g better (#1632).

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{python3-markdown_3.11.bb =3D> python3-markdown_3.11.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.11.bb =3D> python3=
-markdown_3.11.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.11.bb b/meta/r=
ecipes-devtools/python/python3-markdown_3.11.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.11.bb
rename to meta/recipes-devtools/python/python3-markdown_3.11.1.bb
index 709e7cdb709..36116757829 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.11.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.11.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dec58cdf7cfed0=
6a21f7a9362627a5480"
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI[sha256sum] =3D "180224db6aed87ba9ce1f2781ebcd5826253de8ff637112090=
e24b84502bbf9f"
+SRC_URI[sha256sum] =3D "496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe0=
71a1643e876606"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20

