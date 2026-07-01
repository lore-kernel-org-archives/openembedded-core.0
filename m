Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5484C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:48:48 +0000 (UTC)
Received: from mx-relay48-hz1-if1.hornetsecurity.com (mx-relay48-hz1-if1.hornetsecurity.com [94.100.128.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42191.1782902918570903814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=e4cdNiwM;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.58, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate48-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.159.129, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=HXbvQH12eDbnLFxXzk+8PJ7zY3XnK97abBSyocKID1E=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902916;
 b=kHbipxVFJBVfY/2rkL+E2MnK6o5lt6shEtJKLlXzrXRTxuLd4L++a7hCpX/jTIDxqzoOqx/R
 2Yj/fh4kQ3+F4WEz+uWvFkpXUELUqkQ6yTkEEqTUf4lH2w7XOYQi9j0/ohDeFy27+/d1ZgEw7Qg
 DrH5mRbszLDF7rqBGma7SgkCDh6CBVPQV8SRK3C+KWtOmpKJJorpHo8P/jffBNMrFnNNTEkWTPN
 iI1qcCv9LYb2VbPcjPubMJO3BgJ/rmmYmd3MCq1A20LaXhKo65aKKHd/gcxvI6qeGJhFoe40M34
 yIrCYNnFZ4X2zYscRcQqR/RLT1ZFL72sWLOxeEWIkvLvQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902916;
 b=aPH2STP+FSopfSVEkYqRU5Gav1cMXX9bBQUA+uHY15I5Ja0kCJC/LH2IjSw77P0mrluls1o7
 lHwGjWHjuSypX0OKUpGdBQFs81G7Kwq2k8NymHzZ2Qa5WFCDXozioXwGFdhsPKQFxRBM5L91mt2
 qYuPI3sv/twtZcA4PtS/XNIY3cFcAez+Ur2L7Z5CGoEu+nek80Q7/KE3TbW1lE/ej/F/PfRX+J2
 7oDSogNt9AjZc7YX9206o+nKEaKuDtYvvX//H3X6KD3oC1s0RUAcNqbo8GqEF/w/vSThHiGgWg/
 y6PCRsxDDo2OrMHeO/1Kv6uBjxjIQ0MFkyNWPDu4KpfhQ==
Received: from mail-norwayeastazon11023129.outbound.protection.outlook.com ([40.107.159.129]) by mx-gate48-hz1;
 Wed, 01 Jul 2026 12:48:36 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfX47o/F0+t6l/ULhNz0Z+w8ARLTxxVvWuAXw6Zuo7Vie2XhuI5f48Qfh/JLiBEsEMgXAvg/WjNT1mCP4qCFnAgGzJTnecSlWquU/fSyMsXiGtmPI271Lp+59TVClQiyOwPtBvdaWqpY+xZa3kWlz3pFtLvJJ8YQpN7kbEjZuhWX+m3m4HQewaMIP6ANSOgu9LKM+DMv5igtWsd6hRMDBxAS7xnMZUtnoRCqO3TkZCrhoo7bHhx28fShTXi/4mkIJscAWD06o0oshYq070rk0lAjkNspOSRS02Dolz1s79kaannN3RVEUMfbbPJxLCPcTSQnQk7YbhLFZN6wrQHydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXbvQH12eDbnLFxXzk+8PJ7zY3XnK97abBSyocKID1E=;
 b=DJSU1mKBkVmHKVJso8CRE8cLepIgU7lLMY84MZCXwxmYWeH9jZomGXZmuGl04vhlBOP1roQt7CVTjAm35iOJAfdwNdodBPR5Z5HffF89xs1pklfnEVvqC18jrpirQyxPP1iSWZjAfjRiRM5S/98DFZpAWJMltybGjTMxasJ0OXDSHebgSfY0shV4mU1BEJ/8fE8xwD5+Dycd4e/I6/EACqVCYIpkFZtq6LiK9SubFBHyhzYr477A3r0uUajMX6lL6HScF70KJTSjAusgtX4Ab1c3gFE1BMnuEBcKbzEcd3Qel1K9U4p/9zwnRi+9gK7zvMqHh08HJxfprYC7A0xYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXbvQH12eDbnLFxXzk+8PJ7zY3XnK97abBSyocKID1E=;
 b=e4cdNiwMIyNl/3DUrh6SCI+jwUbEJUJA3+FAVdtUzpDFt0x0eadqYPhj34Yyi6Duf/SOrYUEKtvlyp+6a74YL32f36Zy2zMoDbsM5kLWhordz6eGaCNlCPOS8e7m6VGjicHM6brV3kepkA7orb3iqrnV/h/B5C0+qpb5lhhtzKLrdQK3pCATzZDYJ5WW6/aUxll4ZBmy8sQxMdgLj/3m5OdEIkBnwqwoJrKO9VJuPcTE8FLZEFli2g1Cec9VjwYv2y/owI5OlpM2/3nnHk+oYjeX73TN1UahsWYz3D876taSz9UMx1IWkuWH+7Sa1Tn4Eh/nasUK0e09bL9j4hKP4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by DU2PPF9A909934E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:48:21 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:21 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [wrynose][PATCH 4/4] dhcpcd: patch CVE-2026-56117
Date: Wed,  1 Jul 2026 12:48:08 +0200
Message-ID: <20260701104808.3577244-4-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104808.3577244-1-tgaige.opensource@witekio.com>
References: <20260701104808.3577244-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::8) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|DU2PPF9A909934E:EE_
X-MS-Office365-Filtering-Correlation-Id: 432eee06-10d9-4419-5dc8-08ded75e44a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|52116014|376014|366016|1800799024|13003099007|18002099003|22082099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	FinOgS33HvoZgLSHGuldYjEu8Qa4SsNbVjjY266u7pMQQm0EWozqVw2CtRVA+CTAAPU3Tqe++U4/IzD4APkXEZzM8pGt1X2k11dihTOJ+/o0k0DXbxH8h7vlRk2burrMV9xa6q6mwZWdAn2E9+rHdo4iMtA9ZrcMbna5HhLM7ZlHWdG+mwNKPeqCWMS7uX3Y/hIa1u1/FAZnDaNxuy62pfPe6mrvhkR7c4rNMzHOr0sYOmqzDbi8k2CsUTZzJkQ9p271saRDFliEbeOWJtIE9i5F89y5M5EZO6TTgTa6qk4NdCVkrevzxoKAgRyUpy+93vbisB2nESSZYCOZHJs470/sqX7QDUWC8Dvl1QkjOs0bNzWIqin1xluG+Qo7CdxVJDt/N5kq84j8scr4hoa9QT60EVUVCRwr0/EYSgXkdt/TFDYsSwVi/48IT1SGJOG616AwaacvqaV8p+HqwQnQ3ymH7FEPUREApyEImeQeBBhKUH6+Eua87iL0jRuMwkq94vkYVCYreb/xlOqT7Gw3ru7JkUalA04U1Asxat9teCeKfCUMW6At3j/q89FHYY2xmQ9dy+iWfdShfC3dKLGprEARVXEFmNI/1WW6Bw6lgQV/KMAWhgyNaJ4yB/lsNLzfaksWX8ejEzHOICsYGay5KjpZXHdF1a1I8+ubAztFBps=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(52116014)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eUD0kwKA4Qhb1CU9NyktZgLc+IEdA/g8GXQw6l8TenXHGh5QylC5W1lnVUKO?=
 =?us-ascii?Q?A1ADWEkIFfjN8GJScCkwya99wwrJ1/OTpAP0xAJM9szWosUtYTia1vDAW1O4?=
 =?us-ascii?Q?JrGn/9LRIKHpw2PxnH0/K8MCqmGYqxxnohE6ZCDADHi4Y/pIB7fh9PqbLHMy?=
 =?us-ascii?Q?1Jl7H0KY3M9tbNTPU34jG2867UKAp81LvTxuIxevb2q9V3ElWJqd7QJKtL8p?=
 =?us-ascii?Q?WBQpLFb9uAkAiNdpxUk0TArS4ul4gBhutUMKhGgoNjDO47Rq5QHmDHQBo97j?=
 =?us-ascii?Q?H1/pJXZwx0OwH59uCA9g7QdJj82Y4n1Tbfe0OoIN7+Mt39yFGXhSPAxpJ4H2?=
 =?us-ascii?Q?VABiUUTLIt2YtsXEOjQDUloD66QFBXzQEx80006UpeQlB6DQUCsu7gbetYDm?=
 =?us-ascii?Q?fjNplZCmWRvJCJNXYFvaBg1UP9rk354KKo2OCskQE6kn3XPeNxNSf3xBArMv?=
 =?us-ascii?Q?lTo4rGqcIFRYoSjQrEniRUxZM2Y5uHAvQWOLvE8Xlbg5TpNtK9q64ceqz8O7?=
 =?us-ascii?Q?0K5nWGYIBVmU+vBBCt0tFyNvvUMtWnrrEFDBDU2+lCJO8fCpSGpcVADeyEFN?=
 =?us-ascii?Q?Q0QbKS/+WsrxEuzjHyNyVE3CJpfVhu+/dilgUqYsld0HFi2IO7LOfHTFHDTN?=
 =?us-ascii?Q?erL7+4XeNYwmghLvkseaZ8GLANNis7zARzyjHgqTRpviTuOVUnJAoLfId3fy?=
 =?us-ascii?Q?xwE/VwUxgVHDX43NVU/31aeiNjiUPQ1S+j5qmFiLiWMBM7QJa3xWz+9PkwTc?=
 =?us-ascii?Q?r/H4xYK1R9kTdzQIV0PCIWS0j208LnATn9abSl7ysPouJjMZ27Qa+c9rtGIV?=
 =?us-ascii?Q?9+Q6u/G18UDkt4ko0XRpOnV1RRAC/3BfeReZ+vZwfR7EfNJ1jCQ9ApgRjVhj?=
 =?us-ascii?Q?mKMPPLObcVI20nDtZ5akTEJM6ScHLwzt/Ip1dOwIcXgBWjsmxfgmsXKli9aA?=
 =?us-ascii?Q?nOWr35LJv54gHYbe9J155mhE2QZEkVHobpdZOIkj8bAqdNKOw+rMGFp84KCc?=
 =?us-ascii?Q?iMi5RxizLpjKhRyXDbLfGGNNMvsXPli94nny59bRTDhgqLLhAhAIZVWBGTfj?=
 =?us-ascii?Q?D46V7OBjA7Rca6Ms6w7bEmTwOocHSz8b3J6RviM+SnUqduDjxHW4PVsEfmAU?=
 =?us-ascii?Q?rH2fvtlT0zh4BNrSes4k6DP3Ax+oEY8+Fa6ltxg09nq5M+DQ8WagGyCj0zgA?=
 =?us-ascii?Q?GD6kzULlEctKioRQ2FCBCQZ425pgPpwA3Z7TbeU1xE3p4gNIrgVsaPOAshRI?=
 =?us-ascii?Q?E4Q2LTWKESpp5OvKYyu/Q9qPNmIPmkKwimXGcN6DvPu0Rg9Z54P7F9Me3mHL?=
 =?us-ascii?Q?8wSOVvORfw3/D54y30hSXD9ZDXFPn9ff4cst6R7AhUrxGpwHzsfhdRNURWfA?=
 =?us-ascii?Q?2/C9O2X177sjYAS+byBkvrROk+byFxwxm1u2b1HwPO3ytGvwlH7SvdF7BNov?=
 =?us-ascii?Q?C6HGNucJprZzQTpl/wjD31M1WF2XuypMEpkj52WKtnV0xKAjKfWBQFFl+iFz?=
 =?us-ascii?Q?m/ifL70Bi1VRaFjacCjGf9qKyZi1qVdSSboGHs6bs6UmFrSbvCbgWla952Ck?=
 =?us-ascii?Q?FbC7Mz7h4pHY83SI0dJj10u12PI0RhLdqCCafwU+8ufDmRLj8744jZHQrvTQ?=
 =?us-ascii?Q?Zyls0Mq5IpXWsh51cb1rti4yjB8aadUsKdDbkkFAJvZfu+RV8hJgwqpMkmez?=
 =?us-ascii?Q?uFBrFMLWYgIbw2mI0V/o36kxSiHMTOuwvBj8o/0AKKDTcHp8o306IF+1cKud?=
 =?us-ascii?Q?WDIqWDAkDdCrX9elOYMeN9YwexhcdvXc4HuPW0T0YFhTC4er+7h92j7dROYL?=
X-MS-Exchange-AntiSpam-MessageData-1: OADlQ5UDrMBm3g==
X-Exchange-RoutingPolicyChecked: 
	A+NTuZy9x7Z/EC4PveaLin1PvMpZ6hXV6paaUHLKiDENRXfjGoJ8yO2dchajxnOUOxqJnLhPuPz59s2pDNt26p3cvf0YJeHx+yF4Hq0H+MuIdO+ZZ2LtETKOiMKGudhs2a/75oExVWdurUySOu2a470qrcbPEKLeY0vGlj89R5r/jSYFXVaex75um2ReAzOZEJ3/R/RulXG+ga5m4UZLFOVmpulrzPKKpkpy4cWcALAR9QmSo19lAySaILbz4ZiUFMqMDqarrz0IiMCjJ5/dYnKJy1zm5y86dsKcZYzYHLIxfx2UoGCbxIJ12FiNtru5MWrDnMmGMFY63lmFOT8a9Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	JmaK24bRik1D8hsyiYEutL3veJKko8MmH2M5T+ClL3mNc05SS7h2HKdVLVcCioxEi4WHtNclKPSn8MEVK4boIebXE7aPkwgYaJiTbbsfw1tYWrw+QnGeKfRpQvwrdTvNTydMXIxdeJj+ZVbsbbC451lTIg7muXFpCfn9eholA5+xueiSY8gItfnyX/5bcBbpkXfBy0bLqhRMDxfrnomPZ6WJ4yiimX9+I3PfzEYjPjwsd5sgCnNg/vHpqd08APr8qkGvjYEiB054ONYms7ysps5SIBDWgFDmpnqrBu+eilG6/zAEweZb7m+jILJdA6VgwoLkpqD31FawAn/sOgFDljz62EHkyuC/FgCqGUFaKV6zgkLqlcGP4k8+7+Jaoxc94WcAFPC19PaG/QSttMoS8j0dnBSLoecstss/4eMks3EPqxyIb2VymQlNUGK2LjTX+b+nbAFnbO+XBi++rsqtdNT5WscAWDb0qRA+cjmtLwX4Ut7XyNZRrhrFOaFKzZy+qLOn5EWrq2/gfyupBueJ3pHtYsyRRWZDtOyXM3zlMepkc+2GnYnVOr0pbh6qpRR9dFehB13eG6FaFy1V7o8uUzUVoBqrDylqxP60INLE+lhnjJdsPN2G27zcy1X0erqd
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 432eee06-10d9-4419-5dc8-08ded75e44a7
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:48:21.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSZzApNCkSFguYUkQOnFnZ0uQA7Xg8MBvHAeIbEv0XDWV8pJQPXh7pthP5y34yZQOrksKbp+rCA+/z/UmaoiGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF9A909934E
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate48-hz1 with 4gqxZS6X5Xz1wshH
X-cloud-security-connect: mail-norwayeastazon11023129.outbound.protection.outlook.com[40.107.159.129], TLS=1, IP=40.107.159.129
X-cloud-security-Digest: 622207450390023b0330261a4d8a14a7
X-cloud-security: scantime:1.329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239970

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34

[2] https://security-tracker.debian.org/tracker/CVE-2026-56117

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.3.1.bb                   |   1 +
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index e214c03416..eb257cb27c 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
            file://CVE-2026-56116.patch \
+           file://CVE-2026-56117.patch \
            "
 
 SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
new file mode 100644
index 0000000000..2aabced897
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
@@ -0,0 +1,167 @@
+From d4b53e813f6119a4f090f6ba10a91778ce3cd1d5 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Mon, 22 Jun 2026 23:41:53 +0100
+Subject: [PATCH] control: Avoid hangup in the recvdata path
+
+Instead return an error and bubble it up where it can be
+hangup / freed more cleanly.
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 78ea09ed1633a583dbcde6e7bab9df4639ec8a34)
+
+CVE: CVE-2026-56117
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/control.c         | 47 ++++++++++++++++++++++++-------------------
+ src/control.h         |  2 +-
+ src/privsep-control.c |  7 ++++++-
+ 3 files changed, 33 insertions(+), 23 deletions(-)
+
+diff --git a/src/control.c b/src/control.c
+index ec1c633c..e6115f66 100644
+--- a/src/control.c
++++ b/src/control.c
+@@ -115,10 +115,8 @@ control_handle_read(struct fd_list *fd)
+ 	bytes = read(fd->fd, buffer, sizeof(buffer) - 1);
+ 	if (bytes == -1)
+ 		logerr(__func__);
+-	if (bytes == -1 || bytes == 0) {
+-		control_hangup(fd);
+-		return -1;
+-	}
++	if (bytes == -1 || bytes == 0)
++		return (int)bytes;
+ 
+ #ifdef PRIVSEP
+ 	if (IN_PRIVSEP(fd->ctx)) {
+@@ -134,15 +132,13 @@ control_handle_read(struct fd_list *fd)
+ 		if (err == 1 &&
+ 		    ps_ctl_sendargs(fd, buffer, (size_t)bytes) == -1) {
+ 			logerr(__func__);
+-			control_free(fd);
+ 			return -1;
+ 		}
+-		return 0;
++		return 1;
+ 	}
+ #endif
+ 
+-	control_recvdata(fd, buffer, (size_t)bytes);
+-	return 0;
++	return control_recvdata(fd, buffer, (size_t)bytes);
+ }
+ 
+ static int
+@@ -205,23 +201,31 @@ static void
+ control_handle_data(void *arg, unsigned short events)
+ {
+ 	struct fd_list *fd = arg;
++	int err;
+ 
+ 	if (!(events & (ELE_READ | ELE_WRITE | ELE_HANGUP)))
+ 		logerrx("%s: unexpected event 0x%04x", __func__, events);
+ 
+ 	if (events & ELE_WRITE && !(events & ELE_HANGUP)) {
+-		if (control_handle_write(fd) == -1)
+-			return;
++		err = control_handle_write(fd);
++		if (err == -1)
++			goto hangup;
+ 	}
+ 	if (events & ELE_READ) {
+-		if (control_handle_read(fd) == -1)
+-			return;
++		err = control_handle_read(fd);
++		if (err == -1 || err == 0)
++			goto hangup;
+ 	}
+ 	if (events & ELE_HANGUP)
+-		control_hangup(fd);
++		goto hangup;
++
++	return;
++
++hangup:
++	control_hangup(fd);
+ }
+ 
+-void
++int
+ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ {
+ 	char *p = data, *e;
+@@ -243,12 +247,13 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ 			if (e == NULL) {
+ 				errno = EINVAL;
+ 				logerrx("%s: no terminator", __func__);
+-				return;
++				return -1;
+ 			}
+-			if ((size_t)argc >= sizeof(argvp) / sizeof(argvp[0])) {
++			if ((size_t)argc + 1 >=
++			    sizeof(argvp) / sizeof(argvp[0])) {
+ 				errno = ENOBUFS;
+ 				logerrx("%s: no arg buffer", __func__);
+-				return;
++				return -1;
+ 			}
+ 			*ap++ = p;
+ 			argc++;
+@@ -268,12 +273,12 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
+ 		*ap = NULL;
+ 		if (dhcpcd_handleargs(fd->ctx, fd, argc, argvp) == -1) {
+ 			logerr(__func__);
+-			if (errno != EINTR && errno != EAGAIN) {
+-				control_free(fd);
+-				return;
+-			}
++			if (errno != EINTR && errno != EAGAIN)
++				return -1;
+ 		}
+ 	}
++
++	return 1;
+ }
+ 
+ struct fd_list *
+diff --git a/src/control.h b/src/control.h
+index ef592268..1f09fc8f 100644
+--- a/src/control.h
++++ b/src/control.h
+@@ -76,5 +76,5 @@ struct fd_list *control_new(struct dhcpcd_ctx *, int, unsigned int);
+ void control_free(struct fd_list *);
+ void control_delete(struct fd_list *);
+ int control_queue(struct fd_list *, void *, size_t);
+-void control_recvdata(struct fd_list *fd, char *, size_t);
++int control_recvdata(struct fd_list *fd, char *, size_t);
+ #endif
+diff --git a/src/privsep-control.c b/src/privsep-control.c
+index b9ea7f9c..3cdeedea 100644
+--- a/src/privsep-control.c
++++ b/src/privsep-control.c
+@@ -110,6 +110,7 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 	struct iovec *iov = msg->msg_iov;
+ 	struct fd_list *fd;
+ 	unsigned int fd_flags = FD_SENDLEN;
++	int err;
+ 
+ 	switch (psm->ps_flags) {
+ 	case PS_CTL_PRIV:
+@@ -133,7 +134,11 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
+ 		if (fd == NULL)
+ 			return -1;
+ 		ctx->ps_control_client = fd;
+-		control_recvdata(fd, iov->iov_base, iov->iov_len);
++		err = control_recvdata(fd, iov->iov_base, iov->iov_len);
++		if (err == -1 || err == 0) {
++			control_free(fd);
++			ctx->ps_control_client = NULL;
++		}
+ 		break;
+ 	case PS_CTL_EOF:
+ 		ctx->ps_control_client = NULL;
+-- 
+2.43.0
+
-- 
2.43.0


