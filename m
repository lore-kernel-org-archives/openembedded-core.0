Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC96F589B2
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:39:45 +0000 (UTC)
Received: from mx-relay81-hz1-if1.hornetsecurity.com (mx-relay81-hz1-if1.hornetsecurity.com [94.100.128.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18357.1776947983298940116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=r9TwtYNv;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.91, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.130.92, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=mrwpr03cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ahScvSEqqsiKSPdTnT5a9lKI7LfkuQ96x3MFCMiWkns=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1776947980;
 b=Ds2Pz+fTZTM0N6MtnuxmimlQml3BWBa2j8sC4MSzTKkTW7P4pZp2+CEfimXwB3qhUrQ83rB7
 5QBgxYsRIT0yXnjr+zkx7nP9cvP9L+rF3jLJ1Oad5FC2huPIUbwlkUvs3+yyMzk3JREpl8BqckO
 3n4R4GDBri4tTWD7ZoS10sXxekLTk3rbVUV3JXGHRZj+wI4aHzsQXUNnjnwlL/7zuzYconNN9CZ
 PqqPqWoiNjgmUSEXgCF+sf+dG/iBjzBfdklNrBqZs/Mdso5B+z5RErg3LVosVdQiF9xVE5MZaJ5
 JH8Y3K2lyOA5ClWALnsUwXWZzF1qSUjhfppFrrujWgt+g==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1776947980;
 b=QGqPqa0McMni780N5SC4IMSzJb/3SPoP0c/RoqUpnbmD6wfyho/wSWvw0TxXy8N+hDsUH/mG
 Gg9hw6siuObMqYO0sxsULPm2NIC/+oB06SjZkGJI4mXe3LCtlVhutxT6P2Aov//pTl41IoZWIiG
 h28GXnMEcN87BIvgJpxuIU23hPrytZHwK1aezISApraXdCAIoej7YMLHaXjXZQHh6tgQy5QSANY
 nOlhSL6hmKlWdcrKQuDXy7y5OhCWCR1A69OkqGlAc4WUEcRh8o37h20VemsEua1JvgZ0T1ShCfD
 bJcyTwweqMDEtLFkhdO9RDvtC4DIJshIXGSZKJkCzoH4A==
Received: from mail-francesouthazon11021092.outbound.protection.outlook.com ([40.107.130.92]) by mx-gate81-hz1;
 Thu, 23 Apr 2026 14:39:40 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dug7b4w/HMWLQVd9VyCwTjQv5vFUgMpdySmbcPQ1jHGhlzfIn0My91Ko/tFUz9y9KmVeU8wfI2lmO0VObs2HQO/EXzNOdjTjKpreG8B/7Hp0VVUJlfOHO2JkkMGVQ1dxlatLhNXWobShAeUhIJMdb/iIDZ1b+/oxSr6FC+QfLl3CwJIEwMqAVWSD8EtEsKxJjQbwO8sxEwY1WIpC/1N/uxQcmH0lSc0CCVCNZo/zXPmqV/fzmFIpdCa90xepC+qHXdtnQfs5P0VKKWIgHTr/QoK9pmvk1x2m81TFXmh9yVho9ave+MsLNTUxctaMOETDtV3Ge/dLeNmT7yjqOBdOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahScvSEqqsiKSPdTnT5a9lKI7LfkuQ96x3MFCMiWkns=;
 b=ZAqyXRmvhKBK9P/1WHvv+Qjvp69i2ooUJU18LkQMz27N73zPfKAIVMnLh3jd1FEYHBDAcIn8KEAwl8s7Rpzx0hG+5gK/Ikf8d9mpjFnXP1o5Es6d6wNTHFL2PmKybwsjQXPbUfQrAhnlmzH+8aTP6pCIXILtNj2CYsOLclCMiu73dhnMAfUNOuUYqUstYXdnyNbK91GtnXHqztHylkqGCAh2fPTYETWj++QTuTPBaGpD3p+flfyyvKlVLarUfdLHTpzXEVpDv8p2AeAmitVXrPw1xc+ZlhlpoqqAzTXHQhnqmhaXJlpGamh+iQPrYwZ9vUqbisrLRvMWbD2HMT3zig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahScvSEqqsiKSPdTnT5a9lKI7LfkuQ96x3MFCMiWkns=;
 b=r9TwtYNv1jyAxV3tNRwkWJl6PD6KsRswLM/f+uqC6oLLfwOZquOZwUmJ82IIVy/JMjbjCVdxzmAexEExo3H4XHICYWQ35t9ed6PZU5dGZFbL0J3bcyrxUnKA7Hy3ZUxP+iZmRTznHA8yOMcIo8CuPoqYxR5cHY12mUL0lrHUnhSfC3900Ahv0I3qFAr2fvadJygmPHtLHrhTAz3aeNG5roZ4Y8oYzCABV7L3zFNlblmEJrf0JEvdh3r1WSW5y3TFKO3tv48Xtfn8ocW5VzqQx8oRMUfZH7YnzP8ut3xioTT8aRrGGYSLRd3f9gwqXyNry3N7coTjQ+qyeMmTPNFoKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 PAVP192MB2112.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:321::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.25; Thu, 23 Apr 2026 12:39:30 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9818.032; Thu, 23 Apr 2026
 12:39:30 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 2/3] expat: patch CVE-2026-32777
Date: Thu, 23 Apr 2026 14:37:06 +0200
Message-ID: <20260423123854.388088-2-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423123854.388088-1-hsimeliere.opensource@witekio.com>
References: <20260423123854.388088-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|PAVP192MB2112:EE_
X-MS-Office365-Filtering-Correlation-Id: b8592833-db9f-46a8-d30e-08dea1355d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|52116014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ymmQ19a/kxBFHGHx0nplD/L1AcOingHFBg4leNpyVO9kr2hRr7Q60lxdaO0OO2KjEjlA69H3bKwJUfeViyqXC5pfKGLWQiUwN6wjDDQNlwpzG+chiDyvGXTfwMK2zoQzCC6UNI/AFNq65nDACHitm8JkSnnybRKle8OgY3RGYSlKjzUydmGdtx7JC2OxC2r5CkOul0WKvlTcb4vYE5DmYZS6X0il6FoFLQvtZV0Je4qihjGTuKh1kuTJJ8iZM4KRMQRSaS5OorV6O6NL1T1qmyRwVYSwOQvhkaJi/a2aL2RaUADJrqq5sV3AbZYnXYH7SVMQDKsXBgweQrEM+yee0GApqTfScLnYAojkHDtcj4GuFk+Y2ObEQvDTkeOAcbnJs6zzMuJ3ty+Za7n6YXV1yfjKBKpWiYo6gAj91a81e/oy0QuXtsm9D1vDOpxdyAfAziZRSo8ND+QidfPhzzSSjOrDIGkZ6aFLuZ+U9dp6gzZ+FBkM24YbTF6dE88w7PBC12FBUBr8FEpum0B9wqvVscgcZwfuuTb8/Gk79AM3wA86sRP87Je6ogi1Ps/f3MLFy0YNEVK33ywdwB20hhF165SWW+ugX0DW1MP90OYKHOIWukZdm0YmmDPLG6QwOZENLQ4k6kOTBA7thtv3aNABHqRiasnqZNpWAtalC/AjhVVUgBMnTK8fEnee7noHUsFJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(52116014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Baqd6Ia7i/loxEDUfNZJDb0Klp3xcpa1pkdFA40ojJs9xopa/AHdMfJdNQUo?=
 =?us-ascii?Q?59lEnbH1xlSwxhFkBdzksjhBhfRp6EeQEsoPSj51SngP1RmJDUxNUDPRTVo7?=
 =?us-ascii?Q?BkwOHrzciAzSesftf987fLtCFdhddMZpu3LyGshbl8k0WuCSWunUFb9kzm6D?=
 =?us-ascii?Q?iIxSHtAXMbxrg28ZhKOmPstGsxVSi+7GMC4P1E63W81KklmYndZb9CraLxGE?=
 =?us-ascii?Q?U4ag8JUlz255S3glvIzrJsmvnew4QhjpyYT5sT59Mk3R/xUQHC0im4iU7STm?=
 =?us-ascii?Q?IUCP2bT0gTmhlreijZ4DPtHZXlin8skHnuqaDNm5m9R8GFIMnUdm2JxJQwJo?=
 =?us-ascii?Q?zKNxXkT9vRsa3tkaL+plpOqD2AlKaxz9Fi0AFO0t9/rAo1F+oY/HQyft05wS?=
 =?us-ascii?Q?xA6Ruma5IyoHjtgcxUlzX0OIQShxny13+UEdch1f4HdMhe2obop7AOqbZShN?=
 =?us-ascii?Q?l5+MsYLG/pU/jCbI3h+QvqNcGgRDzs9nAsbHdO6BI9c94vByfCmcOq70tGQB?=
 =?us-ascii?Q?t5jGXEdhmenIn3aP0MsAaowJb0qDCHYP998u6x2NasBMqhZ972ctK2rT9n5t?=
 =?us-ascii?Q?gjFX+ftLjax6GZy9+3SQScg5Iy5SrRTMd0j42atFsiYEaNvtxTCjj3doNnmN?=
 =?us-ascii?Q?0rUROnYub4ebxA4VZpURxA/kdfXz25uR80Ya5iBrdRGoJme7YKIm59KcxRWB?=
 =?us-ascii?Q?TmRblIr4RxGRpdTHZLyqWNyVXekedAEuiH/FjXC7alup3XHMfk1rBcQ63A5J?=
 =?us-ascii?Q?331gOUt/nBfC7R+yZAJuVK3rZYcrRKz+pKaaJHVJu8JAF+f9gOiUfhCCxwXh?=
 =?us-ascii?Q?9m6TkkrtkbsNcVB+BMe/SBIQ3x6ctRFcETt1lNLjkAiqrcaf9LorUbyQ8NXv?=
 =?us-ascii?Q?rjiZ7ybSPpXLXEepuIFCgf8USEFKxUCqrUrFgacE9fYeb7AeES3galvcFPJ9?=
 =?us-ascii?Q?PjGeIqKIcO/xWzAs7J10IJuHlzGGXI0zhWM6nfvqc3egCW/T+rlSkgLB40vW?=
 =?us-ascii?Q?QGcycn4Sh42eeMsfmAl9BD3A5jkyEcKhW9hDs2fBGXtQSn1jYhTmtqfgmFQQ?=
 =?us-ascii?Q?YSGk7nvYMmadPvfjC9LI5dbiCQ/ZDY4We6NZ1lKy6DD4REP53YWbk76O+BGq?=
 =?us-ascii?Q?2To966SDJmqpSGKsLxXPjiRahP2kLDVKamQdrh77BUOm/L6vcae8hHBfPZcq?=
 =?us-ascii?Q?0qP30zcBnjk27OcLMwcJMtz4mZZK5yiabcXApdquPupAiai9i+BGZL1nFlF1?=
 =?us-ascii?Q?gpGQiSXpCW+0HD9xWTY+/herrrdzaCp1m+G0DhZDnPXMb6EZ6J1W+Q/UMwl1?=
 =?us-ascii?Q?Y2rCVhyu1C0S5qjvhuXA/6h5TWW0gUtoQGJJ3TT+MXH9BEtLUrARfn15rUuu?=
 =?us-ascii?Q?7tb1rbN0H+VoHZFHBP5BksDdZOWC0CX39T+2j7m08CZafvfSo2vl4BSwmuNT?=
 =?us-ascii?Q?LeyM20W8830EGlvJRa34KCmZbhNkI/owIdw1l+70Krc1SzRN2Sp9vT3L5IGb?=
 =?us-ascii?Q?485wzqPGnL11OOLxTRzwQgWt96MWoLI4Bo6ndb+241TnzBinMpuh4pzGgMCy?=
 =?us-ascii?Q?EGlYQXDqNJnHYgpj8lvUTWv4N42NLfkwqAB3cZpuagNo+z/I+a8k8ZpfOzpC?=
 =?us-ascii?Q?/rgfSJUvap95+8uhFrlZ5bePuGsscEbY6kGAzP0cQAv2N26dr+7qRgG7kFkO?=
 =?us-ascii?Q?M11sAdo54YSZjZR7PRldxY+/guijRM59JuVpMWvqq9Bv1m0PFXVxTDxpCuXq?=
 =?us-ascii?Q?1xQT6qv4l3jw7QJq7bEkvP9KIru/bL6QHLx1nRq6BXWOq6knxspDIyKAolrv?=
X-MS-Exchange-AntiSpam-MessageData-1: kB95PsO+9dM4KQ==
X-Exchange-RoutingPolicyChecked: 
	naYpFNL2Idym8L1qMmveHGCsiMNxyK23M3hHGkPE2TivVHqMTFSfodrCMko+jvA3RFtOhwoyv6dwvqjPqd/xpLQ+1CBS251JWr7iswzkO7anNOZpAlztY7yyxlLXT48ZF/yd3DxjhheYqjkoiaI+XYwtixOm1ZUl6KEEjhCf64Tb4kpodzUDnFUWB/JAiEf+/aoHRP03HW2ZkoGvoavGNGfRBdqYUAiCSdQej4ToU2iLO+5F5qkhaOzY66kh8G2jrl8fdHGdcdYmpXmxiY9yvficJwJWVIPH3AMGM7B/6ItGG5W0T/F9HYQzAa4h+TyMmCgKHgM6IX54EgMVeNGpMA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YD+cNG0NQWwNV3JdRZ5Z+zdooBsCRTdAz5fwof+VV9TGaydNBBrja3zOcfZfiFmfmPcTr7w9BR915VaUPSqmeCrTZIfBAwX8jR8kfaIOVcPSuSkNl4nUGARjk+BHsRlSdsNi3Xw9nXa/WKhPjvsN+GPWBT2UtDLg0DJFRrIIq8VT5SAyt+VFLqbsEVp0xon5u5Kl3fLzneD9LSGy6PHJygwR8ZGeuElYR5dX430OYLy3BWJ1NGIxONo6+MsBQrlKj5Y55Mxgc6yuxjkICT6A6PUD0S2A5dWUah8CBok1nYLHrY280ST+UZkdFgLAjxOlhSk73PtwJpf3LUDHk3uurf54hnySxqYlNsHsX93jSt9BUJuBGKvA1RK2VaI0Au7eKftvAOYPDOcgaIAf1PGerd+h83k8EQZ39xikDR261armZmKHIiQTPMgESN11CvmQwcD41UO0N78khN/2RSLWoTql3l4ZfCbK8xtwFvI5Bzoh1WKhuYZldLTySbOKPfuDWyHvzXteyGXIPtJi96akIJS6ri0S0E5YkOS5nCnxcj4yoRStufEf9nv7PM1xlX5Ar8e4ITAFUOfHFs5/Rruj9J4v3VPSoarGru0G3pk1Oph9DMD0DpLrUw7+gkcMj67X
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8592833-db9f-46a8-d30e-08dea1355d2f
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 12:39:30.3200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBPw/GBwcYGCq8xILwen/Et5SF4OdSuR/cfWOF9MYOcodxIju+LR2g6A6TOxKDUR5HGTK5pFknE40uszkYZ1bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP192MB2112
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz1 with 4g1bJN3p89z1FZLj
X-cloud-security-connect: mail-francesouthazon11021092.outbound.protection.outlook.com[40.107.130.92], TLS=1, IP=40.107.130.92
X-cloud-security-Digest: 8684cf1a55f67a0ea0e04dbd92656c8b
X-cloud-security: scantime:1.898
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 12:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235764

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1162
[2] https://security-tracker.debian.org/tracker/CVE-2026-32777

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../expat/expat/CVE-2026-32777-01.patch       | 49 ++++++++++++++
 .../expat/expat/CVE-2026-32777-02.patch       | 66 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32777-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32777-01.patch b/meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
new file mode 100644
index 0000000000..50ba27dcd4
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32777-01.patch
@@ -0,0 +1,49 @@
+From a6e6cf7c30e54402b2fa3c49f9d98702e74f8c34 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 1 Mar 2026 20:16:13 +0100
+Subject: [PATCH 1/2] lib: Reject XML_TOK_INSTANCE_START infinite loop in
+ entityValueProcessor
+
+.. that OSS-Fuzz/ClusterFuzz uncovered
+
+CVE: CVE-2026-32777
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/55cda8c7125986e17d7e1825cba413bd94a35d02]
+
+(cherry picked from commit 55cda8c7125986e17d7e1825cba413bd94a35d02)
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/xmlparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 56faf2eb..bfb8ac58 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5077,7 +5077,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+     }
+     /* If we get this token, we have the start of what might be a
+        normal tag, but not a declaration (i.e. it doesn't begin with
+-       "<!").  In a DTD context, that isn't legal.
++       "<!" or "<?").  In a DTD context, that isn't legal.
+     */
+     else if (tok == XML_TOK_INSTANCE_START) {
+       *nextPtr = next;
+@@ -5166,6 +5166,15 @@ entityValueProcessor(XML_Parser parser, const char *s, const char *end,
+       /* found end of entity value - can store it now */
+       return storeEntityValue(parser, enc, s, end, XML_ACCOUNT_DIRECT, NULL);
+     }
++    /* If we get this token, we have the start of what might be a
++       normal tag, but not a declaration (i.e. it doesn't begin with
++       "<!" or "<?").  In a DTD context, that isn't legal.
++    */
++    else if (tok == XML_TOK_INSTANCE_START) {
++      *nextPtr = next;
++      return XML_ERROR_SYNTAX;
++    }
++
+     start = next;
+   }
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-32777-02.patch b/meta/recipes-core/expat/expat/CVE-2026-32777-02.patch
new file mode 100644
index 0000000000..a1518c9a3e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32777-02.patch
@@ -0,0 +1,66 @@
+From 4b91fc7eb4998c49bfd3b701a679ad6eb7ce7682 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 6 Mar 2026 18:31:34 +0100
+Subject: [PATCH 2/2] misc_tests.c: Cover XML_TOK_INSTANCE_START infinite loop
+ case
+
+.. that OSS-Fuzz/ClusterFuzz uncovered
+
+CVE: CVE-2026-32777
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8]
+
+(cherry picked from commit a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8)
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ tests/misc_tests.c | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 07902d52..cdcdd507 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -713,6 +713,35 @@ START_TEST(test_misc_async_entity_rejected) {
+ }
+ END_TEST
+ 
++START_TEST(test_misc_no_infinite_loop_issue_1161) {
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  const char *text = "<!DOCTYPE d SYSTEM 'secondary.txt'>";
++
++  struct ExtOption options[] = {
++      {XCS("secondary.txt"),
++       "<!ENTITY % p SYSTEM 'tertiary.txt'><!ENTITY g '%p;'>"},
++      {XCS("tertiary.txt"), "<?xml version='1.0'?><a"},
++      {NULL, NULL},
++  };
++
++  XML_SetUserData(parser, options);
++  XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  XML_SetExternalEntityRefHandler(parser, external_entity_optioner);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++              == XML_STATUS_ERROR);
++
++#if defined(XML_DTD)
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_EXTERNAL_ENTITY_HANDLING);
++#else
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_NO_ELEMENTS);
++#endif
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -743,4 +772,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_expected_event_ptr_issue_980);
+   tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);
+   tcase_add_test(tc_misc, test_misc_async_entity_rejected);
++  tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 631aebe6ca..f78d9a8a60 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -47,6 +47,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-25210-02.patch \
            file://CVE-2026-25210-03.patch \
            file://CVE-2026-32776.patch \
+           file://CVE-2026-32777-01.patch \
+           file://CVE-2026-32777-02.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.43.0


