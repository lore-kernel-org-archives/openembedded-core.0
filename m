Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0B6CA600D
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 18:22:15 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1374.1791483725382141433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 11:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NSwqm4/s;
 spf=pass (domain: est.tech, ip: 52.101.83.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaNSFCDDs2D1wQvjRS8JT8yl7zgwyF5gv3rm+qHIAdGeTV5fqcr/KPccUk05BMmQIBWBv5fHabIChjFqkXzGklMVbySu8kifbqZzdju/KLGeiLC9FIW8TyuAr3gVxbnxL10C2NOyWtpbNlddpVtGIMk6DdXUViioMtP96XatFD5lrVlXgtqZjJr94yU+WqAGHPGl0CTIHi01wPy+o+rpCaKJjZvqtGTBqbFTFwmM1RwLieg9rG8ufAAofzdykrem8UmDui+rmZm6xjXDMGtQosA8KYUiT+DtR9GKKdQ4k+bYOabDXZsXnIvEREK102GzwSXSq0faYR6GJzXZX0O5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwLlOk24lCY4MFMW6jjh/VQ5GGIS47ySuLfISQXSegA=;
 b=uhF3568kZkOGz/q80Lv1ZHQOEOEW79RnbNpE4/sqZa/PhfKa8ce6peB4Thou7SXlg/onD5fAAIM3/wJRusaNsp1ycL/h88DzT7jtyu7RJNLAVSsCh/mUAC1T8+D2rGX1AYZHyRqosNuFSB0/48PXJiorX6gUtmRIfKehG1ojaGcR3I5EeADEVdvoRi9aTi5PCQCDJD2mM9Z5GuBGuglUTBF14EwsBKpsTHMuCzdzESYSk/40pELk4zVcOhJjFdBcTeExVXd9W/2eCAaEsPGihg5uNo5qexjclrbVOVNkvTblE0K0Z+DiS/rR5dmqaSVcUs0ILVVbBg6pfmZdGRZKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwLlOk24lCY4MFMW6jjh/VQ5GGIS47ySuLfISQXSegA=;
 b=NSwqm4/sWn5XAMwZRUxNxknREIWydgg5ec0e0SOa2meyq6quexPflCH/0WJy5zM3ZyQpIhWxJ15+RPoL4RWRo4Qdm19fsuI90e/fevobpOignghX2wnk1T8Vg2q7wg/YjSeFrK9YShYrr8fX1lVSToDKdCntXRQdfgZ7zZc+fgfNKzRPCU6V9bGxCItV9w79pJukDkJuWMRxrr2iNeThbvWjxeuSfuBr9tSIaJSsruo8YvalbPVyypSKsTbqhebJyj+/vzXZF1HsTJEgDyN6W4eUqyc8YhIORGmoVUD8+CIcNtNAO/nrdnKMY42dpVGiFpMjOTyOgBVnVCqi61PAUQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0993.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:14f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 18:22:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 18:22:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3-more-itertools: upgrade 10.8.0 -> 11.1.0
Date: Thu,  8 Oct 2026 20:21:58 +0200
Message-ID: <20261008182158.8783-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261007055820.59633-5-jaipaul.cheernam@est.tech>
References: <20261007055820.59633-5-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0993:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5a927d-4c9f-41e7-11aa-08df25690b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|18002099003|22082099003|11063799006|260925021311599003|260925022911599003|260925021911599003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Vep6ti121jtgx2DjoK8ZPnS8mWaCw1HQpvKEW8OpNfhgzTkKM0Jt7mrH2a6J/3M97Nk2FXRJLMK2+ZFy6cUqznye747iRaexZTfku+di2zD3IjGT7eg6Ahp7ZixsFbfN2ScGfA2l0a6ZASMSV/fIT3IrqXUPfBAfGaVzA9GxYcWRrJSh7HDh4NFRdRjxd94ecnKag21A+LO8jsHAyAtxLl6E82jm2L7Js/x5MnQ3LjKmDAmhN7nFvdPOH1jDxXW2nrKdfIo/f0iktF+TZuq+/EZLMcPG7kcxOkyi15jiFH6yF08WiHCAAgFiVP2lNmKXwAL1ENA9EwrrfvquQxchmp1MvLZq7uLS6durJ0HtSWqFl0xUhWApPicY8MsQ8JFyZUWiT5v7vBD+KBnzg/1O+Nbj+LWI0Wfs314yykudJROHByGma4RUu7sTYDeQGTwejCYcFswLTqP6WW0MUC6Ghi+PEnhrmbo2ejXYt2nVvU2t/4ULs6L6yhpEsjsqCq6bNelkKILzK7umfFtIorSaoKJI6J8ciAh1Ix3Yy6HnX4tLSmFLkMszmBRyE3p1ioHAVAfa+rTmbBNecBTYSmdXv6jitVXqcseelEgGj+ReXuU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sk4sThg4phJosjvdCQeyB64HlEq22dJAkmTzcwPtYpkIXbNf1ritkA3um9zt?=
 =?us-ascii?Q?4oxjaVYZDv7Ls7SjPaXz3sfugnZ7etU7mB2hjFQhI8rRSPKpkYX2irYGkf5g?=
 =?us-ascii?Q?HEVW1bdjSJb2dgqeUP9zp7iG+TjAy0UXw8bGkoXuc4WH6RPT7Efo7mM4lnXB?=
 =?us-ascii?Q?r3DuW2WRbIK6T+DEAXPFwpMuqe5kxMVc23yXN+ve7JQcPyWxtKiwn6aZOzYm?=
 =?us-ascii?Q?R3CT2rqgDPz2XiH6BgQO04TkdAyunICzXEOdk7jQq5R7CgLkCaSkOxEG8BRJ?=
 =?us-ascii?Q?twgnYK8LuCFK7PfhYiStn1hdGbnmBFctwS0Bhj6DTozrD+NBOvWBtZV6bsDc?=
 =?us-ascii?Q?ul27ZtFCgqFGEhL2S/4n0LKwlzCbUocCSQfKpIctygaDgLBJ8ck62sTCNq+W?=
 =?us-ascii?Q?Jy6+FAICObozp/aOIYmkEnbgd0abCbQiU+9xLimHxrg8bCpS/NydtQbr9QCB?=
 =?us-ascii?Q?4cMZJrk4FO9Icm4EFlBIxBkc2OvVo+exy87XPD43sTFTacpSxChJdu+b91wa?=
 =?us-ascii?Q?MaR0sr3hmysOP5SSTySWnC25ZgKMZh0Uk3CpcDJY8z1JSR6gDAm3yCII3tOo?=
 =?us-ascii?Q?gRf4Cr3b8EvSkAFCq/cb9TwbgEHOUC/A3vYWxXyg58+G8xC4mO8ci89sQ0RT?=
 =?us-ascii?Q?Yp9Hryoy68H1dejzZyFkeLWnPP1t7Gzoz5X6MJskFA7OXJ9mOibzuy2lBA9/?=
 =?us-ascii?Q?KStelyJy1AIGdyx/TAXILgFsNYOVBAHuabGZ1PBHJaIe0Iil6aWMXj3GPsNT?=
 =?us-ascii?Q?NZ+XDnGBWNwURlktLzonjyaH5BY00ODCPV1bL/DFpkyu8U8z6YcJg4k4Wj5n?=
 =?us-ascii?Q?D06YLuF2xjLm77ikOapexgZKe+RrZkguF5O1nAerKAdDFYYMkKpNrGi3j8XE?=
 =?us-ascii?Q?JVo5RnRdONvoTpSWQIbAMY8buY+2bAiRYKu1ED5V42B0MbQ1z7vm/mGrZVHY?=
 =?us-ascii?Q?qpWsDr59H9KjeI5F8tg9uRnpWnGpXClvqii42mVnvZHrKZ5068hhlBElCc82?=
 =?us-ascii?Q?8mDD9wO77q9WBO0TTshXyCBa3RrMCJhe/quX52umW12J4Y2tg2mCHipz08F6?=
 =?us-ascii?Q?tVHI1mBnxZCOJevxnh5Wf1a3XgOasGPMiy1QXCYzqH2ga3m8jhVjF8kI8DPq?=
 =?us-ascii?Q?KlJwZ5vaRpfXFjwFjGEx+C7FCOc6hDKTb0RI7dZj4E37NzDYqo6H3OtXkmsI?=
 =?us-ascii?Q?jacygo3nDJNqWDvYIu3GIn6T3bh3QLT8Pu4VkRXnxs2khtkqpOITJDGBD/Xa?=
 =?us-ascii?Q?MtTuqUCG6bgdD9JqwXFfM19uCDHZKtq5Rz/dJq+ks3rTzENJKzwnWBy4RQhq?=
 =?us-ascii?Q?5YrNmbwVqi8Jwlk31rKCaXJt9UsyxQIRjSOmwT3n3G9JZe0s6X4KH8YN58oh?=
 =?us-ascii?Q?KzkooEjdFtJPPm9wJhT3e9v+fdWB4SZAddoS6KwVvDEaOsURkFVsu+Tz9fFl?=
 =?us-ascii?Q?yh8CAQ0H53gE9kDvvPRw7zsdqCbMDf/9TRRg9xuA1cf/yqtx31BV7XgGJRM+?=
 =?us-ascii?Q?++bc/cWjTViCPRD1jQ4wyvXjt1jFvY8u1ZajR3Mf3MChYwZs4zw7kPxEQ0nV?=
 =?us-ascii?Q?Cuf4vSJfM61syW4XrKYIewIii4gXsVFKAsRPw7pjzW3utICj0s4wX2DIWdVV?=
 =?us-ascii?Q?muy+NZ/527sroaehHFU7WHzlZ+E5RE1SyTCon3KanMD1m/wyAdjz+TyOH6fH?=
 =?us-ascii?Q?1hOiWwS2jsXE38lTL88TKaYysw3cTIwxthcp1j4Ze9Tt2J5ToMtopMsxmjF2?=
 =?us-ascii?Q?dEESPXSEA+OzCvTiDok4wESJUgsYtDc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5a927d-4c9f-41e7-11aa-08df25690b1f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 18:21:59.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4BgGjyQ4HNjE+3IfrIQhNakwjiZrOJD2+zGXwV616/0haKeIopEYMNvRN9bA/zdZjPE0igwzEhCT+lxXCmhPTNM2WWXlNPJJaAvl3vRb6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0993
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 18:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247441

changeLog: https://more-itertools.readthedocs.io/en/stable/versions.html#id=
1

- Extend the ptest-runner timeout to 1800s on riscv32/riscv64 for the new
slow TestConcurrentTee.test_concurrent_consumers.

  qemux86-64        PASS      18s
  qemux86-64-musl   PASS      19s
  qemuarm64-musl    PASS      27s
  qemuarm64         PASS      28s
  qemuriscv64       PASS      1654s
  qemuriscv32       PASS      1702s

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
   - TestConcurrentTee.test_concurrent_consumers test is test spins up 100 =
threads,
     each fully consuming an independent tee of a 100,000-element iterator,=
 with locking/synchronization between them.
     This values are hard coded, so either test case needs to deselect or t=
imeout needs to increase.
     So, I choose to increase timeout for riscv64/riscv32 rather than desle=
ct.                                                                        =
                                                                      =20
 meta/recipes-core/images/core-image-ptest.bb                    | 2 ++
 ...ore-itertools_10.8.0.bb =3D> python3-more-itertools_11.1.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.8.0.bb =3D>=
 python3-more-itertools_11.1.0.bb} (82%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index 22bb23c0e7..d374d96cd9 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -10,6 +10,8 @@ HOMEPAGE =3D "https://www.yoctoproject.org/"
=20
 PTESTS =3D "${PTESTS_SLOW} ${PTESTS_FAST}"
 PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600"
+PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-more-itertools:riscv64 =3D=
 "1800"
+PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-more-itertools:riscv32 =3D=
 "1800"
 PTEST_RUNNER_TIMEOUT:virtclass-mcextend-go =3D "4800"
=20
 IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb =
b/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
index 053197ea5c..2ea5af632a 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/erikrose/more-itertools"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3396ea30f9d21389d7857719816f83b=
5"
=20
-SRC_URI[sha256sum] =3D "f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c=
67503f13ba30bd"
+SRC_URI[sha256sum] =3D "48e8f4d9e7e5878571ecf6f2b4e57634f93cd474cc8cfbd237=
6f2d11b396e30d"
=20
 inherit pypi python_flit_core ptest-python-pytest
=20

