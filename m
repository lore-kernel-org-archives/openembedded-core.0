Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEE4C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 04:16:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2133.1751343403883368909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 21:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92779b3d25=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56140QLO011234
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 04:16:43 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1ameu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 04:16:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OArL75KyPFm16pxlSkrtlc5+O3MC7LgnKQMIMNna24l9jnIX5AM1VcrKZzmcipmOpoilOIt/rjTgTJR0RFQ3+jfsdvkG61/7b828cMlhJ1Ke/HJ1KeR1E63t0wT62B8/UBNcGzj85gTBr/4/+J38I54iwuDddDcNH+mZ/hUsonHigbxLHxhqd/tpaQ5IwxwZdGgddtHJVOGsm4bdtuw56eHdQHIKB0K5UmAJdMp/XcA9MIdrCwPAAuJgTY3cHWoI8odKTxh8PnLCeSYM3vLRvC153rZLfTYdBTQ/Ata7XeaNfNMTXOfjkgZ3eXC0N7yxlCwXsMNV7RCPwGz0sbA91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQJk+tDMC+ncgzOIBoGhd5obyYE5nQwuy39aBp1Pla8=;
 b=FVNPX9lHzBBYYY0wbdlSf2uj8OeR7OdZH6YxqMyevxW1e1BWTAN2gKStbDz9VvahVare5JmSja7qE5JSV/zEkyzU+gF38ygxFSAjWfEiWWgeCvqrOXtk4O2d2teIuLuDIcn0rw+odv/GY3gcjk3oY3WWbfS3RmZyMiVpth6gT9fI8zMFS3OkZ2gY0emzx4pBtAsrOqHYLx7JJX3AEGZ46nTo+qMVQ2fKSOIbGK0OZ1Y0kkOlSzKMM6OqngAvupPBg8t2ZgqT3hJNJfVmK/QM9ppd4LQDYVnlCNJzQ5diBJtZ8SHGn1q/6DPOleWGzyv2gh54hKjYNYlR5gUtcsZfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.31; Tue, 1 Jul 2025 04:16:40 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%3]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 04:16:40 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH V2] coreutils: fix CVE-2025-5278
Date: Tue,  1 Jul 2025 12:16:25 +0800
Message-Id: <20250701041625.1956085-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DM4PR11MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d9a6f2-823a-41b1-6a4b-08ddb856137e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yyvIQB6Ilu5vJ9mRujmPrrp1EHTWxASyk3TYQiwHoizNEdJpLywIkFoVhv2o?=
 =?us-ascii?Q?mPha/hYp3pXOIpchvr6R2ZjfS0bOqWIlRFxmi716aPNB1My+0+NiPLRf66qB?=
 =?us-ascii?Q?nufLUWgvZOCXd/FEr800W3FJPi8IAblvS/WxtCPL5HCBzE/WStxfMttsTvxZ?=
 =?us-ascii?Q?zWCtaGuqv8/fkVI06SPf8j4pfpyrbfrNQQqW+O/CKiZ49iD7VApW7WRMvWwM?=
 =?us-ascii?Q?vTyWKkKMYfzjSPTZLWpWYAqqMYKrrpnlfLiv5ICTxuOyfDSHoaDPu9H8JWCA?=
 =?us-ascii?Q?sDVpHFsHnTz0F14UtXW2dRt1f/nsrcHqh82YrHaXri+3ngyp0VXWOd6pKIEx?=
 =?us-ascii?Q?Mvn+Fu1/3jpVuPF+qRxDXQe8n/H6ymOopujAWOh9oVx4qMnDWaMyPizHZal+?=
 =?us-ascii?Q?yQqv0NYHv7023XdQTcOgM9pabPCfAr+PIOWU3GFNLre43Bxp0CWxeHwWKTFV?=
 =?us-ascii?Q?yNQqw5o3QsIdZzH8BJm57l89UYl6yIIbdrdW2oFBujr4t7u9W5YGPABkEiVL?=
 =?us-ascii?Q?9xkfqTflhvRChvoS2IFr1q/OlPFq15+3yuUze31XQhLHuY5mzotiHGWKLYS5?=
 =?us-ascii?Q?o9fMvL1xGz3T3suq9M2mzG3e3RDkbmmElMqk2Reo8LjPyW1C6xRoG8ndyc+T?=
 =?us-ascii?Q?i4gCZJe8gzpVO602n0Tgu/L/KQMn7wob5F6ycelkEaI7zvsiW8RImiLAigEm?=
 =?us-ascii?Q?Spuqwe8IK90HueLx6Gh8oaGyicHYLKzsFvjNo15Theyavo3uUus0Lrd/EF1T?=
 =?us-ascii?Q?qserqfP9nzI0fzvV/JJtBH1Svqz8fXM1UHWFwIIoaQ9ZS+poxVeFzMlKoAvY?=
 =?us-ascii?Q?dRjN5V/yXXbjxtVkYO3wu+S/SyhmXP9OHa0vYfmr3PCDsidWILJAeAnzRCls?=
 =?us-ascii?Q?D40+nrJCFPBm54GWzqlQoNhGFhngEYK/wLQTTctTVCI5tLEAKOKDvKqyPurL?=
 =?us-ascii?Q?tqrISPaP6XVLbCW0yxNztyMEO/5TDvb3s1B572NJrzZGq6EAL9drU6VpTyMa?=
 =?us-ascii?Q?CD9WgniKFQ75kcOPdXy9uEIehi4eksVyBaOpBgXghPCk0vXpm1yUzR9OWAf/?=
 =?us-ascii?Q?3dmArzxAalDxeJD5J7mtU2dSOSA2ZwyTKo1Wp0y+8E+1ThDruGSCtMU7xCi2?=
 =?us-ascii?Q?39R6xwLsT6Ynmx62tcVJTTYT0X4wZ6BPAMiUoWjLH4OigaJ5XznnqLb8CkiF?=
 =?us-ascii?Q?tRiWvxZh1IIl1NJFrovFLg9YLy/DqAJ9uOwWIFbZXQTZC/pYTnMgLO6Ceeva?=
 =?us-ascii?Q?kDX29KvPtnNzWvrt2sHZtBtRCat+gJCVKjV3W6EYNHidIuuvywyoyKHe3V7P?=
 =?us-ascii?Q?iEavb9IJJTxK4sITX8hkq9ycLhQaYiusna/wlztsCeLIBnJ+FUxsd9pcCQa/?=
 =?us-ascii?Q?dSxaNVqWHVT58uiBSAEbqFSkvjJPcBcJGVpQQOgQc2hA1QsXZSwPvPYUGBzR?=
 =?us-ascii?Q?pnUVWqryvLK8cU/4gQUQu5C2+k6tM7Nw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Oujy9gMwcZTxb42TprY08bjD9AdpmveOfsIdSAOoFbzpacibDY3wqTlaf3kW?=
 =?us-ascii?Q?bYvNjJLwEJFX/KYn9h2w+T+YM4lfXK1up6l/5Oqkdn4AW6F8USDzQRCpuqLP?=
 =?us-ascii?Q?IXs3vTfmBGTT33vylSrgeoCFfNq8ra1dP/PsDPDizL9phOM38iSaL59CD3kd?=
 =?us-ascii?Q?42IEJGyWFVn7wZUgwUyollGfn0stcIUzbqS/R9DsPnMA26VBzLHeEmVRqMHu?=
 =?us-ascii?Q?R1XMhZEhksQEZ3FHnf9uN5fhRqVtSUw4ZzHOZvOOJeA5IcRtQ6RN9h3iM2VP?=
 =?us-ascii?Q?hDLJ0OMNhtx53Kz1gJNneEJFb/Cb1dOOogr/Y5M4+Nirxkk97E1Dfiw11T83?=
 =?us-ascii?Q?CtxNwm0wrhR5cV45abJ46rzhG6Kewn98xud6EHB3pQHR6L2W4xctvGf7QEY3?=
 =?us-ascii?Q?CQBOmwS3DCQHRQDuyaEAOJ0mQoOtxSFW7Wqj1XfNxdeEoTGwzjxl0ZGORqAC?=
 =?us-ascii?Q?w6OzkiUQhv+otMtiO3k28iVozI6Gp3fa9YhdYVoL+8EBZUHHutO4+4KUMvxU?=
 =?us-ascii?Q?bbCVaHTgL/ES7lTYx2E0DuyIPO2rGEMAmimLTwzg+xtopWkqLberYid8WK/c?=
 =?us-ascii?Q?AUW9Elp3Df86H6Ul/cflUvWXdtFaXTE+9wJMA8nByxyv0rKgL6tH5BPj1M3Q?=
 =?us-ascii?Q?YMoYawk9UHKPUt2z/TkZy377+c7S9AzcB6roQ5m1y8xigzfJuCKIWJScIVBW?=
 =?us-ascii?Q?zUuoRCXURsIktWZbc5PgwbBxZVi+xnWzjzSCqxFt61ozLVkGqfB81usmFC2L?=
 =?us-ascii?Q?43Spn2ODBPTvMytFsIV8AHYY5vaFB24+e5r9J27UQO5msjgAMEpsHK0jhFij?=
 =?us-ascii?Q?fcSp2Usyo1++MHxiL/8g10cDbPfPU/uROegLL0iM/0qEwM2j5Rk+/KJdwqKw?=
 =?us-ascii?Q?jDD0iGdPIfzGnr8BqE0pJEPB0hNUZk9CiH/6JsfJKx2BbAc50nQULZgtXJzu?=
 =?us-ascii?Q?R8AWWYMH0wT1q/BEzBZVXHEPq/g3tXWP/4YT+RvE2kKOKcYaXFYZhNLrMavZ?=
 =?us-ascii?Q?lIe/qd7svU7I9fbl5Jdd/c3X6IKiEDL3f8A0IlxwKUNuhPP4cVSakqUiQ1+i?=
 =?us-ascii?Q?I46K/HrXcT5E5QxYv4t5TxSbv/40QHlA1Tk+E7b3//uDUMx3817iKZT0cguk?=
 =?us-ascii?Q?zf/9q8zYxFcwB23P9OWw8y2lokX+7FxDCeFRinPIj8SHxFGabPXMYbnWiSyO?=
 =?us-ascii?Q?7FR7MXbidAWutAvhrRxUgoooM2xyM9OAkYhF0B1668+xD0YTZMLgfur0qu9I?=
 =?us-ascii?Q?kqKdxW8hXHimKKp9wgadlnk6N7a0D8qeQ/RA0ejuXIppW4bstwYhFWb8WIqq?=
 =?us-ascii?Q?xYjBLyt47cScfQaDy78srMD8XmmldxskMqQknYBvyNy29Lgj8wkMQm932FTy?=
 =?us-ascii?Q?ZiIKyUSJjWhjCGC7zdfDs7vt3viORg5/qQxw/oTyKJVa24SiAF1tb2+cQ3FG?=
 =?us-ascii?Q?earL+faWNR7u1vTKo9c/NLzDYI2uD/Jkox4rNWwXRr8REXKmI+MljbtKZUm+?=
 =?us-ascii?Q?jjIxrRCnGFptZ8g2Lj+wBMJYCR+utTCkxlLHXM6ul99it81dlrP8dpBwHdNG?=
 =?us-ascii?Q?gHHolB8eent44YVcWoDQagy+mdTD5wRwrUCncBTG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d9a6f2-823a-41b1-6a4b-08ddb856137e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 04:16:40.3018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9278nofEKwpkIJH/IbDoE6xqBJHOA7vSE+Zpr6stLB6lhTwS+WGROaomCzWuzecZVx4fpCPyh/JedHzcrNOlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAxOSBTYWx0ZWRfXw1Wm2hPQvEPd Y2fBpdGFQRd8CHbMIydmMKKNo3dkikJPdurS50ZRP2iBwMH3ANnyrVscDFql3HFsLjVq2mIOXkz p3kyNSX+h+1BxSKZnYN+H83e288XuYOSJ6vQm0HzYoAjlEKzI6xFUwhYnsxBvPCDN0KtpMXSG8c
 /6VXu5KNOeGl9QO2f5cDy1A6gHO0UdB0VdL1keLQVvKsPTis4kr9p7F6k54+9hPTKYnNYhTabz7 Dz0gf5OU5DIYYWgdT5sxEcFiYNwl2xYH/C5cSIqbKlvQvOam+Fle9GWQv1RTKES9DPUWRJR3bup f5pipZqsSYbs6K1qzpX6dt8dONxjlDpSZdZv1WlmBDCYYrOZwow368KdrUMH/3mCDV3ZJ4U9B2Z
 aw7LMt9/14ZppKY10RHe+Xpi8ZV93nSigD3BOx17rB7cJ2PusrAQoF00CbxUZGBwUXl8Z/u9
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6863612a cx=c_pps a=wO3+TZ7jtUSqNLRYPoW+yQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=rcHQxUATEmcyXpDv5zwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-GUID: 17vb6E1-Wop2v5ZjYgLfqvmjsyTm0Clk
X-Proofpoint-ORIG-GUID: 17vb6E1-Wop2v5ZjYgLfqvmjsyTm0Clk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 04:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219544

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.
The patch is adjusted to fit 9.0 version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 113 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
new file mode 100644
index 0000000000..34434a65fa
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
@@ -0,0 +1,113 @@
+From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 20 May 2025 16:03:44 +0100
+Subject: [PATCH] sort: fix buffer under-read (CWE-127)
+
+* src/sort.c (begfield): Check pointer adjustment
+to avoid Out-of-range pointer offset (CWE-823).
+(limfield): Likewise.
+* tests/sort/sort-field-limit.sh: Add a new test,
+which triggers with ASAN or Valgrind.
+* tests/local.mk: Reference the new test.
+* NEWS: Mention bug fix introduced in v7.2 (2009).
+Fixes https://bugs.gnu.org/78507
+
+CVE: CVE-2025-5278
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
+[Adjusted for 9.0 version]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sort.c                     | 12 ++++++++++--
+ tests/local.mk                 |  1 +
+ tests/misc/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+), 2 deletions(-)
+ create mode 100755 tests/misc/sort-field-limit.sh
+
+diff --git a/src/sort.c b/src/sort.c
+index 5f4c817de..07b96d34b 100644
+--- a/src/sort.c
++++ b/src/sort.c
+@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct keyfield const *key)
+       ++ptr;
+ 
+   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
+-  ptr = MIN (lim, ptr + schar);
++  size_t remaining_bytes = lim - ptr;
++  if (schar < remaining_bytes)
++    ptr += schar;
++  else
++    ptr = lim;
+ 
+   return ptr;
+ }
+@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct keyfield const *key)
+           ++ptr;
+ 
+       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
+-      ptr = MIN (lim, ptr + echar);
++      size_t remaining_bytes = lim - ptr;
++      if (echar < remaining_bytes)
++        ptr += echar;
++      else
++        ptr = lim;
+     }
+ 
+   return ptr;
+diff --git a/tests/local.mk b/tests/local.mk
+index 228d0e368..ced85c44c 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -373,6 +373,7 @@ all_tests =					\
+   tests/misc/sort-debug-keys.sh			\
+   tests/misc/sort-debug-warn.sh			\
+   tests/misc/sort-discrim.sh			\
++  tests/misc/sort-field-limit.sh		\
+   tests/misc/sort-files0-from.pl		\
+   tests/misc/sort-float.sh			\
+   tests/misc/sort-h-thousands-sep.sh		\
+diff --git a/tests/misc/sort-field-limit.sh b/tests/misc/sort-field-limit.sh
+new file mode 100755
+index 000000000..52d8e1d17
+--- /dev/null
++++ b/tests/misc/sort-field-limit.sh
+@@ -0,0 +1,35 @@
++#!/bin/sh
++# From 7.2-9.7, this would trigger an out of bounds mem read
++
++# Copyright (C) 2025 Free Software Foundation, Inc.
++
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 3 of the License, or
++# (at your option) any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
++
++. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
++print_ver_ sort
++getlimits_
++
++# This issue triggers with valgrind or ASAN
++valgrind --error-exitcode=1 sort --version 2>/dev/null &&
++  VALGRIND='valgrind --error-exitcode=1'
++
++{ printf '%s\n' aa bb; } > in || framework_failure_
++
++_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index 1cce9192ec..7c975708f4 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
+           file://CVE-2025-5278.patch \
            file://run-ptest \
            file://0001-split-do-not-shrink-hold-buffer.patch \
            "
-- 
2.34.1


