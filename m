Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABADDC369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 06:55:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1607.1745564100392858031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 23:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210502670=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P5HMD3003428
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 23:55:00 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhaudhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 23:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkGp8eepL7/Q8wFs4iRNpova6SS2GQUO/VlbIZj1NgZIK0l37rLA894VaPO1tZ2mEP7dJ5XizRRNtVdJgL8+kcNOV54k+qDmrD/Ul8M02Z4XTiq7YkAxW3sPEaMUWbWnOYdar7Bwd0HfPCcY+RgbXRXSkNeHlrTtoNVfaq/0+kVqoF+JV/IuU22u9zmP5KZbDzbAiyZDpL0icUPPOsB55weRg7ggDGmlk3wzCGBlpqzIb5FxmJz+o4UYhMYInmtR+OBrSt6ii1Oy8iu/gMPolXPyZEimQzsU1T5OeHZuBvUZgL3KOezMUebDnb11fT4n/igW3nwjhOi38vKtuUrp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQtAXPrw6T5Z/IOmRNNw8F9VajFvICyRXhzIhpDnA9w=;
 b=oabUyCLAMXai8zaShQ3S66mCe3ytiwqimMBchTM9UB2QF5nFtcbPnRlJOmpskETaLssERhkTaHAR+Nkfjo2blxjc+zPotYvuU0mEIAo5wihmS8geI1hBg5RPK8bQ/NB0jVCvtx+jgAWhal5yBS9m/COJD0S143vkCm8jGpJIGOEl/ISbCoB5AmCFHm/9CC5NqzY84aRJK7z5sSvkdt03Yc7LSQsa2tqakdwHLdlyJitQzhjkjQVlNergMOon+GpVyEmOX98q9UpUy+ftFUBYZ6BFVIlDyij41+oEI4Juoo5wssweHqRBqjroIW8muRP+VA0ce+UFEknAbVuP9bvfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.26; Fri, 25 Apr 2025 06:54:53 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 06:54:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2 v2] libsass: fix runtime version
Date: Fri, 25 Apr 2025 14:54:37 +0800
Message-Id: <20250425065438.377577-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c5c4c8-6f03-4a65-4d25-08dd83c6150a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K3fLBvuOFj5SzbFfoYpPR2w50KZyva4mzgJlvffJbeTpSAcT8RJN+sfMfou7?=
 =?us-ascii?Q?eeEKpgKyO3ZrRnY0gMa6PcqFAcb7NofzUMM5n6Q2ZnaO6z16A4aMnLMvmPcn?=
 =?us-ascii?Q?FtD+iWGyFI/InbV67HlL7uJkuvp2cBB7u4ubrr5WO5i3dcV+KU6E9zxUlhAU?=
 =?us-ascii?Q?IG8BzV7DBY3K/JgBhORX/YM+IixE5z93rx0cPrCSeoRBnzlI3mwCVmBrKQQV?=
 =?us-ascii?Q?okDvOYuHe8ECt5BnG2TZdIjjlaTqaz/63wJadp/lOPkJroRwoaL9tpeuk7zc?=
 =?us-ascii?Q?VKewqMp7Wt1RhE0PJ9GswVj9arxcppq0DML1dJtPoXeJlxDOTGm/C8QKMh/s?=
 =?us-ascii?Q?YuOSkWdfnqWWPkyuODPRG80qiGdzioeaTsDevp1arlfbdEpn3DSOv7Jcq9CC?=
 =?us-ascii?Q?T8RrG6aZcqntKsFP10SvR9gsUY7SuvqCzTUbs3ApTZBWrdrv8l/ERtS1HbjA?=
 =?us-ascii?Q?7PKV4hTH6sLApJa/Mksz7xIdAZ09LaLVpgry6BMer8026fxwIJwE08DUjyKx?=
 =?us-ascii?Q?1VWu5R3YsYp8aBLx7eaQfj/LuKLi7ALe4NUh9ZL8tEH8LZGyZV41As2G9U95?=
 =?us-ascii?Q?7ZXjyaA/Anh+WJlvqbdT9mbXXJuacO2ARtAo5vVsP3/0DNKIsTXqACTTdaYk?=
 =?us-ascii?Q?B9DrzpYBFYVKkJLq/Lf2BIRilg/rCAc9C/D8equ0MaA4ImgEdrMnM4cFCvsZ?=
 =?us-ascii?Q?rsRLqUKPYcEPOKAgnazaDwClJBNq8VGf5cClhu1v+nkqSRamqlUZziBhTpoo?=
 =?us-ascii?Q?zreYlQzoncE2gV9xwgWiHFLuDwSOUgDSaREeYOMmHjslB2Is8zpNSWgsOM8u?=
 =?us-ascii?Q?YaG8C5FSxMhZitfsnpRTPbQ6vUUaZEg1TNvnCtnWD4VBcimoMjfRG29buXsB?=
 =?us-ascii?Q?X5A0yRvXQeF4OHNNxMmmj2m47ICzbFKLlcRR460SsOjqmoDzvQXjOM/bLXfU?=
 =?us-ascii?Q?px1xr9r+im6PLUNxwkw0Sn+e8tWyiooSiJGJBNwkAtMpDKGPsHskDHWWQOf0?=
 =?us-ascii?Q?35vwSJTNnHUGqeDKB/42AUm741B3WgEe7Bu5E3Rm88T9LQ+usE7vwKTEhQBS?=
 =?us-ascii?Q?cfD0HjjYsliDSLjAozahoON+99bKlITg3ap32B8yFzJXwUHQyC+y9lfbHi+O?=
 =?us-ascii?Q?1C6qd+WQ1YmPywEH8RxGjcCm3R/66bqo9Vm1jphanm5SFt8DiVY+CsR7Wt9y?=
 =?us-ascii?Q?X4NOfVKKtxlaDoO59F3/guqK5d7OCIHF+q1ACmQCQQ7NcgqdjxF6OmHmXjdZ?=
 =?us-ascii?Q?emu5OXO6r4N/FGsmoyRI1XZ+G6s0HU5m0H0++18M/PvNKfPn07WM31fgMF64?=
 =?us-ascii?Q?t1KMo0c9VADp+dC1+LU7JZln7YvcrEsy7s/j7d7p5REoD0SIRgQQxdqXPlYM?=
 =?us-ascii?Q?ANrBbbY+cXHSNfr/np1JfvuF+Qxv4TiVqi2YdClQWusvFQlwuYw0syezAOHf?=
 =?us-ascii?Q?Pp6qIEdPXW7zIOmGEBPOc+M8fy+mFtJxs6NTIKV0hsEaPlE3RVRldSonILAz?=
 =?us-ascii?Q?wZg5W4n21K7UjnU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KHCsjqCxCUa/2DGMmvn8AnhVzNEsuQoQ1klg492Tj1vTsxGfGQi+757hRi9o?=
 =?us-ascii?Q?XToY0fRYGNB+GbyNdYcHK81us10jPljXRU1XiO65IfG1Hu4TwcetJ2uhOsYo?=
 =?us-ascii?Q?BblGIKfJdCMvAS4J6dODA3aKaIWxUJBVFfrREmqZB9GlN7MGIzsCtCqzDHqa?=
 =?us-ascii?Q?WBgIJei+D9BFd0poQd8RQoEUc1QPfhLD8avO0JerB5vAp58geR5/Xa0THiwp?=
 =?us-ascii?Q?u05hHqVllNGZSJTsWD5hyfVR7AA5Bl8Vroi9SB3ZX383+qjPa6dJ8okhBOYU?=
 =?us-ascii?Q?a1RlIh0yF7tRBWqTNgFr6nH4xx17S9NfhMLOU6ZGvS4JgNuQ7Dlvf6hgJEUI?=
 =?us-ascii?Q?R2LsYyJAEgpWix24jSN1xd1hG1is9ILdVHCJUyYV35+HDaYCvXWRoXOLkeyc?=
 =?us-ascii?Q?A1Lcg2BMNaxzFnjxkHQ7TDF9kd/QJCZMvB9KX1NxvoYuLnUXwKtRcBE6Ueyz?=
 =?us-ascii?Q?x32RZjdJJg+lDFzFNBcL7Dv607MU/ks2n50tj3vtAjnEf3XjGJPvJNz2B4Ot?=
 =?us-ascii?Q?mzh9fZ7qqhmMXOMhDMdoCl9gnYneCfPtpAfToK8nphmbeAJkLK3OuwqPUh0/?=
 =?us-ascii?Q?mvuicf6XShFKsAQR67GLc+QE3YObIUGZ0vv0vcQYOeL3U4RHl2NpXdjknOOp?=
 =?us-ascii?Q?1ej+3o+dcrHMxfDAYA7GFiD0glrjcPgXXoAp+m2GlQ7AnaoMfI0c5YNWLnPk?=
 =?us-ascii?Q?vzQLFuAJrY88+6jRJyApcMH9UKn9qwlzbSpYrfmbk4tp+VOzoMw7QxTz2pex?=
 =?us-ascii?Q?VfA0D29N/6BLxqRyUSo8qTPidK4hqs+NKEIyqjSurb3KUUZN+afENLfuPNcF?=
 =?us-ascii?Q?SNFmBj6z40o4e8SBC1SaC3fk0EIt0I4RmcHAk+SMuYwdHCE5NlPc6J8H+2ME?=
 =?us-ascii?Q?C1S2TXOpx4Pa7Py/UnhsyXnuSDZMKsfQkhZGDJimNyoTqyhofmooCHUVLqiB?=
 =?us-ascii?Q?da5DpqDWettSW34xPBa9xKoyFNuMG0iGx6wMi5UYUbbjNz1ZlnGjLLTyPNRH?=
 =?us-ascii?Q?xuQU6QMr07fxqgHLp4z94C8lsJlQppUKT8Bn1rOtB0SYY208fsIyaSzSXUP1?=
 =?us-ascii?Q?xhAhwZMOXJO7BdnWZH3IhiI7Zi8iUa1Gx2cxPCLZvgSsWOe+Ia/oBFt0scsv?=
 =?us-ascii?Q?QSIeduhxQkmZgZkBO/0usSf59EqmTLSFvt3dGhtgL9lHuIPYzODSM2tT9/yE?=
 =?us-ascii?Q?NlUXlW3r+nNDXtrV3E2LNDU1d/+81RimcSgxnX2yfpRu9daD74Z2uif3ORdv?=
 =?us-ascii?Q?ra6EF6GbjFgZ6R75pPvnGQxVtPLNXTTJJicZ7j9PrPBxcn5LP08bhjDr8Fzk?=
 =?us-ascii?Q?5FfTQEgUQDGTJEKNvJb8OYYK78moixSIk58QMIvdK7mCBfkHd++43cLX+5fl?=
 =?us-ascii?Q?AGgL4OGrQtvb9Hscn69pcqchvTu/KvaKV9heaBTQSkw1rMW8W0J4dtYj7E0t?=
 =?us-ascii?Q?35mSdZ7Z2MsifoRSuYvBXhsNmpEgk67ldxrnpvPBZ0r6A+pdokTh0t32znT+?=
 =?us-ascii?Q?mAyevWSPUyHiZxgkJoifstKjXOly4GuMWJhp1HnD8sF0kNwso+h1u/vpVNb1?=
 =?us-ascii?Q?jf8w2b2RcFxOBYa27bQY5voUFI7eW6m3Nis/7dA+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c5c4c8-6f03-4a65-4d25-08dd83c6150a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 06:54:53.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/HHFrcL90E2sxuChvCjsJsNN6VI0JcSU+Hx5bncXBDrSqcLv9HAxXfneUeKjXxoAsAaWCup/5LqKIykhlbgmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
X-Proofpoint-GUID: 5Uw9iKqN3pVOtMPJ-QAIV0UxvxYzyd05
X-Proofpoint-ORIG-GUID: 5Uw9iKqN3pVOtMPJ-QAIV0UxvxYzyd05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA0OSBTYWx0ZWRfX4pYRG05cGZML fDkWDELrhsvxgxNX1QGSZ6p/7H41TUp30TT50qm0ovOS6nI7zi/wl2QeeaPukc0boejxx24ZaF5 s+IQMSDZEbl65LDy6A/zAbtScOKV85xSsjQaWHnuMnXkXzSW+t5Tp99yZziWnGe6/TEjviBUKUm
 CEtypFSBOqpzjdFbGIM3U1meD962URXYFciSYtnHLcL6n6JNNfAl7ih98OPls6Kph7Ig9oCyyI4 6skMg9EHKLYYYB24Nkp1LTyS3+Y1g1w6ADNyGBmxwtU6E8vDexJQFBUbj4hYGjN/OIF3Y+YeJXP Ipu0XI6LHtY8Pdzcmvv7bIm1160D/wpp8nUgOegABxUyH3B8cvQKhxqTaWcIC1gxhPt7CxiRAFo
 wY6Bo185/T4FyHxryc5xWpw51YaTEX/wgDp57g1f9ePyBeiMTFe0myw95pckBAycsJe4h1wm
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=680b31c3 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Kz1AF1DvYn9FUnnKlGIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215430

The version.h should be generated from version.h.in. But there is
already a version.h file in source directory. When ${S} != ${B}, the
version.h is generated in build directory, and the original version.h in
source directory is not overwritten. However, the latter is used during
the build, resulting in a missing runtime version. Remove version.h from
source directory to ensure that the one in build directory is used
during the build.

Before the fix:
$ sassc --version
sassc: [NA]
libsass: [NA]
sass2scss: 1.1.1
sass: 3.5

After the fix:
$ sassc  --version
sassc: 3.6.2
libsass: 3.6.6
sass2scss: 1.1.1
sass: 3.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...move-version.h-from-source-directory.patch | 87 +++++++++++++++++++
 meta/recipes-support/sass/libsass_git.bb      |  4 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sass/libsass/0001-Remove-version.h-from-source-directory.patch

diff --git a/meta/recipes-support/sass/libsass/0001-Remove-version.h-from-source-directory.patch b/meta/recipes-support/sass/libsass/0001-Remove-version.h-from-source-directory.patch
new file mode 100644
index 0000000000..d1356dc83a
--- /dev/null
+++ b/meta/recipes-support/sass/libsass/0001-Remove-version.h-from-source-directory.patch
@@ -0,0 +1,87 @@
+From e5af3bbc9ea6e56e3d4e5cabcb5ac57b521fa6c0 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 24 Apr 2025 22:47:52 +0800
+Subject: [PATCH] Remove version.h from source directory
+
+The version.h should be generated from version.h.in. If the build
+directory is out of the source directory, the version.h is generated in
+build directory and the original version.h in source directory is not
+overwritten. However, the latter is used during the build, resulting in
+a missing runtime version:
+
+$ sassc --version
+sassc: [NA]
+libsass: [NA]
+sass2scss: 1.1.1
+sass: 3.5
+
+Remove version.h from source directory to ensure that the version.h in
+build directory is used during the build.
+
+Also remove '--dirty' option from 'git describe' command line in
+version.sh to get rid of '-dirty' suffix from version number that
+was introduced with this change.
+
+Upstream-Status: Submitted [https://github.com/sass/libsass/pull/3196]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ include/sass/version.h | 12 ------------
+ src/GNUmakefile.am     |  4 ++--
+ version.sh             |  2 +-
+ 3 files changed, 3 insertions(+), 15 deletions(-)
+ delete mode 100644 include/sass/version.h
+
+diff --git a/include/sass/version.h b/include/sass/version.h
+deleted file mode 100644
+index 56ea016a..00000000
+--- a/include/sass/version.h
++++ /dev/null
+@@ -1,12 +0,0 @@
+-#ifndef SASS_VERSION_H
+-#define SASS_VERSION_H
+-
+-#ifndef LIBSASS_VERSION
+-#define LIBSASS_VERSION "[NA]"
+-#endif
+-
+-#ifndef LIBSASS_LANGUAGE_VERSION
+-#define LIBSASS_LANGUAGE_VERSION "3.5"
+-#endif
+-
+-#endif
+diff --git a/src/GNUmakefile.am b/src/GNUmakefile.am
+index 9b0e6a99..e955f0b4 100644
+--- a/src/GNUmakefile.am
++++ b/src/GNUmakefile.am
+@@ -8,7 +8,7 @@ if ENABLE_COVERAGE
+ 	AM_COVLDFLAGS += -lgcov
+ endif
+ 
+-AM_CPPFLAGS = -I$(top_srcdir)/include
++AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_builddir)/include
+ AM_CFLAGS   = $(AM_COPT)
+ AM_CXXFLAGS = $(AM_COPT)
+ AM_LDFLAGS  = $(AM_COPT) $(AM_COVLDFLAGS)
+@@ -45,6 +45,6 @@ sass_includedir = $(includedir)/sass
+ 
+ sass_include_HEADERS = $(top_srcdir)/include/sass/base.h \
+                        $(top_srcdir)/include/sass/values.h \
+-                       $(top_srcdir)/include/sass/version.h \
++                       $(top_builddir)/include/sass/version.h \
+                        $(top_srcdir)/include/sass/context.h \
+                        $(top_srcdir)/include/sass/functions.h
+diff --git a/version.sh b/version.sh
+index 281de74d..7bc57230 100755
+--- a/version.sh
++++ b/version.sh
+@@ -1,5 +1,5 @@
+ if test "x$LIBSASS_VERSION" = "x"; then
+-  LIBSASS_VERSION=`git describe --abbrev=4 --dirty --always --tags 2>/dev/null`
++  LIBSASS_VERSION=`git describe --abbrev=4 --always --tags 2>/dev/null`
+ fi
+ if test "x$LIBSASS_VERSION" = "x"; then
+   LIBSASS_VERSION=`cat VERSION 2>/dev/null`
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/sass/libsass_git.bb b/meta/recipes-support/sass/libsass_git.bb
index f0824944b9..890cbf8e63 100644
--- a/meta/recipes-support/sass/libsass_git.bb
+++ b/meta/recipes-support/sass/libsass_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 
 inherit autotools
 
-SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https \
+           file://0001-Remove-version.h-from-source-directory.patch"
+
 SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
 PV = "3.6.6"
 
-- 
2.34.1


