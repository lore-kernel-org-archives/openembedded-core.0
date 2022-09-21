Return-Path: <Bhabu.Bindu@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A09ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 08:55:11 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.76])
 by mx.groups.io with SMTP id smtpd.web08.4175.1663750504073494136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 01:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=VmQjJkJH;
 spf=pass (domain: kpit.com, ip: 40.107.222.76,
 mailfrom: bhabu.bindu@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TckBonZMc5THYrx623dzcEzQzWIvaCKPV/z2ZMI00V1vrZZaTpdGi07Dd5jKr9NbUHrDu4/yY849/alRNto9vns9SrvNABQ8DZaVKGxGcHcq9PcmgC9qsT8b9l9Xmbl9GHvayKnHefCfDbML6GuZ8BX+/mBASGma2NPVc4CGRzs6OSIB65tsQmsZhUGOFw1a43TayH6Uaj+8xAWYSNIYdY/X52OVPOGo4s3XbkFA6VxiyhUuCPJfcTJy02bmxGKbvAu06hMREOVeSarAtwqjcGTYEjli/hrJ7zbmI7+jsbx+kfCB+tjROchECFs1lGaNvBkM1uFvOah7KzDF9iG7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo5WnJ1DblHcXA0oGCiIdawo7Hz/tFmznMqiYzWbcnw=;
 b=djht3s/sDoAuFKMuuKfMVcqyZfaSyVl/tD0MQhxeHOo9JPLmj0pQ+hy6TdE3pj6C9A7GmwF+W0Log3e22ZtxgYH06uGfJqsPYAGExVbKsouhg+viAuv2ghqFcEzcycT/94tpoPW/UJN7H+XdQHqHPeWa4k2xQJ2VWK5YmoXyqyauXZ7L5+CLfDiRhlYHCyDyi9myuT0Vpg1ehOfZn310NNkZQxP3U5Q68f1iOdmExs8yyOymbbL8EKMNV11buvn8PwXQvaUjpo8gER85y8TOJuXggIMminrdkv+WIc/Qlw7I+JnYl9cuB4pe8sQEFjw6+YNgsgCPB8lqiaIK7CliSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo5WnJ1DblHcXA0oGCiIdawo7Hz/tFmznMqiYzWbcnw=;
 b=VmQjJkJH/KjYUvxBQ+u7h5/x938Il2zkNjA4UjhdZNC3fMM0xHPcASmpID9tFck/3hjGssQYs2GU2LTTT4/jTy8asLrZwdRKRHrPiCrLutmEEE+0xKV4ELlQneUFWr+JoZ876/X8zSr2zMeRYqqyYHDLJQBsgbSiWd2HKKwrapY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6124.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:88::7)
 by MA0PR01MB6470.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:74::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.15; Wed, 21 Sep
 2022 08:54:53 +0000
Received: from PN3PR01MB6124.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd67:9b2:9230:7765]) by PN3PR01MB6124.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd67:9b2:9230:7765%9]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 08:54:53 +0000
From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] qemu: Fix CVE-2021-3611
Date: Wed, 21 Sep 2022 14:24:40 +0530
Message-Id: <20220921085440.10735-1-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=no
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To PN3PR01MB6124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:88::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB6124:EE_|MA0PR01MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6f0072-5f56-493c-6fba-08da9baef32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VyAIVaJIUYbgPlLopHO1FUhC2HaXz0TgwJFXQiO7N1hufJHoFXe4kNePDfWogqP2mMmo/21b7rA17cbZ3mRfCSMYRfleIQxY6iWJEDDHvZUVimz7+2LSl3UKLjesgXNHy3BJsb4IUDx25ZNiEIcf7kDZrd9/307DoGE35dzeq1TcfV7WW+dteoHkcz6aGrYDtelUPb3fJOYe74LvkUITRqwIX/3u1pZqvSy4YY3VFYcBSGb8b32Okv0FmfKXNvqIp9ZGbPKSdIefp2WgmEU4upDdx04RFMl+hBwTC8rDAKDHHYRSL/8/nRdzyuHgxydARI7yj+s/BTEDP9/YjPi2CjIUbl6FM4TMNTK6Ipyc+jRqEaRpMkIRV7Z8LHTRkxO/K24ONmvDfEsE8YKIL2ffgEosMIVanR0Ar1VyWzxDF0ZD9LhQye+KAJ2CoDzIg42udQC4PVHT8+FLyLj1Ifv8DNWqo7AN4orF69E11hh8u9UBArkOSTjOD2mkyJ+/loN3ZhuapfjbdZfOFahePO4Ynep8VPE0dzrk4eZVXiwB7eGPx8Nr33bfhDYLw6bFrFYIJeK6xyV6jQsIRUUO/d0ujU1Lk7Dhgp4dcEBMHOBApGwwb5VMYLuzJOPHbSxzbRWbsJnSoTlL5JJY7bgMgM8ere0gr7H8bumHLFh3gRoWBh4kq+hPhunmFmbqftdv6jk4XAbcsWdzK7T8VphjAAUFDP/IthlcxNKYnusUAcNAMGLRXgkbHPnofGjc4iqOtk5OrwTls7mG06LRl51p1bwuS2Tr0Pqkq891aEGvF404DPAhH2d7fMf4GpzsM1M+h9Yr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6124.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(41300700001)(66574015)(30864003)(83380400001)(44832011)(66556008)(2906002)(66476007)(52116002)(186003)(1076003)(966005)(478600001)(38100700002)(6486002)(6506007)(107886003)(2616005)(6666004)(8676002)(5660300002)(316002)(66946007)(4326008)(6512007)(86362001)(8936002)(36756003)(579004)(559001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PDwU1m3as6BMtHniK8U/gFd81ONAExETR62eQ+ff0FOYyPXUwHk608MgQuqW?=
 =?us-ascii?Q?wExUTtik1ybsB6UN1/4l03YMfvpABYffx3KJCKeCPoFaZibsGvmqxIuK0IFW?=
 =?us-ascii?Q?qmYhclOSMztrjT6xnzdXkMtxQ1kvdaTvbT0le1lsDe9PL4ZZCIxYDqQyg1pT?=
 =?us-ascii?Q?IYzVW4Wq/XwhsXDuH2H489/GXqHTWW8QPnX3flU4EIlHHL4EYL4rzXTvnXO6?=
 =?us-ascii?Q?oyTOQ3/vz7zBR1TLSO4liDrPg9qTC+ut36aeTHD0W+D++wadNCKaOaiJPBMa?=
 =?us-ascii?Q?RSjtVQT+VZykBbWRyQTuvmYOMQLes+3OUx+3GRaWSXwQ4DkeCi8gks2ipGM7?=
 =?us-ascii?Q?qCHqfFt/VgpFiy/5dhvB4jzLtYqUV4T7of/D5dWEGCafsZ/w2zwdbeDSxS3A?=
 =?us-ascii?Q?isKD6Lv+vyev/BbWPHZEh1v7bkyJCa3zhJWCiQXFgz7mnGNi21faXBFbKDTk?=
 =?us-ascii?Q?KPT13FVJDRUH221RCv7Gpw1UQX3w6UBlTF0I+Mz9zJRahlpkQczwKLeua0oR?=
 =?us-ascii?Q?lVthhXw0pm5d6Oi69UnctV6nnrnj4UC1JZ6XbaHGHxExHG0cZmhzlicHtmyz?=
 =?us-ascii?Q?eWDWO80gZxd9cIA+ygKCUGclmdl/7iPLpI67bGMPpQYJhVMbVVYwrWOOolzv?=
 =?us-ascii?Q?W5ZVTLRNJZR94EYANGztrhVRuI+eh4B+QGYJ0m0LhoD3NYK+/4BUKyrrWdB0?=
 =?us-ascii?Q?hAlL0fndAUk3Ht/1ajMPlPXrE23wafchrKo0qjlv0/VJVuzUwAxWGE6p2z5J?=
 =?us-ascii?Q?QGi07AlZVHssSJNGpEfZIEnf5WddQBkN1rors3NvBJ7TCxnsz/bGr/B4/zp+?=
 =?us-ascii?Q?ioPvjfqVb0RSmzhLp8k5db65ymw4flidcCGnUZXtlxSsa8x27wJBangcUDYV?=
 =?us-ascii?Q?bFDGWiFpjrZ3h9HSXAaIHVeSqyrcfa9vz3uz83V40Rr+dXiM2AVEAXk+54/m?=
 =?us-ascii?Q?chbJ7Raj6I5FeWQxYMZS5I3jhP+PbrUGHLyiRaKG+CQBoKHv7jopdP9Hdj6Y?=
 =?us-ascii?Q?p7CJLpPbw1MeD4gTDxghYaJp1cnvDDJUy12W4qcF1oS7wunsofU7EFvPvBOE?=
 =?us-ascii?Q?2rjnQPNIXdJzfN66P2g5LccPO/v7lGhFrc2hBYBVYnsI4nFMA56RtmuORI1T?=
 =?us-ascii?Q?yQgdJkz+tJKPj0+ZOxgXsTHGURE1wGoDmewTIY3Ysv87dkgz7bQaqj4xnG61?=
 =?us-ascii?Q?kZXhtQbM5je11zAiAZkDAaqLgLsdRm/fBMx5G1JTlb37iRIMp6GiP4EEiHTH?=
 =?us-ascii?Q?febYICGL8CVJ4ZnsqtfS7FSviZMT5RYNNqXiGsX2G6LMCoDalK5k1hFuS5qM?=
 =?us-ascii?Q?wvSJhqt+5nVRcbAn3ciBuGlPycpSrjBdvHip3iDYWGfMa06BceE0zrWDKPDZ?=
 =?us-ascii?Q?ldE0UE3DiT58moPXxcsmItEtm5Z8i2uVi6C+yneM5tlN5cqSIx9u0Fm5XXG5?=
 =?us-ascii?Q?vM41+K9pJSzO3wKlC4HOoyUPkkGk8ECCmCdb/WEX3zfvgIXHpoBdKXEzEIqD?=
 =?us-ascii?Q?/VKtSkMPi2JDSiMhqYjodnLZrM3LYzzD1sGv9W1St8p7l555kuygrUDCHqLo?=
 =?us-ascii?Q?G0+JjtzH+/BwFnYZOoawGrhdo5IwFxHe8W+bIaTaKcii7CF1eKD3ZrJ2rS6p?=
 =?us-ascii?Q?r2L9VfGcyoopTtsdzf7YR0LHFTKvQhBtOHLIaDdb3XFU?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e6f0072-5f56-493c-6fba-08da9baef32c
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6124.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 08:54:53.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 alsMbFNd2aCvX7kA+XqjvlFebCvl+FF7+O2cN28loYXh8hl644vMINQlg+NWa3XR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 08:55:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170942

As per the ubuntu community [https://ubuntu.com/security/CVE-2021-3611]
To fix CVE-2021-3611 we need to backport the below support patches as well
Link: https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D41d5e8da3d5e0a143a9=
fb397c9f34707ec544997
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D7ccb391ccd594b3f33d=
e8deb293ff8d47bb4e219
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D7a36e42d9114474278c=
e30ba36945cc62292eb60
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4afd0f2f220ec3dc851=
8b8de0d66cbf8d2fd1be7
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D23faf5694ff8054b847=
e9733297727be4a641132
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dba06fe8add5b788956a=
7317246c6280dfc157040
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Da1d4b0a3051b3079c8d=
b607f519bc0fcb30e17ec
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dc0ee1527358474c7506=
7993d1bb233ad3a4ee081
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D5e468a36dcdd8fd5eb0=
4282842b72967a29875e4
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De2d784b67dc724a9b08=
54b49255ba0ee8ca46543
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D959384e74e1b508acc3=
af6e806b3d7b87335fc2a
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D392e48af3468d7f8e49=
db33fdc9e28b5f99276ce
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D1e5a3f8b2a976054da9=
6cbbb9de6cbac7c2efb79
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D292e13142d277c15bdd=
68331abc607e46628b7e1
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D2280c27afc65bb2af95=
dd44a88e3b7117bfe240a
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D34cdea1db600540a526=
1dc474e986f28b637c8e6
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D24aed6bcb6b6d266149=
591f955c2460c28759eb4
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dcd1db8df7431edd2210=
ed0123e2e09b9b6d1e621
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Da423a1b523296f8798a=
5851aaaba64dd166c0a74
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D398f9a84ac7132e38ca=
f7b066273734b3bf619ff
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D6bebb270731758fae31=
14b7d24c2b12b7c325cc5
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4a63054bce23982b99f=
4d3c65528e47e614086b2

Add patches to fix CVE-2021-3611
Link: https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=3Dbe5a8cf347d0c47ee3e9=
33dde075526fd8bd5c40
      https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=3D79fa99831debc9782087=
e834382c577215f2f511

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   24 +
 ...32t-for-reply-queue-head-tail-values.patch |   83 +
 ...id_function_take_MemTxAttrs_argument.patch |   60 +
 ...et_function_take_MemTxAttrs_argument.patch |   98 ++
 ...ed_function_take_MemTxAttrs_argument.patch |   78 +
 ...rw_function_take_MemTxAttrs_argument.patch |  158 ++
 ...te_function_take_MemTxAttrs_argument.patch | 1453 +++++++++++++++++
 ...ap_function_take_MemTxAttrs_argument.patch |  227 +++
 ..._buf_rw_function_take_a_void_pointer.patch |   41 +
 ..._dma_buf_write_functions_take_a_void.patch |  167 ++
 ...rw_function_take_MemTxAttrs_argument.patch |   91 ++
 ...rw_function_take_MemTxAttrs_argument.patch |   65 +
 ...te_function_take_MemTxAttrs_argument.patch |  129 ++
 ...ad_function_take_MemTxAttrs_argument.patch |  222 +++
 ...uf_rw_function_propagate_MemTxResult.patch |   91 ++
 ...ma_function_take_MemTxAttrs_argument.patch |  120 ++
 ...ma_function_take_MemTxAttrs_argument.patch |  151 ++
 ...r_dma_function_propagate_MemTxResult.patch |   65 +
 ...r_dma_function_propagate_MemTxResult.patch |  175 ++
 ...ma_function_take_MemTxAttrs_argument.patch |  303 ++++
 ...ma_function_take_MemTxAttrs_argument.patch |  271 +++
 ...i_dma_function_propagate_MemTxResult.patch |   47 +
 ...i_dma_function_propagate_MemTxResult.patch |  296 ++++
 .../qemu/qemu/CVE-2021-3611_1.patch           |   74 +
 .../qemu/qemu/CVE-2021-3611_2.patch           |   43 +
 25 files changed, 4532 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-use-uint32t-for-re=
ply-queue-head-tail-values.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002_let_dma_memory_val=
id_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003_let_dma_memory_set=
_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004_let_dma_memory_rw_=
relaxed_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005_let_dma_memory_rw_=
function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006_let_dma_memory_rea=
d_write_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007_let_dma_memory_map=
_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0008_have_dma_buf_rw_fu=
nction_take_a_void_pointer.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0009_have_dma_buf_read_=
and_dma_buf_write_functions_take_a_void.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010_let_pci_dma_rw_fun=
ction_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011_let_dma_buf_rw_fun=
ction_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012_let_dma_buf_write_=
function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013_let_dma_buf_read_f=
unction_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014_let_dma_buf_rw_fun=
ction_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0015_let_st_pointer_dma=
_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0016_let_ld_pointer_dma=
_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0017_let_st_pointer_dma=
_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0018_let_ld_pointer_dma=
_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0019_let_st_pointer_pci=
_dma_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0020_let_ld_pointer_pci=
_dma_function_take_MemTxAttrs_argument.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0021_let_st_pointer_pci=
_dma_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0022_let_ld_pointer_pci=
_dma_function_propagate_MemTxResult.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3611_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3611_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index a493ac8add..c8ca7c545c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,30 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.=
xz \
            file://CVE-2022-0358.patch \
            file://CVE-2022-0216_1.patch \
            file://CVE-2022-0216_2.patch \
+           file://0001-use-uint32t-for-reply-queue-head-tail-values.patch =
\
+           file://0002_let_dma_memory_valid_function_take_MemTxAttrs_argum=
ent.patch \
+           file://0003_let_dma_memory_set_function_take_MemTxAttrs_argumen=
t.patch \
+           file://0004_let_dma_memory_rw_relaxed_function_take_MemTxAttrs_=
argument.patch \
+           file://0005_let_dma_memory_rw_function_take_MemTxAttrs_argument=
.patch \
+           file://0006_let_dma_memory_read_write_function_take_MemTxAttrs_=
argument.patch \
+           file://0007_let_dma_memory_map_function_take_MemTxAttrs_argumen=
t.patch \
+           file://0008_have_dma_buf_rw_function_take_a_void_pointer.patch =
\
+           file://0009_have_dma_buf_read_and_dma_buf_write_functions_take_=
a_void.patch \
+           file://0010_let_pci_dma_rw_function_take_MemTxAttrs_argument.pa=
tch \
+           file://0011_let_dma_buf_rw_function_take_MemTxAttrs_argument.pa=
tch \
+           file://0012_let_dma_buf_write_function_take_MemTxAttrs_argument=
.patch \
+           file://0013_let_dma_buf_read_function_take_MemTxAttrs_argument.=
patch \
+           file://0014_let_dma_buf_rw_function_propagate_MemTxResult.patch=
 \
+           file://0015_let_st_pointer_dma_function_take_MemTxAttrs_argumen=
t.patch \
+           file://0016_let_ld_pointer_dma_function_take_MemTxAttrs_argumen=
t.patch \
+           file://0017_let_st_pointer_dma_function_propagate_MemTxResult.p=
atch \
+           file://0018_let_ld_pointer_dma_function_propagate_MemTxResult.p=
atch \
+           file://0019_let_st_pointer_pci_dma_function_take_MemTxAttrs_arg=
ument.patch \
+           file://0020_let_ld_pointer_pci_dma_function_take_MemTxAttrs_arg=
ument.patch \
+           file://0021_let_st_pointer_pci_dma_function_propagate_MemTxResu=
lt.patch \
+           file://0022_let_ld_pointer_pci_dma_function_propagate_MemTxResu=
lt.patch \
+           file://CVE-2021-3611_1.patch \
+           file://CVE-2021-3611_2.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"

diff --git a/meta/recipes-devtools/qemu/qemu/0001-use-uint32t-for-reply-que=
ue-head-tail-values.patch b/meta/recipes-devtools/qemu/qemu/0001-use-uint32=
t-for-reply-queue-head-tail-values.patch
new file mode 100644
index 0000000000..37e122f781
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-use-uint32t-for-reply-queue-head=
-tail-values.patch
@@ -0,0 +1,83 @@
+From 41d5e8da3d5e0a143a9fb397c9f34707ec544997 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 22:43:05 +0100
+Subject: [PATCH] hw/scsi/megasas: Use uint32_t for reply queue head/tail
+ values
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+While the reply queue values fit in 16-bit, they are accessed
+as 32-bit:
+
+  661:    s->reply_queue_head =3D ldl_le_pci_dma(pcid, s->producer_pa);
+  662:    s->reply_queue_head %=3D MEGASAS_MAX_FRAMES;
+  663:    s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa);
+  664:    s->reply_queue_tail %=3D MEGASAS_MAX_FRAMES;
+
+Having:
+
+  41:#define MEGASAS_MAX_FRAMES 2048         /* Firmware limit at 65535 */
+
+In order to update the ld/st*_pci_dma() API to pass the address
+of the value to access, it is simpler to have the head/tail declared
+as 32-bit values. Replace the uint16_t by uint32_t, wasting 4 bytes in
+the MegasasState structure.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D41d5e8da3d5e0a143a9fb397c9f34707ec544997]
+
+Acked-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-20-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/scsi/megasas.c    | 4 ++--
+ hw/scsi/trace-events | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index 8f35784..14ec6d6 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -109,8 +109,8 @@ struct MegasasState {
+     uint64_t reply_queue_pa;
+     void *reply_queue;
+     uint16_t reply_queue_len;
+-    uint16_t reply_queue_head;
+-    uint16_t reply_queue_tail;
++    uint32_t reply_queue_head;
++    uint32_t reply_queue_tail;
+     uint64_t consumer_pa;
+     uint64_t producer_pa;
+
+diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
+index 92d5b40..ae8551f 100644
+--- a/hw/scsi/trace-events
++++ b/hw/scsi/trace-events
+@@ -42,18 +42,18 @@ mptsas_config_sas_phy(void *dev, int address, int port=
, int phy_handle, int dev_
+
+ # megasas.c
+ megasas_init_firmware(uint64_t pa) "pa 0x%" PRIx64 " "
+-megasas_init_queue(uint64_t queue_pa, int queue_len, uint64_t head, uint6=
4_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx64 "=
 tail 0x%" PRIx64 " flags 0x%x"
++megasas_init_queue(uint64_t queue_pa, int queue_len, uint32_t head, uint3=
2_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx32 "=
 tail 0x%" PRIx32 " flags 0x%x"
+ megasas_initq_map_failed(int frame) "scmd %d: failed to map queue"
+ megasas_initq_mapped(uint64_t pa) "queue already mapped at 0x%" PRIx64
+ megasas_initq_mismatch(int queue_len, int fw_cmds) "queue size %d max fw =
cmds %d"
+ megasas_qf_mapped(unsigned int index) "skip mapped frame 0x%x"
+ megasas_qf_new(unsigned int index, uint64_t frame) "frame 0x%x addr 0x%" =
PRIx64
+ megasas_qf_busy(unsigned long pa) "all frames busy for frame 0x%lx"
+-megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t conte=
xt, unsigned int head, unsigned int tail, int busy) "frame 0x%x count %d co=
ntext 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
+-megasas_qf_update(unsigned int head, unsigned int tail, unsigned int busy=
) "head 0x%x tail 0x%x busy %d"
++megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t conte=
xt, uint32_t head, uint32_t tail, unsigned int busy) "frame 0x%x count %d c=
ontext 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
++megasas_qf_update(uint32_t head, uint32_t tail, unsigned int busy) "head =
0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
+ megasas_qf_map_failed(int cmd, unsigned long frame) "scmd %d: frame %lu"
+ megasas_qf_complete_noirq(uint64_t context) "context 0x%" PRIx64 " "
+-megasas_qf_complete(uint64_t context, unsigned int head, unsigned int tai=
l, int busy) "context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
++megasas_qf_complete(uint64_t context, uint32_t head, uint32_t tail, int b=
usy) "context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
+ megasas_frame_busy(uint64_t addr) "frame 0x%" PRIx64 " busy"
+ megasas_unhandled_frame_cmd(int cmd, uint8_t frame_cmd) "scmd %d: MFI cmd=
 0x%x"
+ megasas_handle_scsi(const char *frame, int bus, int dev, int lun, void *s=
dev, unsigned long size) "%s dev %x/%x/%x sdev %p xfer %lu"
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002_let_dma_memory_valid_func=
tion_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0002_=
let_dma_memory_valid_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..04a655315f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002_let_dma_memory_valid_function_ta=
ke_MemTxAttrs_argument.patch
@@ -0,0 +1,60 @@
+From 7ccb391ccd594b3f33de8deb293ff8d47bb4e219 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Thu, 3 Sep 2020 09:28:49 +0200
+Subject: [PATCH] dma: Let dma_memory_valid() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling
+dma_memory_valid().
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D7ccb391ccd594b3f33de8deb293ff8d47bb4e219]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20211223115554.3155328-2-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ include/hw/ppc/spapr_vio.h | 2 +-
+ include/sysemu/dma.h       | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
+index 4bea87f..4c45f15 100644
+--- a/include/hw/ppc/spapr_vio.h
++++ b/include/hw/ppc/spapr_vio.h
+@@ -91,7 +91,7 @@ static inline void spapr_vio_irq_pulse(SpaprVioDevice *d=
ev)
+ static inline bool spapr_vio_dma_valid(SpaprVioDevice *dev, uint64_t tadd=
r,
+                                        uint32_t size, DMADirection dir)
+ {
+-    return dma_memory_valid(&dev->as, taddr, size, dir);
++    return dma_memory_valid(&dev->as, taddr, size, dir, MEMTXATTRS_UNSPEC=
IFIED);
+ }
+
+ static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t taddr,
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index 3201e79..296f3b5 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -73,11 +73,11 @@ static inline void dma_barrier(AddressSpace *as, DMADi=
rection dir)
+  * dma_memory_{read,write}() and check for errors */
+ static inline bool dma_memory_valid(AddressSpace *as,
+                                     dma_addr_t addr, dma_addr_t len,
+-                                    DMADirection dir)
++                                    DMADirection dir, MemTxAttrs attrs)
+ {
+     return address_space_access_valid(as, addr, len,
+                                       dir =3D=3D DMA_DIRECTION_FROM_DEVIC=
E,
+-                                      MEMTXATTRS_UNSPECIFIED);
++                                      attrs);
+ }
+
+ static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003_let_dma_memory_set_functi=
on_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0003_le=
t_dma_memory_set_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..f13707a407
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003_let_dma_memory_set_function_take=
_MemTxAttrs_argument.patch
@@ -0,0 +1,98 @@
+From 7a36e42d9114474278ce30ba36945cc62292eb60 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Thu, 3 Sep 2020 10:28:32 +0200
+Subject: [PATCH] dma: Let dma_memory_set() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling
+dma_memory_set().
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D7a36e42d9114474278ce30ba36945cc62292eb60]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20211223115554.3155328-3-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/nvram/fw_cfg.c          | 3 ++-
+ include/hw/ppc/spapr_vio.h | 3 ++-
+ include/sysemu/dma.h       | 3 ++-
+ softmmu/dma-helpers.c      | 5 ++---
+ 4 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
+index c06b30d..f7803fe 100644
+--- a/hw/nvram/fw_cfg.c
++++ b/hw/nvram/fw_cfg.c
+@@ -399,7 +399,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
+              * tested before.
+              */
+             if (read) {
+-                if (dma_memory_set(s->dma_as, dma.address, 0, len)) {
++                if (dma_memory_set(s->dma_as, dma.address, 0, len,
++                                   MEMTXATTRS_UNSPECIFIED)) {
+                     dma.control |=3D FW_CFG_DMA_CTL_ERROR;
+                 }
+             }
+diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
+index 4c45f15..c90e74a 100644
+--- a/include/hw/ppc/spapr_vio.h
++++ b/include/hw/ppc/spapr_vio.h
+@@ -111,7 +111,8 @@ static inline int spapr_vio_dma_write(SpaprVioDevice *=
dev, uint64_t taddr,
+ static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
+                                     uint8_t c, uint32_t size)
+ {
+-    return (dma_memory_set(&dev->as, taddr, c, size) !=3D 0) ?
++    return (dma_memory_set(&dev->as, taddr,
++                           c, size, MEMTXATTRS_UNSPECIFIED) !=3D 0) ?
+         H_DEST_PARM : H_SUCCESS;
+ }
+
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index 296f3b5..d23516f 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -175,9 +175,10 @@ static inline MemTxResult dma_memory_write(AddressSpa=
ce *as, dma_addr_t addr,
+  * @addr: address within that address space
+  * @c: constant byte to fill the memory
+  * @len: the number of bytes to fill with the constant byte
++ * @attrs: memory transaction attributes
+  */
+ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
+-                           uint8_t c, dma_addr_t len);
++                           uint8_t c, dma_addr_t len, MemTxAttrs attrs);
+
+ /**
+  * address_space_map: Map a physical memory region into a host virtual ad=
dress.
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index 7d766a5..1f07217 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -19,7 +19,7 @@
+ /* #define DEBUG_IOMMU */
+
+ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
+-                           uint8_t c, dma_addr_t len)
++                           uint8_t c, dma_addr_t len, MemTxAttrs attrs)
+ {
+     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
+
+@@ -31,8 +31,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t =
addr,
+     memset(fillbuf, c, FILLBUF_SIZE);
+     while (len > 0) {
+         l =3D len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
+-        error |=3D address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
+-                                     fillbuf, l);
++        error |=3D address_space_write(as, addr, attrs, fillbuf, l);
+         len -=3D l;
+         addr +=3D l;
+     }
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0004_let_dma_memory_rw_relaxed=
_function_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/=
0004_let_dma_memory_rw_relaxed_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..cacb12909c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0004_let_dma_memory_rw_relaxed_functi=
on_take_MemTxAttrs_argument.patch
@@ -0,0 +1,78 @@
+From 4afd0f2f220ec3dc8518b8de0d66cbf8d2fd1be7 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Thu, 3 Sep 2020 09:30:10 +0200
+Subject: [PATCH] dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+We will add the MemTxAttrs argument to dma_memory_rw() in
+the next commit. Since dma_memory_rw_relaxed() is only used
+by dma_memory_rw(), modify it first in a separate commit to
+keep the next commit easier to review.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D4afd0f2f220ec3dc8518b8de0d66cbf8d2fd1be7]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20211223115554.3155328-4-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ include/sysemu/dma.h | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index d23516f..3be803c 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -83,9 +83,10 @@ static inline bool dma_memory_valid(AddressSpace *as,
+ static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
+                                                 dma_addr_t addr,
+                                                 void *buf, dma_addr_t len=
,
+-                                                DMADirection dir)
++                                                DMADirection dir,
++                                                MemTxAttrs attrs)
+ {
+-    return address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
++    return address_space_rw(as, addr, attrs,
+                             buf, len, dir =3D=3D DMA_DIRECTION_FROM_DEVIC=
E);
+ }
+
+@@ -93,7 +94,9 @@ static inline MemTxResult dma_memory_read_relaxed(Addres=
sSpace *as,
+                                                   dma_addr_t addr,
+                                                   void *buf, dma_addr_t l=
en)
+ {
+-    return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DEV=
ICE);
++    return dma_memory_rw_relaxed(as, addr, buf, len,
++                                 DMA_DIRECTION_TO_DEVICE,
++                                 MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
+@@ -102,7 +105,8 @@ static inline MemTxResult dma_memory_write_relaxed(Add=
ressSpace *as,
+                                                    dma_addr_t len)
+ {
+     return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
+-                                 DMA_DIRECTION_FROM_DEVICE);
++                                 DMA_DIRECTION_FROM_DEVICE,
++                                 MEMTXATTRS_UNSPECIFIED);
+ }
+
+ /**
+@@ -124,7 +128,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace *=
as, dma_addr_t addr,
+ {
+     dma_barrier(as, dir);
+
+-    return dma_memory_rw_relaxed(as, addr, buf, len, dir);
++    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
++                                 MEMTXATTRS_UNSPECIFIED);
+ }
+
+ /**
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0005_let_dma_memory_rw_functio=
n_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0005_let=
_dma_memory_rw_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..e5daf966d5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0005_let_dma_memory_rw_function_take_=
MemTxAttrs_argument.patch
@@ -0,0 +1,158 @@
+From 23faf5694ff8054b847e9733297727be4a641132 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Thu, 3 Sep 2020 09:37:43 +0200
+Subject: [PATCH] dma: Let dma_memory_rw() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling
+dma_memory_rw().
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D23faf5694ff8054b847e9733297727be4a641132]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20211223115554.3155328-5-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/intc/spapr_xive.c  |  3 ++-
+ hw/usb/hcd-ohci.c     | 10 ++++++----
+ include/hw/pci/pci.h  |  3 ++-
+ include/sysemu/dma.h  | 11 ++++++-----
+ softmmu/dma-helpers.c |  3 ++-
+ 5 files changed, 18 insertions(+), 12 deletions(-)
+
+diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
+index 4ec659b..eae95c7 100644
+--- a/hw/intc/spapr_xive.c
++++ b/hw/intc/spapr_xive.c
+@@ -1684,7 +1684,8 @@ static target_ulong h_int_esb(PowerPCCPU *cpu,
+         mmio_addr =3D xive->vc_base + xive_source_esb_mgmt(xsrc, lisn) + =
offset;
+
+         if (dma_memory_rw(&address_space_memory, mmio_addr, &data, 8,
+-                          (flags & SPAPR_XIVE_ESB_STORE))) {
++                          (flags & SPAPR_XIVE_ESB_STORE),
++                          MEMTXATTRS_UNSPECIFIED)) {
+             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to access ESB @0=
x%"
+                           HWADDR_PRIx "\n", mmio_addr);
+             return H_HARDWARE;
+diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
+index 1cf2816..56e2315 100644
+--- a/hw/usb/hcd-ohci.c
++++ b/hw/usb/hcd-ohci.c
+@@ -586,7 +586,8 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_t=
d *td,
+     if (n > len)
+         n =3D len;
+
+-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) =
{
++    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
++                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
+         return -1;
+     }
+     if (n =3D=3D len) {
+@@ -595,7 +596,7 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_t=
d *td,
+     ptr =3D td->be & ~0xfffu;
+     buf +=3D n;
+     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+-                      len - n, dir)) {
++                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
+         return -1;
+     }
+     return 0;
+@@ -613,7 +614,8 @@ static int ohci_copy_iso_td(OHCIState *ohci,
+     if (n > len)
+         n =3D len;
+
+-    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf, n, dir)) =
{
++    if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
++                      n, dir, MEMTXATTRS_UNSPECIFIED)) {
+         return -1;
+     }
+     if (n =3D=3D len) {
+@@ -622,7 +624,7 @@ static int ohci_copy_iso_td(OHCIState *ohci,
+     ptr =3D end_addr & ~0xfffu;
+     buf +=3D n;
+     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
+-                      len - n, dir)) {
++                      len - n, dir, MEMTXATTRS_UNSPECIFIED)) {
+         return -1;
+     }
+     return 0;
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index e7cdf2d..4383f1c 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -808,7 +808,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, d=
ma_addr_t addr,
+                                      void *buf, dma_addr_t len,
+                                      DMADirection dir)
+ {
+-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir)=
;
++    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
++                         dir, MEMTXATTRS_UNSPECIFIED);
+ }
+
+ /**
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index 3be803c..e8ad422 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -121,15 +121,15 @@ static inline MemTxResult dma_memory_write_relaxed(A=
ddressSpace *as,
+  * @buf: buffer with the data transferred
+  * @len: the number of bytes to read or write
+  * @dir: indicates the transfer direction
++ * @attrs: memory transaction attributes
+  */
+ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr=
,
+                                         void *buf, dma_addr_t len,
+-                                        DMADirection dir)
++                                        DMADirection dir, MemTxAttrs attr=
s)
+ {
+     dma_barrier(as, dir);
+
+-    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
+-                                 MEMTXATTRS_UNSPECIFIED);
++    return dma_memory_rw_relaxed(as, addr, buf, len, dir, attrs);
+ }
+
+ /**
+@@ -147,7 +147,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace *=
as, dma_addr_t addr,
+ static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t ad=
dr,
+                                           void *buf, dma_addr_t len)
+ {
+-    return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
++    return dma_memory_rw(as, addr, buf, len,
++                         DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED)=
;
+ }
+
+ /**
+@@ -166,7 +167,7 @@ static inline MemTxResult dma_memory_write(AddressSpac=
e *as, dma_addr_t addr,
+                                            const void *buf, dma_addr_t le=
n)
+ {
+     return dma_memory_rw(as, addr, (void *)buf, len,
+-                         DMA_DIRECTION_FROM_DEVICE);
++                         DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIE=
D);
+ }
+
+ /**
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index 1f07217..5bf76ff 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -305,7 +305,8 @@ static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, =
QEMUSGList *sg,
+     while (len > 0) {
+         ScatterGatherEntry entry =3D sg->sg[sg_cur_index++];
+         int32_t xfer =3D MIN(len, entry.len);
+-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir);
++        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
++                      MEMTXATTRS_UNSPECIFIED);
+         ptr +=3D xfer;
+         len -=3D xfer;
+         resid -=3D xfer;
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0006_let_dma_memory_read_write=
_function_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/=
0006_let_dma_memory_read_write_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..1973e477f3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0006_let_dma_memory_read_write_functi=
on_take_MemTxAttrs_argument.patch
@@ -0,0 +1,1453 @@
+From ba06fe8add5b788956a7317246c6280dfc157040 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Thu, 3 Sep 2020 10:08:29 +0200
+Subject: [PATCH] dma: Let dma_memory_read/write() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling
+dma_memory_read() or dma_memory_write().
+
+Patch created mechanically using spatch with this script:
+
+  @@
+  expression E1, E2, E3, E4;
+  @@
+  (
+  - dma_memory_read(E1, E2, E3, E4)
+  + dma_memory_read(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
+  |
+  - dma_memory_write(E1, E2, E3, E4)
+  + dma_memory_write(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
+  )
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3Dba06fe8add5b788956a7317246c6280dfc157040]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20211223115554.3155328-6-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/arm/musicpal.c             | 13 +++++++------
+ hw/arm/smmu-common.c          |  3 ++-
+ hw/arm/smmuv3.c               | 14 +++++++++-----
+ hw/core/generic-loader.c      |  3 ++-
+ hw/dma/pl330.c                | 12 ++++++++----
+ hw/dma/sparc32_dma.c          | 16 ++++++++++------
+ hw/dma/xlnx-zynq-devcfg.c     |  6 ++++--
+ hw/dma/xlnx_dpdma.c           | 10 ++++++----
+ hw/i386/amd_iommu.c           | 16 +++++++++-------
+ hw/i386/intel_iommu.c         | 28 +++++++++++++++++-----------
+ hw/ide/macio.c                |  2 +-
+ hw/intc/xive.c                |  7 ++++---
+ hw/misc/bcm2835_property.c    |  3 ++-
+ hw/misc/macio/mac_dbdma.c     | 10 ++++++----
+ hw/net/allwinner-sun8i-emac.c | 18 ++++++++++++------
+ hw/net/ftgmac100.c            | 25 ++++++++++++++++---------
+ hw/net/imx_fec.c              | 32 ++++++++++++++++++++------------
+ hw/net/npcm7xx_emc.c          | 20 ++++++++++++--------
+ hw/nvram/fw_cfg.c             |  9 ++++++---
+ hw/pci-host/pnv_phb3.c        |  5 +++--
+ hw/pci-host/pnv_phb3_msi.c    |  9 ++++++---
+ hw/pci-host/pnv_phb4.c        |  5 +++--
+ hw/sd/allwinner-sdhost.c      | 14 ++++++++------
+ hw/sd/sdhci.c                 | 35 ++++++++++++++++++++++-------------
+ hw/usb/hcd-dwc2.c             |  8 ++++----
+ hw/usb/hcd-ehci.c             |  6 ++++--
+ hw/usb/hcd-ohci.c             | 18 +++++++++++-------
+ hw/usb/hcd-xhci.c             | 18 +++++++++++-------
+ include/hw/ppc/spapr_vio.h    |  6 ++++--
+ include/sysemu/dma.h          | 20 ++++++++++++--------
+ 30 files changed, 241 insertions(+), 150 deletions(-)
+
+diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
+index 2d612cc..2680ec5 100644
+--- a/hw/arm/musicpal.c
++++ b/hw/arm/musicpal.c
+@@ -185,13 +185,13 @@ static void eth_rx_desc_put(AddressSpace *dma_as, ui=
nt32_t addr,
+     cpu_to_le16s(&desc->buffer_size);
+     cpu_to_le32s(&desc->buffer);
+     cpu_to_le32s(&desc->next);
+-    dma_memory_write(dma_as, addr, desc, sizeof(*desc));
++    dma_memory_write(dma_as, addr, desc, sizeof(*desc), MEMTXATTRS_UNSPEC=
IFIED);
+ }
+
+ static void eth_rx_desc_get(AddressSpace *dma_as, uint32_t addr,
+                             mv88w8618_rx_desc *desc)
+ {
+-    dma_memory_read(dma_as, addr, desc, sizeof(*desc));
++    dma_memory_read(dma_as, addr, desc, sizeof(*desc), MEMTXATTRS_UNSPECI=
FIED);
+     le32_to_cpus(&desc->cmdstat);
+     le16_to_cpus(&desc->bytes);
+     le16_to_cpus(&desc->buffer_size);
+@@ -215,7 +215,7 @@ static ssize_t eth_receive(NetClientState *nc, const u=
int8_t *buf, size_t size)
+             eth_rx_desc_get(&s->dma_as, desc_addr, &desc);
+             if ((desc.cmdstat & MP_ETH_RX_OWN) && desc.buffer_size >=3D s=
ize) {
+                 dma_memory_write(&s->dma_as, desc.buffer + s->vlan_header=
,
+-                                          buf, size);
++                                 buf, size, MEMTXATTRS_UNSPECIFIED);
+                 desc.bytes =3D size + s->vlan_header;
+                 desc.cmdstat &=3D ~MP_ETH_RX_OWN;
+                 s->cur_rx[i] =3D desc.next;
+@@ -241,13 +241,13 @@ static void eth_tx_desc_put(AddressSpace *dma_as, ui=
nt32_t addr,
+     cpu_to_le16s(&desc->bytes);
+     cpu_to_le32s(&desc->buffer);
+     cpu_to_le32s(&desc->next);
+-    dma_memory_write(dma_as, addr, desc, sizeof(*desc));
++    dma_memory_write(dma_as, addr, desc, sizeof(*desc), MEMTXATTRS_UNSPEC=
IFIED);
+ }
+
+ static void eth_tx_desc_get(AddressSpace *dma_as, uint32_t addr,
+                             mv88w8618_tx_desc *desc)
+ {
+-    dma_memory_read(dma_as, addr, desc, sizeof(*desc));
++    dma_memory_read(dma_as, addr, desc, sizeof(*desc), MEMTXATTRS_UNSPECI=
FIED);
+     le32_to_cpus(&desc->cmdstat);
+     le16_to_cpus(&desc->res);
+     le16_to_cpus(&desc->bytes);
+@@ -269,7 +269,8 @@ static void eth_send(mv88w8618_eth_state *s, int queue=
_index)
+         if (desc.cmdstat & MP_ETH_TX_OWN) {
+             len =3D desc.bytes;
+             if (len < 2048) {
+-                dma_memory_read(&s->dma_as, desc.buffer, buf, len);
++                dma_memory_read(&s->dma_as, desc.buffer, buf, len,
++                                MEMTXATTRS_UNSPECIFIED);
+                 qemu_send_packet(qemu_get_queue(s->nic), buf, len);
+             }
+             desc.cmdstat &=3D ~MP_ETH_TX_OWN;
+diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
+index 0459850..e09b9c1 100644
+--- a/hw/arm/smmu-common.c
++++ b/hw/arm/smmu-common.c
+@@ -193,7 +193,8 @@ static int get_pte(dma_addr_t baseaddr, uint32_t index=
, uint64_t *pte,
+     dma_addr_t addr =3D baseaddr + index * sizeof(*pte);
+
+     /* TODO: guarantee 64-bit single-copy atomicity */
+-    ret =3D dma_memory_read(&address_space_memory, addr, pte, sizeof(*pte=
));
++    ret =3D dma_memory_read(&address_space_memory, addr, pte, sizeof(*pte=
),
++                          MEMTXATTRS_UNSPECIFIED);
+
+     if (ret !=3D MEMTX_OK) {
+         info->type =3D SMMU_PTW_ERR_WALK_EABT;
+diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
+index 01b60be..3b43368 100644
+--- a/hw/arm/smmuv3.c
++++ b/hw/arm/smmuv3.c
+@@ -102,7 +102,8 @@ static inline MemTxResult queue_read(SMMUQueue *q, voi=
d *data)
+ {
+     dma_addr_t addr =3D Q_CONS_ENTRY(q);
+
+-    return dma_memory_read(&address_space_memory, addr, data, q->entry_si=
ze);
++    return dma_memory_read(&address_space_memory, addr, data, q->entry_si=
ze,
++                           MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static MemTxResult queue_write(SMMUQueue *q, void *data)
+@@ -110,7 +111,8 @@ static MemTxResult queue_write(SMMUQueue *q, void *dat=
a)
+     dma_addr_t addr =3D Q_PROD_ENTRY(q);
+     MemTxResult ret;
+
+-    ret =3D dma_memory_write(&address_space_memory, addr, data, q->entry_=
size);
++    ret =3D dma_memory_write(&address_space_memory, addr, data, q->entry_=
size,
++                           MEMTXATTRS_UNSPECIFIED);
+     if (ret !=3D MEMTX_OK) {
+         return ret;
+     }
+@@ -285,7 +287,8 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t add=
r, STE *buf,
+
+     trace_smmuv3_get_ste(addr);
+     /* TODO: guarantee 64-bit single-copy atomicity */
+-    ret =3D dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf=
));
++    ret =3D dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf=
),
++                          MEMTXATTRS_UNSPECIFIED);
+     if (ret !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "Cannot fetch pte at address=3D0x%"PRIx64"\n", addr=
);
+@@ -306,7 +309,8 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint3=
2_t ssid,
+
+     trace_smmuv3_get_cd(addr);
+     /* TODO: guarantee 64-bit single-copy atomicity */
+-    ret =3D dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf=
));
++    ret =3D dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf=
),
++                          MEMTXATTRS_UNSPECIFIED);
+     if (ret !=3D MEMTX_OK) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "Cannot fetch pte at address=3D0x%"PRIx64"\n", addr=
);
+@@ -411,7 +415,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid,=
 STE *ste,
+         l1ptr =3D (dma_addr_t)(strtab_base + l1_ste_offset * sizeof(l1std=
));
+         /* TODO: guarantee 64-bit single-copy atomicity */
+         ret =3D dma_memory_read(&address_space_memory, l1ptr, &l1std,
+-                              sizeof(l1std));
++                              sizeof(l1std), MEMTXATTRS_UNSPECIFIED);
+         if (ret !=3D MEMTX_OK) {
+             qemu_log_mask(LOG_GUEST_ERROR,
+                           "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr)=
;
+diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
+index d14f932..9a24ffb 100644
+--- a/hw/core/generic-loader.c
++++ b/hw/core/generic-loader.c
+@@ -57,7 +57,8 @@ static void generic_loader_reset(void *opaque)
+
+     if (s->data_len) {
+         assert(s->data_len < sizeof(s->data));
+-        dma_memory_write(s->cpu->as, s->addr, &s->data, s->data_len);
++        dma_memory_write(s->cpu->as, s->addr, &s->data, s->data_len,
++                         MEMTXATTRS_UNSPECIFIED);
+     }
+ }
+
+diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
+index 0cb4619..31ce01b 100644
+--- a/hw/dma/pl330.c
++++ b/hw/dma/pl330.c
+@@ -1111,7 +1111,8 @@ static inline const PL330InsnDesc *pl330_fetch_insn(=
PL330Chan *ch)
+     uint8_t opcode;
+     int i;
+
+-    dma_memory_read(ch->parent->mem_as, ch->pc, &opcode, 1);
++    dma_memory_read(ch->parent->mem_as, ch->pc, &opcode, 1,
++                    MEMTXATTRS_UNSPECIFIED);
+     for (i =3D 0; insn_desc[i].size; i++) {
+         if ((opcode & insn_desc[i].opmask) =3D=3D insn_desc[i].opcode) {
+             return &insn_desc[i];
+@@ -1125,7 +1126,8 @@ static inline void pl330_exec_insn(PL330Chan *ch, co=
nst PL330InsnDesc *insn)
+     uint8_t buf[PL330_INSN_MAXSIZE];
+
+     assert(insn->size <=3D PL330_INSN_MAXSIZE);
+-    dma_memory_read(ch->parent->mem_as, ch->pc, buf, insn->size);
++    dma_memory_read(ch->parent->mem_as, ch->pc, buf, insn->size,
++                    MEMTXATTRS_UNSPECIFIED);
+     insn->exec(ch, buf[0], &buf[1], insn->size - 1);
+ }
+
+@@ -1189,7 +1191,8 @@ static int pl330_exec_cycle(PL330Chan *channel)
+     if (q !=3D NULL && q->len <=3D pl330_fifo_num_free(&s->fifo)) {
+         int len =3D q->len - (q->addr & (q->len - 1));
+
+-        dma_memory_read(s->mem_as, q->addr, buf, len);
++        dma_memory_read(s->mem_as, q->addr, buf, len,
++                        MEMTXATTRS_UNSPECIFIED);
+         trace_pl330_exec_cycle(q->addr, len);
+         if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
+             pl330_hexdump(buf, len);
+@@ -1220,7 +1223,8 @@ static int pl330_exec_cycle(PL330Chan *channel)
+             fifo_res =3D pl330_fifo_get(&s->fifo, buf, len, q->tag);
+         }
+         if (fifo_res =3D=3D PL330_FIFO_OK || q->z) {
+-            dma_memory_write(s->mem_as, q->addr, buf, len);
++            dma_memory_write(s->mem_as, q->addr, buf, len,
++                             MEMTXATTRS_UNSPECIFIED);
+             trace_pl330_exec_cycle(q->addr, len);
+             if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
+                 pl330_hexdump(buf, len);
+diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
+index 03bc500..0ef13c5 100644
+--- a/hw/dma/sparc32_dma.c
++++ b/hw/dma/sparc32_dma.c
+@@ -81,11 +81,11 @@ void ledma_memory_read(void *opaque, hwaddr addr,
+     addr |=3D s->dmaregs[3];
+     trace_ledma_memory_read(addr, len);
+     if (do_bswap) {
+-        dma_memory_read(&is->iommu_as, addr, buf, len);
++        dma_memory_read(&is->iommu_as, addr, buf, len, MEMTXATTRS_UNSPECI=
FIED);
+     } else {
+         addr &=3D ~1;
+         len &=3D ~1;
+-        dma_memory_read(&is->iommu_as, addr, buf, len);
++        dma_memory_read(&is->iommu_as, addr, buf, len, MEMTXATTRS_UNSPECI=
FIED);
+         for(i =3D 0; i < len; i +=3D 2) {
+             bswap16s((uint16_t *)(buf + i));
+         }
+@@ -103,7 +103,8 @@ void ledma_memory_write(void *opaque, hwaddr addr,
+     addr |=3D s->dmaregs[3];
+     trace_ledma_memory_write(addr, len);
+     if (do_bswap) {
+-        dma_memory_write(&is->iommu_as, addr, buf, len);
++        dma_memory_write(&is->iommu_as, addr, buf, len,
++                         MEMTXATTRS_UNSPECIFIED);
+     } else {
+         addr &=3D ~1;
+         len &=3D ~1;
+@@ -114,7 +115,8 @@ void ledma_memory_write(void *opaque, hwaddr addr,
+             for(i =3D 0; i < l; i +=3D 2) {
+                 tmp_buf[i >> 1] =3D bswap16(*(uint16_t *)(buf + i));
+             }
+-            dma_memory_write(&is->iommu_as, addr, tmp_buf, l);
++            dma_memory_write(&is->iommu_as, addr, tmp_buf, l,
++                             MEMTXATTRS_UNSPECIFIED);
+             len -=3D l;
+             buf +=3D l;
+             addr +=3D l;
+@@ -148,7 +150,8 @@ void espdma_memory_read(void *opaque, uint8_t *buf, in=
t len)
+     IOMMUState *is =3D (IOMMUState *)s->iommu;
+
+     trace_espdma_memory_read(s->dmaregs[1], len);
+-    dma_memory_read(&is->iommu_as, s->dmaregs[1], buf, len);
++    dma_memory_read(&is->iommu_as, s->dmaregs[1], buf, len,
++                    MEMTXATTRS_UNSPECIFIED);
+     s->dmaregs[1] +=3D len;
+ }
+
+@@ -158,7 +161,8 @@ void espdma_memory_write(void *opaque, uint8_t *buf, i=
nt len)
+     IOMMUState *is =3D (IOMMUState *)s->iommu;
+
+     trace_espdma_memory_write(s->dmaregs[1], len);
+-    dma_memory_write(&is->iommu_as, s->dmaregs[1], buf, len);
++    dma_memory_write(&is->iommu_as, s->dmaregs[1], buf, len,
++                     MEMTXATTRS_UNSPECIFIED);
+     s->dmaregs[1] +=3D len;
+ }
+
+diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
+index e33112b..f5ad1a0 100644
+--- a/hw/dma/xlnx-zynq-devcfg.c
++++ b/hw/dma/xlnx-zynq-devcfg.c
+@@ -161,12 +161,14 @@ static void xlnx_zynq_devcfg_dma_go(XlnxZynqDevcfg *=
s)
+             btt =3D MIN(btt, dmah->dest_len);
+         }
+         DB_PRINT("reading %x bytes from %x\n", btt, dmah->src_addr);
+-        dma_memory_read(&address_space_memory, dmah->src_addr, buf, btt);
++        dma_memory_read(&address_space_memory, dmah->src_addr, buf, btt,
++                        MEMTXATTRS_UNSPECIFIED);
+         dmah->src_len -=3D btt;
+         dmah->src_addr +=3D btt;
+         if (loopback && (dmah->src_len || dmah->dest_len)) {
+             DB_PRINT("writing %x bytes from %x\n", btt, dmah->dest_addr);
+-            dma_memory_write(&address_space_memory, dmah->dest_addr, buf,=
 btt);
++            dma_memory_write(&address_space_memory, dmah->dest_addr, buf,=
 btt,
++                             MEMTXATTRS_UNSPECIFIED);
+             dmah->dest_len -=3D btt;
+             dmah->dest_addr +=3D btt;
+         }
+diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
+index 967548a..2d7eae7 100644
+--- a/hw/dma/xlnx_dpdma.c
++++ b/hw/dma/xlnx_dpdma.c
+@@ -652,7 +652,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, u=
int8_t channel,
+         }
+
+         if (dma_memory_read(&address_space_memory, desc_addr, &desc,
+-                            sizeof(DPDMADescriptor))) {
++                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFI=
ED)) {
+             s->registers[DPDMA_EISR] |=3D ((1 << 1) << channel);
+             xlnx_dpdma_update_irq(s);
+             s->operation_finished[channel] =3D true;
+@@ -708,7 +708,8 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, u=
int8_t channel,
+                     if (dma_memory_read(&address_space_memory,
+                                         source_addr[0],
+                                         &s->data[channel][ptr],
+-                                        line_size)) {
++                                        line_size,
++                                        MEMTXATTRS_UNSPECIFIED)) {
+                         s->registers[DPDMA_ISR] |=3D ((1 << 12) << channe=
l);
+                         xlnx_dpdma_update_irq(s);
+                         DPRINTF("Can't get data.\n");
+@@ -736,7 +737,8 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, u=
int8_t channel,
+                     if (dma_memory_read(&address_space_memory,
+                                         source_addr[frag],
+                                         &(s->data[channel][ptr]),
+-                                        fragment_len)) {
++                                        fragment_len,
++                                        MEMTXATTRS_UNSPECIFIED)) {
+                         s->registers[DPDMA_ISR] |=3D ((1 << 12) << channe=
l);
+                         xlnx_dpdma_update_irq(s);
+                         DPRINTF("Can't get data.\n");
+@@ -754,7 +756,7 @@ size_t xlnx_dpdma_start_operation(XlnxDPDMAState *s, u=
int8_t channel,
+             DPRINTF("update the descriptor with the done flag set.\n");
+             xlnx_dpdma_desc_set_done(&desc);
+             dma_memory_write(&address_space_memory, desc_addr, &desc,
+-                             sizeof(DPDMADescriptor));
++                             sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIF=
IED);
+         }
+
+         if (xlnx_dpdma_desc_completion_interrupt(&desc)) {
+diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
+index 91fe34a..4d13d8e 100644
+--- a/hw/i386/amd_iommu.c
++++ b/hw/i386/amd_iommu.c
+@@ -181,7 +181,7 @@ static void amdvi_log_event(AMDVIState *s, uint64_t *e=
vt)
+     }
+
+     if (dma_memory_write(&address_space_memory, s->evtlog + s->evtlog_tai=
l,
+-                         evt, AMDVI_EVENT_LEN)) {
++                         evt, AMDVI_EVENT_LEN, MEMTXATTRS_UNSPECIFIED)) {
+         trace_amdvi_evntlog_fail(s->evtlog, s->evtlog_tail);
+     }
+
+@@ -376,7 +376,8 @@ static void amdvi_completion_wait(AMDVIState *s, uint6=
4_t *cmd)
+     }
+     if (extract64(cmd[0], 0, 1)) {
+         if (dma_memory_write(&address_space_memory, addr, &data,
+-            AMDVI_COMPLETION_DATA_SIZE)) {
++                             AMDVI_COMPLETION_DATA_SIZE,
++                             MEMTXATTRS_UNSPECIFIED)) {
+             trace_amdvi_completion_wait_fail(addr);
+         }
+     }
+@@ -502,7 +503,7 @@ static void amdvi_cmdbuf_exec(AMDVIState *s)
+     uint64_t cmd[2];
+
+     if (dma_memory_read(&address_space_memory, s->cmdbuf + s->cmdbuf_head=
,
+-        cmd, AMDVI_COMMAND_SIZE)) {
++                        cmd, AMDVI_COMMAND_SIZE, MEMTXATTRS_UNSPECIFIED))=
 {
+         trace_amdvi_command_read_fail(s->cmdbuf, s->cmdbuf_head);
+         amdvi_log_command_error(s, s->cmdbuf + s->cmdbuf_head);
+         return;
+@@ -836,7 +837,7 @@ static bool amdvi_get_dte(AMDVIState *s, int devid, ui=
nt64_t *entry)
+     uint32_t offset =3D devid * AMDVI_DEVTAB_ENTRY_SIZE;
+
+     if (dma_memory_read(&address_space_memory, s->devtab + offset, entry,
+-        AMDVI_DEVTAB_ENTRY_SIZE)) {
++                        AMDVI_DEVTAB_ENTRY_SIZE, MEMTXATTRS_UNSPECIFIED))=
 {
+         trace_amdvi_dte_get_fail(s->devtab, offset);
+         /* log error accessing dte */
+         amdvi_log_devtab_error(s, devid, s->devtab + offset, 0);
+@@ -881,7 +882,8 @@ static inline uint64_t amdvi_get_pte_entry(AMDVIState =
*s, uint64_t pte_addr,
+ {
+     uint64_t pte;
+
+-    if (dma_memory_read(&address_space_memory, pte_addr, &pte, sizeof(pte=
))) {
++    if (dma_memory_read(&address_space_memory, pte_addr,
++                        &pte, sizeof(pte), MEMTXATTRS_UNSPECIFIED)) {
+         trace_amdvi_get_pte_hwerror(pte_addr);
+         amdvi_log_pagetab_error(s, devid, pte_addr, 0);
+         pte =3D 0;
+@@ -1048,7 +1050,7 @@ static int amdvi_get_irte(AMDVIState *s, MSIMessage =
*origin, uint64_t *dte,
+     trace_amdvi_ir_irte(irte_root, offset);
+
+     if (dma_memory_read(&address_space_memory, irte_root + offset,
+-                        irte, sizeof(*irte))) {
++                        irte, sizeof(*irte), MEMTXATTRS_UNSPECIFIED)) {
+         trace_amdvi_ir_err("failed to get irte");
+         return -AMDVI_IR_GET_IRTE;
+     }
+@@ -1108,7 +1110,7 @@ static int amdvi_get_irte_ga(AMDVIState *s, MSIMessa=
ge *origin, uint64_t *dte,
+     trace_amdvi_ir_irte(irte_root, offset);
+
+     if (dma_memory_read(&address_space_memory, irte_root + offset,
+-                        irte, sizeof(*irte))) {
++                        irte, sizeof(*irte), MEMTXATTRS_UNSPECIFIED)) {
+         trace_amdvi_ir_err("failed to get irte_ga");
+         return -AMDVI_IR_GET_IRTE;
+     }
+diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
+index f584449..5b865ac 100644
+--- a/hw/i386/intel_iommu.c
++++ b/hw/i386/intel_iommu.c
+@@ -569,7 +569,8 @@ static int vtd_get_root_entry(IntelIOMMUState *s, uint=
8_t index,
+     dma_addr_t addr;
+
+     addr =3D s->root + index * sizeof(*re);
+-    if (dma_memory_read(&address_space_memory, addr, re, sizeof(*re))) {
++    if (dma_memory_read(&address_space_memory, addr,
++                        re, sizeof(*re), MEMTXATTRS_UNSPECIFIED)) {
+         re->lo =3D 0;
+         return -VTD_FR_ROOT_TABLE_INV;
+     }
+@@ -602,7 +603,8 @@ static int vtd_get_context_entry_from_root(IntelIOMMUS=
tate *s,
+     }
+
+     addr =3D addr + index * ce_size;
+-    if (dma_memory_read(&address_space_memory, addr, ce, ce_size)) {
++    if (dma_memory_read(&address_space_memory, addr,
++                        ce, ce_size, MEMTXATTRS_UNSPECIFIED)) {
+         return -VTD_FR_CONTEXT_TABLE_INV;
+     }
+
+@@ -639,8 +641,8 @@ static uint64_t vtd_get_slpte(dma_addr_t base_addr, ui=
nt32_t index)
+     assert(index < VTD_SL_PT_ENTRY_NR);
+
+     if (dma_memory_read(&address_space_memory,
+-                        base_addr + index * sizeof(slpte), &slpte,
+-                        sizeof(slpte))) {
++                        base_addr + index * sizeof(slpte),
++                        &slpte, sizeof(slpte), MEMTXATTRS_UNSPECIFIED)) {
+         slpte =3D (uint64_t)-1;
+         return slpte;
+     }
+@@ -704,7 +706,8 @@ static int vtd_get_pdire_from_pdir_table(dma_addr_t pa=
sid_dir_base,
+     index =3D VTD_PASID_DIR_INDEX(pasid);
+     entry_size =3D VTD_PASID_DIR_ENTRY_SIZE;
+     addr =3D pasid_dir_base + index * entry_size;
+-    if (dma_memory_read(&address_space_memory, addr, pdire, entry_size)) =
{
++    if (dma_memory_read(&address_space_memory, addr,
++                        pdire, entry_size, MEMTXATTRS_UNSPECIFIED)) {
+         return -VTD_FR_PASID_TABLE_INV;
+     }
+
+@@ -728,7 +731,8 @@ static int vtd_get_pe_in_pasid_leaf_table(IntelIOMMUSt=
ate *s,
+     index =3D VTD_PASID_TABLE_INDEX(pasid);
+     entry_size =3D VTD_PASID_ENTRY_SIZE;
+     addr =3D addr + index * entry_size;
+-    if (dma_memory_read(&address_space_memory, addr, pe, entry_size)) {
++    if (dma_memory_read(&address_space_memory, addr,
++                        pe, entry_size, MEMTXATTRS_UNSPECIFIED)) {
+         return -VTD_FR_PASID_TABLE_INV;
+     }
+
+@@ -2275,7 +2279,8 @@ static bool vtd_get_inv_desc(IntelIOMMUState *s,
+     uint32_t dw =3D s->iq_dw ? 32 : 16;
+     dma_addr_t addr =3D base_addr + offset * dw;
+
+-    if (dma_memory_read(&address_space_memory, addr, inv_desc, dw)) {
++    if (dma_memory_read(&address_space_memory, addr,
++                        inv_desc, dw, MEMTXATTRS_UNSPECIFIED)) {
+         error_report_once("Read INV DESC failed.");
+         return false;
+     }
+@@ -2308,8 +2313,9 @@ static bool vtd_process_wait_desc(IntelIOMMUState *s=
, VTDInvDesc *inv_desc)
+         dma_addr_t status_addr =3D inv_desc->hi;
+         trace_vtd_inv_desc_wait_sw(status_addr, status_data);
+         status_data =3D cpu_to_le32(status_data);
+-        if (dma_memory_write(&address_space_memory, status_addr, &status_=
data,
+-                             sizeof(status_data))) {
++        if (dma_memory_write(&address_space_memory, status_addr,
++                             &status_data, sizeof(status_data),
++                             MEMTXATTRS_UNSPECIFIED)) {
+             trace_vtd_inv_desc_wait_write_fail(inv_desc->hi, inv_desc->lo=
);
+             return false;
+         }
+@@ -3120,8 +3126,8 @@ static int vtd_irte_get(IntelIOMMUState *iommu, uint=
16_t index,
+     }
+
+     addr =3D iommu->intr_root + index * sizeof(*entry);
+-    if (dma_memory_read(&address_space_memory, addr, entry,
+-                        sizeof(*entry))) {
++    if (dma_memory_read(&address_space_memory, addr,
++                        entry, sizeof(*entry), MEMTXATTRS_UNSPECIFIED)) {
+         error_report_once("%s: read failed: ind=3D0x%x addr=3D0x%" PRIx64=
,
+                           __func__, index, addr);
+         return -VTD_FR_IR_ROOT_INVAL;
+diff --git a/hw/ide/macio.c b/hw/ide/macio.c
+index b03d401..f08318c 100644
+--- a/hw/ide/macio.c
++++ b/hw/ide/macio.c
+@@ -97,7 +97,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int=
 ret)
+         /* Non-block ATAPI transfer - just copy to RAM */
+         s->io_buffer_size =3D MIN(s->io_buffer_size, io->len);
+         dma_memory_write(&address_space_memory, io->addr, s->io_buffer,
+-                         s->io_buffer_size);
++                         s->io_buffer_size, MEMTXATTRS_UNSPECIFIED);
+         io->len =3D 0;
+         ide_atapi_cmd_ok(s);
+         m->dma_active =3D false;
+diff --git a/hw/intc/xive.c b/hw/intc/xive.c
+index 190194d..f15f985 100644
+--- a/hw/intc/xive.c
++++ b/hw/intc/xive.c
+@@ -1246,8 +1246,8 @@ void xive_end_queue_pic_print_info(XiveEND *end, uin=
t32_t width, Monitor *mon)
+         uint64_t qaddr =3D qaddr_base + (qindex << 2);
+         uint32_t qdata =3D -1;
+
+-        if (dma_memory_read(&address_space_memory, qaddr, &qdata,
+-                            sizeof(qdata))) {
++        if (dma_memory_read(&address_space_memory, qaddr,
++                            &qdata, sizeof(qdata), MEMTXATTRS_UNSPECIFIED=
)) {
+             qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to read EQ @0x%"
+                           HWADDR_PRIx "\n", qaddr);
+             return;
+@@ -1311,7 +1311,8 @@ static void xive_end_enqueue(XiveEND *end, uint32_t =
data)
+     uint32_t qdata =3D cpu_to_be32((qgen << 31) | (data & 0x7fffffff));
+     uint32_t qentries =3D 1 << (qsize + 10);
+
+-    if (dma_memory_write(&address_space_memory, qaddr, &qdata, sizeof(qda=
ta))) {
++    if (dma_memory_write(&address_space_memory, qaddr,
++                         &qdata, sizeof(qdata), MEMTXATTRS_UNSPECIFIED)) =
{
+         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to write END data @0=
x%"
+                       HWADDR_PRIx "\n", qaddr);
+         return;
+diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
+index 73941bd..76ea511 100644
+--- a/hw/misc/bcm2835_property.c
++++ b/hw/misc/bcm2835_property.c
+@@ -69,7 +69,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertySt=
ate *s, uint32_t value)
+             break;
+         case 0x00010003: /* Get board MAC address */
+             resplen =3D sizeof(s->macaddr.a);
+-            dma_memory_write(&s->dma_as, value + 12, s->macaddr.a, resple=
n);
++            dma_memory_write(&s->dma_as, value + 12, s->macaddr.a, resple=
n,
++                             MEMTXATTRS_UNSPECIFIED);
+             break;
+         case 0x00010004: /* Get board serial */
+             qemu_log_mask(LOG_UNIMP,
+diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
+index e220f1a..efcc026 100644
+--- a/hw/misc/macio/mac_dbdma.c
++++ b/hw/misc/macio/mac_dbdma.c
+@@ -94,7 +94,7 @@ static void dbdma_cmdptr_load(DBDMA_channel *ch)
+     DBDMA_DPRINTFCH(ch, "dbdma_cmdptr_load 0x%08x\n",
+                     ch->regs[DBDMA_CMDPTR_LO]);
+     dma_memory_read(&address_space_memory, ch->regs[DBDMA_CMDPTR_LO],
+-                    &ch->current, sizeof(dbdma_cmd));
++                    &ch->current, sizeof(dbdma_cmd), MEMTXATTRS_UNSPECIFI=
ED);
+ }
+
+ static void dbdma_cmdptr_save(DBDMA_channel *ch)
+@@ -104,7 +104,7 @@ static void dbdma_cmdptr_save(DBDMA_channel *ch)
+                     le16_to_cpu(ch->current.xfer_status),
+                     le16_to_cpu(ch->current.res_count));
+     dma_memory_write(&address_space_memory, ch->regs[DBDMA_CMDPTR_LO],
+-                     &ch->current, sizeof(dbdma_cmd));
++                     &ch->current, sizeof(dbdma_cmd), MEMTXATTRS_UNSPECIF=
IED);
+ }
+
+ static void kill_channel(DBDMA_channel *ch)
+@@ -371,7 +371,8 @@ static void load_word(DBDMA_channel *ch, int key, uint=
32_t addr,
+         return;
+     }
+
+-    dma_memory_read(&address_space_memory, addr, &current->cmd_dep, len);
++    dma_memory_read(&address_space_memory, addr, &current->cmd_dep, len,
++                    MEMTXATTRS_UNSPECIFIED);
+
+     if (conditional_wait(ch))
+         goto wait;
+@@ -403,7 +404,8 @@ static void store_word(DBDMA_channel *ch, int key, uin=
t32_t addr,
+         return;
+     }
+
+-    dma_memory_write(&address_space_memory, addr, &current->cmd_dep, len)=
;
++    dma_memory_write(&address_space_memory, addr, &current->cmd_dep, len,
++                     MEMTXATTRS_UNSPECIFIED);
+
+     if (conditional_wait(ch))
+         goto wait;
+diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
+index ff611f1..ecc0245 100644
+--- a/hw/net/allwinner-sun8i-emac.c
++++ b/hw/net/allwinner-sun8i-emac.c
+@@ -350,7 +350,8 @@ static void allwinner_sun8i_emac_get_desc(AwSun8iEmacS=
tate *s,
+                                           FrameDescriptor *desc,
+                                           uint32_t phys_addr)
+ {
+-    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc));
++    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc),
++                    MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
+@@ -402,7 +403,8 @@ static void allwinner_sun8i_emac_flush_desc(AwSun8iEma=
cState *s,
+                                             FrameDescriptor *desc,
+                                             uint32_t phys_addr)
+ {
+-    dma_memory_write(&s->dma_as, phys_addr, desc, sizeof(*desc));
++    dma_memory_write(&s->dma_as, phys_addr, desc, sizeof(*desc),
++                     MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static bool allwinner_sun8i_emac_can_receive(NetClientState *nc)
+@@ -460,7 +462,8 @@ static ssize_t allwinner_sun8i_emac_receive(NetClientS=
tate *nc,
+                             << RX_DESC_STATUS_FRM_LEN_SHIFT;
+         }
+
+-        dma_memory_write(&s->dma_as, desc.addr, buf, desc_bytes);
++        dma_memory_write(&s->dma_as, desc.addr, buf, desc_bytes,
++                         MEMTXATTRS_UNSPECIFIED);
+         allwinner_sun8i_emac_flush_desc(s, &desc, s->rx_desc_curr);
+         trace_allwinner_sun8i_emac_receive(s->rx_desc_curr, desc.addr,
+                                            desc_bytes);
+@@ -512,7 +515,8 @@ static void allwinner_sun8i_emac_transmit(AwSun8iEmacS=
tate *s)
+             desc.status |=3D TX_DESC_STATUS_LENGTH_ERR;
+             break;
+         }
+-        dma_memory_read(&s->dma_as, desc.addr, packet_buf + packet_bytes,=
 bytes);
++        dma_memory_read(&s->dma_as, desc.addr, packet_buf + packet_bytes,
++                        bytes, MEMTXATTRS_UNSPECIFIED);
+         packet_bytes +=3D bytes;
+         desc.status &=3D ~DESC_STATUS_CTL;
+         allwinner_sun8i_emac_flush_desc(s, &desc, s->tx_desc_curr);
+@@ -634,7 +638,8 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque=
, hwaddr offset,
+         break;
+     case REG_TX_CUR_BUF:        /* Transmit Current Buffer */
+         if (s->tx_desc_curr !=3D 0) {
+-            dma_memory_read(&s->dma_as, s->tx_desc_curr, &desc, sizeof(de=
sc));
++            dma_memory_read(&s->dma_as, s->tx_desc_curr, &desc, sizeof(de=
sc),
++                            MEMTXATTRS_UNSPECIFIED);
+             value =3D desc.addr;
+         } else {
+             value =3D 0;
+@@ -647,7 +652,8 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque=
, hwaddr offset,
+         break;
+     case REG_RX_CUR_BUF:        /* Receive Current Buffer */
+         if (s->rx_desc_curr !=3D 0) {
+-            dma_memory_read(&s->dma_as, s->rx_desc_curr, &desc, sizeof(de=
sc));
++            dma_memory_read(&s->dma_as, s->rx_desc_curr, &desc, sizeof(de=
sc),
++                            MEMTXATTRS_UNSPECIFIED);
+             value =3D desc.addr;
+         } else {
+             value =3D 0;
+diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
+index 25685ba..83ef0a7 100644
+--- a/hw/net/ftgmac100.c
++++ b/hw/net/ftgmac100.c
+@@ -453,7 +453,8 @@ static void do_phy_ctl(FTGMAC100State *s)
+
+ static int ftgmac100_read_bd(FTGMAC100Desc *bd, dma_addr_t addr)
+ {
+-    if (dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd))) {
++    if (dma_memory_read(&address_space_memory, addr,
++                        bd, sizeof(*bd), MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read descriptor @ 0=
x%"
+                       HWADDR_PRIx "\n", __func__, addr);
+         return -1;
+@@ -473,7 +474,8 @@ static int ftgmac100_write_bd(FTGMAC100Desc *bd, dma_a=
ddr_t addr)
+     lebd.des1 =3D cpu_to_le32(bd->des1);
+     lebd.des2 =3D cpu_to_le32(bd->des2);
+     lebd.des3 =3D cpu_to_le32(bd->des3);
+-    if (dma_memory_write(&address_space_memory, addr, &lebd, sizeof(lebd)=
)) {
++    if (dma_memory_write(&address_space_memory, addr,
++                         &lebd, sizeof(lebd), MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to write descriptor @ =
0x%"
+                       HWADDR_PRIx "\n", __func__, addr);
+         return -1;
+@@ -554,7 +556,8 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_=
t tx_ring,
+             len =3D  sizeof(s->frame) - frame_size;
+         }
+
+-        if (dma_memory_read(&address_space_memory, bd.des3, ptr, len)) {
++        if (dma_memory_read(&address_space_memory, bd.des3,
++                            ptr, len, MEMTXATTRS_UNSPECIFIED)) {
+             qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read packet @ 0=
x%x\n",
+                           __func__, bd.des3);
+             s->isr |=3D FTGMAC100_INT_AHB_ERR;
+@@ -1030,20 +1033,24 @@ static ssize_t ftgmac100_receive(NetClientState *n=
c, const uint8_t *buf,
+             bd.des1 =3D lduw_be_p(buf + 14) | FTGMAC100_RXDES1_VLANTAG_AV=
AIL;
+
+             if (s->maccr & FTGMAC100_MACCR_RM_VLAN) {
+-                dma_memory_write(&address_space_memory, buf_addr, buf, 12=
);
+-                dma_memory_write(&address_space_memory, buf_addr + 12, bu=
f + 16,
+-                                 buf_len - 16);
++                dma_memory_write(&address_space_memory, buf_addr, buf, 12=
,
++                                 MEMTXATTRS_UNSPECIFIED);
++                dma_memory_write(&address_space_memory, buf_addr + 12,
++                                 buf + 16, buf_len - 16,
++                                 MEMTXATTRS_UNSPECIFIED);
+             } else {
+-                dma_memory_write(&address_space_memory, buf_addr, buf, bu=
f_len);
++                dma_memory_write(&address_space_memory, buf_addr, buf,
++                                 buf_len, MEMTXATTRS_UNSPECIFIED);
+             }
+         } else {
+             bd.des1 =3D 0;
+-            dma_memory_write(&address_space_memory, buf_addr, buf, buf_le=
n);
++            dma_memory_write(&address_space_memory, buf_addr, buf, buf_le=
n,
++                             MEMTXATTRS_UNSPECIFIED);
+         }
+         buf +=3D buf_len;
+         if (size < 4) {
+             dma_memory_write(&address_space_memory, buf_addr + buf_len,
+-                             crc_ptr, 4 - size);
++                             crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIED);
+             crc_ptr +=3D 4 - size;
+         }
+
+diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
+index 9c7035b..0db9aaf 100644
+--- a/hw/net/imx_fec.c
++++ b/hw/net/imx_fec.c
+@@ -387,19 +387,22 @@ static void imx_phy_write(IMXFECState *s, int reg, u=
int32_t val)
+
+ static void imx_fec_read_bd(IMXFECBufDesc *bd, dma_addr_t addr)
+ {
+-    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd));
++    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd),
++                    MEMTXATTRS_UNSPECIFIED);
+
+     trace_imx_fec_read_bd(addr, bd->flags, bd->length, bd->data);
+ }
+
+ static void imx_fec_write_bd(IMXFECBufDesc *bd, dma_addr_t addr)
+ {
+-    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd));
++    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd),
++                     MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static void imx_enet_read_bd(IMXENETBufDesc *bd, dma_addr_t addr)
+ {
+-    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd));
++    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd),
++                    MEMTXATTRS_UNSPECIFIED);
+
+     trace_imx_enet_read_bd(addr, bd->flags, bd->length, bd->data,
+                    bd->option, bd->status);
+@@ -407,7 +410,8 @@ static void imx_enet_read_bd(IMXENETBufDesc *bd, dma_a=
ddr_t addr)
+
+ static void imx_enet_write_bd(IMXENETBufDesc *bd, dma_addr_t addr)
+ {
+-    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd));
++    dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd),
++                     MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static void imx_eth_update(IMXFECState *s)
+@@ -474,7 +478,8 @@ static void imx_fec_do_tx(IMXFECState *s)
+             len =3D ENET_MAX_FRAME_SIZE - frame_size;
+             s->regs[ENET_EIR] |=3D ENET_INT_BABT;
+         }
+-        dma_memory_read(&address_space_memory, bd.data, ptr, len);
++        dma_memory_read(&address_space_memory, bd.data, ptr, len,
++                        MEMTXATTRS_UNSPECIFIED);
+         ptr +=3D len;
+         frame_size +=3D len;
+         if (bd.flags & ENET_BD_L) {
+@@ -555,7 +560,8 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t in=
dex)
+             len =3D ENET_MAX_FRAME_SIZE - frame_size;
+             s->regs[ENET_EIR] |=3D ENET_INT_BABT;
+         }
+-        dma_memory_read(&address_space_memory, bd.data, ptr, len);
++        dma_memory_read(&address_space_memory, bd.data, ptr, len,
++                        MEMTXATTRS_UNSPECIFIED);
+         ptr +=3D len;
+         frame_size +=3D len;
+         if (bd.flags & ENET_BD_L) {
+@@ -1103,11 +1109,12 @@ static ssize_t imx_fec_receive(NetClientState *nc,=
 const uint8_t *buf,
+             buf_len +=3D size - 4;
+         }
+         buf_addr =3D bd.data;
+-        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
++        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len,
++                         MEMTXATTRS_UNSPECIFIED);
+         buf +=3D buf_len;
+         if (size < 4) {
+             dma_memory_write(&address_space_memory, buf_addr + buf_len,
+-                             crc_ptr, 4 - size);
++                             crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIED);
+             crc_ptr +=3D 4 - size;
+         }
+         bd.flags &=3D ~ENET_BD_E;
+@@ -1210,8 +1217,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, =
const uint8_t *buf,
+              */
+             const uint8_t zeros[2] =3D { 0 };
+
+-            dma_memory_write(&address_space_memory, buf_addr,
+-                             zeros, sizeof(zeros));
++            dma_memory_write(&address_space_memory, buf_addr, zeros,
++                             sizeof(zeros), MEMTXATTRS_UNSPECIFIED);
+
+             buf_addr +=3D sizeof(zeros);
+             buf_len  -=3D sizeof(zeros);
+@@ -1220,11 +1227,12 @@ static ssize_t imx_enet_receive(NetClientState *nc=
, const uint8_t *buf,
+             shift16 =3D false;
+         }
+
+-        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
++        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len,
++                         MEMTXATTRS_UNSPECIFIED);
+         buf +=3D buf_len;
+         if (size < 4) {
+             dma_memory_write(&address_space_memory, buf_addr + buf_len,
+-                             crc_ptr, 4 - size);
++                             crc_ptr, 4 - size, MEMTXATTRS_UNSPECIFIED);
+             crc_ptr +=3D 4 - size;
+         }
+         bd.flags &=3D ~ENET_BD_E;
+diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
+index 545b2b7..9a23289 100644
+--- a/hw/net/npcm7xx_emc.c
++++ b/hw/net/npcm7xx_emc.c
+@@ -200,7 +200,8 @@ static void emc_update_irq_from_reg_change(NPCM7xxEMCS=
tate *emc)
+
+ static int emc_read_tx_desc(dma_addr_t addr, NPCM7xxEMCTxDesc *desc)
+ {
+-    if (dma_memory_read(&address_space_memory, addr, desc, sizeof(*desc))=
) {
++    if (dma_memory_read(&address_space_memory, addr, desc,
++                        sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0=
x%"
+                       HWADDR_PRIx "\n", __func__, addr);
+         return -1;
+@@ -221,7 +222,7 @@ static int emc_write_tx_desc(const NPCM7xxEMCTxDesc *d=
esc, dma_addr_t addr)
+     le_desc.status_and_length =3D cpu_to_le32(desc->status_and_length);
+     le_desc.ntxdsa =3D cpu_to_le32(desc->ntxdsa);
+     if (dma_memory_write(&address_space_memory, addr, &le_desc,
+-                         sizeof(le_desc))) {
++                         sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ =
0x%"
+                       HWADDR_PRIx "\n", __func__, addr);
+         return -1;
+@@ -231,7 +232,8 @@ static int emc_write_tx_desc(const NPCM7xxEMCTxDesc *d=
esc, dma_addr_t addr)
+
+ static int emc_read_rx_desc(dma_addr_t addr, NPCM7xxEMCRxDesc *desc)
+ {
+-    if (dma_memory_read(&address_space_memory, addr, desc, sizeof(*desc))=
) {
++    if (dma_memory_read(&address_space_memory, addr, desc,
++                        sizeof(*desc), MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0=
x%"
+                       HWADDR_PRIx "\n", __func__, addr);
+         return -1;
+@@ -252,7 +254,7 @@ static int emc_write_rx_desc(const NPCM7xxEMCRxDesc *d=
esc, dma_addr_t addr)
+     le_desc.reserved =3D cpu_to_le32(desc->reserved);
+     le_desc.nrxdsa =3D cpu_to_le32(desc->nrxdsa);
+     if (dma_memory_write(&address_space_memory, addr, &le_desc,
+-                         sizeof(le_desc))) {
++                         sizeof(le_desc), MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ =
0x%"
+                       HWADDR_PRIx "\n", __func__, addr);
+         return -1;
+@@ -366,7 +368,8 @@ static void emc_try_send_next_packet(NPCM7xxEMCState *=
emc)
+         buf =3D malloced_buf;
+     }
+
+-    if (dma_memory_read(&address_space_memory, next_buf_addr, buf, length=
)) {
++    if (dma_memory_read(&address_space_memory, next_buf_addr, buf,
++                        length, MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read packet @ 0x%x\=
n",
+                       __func__, next_buf_addr);
+         emc_set_mista(emc, REG_MISTA_TXBERR);
+@@ -551,10 +554,11 @@ static ssize_t emc_receive(NetClientState *nc, const=
 uint8_t *buf, size_t len1)
+
+     buf_addr =3D rx_desc.rxbsa;
+     emc->regs[REG_CRXBSA] =3D buf_addr;
+-    if (dma_memory_write(&address_space_memory, buf_addr, buf, len) ||
++    if (dma_memory_write(&address_space_memory, buf_addr, buf,
++                         len, MEMTXATTRS_UNSPECIFIED) ||
+         (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC) &&
+-         dma_memory_write(&address_space_memory, buf_addr + len, crc_ptr,
+-                          4))) {
++         dma_memory_write(&address_space_memory, buf_addr + len,
++                          crc_ptr, 4, MEMTXATTRS_UNSPECIFIED))) {
+         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bus error writing packet\n",
+                       __func__);
+         emc_set_mista(emc, REG_MISTA_RXBERR);
+diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
+index f7803fe..9b91b15 100644
+--- a/hw/nvram/fw_cfg.c
++++ b/hw/nvram/fw_cfg.c
+@@ -357,7 +357,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
+     dma_addr =3D s->dma_addr;
+     s->dma_addr =3D 0;
+
+-    if (dma_memory_read(s->dma_as, dma_addr, &dma, sizeof(dma))) {
++    if (dma_memory_read(s->dma_as, dma_addr,
++                        &dma, sizeof(dma), MEMTXATTRS_UNSPECIFIED)) {
+         stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control=
),
+                    FW_CFG_DMA_CTL_ERROR);
+         return;
+@@ -419,7 +420,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
+              */
+             if (read) {
+                 if (dma_memory_write(s->dma_as, dma.address,
+-                                    &e->data[s->cur_offset], len)) {
++                                     &e->data[s->cur_offset], len,
++                                     MEMTXATTRS_UNSPECIFIED)) {
+                     dma.control |=3D FW_CFG_DMA_CTL_ERROR;
+                 }
+             }
+@@ -427,7 +429,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
+                 if (!e->allow_write ||
+                     len !=3D dma.length ||
+                     dma_memory_read(s->dma_as, dma.address,
+-                                    &e->data[s->cur_offset], len)) {
++                                    &e->data[s->cur_offset], len,
++                                    MEMTXATTRS_UNSPECIFIED)) {
+                     dma.control |=3D FW_CFG_DMA_CTL_ERROR;
+                 } else if (e->write_cb) {
+                     e->write_cb(e->callback_opaque, s->cur_offset, len);
+diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
+index 9c4451c..c6e7871 100644
+--- a/hw/pci-host/pnv_phb3.c
++++ b/hw/pci-host/pnv_phb3.c
+@@ -715,7 +715,8 @@ static bool pnv_phb3_resolve_pe(PnvPhb3DMASpace *ds)
+     bus_num =3D pci_bus_num(ds->bus);
+     addr =3D rtt & PHB_RTT_BASE_ADDRESS_MASK;
+     addr +=3D 2 * ((bus_num << 8) | ds->devfn);
+-    if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte))) =
{
++    if (dma_memory_read(&address_space_memory, addr, &rte,
++                        sizeof(rte), MEMTXATTRS_UNSPECIFIED)) {
+         phb3_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr=
);
+         /* Set error bits ? fence ? ... */
+         return false;
+@@ -794,7 +795,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds=
, hwaddr addr,
+             /* Grab the TCE address */
+             taddr =3D base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) <=
< 3);
+             if (dma_memory_read(&address_space_memory, taddr, &tce,
+-                                sizeof(tce))) {
++                                sizeof(tce), MEMTXATTRS_UNSPECIFIED)) {
+                 phb3_error(phb, "Failed to read TCE at 0x%"PRIx64, taddr)=
;
+                 return;
+             }
+diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
+index 099d209..8bcbc2c 100644
+--- a/hw/pci-host/pnv_phb3_msi.c
++++ b/hw/pci-host/pnv_phb3_msi.c
+@@ -53,7 +53,8 @@ static bool phb3_msi_read_ive(PnvPHB3 *phb, int srcno, u=
int64_t *out_ive)
+         return false;
+     }
+
+-    if (dma_memory_read(&address_space_memory, ive_addr, &ive, sizeof(ive=
))) {
++    if (dma_memory_read(&address_space_memory, ive_addr,
++                        &ive, sizeof(ive), MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR, "Failed to read IVE at 0x%" PRIx64=
,
+                       ive_addr);
+         return false;
+@@ -73,7 +74,8 @@ static void phb3_msi_set_p(Phb3MsiState *msi, int srcno,=
 uint8_t gen)
+         return;
+     }
+
+-    if (dma_memory_write(&address_space_memory, ive_addr + 4, &p, 1)) {
++    if (dma_memory_write(&address_space_memory, ive_addr + 4,
++                         &p, 1, MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "Failed to write IVE (set P) at 0x%" PRIx64, ive_ad=
dr);
+     }
+@@ -89,7 +91,8 @@ static void phb3_msi_set_q(Phb3MsiState *msi, int srcno)
+         return;
+     }
+
+-    if (dma_memory_write(&address_space_memory, ive_addr + 5, &q, 1)) {
++    if (dma_memory_write(&address_space_memory, ive_addr + 5,
++                         &q, 1, MEMTXATTRS_UNSPECIFIED)) {
+         qemu_log_mask(LOG_GUEST_ERROR,
+                       "Failed to write IVE (set Q) at 0x%" PRIx64, ive_ad=
dr);
+     }
+diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
+index 40b7932..1fbf732 100644
+--- a/hw/pci-host/pnv_phb4.c
++++ b/hw/pci-host/pnv_phb4.c
+@@ -891,7 +891,8 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *ds)
+     bus_num =3D pci_bus_num(ds->bus);
+     addr =3D rtt & PHB_RTT_BASE_ADDRESS_MASK;
+     addr +=3D 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
+-    if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte))) =
{
++    if (dma_memory_read(&address_space_memory, addr, &rte,
++                        sizeof(rte), MEMTXATTRS_UNSPECIFIED)) {
+         phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr)=
;
+         /* Set error bits ? fence ? ... */
+         return false;
+@@ -961,7 +962,7 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds=
, hwaddr addr,
+             /* Grab the TCE address */
+             taddr =3D base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) <=
< 3);
+             if (dma_memory_read(&address_space_memory, taddr, &tce,
+-                                sizeof(tce))) {
++                                sizeof(tce), MEMTXATTRS_UNSPECIFIED)) {
+                 phb_error(ds->phb, "Failed to read TCE at 0x%"PRIx64, tad=
dr);
+                 return;
+             }
+diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
+index 9166d66..de5bc49 100644
+--- a/hw/sd/allwinner-sdhost.c
++++ b/hw/sd/allwinner-sdhost.c
+@@ -311,7 +311,8 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHost=
State *s,
+     uint8_t buf[1024];
+
+     /* Read descriptor */
+-    dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc));
++    dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc),
++                    MEMTXATTRS_UNSPECIFIED);
+     if (desc->size =3D=3D 0) {
+         desc->size =3D klass->max_desc_size;
+     } else if (desc->size > klass->max_desc_size) {
+@@ -337,23 +338,24 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHo=
stState *s,
+         /* Write to SD bus */
+         if (is_write) {
+             dma_memory_read(&s->dma_as,
+-                            (desc->addr & DESC_SIZE_MASK) + num_done,
+-                            buf, buf_bytes);
++                            (desc->addr & DESC_SIZE_MASK) + num_done, buf=
,
++                            buf_bytes, MEMTXATTRS_UNSPECIFIED);
+             sdbus_write_data(&s->sdbus, buf, buf_bytes);
+
+         /* Read from SD bus */
+         } else {
+             sdbus_read_data(&s->sdbus, buf, buf_bytes);
+             dma_memory_write(&s->dma_as,
+-                             (desc->addr & DESC_SIZE_MASK) + num_done,
+-                             buf, buf_bytes);
++                             (desc->addr & DESC_SIZE_MASK) + num_done, bu=
f,
++                             buf_bytes, MEMTXATTRS_UNSPECIFIED);
+         }
+         num_done +=3D buf_bytes;
+     }
+
+     /* Clear hold flag and flush descriptor */
+     desc->status &=3D ~DESC_STATUS_HOLD;
+-    dma_memory_write(&s->dma_as, desc_addr, desc, sizeof(*desc));
++    dma_memory_write(&s->dma_as, desc_addr, desc, sizeof(*desc),
++                     MEMTXATTRS_UNSPECIFIED);
+
+     return num_done;
+ }
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index c9dc065..e0bbc90 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -616,8 +616,8 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIStat=
e *s)
+                     s->blkcnt--;
+                 }
+             }
+-            dma_memory_write(s->dma_as, s->sdmasysad,
+-                             &s->fifo_buffer[begin], s->data_count - begi=
n);
++            dma_memory_write(s->dma_as, s->sdmasysad, &s->fifo_buffer[beg=
in],
++                             s->data_count - begin, MEMTXATTRS_UNSPECIFIE=
D);
+             s->sdmasysad +=3D s->data_count - begin;
+             if (s->data_count =3D=3D block_size) {
+                 s->data_count =3D 0;
+@@ -637,8 +637,8 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIStat=
e *s)
+                 s->data_count =3D block_size;
+                 boundary_count -=3D block_size - begin;
+             }
+-            dma_memory_read(s->dma_as, s->sdmasysad,
+-                            &s->fifo_buffer[begin], s->data_count - begin=
);
++            dma_memory_read(s->dma_as, s->sdmasysad, &s->fifo_buffer[begi=
n],
++                            s->data_count - begin, MEMTXATTRS_UNSPECIFIED=
);
+             s->sdmasysad +=3D s->data_count - begin;
+             if (s->data_count =3D=3D block_size) {
+                 sdbus_write_data(&s->sdbus, s->fifo_buffer, block_size);
+@@ -670,9 +670,11 @@ static void sdhci_sdma_transfer_single_block(SDHCISta=
te *s)
+
+     if (s->trnmod & SDHC_TRNS_READ) {
+         sdbus_read_data(&s->sdbus, s->fifo_buffer, datacnt);
+-        dma_memory_write(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt=
);
++        dma_memory_write(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt=
,
++                         MEMTXATTRS_UNSPECIFIED);
+     } else {
+-        dma_memory_read(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt)=
;
++        dma_memory_read(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt,
++                        MEMTXATTRS_UNSPECIFIED);
+         sdbus_write_data(&s->sdbus, s->fifo_buffer, datacnt);
+     }
+     s->blkcnt--;
+@@ -694,7 +696,8 @@ static void get_adma_description(SDHCIState *s, ADMADe=
scr *dscr)
+     hwaddr entry_addr =3D (hwaddr)s->admasysaddr;
+     switch (SDHC_DMA_TYPE(s->hostctl1)) {
+     case SDHC_CTRL_ADMA2_32:
+-        dma_memory_read(s->dma_as, entry_addr, &adma2, sizeof(adma2));
++        dma_memory_read(s->dma_as, entry_addr, &adma2, sizeof(adma2),
++                        MEMTXATTRS_UNSPECIFIED);
+         adma2 =3D le64_to_cpu(adma2);
+         /* The spec does not specify endianness of descriptor table.
+          * We currently assume that it is LE.
+@@ -705,7 +708,8 @@ static void get_adma_description(SDHCIState *s, ADMADe=
scr *dscr)
+         dscr->incr =3D 8;
+         break;
+     case SDHC_CTRL_ADMA1_32:
+-        dma_memory_read(s->dma_as, entry_addr, &adma1, sizeof(adma1));
++        dma_memory_read(s->dma_as, entry_addr, &adma1, sizeof(adma1),
++                        MEMTXATTRS_UNSPECIFIED);
+         adma1 =3D le32_to_cpu(adma1);
+         dscr->addr =3D (hwaddr)(adma1 & 0xFFFFF000);
+         dscr->attr =3D (uint8_t)extract32(adma1, 0, 7);
+@@ -717,10 +721,13 @@ static void get_adma_description(SDHCIState *s, ADMA=
Descr *dscr)
+         }
+         break;
+     case SDHC_CTRL_ADMA2_64:
+-        dma_memory_read(s->dma_as, entry_addr, &dscr->attr, 1);
+-        dma_memory_read(s->dma_as, entry_addr + 2, &dscr->length, 2);
++        dma_memory_read(s->dma_as, entry_addr, &dscr->attr, 1,
++                        MEMTXATTRS_UNSPECIFIED);
++        dma_memory_read(s->dma_as, entry_addr + 2, &dscr->length, 2,
++                        MEMTXATTRS_UNSPECIFIED);
+         dscr->length =3D le16_to_cpu(dscr->length);
+-        dma_memory_read(s->dma_as, entry_addr + 4, &dscr->addr, 8);
++        dma_memory_read(s->dma_as, entry_addr + 4, &dscr->addr, 8,
++                        MEMTXATTRS_UNSPECIFIED);
+         dscr->addr =3D le64_to_cpu(dscr->addr);
+         dscr->attr &=3D (uint8_t) ~0xC0;
+         dscr->incr =3D 12;
+@@ -785,7 +792,8 @@ static void sdhci_do_adma(SDHCIState *s)
+                     }
+                     dma_memory_write(s->dma_as, dscr.addr,
+                                      &s->fifo_buffer[begin],
+-                                     s->data_count - begin);
++                                     s->data_count - begin,
++                                     MEMTXATTRS_UNSPECIFIED);
+                     dscr.addr +=3D s->data_count - begin;
+                     if (s->data_count =3D=3D block_size) {
+                         s->data_count =3D 0;
+@@ -810,7 +818,8 @@ static void sdhci_do_adma(SDHCIState *s)
+                     }
+                     dma_memory_read(s->dma_as, dscr.addr,
+                                     &s->fifo_buffer[begin],
+-                                    s->data_count - begin);
++                                    s->data_count - begin,
++                                    MEMTXATTRS_UNSPECIFIED);
+                     dscr.addr +=3D s->data_count - begin;
+                     if (s->data_count =3D=3D block_size) {
+                         sdbus_write_data(&s->sdbus, s->fifo_buffer, block=
_size);
+diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
+index e1d96ac..8755e9c 100644
+--- a/hw/usb/hcd-dwc2.c
++++ b/hw/usb/hcd-dwc2.c
+@@ -272,8 +272,8 @@ static void dwc2_handle_packet(DWC2State *s, uint32_t =
devadr, USBDevice *dev,
+
+         if (pid !=3D USB_TOKEN_IN) {
+             trace_usb_dwc2_memory_read(hcdma, tlen);
+-            if (dma_memory_read(&s->dma_as, hcdma,
+-                                s->usb_buf[chan], tlen) !=3D MEMTX_OK) {
++            if (dma_memory_read(&s->dma_as, hcdma, s->usb_buf[chan], tlen=
,
++                                MEMTXATTRS_UNSPECIFIED) !=3D MEMTX_OK) {
+                 qemu_log_mask(LOG_GUEST_ERROR, "%s: dma_memory_read faile=
d\n",
+                               __func__);
+             }
+@@ -328,8 +328,8 @@ babble:
+
+         if (pid =3D=3D USB_TOKEN_IN) {
+             trace_usb_dwc2_memory_write(hcdma, actual);
+-            if (dma_memory_write(&s->dma_as, hcdma, s->usb_buf[chan],
+-                                 actual) !=3D MEMTX_OK) {
++            if (dma_memory_write(&s->dma_as, hcdma, s->usb_buf[chan], act=
ual,
++                                 MEMTXATTRS_UNSPECIFIED) !=3D MEMTX_OK) {
+                 qemu_log_mask(LOG_GUEST_ERROR, "%s: dma_memory_write fail=
ed\n",
+                               __func__);
+             }
+diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
+index 6caa7ac..33a8a37 100644
+--- a/hw/usb/hcd-ehci.c
++++ b/hw/usb/hcd-ehci.c
+@@ -383,7 +383,8 @@ static inline int get_dwords(EHCIState *ehci, uint32_t=
 addr,
+     }
+
+     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
+-        dma_memory_read(ehci->as, addr, buf, sizeof(*buf));
++        dma_memory_read(ehci->as, addr, buf, sizeof(*buf),
++                        MEMTXATTRS_UNSPECIFIED);
+         *buf =3D le32_to_cpu(*buf);
+     }
+
+@@ -405,7 +406,8 @@ static inline int put_dwords(EHCIState *ehci, uint32_t=
 addr,
+
+     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
+         uint32_t tmp =3D cpu_to_le32(*buf);
+-        dma_memory_write(ehci->as, addr, &tmp, sizeof(tmp));
++        dma_memory_write(ehci->as, addr, &tmp, sizeof(tmp),
++                         MEMTXATTRS_UNSPECIFIED);
+     }
+
+     return num;
+diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
+index 56e2315..a93d6b2 100644
+--- a/hw/usb/hcd-ohci.c
++++ b/hw/usb/hcd-ohci.c
+@@ -452,7 +452,8 @@ static inline int get_dwords(OHCIState *ohci,
+     addr +=3D ohci->localmem_base;
+
+     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
+-        if (dma_memory_read(ohci->as, addr, buf, sizeof(*buf))) {
++        if (dma_memory_read(ohci->as, addr,
++                            buf, sizeof(*buf), MEMTXATTRS_UNSPECIFIED)) {
+             return -1;
+         }
+         *buf =3D le32_to_cpu(*buf);
+@@ -471,7 +472,8 @@ static inline int put_dwords(OHCIState *ohci,
+
+     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
+         uint32_t tmp =3D cpu_to_le32(*buf);
+-        if (dma_memory_write(ohci->as, addr, &tmp, sizeof(tmp))) {
++        if (dma_memory_write(ohci->as, addr,
++                             &tmp, sizeof(tmp), MEMTXATTRS_UNSPECIFIED)) =
{
+             return -1;
+         }
+     }
+@@ -488,7 +490,8 @@ static inline int get_words(OHCIState *ohci,
+     addr +=3D ohci->localmem_base;
+
+     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
+-        if (dma_memory_read(ohci->as, addr, buf, sizeof(*buf))) {
++        if (dma_memory_read(ohci->as, addr,
++                            buf, sizeof(*buf), MEMTXATTRS_UNSPECIFIED)) {
+             return -1;
+         }
+         *buf =3D le16_to_cpu(*buf);
+@@ -507,7 +510,8 @@ static inline int put_words(OHCIState *ohci,
+
+     for (i =3D 0; i < num; i++, buf++, addr +=3D sizeof(*buf)) {
+         uint16_t tmp =3D cpu_to_le16(*buf);
+-        if (dma_memory_write(ohci->as, addr, &tmp, sizeof(tmp))) {
++        if (dma_memory_write(ohci->as, addr,
++                             &tmp, sizeof(tmp), MEMTXATTRS_UNSPECIFIED)) =
{
+             return -1;
+         }
+     }
+@@ -537,8 +541,8 @@ static inline int ohci_read_iso_td(OHCIState *ohci,
+ static inline int ohci_read_hcca(OHCIState *ohci,
+                                  dma_addr_t addr, struct ohci_hcca *hcca)
+ {
+-    return dma_memory_read(ohci->as, addr + ohci->localmem_base,
+-                           hcca, sizeof(*hcca));
++    return dma_memory_read(ohci->as, addr + ohci->localmem_base, hcca,
++                           sizeof(*hcca), MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static inline int ohci_put_ed(OHCIState *ohci,
+@@ -572,7 +576,7 @@ static inline int ohci_put_hcca(OHCIState *ohci,
+     return dma_memory_write(ohci->as,
+                             addr + ohci->localmem_base + HCCA_WRITEBACK_O=
FFSET,
+                             (char *)hcca + HCCA_WRITEBACK_OFFSET,
+-                            HCCA_WRITEBACK_SIZE);
++                            HCCA_WRITEBACK_SIZE, MEMTXATTRS_UNSPECIFIED);
+ }
+
+ /* Read/Write the contents of a TD from/to main memory.  */
+diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
+index e017000..ed2b9ea 100644
+--- a/hw/usb/hcd-xhci.c
++++ b/hw/usb/hcd-xhci.c
+@@ -487,7 +487,7 @@ static inline void xhci_dma_read_u32s(XHCIState *xhci,=
 dma_addr_t addr,
+
+     assert((len % sizeof(uint32_t)) =3D=3D 0);
+
+-    dma_memory_read(xhci->as, addr, buf, len);
++    dma_memory_read(xhci->as, addr, buf, len, MEMTXATTRS_UNSPECIFIED);
+
+     for (i =3D 0; i < (len / sizeof(uint32_t)); i++) {
+         buf[i] =3D le32_to_cpu(buf[i]);
+@@ -507,7 +507,7 @@ static inline void xhci_dma_write_u32s(XHCIState *xhci=
, dma_addr_t addr,
+     for (i =3D 0; i < n; i++) {
+         tmp[i] =3D cpu_to_le32(buf[i]);
+     }
+-    dma_memory_write(xhci->as, addr, tmp, len);
++    dma_memory_write(xhci->as, addr, tmp, len, MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static XHCIPort *xhci_lookup_port(XHCIState *xhci, struct USBPort *uport)
+@@ -618,7 +618,7 @@ static void xhci_write_event(XHCIState *xhci, XHCIEven=
t *event, int v)
+                                ev_trb.status, ev_trb.control);
+
+     addr =3D intr->er_start + TRB_SIZE*intr->er_ep_idx;
+-    dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE);
++    dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE, MEMTXATTRS_UNSPEC=
IFIED);
+
+     intr->er_ep_idx++;
+     if (intr->er_ep_idx >=3D intr->er_size) {
+@@ -679,7 +679,8 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRi=
ng *ring, XHCITRB *trb,
+
+     while (1) {
+         TRBType type;
+-        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE);
++        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
++                        MEMTXATTRS_UNSPECIFIED);
+         trb->addr =3D ring->dequeue;
+         trb->ccs =3D ring->ccs;
+         le64_to_cpus(&trb->parameter);
+@@ -726,7 +727,8 @@ static int xhci_ring_chain_length(XHCIState *xhci, con=
st XHCIRing *ring)
+
+     while (1) {
+         TRBType type;
+-        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE);
++        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
++                        MEMTXATTRS_UNSPECIFIED);
+         le64_to_cpus(&trb.parameter);
+         le32_to_cpus(&trb.status);
+         le32_to_cpus(&trb.control);
+@@ -781,7 +783,8 @@ static void xhci_er_reset(XHCIState *xhci, int v)
+         xhci_die(xhci);
+         return;
+     }
+-    dma_memory_read(xhci->as, erstba, &seg, sizeof(seg));
++    dma_memory_read(xhci->as, erstba, &seg, sizeof(seg),
++                    MEMTXATTRS_UNSPECIFIED);
+     le32_to_cpus(&seg.addr_low);
+     le32_to_cpus(&seg.addr_high);
+     le32_to_cpus(&seg.size);
+@@ -2397,7 +2400,8 @@ static TRBCCode xhci_get_port_bandwidth(XHCIState *x=
hci, uint64_t pctx)
+     /* TODO: actually implement real values here */
+     bw_ctx[0] =3D 0;
+     memset(&bw_ctx[1], 80, xhci->numports); /* 80% */
+-    dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx));
++    dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx),
++                     MEMTXATTRS_UNSPECIFIED);
+
+     return CC_SUCCESS;
+ }
+diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
+index c90e74a..5d2ea8e 100644
+--- a/include/hw/ppc/spapr_vio.h
++++ b/include/hw/ppc/spapr_vio.h
+@@ -97,14 +97,16 @@ static inline bool spapr_vio_dma_valid(SpaprVioDevice =
*dev, uint64_t taddr,
+ static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t taddr,
+                                      void *buf, uint32_t size)
+ {
+-    return (dma_memory_read(&dev->as, taddr, buf, size) !=3D 0) ?
++    return (dma_memory_read(&dev->as, taddr,
++                            buf, size, MEMTXATTRS_UNSPECIFIED) !=3D 0) ?
+         H_DEST_PARM : H_SUCCESS;
+ }
+
+ static inline int spapr_vio_dma_write(SpaprVioDevice *dev, uint64_t taddr=
,
+                                       const void *buf, uint32_t size)
+ {
+-    return (dma_memory_write(&dev->as, taddr, buf, size) !=3D 0) ?
++    return (dma_memory_write(&dev->as, taddr,
++                             buf, size, MEMTXATTRS_UNSPECIFIED) !=3D 0) ?
+         H_DEST_PARM : H_SUCCESS;
+ }
+
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index e8ad422..522682b 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -143,12 +143,14 @@ static inline MemTxResult dma_memory_rw(AddressSpace=
 *as, dma_addr_t addr,
+  * @addr: address within that address space
+  * @buf: buffer with the data transferred
+  * @len: length of the data transferred
++ * @attrs: memory transaction attributes
+  */
+ static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t ad=
dr,
+-                                          void *buf, dma_addr_t len)
++                                          void *buf, dma_addr_t len,
++                                          MemTxAttrs attrs)
+ {
+     return dma_memory_rw(as, addr, buf, len,
+-                         DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED)=
;
++                         DMA_DIRECTION_TO_DEVICE, attrs);
+ }
+
+ /**
+@@ -162,12 +164,14 @@ static inline MemTxResult dma_memory_read(AddressSpa=
ce *as, dma_addr_t addr,
+  * @addr: address within that address space
+  * @buf: buffer with the data transferred
+  * @len: the number of bytes to write
++ * @attrs: memory transaction attributes
+  */
+ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t a=
ddr,
+-                                           const void *buf, dma_addr_t le=
n)
++                                           const void *buf, dma_addr_t le=
n,
++                                           MemTxAttrs attrs)
+ {
+     return dma_memory_rw(as, addr, (void *)buf, len,
+-                         DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIE=
D);
++                         DMA_DIRECTION_FROM_DEVICE, attrs);
+ }
+
+ /**
+@@ -239,7 +243,7 @@ static inline void dma_memory_unmap(AddressSpace *as,
+                                                             dma_addr_t ad=
dr) \
+     {                                                                   \
+         uint##_bits##_t val;                                            \
+-        dma_memory_read(as, addr, &val, (_bits) / 8);                   \
++        dma_memory_read(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFI=
ED); \
+         return _end##_bits##_to_cpu(val);                               \
+     }                                                                   \
+     static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
+@@ -247,20 +251,20 @@ static inline void dma_memory_unmap(AddressSpace *as=
,
+                                                  uint##_bits##_t val)   \
+     {                                                                   \
+         val =3D cpu_to_##_end##_bits(val);                               =
 \
+-        dma_memory_write(as, addr, &val, (_bits) / 8);                  \
++        dma_memory_write(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIF=
IED); \
+     }
+
+ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
+ {
+     uint8_t val;
+
+-    dma_memory_read(as, addr, &val, 1);
++    dma_memory_read(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
+     return val;
+ }
+
+ static inline void stb_dma(AddressSpace *as, dma_addr_t addr, uint8_t val=
)
+ {
+-    dma_memory_write(as, addr, &val, 1);
++    dma_memory_write(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
+ }
+
+ DEFINE_LDST_DMA(uw, w, 16, le);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0007_let_dma_memory_map_functi=
on_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0007_le=
t_dma_memory_map_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..8dd0476953
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0007_let_dma_memory_map_function_take=
_MemTxAttrs_argument.patch
@@ -0,0 +1,227 @@
+From a1d4b0a3051b3079c8db607f519bc0fcb30e17ec Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Thu, 3 Sep 2020 11:00:47 +0200
+Subject: [PATCH] dma: Let dma_memory_map() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling
+dma_memory_map().
+
+Patch created mechanically using spatch with this script:
+
+  @@
+  expression E1, E2, E3, E4;
+  @@
+  - dma_memory_map(E1, E2, E3, E4)
+  + dma_memory_map(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3Da1d4b0a3051b3079c8db607f519bc0fcb30e17ec]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-Id: <20211223115554.3155328-7-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/display/virtio-gpu.c | 10 ++++++----
+ hw/hyperv/vmbus.c       |  8 +++++---
+ hw/ide/ahci.c           |  8 +++++---
+ hw/usb/libhw.c          |  3 ++-
+ hw/virtio/virtio.c      |  6 ++++--
+ include/hw/pci/pci.h    |  3 ++-
+ include/sysemu/dma.h    |  5 +++--
+ softmmu/dma-helpers.c   |  3 ++-
+ 8 files changed, 29 insertions(+), 17 deletions(-)
+
+diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
+index d78b970..c6dc818 100644
+--- a/hw/display/virtio-gpu.c
++++ b/hw/display/virtio-gpu.c
+@@ -814,8 +814,9 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
+
+         do {
+             len =3D l;
+-            map =3D dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
+-                                 a, &len, DMA_DIRECTION_TO_DEVICE);
++            map =3D dma_memory_map(VIRTIO_DEVICE(g)->dma_as, a, &len,
++                                 DMA_DIRECTION_TO_DEVICE,
++                                 MEMTXATTRS_UNSPECIFIED);
+             if (!map) {
+                 qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO me=
mory for"
+                               " element %d\n", __func__, e);
+@@ -1252,8 +1253,9 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque=
, size_t size,
+         for (i =3D 0; i < res->iov_cnt; i++) {
+             hwaddr len =3D res->iov[i].iov_len;
+             res->iov[i].iov_base =3D
+-                dma_memory_map(VIRTIO_DEVICE(g)->dma_as,
+-                               res->addrs[i], &len, DMA_DIRECTION_TO_DEVI=
CE);
++                dma_memory_map(VIRTIO_DEVICE(g)->dma_as, res->addrs[i], &=
len,
++                               DMA_DIRECTION_TO_DEVICE,
++                               MEMTXATTRS_UNSPECIFIED);
+
+             if (!res->iov[i].iov_base || len !=3D res->iov[i].iov_len) {
+                 /* Clean up the half-a-mapping we just created... */
+diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
+index dbce3b3..8aad29f 100644
+--- a/hw/hyperv/vmbus.c
++++ b/hw/hyperv/vmbus.c
+@@ -373,7 +373,8 @@ static ssize_t gpadl_iter_io(GpadlIter *iter, void *bu=
f, uint32_t len)
+
+             maddr =3D (iter->gpadl->gfns[idx] << TARGET_PAGE_BITS) | off_=
in_page;
+
+-            iter->map =3D dma_memory_map(iter->as, maddr, &mlen, iter->di=
r);
++            iter->map =3D dma_memory_map(iter->as, maddr, &mlen, iter->di=
r,
++                                       MEMTXATTRS_UNSPECIFIED);
+             if (mlen !=3D pgleft) {
+                 dma_memory_unmap(iter->as, iter->map, mlen, iter->dir, 0)=
;
+                 iter->map =3D NULL;
+@@ -490,7 +491,8 @@ int vmbus_map_sgl(VMBusChanReq *req, DMADirection dir,=
 struct iovec *iov,
+                 goto err;
+             }
+
+-            iov[ret_cnt].iov_base =3D dma_memory_map(sgl->as, a, &l, dir)=
;
++            iov[ret_cnt].iov_base =3D dma_memory_map(sgl->as, a, &l, dir,
++                                                   MEMTXATTRS_UNSPECIFIED=
);
+             if (!l) {
+                 ret =3D -EFAULT;
+                 goto err;
+@@ -566,7 +568,7 @@ static vmbus_ring_buffer *ringbuf_map_hdr(VMBusRingBuf=
Common *ringbuf)
+     dma_addr_t mlen =3D sizeof(*rb);
+
+     rb =3D dma_memory_map(ringbuf->as, ringbuf->rb_addr, &mlen,
+-                        DMA_DIRECTION_FROM_DEVICE);
++                        DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED=
);
+     if (mlen !=3D sizeof(*rb)) {
+         dma_memory_unmap(ringbuf->as, rb, mlen,
+                          DMA_DIRECTION_FROM_DEVICE, 0);
+diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
+index a94c6e2..8e77ddb 100644
+--- a/hw/ide/ahci.c
++++ b/hw/ide/ahci.c
+@@ -249,7 +249,8 @@ static void map_page(AddressSpace *as, uint8_t **ptr, =
uint64_t addr,
+         dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
+     }
+
+-    *ptr =3D dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE);
++    *ptr =3D dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE,
++                          MEMTXATTRS_UNSPECIFIED);
+     if (len < wanted && *ptr) {
+         dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
+         *ptr =3D NULL;
+@@ -939,7 +940,8 @@ static int ahci_populate_sglist(AHCIDevice *ad, QEMUSG=
List *sglist,
+
+     /* map PRDT */
+     if (!(prdt =3D dma_memory_map(ad->hba->as, prdt_addr, &prdt_len,
+-                                DMA_DIRECTION_TO_DEVICE))){
++                                DMA_DIRECTION_TO_DEVICE,
++                                MEMTXATTRS_UNSPECIFIED))){
+         trace_ahci_populate_sglist_no_map(ad->hba, ad->port_no);
+         return -1;
+     }
+@@ -1301,7 +1303,7 @@ static int handle_cmd(AHCIState *s, int port, uint8_=
t slot)
+     tbl_addr =3D le64_to_cpu(cmd->tbl_addr);
+     cmd_len =3D 0x80;
+     cmd_fis =3D dma_memory_map(s->as, tbl_addr, &cmd_len,
+-                             DMA_DIRECTION_TO_DEVICE);
++                             DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIF=
IED);
+     if (!cmd_fis) {
+         trace_handle_cmd_badfis(s, port);
+         return -1;
+diff --git a/hw/usb/libhw.c b/hw/usb/libhw.c
+index 9c33a16..f350eae 100644
+--- a/hw/usb/libhw.c
++++ b/hw/usb/libhw.c
+@@ -36,7 +36,8 @@ int usb_packet_map(USBPacket *p, QEMUSGList *sgl)
+
+         while (len) {
+             dma_addr_t xlen =3D len;
+-            mem =3D dma_memory_map(sgl->as, base, &xlen, dir);
++            mem =3D dma_memory_map(sgl->as, base, &xlen, dir,
++                                 MEMTXATTRS_UNSPECIFIED);
+             if (!mem) {
+                 goto err;
+             }
+diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
+index ea7c079..e11a8a0d 100644
+--- a/hw/virtio/virtio.c
++++ b/hw/virtio/virtio.c
+@@ -1306,7 +1306,8 @@ static bool virtqueue_map_desc(VirtIODevice *vdev, u=
nsigned int *p_num_sg,
+         iov[num_sg].iov_base =3D dma_memory_map(vdev->dma_as, pa, &len,
+                                               is_write ?
+                                               DMA_DIRECTION_FROM_DEVICE :
+-                                              DMA_DIRECTION_TO_DEVICE);
++                                              DMA_DIRECTION_TO_DEVICE,
++                                              MEMTXATTRS_UNSPECIFIED);
+         if (!iov[num_sg].iov_base) {
+             virtio_error(vdev, "virtio: bogus descriptor or out of resour=
ces");
+             goto out;
+@@ -1355,7 +1356,8 @@ static void virtqueue_map_iovec(VirtIODevice *vdev, =
struct iovec *sg,
+         sg[i].iov_base =3D dma_memory_map(vdev->dma_as,
+                                         addr[i], &len, is_write ?
+                                         DMA_DIRECTION_FROM_DEVICE :
+-                                        DMA_DIRECTION_TO_DEVICE);
++                                        DMA_DIRECTION_TO_DEVICE,
++                                        MEMTXATTRS_UNSPECIFIED);
+         if (!sg[i].iov_base) {
+             error_report("virtio: error trying to map MMIO memory");
+             exit(1);
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index 4383f1c..1acefc2 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -875,7 +875,8 @@ static inline void *pci_dma_map(PCIDevice *dev, dma_ad=
dr_t addr,
+ {
+     void *buf;
+
+-    buf =3D dma_memory_map(pci_get_address_space(dev), addr, plen, dir);
++    buf =3D dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
++                         MEMTXATTRS_UNSPECIFIED);
+     return buf;
+ }
+
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index 522682b..97ff6f2 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -202,16 +202,17 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_add=
r_t addr,
+  * @addr: address within that address space
+  * @len: pointer to length of buffer; updated on return
+  * @dir: indicates the transfer direction
++ * @attrs: memory attributes
+  */
+ static inline void *dma_memory_map(AddressSpace *as,
+                                    dma_addr_t addr, dma_addr_t *len,
+-                                   DMADirection dir)
++                                   DMADirection dir, MemTxAttrs attrs)
+ {
+     hwaddr xlen =3D *len;
+     void *p;
+
+     p =3D address_space_map(as, addr, &xlen, dir =3D=3D DMA_DIRECTION_FRO=
M_DEVICE,
+-                          MEMTXATTRS_UNSPECIFIED);
++                          attrs);
+     *len =3D xlen;
+     return p;
+ }
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index 5bf76ff..3c06a2f 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -143,7 +143,8 @@ static void dma_blk_cb(void *opaque, int ret)
+     while (dbs->sg_cur_index < dbs->sg->nsg) {
+         cur_addr =3D dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_by=
te;
+         cur_len =3D dbs->sg->sg[dbs->sg_cur_index].len - dbs->sg_cur_byte=
;
+-        mem =3D dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir)=
;
++        mem =3D dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir,
++                             MEMTXATTRS_UNSPECIFIED);
+         /*
+          * Make reads deterministic in icount mode. Windows sometimes iss=
ues
+          * disk read requests with overlapping SGs. It leads
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0008_have_dma_buf_rw_function_=
take_a_void_pointer.patch b/meta/recipes-devtools/qemu/qemu/0008_have_dma_b=
uf_rw_function_take_a_void_pointer.patch
new file mode 100644
index 0000000000..0876ef184d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0008_have_dma_buf_rw_function_take_a_=
void_pointer.patch
@@ -0,0 +1,41 @@
+From c0ee1527358474c75067993d1bb233ad3a4ee081 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Thu, 16 Dec 2021 11:24:56 +0100
+Subject: [PATCH] dma: Have dma_buf_rw() take a void pointer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+DMA operations are run on any kind of buffer, not arrays of
+uint8_t. Convert dma_buf_rw() to take a void pointer argument
+to save us pointless casts to uint8_t *.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3Dc0ee1527358474c75067993d1bb233ad3a4ee081]
+
+Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-8-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ softmmu/dma-helpers.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index 3c06a2f..09e2999 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -294,9 +294,10 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
+ }
+
+
+-static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
++static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
+                            DMADirection dir)
+ {
++    uint8_t *ptr =3D buf;
+     uint64_t resid;
+     int sg_cur_index;
+
+--
+1.8.3.1
diff --git a/meta/recipes-devtools/qemu/qemu/0009_have_dma_buf_read_and_dma=
_buf_write_functions_take_a_void.patch b/meta/recipes-devtools/qemu/qemu/00=
09_have_dma_buf_read_and_dma_buf_write_functions_take_a_void.patch
new file mode 100644
index 0000000000..d65e0b4305
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0009_have_dma_buf_read_and_dma_buf_wr=
ite_functions_take_a_void.patch
@@ -0,0 +1,167 @@
+From 5e468a36dcdd8fd5eb04282842b72967a29875e4 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Thu, 16 Dec 2021 11:27:23 +0100
+Subject: [PATCH] dma: Have dma_buf_read() / dma_buf_write() take a void
+ pointer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+DMA operations are run on any kind of buffer, not arrays of
+uint8_t. Convert dma_buf_read/dma_buf_write functions to take
+a void pointer argument and save us pointless casts to uint8_t *.
+
+Remove this pointless casts in the megasas device model.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D5e468a36dcdd8fd5eb04282842b72967a29875e4]
+
+Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-9-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/scsi/megasas.c     | 22 +++++++++++-----------
+ include/sysemu/dma.h  |  4 ++--
+ softmmu/dma-helpers.c |  4 ++--
+ 3 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index 14ec6d6..2dae33f 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -848,7 +848,7 @@ static int megasas_ctrl_get_info(MegasasState *s, Mega=
sasCmd *cmd)
+                                        MFI_INFO_PDMIX_SATA |
+                                        MFI_INFO_PDMIX_LD);
+
+-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qs=
g);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
+     return MFI_STAT_OK;
+ }
+
+@@ -878,7 +878,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, M=
egasasCmd *cmd)
+     info.disable_preboot_cli =3D 1;
+     info.cluster_disable =3D 1;
+
+-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qs=
g);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
+     return MFI_STAT_OK;
+ }
+
+@@ -899,7 +899,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s,=
 MegasasCmd *cmd)
+         info.expose_all_drives =3D 1;
+     }
+
+-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qs=
g);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
+     return MFI_STAT_OK;
+ }
+
+@@ -910,7 +910,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, M=
egasasCmd *cmd)
+
+     fw_time =3D cpu_to_le64(megasas_fw_time());
+
+-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&fw_time, dcmd_size, &cmd-=
>qsg);
++    cmd->iov_size -=3D dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
+     return MFI_STAT_OK;
+ }
+
+@@ -937,7 +937,7 @@ static int megasas_event_info(MegasasState *s, Megasas=
Cmd *cmd)
+     info.shutdown_seq_num =3D cpu_to_le32(s->shutdown_event);
+     info.boot_seq_num =3D cpu_to_le32(s->boot_event);
+
+-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qs=
g);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
+     return MFI_STAT_OK;
+ }
+
+@@ -1006,7 +1006,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s,=
 MegasasCmd *cmd)
+     info.size =3D cpu_to_le32(offset);
+     info.count =3D cpu_to_le32(num_pd_disks);
+
+-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, offset, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(&info, offset, &cmd->qsg);
+     return MFI_STAT_OK;
+ }
+
+@@ -1172,7 +1172,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s,=
 MegasasCmd *cmd)
+     info.ld_count =3D cpu_to_le32(num_ld_disks);
+     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks=
);
+
+-    resid =3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
++    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
+     cmd->iov_size =3D dcmd_size - resid;
+     return MFI_STAT_OK;
+ }
+@@ -1221,7 +1221,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *=
s, MegasasCmd *cmd)
+     info.size =3D dcmd_size;
+     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks=
);
+
+-    resid =3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
++    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
+     cmd->iov_size =3D dcmd_size - resid;
+     return MFI_STAT_OK;
+ }
+@@ -1390,7 +1390,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, Me=
gasasCmd *cmd)
+         ld_offset +=3D sizeof(struct mfi_ld_config);
+     }
+
+-    cmd->iov_size -=3D dma_buf_read((uint8_t *)data, info->size, &cmd->qs=
g);
++    cmd->iov_size -=3D dma_buf_read(data, info->size, &cmd->qsg);
+     return MFI_STAT_OK;
+ }
+
+@@ -1420,7 +1420,7 @@ static int megasas_dcmd_get_properties(MegasasState =
*s, MegasasCmd *cmd)
+     info.ecc_bucket_leak_rate =3D cpu_to_le16(1440);
+     info.expose_encl_devices =3D 1;
+
+-    cmd->iov_size -=3D dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qs=
g);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
+     return MFI_STAT_OK;
+ }
+
+@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasState =
*s, MegasasCmd *cmd)
+                                             dcmd_size);
+         return MFI_STAT_INVALID_PARAMETER;
+     }
+-    dma_buf_write((uint8_t *)&info, dcmd_size, &cmd->qsg);
++    dma_buf_write(&info, dcmd_size, &cmd->qsg);
+     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
+     return MFI_STAT_OK;
+ }
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index 97ff6f2..0d5b836 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -302,8 +302,8 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
+ BlockAIOCB *dma_blk_write(BlockBackend *blk,
+                           QEMUSGList *sg, uint64_t offset, uint32_t align=
,
+                           BlockCompletionFunc *cb, void *opaque);
+-uint64_t dma_buf_read(uint8_t *ptr, int32_t len, QEMUSGList *sg);
+-uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
++uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
++uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
+
+ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
+                     QEMUSGList *sg, enum BlockAcctType type);
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index 09e2999..7f37548 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -317,12 +317,12 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, Q=
EMUSGList *sg,
+     return resid;
+ }
+
+-uint64_t dma_buf_read(uint8_t *ptr, int32_t len, QEMUSGList *sg)
++uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
+ {
+     return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
+ }
+
+-uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg)
++uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
+ {
+     return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
+ }
+--
+1.8.3.1
diff --git a/meta/recipes-devtools/qemu/qemu/0010_let_pci_dma_rw_function_t=
ake_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0010_let_pc=
i_dma_rw_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..8207058aca
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0010_let_pci_dma_rw_function_take_Mem=
TxAttrs_argument.patch
@@ -0,0 +1,91 @@
+From e2d784b67dc724a9b0854b49255ba0ee8ca46543 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 22:18:19 +0100
+Subject: [PATCH] pci: Let pci_dma_rw() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling pci_dma_rw().
+
+Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3De2d784b67dc724a9b0854b49255ba0ee8ca46543]
+
+Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-10-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/audio/intel-hda.c |  3 ++-
+ hw/scsi/esp-pci.c    |  2 +-
+ include/hw/pci/pci.h | 10 ++++++----
+ 3 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
+index 8ce9df6..fb3d34a 100644
+--- a/hw/audio/intel-hda.c
++++ b/hw/audio/intel-hda.c
+@@ -427,7 +427,8 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32=
_t stnr, bool output,
+         dprint(d, 3, "dma: entry %d, pos %d/%d, copy %d\n",
+                st->be, st->bp, st->bpl[st->be].len, copy);
+
+-        pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !ou=
tput);
++        pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !ou=
tput,
++                   MEMTXATTRS_UNSPECIFIED);
+         st->lpib +=3D copy;
+         st->bp +=3D copy;
+         buf +=3D copy;
+diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
+index dac054a..1792f84 100644
+--- a/hw/scsi/esp-pci.c
++++ b/hw/scsi/esp-pci.c
+@@ -280,7 +280,7 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, ui=
nt8_t *buf, int len,
+         len =3D pci->dma_regs[DMA_WBC];
+     }
+
+-    pci_dma_rw(PCI_DEVICE(pci), addr, buf, len, dir);
++    pci_dma_rw(PCI_DEVICE(pci), addr, buf, len, dir, MEMTXATTRS_UNSPECIFI=
ED);
+
+     /* update status registers */
+     pci->dma_regs[DMA_WBC] -=3D len;
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index 1acefc2..a751ab5 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -806,10 +806,10 @@ static inline AddressSpace *pci_get_address_space(PC=
IDevice *dev)
+  */
+ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
+                                      void *buf, dma_addr_t len,
+-                                     DMADirection dir)
++                                     DMADirection dir, MemTxAttrs attrs)
+ {
+     return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
+-                         dir, MEMTXATTRS_UNSPECIFIED);
++                         dir, attrs);
+ }
+
+ /**
+@@ -827,7 +827,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, d=
ma_addr_t addr,
+ static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
+                                        void *buf, dma_addr_t len)
+ {
+-    return pci_dma_rw(dev, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
++    return pci_dma_rw(dev, addr, buf, len,
++                      DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
+ }
+
+ /**
+@@ -845,7 +846,8 @@ static inline MemTxResult pci_dma_read(PCIDevice *dev,=
 dma_addr_t addr,
+ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
+                                         const void *buf, dma_addr_t len)
+ {
+-    return pci_dma_rw(dev, addr, (void *) buf, len, DMA_DIRECTION_FROM_DE=
VICE);
++    return pci_dma_rw(dev, addr, (void *) buf, len,
++                      DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
+ }
+
+ #define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
+--
+1.8.3.1
diff --git a/meta/recipes-devtools/qemu/qemu/0011_let_dma_buf_rw_function_t=
ake_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0011_let_dm=
a_buf_rw_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..4f7276ef8b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011_let_dma_buf_rw_function_take_Mem=
TxAttrs_argument.patch
@@ -0,0 +1,65 @@
+From 959384e74e1b508acc3af6e806b3d7b87335fc2a Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 22:59:46 +0100
+Subject: [PATCH] dma: Let dma_buf_rw() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling dma_buf_rw().
+
+Keep the default MEMTXATTRS_UNSPECIFIED in the 2 callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D959384e74e1b508acc3af6e806b3d7b87335fc2a]
+
+Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-11-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ softmmu/dma-helpers.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index 7f37548..fa81d2b 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -295,7 +295,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
+
+
+ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
+-                           DMADirection dir)
++                           DMADirection dir, MemTxAttrs attrs)
+ {
+     uint8_t *ptr =3D buf;
+     uint64_t resid;
+@@ -307,8 +307,7 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEM=
USGList *sg,
+     while (len > 0) {
+         ScatterGatherEntry entry =3D sg->sg[sg_cur_index++];
+         int32_t xfer =3D MIN(len, entry.len);
+-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
+-                      MEMTXATTRS_UNSPECIFIED);
++        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
+         ptr +=3D xfer;
+         len -=3D xfer;
+         resid -=3D xfer;
+@@ -319,12 +318,14 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, Q=
EMUSGList *sg,
+
+ uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
+ {
+-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
++    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
++                      MEMTXATTRS_UNSPECIFIED);
+ }
+
+ uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
+ {
+-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
++    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
++                      MEMTXATTRS_UNSPECIFIED);
+ }
+
+ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
+--
+1.8.3.1
diff --git a/meta/recipes-devtools/qemu/qemu/0012_let_dma_buf_write_functio=
n_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0012_let=
_dma_buf_write_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..9837516422
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012_let_dma_buf_write_function_take_=
MemTxAttrs_argument.patch
@@ -0,0 +1,129 @@
+From 392e48af3468d7f8e49db33fdc9e28b5f99276ce Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 23:02:21 +0100
+Subject: [PATCH] dma: Let dma_buf_write() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling
+dma_buf_write().
+
+Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D392e48af3468d7f8e49db33fdc9e28b5f99276ce]
+
+Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-12-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/ide/ahci.c         | 6 ++++--
+ hw/nvme/ctrl.c        | 3 ++-
+ hw/scsi/megasas.c     | 2 +-
+ hw/scsi/scsi-bus.c    | 2 +-
+ include/sysemu/dma.h  | 2 +-
+ softmmu/dma-helpers.c | 5 ++---
+ 6 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
+index 8e77ddb..079d297 100644
+--- a/hw/ide/ahci.c
++++ b/hw/ide/ahci.c
+@@ -1381,8 +1381,10 @@ static void ahci_pio_transfer(const IDEDMA *dma)
+                             has_sglist ? "" : "o");
+
+     if (has_sglist && size) {
++        const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
++
+         if (is_write) {
+-            dma_buf_write(s->data_ptr, size, &s->sg);
++            dma_buf_write(s->data_ptr, size, &s->sg, attrs);
+         } else {
+             dma_buf_read(s->data_ptr, size, &s->sg);
+         }
+@@ -1479,7 +1481,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool i=
s_write)
+     if (is_write) {
+         dma_buf_read(p, l, &s->sg);
+     } else {
+-        dma_buf_write(p, l, &s->sg);
++        dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+     }
+
+     /* free sglist, update byte count */
+diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
+index 5f573c4..e1a531d 100644
+--- a/hw/nvme/ctrl.c
++++ b/hw/nvme/ctrl.c
+@@ -1146,10 +1146,11 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, u=
int8_t *ptr, uint32_t len,
+     assert(sg->flags & NVME_SG_ALLOC);
+
+     if (sg->flags & NVME_SG_DMA) {
++        const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+         uint64_t residual;
+
+         if (dir =3D=3D NVME_TX_DIRECTION_TO_DEVICE) {
+-            residual =3D dma_buf_write(ptr, len, &sg->qsg);
++            residual =3D dma_buf_write(ptr, len, &sg->qsg, attrs);
+         } else {
+             residual =3D dma_buf_read(ptr, len, &sg->qsg);
+         }
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index 2dae33f..79fd14c 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasState =
*s, MegasasCmd *cmd)
+                                             dcmd_size);
+         return MFI_STAT_INVALID_PARAMETER;
+     }
+-    dma_buf_write(&info, dcmd_size, &cmd->qsg);
++    dma_buf_write(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
+     return MFI_STAT_OK;
+ }
+diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
+index 77325d8..64a506a 100644
+--- a/hw/scsi/scsi-bus.c
++++ b/hw/scsi/scsi-bus.c
+@@ -1423,7 +1423,7 @@ void scsi_req_data(SCSIRequest *req, int len)
+     if (req->cmd.mode =3D=3D SCSI_XFER_FROM_DEV) {
+         req->resid =3D dma_buf_read(buf, len, req->sg);
+     } else {
+-        req->resid =3D dma_buf_write(buf, len, req->sg);
++        req->resid =3D dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPEC=
IFIED);
+     }
+     scsi_req_continue(req);
+ }
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index 0d5b836..e3dd74a 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -303,7 +303,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
+                           QEMUSGList *sg, uint64_t offset, uint32_t align=
,
+                           BlockCompletionFunc *cb, void *opaque);
+ uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
+-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
++uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs=
 attrs);
+
+ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
+                     QEMUSGList *sg, enum BlockAcctType type);
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index fa81d2b..2f1a241 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -322,10 +322,9 @@ uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGL=
ist *sg)
+                       MEMTXATTRS_UNSPECIFIED);
+ }
+
+-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
++uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs=
 attrs)
+ {
+-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
+-                      MEMTXATTRS_UNSPECIFIED);
++    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
+ }
+
+ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
+--
+1.8.3.1
diff --git a/meta/recipes-devtools/qemu/qemu/0013_let_dma_buf_read_function=
_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0013_let_=
dma_buf_read_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..4057caa8b0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0013_let_dma_buf_read_function_take_M=
emTxAttrs_argument.patch
@@ -0,0 +1,222 @@
+From 1e5a3f8b2a976054da96cbbb9de6cbac7c2efb79 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 23:29:52 +0100
+Subject: [PATCH] dma: Let dma_buf_read() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling
+dma_buf_read().
+
+Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D1e5a3f8b2a976054da96cbbb9de6cbac7c2efb79]
+
+Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-13-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/ide/ahci.c         |  4 ++--
+ hw/nvme/ctrl.c        |  2 +-
+ hw/scsi/megasas.c     | 24 ++++++++++++------------
+ hw/scsi/scsi-bus.c    |  2 +-
+ include/sysemu/dma.h  |  2 +-
+ softmmu/dma-helpers.c |  5 ++---
+ 6 files changed, 19 insertions(+), 20 deletions(-)
+
+diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
+index 079d297..205dfdc 100644
+--- a/hw/ide/ahci.c
++++ b/hw/ide/ahci.c
+@@ -1386,7 +1386,7 @@ static void ahci_pio_transfer(const IDEDMA *dma)
+         if (is_write) {
+             dma_buf_write(s->data_ptr, size, &s->sg, attrs);
+         } else {
+-            dma_buf_read(s->data_ptr, size, &s->sg);
++            dma_buf_read(s->data_ptr, size, &s->sg, attrs);
+         }
+     }
+
+@@ -1479,7 +1479,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool i=
s_write)
+     }
+
+     if (is_write) {
+-        dma_buf_read(p, l, &s->sg);
++        dma_buf_read(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+     } else {
+         dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+     }
+diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
+index e1a531d..462f79a 100644
+--- a/hw/nvme/ctrl.c
++++ b/hw/nvme/ctrl.c
+@@ -1152,7 +1152,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uin=
t8_t *ptr, uint32_t len,
+         if (dir =3D=3D NVME_TX_DIRECTION_TO_DEVICE) {
+             residual =3D dma_buf_write(ptr, len, &sg->qsg, attrs);
+         } else {
+-            residual =3D dma_buf_read(ptr, len, &sg->qsg);
++            residual =3D dma_buf_read(ptr, len, &sg->qsg, attrs);
+         }
+
+         if (unlikely(residual)) {
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index 79fd14c..091a350 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -848,7 +848,7 @@ static int megasas_ctrl_get_info(MegasasState *s, Mega=
sasCmd *cmd)
+                                        MFI_INFO_PDMIX_SATA |
+                                        MFI_INFO_PDMIX_LD);
+
+-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATT=
RS_UNSPECIFIED);
+     return MFI_STAT_OK;
+ }
+
+@@ -878,7 +878,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, M=
egasasCmd *cmd)
+     info.disable_preboot_cli =3D 1;
+     info.cluster_disable =3D 1;
+
+-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATT=
RS_UNSPECIFIED);
+     return MFI_STAT_OK;
+ }
+
+@@ -899,7 +899,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s,=
 MegasasCmd *cmd)
+         info.expose_all_drives =3D 1;
+     }
+
+-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATT=
RS_UNSPECIFIED);
+     return MFI_STAT_OK;
+ }
+
+@@ -910,7 +910,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, M=
egasasCmd *cmd)
+
+     fw_time =3D cpu_to_le64(megasas_fw_time());
+
+-    cmd->iov_size -=3D dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(&fw_time, dcmd_size, &cmd->qsg, MEMTX=
ATTRS_UNSPECIFIED);
+     return MFI_STAT_OK;
+ }
+
+@@ -937,7 +937,7 @@ static int megasas_event_info(MegasasState *s, Megasas=
Cmd *cmd)
+     info.shutdown_seq_num =3D cpu_to_le32(s->shutdown_event);
+     info.boot_seq_num =3D cpu_to_le32(s->boot_event);
+
+-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATT=
RS_UNSPECIFIED);
+     return MFI_STAT_OK;
+ }
+
+@@ -1006,7 +1006,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s,=
 MegasasCmd *cmd)
+     info.size =3D cpu_to_le32(offset);
+     info.count =3D cpu_to_le32(num_pd_disks);
+
+-    cmd->iov_size -=3D dma_buf_read(&info, offset, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(&info, offset, &cmd->qsg, MEMTXATTRS_=
UNSPECIFIED);
+     return MFI_STAT_OK;
+ }
+
+@@ -1100,7 +1100,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sd=
ev, int lun,
+     info->connected_port_bitmap =3D 0x1;
+     info->device_speed =3D 1;
+     info->link_speed =3D 1;
+-    resid =3D dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg);
++    resid =3D dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS=
_UNSPECIFIED);
+     g_free(cmd->iov_buf);
+     cmd->iov_size =3D dcmd_size - resid;
+     cmd->iov_buf =3D NULL;
+@@ -1172,7 +1172,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s,=
 MegasasCmd *cmd)
+     info.ld_count =3D cpu_to_le32(num_ld_disks);
+     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks=
);
+
+-    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
++    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPEC=
IFIED);
+     cmd->iov_size =3D dcmd_size - resid;
+     return MFI_STAT_OK;
+ }
+@@ -1221,7 +1221,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *=
s, MegasasCmd *cmd)
+     info.size =3D dcmd_size;
+     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks=
);
+
+-    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
++    resid =3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPEC=
IFIED);
+     cmd->iov_size =3D dcmd_size - resid;
+     return MFI_STAT_OK;
+ }
+@@ -1271,7 +1271,7 @@ static int megasas_ld_get_info_submit(SCSIDevice *sd=
ev, int lun,
+     info->ld_config.span[0].num_blocks =3D info->size;
+     info->ld_config.span[0].array_ref =3D cpu_to_le16(sdev_id);
+
+-    resid =3D dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg);
++    resid =3D dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS=
_UNSPECIFIED);
+     g_free(cmd->iov_buf);
+     cmd->iov_size =3D dcmd_size - resid;
+     cmd->iov_buf =3D NULL;
+@@ -1390,7 +1390,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, Me=
gasasCmd *cmd)
+         ld_offset +=3D sizeof(struct mfi_ld_config);
+     }
+
+-    cmd->iov_size -=3D dma_buf_read(data, info->size, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(data, info->size, &cmd->qsg, MEMTXATT=
RS_UNSPECIFIED);
+     return MFI_STAT_OK;
+ }
+
+@@ -1420,7 +1420,7 @@ static int megasas_dcmd_get_properties(MegasasState =
*s, MegasasCmd *cmd)
+     info.ecc_bucket_leak_rate =3D cpu_to_le16(1440);
+     info.expose_encl_devices =3D 1;
+
+-    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg);
++    cmd->iov_size -=3D dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATT=
RS_UNSPECIFIED);
+     return MFI_STAT_OK;
+ }
+
+diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
+index 64a506a..2b5e9dc 100644
+--- a/hw/scsi/scsi-bus.c
++++ b/hw/scsi/scsi-bus.c
+@@ -1421,7 +1421,7 @@ void scsi_req_data(SCSIRequest *req, int len)
+
+     buf =3D scsi_req_get_buf(req);
+     if (req->cmd.mode =3D=3D SCSI_XFER_FROM_DEV) {
+-        req->resid =3D dma_buf_read(buf, len, req->sg);
++        req->resid =3D dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECI=
FIED);
+     } else {
+         req->resid =3D dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPEC=
IFIED);
+     }
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index e3dd74a..fd8f160 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -302,7 +302,7 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
+ BlockAIOCB *dma_blk_write(BlockBackend *blk,
+                           QEMUSGList *sg, uint64_t offset, uint32_t align=
,
+                           BlockCompletionFunc *cb, void *opaque);
+-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
++uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs =
attrs);
+ uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs=
 attrs);
+
+ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index 2f1a241..a391773 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -316,10 +316,9 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QE=
MUSGList *sg,
+     return resid;
+ }
+
+-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
++uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs =
attrs)
+ {
+-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
+-                      MEMTXATTRS_UNSPECIFIED);
++    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
+ }
+
+ uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs=
 attrs)
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0014_let_dma_buf_rw_function_p=
ropagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/0014_let_dma_b=
uf_rw_function_propagate_MemTxResult.patch
new file mode 100644
index 0000000000..571ce9cc9b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0014_let_dma_buf_rw_function_propagat=
e_MemTxResult.patch
@@ -0,0 +1,91 @@
+From 292e13142d277c15bdd68331abc607e46628b7e1 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Wed, 15 Dec 2021 23:38:52 +0100
+Subject: [PATCH] dma: Let dma_buf_rw() propagate MemTxResult
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+dma_memory_rw() returns a MemTxResult type. Do not discard
+it, return it to the caller.
+
+Since dma_buf_rw() was previously returning the QEMUSGList
+size not consumed, add an extra argument where this size
+can be stored.
+
+Update the 2 callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D292e13142d277c15bdd68331abc607e46628b7e1]
+
+Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-14-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ softmmu/dma-helpers.c | 25 +++++++++++++++++++------
+ 1 file changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
+index a391773..b0be156 100644
+--- a/softmmu/dma-helpers.c
++++ b/softmmu/dma-helpers.c
+@@ -294,12 +294,14 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
+ }
+
+
+-static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
+-                           DMADirection dir, MemTxAttrs attrs)
++static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residp,
++                              QEMUSGList *sg, DMADirection dir,
++                              MemTxAttrs attrs)
+ {
+     uint8_t *ptr =3D buf;
+     uint64_t resid;
+     int sg_cur_index;
++    MemTxResult res =3D MEMTX_OK;
+
+     resid =3D sg->size;
+     sg_cur_index =3D 0;
+@@ -307,23 +309,34 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, Q=
EMUSGList *sg,
+     while (len > 0) {
+         ScatterGatherEntry entry =3D sg->sg[sg_cur_index++];
+         int32_t xfer =3D MIN(len, entry.len);
+-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
++        res |=3D dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs)=
;
+         ptr +=3D xfer;
+         len -=3D xfer;
+         resid -=3D xfer;
+     }
+
+-    return resid;
++    if (residp) {
++        *residp =3D resid;
++    }
++    return res;
+ }
+
+ uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs =
attrs)
+ {
+-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
++    uint64_t resid;
++
++    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
++
++    return resid;
+ }
+
+ uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs=
 attrs)
+ {
+-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
++    uint64_t resid;
++
++    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
++
++    return resid;
+ }
+
+ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0015_let_st_pointer_dma_functi=
on_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0015_le=
t_st_pointer_dma_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..7f56dcb6eb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0015_let_st_pointer_dma_function_take=
_MemTxAttrs_argument.patch
@@ -0,0 +1,120 @@
+From 2280c27afc65bb2af95dd44a88e3b7117bfe240a Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 23:53:34 +0100
+Subject: [PATCH] dma: Let st*_dma() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling st*_dma().
+
+Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D2280c27afc65bb2af95dd44a88e3b7117bfe240a]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: C=C3f=C2=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-16-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/nvram/fw_cfg.c          |  4 ++--
+ include/hw/pci/pci.h       |  3 ++-
+ include/hw/ppc/spapr_vio.h | 12 ++++++++----
+ include/sysemu/dma.h       | 10 ++++++----
+ 4 files changed, 18 insertions(+), 11 deletions(-)
+
+diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
+index 9b91b15..e5f3c981 100644
+--- a/hw/nvram/fw_cfg.c
++++ b/hw/nvram/fw_cfg.c
+@@ -360,7 +360,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
+     if (dma_memory_read(s->dma_as, dma_addr,
+                         &dma, sizeof(dma), MEMTXATTRS_UNSPECIFIED)) {
+         stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control=
),
+-                   FW_CFG_DMA_CTL_ERROR);
++                   FW_CFG_DMA_CTL_ERROR, MEMTXATTRS_UNSPECIFIED);
+         return;
+     }
+
+@@ -446,7 +446,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
+     }
+
+     stl_be_dma(s->dma_as, dma_addr + offsetof(FWCfgDmaAccess, control),
+-                dma.control);
++                dma.control, MEMTXATTRS_UNSPECIFIED);
+
+     trace_fw_cfg_read(s, 0);
+ }
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index a751ab5..d07e970 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -859,7 +859,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev=
, dma_addr_t addr,
+     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
+                                         dma_addr_t addr, uint##_bits##_t =
val) \
+     {                                                                   \
+-        st##_s##_dma(pci_get_address_space(dev), addr, val);            \
++        st##_s##_dma(pci_get_address_space(dev), addr, val, \
++                     MEMTXATTRS_UNSPECIFIED); \
+     }
+
+ PCI_DMA_DEFINE_LDST(ub, b, 8);
+diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
+index 5d2ea8e..e87f8e6 100644
+--- a/include/hw/ppc/spapr_vio.h
++++ b/include/hw/ppc/spapr_vio.h
+@@ -118,10 +118,14 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *=
dev, uint64_t taddr,
+         H_DEST_PARM : H_SUCCESS;
+ }
+
+-#define vio_stb(_dev, _addr, _val) (stb_dma(&(_dev)->as, (_addr), (_val))=
)
+-#define vio_sth(_dev, _addr, _val) (stw_be_dma(&(_dev)->as, (_addr), (_va=
l)))
+-#define vio_stl(_dev, _addr, _val) (stl_be_dma(&(_dev)->as, (_addr), (_va=
l)))
+-#define vio_stq(_dev, _addr, _val) (stq_be_dma(&(_dev)->as, (_addr), (_va=
l)))
++#define vio_stb(_dev, _addr, _val) \
++        (stb_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED))
++#define vio_sth(_dev, _addr, _val) \
++        (stw_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED)=
)
++#define vio_stl(_dev, _addr, _val) \
++        (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED)=
)
++#define vio_stq(_dev, _addr, _val) \
++        (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED)=
)
+ #define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
+
+ int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index fd8f160..009dd3c 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -249,10 +249,11 @@ static inline void dma_memory_unmap(AddressSpace *as=
,
+     }                                                                   \
+     static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
+                                                  dma_addr_t addr,       \
+-                                                 uint##_bits##_t val)   \
++                                                 uint##_bits##_t val,   \
++                                                 MemTxAttrs attrs)      \
+     {                                                                   \
+         val =3D cpu_to_##_end##_bits(val);                               =
 \
+-        dma_memory_write(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIF=
IED); \
++        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
+     }
+
+ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
+@@ -263,9 +264,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_=
addr_t addr)
+     return val;
+ }
+
+-static inline void stb_dma(AddressSpace *as, dma_addr_t addr, uint8_t val=
)
++static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
++                           uint8_t val, MemTxAttrs attrs)
+ {
+-    dma_memory_write(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
++    dma_memory_write(as, addr, &val, 1, attrs);
+ }
+
+ DEFINE_LDST_DMA(uw, w, 16, le);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0016_let_ld_pointer_dma_functi=
on_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/0016_le=
t_ld_pointer_dma_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..a51451d343
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0016_let_ld_pointer_dma_function_take=
_MemTxAttrs_argument.patch
@@ -0,0 +1,151 @@
+From 34cdea1db600540a5261dc474e986f28b637c8e6 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 22:18:07 +0100
+Subject: [PATCH] dma: Let ld*_dma() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling ld*_dma().
+
+Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D34cdea1db600540a5261dc474e986f28b637c8e6]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: C=C3f=C2=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-17-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/intc/pnv_xive.c         |  7 ++++---
+ hw/usb/hcd-xhci.c          |  6 +++---
+ include/hw/pci/pci.h       |  3 ++-
+ include/hw/ppc/spapr_vio.h |  3 ++-
+ include/sysemu/dma.h       | 11 ++++++-----
+ 5 files changed, 17 insertions(+), 13 deletions(-)
+
+diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
+index ad43483..d9249bb 100644
+--- a/hw/intc/pnv_xive.c
++++ b/hw/intc/pnv_xive.c
+@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xi=
ve, uint32_t type,
+
+     /* Get the page size of the indirect table. */
+     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
+-    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr);
++    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPEC=
IFIED);
+
+     if (!(vsd & VSD_ADDRESS_MASK)) {
+ #ifdef XIVE_DEBUG
+@@ -195,7 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xi=
ve, uint32_t type,
+     /* Load the VSD we are looking for, if not already done */
+     if (vsd_idx) {
+         vsd_addr =3D vsd_addr + vsd_idx * XIVE_VSD_SIZE;
+-        vsd =3D ldq_be_dma(&address_space_memory, vsd_addr);
++        vsd =3D ldq_be_dma(&address_space_memory, vsd_addr,
++                         MEMTXATTRS_UNSPECIFIED);
+
+         if (!(vsd & VSD_ADDRESS_MASK)) {
+ #ifdef XIVE_DEBUG
+@@ -542,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive=
, uint32_t type)
+
+     /* Get the page size of the indirect table. */
+     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
+-    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr);
++    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPEC=
IFIED);
+
+     if (!(vsd & VSD_ADDRESS_MASK)) {
+ #ifdef XIVE_DEBUG
+diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
+index ed2b9ea..d960b81 100644
+--- a/hw/usb/hcd-xhci.c
++++ b/hw/usb/hcd-xhci.c
+@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, u=
nsigned int slotid,
+     assert(slotid >=3D 1 && slotid <=3D xhci->numslots);
+
+     dcbaap =3D xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
+-    poctx =3D ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
++    poctx =3D ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPEC=
IFIED);
+     ictx =3D xhci_mask64(pictx);
+     octx =3D xhci_mask64(poctx);
+
+@@ -3437,8 +3437,8 @@ static int usb_xhci_post_load(void *opaque, int vers=
ion_id)
+         if (!slot->addressed) {
+             continue;
+         }
+-        slot->ctx =3D
+-            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
++        slot->ctx =3D xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * sloti=
d,
++                                           MEMTXATTRS_UNSPECIFIED));
+         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
+         slot->uport =3D xhci_lookup_uport(xhci, slot_ctx);
+         if (!slot->uport) {
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index d07e970..0613308 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -854,7 +854,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev=
, dma_addr_t addr,
+     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
+                                                    dma_addr_t addr)     \
+     {                                                                   \
+-        return ld##_l##_dma(pci_get_address_space(dev), addr);          \
++        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
++                            MEMTXATTRS_UNSPECIFIED);                    \
+     }                                                                   \
+     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
+                                         dma_addr_t addr, uint##_bits##_t =
val) \
+diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
+index e87f8e6..d2ec9b0 100644
+--- a/include/hw/ppc/spapr_vio.h
++++ b/include/hw/ppc/spapr_vio.h
+@@ -126,7 +126,8 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *de=
v, uint64_t taddr,
+         (stl_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED)=
)
+ #define vio_stq(_dev, _addr, _val) \
+         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED)=
)
+-#define vio_ldq(_dev, _addr) (ldq_be_dma(&(_dev)->as, (_addr)))
++#define vio_ldq(_dev, _addr) \
++        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
+
+ int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
+
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index 009dd3c..d1635f5 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -241,10 +241,11 @@ static inline void dma_memory_unmap(AddressSpace *as=
,
+
+ #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
+     static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace =
*as, \
+-                                                            dma_addr_t ad=
dr) \
++                                                            dma_addr_t ad=
dr, \
++                                                            MemTxAttrs at=
trs) \
+     {                                                                   \
+         uint##_bits##_t val;                                            \
+-        dma_memory_read(as, addr, &val, (_bits) / 8, MEMTXATTRS_UNSPECIFI=
ED); \
++        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
+         return _end##_bits##_to_cpu(val);                               \
+     }                                                                   \
+     static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
+@@ -253,14 +254,14 @@ static inline void dma_memory_unmap(AddressSpace *as=
,
+                                                  MemTxAttrs attrs)      \
+     {                                                                   \
+         val =3D cpu_to_##_end##_bits(val);                               =
 \
+-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
++        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
+     }
+
+-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr)
++static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAt=
trs attrs)
+ {
+     uint8_t val;
+
+-    dma_memory_read(as, addr, &val, 1, MEMTXATTRS_UNSPECIFIED);
++    dma_memory_read(as, addr, &val, 1, attrs);
+     return val;
+ }
+
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0017_let_st_pointer_dma_functi=
on_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/0017_let_s=
t_pointer_dma_function_propagate_MemTxResult.patch
new file mode 100644
index 0000000000..3fc7b631a4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0017_let_st_pointer_dma_function_prop=
agate_MemTxResult.patch
@@ -0,0 +1,65 @@
+From 24aed6bcb6b6d266149591f955c2460c28759eb4 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 23:56:14 +0100
+Subject: [PATCH] dma: Let st*_dma() propagate MemTxResult
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+dma_memory_write() returns a MemTxResult type. Do not discard
+it, return it to the caller.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D24aed6bcb6b6d266149591f955c2460c28759eb4]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: C=C3f=C2=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-18-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ include/sysemu/dma.h | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index d1635f5..895044d 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -248,13 +248,13 @@ static inline void dma_memory_unmap(AddressSpace *as=
,
+         dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
+         return _end##_bits##_to_cpu(val);                               \
+     }                                                                   \
+-    static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
+-                                                 dma_addr_t addr,       \
+-                                                 uint##_bits##_t val,   \
+-                                                 MemTxAttrs attrs)      \
+-    {                                                                   \
+-        val =3D cpu_to_##_end##_bits(val);                               =
 \
+-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
++    static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as,=
 \
++                                                        dma_addr_t addr, =
\
++                                                        uint##_bits##_t v=
al, \
++                                                        MemTxAttrs attrs)=
 \
++    { \
++        val =3D cpu_to_##_end##_bits(val); \
++        return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
+     }
+
+ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAt=
trs attrs)
+@@ -265,10 +265,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma=
_addr_t addr, MemTxAttrs att
+     return val;
+ }
+
+-static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
+-                           uint8_t val, MemTxAttrs attrs)
++static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
++                                  uint8_t val, MemTxAttrs attrs)
+ {
+-    dma_memory_write(as, addr, &val, 1, attrs);
++    return dma_memory_write(as, addr, &val, 1, attrs);
+ }
+
+ DEFINE_LDST_DMA(uw, w, 16, le);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0018_let_ld_pointer_dma_functi=
on_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/0018_let_l=
d_pointer_dma_function_propagate_MemTxResult.patch
new file mode 100644
index 0000000000..d8a136c47f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0018_let_ld_pointer_dma_function_prop=
agate_MemTxResult.patch
@@ -0,0 +1,175 @@
+From cd1db8df7431edd2210ed0123e2e09b9b6d1e621 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 22:31:11 +0100
+Subject: [PATCH] dma: Let ld*_dma() propagate MemTxResult
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+dma_memory_read() returns a MemTxResult type. Do not discard
+it, return it to the caller.
+
+Update the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3Dcd1db8df7431edd2210ed0123e2e09b9b6d1e621]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: C=C3f=C2=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-19-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/intc/pnv_xive.c         |  8 ++++----
+ hw/usb/hcd-xhci.c          |  7 ++++---
+ include/hw/pci/pci.h       |  6 ++++--
+ include/hw/ppc/spapr_vio.h |  6 +++++-
+ include/sysemu/dma.h       | 25 ++++++++++++-------------
+ 5 files changed, 29 insertions(+), 23 deletions(-)
+
+diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
+index d9249bb..bb20751 100644
+--- a/hw/intc/pnv_xive.c
++++ b/hw/intc/pnv_xive.c
+@@ -172,7 +172,7 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xi=
ve, uint32_t type,
+
+     /* Get the page size of the indirect table. */
+     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
+-    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPEC=
IFIED);
++    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIF=
IED);
+
+     if (!(vsd & VSD_ADDRESS_MASK)) {
+ #ifdef XIVE_DEBUG
+@@ -195,8 +195,8 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *xi=
ve, uint32_t type,
+     /* Load the VSD we are looking for, if not already done */
+     if (vsd_idx) {
+         vsd_addr =3D vsd_addr + vsd_idx * XIVE_VSD_SIZE;
+-        vsd =3D ldq_be_dma(&address_space_memory, vsd_addr,
+-                         MEMTXATTRS_UNSPECIFIED);
++        ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
++                   MEMTXATTRS_UNSPECIFIED);
+
+         if (!(vsd & VSD_ADDRESS_MASK)) {
+ #ifdef XIVE_DEBUG
+@@ -543,7 +543,7 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xive=
, uint32_t type)
+
+     /* Get the page size of the indirect table. */
+     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
+-    vsd =3D ldq_be_dma(&address_space_memory, vsd_addr, MEMTXATTRS_UNSPEC=
IFIED);
++    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECIF=
IED);
+
+     if (!(vsd & VSD_ADDRESS_MASK)) {
+ #ifdef XIVE_DEBUG
+diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
+index d960b81..da5a407 100644
+--- a/hw/usb/hcd-xhci.c
++++ b/hw/usb/hcd-xhci.c
+@@ -2062,7 +2062,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, u=
nsigned int slotid,
+     assert(slotid >=3D 1 && slotid <=3D xhci->numslots);
+
+     dcbaap =3D xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
+-    poctx =3D ldq_le_dma(xhci->as, dcbaap + 8 * slotid, MEMTXATTRS_UNSPEC=
IFIED);
++    ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &poctx, MEMTXATTRS_UNSPECIF=
IED);
+     ictx =3D xhci_mask64(pictx);
+     octx =3D xhci_mask64(poctx);
+
+@@ -3429,6 +3429,7 @@ static int usb_xhci_post_load(void *opaque, int vers=
ion_id)
+     uint32_t slot_ctx[4];
+     uint32_t ep_ctx[5];
+     int slotid, epid, state;
++    uint64_t addr;
+
+     dcbaap =3D xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
+
+@@ -3437,8 +3438,8 @@ static int usb_xhci_post_load(void *opaque, int vers=
ion_id)
+         if (!slot->addressed) {
+             continue;
+         }
+-        slot->ctx =3D xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * sloti=
d,
+-                                           MEMTXATTRS_UNSPECIFIED));
++        ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_UNSPE=
CIFIED);
++        slot->ctx =3D xhci_mask64(addr);
+         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
+         slot->uport =3D xhci_lookup_uport(xhci, slot_ctx);
+         if (!slot->uport) {
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index 0613308..8c5f2ed 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -854,8 +854,10 @@ static inline MemTxResult pci_dma_write(PCIDevice *de=
v, dma_addr_t addr,
+     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
+                                                    dma_addr_t addr)     \
+     {                                                                   \
+-        return ld##_l##_dma(pci_get_address_space(dev), addr,           \
+-                            MEMTXATTRS_UNSPECIFIED);                    \
++        uint##_bits##_t val; \
++        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
++                     MEMTXATTRS_UNSPECIFIED); \
++        return val; \
+     }                                                                   \
+     static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
+                                         dma_addr_t addr, uint##_bits##_t =
val) \
+diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
+index d2ec9b0..7eae1a4 100644
+--- a/include/hw/ppc/spapr_vio.h
++++ b/include/hw/ppc/spapr_vio.h
+@@ -127,7 +127,11 @@ static inline int spapr_vio_dma_set(SpaprVioDevice *d=
ev, uint64_t taddr,
+ #define vio_stq(_dev, _addr, _val) \
+         (stq_be_dma(&(_dev)->as, (_addr), (_val), MEMTXATTRS_UNSPECIFIED)=
)
+ #define vio_ldq(_dev, _addr) \
+-        (ldq_be_dma(&(_dev)->as, (_addr), MEMTXATTRS_UNSPECIFIED))
++        ({ \
++            uint64_t _val; \
++            ldq_be_dma(&(_dev)->as, (_addr), &_val, MEMTXATTRS_UNSPECIFIE=
D); \
++            _val; \
++        })
+
+ int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
+
+diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
+index 895044d..b3faef4 100644
+--- a/include/sysemu/dma.h
++++ b/include/sysemu/dma.h
+@@ -240,14 +240,15 @@ static inline void dma_memory_unmap(AddressSpace *as=
,
+ }
+
+ #define DEFINE_LDST_DMA(_lname, _sname, _bits, _end) \
+-    static inline uint##_bits##_t ld##_lname##_##_end##_dma(AddressSpace =
*as, \
+-                                                            dma_addr_t ad=
dr, \
+-                                                            MemTxAttrs at=
trs) \
+-    {                                                                   \
+-        uint##_bits##_t val;                                            \
+-        dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
+-        return _end##_bits##_to_cpu(val);                               \
+-    }                                                                   \
++    static inline MemTxResult ld##_lname##_##_end##_dma(AddressSpace *as,=
 \
++                                                        dma_addr_t addr, =
\
++                                                        uint##_bits##_t *=
pval, \
++                                                        MemTxAttrs attrs)=
 \
++    { \
++        MemTxResult res =3D dma_memory_read(as, addr, pval, (_bits) / 8, =
attrs); \
++        _end##_bits##_to_cpus(pval); \
++        return res; \
++    } \
+     static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as,=
 \
+                                                         dma_addr_t addr, =
\
+                                                         uint##_bits##_t v=
al, \
+@@ -257,12 +258,10 @@ static inline void dma_memory_unmap(AddressSpace *as=
,
+         return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
+     }
+
+-static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAt=
trs attrs)
++static inline MemTxResult ldub_dma(AddressSpace *as, dma_addr_t addr,
++                                   uint8_t *val, MemTxAttrs attrs)
+ {
+-    uint8_t val;
+-
+-    dma_memory_read(as, addr, &val, 1, attrs);
+-    return val;
++    return dma_memory_read(as, addr, val, 1, attrs);
+ }
+
+ static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0019_let_st_pointer_pci_dma_fu=
nction_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/001=
9_let_st_pointer_pci_dma_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..69101f308d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0019_let_st_pointer_pci_dma_function_=
take_MemTxAttrs_argument.patch
@@ -0,0 +1,303 @@
+From a423a1b523296f8798a5851aaaba64dd166c0a74 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 22:39:42 +0100
+Subject: [PATCH] pci: Let st*_pci_dma() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling st*_pci_dma().
+
+Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3Da423a1b523296f8798a5851aaaba64dd166c0a74]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-21-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/audio/intel-hda.c | 10 ++++++----
+ hw/net/eepro100.c    | 29 ++++++++++++++++++-----------
+ hw/net/tulip.c       | 18 ++++++++++--------
+ hw/scsi/megasas.c    | 15 ++++++++++-----
+ hw/scsi/vmw_pvscsi.c |  3 ++-
+ include/hw/pci/pci.h | 11 ++++++-----
+ 6 files changed, 52 insertions(+), 34 deletions(-)
+
+diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
+index fb3d34a..3309ae0 100644
+--- a/hw/audio/intel-hda.c
++++ b/hw/audio/intel-hda.c
+@@ -345,6 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
+
+ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint3=
2_t response)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     HDACodecBus *bus =3D HDA_BUS(dev->qdev.parent_bus);
+     IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
+     hwaddr addr;
+@@ -367,8 +368,8 @@ static void intel_hda_response(HDACodecDevice *dev, bo=
ol solicited, uint32_t res
+     ex =3D (solicited ? 0 : (1 << 4)) | dev->cad;
+     wp =3D (d->rirb_wp + 1) & 0xff;
+     addr =3D intel_hda_addr(d->rirb_lbase, d->rirb_ubase);
+-    stl_le_pci_dma(&d->pci, addr + 8*wp, response);
+-    stl_le_pci_dma(&d->pci, addr + 8*wp + 4, ex);
++    stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
++    stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
+     d->rirb_wp =3D wp;
+
+     dprint(d, 2, "%s: [wp 0x%x] response 0x%x, extra 0x%x\n",
+@@ -394,6 +395,7 @@ static void intel_hda_response(HDACodecDevice *dev, bo=
ol solicited, uint32_t res
+ static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool outpu=
t,
+                            uint8_t *buf, uint32_t len)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     HDACodecBus *bus =3D HDA_BUS(dev->qdev.parent_bus);
+     IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
+     hwaddr addr;
+@@ -428,7 +430,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32=
_t stnr, bool output,
+                st->be, st->bp, st->bpl[st->be].len, copy);
+
+         pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !ou=
tput,
+-                   MEMTXATTRS_UNSPECIFIED);
++                   attrs);
+         st->lpib +=3D copy;
+         st->bp +=3D copy;
+         buf +=3D copy;
+@@ -451,7 +453,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32=
_t stnr, bool output,
+     if (d->dp_lbase & 0x01) {
+         s =3D st - d->st;
+         addr =3D intel_hda_addr(d->dp_lbase & ~0x01, d->dp_ubase);
+-        stl_le_pci_dma(&d->pci, addr + 8*s, st->lpib);
++        stl_le_pci_dma(&d->pci, addr + 8 * s, st->lpib, attrs);
+     }
+     dprint(d, 3, "dma: --\n");
+
+diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
+index 16e95ef..83c4431 100644
+--- a/hw/net/eepro100.c
++++ b/hw/net/eepro100.c
+@@ -700,6 +700,8 @@ static void set_ru_state(EEPRO100State * s, ru_state_t=
 state)
+
+ static void dump_statistics(EEPRO100State * s)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
++
+     /* Dump statistical data. Most data is never changed by the emulation
+      * and always 0, so we first just copy the whole block and then those
+      * values which really matter.
+@@ -707,16 +709,18 @@ static void dump_statistics(EEPRO100State * s)
+      */
+     pci_dma_write(&s->dev, s->statsaddr, &s->statistics, s->stats_size);
+     stl_le_pci_dma(&s->dev, s->statsaddr + 0,
+-                   s->statistics.tx_good_frames);
++                   s->statistics.tx_good_frames, attrs);
+     stl_le_pci_dma(&s->dev, s->statsaddr + 36,
+-                   s->statistics.rx_good_frames);
++                   s->statistics.rx_good_frames, attrs);
+     stl_le_pci_dma(&s->dev, s->statsaddr + 48,
+-                   s->statistics.rx_resource_errors);
++                   s->statistics.rx_resource_errors, attrs);
+     stl_le_pci_dma(&s->dev, s->statsaddr + 60,
+-                   s->statistics.rx_short_frame_errors);
++                   s->statistics.rx_short_frame_errors, attrs);
+ #if 0
+-    stw_le_pci_dma(&s->dev, s->statsaddr + 76, s->statistics.xmt_tco_fram=
es);
+-    stw_le_pci_dma(&s->dev, s->statsaddr + 78, s->statistics.rcv_tco_fram=
es);
++    stw_le_pci_dma(&s->dev, s->statsaddr + 76,
++                   s->statistics.xmt_tco_frames, attrs);
++    stw_le_pci_dma(&s->dev, s->statsaddr + 78,
++                   s->statistics.rcv_tco_frames, attrs);
+     missing("CU dump statistical counters");
+ #endif
+ }
+@@ -833,6 +837,7 @@ static void set_multicast_list(EEPRO100State *s)
+
+ static void action_command(EEPRO100State *s)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     /* The loop below won't stop if it gets special handcrafted data.
+        Therefore we limit the number of iterations. */
+     unsigned max_loop_count =3D 16;
+@@ -911,7 +916,7 @@ static void action_command(EEPRO100State *s)
+         }
+         /* Write new status. */
+         stw_le_pci_dma(&s->dev, s->cb_address,
+-                       s->tx.status | ok_status | STATUS_C);
++                       s->tx.status | ok_status | STATUS_C, attrs);
+         if (bit_i) {
+             /* CU completed action. */
+             eepro100_cx_interrupt(s);
+@@ -937,6 +942,7 @@ static void action_command(EEPRO100State *s)
+
+ static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     cu_state_t cu_state;
+     switch (val) {
+     case CU_NOP:
+@@ -986,7 +992,7 @@ static void eepro100_cu_command(EEPRO100State * s, uin=
t8_t val)
+         /* Dump statistical counters. */
+         TRACE(OTHER, logout("val=3D0x%02x (dump stats)\n", val));
+         dump_statistics(s);
+-        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa005);
++        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa005, att=
rs);
+         break;
+     case CU_CMD_BASE:
+         /* Load CU base. */
+@@ -997,7 +1003,7 @@ static void eepro100_cu_command(EEPRO100State * s, ui=
nt8_t val)
+         /* Dump and reset statistical counters. */
+         TRACE(OTHER, logout("val=3D0x%02x (dump stats and reset)\n", val)=
);
+         dump_statistics(s);
+-        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa007);
++        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa007, att=
rs);
+         memset(&s->statistics, 0, sizeof(s->statistics));
+         break;
+     case CU_SRESUME:
+@@ -1612,6 +1618,7 @@ static ssize_t nic_receive(NetClientState *nc, const=
 uint8_t * buf, size_t size)
+      * - Magic packets should set bit 30 in power management driver regis=
ter.
+      * - Interesting packets should set bit 29 in power management driver=
 register.
+      */
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     EEPRO100State *s =3D qemu_get_nic_opaque(nc);
+     uint16_t rfd_status =3D 0xa000;
+ #if defined(CONFIG_PAD_RECEIVED_FRAMES)
+@@ -1726,9 +1733,9 @@ static ssize_t nic_receive(NetClientState *nc, const=
 uint8_t * buf, size_t size)
+     TRACE(OTHER, logout("command 0x%04x, link 0x%08x, addr 0x%08x, size %=
u\n",
+           rfd_command, rx.link, rx.rx_buf_addr, rfd_size));
+     stw_le_pci_dma(&s->dev, s->ru_base + s->ru_offset +
+-                offsetof(eepro100_rx_t, status), rfd_status);
++                offsetof(eepro100_rx_t, status), rfd_status, attrs);
+     stw_le_pci_dma(&s->dev, s->ru_base + s->ru_offset +
+-                offsetof(eepro100_rx_t, count), size);
++                offsetof(eepro100_rx_t, count), size, attrs);
+     /* Early receive interrupt not supported. */
+ #if 0
+     eepro100_er_interrupt(s);
+diff --git a/hw/net/tulip.c b/hw/net/tulip.c
+index ca69f7e..1f2c79d 100644
+--- a/hw/net/tulip.c
++++ b/hw/net/tulip.c
+@@ -86,16 +86,18 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
+ static void tulip_desc_write(TULIPState *s, hwaddr p,
+         struct tulip_descriptor *desc)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
++
+     if (s->csr[0] & CSR0_DBO) {
+-        stl_be_pci_dma(&s->dev, p, desc->status);
+-        stl_be_pci_dma(&s->dev, p + 4, desc->control);
+-        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1);
+-        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2);
++        stl_be_pci_dma(&s->dev, p, desc->status, attrs);
++        stl_be_pci_dma(&s->dev, p + 4, desc->control, attrs);
++        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
++        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
+     } else {
+-        stl_le_pci_dma(&s->dev, p, desc->status);
+-        stl_le_pci_dma(&s->dev, p + 4, desc->control);
+-        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1);
+-        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2);
++        stl_le_pci_dma(&s->dev, p, desc->status, attrs);
++        stl_le_pci_dma(&s->dev, p + 4, desc->control, attrs);
++        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
++        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
+     }
+ }
+
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index 091a350..b5e8b14 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -168,14 +168,16 @@ static void megasas_frame_set_cmd_status(MegasasStat=
e *s,
+                                          unsigned long frame, uint8_t v)
+ {
+     PCIDevice *pci =3D &s->parent_obj;
+-    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, cmd_status=
), v);
++    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, cmd_status=
),
++                v, MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static void megasas_frame_set_scsi_status(MegasasState *s,
+                                           unsigned long frame, uint8_t v)
+ {
+     PCIDevice *pci =3D &s->parent_obj;
+-    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, scsi_statu=
s), v);
++    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, scsi_statu=
s),
++                v, MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static inline const char *mfi_frame_desc(unsigned int cmd)
+@@ -542,6 +544,7 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState =
*s,
+
+ static void megasas_complete_frame(MegasasState *s, uint64_t context)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     PCIDevice *pci_dev =3D PCI_DEVICE(s);
+     int tail, queue_offset;
+
+@@ -555,10 +558,12 @@ static void megasas_complete_frame(MegasasState *s, =
uint64_t context)
+          */
+         if (megasas_use_queue64(s)) {
+             queue_offset =3D s->reply_queue_head * sizeof(uint64_t);
+-            stq_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset, con=
text);
++            stq_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
++                           context, attrs);
+         } else {
+             queue_offset =3D s->reply_queue_head * sizeof(uint32_t);
+-            stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset, con=
text);
++            stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
++                           context, attrs);
+         }
+         s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_pa);
+         trace_megasas_qf_complete(context, s->reply_queue_head,
+@@ -572,7 +577,7 @@ static void megasas_complete_frame(MegasasState *s, ui=
nt64_t context)
+         s->reply_queue_head =3D megasas_next_index(s, tail, s->fw_cmds);
+         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
+                                 s->busy);
+-        stl_le_pci_dma(pci_dev, s->producer_pa, s->reply_queue_head);
++        stl_le_pci_dma(pci_dev, s->producer_pa, s->reply_queue_head, attr=
s);
+         /* Notify HBA */
+         if (msix_enabled(pci_dev)) {
+             trace_megasas_msix_raise(0);
+diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
+index cd76bd6..59c3e8b 100644
+--- a/hw/scsi/vmw_pvscsi.c
++++ b/hw/scsi/vmw_pvscsi.c
+@@ -55,7 +55,8 @@
+                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field)))
+ #define RS_SET_FIELD(m, field, val) \
+     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
+-                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), v=
al))
++                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), v=
al, \
++                 MEMTXATTRS_UNSPECIFIED))
+
+ struct PVSCSIClass {
+     PCIDeviceClass parent_class;
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index 8c5f2ed..9f51ef2 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -859,11 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevice *d=
ev, dma_addr_t addr,
+                      MEMTXATTRS_UNSPECIFIED); \
+         return val; \
+     }                                                                   \
+-    static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
+-                                        dma_addr_t addr, uint##_bits##_t =
val) \
+-    {                                                                   \
+-        st##_s##_dma(pci_get_address_space(dev), addr, val, \
+-                     MEMTXATTRS_UNSPECIFIED); \
++    static inline void st##_s##_pci_dma(PCIDevice *dev, \
++                                        dma_addr_t addr, \
++                                        uint##_bits##_t val, \
++                                        MemTxAttrs attrs) \
++    { \
++        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
+     }
+
+ PCI_DMA_DEFINE_LDST(ub, b, 8);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0020_let_ld_pointer_pci_dma_fu=
nction_take_MemTxAttrs_argument.patch b/meta/recipes-devtools/qemu/qemu/002=
0_let_ld_pointer_pci_dma_function_take_MemTxAttrs_argument.patch
new file mode 100644
index 0000000000..7f9de244be
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0020_let_ld_pointer_pci_dma_function_=
take_MemTxAttrs_argument.patch
@@ -0,0 +1,271 @@
+From 398f9a84ac7132e38caf7b066273734b3bf619ff Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 23:45:06 +0100
+Subject: [PATCH] pci: Let ld*_pci_dma() take MemTxAttrs argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Let devices specify transaction attributes when calling ld*_pci_dma().
+
+Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D398f9a84ac7132e38caf7b066273734b3bf619ff]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-22-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/audio/intel-hda.c |  2 +-
+ hw/net/eepro100.c    | 19 +++++++++++++------
+ hw/net/tulip.c       | 18 ++++++++++--------
+ hw/scsi/megasas.c    | 16 ++++++++++------
+ hw/scsi/mptsas.c     | 10 ++++++----
+ hw/scsi/vmw_pvscsi.c |  3 ++-
+ hw/usb/hcd-xhci.c    |  1 +
+ include/hw/pci/pci.h |  6 +++---
+ 8 files changed, 46 insertions(+), 29 deletions(-)
+
+diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
+index 3309ae0..e34b7ab 100644
+--- a/hw/audio/intel-hda.c
++++ b/hw/audio/intel-hda.c
+@@ -335,7 +335,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
+
+         rp =3D (d->corb_rp + 1) & 0xff;
+         addr =3D intel_hda_addr(d->corb_lbase, d->corb_ubase);
+-        verb =3D ldl_le_pci_dma(&d->pci, addr + 4*rp);
++        verb =3D ldl_le_pci_dma(&d->pci, addr + 4 * rp, MEMTXATTRS_UNSPEC=
IFIED);
+         d->corb_rp =3D rp;
+
+         dprint(d, 2, "%s: [rp 0x%x] verb 0x%08x\n", __func__, rp, verb);
+diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
+index 83c4431..eb82e9c 100644
+--- a/hw/net/eepro100.c
++++ b/hw/net/eepro100.c
+@@ -737,6 +737,7 @@ static void read_cb(EEPRO100State *s)
+
+ static void tx_command(EEPRO100State *s)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     uint32_t tbd_array =3D s->tx.tbd_array_addr;
+     uint16_t tcb_bytes =3D s->tx.tcb_bytes & 0x3fff;
+     /* Sends larger than MAX_ETH_FRAME_SIZE are allowed, up to 2600 bytes=
. */
+@@ -772,11 +773,14 @@ static void tx_command(EEPRO100State *s)
+             /* Extended Flexible TCB. */
+             for (; tbd_count < 2; tbd_count++) {
+                 uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev,
+-                                                            tbd_address);
++                                                            tbd_address,
++                                                            attrs);
+                 uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev,
+-                                                          tbd_address + 4=
);
++                                                          tbd_address + 4=
,
++                                                          attrs);
+                 uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev,
+-                                                        tbd_address + 6);
++                                                        tbd_address + 6,
++                                                        attrs);
+                 tbd_address +=3D 8;
+                 TRACE(RXTX, logout
+                     ("TBD (extended flexible mode): buffer address 0x%08x=
, size 0x%04x\n",
+@@ -792,9 +796,12 @@ static void tx_command(EEPRO100State *s)
+         }
+         tbd_address =3D tbd_array;
+         for (; tbd_count < s->tx.tbd_count; tbd_count++) {
+-            uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev, tbd_ad=
dress);
+-            uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev, tbd_addr=
ess + 4);
+-            uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev, tbd_addres=
s + 6);
++            uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev, tbd_ad=
dress,
++                                                        attrs);
++            uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev, tbd_addr=
ess + 4,
++                                                      attrs);
++            uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev, tbd_addres=
s + 6,
++                                                    attrs);
+             tbd_address +=3D 8;
+             TRACE(RXTX, logout
+                 ("TBD (flexible mode): buffer address 0x%08x, size 0x%04x=
\n",
+diff --git a/hw/net/tulip.c b/hw/net/tulip.c
+index 1f2c79d..c76e486 100644
+--- a/hw/net/tulip.c
++++ b/hw/net/tulip.c
+@@ -70,16 +70,18 @@ static const VMStateDescription vmstate_pci_tulip =3D =
{
+ static void tulip_desc_read(TULIPState *s, hwaddr p,
+         struct tulip_descriptor *desc)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
++
+     if (s->csr[0] & CSR0_DBO) {
+-        desc->status =3D ldl_be_pci_dma(&s->dev, p);
+-        desc->control =3D ldl_be_pci_dma(&s->dev, p + 4);
+-        desc->buf_addr1 =3D ldl_be_pci_dma(&s->dev, p + 8);
+-        desc->buf_addr2 =3D ldl_be_pci_dma(&s->dev, p + 12);
++        desc->status =3D ldl_be_pci_dma(&s->dev, p, attrs);
++        desc->control =3D ldl_be_pci_dma(&s->dev, p + 4, attrs);
++        desc->buf_addr1 =3D ldl_be_pci_dma(&s->dev, p + 8, attrs);
++        desc->buf_addr2 =3D ldl_be_pci_dma(&s->dev, p + 12, attrs);
+     } else {
+-        desc->status =3D ldl_le_pci_dma(&s->dev, p);
+-        desc->control =3D ldl_le_pci_dma(&s->dev, p + 4);
+-        desc->buf_addr1 =3D ldl_le_pci_dma(&s->dev, p + 8);
+-        desc->buf_addr2 =3D ldl_le_pci_dma(&s->dev, p + 12);
++        desc->status =3D ldl_le_pci_dma(&s->dev, p, attrs);
++        desc->control =3D ldl_le_pci_dma(&s->dev, p + 4, attrs);
++        desc->buf_addr1 =3D ldl_le_pci_dma(&s->dev, p + 8, attrs);
++        desc->buf_addr2 =3D ldl_le_pci_dma(&s->dev, p + 12, attrs);
+     }
+ }
+
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index b5e8b14..98b1370 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -202,7 +202,9 @@ static uint64_t megasas_frame_get_context(MegasasState=
 *s,
+                                           unsigned long frame)
+ {
+     PCIDevice *pci =3D &s->parent_obj;
+-    return ldq_le_pci_dma(pci, frame + offsetof(struct mfi_frame_header, =
context));
++    return ldq_le_pci_dma(pci,
++                          frame + offsetof(struct mfi_frame_header, conte=
xt),
++                          MEMTXATTRS_UNSPECIFIED);
+ }
+
+ static bool megasas_frame_is_ieee_sgl(MegasasCmd *cmd)
+@@ -534,7 +536,8 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState =
*s,
+     s->busy++;
+
+     if (s->consumer_pa) {
+-        s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa);
++        s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa,
++                                             MEMTXATTRS_UNSPECIFIED);
+     }
+     trace_megasas_qf_enqueue(cmd->index, cmd->count, cmd->context,
+                              s->reply_queue_head, s->reply_queue_tail, s-=
>busy);
+@@ -565,14 +568,14 @@ static void megasas_complete_frame(MegasasState *s, =
uint64_t context)
+             stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
+                            context, attrs);
+         }
+-        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_pa);
++        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_pa, a=
ttrs);
+         trace_megasas_qf_complete(context, s->reply_queue_head,
+                                   s->reply_queue_tail, s->busy);
+     }
+
+     if (megasas_intr_enabled(s)) {
+         /* Update reply queue pointer */
+-        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_pa);
++        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_pa, a=
ttrs);
+         tail =3D s->reply_queue_head;
+         s->reply_queue_head =3D megasas_next_index(s, tail, s->fw_cmds);
+         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
+@@ -637,6 +640,7 @@ static void megasas_abort_command(MegasasCmd *cmd)
+
+ static int megasas_init_firmware(MegasasState *s, MegasasCmd *cmd)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     PCIDevice *pcid =3D PCI_DEVICE(s);
+     uint32_t pa_hi, pa_lo;
+     hwaddr iq_pa, initq_size =3D sizeof(struct mfi_init_qinfo);
+@@ -675,9 +679,9 @@ static int megasas_init_firmware(MegasasState *s, Mega=
sasCmd *cmd)
+     pa_lo =3D le32_to_cpu(initq->pi_addr_lo);
+     pa_hi =3D le32_to_cpu(initq->pi_addr_hi);
+     s->producer_pa =3D ((uint64_t) pa_hi << 32) | pa_lo;
+-    s->reply_queue_head =3D ldl_le_pci_dma(pcid, s->producer_pa);
++    s->reply_queue_head =3D ldl_le_pci_dma(pcid, s->producer_pa, attrs);
+     s->reply_queue_head %=3D MEGASAS_MAX_FRAMES;
+-    s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa);
++    s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa, attrs);
+     s->reply_queue_tail %=3D MEGASAS_MAX_FRAMES;
+     flags =3D le32_to_cpu(initq->flags);
+     if (flags & MFI_QUEUE_FLAG_CONTEXT64) {
+diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
+index f6c7765..ac9f4df 100644
+--- a/hw/scsi/mptsas.c
++++ b/hw/scsi/mptsas.c
+@@ -172,14 +172,15 @@ static const int mpi_request_sizes[] =3D {
+ static dma_addr_t mptsas_ld_sg_base(MPTSASState *s, uint32_t flags_and_le=
ngth,
+                                     dma_addr_t *sgaddr)
+ {
++    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+     PCIDevice *pci =3D (PCIDevice *) s;
+     dma_addr_t addr;
+
+     if (flags_and_length & MPI_SGE_FLAGS_64_BIT_ADDRESSING) {
+-        addr =3D ldq_le_pci_dma(pci, *sgaddr + 4);
++        addr =3D ldq_le_pci_dma(pci, *sgaddr + 4, attrs);
+         *sgaddr +=3D 12;
+     } else {
+-        addr =3D ldl_le_pci_dma(pci, *sgaddr + 4);
++        addr =3D ldl_le_pci_dma(pci, *sgaddr + 4, attrs);
+         *sgaddr +=3D 8;
+     }
+     return addr;
+@@ -203,7 +204,7 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequ=
est *req, hwaddr addr)
+         dma_addr_t addr, len;
+         uint32_t flags_and_length;
+
+-        flags_and_length =3D ldl_le_pci_dma(pci, sgaddr);
++        flags_and_length =3D ldl_le_pci_dma(pci, sgaddr, MEMTXATTRS_UNSPE=
CIFIED);
+         len =3D flags_and_length & MPI_SGE_LENGTH_MASK;
+         if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
+             !=3D MPI_SGE_FLAGS_SIMPLE_ELEMENT ||
+@@ -234,7 +235,8 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequ=
est *req, hwaddr addr)
+                 break;
+             }
+
+-            flags_and_length =3D ldl_le_pci_dma(pci, next_chain_addr);
++            flags_and_length =3D ldl_le_pci_dma(pci, next_chain_addr,
++                                              MEMTXATTRS_UNSPECIFIED);
+             if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
+                 !=3D MPI_SGE_FLAGS_CHAIN_ELEMENT) {
+                 return MPI_IOCSTATUS_INVALID_SGL;
+diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
+index 59c3e8b..33e16f9 100644
+--- a/hw/scsi/vmw_pvscsi.c
++++ b/hw/scsi/vmw_pvscsi.c
+@@ -52,7 +52,8 @@
+
+ #define RS_GET_FIELD(m, field) \
+     (ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
+-                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field)))
++                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), \
++                 MEMTXATTRS_UNSPECIFIED))
+ #define RS_SET_FIELD(m, field, val) \
+     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
+                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), v=
al, \
+diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
+index da5a407..14bdb89 100644
+--- a/hw/usb/hcd-xhci.c
++++ b/hw/usb/hcd-xhci.c
+@@ -3440,6 +3440,7 @@ static int usb_xhci_post_load(void *opaque, int vers=
ion_id)
+         }
+         ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_UNSPE=
CIFIED);
+         slot->ctx =3D xhci_mask64(addr);
++
+         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
+         slot->uport =3D xhci_lookup_uport(xhci, slot_ctx);
+         if (!slot->uport) {
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index 9f51ef2..7a46c1f 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -852,11 +852,11 @@ static inline MemTxResult pci_dma_write(PCIDevice *d=
ev, dma_addr_t addr,
+
+ #define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
+     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
+-                                                   dma_addr_t addr)     \
++                                                   dma_addr_t addr, \
++                                                   MemTxAttrs attrs) \
+     {                                                                   \
+         uint##_bits##_t val; \
+-        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
+-                     MEMTXATTRS_UNSPECIFIED); \
++        ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
+         return val; \
+     }                                                                   \
+     static inline void st##_s##_pci_dma(PCIDevice *dev, \
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0021_let_st_pointer_pci_dma_fu=
nction_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/0021_l=
et_st_pointer_pci_dma_function_propagate_MemTxResult.patch
new file mode 100644
index 0000000000..e52a45b90f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0021_let_st_pointer_pci_dma_function_=
propagate_MemTxResult.patch
@@ -0,0 +1,47 @@
+From 6bebb270731758fae3114b7d24c2b12b7c325cc5 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 23:47:30 +0100
+Subject: [PATCH] pci: Let st*_pci_dma() propagate MemTxResult
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+st*_dma() returns a MemTxResult type. Do not discard
+it, return it to the caller.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D6bebb270731758fae3114b7d24c2b12b7c325cc5]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-23-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ include/hw/pci/pci.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index 7a46c1f..c90cecc 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -859,12 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevice *d=
ev, dma_addr_t addr,
+         ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
+         return val; \
+     }                                                                   \
+-    static inline void st##_s##_pci_dma(PCIDevice *dev, \
+-                                        dma_addr_t addr, \
+-                                        uint##_bits##_t val, \
+-                                        MemTxAttrs attrs) \
++    static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
++                                               dma_addr_t addr, \
++                                               uint##_bits##_t val, \
++                                               MemTxAttrs attrs) \
+     { \
+-        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
++        return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs)=
; \
+     }
+
+ PCI_DMA_DEFINE_LDST(ub, b, 8);
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0022_let_ld_pointer_pci_dma_fu=
nction_propagate_MemTxResult.patch b/meta/recipes-devtools/qemu/qemu/0022_l=
et_ld_pointer_pci_dma_function_propagate_MemTxResult.patch
new file mode 100644
index 0000000000..6bd6350f44
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0022_let_ld_pointer_pci_dma_function_=
propagate_MemTxResult.patch
@@ -0,0 +1,296 @@
+From 4a63054bce23982b99f4d3c65528e47e614086b2 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Fri, 17 Dec 2021 23:49:30 +0100
+Subject: [PATCH] pci: Let ld*_pci_dma() propagate MemTxResult
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+ld*_dma() returns a MemTxResult type. Do not discard
+it, return it to the caller.
+
+Update the few callers.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=
=3D4a63054bce23982b99f4d3c65528e47e614086b2]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211223115554.3155328-24-philmd@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/audio/intel-hda.c |  2 +-
+ hw/net/eepro100.c    | 25 ++++++++++---------------
+ hw/net/tulip.c       | 16 ++++++++--------
+ hw/scsi/megasas.c    | 21 ++++++++++++---------
+ hw/scsi/mptsas.c     | 16 +++++++++++-----
+ hw/scsi/vmw_pvscsi.c | 16 ++++++++++------
+ include/hw/pci/pci.h | 17 ++++++++---------
+ 7 files changed, 60 insertions(+), 53 deletions(-)
+
+diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
+index e34b7ab..2b55d52 100644
+--- a/hw/audio/intel-hda.c
++++ b/hw/audio/intel-hda.c
+@@ -335,7 +335,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
+
+         rp =3D (d->corb_rp + 1) & 0xff;
+         addr =3D intel_hda_addr(d->corb_lbase, d->corb_ubase);
+-        verb =3D ldl_le_pci_dma(&d->pci, addr + 4 * rp, MEMTXATTRS_UNSPEC=
IFIED);
++        ldl_le_pci_dma(&d->pci, addr + 4 * rp, &verb, MEMTXATTRS_UNSPECIF=
IED);
+         d->corb_rp =3D rp;
+
+         dprint(d, 2, "%s: [rp 0x%x] verb 0x%08x\n", __func__, rp, verb);
+diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
+index eb82e9c..679f52f 100644
+--- a/hw/net/eepro100.c
++++ b/hw/net/eepro100.c
+@@ -769,18 +769,16 @@ static void tx_command(EEPRO100State *s)
+     } else {
+         /* Flexible mode. */
+         uint8_t tbd_count =3D 0;
++        uint32_t tx_buffer_address;
++        uint16_t tx_buffer_size;
++        uint16_t tx_buffer_el;
++
+         if (s->has_extended_tcb_support && !(s->configuration[6] & BIT(4)=
)) {
+             /* Extended Flexible TCB. */
+             for (; tbd_count < 2; tbd_count++) {
+-                uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev,
+-                                                            tbd_address,
+-                                                            attrs);
+-                uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev,
+-                                                          tbd_address + 4=
,
+-                                                          attrs);
+-                uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev,
+-                                                        tbd_address + 6,
+-                                                        attrs);
++                ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, =
attrs);
++                lduw_le_pci_dma(&s->dev, tbd_address + 4, &tx_buffer_size=
, attrs);
++                lduw_le_pci_dma(&s->dev, tbd_address + 6, &tx_buffer_el, =
attrs);
+                 tbd_address +=3D 8;
+                 TRACE(RXTX, logout
+                     ("TBD (extended flexible mode): buffer address 0x%08x=
, size 0x%04x\n",
+@@ -796,12 +794,9 @@ static void tx_command(EEPRO100State *s)
+         }
+         tbd_address =3D tbd_array;
+         for (; tbd_count < s->tx.tbd_count; tbd_count++) {
+-            uint32_t tx_buffer_address =3D ldl_le_pci_dma(&s->dev, tbd_ad=
dress,
+-                                                        attrs);
+-            uint16_t tx_buffer_size =3D lduw_le_pci_dma(&s->dev, tbd_addr=
ess + 4,
+-                                                      attrs);
+-            uint16_t tx_buffer_el =3D lduw_le_pci_dma(&s->dev, tbd_addres=
s + 6,
+-                                                    attrs);
++            ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, attr=
s);
++            lduw_le_pci_dma(&s->dev, tbd_address + 4, &tx_buffer_size, at=
trs);
++            lduw_le_pci_dma(&s->dev, tbd_address + 6, &tx_buffer_el, attr=
s);
+             tbd_address +=3D 8;
+             TRACE(RXTX, logout
+                 ("TBD (flexible mode): buffer address 0x%08x, size 0x%04x=
\n",
+diff --git a/hw/net/tulip.c b/hw/net/tulip.c
+index c76e486..d5b6cc5 100644
+--- a/hw/net/tulip.c
++++ b/hw/net/tulip.c
+@@ -73,15 +73,15 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
+     const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
+
+     if (s->csr[0] & CSR0_DBO) {
+-        desc->status =3D ldl_be_pci_dma(&s->dev, p, attrs);
+-        desc->control =3D ldl_be_pci_dma(&s->dev, p + 4, attrs);
+-        desc->buf_addr1 =3D ldl_be_pci_dma(&s->dev, p + 8, attrs);
+-        desc->buf_addr2 =3D ldl_be_pci_dma(&s->dev, p + 12, attrs);
++        ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
++        ldl_be_pci_dma(&s->dev, p + 4, &desc->control, attrs);
++        ldl_be_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
++        ldl_be_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
+     } else {
+-        desc->status =3D ldl_le_pci_dma(&s->dev, p, attrs);
+-        desc->control =3D ldl_le_pci_dma(&s->dev, p + 4, attrs);
+-        desc->buf_addr1 =3D ldl_le_pci_dma(&s->dev, p + 8, attrs);
+-        desc->buf_addr2 =3D ldl_le_pci_dma(&s->dev, p + 12, attrs);
++        ldl_le_pci_dma(&s->dev, p, &desc->status, attrs);
++        ldl_le_pci_dma(&s->dev, p + 4, &desc->control, attrs);
++        ldl_le_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
++        ldl_le_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
+     }
+ }
+
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index 98b1370..dc9bbdb 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -202,9 +202,12 @@ static uint64_t megasas_frame_get_context(MegasasStat=
e *s,
+                                           unsigned long frame)
+ {
+     PCIDevice *pci =3D &s->parent_obj;
+-    return ldq_le_pci_dma(pci,
+-                          frame + offsetof(struct mfi_frame_header, conte=
xt),
+-                          MEMTXATTRS_UNSPECIFIED);
++    uint64_t val;
++
++    ldq_le_pci_dma(pci, frame + offsetof(struct mfi_frame_header, context=
),
++                   &val, MEMTXATTRS_UNSPECIFIED);
++
++    return val;
+ }
+
+ static bool megasas_frame_is_ieee_sgl(MegasasCmd *cmd)
+@@ -536,8 +539,8 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState =
*s,
+     s->busy++;
+
+     if (s->consumer_pa) {
+-        s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa,
+-                                             MEMTXATTRS_UNSPECIFIED);
++        ldl_le_pci_dma(pcid, s->consumer_pa, &s->reply_queue_tail,
++                       MEMTXATTRS_UNSPECIFIED);
+     }
+     trace_megasas_qf_enqueue(cmd->index, cmd->count, cmd->context,
+                              s->reply_queue_head, s->reply_queue_tail, s-=
>busy);
+@@ -568,14 +571,14 @@ static void megasas_complete_frame(MegasasState *s, =
uint64_t context)
+             stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
+                            context, attrs);
+         }
+-        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_pa, a=
ttrs);
++        ldl_le_pci_dma(pci_dev, s->consumer_pa, &s->reply_queue_tail, att=
rs);
+         trace_megasas_qf_complete(context, s->reply_queue_head,
+                                   s->reply_queue_tail, s->busy);
+     }
+
+     if (megasas_intr_enabled(s)) {
+         /* Update reply queue pointer */
+-        s->reply_queue_tail =3D ldl_le_pci_dma(pci_dev, s->consumer_pa, a=
ttrs);
++        ldl_le_pci_dma(pci_dev, s->consumer_pa, &s->reply_queue_tail, att=
rs);
+         tail =3D s->reply_queue_head;
+         s->reply_queue_head =3D megasas_next_index(s, tail, s->fw_cmds);
+         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
+@@ -679,9 +682,9 @@ static int megasas_init_firmware(MegasasState *s, Mega=
sasCmd *cmd)
+     pa_lo =3D le32_to_cpu(initq->pi_addr_lo);
+     pa_hi =3D le32_to_cpu(initq->pi_addr_hi);
+     s->producer_pa =3D ((uint64_t) pa_hi << 32) | pa_lo;
+-    s->reply_queue_head =3D ldl_le_pci_dma(pcid, s->producer_pa, attrs);
++    ldl_le_pci_dma(pcid, s->producer_pa, &s->reply_queue_head, attrs);
+     s->reply_queue_head %=3D MEGASAS_MAX_FRAMES;
+-    s->reply_queue_tail =3D ldl_le_pci_dma(pcid, s->consumer_pa, attrs);
++    ldl_le_pci_dma(pcid, s->consumer_pa, &s->reply_queue_tail, attrs);
+     s->reply_queue_tail %=3D MEGASAS_MAX_FRAMES;
+     flags =3D le32_to_cpu(initq->flags);
+     if (flags & MFI_QUEUE_FLAG_CONTEXT64) {
+diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
+index ac9f4df..5181b0c 100644
+--- a/hw/scsi/mptsas.c
++++ b/hw/scsi/mptsas.c
+@@ -177,10 +177,16 @@ static dma_addr_t mptsas_ld_sg_base(MPTSASState *s, =
uint32_t flags_and_length,
+     dma_addr_t addr;
+
+     if (flags_and_length & MPI_SGE_FLAGS_64_BIT_ADDRESSING) {
+-        addr =3D ldq_le_pci_dma(pci, *sgaddr + 4, attrs);
++        uint64_t addr64;
++
++        ldq_le_pci_dma(pci, *sgaddr + 4, &addr64, attrs);
++        addr =3D addr64;
+         *sgaddr +=3D 12;
+     } else {
+-        addr =3D ldl_le_pci_dma(pci, *sgaddr + 4, attrs);
++        uint32_t addr32;
++
++        ldl_le_pci_dma(pci, *sgaddr + 4, &addr32, attrs);
++        addr =3D addr32;
+         *sgaddr +=3D 8;
+     }
+     return addr;
+@@ -204,7 +210,7 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequ=
est *req, hwaddr addr)
+         dma_addr_t addr, len;
+         uint32_t flags_and_length;
+
+-        flags_and_length =3D ldl_le_pci_dma(pci, sgaddr, MEMTXATTRS_UNSPE=
CIFIED);
++        ldl_le_pci_dma(pci, sgaddr, &flags_and_length, MEMTXATTRS_UNSPECI=
FIED);
+         len =3D flags_and_length & MPI_SGE_LENGTH_MASK;
+         if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
+             !=3D MPI_SGE_FLAGS_SIMPLE_ELEMENT ||
+@@ -235,8 +241,8 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequ=
est *req, hwaddr addr)
+                 break;
+             }
+
+-            flags_and_length =3D ldl_le_pci_dma(pci, next_chain_addr,
+-                                              MEMTXATTRS_UNSPECIFIED);
++            ldl_le_pci_dma(pci, next_chain_addr, &flags_and_length,
++                           MEMTXATTRS_UNSPECIFIED);
+             if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
+                 !=3D MPI_SGE_FLAGS_CHAIN_ELEMENT) {
+                 return MPI_IOCSTATUS_INVALID_SGL;
+diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
+index 33e16f9..4d9969f 100644
+--- a/hw/scsi/vmw_pvscsi.c
++++ b/hw/scsi/vmw_pvscsi.c
+@@ -50,10 +50,10 @@
+ #define PVSCSI_MAX_CMD_DATA_WORDS \
+     (sizeof(PVSCSICmdDescSetupRings)/sizeof(uint32_t))
+
+-#define RS_GET_FIELD(m, field) \
+-    (ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
++#define RS_GET_FIELD(pval, m, field) \
++    ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
+                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), \
+-                 MEMTXATTRS_UNSPECIFIED))
++                 pval, MEMTXATTRS_UNSPECIFIED)
+ #define RS_SET_FIELD(m, field, val) \
+     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
+                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), v=
al, \
+@@ -249,10 +249,11 @@ pvscsi_ring_cleanup(PVSCSIRingInfo *mgr)
+ static hwaddr
+ pvscsi_ring_pop_req_descr(PVSCSIRingInfo *mgr)
+ {
+-    uint32_t ready_ptr =3D RS_GET_FIELD(mgr, reqProdIdx);
++    uint32_t ready_ptr;
+     uint32_t ring_size =3D PVSCSI_MAX_NUM_PAGES_REQ_RING
+                             * PVSCSI_MAX_NUM_REQ_ENTRIES_PER_PAGE;
+
++    RS_GET_FIELD(&ready_ptr, mgr, reqProdIdx);
+     if (ready_ptr !=3D mgr->consumed_ptr
+         && ready_ptr - mgr->consumed_ptr < ring_size) {
+         uint32_t next_ready_ptr =3D
+@@ -323,8 +324,11 @@ pvscsi_ring_flush_cmp(PVSCSIRingInfo *mgr)
+ static bool
+ pvscsi_ring_msg_has_room(PVSCSIRingInfo *mgr)
+ {
+-    uint32_t prodIdx =3D RS_GET_FIELD(mgr, msgProdIdx);
+-    uint32_t consIdx =3D RS_GET_FIELD(mgr, msgConsIdx);
++    uint32_t prodIdx;
++    uint32_t consIdx;
++
++    RS_GET_FIELD(&prodIdx, mgr, msgProdIdx);
++    RS_GET_FIELD(&consIdx, mgr, msgConsIdx);
+
+     return (prodIdx - consIdx) < (mgr->msg_len_mask + 1);
+ }
+diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
+index c90cecc..5b36334 100644
+--- a/include/hw/pci/pci.h
++++ b/include/hw/pci/pci.h
+@@ -850,15 +850,14 @@ static inline MemTxResult pci_dma_write(PCIDevice *d=
ev, dma_addr_t addr,
+                       DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
+ }
+
+-#define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
+-    static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
+-                                                   dma_addr_t addr, \
+-                                                   MemTxAttrs attrs) \
+-    {                                                                   \
+-        uint##_bits##_t val; \
+-        ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
+-        return val; \
+-    }                                                                   \
++#define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
++    static inline MemTxResult ld##_l##_pci_dma(PCIDevice *dev, \
++                                               dma_addr_t addr, \
++                                               uint##_bits##_t *val, \
++                                               MemTxAttrs attrs) \
++    { \
++        return ld##_l##_dma(pci_get_address_space(dev), addr, val, attrs)=
; \
++    } \
+     static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
+                                                dma_addr_t addr, \
+                                                uint##_bits##_t val, \
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3611_1.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3611_1.patch
new file mode 100644
index 0000000000..dc7990d1b7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3611_1.patch
@@ -0,0 +1,74 @@
+From be5a8cf347d0c47ee3e933dde075526fd8bd5c40 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Sat, 18 Dec 2021 17:09:10 +0100
+Subject: [PATCH] hw/audio/intel-hda: Do not ignore DMA overrun errors
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Per the "High Definition Audio Specification" manual (rev. 1.0a),
+section "3.3.30 Offset 5Dh: RIRBSTS - RIRB Status":
+
+  Response Overrun Interrupt Status (RIRBOIS):
+
+  Hardware sets this bit to a 1 when an overrun occurs in the RIRB.
+  An interrupt may be generated if the Response Overrun Interrupt
+  Control bit is set.
+
+  This bit will be set if the RIRB DMA engine is not able to write
+  the incoming responses to memory before additional incoming
+  responses overrun the internal FIFO.
+
+  When hardware detects an overrun, it will drop the responses which
+  overrun the buffer and set the RIRBOIS status bit to indicate the
+  error condition. Optionally, if the RIRBOIC is set, the hardware
+  will also generate an error to alert software to the problem.
+
+QEMU emulates the DMA engine with the stl_le_pci_dma() calls. This
+function returns a MemTxResult indicating whether the DMA access
+was successful.
+Handle any MemTxResult error as "DMA engine is not able to write the
+incoming responses to memory" and raise the Overrun Interrupt flag
+when this case occurs.
+
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=
=3Dbe5a8cf347d0c47ee3e933dde075526fd8bd5c40]
+
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Message-Id: <20211218160912.1591633-2-philmd@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/audio/intel-hda.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
+index 5f8a878..47a36ac 100644
+--- a/hw/audio/intel-hda.c
++++ b/hw/audio/intel-hda.c
+@@ -350,6 +350,7 @@ static void intel_hda_response(HDACodecDevice *dev, bo=
ol solicited, uint32_t res
+     IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
+     hwaddr addr;
+     uint32_t wp, ex;
++    MemTxResult res =3D MEMTX_OK;
+
+     if (d->ics & ICH6_IRS_BUSY) {
+         dprint(d, 2, "%s: [irr] response 0x%x, cad 0x%x\n",
+@@ -368,8 +369,12 @@ static void intel_hda_response(HDACodecDevice *dev, b=
ool solicited, uint32_t res
+     ex =3D (solicited ? 0 : (1 << 4)) | dev->cad;
+     wp =3D (d->rirb_wp + 1) & 0xff;
+     addr =3D intel_hda_addr(d->rirb_lbase, d->rirb_ubase);
+-    stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
+-    stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
++    res |=3D stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
++    res |=3D stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
++    if (res !=3D MEMTX_OK && (d->rirb_ctl & ICH6_RBCTL_OVERRUN_EN)) {
++        d->rirb_sts |=3D ICH6_RBSTS_OVERRUN;
++        intel_hda_update_irq(d);
++    }
+     d->rirb_wp =3D wp;
+
+     dprint(d, 2, "%s: [wp 0x%x] response 0x%x, extra 0x%x\n",
+--
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3611_2.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3611_2.patch
new file mode 100644
index 0000000000..b79fadf3f6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3611_2.patch
@@ -0,0 +1,43 @@
+From 79fa99831debc9782087e834382c577215f2f511 Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat.co=
m>
+Date: Sat, 18 Dec 2021 17:09:11 +0100
+Subject: [PATCH] hw/audio/intel-hda: Restrict DMA engine to memories (not =
MMIO
+ devices)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+Issue #542 reports a reentrancy problem when the DMA engine accesses
+the HDA controller I/O registers. Fix by restricting the DMA engine
+to memories regions (forbidding MMIO devices such the HDA controller).
+
+Reported-by: OSS-Fuzz (Issue 28435)
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daud=C3f=C2=A9 <philmd@redhat.com>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/542
+CVE: CVE-2021-3611
+Upstream-Status: Backport [https://git.qemu.org/?p=3Dqemu.git;a=3Dpatch;h=
=3D79fa99831debc9782087e834382c577215f2f511]
+
+Message-Id: <20211218160912.1591633-3-philmd@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ hw/audio/intel-hda.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
+index 47a36ac..78a47bc 100644
+--- a/hw/audio/intel-hda.c
++++ b/hw/audio/intel-hda.c
+@@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
+
+ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint3=
2_t response)
+ {
+-    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
++    const MemTxAttrs attrs =3D { .memory =3D true };
+     HDACodecBus *bus =3D HDA_BUS(dev->qdev.parent_bus);
+     IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
+     hwaddr addr;
+--
+1.8.3.1
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

