Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907C3D58E6E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:57:52 +0000 (UTC)
Received: from mx-relay09-hz12-if1.hornetsecurity.com (mx-relay09-hz12-if1.hornetsecurity.com [94.100.139.209])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155005.1772434669754452465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=Ou/2W8Uh;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.209, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate09-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.65.115, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Su8HcJvbl8al5BHRhSp8h8Q3jngExMNtfhbBaT8OQNo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1772434667;
 b=Y/zBhfMxSmXEglR0x46m+z7dnMOc9URridiBd7OsHJGmhxeQ093J/KK+prv6aeYX07TGEZUA
 LyrcwQXyguMWuVZsawlIIvV5taBZqYCD3vKzZlhNTcnTErfiHLfcd5WPfGnfD3rL9LiQ1H46Loj
 EUesP3ieybitgOyd1RvZXO2sryjPztWv2QO7pj68Hlv1f2f+NASdl3R8Eyq3rrBnWm4x1Kg9ha+
 yiiszvjIA0dq7AWtLob7JUJkxo/g+h/rapsJ6oPO08m4+MscJoC6M30zCheUdULCN/rUKscAJBV
 BE/2BTmr9nJps6Bw5zNLYVZbDr6U8OHnzgLaEYMuQrIhw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1772434667;
 b=gVtZqueSgSgdOvebxk9TDGVjqRASwXdyg+Q9c83EMHGKVBv3s3BOWiGs0kSP3j2kWIvKP1Ra
 wTJdGdOmvmfSRP8cAsD0iTtH+NxUw+OS6bgi6hRvQg5Z+X7iCpBSfywJB9bKFf6AaziDsjn//Y3
 maZWPVF6GbXrJCbEBahFCvA6DYWEsIpdQ0nb+8oTO+e/g+3rfc+O/gPc0RWdpa330D0LwvDofDe
 qwpq55RxUPgIOu6o+NEmNLjUI1g6TyLKwu2FrFdlYFogCGdL6ooOry66AOS+Uv2X35fVje+u9vL
 XNsPTDK28MtSvAg+gfQAzHYON5obLWNGlY/gChvWhtWsQ==
Received: from mail-northeuropeazon11021115.outbound.protection.outlook.com ([52.101.65.115]) by mx-relay09-hz12.hornetsecurity.com;
 Mon, 02 Mar 2026 07:57:47 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyTwqFtBCX2mRFCfuEYL0HMD00B0qRWAyLTyYUPfo1j35fx8ke6Cv1KXHwyH2HtdkyXYBUfi+CCs3lsFUE5K01mtsmz4cB3/tiecb7TMDY68uDArl5I9r5eOZBp8jrerpRo2iLV/N+pPD8W5Swjy4a0uR03eBfUQDuMadRWg0ZDVgXrAGhOMsQRcR89AFe+uMrLyTG3arkeDbmshV/s6NIAGW5ITbT+EBkm3FOlDWMfDFSjrOuPIh9KRBKSTHdGkrkkzxX80l100n0vN6ZBLFha+ggxah0pDo1494Xx0K79aozYBCwpyKTvoBVg1MZTgYsFJNT7UOISAPV4EDjjqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su8HcJvbl8al5BHRhSp8h8Q3jngExMNtfhbBaT8OQNo=;
 b=Nst/1V6vVWmFUr3YjRrQjbR0oO+etSvHGHw9kCJUfF579fTwm/2pJiMPWZhZapteg1+WbZoxzoCUfD8v+P52bZRh1y+SEBZrw02Gb03w9mu04vjcbHI6jE8wg6265S5b2mpQ/n63a0S/bxrdtTTUKdbeJYmY7F/rF6N/bP3s0YC48AFeZzdtTCdAZAQRFn060kuAq4SUcLrULxom3wIMWdJfurue5qB7Ki9s8xP7P4TIjz/96Zsb7He3SpRXA4Q0JUtBchV4G3xGNeDTT0Hbu2uth7u1q9aqBIEyokQNl9+9wUOs0rpO/exfbw92g4iwiy3kC+DsoglAa0aSda8fJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Su8HcJvbl8al5BHRhSp8h8Q3jngExMNtfhbBaT8OQNo=;
 b=Ou/2W8UhtH6Y13+m09/ajd9y6Zlu1GJ5ggi0X1lmbmhvnsD2nMtglizvwvA4/3zjR8o5PX3AQRcfjKmnYixiJKaTpgmwtKFV7MvhNfxF58RzIXNmXqrj0CZ542h2qEYeU/ta5+JmioRL+bQ1BCib4TVWWPRq+YJd9rZcKl0JE8+qlOUD1vUYYxIK1Hu+gfgkzxkoQwIFv/DVx2/bONEO2kwN5bzhbo2c6Uf0JF2yAAZ1N6bIWE+lpvmeFWfCD7VcKx/RAY3m8tdJWKwF4KkuTzV9VJ/sT56iBDSW7qmF87vOcqOv3QNlK7xUJiUNf13gfEJ6y/NRwtSGyDtxdEUTPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 VI0P192MB3151.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2d9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.20; Mon, 2 Mar 2026 06:57:41 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 06:57:41 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][whinlatter][PATCH v2] zlib: Fix CVE-2026-27171
Date: Mon,  2 Mar 2026 07:57:25 +0100
Message-ID: <20260302065725.28346-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0674.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::6) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|VI0P192MB3151:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1c77b3-55f6-4827-903a-08de7828ff79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	jtnzJ/6kM7cZ2sR+aHDvUlBz4fI40bZE3oKXkA9LjPAaSKLq0PxuA9hqlUELkUicDg85vyf3Dd55+Qm5F7x5H3MzgfdR9LSII+lqmHtCPSJk/PLyi3s7SAoi2sgATMr0RkO3tOjzH0btOnVQHYw1qvI6zmIbtW13OwR/wrQ+FD5qQehw5v3UwdYhzOPgJdIHmLq/pU2AL1zvHIarYfVaOvklEo8OaCr1Hq3aV5Fuiip+1Wd8YAlhQkmcKLLYAwBqPcUr8ArOkI2JKcRWOvKw4OitxcwvrPaoUc1HI/ozm2y2H3WvTLL7sGgVTLRjCxLWmaZEd8KwkckNgjxD3fC+AGHekHHcrjjmgMw0ZxDKhC7W/MZjHnNLB6qACQnxKVlTf+oYgK6RA3M46cfSmLnCsbNwscPc7pgVIZ8CoHjx99QsjBN4dRMB/Gkj2XXSrWbAMDLx9kBkge6j0w3mcM9KswLkHWS8BV805Rb/7zreWZE1p0duSFys4NABEgSS+7RsvaeOOwSw8nX8Fw0/60ycs42jQgqlosRdX9vjdieMOPYmI1Fuu3WC1vPw+7qFuyGDFmGCNxzcbeKCVF11pA08WbruGNRTQ6KzuwoM/2G8QR7/F5KcWsAi84t/FkoFJfAsVq2UYpn3WxLzyGGcA5uMAElPjUShkE+iIKA+FnTHI07/cN3+5M5/GvbIDkJbYlOP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JL9U1NceXu7NjUWWnPKCZTEfQfwWM2juFIsCWATJ/d2NqvcYdiZh3naJAt5J?=
 =?us-ascii?Q?1SbV/BtPdBf4iPIUJB5NjshGEN1CdHJrf8HSaVP2Rh/qozPhkHXz8X/0CpLJ?=
 =?us-ascii?Q?HcbAWgml6/GW+2s0S6TjDiFyKWvLGsaujiIVdVduqEKsuykCvwoR/f5h9eQ9?=
 =?us-ascii?Q?oa/PM5DZxwkMKBuPyBa7jf7/DEX/C02YXBICIQ1mXVyViyojpqcZuiA9YMCV?=
 =?us-ascii?Q?Ai+i/VHSMaWEqNQxPkvko9rx6GLafdeq9sVF7V5x28h76NEJ3JX4JWF+uusS?=
 =?us-ascii?Q?MJA8jOf+O6OSxSuQz2Vh7bW8BQojQsTouy+LZOdSEa2g68olP9GGENMJRNNZ?=
 =?us-ascii?Q?odwvfqbgD1uG7oYfzHqf3Vl5GQf3JCKVB5Lu5cUWANnbjKJV6iOiBtj0FrjG?=
 =?us-ascii?Q?OKSOIS+SewJ6OS6LbQ8nLoy6ciHGPxtWWJiuArdyKliM1Ry9Zsl5PQXVHrEL?=
 =?us-ascii?Q?7HjWiDk9GwlmSWNx2UDHZOcMXWJKa6Nd9hqR2ro19RKje4O9phUHXbIqWH7y?=
 =?us-ascii?Q?tkmWinOagKamu/jHPETwlT4zVmWPoJe8+f1vvM5/FRTzrVZhlCDT2Hrm6gdN?=
 =?us-ascii?Q?42OAAYK65s59H5ce4d8UWqthFVn86I73bGtJIzBKtiU11sfb9jqrB838ck0T?=
 =?us-ascii?Q?Cw93nzgCi1ToSeQEdsUAJam35fxxvV5zqW5n7ReHzZY0s7iqXviGGud7skbx?=
 =?us-ascii?Q?MZ3TUdmp4tGNMxkZKq1hycoqe5EY1axavQfUbDdS7M7lc+8oqiZdx2I7feSu?=
 =?us-ascii?Q?MjXkecWb3ivW8w3pB2eubjc1mh+w6aZ7e3ovQiOFcErakNc6DJlFbJqt0aNv?=
 =?us-ascii?Q?f69+ng/GegQJDY6geyFZogXoreFus0LikbU/2R80jImQtDDKmOuXG97qIaeW?=
 =?us-ascii?Q?wuZqggJ29aQwzKmeRwV2nhLmYeyBHbwfxywsJx5LrMiC/GMIMQ4lhRure79W?=
 =?us-ascii?Q?41HOpukPjb+jVQfZwQ3aAmwtWse8ow99h5yRLQ7nUXW7gorn4O5Tf709MPSe?=
 =?us-ascii?Q?WJNQoKikxTIexRw/Wh4Skxf/OqD4KU5UpFCXG/kLQnlacwHMztCO19NTGATr?=
 =?us-ascii?Q?nj1QykbYXnjBIfQe9bLrZXVQqcLDegknor88LLJ74+J0y5IQn63anZD7jFMG?=
 =?us-ascii?Q?4rgbQV6aGIi6DRjRcI4O4on/rq2Qc8vmKZep42VAGjYyAoaLvKXmtOnAk56R?=
 =?us-ascii?Q?qw1YDgaxtZs1Ca6rctOFJhcZZGbzh3R1W5WQoX6xrzvVycWUNnSf9KIEXvoR?=
 =?us-ascii?Q?m4O8QuGvyFTimRm6YeNjz4fH0e5yT3H/VEFwkxAgMhdtBMYaXRcmAb8Epsoo?=
 =?us-ascii?Q?LgJERoy6IVnEU9jJcIp2pA6XCyPuK427rtJAnH8K7v9Tf/Mvj/GAYo8+1RQe?=
 =?us-ascii?Q?SbjTlPIv6ZgooFA1IUw/dhFMM8lLbpJ8579gIc1YhpTMBTZtSEVSbsaaVfQX?=
 =?us-ascii?Q?N83QUFksqMFmq0JfKPuZcKFjR5MX/+y4sl3/nktSLHQU2qA2Ut333wS9YlzD?=
 =?us-ascii?Q?gVUL2TECstTmkPbGEbRt8TaqYxj7tB6wIvnzQjTDGA4jtAbENNPEnMF294rn?=
 =?us-ascii?Q?+pTOd0+9xGnsPcwI0ylrK9pMCklENG9umQhfWV9v5lZ9d5OdYSaiUAYVB46T?=
 =?us-ascii?Q?ht09Gt4bRodgA2KLCWWvp6iB4RrhY/jT5OGghLdh2rRidIgUPmBGnD2jjP/g?=
 =?us-ascii?Q?1+drlH1yt6ZRWxp1WhIjRhP4NqfRxmNpIHZ63kVoBl5Oc14iu0F76puB+GFy?=
 =?us-ascii?Q?PRtjVqA9ETh4eQDh5T3SXQSvx2D5TPCAUcXpv5TbYVPZifxerAKA5CHQYCEy?=
X-MS-Exchange-AntiSpam-MessageData-1: HEc9M5whfHGdvXVV4SMoCr6P6xWRnKf0eaI=
X-Exchange-RoutingPolicyChecked: 
	jleGrDXNL2Cq7rdcot0HQISbAPBjhPg837UHAIXOyv8u/xXFWE6lW8caJnGTwJpGLaNAGEUCmWA1CmC5ClNaCzlkdeE9stj9bAT1fTFt/Lj1ofwXqXjmzovGWYnau15DmxQ9KygAEF6HaB8rZesJbCk8YxMDmNNw7txbF3wJKjyk2TY+d51lcZ3oJjnKHAAF40kkUQMqh0BnW+rMwap4r7nUGobzMrMkcjW5IZm3q/fKQT3NpU/ZozGqSU0h1jMSXKYlEtKaGPraFqSwS5OwOxpNrpBbL324SHMy/w7nG0pXQ+nFcZe7wZPV/txcg3IWYsmX3WAgL0t01ufOMnO0vQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BFao4HvcqnWxetQfFcDTxO5AiGlig5XCgzdBxtiiyB0JwjV/KS89Bo6tVeKm+e1e8+uXGWTGorgRWaP6wApeNSi+0xWvKhmnqLKNI56FJlVtTUJLIqiBYwYCMX5fyis01rRxCqkB2mu4ghSiqvlS+gdORyuJuEUbNzmFvZtQi7o2HwTHYV8YjO5WMiX5LMmQurU2idiQvzI0/q5X4U8ynmNZX6u4GdPLh6PJVku0ceXappI2PKho51uQBtHlyzdANT5biNMWUA02OA/56TOZeA/iTC65Tc0pkf+LSTmAy2yKeJVwi7Uz0Ar3UuNupPjQanb4INdn2nKvSawBVRjiPeF3vlz8NVIikZ4bfVFjmOxDlUfhsonzBP9gJKK7IZPitdVkPFSuHqTHfjq1Xv7XOaN9wSPLIKsqgKsZqAiiTSK0KLPZAZ15zWHoAqthHwR/simTk/dTGuOqXFjb38YnBLPHWr9cVS9gckfHXHNXaRwKWgc4qYQ2N8HE1rkMfhBQLwmfxl8SdhSsxEQhXifEqLE3L+A6TEx1Dnt3Ga1aQdTH2Z5wabY8Ueld4LbkMmRGzf7gslHA6E0CImp0mft9a+IhTCNMdbdoZfFSuzmoEw2aCRvE2mlhnbONDbEvtdGq
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1c77b3-55f6-4827-903a-08de7828ff79
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:57:41.4221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgvEbiMO5JaGogVBdbybf7uKWXP1JRY1FQ1Y/2lU/c+E3AOfJIxQ6+bDQY+1Z+Xj4Xd30RoE2fg+lToX/g+Z9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P192MB3151
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay09-hz12.hornetsecurity.com with 4fPV9z6xWrz385qC
X-cloud-security-connect: mail-northeuropeazon11021115.outbound.protection.outlook.com[52.101.65.115], TLS=1, IP=52.101.65.115
X-cloud-security-Digest: 18d13e57230bb7f82133fd83ffd8ae45
X-cloud-security: scantime:1.183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232181

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/madler/zlib/issues/904
[2] https://security-tracker.debian.org/tracker/CVE-2026-27171

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../zlib/zlib/CVE-2026-27171.patch            | 63 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
new file mode 100644
index 0000000000..e6a8a3eac5
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
@@ -0,0 +1,63 @@
+From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Sun, 21 Dec 2025 18:17:56 -0800
+Subject: [PATCH] Check for negative lengths in crc32_combine functions.
+
+Though zlib.h says that len2 must be non-negative, this avoids the
+possibility of an accidental infinite loop.
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77]
+CVE: CVE-2026-27171
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ crc32.c | 4 ++++
+ zlib.h  | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crc32.c b/crc32.c
+index 6c38f5c..33d8c79 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, const unsigned char FAR *buf,
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2) {
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+diff --git a/zlib.h b/zlib.h
+index 8d4b932..8c7f8ac 100644
+--- a/zlib.h
++++ b/zlib.h
+@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2);
+    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
+    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC-32
+    check value of seq1 and seq2 concatenated, requiring only crc1, crc2, and
+-   len2. len2 must be non-negative.
++   len2. len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ /*
+ ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
+ 
+      Return the operator corresponding to length len2, to be used with
+-   crc32_combine_op(). len2 must be non-negative.
++   crc32_combine_op(). len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index ef83142121..892467a1fb 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
+           file://CVE-2026-27171.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.43.0


