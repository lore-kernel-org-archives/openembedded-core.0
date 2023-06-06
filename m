Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F68C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 06:47:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2874.1686034040848598028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 23:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5521095c00=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3565gWsa024481
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 06:47:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8j7de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 06:47:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP+4k0fOZgS9QITlLCVVh+ELXsGtHzGgVxi183mRV+67hXShATrQW+5LWKDy+Y0OT3Encr7YhJNCOyT10SvzB71PDcIMXLHNPB5emnHOksFcs25rwgJM2fN83Dt4AVaKTsyB8ymyTnhVdIIqs0lJmXuXUWjFSIEBKAhhG0o9tiH97ROwP2a7WocUy+fT/LU166HfRbKVG1UlpKrcDiwZ8p725xGDK344Axgq9S0Y+35sgpeJ+2NiOW2ZJ/FwvjtBggX7Z7EFoaVgZ3ByMdFutp0kXHoctfK2/aBcH0vxecUL6VWwC1tA/vDiviShnU0sEGoUxG54VWxKwdFotsuGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpwaSzF6YRunGk+5uZevql48bOME8wFtxodB/0sQuAM=;
 b=SSYFj7NPHCOvt3R27u1/RcHOF8is31m+5zL12ILqcbo0xXTqKJCqy2nzYEoEbaJwbr5K2vdQMiFCK3iMLQo+ykMNFcOgLwjR1C+cTdmftGopGagUKLzsUDkcz9D/n8Ctnr4P1nosgmHmdArx/7g5VqpNKnc3Ins4mPtlYKFWVFahKUwaXi38jzsHuAvWHYQoA9OeuSzzESegPJV3bmdT25/iblZnBJGd9oPjE4p3Fsy0L5zvQAy0m475ezDXRjEtTyWLNgpNUvArD9zdM3nMhAVTJd6hrpx7cnSgUB8XRauTCkn0J5FuLeAAB4FUGfzOQRGqm2cqNUVUDQxihdyIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 06:47:15 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Tue, 6 Jun 2023
 06:47:15 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][mickledore][PATCH] sysstat: Fix CVE-2023-33204
Date: Tue,  6 Jun 2023 14:46:58 +0800
Message-Id: <20230606064658.1161189-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e75de58-56bd-4460-914c-08db6659dcfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FwPtzZrm7q6c2CVbAOLgV3kgzq6RQDHKCAmkdWqRtKykoZ//0M61hTXR1tP+oPRgjHxkFv6Gw6bUApTBQkU5b7uYtoDO075EWf66yCEfhX1bq/WmD2qgwEDohESsEXbKek6xkCfx0cpYVJFeQbShsRBQdzlOR+G1KKBlX3MSyjAaAEbRqNMKQfPjIgkaRktO1YgBjTPsuVu7vB1sQPz0+UFkW4TTDQpHrpwsbszsVAZA8d9XKcTvhIpD+u13vEfnaBxVa1nDzbUupmutkeroGDcHAOOUfcBrbeXYPlDPbD4RDQ04nllsXzh+kxgQGaYtaa2d1FoZ32tqMVkSZywhZrlzRTNU/f5utKx6lurUgX80gEC3DiXRGlC8j06L94YPsGjENo6eEeC+B9DwZ81iBXZqOYu9D4FoOKf6apBO9fqhGOVuGnST6Zttx8v7ziFa30uDNv5B/tMXXnjrRYDbEBEpBNk+XxHKkcEGE0n5UoYISj8f5G5VlmBBun0pXiDdaidvkdhecGvYfnEDljQwgBetAzx6s/k7JfoyjNRFmtiPfnSksPwWouZyGz5nOse+LnDUwslz/VtkRANF/1WoDpTdCcgtExKeupMbHl9hLqY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(451199021)(2906002)(478600001)(316002)(41300700001)(44832011)(5660300002)(52116002)(6486002)(6916009)(66946007)(8936002)(66476007)(66556008)(6666004)(8676002)(6512007)(26005)(1076003)(6506007)(966005)(83170400001)(2616005)(186003)(83380400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dyJSvtG515zN7BUHRib/6+niyxzZ85LI0D2uVfgUo8uHTAuLEUaXvl1ZJwCv?=
 =?us-ascii?Q?P9NSXkB3Xcww1zEbIFHbmIbwcmUaIUEyqZ9U7XA3QTl8RJu7LlvO31euoSgq?=
 =?us-ascii?Q?re9H9fG3d6LfNGrjJgnVzNm27ML9GVWB25nmnxNNUXYPm2KYgyhq/NeA2eWl?=
 =?us-ascii?Q?f2X3VbkSFc/MP3ramHzja1e46qZ2Zu63o7XRWm/UcsuClNgWG8hcjCBzbU8q?=
 =?us-ascii?Q?f/m4C3xP+JtBljSR9tzi7cYTlkXi+ER/ncKhKs4ZeurKNVlTW0bqJiTjIb7g?=
 =?us-ascii?Q?jbH0SXm8GJ1pD4yjUF3W7A8u9AmmvymSrnPU/fqL/pGr/2CGVEfWuoFSxfzG?=
 =?us-ascii?Q?aWAyExSoTJlZ9mrFxLYP0HgBmoUiMVeQW0oZ3HTssxtZgVUTsN8tg+5kyikH?=
 =?us-ascii?Q?rYEg/8ndfWNJWiTKDjXRkIF9BBClYoJxfpKQ+w3RMgmpFaJhGwmEk2iaN6O1?=
 =?us-ascii?Q?pCLfsdu7sRhRTg3US1BH1jDS+AIIU+NiyZFfNfv8hoZulzsskK/8hjEvHw/d?=
 =?us-ascii?Q?jnrZ/h15Jh8V2WpBQszVmOF2UM8ksRKI3XjGKmXrFHIDXY6mE2PXTzbQdNY9?=
 =?us-ascii?Q?QfkloyZKuTbUbjKDWMCPacxxcTIF4Kf/R+gZPSKQz5JCylVufQ7CTEMmZCZZ?=
 =?us-ascii?Q?ibwfz9kTSTfO39LG/WPx80EVect3+Z0xTvnRwpDkGpvt1GW8fvGJLSdl58ry?=
 =?us-ascii?Q?Ae6hQWkd+HlaMVMzC/vU2HCxtwk0BEVrkAbu+29FbRKRH2KyUL+TuQ0jN+e2?=
 =?us-ascii?Q?o/U++WYRRLPvhbRsGagQftwsttHXplELioWWhMmczFUSceRoFGy+1gwGwuJo?=
 =?us-ascii?Q?bleNgLOBmr8QZX7rF2djM0H49gOzp5AFWU8JT2oxckK9jWNu0dFDYphwRzRU?=
 =?us-ascii?Q?5ifagm36RfTvWLS69f2+osrzQ0EtsVzGUD1TJ93nMC5Gxm9uPnLM5HB9Buj6?=
 =?us-ascii?Q?/EVfDy8h5DNsnYEdw2/AHUddptaaFwHp4O1Z2+Xh+K06P3p6r6XKV5GYkvVG?=
 =?us-ascii?Q?FE1Z8gucYCqZutw4ko4t0RVSkLqqoY1kKxlp70rVeXum0bJAb3l3T+YlW9Te?=
 =?us-ascii?Q?qiZnyenF/g8NfHRgYKex+uwvwjZDsax1KRZ9jgxcrMlmXmLdL1AzEOjdAxIF?=
 =?us-ascii?Q?FsJhBiRAsf9uCmwNN1sbuQ6Oc7qbpStRIgTygTzE4z24Ii6/npMSIQHTKsl7?=
 =?us-ascii?Q?xJBe6FBt13r5jCHihzYKyKi3exU0dy63WAPJRmGmoZhMKgK0VV9epAymwYpv?=
 =?us-ascii?Q?RtkRWq4wko/BooBMUM+c0ofRlOJxENzttmVy79Zeu/B8zeFGFrnG1VZGjQ0D?=
 =?us-ascii?Q?tK/yOFL/vby28yuNDa4htOQKwTT68uduXmuaxHqLSurqf0ixoWT3U/KtK3Bw?=
 =?us-ascii?Q?axz7Is0AT2nyHS4kCJK+LA2aV4NLJivN4SluDVqdj6Q7i7QpwYN/W/2U1ngo?=
 =?us-ascii?Q?L7F8csnhA9PmU81qsE9UAm5U25LePJYHyIxM7fsSEjm0DwWF4QN0W5YYnLw+?=
 =?us-ascii?Q?64FGPFCV1zzZLwA48U/3pjtdhibJ3Pzs+HEjsd2gpMaIwGOUzz0600lj1xvR?=
 =?us-ascii?Q?myOgEVIo3Rw3PC/1vlqI69os2ImbRItptyog6nt58XJ+SBVrk8Afos1oGuVn?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e75de58-56bd-4460-914c-08db6659dcfc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 06:47:15.0470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrk5/9zwqFnpSz2gK21wgN5H/g5+iunBNZOJFnR+0kzPg4/yLLqKCJWHITroo9DW5AN0HyjzozFGDO9LIN290FDQ606FhyITr2IbcE4cFPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
X-Proofpoint-ORIG-GUID: X4Rc-RlP6uaghq-CYF4LEsr2inGsh7wT
X-Proofpoint-GUID: X4Rc-RlP6uaghq-CYF4LEsr2inGsh7wT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_04,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=693
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 06:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182415

From: Xiangyu Chen <xiangyu.chen@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-33204
https://ubuntu.com/security/CVE-2023-33204

Upstream Patch:
https://github.com/sysstat/sysstat/commit/954ff2e2673c

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a6871590b908e4b749484d913da5e280c20d05f)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 46 +++++++++++++++++++
 .../sysstat/sysstat_12.6.2.bb                 |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..a7b51f3217
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,46 @@
+From 0764cb56df4a5afdf04980c9eb6735f789f5aa42 Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@cloudlinux.com>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+CVE: CVE-2023-33204
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/954ff2e2673c]
+
+Backport Changes:
+Adopt additional changes as per following merge commit of pull request:
+https://github.com/sysstat/sysstat/commit/6f8dc568e6ab
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
+---
+ common.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/common.c b/common.c
+index a3d31a5..138920c 100644
+--- a/common.c
++++ b/common.c
+@@ -447,15 +447,17 @@ int check_dir(char *dirname)
+ void check_overflow(unsigned int val1, unsigned int val2,
+ 		    unsigned int val3)
+ {
+-	if ((unsigned long long) val1 * (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 != 0) && (val2 != 0) && (val3 != 0) &&
++		(((unsigned long long)UINT_MAX / (unsigned long long)val1 <
++		(unsigned long long)val2) ||
++		((unsigned long long)UINT_MAX / ((unsigned long long)val1 *
++		(unsigned long long)val2) < (unsigned long long)val3))) {
+ #ifdef DEBUG
+-		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+-			__FUNCTION__, (unsigned long long) val1 * (unsigned long long) val2 *
+-			(unsigned long long) val3);
++		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
++			__FUNCTION__, val1, val2, val3);
+ #endif
+ 	exit(4);
+-		}
++	}
+ }
+ 
+ #ifndef SOURCE_SADC
diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
index f9e5778e76..b5014eaefb 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
@@ -2,6 +2,8 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
+SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
+            file://CVE-2023-33204.patch \
+            "
 
 SRC_URI[sha256sum] = "3e77134aedaa6fc57d9745da67edfd8990e19adee71ac47196229261c563fb48"
-- 
2.34.1


