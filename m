Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E65FC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:34:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9904.1787153641064521733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uZvcaycZ;
 spf=pass (domain: est.tech, ip: 52.101.66.17, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pglpz7UTxJe62JqkzZel13wBklGOUsmVEM7r76UlIL2QPbXOlXo/BZRWtWXuN0z2RvoAlf26WG4EBG/6GYdi/kljMJPY8IFT8+5yzPVofPDpS6V2BVpxV8lM7RXj5QUuDzRIjZAsdo7LwL5VTiDbGhpXkmAmDaRyeUdCNb9ULQGjkhjGBz9Tjva1ZEyXH7/6nXtwcTJhOUlC/vXRekGjNI+4ldT6wAH1DPBvRZuPJOP/zBcW9RCmFxrEBqk3CwaKcXVYSR5BNJjsznJUa+6yp3UoQC3FRlhOE6tfWYFJrLtkPmZTU2VG1X4N40mMF3yg0L/eKudyTY4PkEsslaAbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEma30/Y/T3Pz+OMq1gEv5iwceXyVRqsF9lQqXu3A1k=;
 b=qgxw4M6JEUWeETtYZMa86QRAZBrKX2nmXT6q2JMC4sE1cy6Jl+f1bOvYlAl4iZyK73hMG28XIhrcgqjqCLohxt5N9HHBZwaPXv+/iD8daBBt49GjuFcuVMv3wr4lMLkio803H7GtB2Mx886uMAgAWTELwWglgHO47Ebs0uOZf09dkWfDQxy7gYC3yq4NUp3nq26pQChcXKafQuD2S2Is6UjihKI11SLFjNKjewcKVMBuQYIyDgl1jem8X4d3b9+Uz4oXLS2YZ1qHrRPQIFSBNT7cac5Ynn0aUWP+6QCKlYw8tBqtmCi47DmQAlP5fD3g+oRmq8kfCgWBq7OJ70x9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEma30/Y/T3Pz+OMq1gEv5iwceXyVRqsF9lQqXu3A1k=;
 b=uZvcaycZbWDElgfBKu8TBnCRxEsxvAXThU88ZGJXYsnaFGf+TvWuQkuaPUTkyN8PE1LfPH3JR1B/YKWzmdU387rovgM7N3b1J4AfbhVvztxqMLNlgWzv86yiYokCTShC6jrBCLvs9i0e3BBDfsXSXy8DrmugoFKZ2xXZsai7juGwlm6E+SLtlXIERJzoz7PEuqAijdApo9iojCfKdojya+ypa0iNT+Z3zPvYCAUJFmBWe3Pjl9mXE/i+vL/k3SZVT03ybnhu+0eJOfJePid0psOu8mkz2dpKGDhK8m6rBt1ytYkylzQTTUjTzlu5kqFW4+W5A3WXEhXBLAEPBD+OQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3358.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.2; Wed, 19 Aug
 2026 15:33:58 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.000; Wed, 19 Aug 2026
 15:33:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/2] strace: Increase ptest timeout from 600 to 900
Date: Wed, 19 Aug 2026 17:33:46 +0200
Message-ID: <20260819153346.64078-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819153346.64078-1-jaipaul.cheernam@est.tech>
References: <20260819153346.64078-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0174.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3358:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4ed1c0-44c4-446b-c34e-08defe0749a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|3023799007|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TCKfkyH6h4KVKJxJUHSCs/Umdx3pMnrSDt1eM7GiCPRS/p9X3UnTyXzxD06oF0p2f0wUBFmXJRAlziHpYGek9Vg4EL5+FIAEqc0GpNyamoY2M5TcgQRFXvvg1sHqGNJj7B4+zybG7H6K+t67OTJ8jX8AtVCdNvfiJBI+uYRFNHZ9Vbn4X0763JIqmL/LKtAQii/lOe8Oai63ypsU5yqZvkbeDZ+SAjj4Stx7X3AmzL4R8PyjOvaSx43B/V9RX1NITyeSoCasT632fxdzz8xEzyN0LKfmRYS74Yy1QuwjmUzoidenETkc9wyhsP6jZnvzq2pDCHYKG3DQ7jLc0rIAqcZhMKhiYGfTjNhAOzyC+9X2jluGGpDYKjXbb2fUAF81fC0E1+77yZzlW+kW28Eq11SOYYl0HMyTrkPWqgSoTMJ1xw8nzSsHI9o2l7kvU6i/RM1PAHP8F+NhnVi2eQdkAk3CI+Hvu23CNBwRJtVwOnSW6xABXqbn1vXRJFTor9wiXqQrnX28IsNJcRrtzwTtTaFyFPmLYqgyV+2IhroIoy/6m8SRVWjzO4fQUGLeXB6cwiotqr3JM6WY9GEfIK8mYu/pO7GRMFbvPRgFAYbGSCZ0+ldGG7Tcy16AVILwfEdJMSZMt11NHy4hMgTFbnwB6rBnQdeNcxlL/bIKvkgi4Ms=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8noz4fjikeXq7r/v44eQTFgOPWIbX75Gqs1PFyhu0i1yN09ThBkTRwdSXmgR?=
 =?us-ascii?Q?BA0VEZROR6Jy7SVnWL2v2OQ8taVWeCS6rC9lC/hDGnAodu1ANCx1Ex8A55D0?=
 =?us-ascii?Q?7hV8CnMInnBE/HsVIhSZdV+rd+T08n0gzS+5gsAXexKpicV3v9NZOeU0ernw?=
 =?us-ascii?Q?45u6hcbvOMcQt4yKc6rhlalE++Ea71UIoZ5e/ou6Q9yr7xXL/+WUnIP71Dg2?=
 =?us-ascii?Q?UQ65CCOu6S2/8heCN5ImAeJU+CtHYaOcpVd5ZvqQ1ZXGrsQcWvbhJebYIgte?=
 =?us-ascii?Q?qkCeijruj1LYAincbgoSf+H28afkFVezL+xYzxEDIgRKQMvpVfZVknhflQfE?=
 =?us-ascii?Q?ZXL7ZyyAgvedkwpt0pxwdMLGu3oD1PUlGuHw14UBfeRe+7Nir6S/DU7pLFpN?=
 =?us-ascii?Q?HdwpVRbgXnsXbiVZWLL7y6zdFYpZUP3/8K2/eTbzPyIbewqv/Pb1CVbnNdKB?=
 =?us-ascii?Q?YRIx+ajHuCBvjGMTXPc8KkYS6UKV0AN/6YfJto4w9vxPtr4WJJKKjZ4Wwy2S?=
 =?us-ascii?Q?fJiisRu0DDGfGxHWbJTXlyCq9N70s5okHpXH6JusljVlHNsTL80JGTnMjWfe?=
 =?us-ascii?Q?2YLsjHkINFOrW1OkXp4xwYGq0XuxnBEg6GMF0xFBZcaizfNkNHPkUy3dEOYi?=
 =?us-ascii?Q?6giyWlrRem4ALSvV054f1OYAC0GC6ZFfNokSes61wxcyLni79jtAqK30p064?=
 =?us-ascii?Q?KNytiW6ZVZocVDbRxqJeSpQKMNytpB6s9d29nsHqAA+lyRH7Z9Ub3rVPYk6o?=
 =?us-ascii?Q?gvKuqceeH/EVV2nqbcZhwJSjgFA7pUguBhyN/081A8AwLJb7eByA1+PSWvM1?=
 =?us-ascii?Q?hZTQ+Ddmx0ueqZz+oCsJ7mN6Xu2JNiEhdAlL+xAvBr5i1a4XkjYG//wv9ZAS?=
 =?us-ascii?Q?pnyU9XjrdBGZpr2LcVGxiQ+qz/x4CIs29EVLw27SthD55ggRIbX3bhWD8Scu?=
 =?us-ascii?Q?wLK5+ayzaoe7uoMxR+iLp8Jebjpzok5nwOuGovXE8h40s0YQR4nxeN9Ut4hk?=
 =?us-ascii?Q?NxK9dZRlMwNT8HOAOh+YnFtue9gg1CACDgbe1btzVWVZjDswfF/0nhqwTU/b?=
 =?us-ascii?Q?onFJkY3lg63TqKnQrj6g92iGW97yReaVtTrdiIrj39djZYThP5KEXHJ3h4m6?=
 =?us-ascii?Q?0GHa2KghDjXYrpuZpWDb43xQbzamd4Lqw5QXLIPFDO2YRBbj2Qz3Z06WfrWD?=
 =?us-ascii?Q?vbj/dq2BnvN89zefJKrzz6FVi9XOK2oBw+2Ns9qaQxqXgdA+8xMSD/qucmTC?=
 =?us-ascii?Q?9GZey6yuXncTXJhSmu+2swP6oIIeK7CAx780i1hmMF80Ggy4VLIMXXaGPufL?=
 =?us-ascii?Q?BvpjVZePYR+4lWHMj5y6prcSYFsEfxwh8mkK8dLhJE4gMSo+hfByvqJiSlc7?=
 =?us-ascii?Q?8JM2EBpjzwP0cD4UCAKDuLFMag8w0/hqwwwmw6ty/eD7LWzSQ43yalU3X2Xb?=
 =?us-ascii?Q?c1aGb5Y6/xUGroGJy61TRod3PKYsWD0RVyoCH65W22jO/hT58FRNP43vGqS2?=
 =?us-ascii?Q?u6aajSFSCdGZ6PcLsc0+jJuI8D/jo14eFGrs+89KTgLt5eOOiA+OPF/0yqzy?=
 =?us-ascii?Q?a8DEpUh+i8mc2miPwOupd6vqx8H2QUp/kqx6tGbwrqxMqR1fMGM4m4lRy2YP?=
 =?us-ascii?Q?Es9zCYe6txnnXbF26oMjzbwO7jk5qigjOLpvpAFEWgn0K+mmQgfX68erxPcc?=
 =?us-ascii?Q?XO6ZehcMYEEpuLbW+E6t5Hsg1AOCkAKkYz1GDEODaA5ZwOlZhbZOKR51HW33?=
 =?us-ascii?Q?Yd/hS/qmJA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4ed1c0-44c4-446b-c34e-08defe0749a0
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:33:58.7667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXP7YbxfgqcDIzBTVmOKU9mS1dSyJC1Woei+BGvdZkniK4uow3JRCuP0Fxp5imJpAOrItV018c1MsgVEhNBEx47O1y+EXVhzEc+RAs+cljA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243735

- The filtering_syscall-syntax test runs ~12,000 strace invocations and
  was already borderline at the 600s limit. During regression test timeout =
triggered.

Failure Log:
  CPU time limit exceeded    (core dumped) diff -u -- "$expected" "$output"
  ../../ptest/tests/init-once.sh: line 133: log: No such file or directory
  filtering_syscall-syntax.test: failed test: time limit (600) exceeded
  FAIL filtering_syscall-syntax.test (exit status: 124)

ptest results: DURATION: 1378
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for strace 7.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
TOTAL: 1489
PASS:  1203
SKIP:  286
XFAIL: 0
FAIL:  0
XPASS: 0
ERROR: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/strace/strace/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-d=
evtools/strace/strace/run-ptest
index d9248df225..568f44e8a7 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -2,7 +2,7 @@
=20
 set -u
=20
-export TIMEOUT_DURATION=3D600
+export TIMEOUT_DURATION=3D900
 make -j4 -B -C tests -k test-suite.log
 res=3D$?
 if [ $res -ne 0 ]; then

