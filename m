Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FD1C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:46:03 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3724.1785494166090552372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iGhH/1T3;
 spf=pass (domain: est.tech, ip: 52.101.83.64, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRGp0plAkJWiSTTJMu7blwu71Sop+CYKTUSTdyKuquk1eICkKkSQuPYP9/9hMsCH+BdWkfnvfQo+RZc5osCGz6PlR31EKepa/qXd5XqSM1sM1M50GZtJKjJhvEwgv5y5OlSytOmqzWs/y6KB+2CEK8mOajgOQ9IawQlyo0SsxyiUFVay4JPQPoU0hctE1WGhCIP0NO/6sdPNO2o2t5TcYVuxSEjByWR9lprybfr7e4WItBVaSVy+W/gI4gm5SgQ/U0jdQcuYk4CcWNaTwxYHHQOVqZqkOm+fBsA4wTShpyLhPQ6GSAVoSCjckZbhjUVA+nv18tjWAIjtm6OH2CXxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYhzzpLdZWmNdsda6QKH6i91N6NP4Qh4+oUvRptANFY=;
 b=OU1lSAstd5gE7gdU2repR9wn/zwrjs6uFDHa7aF/f0lWlclmPRWEjId0g3Edq7oKK2vRq3El7ekb20oMS2l1mKwom9/Oya95N9IqHd2KY89EIhtF5VhqAYEUTQ+r82qfuX3dDskz9e6IcpdeLanoJswHDN502Jt5lCgcpX1fqV/htX/WsAZ99gEkwX6Sc2fmbu5Gf5E6maSiRcMKUCGMfDgMwQV4i9rdrysHIXUfRXGJVavhW8vQm4R/bme1R0pe/7l+C1nuNWEMXYYpdvWGIznEs/4s+SMxaTEBCDkMXINi7EjVoXrGXTCvwvOqZ3CNPgIFSDqZLwUfJqaA3az5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYhzzpLdZWmNdsda6QKH6i91N6NP4Qh4+oUvRptANFY=;
 b=iGhH/1T3h0K6QzYqzS2NlfDrafKGbRYbwx3cNfpNHP7nBpyMpBn9Se6nmvYKQMTewX5I88YrMILYMgV6vCnfIIRBJMLJ+XWM+gm3TWv+SWoOBSdy2Hvxhc31/tEtW25mSOt67u6cSUn+tKJOBkKPw+VRT42Ist4QMQrWGiKGwyhvqetY+OAgs154PtRjgBz+FMdfxNtq2UjkxuF+unAx+x8/rNC3BtAyqWUOBB1C5mrWW6V3j7Ofsah8oYTRzGT/LnDvOYgLMhovuYVLAbqyJ/1wxhVbUJvdoXbj3v+Y6UB95RGgT+DegasavfeFkpzWAgH3hVOOMUsKmcIdWDk3fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS1P189MB1909.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.8; Fri, 31 Jul
 2026 10:36:01 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.009; Fri, 31 Jul 2026
 10:35:58 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] glibc: Ignore CVE-2026-5358
Date: Fri, 31 Jul 2026 12:35:50 +0200
Message-ID: <20260731103554.617510-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZPR01CA0307.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::23) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS1P189MB1909:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4d3e96-81a1-4a40-6f34-08deeeef8239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	j++8ZeQqvcB/Z6u+rRI8BdLRUewS59bSfcpnH/QA37kuWey+NJdojpydZAgaah6RdzStUN3cphBmtulHRD2poczFDsLpVK7FY0s/2WqFTyuBoCFt7kR96yI+SPbr1YD9rriYShw5umBntsf+LguEC92bIzGzPwSCipcXYQ6raVHqRG6XdohEIPWtFlJ/TBjjnWUyV+rQjnLoJV2ktLxcw3PN4+jF0E/pi6nf7EvRQL/koMsq4cjyTQ+9JDh9xkefgsCollYrfREZwzMdivF2V4N+E5Jaq9as/Dg53Wk8a78MRUc88c8JISxmsRi/vmaO99YBda1oYfOGtSRpEVtjFV3kFpxcshGhChmpq/qy0K624g8timMCFj+lF92NCoLxRZFkzq7ApbjCaMdFno04N8I0MSsIJJYE/zraw1vdpjBQpFBPYQmmRLlDh6m+xLQfwLSQa8sFf3DEWuQOiBJAWKdJHqcRTxr9pCTssWGXmE/5wRnOcdl2IeUREkoHGzWn63Q9PdIhvHaLJDTlJ2ynJRmFQUt1NEMlZPGJKdWXE6ue9CNDIlAMlxxhaq2u6hTiLlEgLZk43Fu9rZTNQDql1H8dY7t6FQwHgWUv6e235rfYx0yOHygaZWXJzpS15nlKQkBXRvSy4Y6U8xrhrjWR3d50X/k1u/PeUUdn3w8p5LE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dx/Ro6tqemGhh7b9fsLCnmGaAE3KyB2xwHCcVkkTW/yqe9Pc9X1pdlVFWHli?=
 =?us-ascii?Q?e/94HwmEESug7azudCxL/xUsQEtUgMvmLuBZMO2fnS8foJZjmes8B8uPoxO9?=
 =?us-ascii?Q?CtlWPWXAW8+n2d8HUVTuG/CPhP4+7Az75Eecv9ULkNFnK/9M/brKrkKnpDUa?=
 =?us-ascii?Q?Va/G0dgVHKLAGabVEgd16YwyMGO2dbfxsZXoeL3LvXWXAQh1ahqRIt+0YQp6?=
 =?us-ascii?Q?Dy7ykU6e45ycAz3hQzcJ8kgmHsdaDxWkA1ceBbzz3aDyvyvOjlQf6G0Lqcqv?=
 =?us-ascii?Q?f6Zc75Eb/LiInqJ4luBbG0DD/hOZVeQ8C+gUc3vGUzntrOlculgMGLNdqBBv?=
 =?us-ascii?Q?Br3B9TmBNWQYGKIGZ/qN/pZxAQ62mEwFP67MsRWESBjU9W+b6P1eFk7JBV/H?=
 =?us-ascii?Q?HMa035Lp3vhEvOZgYKBM3We4SzIFqc1BcjMhp1Fw1deQMmM85njG4a1Mm/Ty?=
 =?us-ascii?Q?B5VtuKjXeORQIV2FjBRX+238eEtsa++agfez9xPldjw/vYDkJ0NbgGe/6w6C?=
 =?us-ascii?Q?Z3t6ybTVWsWyX83DU+KFeJQmxawQSJW/qvk9WfcsNOxJ13ZDc7vA52+rEMH2?=
 =?us-ascii?Q?+jzXhHExe7khbfmegrtf0LKrkzhaABPmUWqDChvHj0mDYdz2AKxVgnL1FrCE?=
 =?us-ascii?Q?D/K1up5TOPbSThYpj9HR4RKPPEGyTVdCvMwEQmpGANpUxQEOJpFmgyoAXxba?=
 =?us-ascii?Q?B3VslRazdpjdksvH1zn5pwE1pvkVFDeyPYC2j0pjX+bQGi2rOgtcuSbY3t7B?=
 =?us-ascii?Q?/gHoVkAAosomE1+Vio/mJATpODsL9vL+GP4+pOmYO27JOM3zipyeTo7I3iZU?=
 =?us-ascii?Q?Kcx46O/3UOkxIAcB2fi8zY8mP1ea3K+W2vhvjOtrJISW3XyE4C9sHyTp3r3z?=
 =?us-ascii?Q?FvBn39IG6mU4T3rMJZJOsqXxDq58I8hdZgZ/ZYIecEepBnmpam73CWXKbtbT?=
 =?us-ascii?Q?qg/d7mYgumqdqWliYspkBQA0FdimfVKn/LGw9CP3jpujXAsrWUMcdnqFq7j1?=
 =?us-ascii?Q?cc7lYj8gEoW5AOLRepLTrCQnFnr6Q9TAxELR9q3/4jLAMd23MpdKtyx8TrC5?=
 =?us-ascii?Q?N6dYe8npNwD2L7Bg+e2ksqECIOokOFuTDyxo6w+bpN7KOhQUEWhpysNyWGzl?=
 =?us-ascii?Q?ObANvtejBICKFrKYJR8mShtuoXGsldsPNKLRa5S0afMjuAyt1DX5iVs1qMmM?=
 =?us-ascii?Q?4BlZkvHulFgRpd2n9t4yxTkhh+bXkqgYBHNzewwXnDE4pwk6bSZazlhpT87o?=
 =?us-ascii?Q?JK+EEwZNa35R38MjvqiBKA22oidHqXDjncXOnzYaGrsGPh7Xoy+VK8O10mP3?=
 =?us-ascii?Q?DuZySUBaf2lk3GDBB1gITlM9s6/XzVUS1GmuJB13kwBWPoxasjo5Hjk57zeb?=
 =?us-ascii?Q?wN8HI4f40tUmWBAMRU7hEgp+tIdMSMx0tYYDCphJMBN/2S8xQoN/KvveOxeQ?=
 =?us-ascii?Q?HD1ms6RRKJHF8oe0DtwQ8e4YcCp+Zm1ux0utOTWTzJlKl+lZgYaN7aEnSKd7?=
 =?us-ascii?Q?3uKqTf3w+Fn+5HmIAiUtd87Kx0J5If4F4Ij+7N4yqUe24KIsOLN/SrF39HrX?=
 =?us-ascii?Q?RNviGxHc5bpUKKurQORUM/UxY04MhssAHL9Jc8DIKKuyUcjRepAiLEXUellL?=
 =?us-ascii?Q?EbjpJIPoWU1bnSc+5uZp8Lajuld5d+wMdFHXra2y4/w9qVpyMO4VsOtc3uV4?=
 =?us-ascii?Q?gIPbdaFFO0IXecoTEHqhovxO9KC7ziCGY3G1qmOAD180AXMSHbh8PpcdLzvw?=
 =?us-ascii?Q?LtdvfLdQhJSb+zsRwLLBEOt76hh7V3QMTI5oSiAH2QZUJ2Jx7+dksevWvRS3?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	6sQqvxIBvth5StxTuw/I/wYxwsqahBAGXjsyTFDOwPYh+Ne5yAOvd4iE
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4d3e96-81a1-4a40-6f34-08deeeef8239
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:35:58.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lGUgHuEwoAR0jdyn74Zy1OBJUR65Q8gkGpnM1pCYTpAh6d1HeJ69NNV2kPGxw9EXsE/MOx9LiU1ga813GLTbjbE8ZKf+sx69wiIntztfMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1909
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242425

This CVE has been marked as rejected upstream.

https://sourceware.org/bugzilla/show_bug.cgi?id=3D34067#c6
https://inbox.sourceware.org/libc-alpha/20260421164416.4031726-1-carlos@red=
hat.com/T/#mf76c27025e603294611196b90e428769c9fc5a4e

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/glibc/glibc_2.44.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glib=
c/glibc_2.44.bb
index 9c93c05fe9..97446c12e8 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -4,8 +4,9 @@ require glibc-version.inc
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
2
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
3
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
4
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-5358
 CVE_STATUS_GROUPS =3D "CVE_STATUS_RECIPE"
-CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
+CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024 =
CVE-2026-5358"
 CVE_STATUS_RECIPE[status] =3D "disputed: \
 Upstream glibc maintainers dispute there is any issue and have no plans to=
 address it further. \
 this is being treated as a non-security bug and no real threat."

