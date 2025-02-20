Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C91C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 13:24:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.48928.1740057886170281482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 05:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4146f1a53a=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6RWHd027942
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 13:24:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00jacn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 13:24:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9tBaolaGCnERhsQJLaAweXDxkWqUAqzjVHWkAsaLBQmOcvanaUwGq2/UWu5/Jooi1/V7tDGpYz8c72zTqpau+3qJMUIE1iOUCMCQ7D7mnGPV/5pQ+hMhgVaRWW6UTIbtyZFC3H2idSXciamZQjyAlJuALkd2zHvfP9P/Se5wfsns5Lpa/gtAMHCmKnSRGa+BFugTCJGQKYeprF3czGKnVbhG3u9b9M97QPZDQiSkeNFxquuDPLpsfZ6IJmPmJgvQHfb3xSETYKfNC1bBVGtM+PFk6Z3+XJkkhzZLOwS2GiN6JWftAoHAxW/ouMJ1OT0IR1VMMC7+kgXfV7XGnxjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4Y43ty9eFhMK63TvpFJ21wwN2MiB4w08bvJY+3hJv8=;
 b=DXVIDoQC/XM5/tdSQcthv+Ru7larMosFhD/rBUSnpA3hrfpydUC5QD2UCtVGgXo2NsGy4wWAM7Kf6SKCzrU8ksHV+raEsRNiWvxWS7uDI6VHukSRDQRYT3YvSFC8rq/gDS5SteFGCTXeCemkD4tIpe2n6rRXY2Nwwnu/0CDDD58HPWVLclAByr6Rh8QBUPrjIWz2BH1fb9rKafsZJN8M+EjMrlp405y+plba0LuWqOiwEWkwMfiyT08j52TJnEWIBqqGLm2Z2coQFFrK5shxj181mKzNq3tn6D1WSYkQNDl0zCS/iQlL6HatfBuUm6PfDV+5vY5K/MhEQhB8LlLTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 13:24:30 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 13:24:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3] debugedit: fix build failure when enabling DEBUG_BUILD
Date: Thu, 20 Feb 2025 05:24:19 -0800
Message-Id: <20250220132419.2309976-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 2305d94f-c54c-444d-cf78-08dd51b1e7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qX+fROUYaIB92P46RJ6gR5h4vLbNcnq8ynIIQIffU4nzqlKYs4BnspSpfDyd?=
 =?us-ascii?Q?bwK/q6md3rg21cruBNipTfGtok0bqkmsSRLwoE/rrqjLO5Aas2785P9AtNcJ?=
 =?us-ascii?Q?cyHjdzULQoeDsEVK2zrrtsUX/O/mdlW4Z3dokkNQcqV600uoL4AIabw1UvTt?=
 =?us-ascii?Q?0awmq0fJDVXKGVSO06Z+lIQ1VLeClQbD+0nO/IZsk+K4GfXkZ9zDWUyc8lyu?=
 =?us-ascii?Q?q/OXQhq2DWf2Rws1olkiYMM7KRGanBc2RNBroIGXn4CHLC+3lG+qwod4swch?=
 =?us-ascii?Q?z/0LzCZb6w3E01Ng2QvfScm8JIR4cz/rfsBcQXssNDQyOQOrmn007NKWF0J4?=
 =?us-ascii?Q?L/cK2wnxJMLtbrrubU6rHhn8G6cC40/Z5WzJYuUQ1o9AzPZ+IQUC0sXvCfp0?=
 =?us-ascii?Q?agH8wX3aWMJP33x4wLkHRXC6MkyDtbRGsKXUrATRaZIoT8RN5Yogl5C4dj7q?=
 =?us-ascii?Q?oIb5oyvaPsW4cgeB90PKxyM1m1gSjLMPZq/kRO/qhSWXKUnBTYaoOkv8a/3f?=
 =?us-ascii?Q?E6xbK7IOJalO7KPmIRMbQY9F1Rp5lAiuSvtLGgWCjKCL4su+4uAkmEvlxdnm?=
 =?us-ascii?Q?H/Ovqq5uxIY4dayoXim28KAwSDVtRAU3yiZntLVFhBIdZdmKickDlTSK6Js1?=
 =?us-ascii?Q?7gMnuI+pLEitlDidIXcmwXI78Dmx4J8IuPgNUf3PnX/0vinQDqFY9WSD8CPx?=
 =?us-ascii?Q?umWO20B6+WABg1WvjuHnqKRJ/DzQqxqSOnUlROdip2mVdGZC1xr1yqKJvvhh?=
 =?us-ascii?Q?j4l6zaEoCpOcmEM5q+WDDlH7ufoWWibCg4yMvnWZff5GxKa9mHBj57tfRjeF?=
 =?us-ascii?Q?xcbRQOEqAdDMRuRn0hYtmczye6cTJHMOF9p7neqYRYbaUD1GBWwfO0SR0/MM?=
 =?us-ascii?Q?4VM1/CwboWqkwLqIr6qxLZsjVwUVuuKXGeoAfJ0cfO0vh8L4RIR2i++ve3rl?=
 =?us-ascii?Q?8KnQZXx43qs/JKoDvIisMYi1x/0kMppuSC26YuMyTMCV8XuLkPbowyFC/FFf?=
 =?us-ascii?Q?ckimhrbTrTAJQmXc6mc3oQfiRYTtYAWyjrw9TiZWRdwqhT3jH20HPgF8z9sd?=
 =?us-ascii?Q?M/etxgz8xZTZxSXCxKg9VVq5uu4wlm9HWhdILZhhGUyz1JR7x528jxCEs+0K?=
 =?us-ascii?Q?GsK5sdwXCSXWWufWK2Y0T5nyC9DCQo3hkKtIz8bopT6Sbl7ErGoZObgdeH9s?=
 =?us-ascii?Q?9M8t5pU3xeCw1AdAJFUYrB+cCvSV4A8hFC76b7Gf7BOJ65pUwAhoHpC3Bb9P?=
 =?us-ascii?Q?Zinx3axzGnBGML4CGfxe17w5Ixaby3rnU29ABLNSFjpd/MbEP46JyqYAwZMf?=
 =?us-ascii?Q?1sIXnX8xO5ZEWrV901PrJUZgHm+7gp1joMhjapfeOdaJF/z4gyBCr3eakeLG?=
 =?us-ascii?Q?doF0+OqEqH0mIZiJ5U93G53cQCeBevQlWxNtwRyqH4MJPTHePA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jJMDKZi7ZIL3FbnTeqPhoAGyiUIraEDseg+YWeTSr198G8KAKCoQrY//BYV2?=
 =?us-ascii?Q?7p3VTIa4y+YC2NRsUmrP/v+kqjjX60QyfnZL6LEoAbMZ+Jff62XGssS6Jn4H?=
 =?us-ascii?Q?RoINaONcbz88F/4gyCVy6+cMlkqBDBOx7oLBKF8dDTV07ZWu6vxSMlqnoHNW?=
 =?us-ascii?Q?t/7WRbAsTo9HLcuNw0Zd/MtKtITWN4zFZGUGezwEpOgk1t4m9YpYvt7wRbG9?=
 =?us-ascii?Q?r23JSnnZ4KrwATEaEvBO2VAS0JE5Xl27lDuOtSFmkWC1GzRujdqEB0AGABdM?=
 =?us-ascii?Q?WQUO+GY8Y84dhMBDjh/vrSlHlQJKxsSI9OPlyQ68f+Pq4NF6a+60btaG+3wj?=
 =?us-ascii?Q?v7mlh6g7W93t9tJ+evf1mT6HaZnODuXE+0uy2cqXpWrwThpsXJoHgq0bwwdO?=
 =?us-ascii?Q?utd15u6wyCaWWLCsWutYs87lbfl2XJXpgPWaOpk6S45usmRBInO5Uf57fjej?=
 =?us-ascii?Q?ZMDj0IauSwljBh777kaqAV7Dpxn0JNuSKSXv3CYJ5R+ZBlnRbISZBqQVhHS5?=
 =?us-ascii?Q?A/4JF98L09jeuOkotBDzUgCYilZL0o8sMjHO1tc87tMKmffCf+MNWyWBg7+x?=
 =?us-ascii?Q?TzkPUQL1mX2/JJaLEKL4/bzU14MmukbRpC2GiFvhBc5YNyEKqkKZ/lOsAava?=
 =?us-ascii?Q?7bEH2EgWYzpu5lqDgekO/Z5PEYa4YDO35tCdogPq0dCQVwSy+SDHQg3zq9lZ?=
 =?us-ascii?Q?ZBClHRR/1MvoN2CLKANSYNMyTgL5a4EJ44Xq+5RO1k1pwGg2gWoVco1bWE79?=
 =?us-ascii?Q?kHRs9gV5Z3ebCRfvqUWDRsvvgB6M6vKdNy4XjP+OePpMwfGK/6o55bq6boIC?=
 =?us-ascii?Q?EdXPBdr7Au+HR3FHpAnU7dJ3Xa770Y8kjzjpGbO31WDqp5ClPAWlbl7i0FyF?=
 =?us-ascii?Q?aTyG8mGN2lDqCOJJrO71VnNnJVrNYRmZetJ9jWsJFgtB1KOx+sprVl0vLBZL?=
 =?us-ascii?Q?SpJY3eBOtEtzodttcTJluGDv+I1c0xB23yKsrlKgefjsngrW3QWYwRtvUkSW?=
 =?us-ascii?Q?JEvacXCurp1sMZzq8LOTmsW2ZYUkcxihdxRJoTVtSRQuG90lW0D7ImFDMNhL?=
 =?us-ascii?Q?zZgbmCkbkTzLaJ0HSm2lw8gwx999zL8MzjbzoFxG5SZaEgMAwqNhYB7YEr/b?=
 =?us-ascii?Q?d0KGPqj84qvSqzwTM6UGtoeyvYlCt0JkDduTXQpZ17deVf8BPL/67V2Z7Z/X?=
 =?us-ascii?Q?MVZ2susro8s5gXp0nXU4Igg6XL+9D4r7vQktbQTu+FdtKCBtzDxbdm5dWM3j?=
 =?us-ascii?Q?MIYnXTFI0sPrKK92di0F0I4Hdbrtb9gXskOZGrri0ng5Ks1P2vfurxnXX8Xi?=
 =?us-ascii?Q?K2v8SGP96WnzdXlbMG25vEMZAFTJU8/6UZ08RpXIzIUO3No427YPOP7nKunL?=
 =?us-ascii?Q?hCJCgaJi8XwDYrnHFpHIDSqWwDPCALLNtrCkNUbS9Rve6efTLEk7UcY0D2eX?=
 =?us-ascii?Q?Ne0DyRXSSsGjAh7jlYS4gnbXrLLZ6/SX/lrYWvXah/5tJ7jRQAqgO4gaGSpo?=
 =?us-ascii?Q?PTx4oBOxDerXSl1UoA/pOhOsR9a1BvXEtRlCFStmW2axzDe1DOiOBWrimbaE?=
 =?us-ascii?Q?21V42i71AW1hqs550SjKsd9NI1xwT8EVsc/Y2UOr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2305d94f-c54c-444d-cf78-08dd51b1e7eb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 13:24:30.0868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxeLzUoNZ7npuQsWg69rTSHeswgMoTQ67CfTRw7DyQdWWG4wTF1UXENaK3To41744ZZIo5oqHIzzk3YJekCwLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
X-Proofpoint-GUID: ShoNUnzNJmsPaPzj88dVd-xv3B_3bGZj
X-Authority-Analysis: v=2.4 cv=I4GfRMgg c=1 sm=1 tr=0 ts=67b72d1d cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=CCpqsmhAAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=mYDd1H_A-FZWCmvCkM0A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ShoNUnzNJmsPaPzj88dVd-xv3B_3bGZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 13:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211757

From: Chen Qi <Qi.Chen@windriver.com>

When DEBUG_BUILD is enabled, we use "-Og" gcc options. In such
case, the xxhash functions are considered not inline, yet debugedit.c
defined XXH_INLINE_ALL to force inline, thus causing build failure.

Backport a patch which add "--disable-inlined-xxhash" option and
make debugedit use that option when DEBUG_BUILD is enabled.

The 0003-Makefile.am-do-not-update-manual.patch is moved from musl
specific patch to SRC_URI, because we now have a patch to modify debugedit.c
and this will cause manual to be generated again. This is unnecessary and
will report help2man missing.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../debugedit/debugedit_5.1.bb                |  6 +-
 ...on-to-allow-disabling-inlined-xxhash.patch | 81 +++++++++++++++++++
 2 files changed, 84 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.1.bb b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
index 00c40473c4..384909a36f 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.1.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
@@ -10,9 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
-           "
-
-SRC_URI:append:libc-musl = "\
+           file://0001-Add-option-to-allow-disabling-inlined-xxhash.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
 
@@ -25,6 +23,8 @@ inherit pkgconfig autotools multilib_script
 
 RDEPENDS:${PN} += "bash elfutils-binutils"
 
+EXTRA_OECONF = "${@oe.utils.vartrue('DEBUG_BUILD', '--disable-inlined-xxhash', '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/find-debuginfo"
diff --git a/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch b/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch
new file mode 100644
index 0000000000..3aac43628b
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch
@@ -0,0 +1,81 @@
+From 820498e881401a6f4b1715dc6831da965f6e1d69 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 18 Feb 2025 18:50:46 -0800
+Subject: [PATCH] Add option to allow disabling inlined xxhash
+
+xxhash cannot always inline. For example, when using gcc14 and
+'-Og' option, xxhash cannot inline. See links below:
+https://github.com/Cyan4973/xxHash/commit/574aabad87b2ab9440403e92e1075ef48554eb87
+https://github.com/Cyan4973/xxHash/issues/943#issuecomment-2563205130
+
+To allow users successfully build debugedit with gcc14 and "-Og" option,
+add an option to allow disabling inlined xxhash.
+
+This patch refers to a similar patch for libabigail:
+https://sourceware.org/cgit/libabigail/commit/?id=50497911e2590c21270e0763d277457cf7752c3f
+
+Note that the default remains using inlined xxhash.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Upstream-Status: Backport [https://sourceware.org/cgit/debugedit/commit/?id=820498e881401a6f4b1715dc6831da965f6e1d69]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am       |  4 ++--
+ configure.ac      | 11 +++++++++++
+ tools/debugedit.c |  1 -
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c590edf..35fd947 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -42,8 +42,8 @@ find-debuginfo: $(top_srcdir)/scripts/find-debuginfo.in Makefile
+ 
+ debugedit_SOURCES = tools/debugedit.c \
+ 		    tools/hashtab.c 
+-debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ $(AM_CFLAGS)
+-debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@
++debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ @XXHASH_CFLAGS@ $(AM_CFLAGS)
++debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@ @XXHASH_LIBS@
+ 
+ sepdebugcrcfix_SOURCES = tools/sepdebugcrcfix.c
+ sepdebugcrcfix_CFLAGS = @LIBELF_CFLAGS@ $(AM_CFLAGS)
+diff --git a/configure.ac b/configure.ac
+index a5a6e28..32dd27d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -181,6 +181,17 @@ else
+ fi
+ AC_SUBST([READELF_VERSION_OK])
+ 
++ENABLE_INLINED_XXHASH=yes
++AC_ARG_ENABLE(inlined-xxhash,
++	AS_HELP_STRING([--disable-inlined-xxhash], [disable the inlined-only version of xxhash library]),
++	ENABLE_INLINED_XXHASH=$enableval,
++	ENABLE_INLINED_XXHASH=yes)
++
++if test x$ENABLE_INLINED_XXHASH = xyes; then
++	XXHASH_CFLAGS="$XXHASH_CFLAGS -DXXH_INLINE_ALL"
++	XXHASH_LIBS=""
++fi
++
+ # And generate the output files.
+ AC_CONFIG_FILES([Makefile])
+ AC_OUTPUT
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index beefd65..43f9cee 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -82,7 +82,6 @@ typedef struct Ebl_Strtab	Strtab;
+ 
+ #include "tools/hashtab.h"
+ 
+-#define XXH_INLINE_ALL
+ #include "xxhash.h"
+ 
+ #define DW_TAG_partial_unit 0x3c
+-- 
+2.25.1
+
-- 
2.25.1


