Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FEBCA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:26:14 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1921.1790663169963565784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=K9z/aLtM;
 spf=pass (domain: est.tech, ip: 40.107.159.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmnf6lYhZImtskxZDMDkj72zv7Vfh41xQS1Cm/m3r+m7DEaJR3q+yyUb1eSjxQvt5/ZhxA9V6uYc7Z+m5ALyhG1QynwxwSUt/6whhw12qZjPLo6VkXVWSGuwqSJbIJ9rPdogR2RAyW4l1gF5P9iA8jPijH9elT3y/GSo5ycLPEoAkfWtb/UNl5dHAYqdNyisLABdyCElIPPWVgDH2Iy9s18vA4EYVMh6fDzubnifQgGugIpR3IETBPUgWkLvXlAEqqPfd92yAdkp3xNdxFJrG1QITptJq7E6N4prdhjuHek80852QeBVIHiXACJsFtEJaSqRylEiD8S8nNuk7nH5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UopnIp/+Bm7u1nTxZrSzi/fHOQrf+YZ3aongbjTZiN8=;
 b=tUaJMK9FxI1vXXZPAQOBzx1g236Odo/WAqihBQ6e3yx+ZGoQZrapG4VG/7JCRN/j0pqCADdWuOcQWA77y+5k+17wpZgYu7UrfEdRaeGXd4aTr2YINuKK9K3bTvWOk4l8xP6ZzYXkvjdnA2wAY7TKc39ritSTdpN5ZlOetd6s+zpbVntGtDIoRVyiW2jPhYFydZEB6LpFnHQeYyT3sMGSbsS5rrp/Fs8cMitfBs1wQlUSX3wHqoopeJpnByUmwAqLJnUxbm9T7RNHgNIxxASB7lKegGBqPpnH1iS2reuzUYEjTcPRXKDpL2k7C23zy88JzESXyEdEZjyFUgJ4lkZuRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UopnIp/+Bm7u1nTxZrSzi/fHOQrf+YZ3aongbjTZiN8=;
 b=K9z/aLtMle2QWmS5M4/PWNr7vYMWr0sA/Yw0QRJ/9QcGdKPD0IXmA8rqQymmRnrR1LZzKbZiFSKhujXE/pZXrfp3DriAqCOXl0Duc4u/iBqFdzljuXHxyHMw92GNVyuQ5unq/ukKACcMQvCtapKmNUaZXKgYX9DiXMF2zjhuLYyIlD/XtnXgVmbX1IH0oNv/f8YsEHJ2cbCvFlPbJu8DQOK0aF33AG7H3AICvKkLQmChB0R3Jqbovy8yLnm9xhTZNnP4Xq+afSKLjknbklWvJsmnpMV8ub38vAPs7PKB6gmc297SCTWP4ChV1inp7eCGKbeFEvVsusCDamHZuXz3kA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB1033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 06:26:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:26:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] perlcross: Upgrade and drop redudant patch
Date: Tue, 29 Sep 2026 08:26:01 +0200
Message-ID: <20260929062603.67218-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB1033:EE_
X-MS-Office365-Filtering-Correlation-Id: 1001d551-4c45-4e2f-fd90-08df1df28a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	r0FbNjnmpkXT5CT0hkchr8vYUwuXVOQW7YONYmaPQcCg9D80UyIOUh5TS29oD+voi0xFgQ8IxiEmJFb+AkFZEr4jkJD3EpkaWm1DzATteUnicezy/fHfY/ouFUUrrUHBouX4WTm8UiyUSVivY1Ai3S4KKcAkp64em3tHPXORBEIFt+XOsSJbMfT0ycv4JDGDVai5uiSNbGKTHRfCnxKxP9XgdMjqvLVKkUisC6PJ2kUZ/bZNqbNueFs3qS0EQ0VXACuEf8yiCwRkXkpf1uiTVYZGcYGISRZCgY4/TZmcWtv/tp6QV2uzFeKBTrkEE7jNP2O/qQppUSbF7fixKSefKqWJ5iKO+6KDTWAjBMcflvwamFXOsrccKhVCtCm0EJN5QgKld6+zCVS90A2OU7AghLz2b2+ZKFKnMq7hxccUOPcz9Wi0nN12+z8X0qkE2OLZnzH5k1SmgAXIJC6ugOEWtdinJW4Lb0gApCBzAoukLYMhZQZh2SIXpQyPzRBkLUIUY6ye5dh46NlpaZ/cIKoUBFFJSmQDUjNZYfjsdzxBg361pA3rx0Ema7/lEIa6gedtZOItkqz7Y+CLC5jC9KdJTOmBdA/rHfYNEOS64ExgPWrSvXydIJaCpr9+acjA75bxDNPyr83wpsXYzW53PSylK8LLYES4Sl3UnO73fn2K9j4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eHbS3Mt1hEcfoalltffkNt9OlbyuGpElHefn1+TiMuVCr392yfbj2re01DQl?=
 =?us-ascii?Q?qif1u6P1108rGMHj7RebDKbzIGAMVC1N8JXf66CRg9oaDkpGoKpmw78+X3SP?=
 =?us-ascii?Q?BZW4ovLmw0Is6DmjcQQYk7e013JFNyyQ8MyRegj1Fewi86AJyMW8HSiBwVNu?=
 =?us-ascii?Q?AhUL25p9qMMutS3mvq2GLJ419DIVc6Bhfl6JlLuXylIqSIeR/uHa5HTGzqcE?=
 =?us-ascii?Q?0y2v7w4HxwFDFJaVWEOE3llklxErJC0JWTuwr/scfmLo1zZlHj8UfAALbeN2?=
 =?us-ascii?Q?fRLXswCPVHy5Q0nM4eowA+eGIk+++YN6+ZwvFKOiuSTw9dUZJwseBer07Qzv?=
 =?us-ascii?Q?MoVtf7v6qx+dtfZ6ZBst9h9GqTAjDLnn3avtVX9s2glymFSQgct7aA4odLz6?=
 =?us-ascii?Q?UOJMJDNqU2RI2Mhg+1KHgbUe6KsbmvRMXn5dzFp4fILA/vJFPE6fzIeACvPK?=
 =?us-ascii?Q?OxhbQM/KRCIS8aL2Uw1PTDligWPoocerdEaKyw1ox+QpMCNn3Our4ze6vndg?=
 =?us-ascii?Q?qMUtBNQdrNLSbaYTcifmOILVcg9Ay5nZbfWIjpNzqob26cPAdai+wbuB+XFL?=
 =?us-ascii?Q?t6/ErZQSPfeGp7pKZRj3zRgmt2p9oi4V8+36ZX9raG3TWmt40pD9aswkBMMK?=
 =?us-ascii?Q?5pAYGCm7qvC6nfZXHBU7m3rPI2iJwzh+Zg1xx842OXJZtII3pT3gz2UUPBiH?=
 =?us-ascii?Q?LJdEIfj6mFGddXNqBzywq6BNsAgcgWpCNtreYVx69rdKq+vuVUXx8gTeN0Rl?=
 =?us-ascii?Q?W91IUzJzRoN2grM8VPFJ+6z4toL2sUd+7uFnNwt3djlHY04rJcLZf1rl8NS2?=
 =?us-ascii?Q?A431cN4ycTzYNJz4liZdGCjwfF29zemQx3Q5PJwoNc8C77tFcDSXWRYY+vyu?=
 =?us-ascii?Q?+SlPa4RxaLAkFAoTZwJOHHApOITqKLwRWYB9UPgeoDG/RhvXeTh+uzKqfaxg?=
 =?us-ascii?Q?WNiSdaut+p7O8A3iDl778QjKKHNTfpVjrck0MHhmFvpxTcK9AataSOXg4okW?=
 =?us-ascii?Q?wf7QUKfgobcGJ2QBvXKo/v3yUuJHHapCISQ9V6Bm9s11JEG2apD4dDxkONZk?=
 =?us-ascii?Q?3XhPjK046AVG0270yjU1m+pfN/YLL6+RiuKA9Ad9LFqCQ+yc9xyYazyZJnqS?=
 =?us-ascii?Q?m8pMWVtVtmPy8XkDZWWZW+UvTrSayuT9SQpGalWKLf+H9sWkjxgvy5yAZ39K?=
 =?us-ascii?Q?1v/hXyHha92UtWGjxd2pugTCMmUVnrspoaIPIgfuP0ijicdqTB3PYEymEe2F?=
 =?us-ascii?Q?fSiey44ly5d+cVye/jq8PzeMvvaIcDPPJJ3uRWAnAOEanc7pyDk9Xr9f4o5u?=
 =?us-ascii?Q?z72V0CU0+vPtdz5H/8l/HYNq6zzuAFjyWHCx0Gc6adJ3VWp+7TXVw7iob6v3?=
 =?us-ascii?Q?aJHCMxvWrfFZ6d1YECa7wKrSCiXOldUQ77ohX+D3OxmrS2ko6hnymkIDtALg?=
 =?us-ascii?Q?grJRvdpVBMllxWUgA9X9GbEHIKTSX6bgrLke/vLD/SbTSTY4K3oTIAzIJPkm?=
 =?us-ascii?Q?bRdZUysRO17TCYQ6yNqD/iw4sG9OWe7xyAVs9vltcuv/z6OQcIxLahGjZXaU?=
 =?us-ascii?Q?qvIWsnc/69qwLMgpRkL5kL4A8RXadXFZWJXrjtAHiKXt7mlan/YcWOvvl/of?=
 =?us-ascii?Q?xtpTf++iqkZpm+ElDYHaUOZtYcMKgrdDdsRhJYBR6YdLQHQWWBc3JrspNTYb?=
 =?us-ascii?Q?dM25kN4zNFcpC7isBYJUsZgCqYq7vNSpxg7w+uNsqJZlTr932iizsxG06wiW?=
 =?us-ascii?Q?O4gglmN4Qg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1001d551-4c45-4e2f-fd90-08df1df28a64
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:26:05.2137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJl4XLo4jpneGRBMOtnNzfxeaiMcw4MTo09Fv16/BXHSE4GuXtRwblmj/DEkqJ5Z/SoRy33Up6ryCiAzBX+FwmPTM3PBWs3LI/cwBBPk4hA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246839

Jaipaul Cheernam (2):
  perlcross: Upgrade 1.6.4 -> 1.6.5
  perlcross: drop redundant LDFLAGS-when-linking-libperl patch

 ...ile-check-the-file-if-patched-or-not.patch |   2 +-
 .../files/0001-patches-for-perl-5.44.0.patch  | 110 ------------------
 ...oss-add-LDFLAGS-when-linking-libperl.patch |  24 ----
 ...Add-configure-checks-for-perl-5.44.0.patch |  47 --------
 ...Fix-checkfield-for-C23-compatibility.patch |  35 ------
 .../perl-cross/files/determinism.patch        |   4 +-
 ...{perlcross_1.6.4.bb =3D> perlcross_1.6.5.bb} |   6 +-
 7 files changed, 4 insertions(+), 224 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for=
-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-=
add-LDFLAGS-when-linking-libperl.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configu=
re-checks-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-checkfi=
eld-for-C23-compatibility.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.4.bb =3D> perlcross=
_1.6.5.bb} (75%)


