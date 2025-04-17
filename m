Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626E8C369CD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 02:55:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.199.1744858549812848753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 19:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6202e9a415=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H1eWYV029573
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:49 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3njyj-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 19:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpLvkd22NJVHZjeMGd+eJnv9L9EgDWWA7b39CQrWtBzS4IvtZbX3dI3LU5BOHLqzDCQrv/ZKz/KJR9JKqkh9Q+EwnUNwvMgXx7CsBI4I71jKDUDM3cFuY3W0RYrghQO3dRmbAnH5oOd0s1RjTwMiuton1poI1lLDZWMmAuqgaCNx/svgzljdD+byj2B5h0NGfiuxSy2NgZSmnyezi4UHu+CTkGIbHKf/nCBdHIvA/x2KPfuaY5GsFqEAKHRvOnbBxSQjKPAlmtnojBoPvNzI3Cp+eq24Z7CaxcZ8bX0TL4+BFZ1FpT4W7K4PvA0qhT1tu3gErf69OHQk17SPga8iAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Zcfs/X4YSWy3D8ocoC6oKnaUpoSfZuv49x8Lh1NXvU=;
 b=AJx5yK6QcD9EtAiOPpbPlHF6611f0VZoH2oUl/YoKCKt8LVqHdeAneJEipcmzLq2JvA4X50q5YZXRsE/q16lck8I5wqCK0qldFIxJ2unAgqS6KPx99fZioTtEAewgV/KVtOOO7Ik7R4cRz9FaRR8WXN5rbMXcrHeICND6R++nG+LUs7Eyt+g8kEKiUyIFkcsjR7S1RaYIA5+HxNyabMRMy7pTewhcJ3qr9PWVOtSMbNnCxh2wirKXvnSZgqfBPKL1UIBXWMqgl+uPsKuswJ3nD3OKEwsimqzRY5TmWnN6hOpxIgkPjprmdOyHpugb0jeA4WhdL4sy1GjoFqEZGHeOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 02:55:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 02:55:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] libgcrypt: drop -unknown suffix from version number
Date: Thu, 17 Apr 2025 10:55:29 +0800
Message-Id: <20250417025532.1363790-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417025532.1363790-1-yi.zhao@windriver.com>
References: <20250417025532.1363790-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 75dc08bb-e3e6-41a9-5363-08dd7d5b59d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UPCv91ff61FrFQbfNlx6XSvFN1HMpc/LEA2Lpdm8h5rEXN0+Xln1J7wvy13M?=
 =?us-ascii?Q?nuvDt9eQkB/wUJJSfFuVw0nQpsaguK/uBASw+aaY8AVFLfZ9rLjYp1L3xRKt?=
 =?us-ascii?Q?tsr55ao2ABv0iTYe7Xe1UDwlf4gEHchkppXVg3NoySrCtgQffOtw0kkKh0j6?=
 =?us-ascii?Q?sViRBucQ2l9I01z2FHK2ycCqTTQWVpoMvdF8LxkGuc6/KaIkVVHu/Q3+PxFJ?=
 =?us-ascii?Q?rpfbFcdwAyeeTKZPAL65rhC9i74UHdxKrGRTJX6Nuj9HF9DZiq9yUE1nbb9G?=
 =?us-ascii?Q?clLtB3MZSFvPNQE1kqWtWxYUsWbWEUa6mHGK40XYNKgedxYAlipVNgKlmY4n?=
 =?us-ascii?Q?hem0pb63caguuDvd5OUQ9jDYSmBQmq4WYfnf5Eh08rkbmUEfz207Lj+2NAtP?=
 =?us-ascii?Q?1J+EZEzVo0FAdazimlFOd4K/Dfw4uAFBxFqFSR+lTGeEj+HnsYYsuigjBV0J?=
 =?us-ascii?Q?lk+xEidjl0dliSW9gK+KntFdJlgf/H1xbezPpQA8ReuGWTcKaZU6XqCXS62o?=
 =?us-ascii?Q?kUORC1NrU1QjoGh5CSKkRkiRYsiZ8OuQva+2nOt+5tdLJkMBs0OKdHR4xsoe?=
 =?us-ascii?Q?NctfTVjRUmoafskpDLta6o3NnJcDfe4B6wF3trxeCHS352sh7sQ0AIkWmmCL?=
 =?us-ascii?Q?OvC3M1VVUIQTskmeGCFwYyd7nnbQNlpRudX14+02+9mATASTFfwvYxqZyQzX?=
 =?us-ascii?Q?rSMAGC/laELodsDStfFPstMFko2GRDtn/gacqJD6+ZSSSf4jkayMbhRtCLKs?=
 =?us-ascii?Q?xrtXOxOkRSLReDucIcJHLjtXZ1Gkmqzp9ohZJ5UI8OZER8mDC6J2DeTgmSYw?=
 =?us-ascii?Q?BpcUdIx7pIu4U2OA+4uLtgqviutHiSPxDTdpLVDiGl0A6KMxYrk8IqyPMv/c?=
 =?us-ascii?Q?53SLCQe8o6y6TecQcMtl51QoVR1sdUnMwWMeeYKaGiwJ7DUy1WM/+E58wo2M?=
 =?us-ascii?Q?MR0uYJrgwLx8t3sMvJLqcsp4RkZw/tnN54rrYtaKq8WZD7zeCb2UkIavXFr6?=
 =?us-ascii?Q?6pzJVDSfWRBF5r7mquzD5FqT+I78ilukAqWLMS4yUkw56LStBSqwRknz+v+p?=
 =?us-ascii?Q?r9kZqLyqVYGFfUu3F40Ro3Cw8UXRyJA3R0Tio8mgko+/WeOw1qOYDmXX0dE3?=
 =?us-ascii?Q?J2O7Fwf1oUC0aFx05n4ZKa9UHGbHpAtWkECBhdSbApwOC/Mqvkrcx/dSqH+T?=
 =?us-ascii?Q?XYUS69HOwdqE5KxuGfIKHbA/0D8XP3qacAZ+lag9trJg4j1XpEGlANAV0FnO?=
 =?us-ascii?Q?E6HAd9+WVYXYL3x0Ci0NzQ+xR08u0dJGmdnqZRovJa8mNZlfIg41sAH4ihaW?=
 =?us-ascii?Q?Hh0agdLjK/lb7atcRz2AflaoI4279BMInTm4EH7/35M8lMDBunjBBTn3ZwXQ?=
 =?us-ascii?Q?TcZfufDmPsz2bpnkpZtsymejRs1nyow1vMfG1rilT5XUgXPBDrPnTDnAr2s8?=
 =?us-ascii?Q?hN7He7BLutnp7Vjxf67+Wx+FG6ytE85oklU/tXgybPIu7svAQ2D3Uw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?990gFLy7wnN6IRSGAtzS/aJNEu8ontU9i58XCUsVTb/5jXBIY+UsYAvwDPQ+?=
 =?us-ascii?Q?jR+ifUAeQOyiiruYjPFYJOWeAMmyAD+YBtODvANo78Nzwoxi32qh59oLd0Dl?=
 =?us-ascii?Q?1fpTPaRhWG6s3NmaduNy9khdCoVEhBVeyKoZjLpF0+wB7x5ZFcqwNQaZ8IG+?=
 =?us-ascii?Q?RzH7G2whXeIOnE0cqKx50qpK8A8L+7qCJgqi3No4NHwEoG6rRXzFgwNh5i5q?=
 =?us-ascii?Q?YHsuQpG6q8OWfWQr80A8i/dWspGMeiTe72C6RRFZyfoilSv7XBh0Bpo4wfZ2?=
 =?us-ascii?Q?cldcIO6LfzyCP8Yphjtjr9aPg9NivUJPwjCl4nimVLnoCESG5yMYsGn1BBlj?=
 =?us-ascii?Q?KtMzpnYoiAGTjM+NlhrsP/IiDiJz6fk5R4aUubuwszdJq5kXWxU6cgCEaFuU?=
 =?us-ascii?Q?Vl8iBnv+Tpdsm3gHFzliy+5uFjhjqbm+o/EY5MZvHRzp1VLBJgy8hjOaaG5w?=
 =?us-ascii?Q?MAN+iqFAgASmDsCj7jnh89NY30yMLLkeUJRoVjTv8e0mZzxCPzlY3wbsn4na?=
 =?us-ascii?Q?BGBAFo9+Y1Kguq/5RpSWHfy8aGog3P3WIGuzoKAzK9bxDY7xkgi5IXVEh65L?=
 =?us-ascii?Q?v1WTemff9dTeB864wTUDsWQUPpyBKONTCN9M9FAByLGI3mpDXZr1riw+FzVB?=
 =?us-ascii?Q?RYfPcA1vENFbwGpKu1qxX0gCI3cF6FX+HnJPsKCPzKTX4YDVwIqFPUdru7dY?=
 =?us-ascii?Q?lgo03XnBgy2ivAi7SB8YMTIFrG3aALCjBDA/bLt3jrH0OdDtwqBI4Xm/cVoF?=
 =?us-ascii?Q?B40gzYHfOHc26ST3m4mr9nGw81kM+WGO4vpmuHhIEb95je9GT7YrqQzxChNd?=
 =?us-ascii?Q?iet6DW1pypngs6PKMPnmePm2aE1rEZCrN7aMhOg1Z5WXkRfCLsdK+1la3uFv?=
 =?us-ascii?Q?OLC17bYOex9w/Z17ZJn5sME1WoJXe4nMdUDvFIClmYdzme+T2BkaJ22Lnivx?=
 =?us-ascii?Q?vdLAvoA8fhsdi6zMxa7ZmoJQU+hquI/xMJkzAtryJlLR4IkfST9FEXxwGs5p?=
 =?us-ascii?Q?GMUcfHP8h3IXmkrl0BWiPXWjif93c8497bDt7QUlvetV10IKOSHGVAn3SO6n?=
 =?us-ascii?Q?UxcPFTlnOatxpDPX8I6EGGPfWePexWKLFlUngsMI5K2mRcEt6M8M8keXeKXB?=
 =?us-ascii?Q?nCVmdNOUSCzE6iho8DZj8iHvIxU6lRyh+8/i8mHMuilZNGVRzOUvjrUkvmEO?=
 =?us-ascii?Q?iG93vHcRyy9edlPdsplAfM2dcjGW09Zej8EcFecbvWuvdy0L3AlVP3xCEyst?=
 =?us-ascii?Q?ar7kCPwzNhRfFBTk7bhiDPJP1geRRajbTwFpGj61gu2FgJlRkBFiCtr5GSML?=
 =?us-ascii?Q?jj5LUzi9ljbiwWox0DGBvBNNQJjBjEnMsi4cjiYE5RkGrb6plNnq44n5tMdN?=
 =?us-ascii?Q?swB5tFg+kRsT9rmpdK6sVvdZn9WEOnnKqwZ2tlaOQyRDbhDUV0xcxkdReC3W?=
 =?us-ascii?Q?KEPUJsdPY/HmTB5lhQn4TE6izFAtFweJR+MdCkSMa6UjQuwBhsLwdp3mSYMr?=
 =?us-ascii?Q?D6Zv730vH+tkJlm9bXufkT/sbBUmJy6iuLqi7iaHb+0cJFO+RRhQcwFglw8o?=
 =?us-ascii?Q?jNIRmEMYS8AQuK7Sf1UYDKkWbj7Cn9ggHxTsv4Ya?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dc08bb-e3e6-41a9-5363-08dd7d5b59d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:55:46.1385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFqBURAgVL5KxiSUHK40Qt2rtA8OgMC68I/J9l7akU+MYxqgUGoW9M5bMk2PzticiN2P5BW3keijJGeQhQ/yKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
X-Proofpoint-ORIG-GUID: 7cdpVwBgkNiVZVwYbuPwmWuRkwm7-M0y
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=68006db5 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=GKLAf4bjMrQHtVmP0GYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7cdpVwBgkNiVZVwYbuPwmWuRkwm7-M0y
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215028

If autogen.sh is run outside of a git repo, the find-version function
always assumes that libgcrypt is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ mpicalc --version
mpicalc 2.0
libgcrypt 1.11.0-unknown

After the fix:
$ mpicalc --version
mpicalc 2.0
libgcrypt 1.11.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.11.0.bb             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..4870d4467b
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From 028305ba9ad7769d6f1747a4945949ced8761ba9 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that libgcrypt is a beta version and adds the suffix
+'-unknown' to the version number. This should not work for users who use
+tarball and re-run autoconf in build directory.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 9b36158..4b2e657 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -265,8 +265,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       rev="0000000"
+       rvd="0"
+     fi
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
index ea1f34e8ce..712d2157f6 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c"
-- 
2.34.1


