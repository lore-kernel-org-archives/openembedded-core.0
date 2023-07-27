Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B721EC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 02:25:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4330.1690424754918948922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 19:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SktHXQrD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65722416f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R0UnR2018256
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 19:25:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=expQezuWumkLFiCjE1
	5m0SU8EszuGHkwKUKfgK2awBY=; b=SktHXQrDTXqC/K2Wtwb/brKNLbr7vRIOUl
	tRjyit6l7UV7TTUwq2HmHjcyaCmKHl2AW8f0pQVg5woR4ndf1C//pXUv1D1xOEcF
	hmgzvrZel7YPzJ6kaApwMg6xmqPrzBKBKSsUhgNcDtvSK7HMvRNSMp3BjlRchRYb
	7uvi7ZUmMcPT1xdLBfTRE4FTpmRmWFNJ0SSZTSfcuhYQIa5d0alTkzUsgzcTM3/b
	blc0/qcQIFtXOTmYFI1amqJ+Eom06gEWPLLqU1wncKqR6+j17xUAQXJTHJ8z0eYu
	f64PEbK+uwHYz70EpvYK9DBI/l5z2/MVwQ+G3lLaiyhLNx0RC5qw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad040n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 19:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqgy6/rnD/WI9hxu8ty3gJlPU/aeHKusvb77xQtZhIJn4pQmkhL6Pz1SEi3DkRV0EhoVkE5ZBxYMZL3mdCXUL95jxLKcKqFuRM5xIVKExSTCXY5dhA57nxx0UfaMMbfJEBMCqncG/PCeNJV5OOUh6QU3yfzd3pmzGVvg5N18U8vvpfPuD0JTgVFQ+cNT0047n8JitzFOaZwMCZxoXhF7kA/8AItGDc2azNDNOcfGoOQpxbyqq8Ud6VkdvGqlr/6HUGZ6KHsANL6foxfp2DXiZ2Nuid0SLk6YqQji58tpSRsEw1u8e02CKhSgD5d15Gzr2Zktrlwvc5XHo0pO185hpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=expQezuWumkLFiCjE15m0SU8EszuGHkwKUKfgK2awBY=;
 b=RQmShXRqny6qx7TzpeCoJiJG3QHtKMFa8/uFiaR0DB9h7MQ2bwX2TkLSl9nb4E/G1cu13Avpfe09u7DI4SxCRu4mlfN5i/yfL0nZ63KHqFgUL8Zc3QNNkfFCFfR3kczjtF/7DGRT/XWspE7VlePQ7lJTCM/aSzxf2b5Rw+8oWqcVN4kwnyr7j7kW8vNRURkKMTvTAwMFCjttqCF5bm6VgDSiM+bNlMLBGQTB+K4sslMpO03i+FDdERV77nisEeUmSP/YoyR6R9LxuRstgMD9xAFYeOMh91wDU/a5CV6HrTEHv4g2WojeeG3zavjjng4Ijy5UGECiCFuzCawwg0ZvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 02:25:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c60b:b353:ba77:8cb3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c60b:b353:ba77:8cb3%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 02:25:51 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] ncurses: upgrade to 6.4+20230625
Date: Wed, 26 Jul 2023 19:25:39 -0700
Message-Id: <20230727022539.2478131-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ff88f9-fb50-4315-8d60-08db8e48cc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IqLNCnm4AHeht+R2ohlQUdLeQvgv3K7lv/zBiWjCZbS9qixZ0IrXbkLywZyUqZMBKj3sCaFfQMCV1UlDWR4MDL0ANXB2+Nk6vT42Z/xm1O9ViwyDqUdDmN4k8kUHwBvk8HuEbykXMY4UwWEG03YKoVdQipKemLoCLO22j5yXauT8otR5UzrFGW9DFup7X5nRoDhYbpL/d39ecMQLRQ/VmkYdNjYVmjZsqDLkmFq1B5hmEmOQNJif/ToRMyEd+UPuR87GEO5rjxVf8R8GGCZxu13icaRuoYiDKSMdnd2d3hYikg2YaO0I5bJwnvHEdhNPBHcXst2DpLXeLE8B5LPtnwG/exZi/35YMqTe9KxN2j9as6th030hqtg0/RWiBHDQqLNi0BYIYwj1bTllyK/NbaaCG1Bu5xJz96MfzFHbhGEdljg1vz5OvR5Vf8MZ8Sbbr5AmeRyul80+3OdTz+W5CGgyKzemLFCPpKy1oSqu1TRfqS9Yzc8vt7ogwh5IBbj+fZM3Tj++jwHWXvkUSzbeyM8soAWEDDtTJakmdiFegK9fxV1U8RDL6Y6jbs4M8tua9//2pgZqTahu7/1Si5ruZKbjH97Fm8Ty5aPFjc1h6F3SfNm1q1C2Azb2tI2HxrmxuX0X4VugYsns6YlSQNnDVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39850400004)(366004)(136003)(451199021)(1076003)(26005)(6506007)(478600001)(53546011)(186003)(52116002)(6666004)(6486002)(66476007)(6916009)(2616005)(9686003)(6512007)(66556008)(83380400001)(38100700002)(38350700002)(66946007)(5660300002)(41300700001)(316002)(2906002)(8676002)(8936002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z/gYvQoEFRJi8Q8bjIZsOgCstOyVSUwnvL5U1lmTWlbcw/0ObMTbgMugXxlH?=
 =?us-ascii?Q?Xyb6hm1s1y8w/uRbwpTEPdxvPbB1jKJZrQlnLW4SG0ubDRVa3kb3UNUv+qSd?=
 =?us-ascii?Q?EDpo911dDwshyXXKtPhE7+XTmq0NYjni+537HAPYQ5ChHXqTtDB5y7Wvwbnl?=
 =?us-ascii?Q?lX6D3XpXQfD3CfaDxWBVbekjsjY5J5LsLfCbkcf5Y2dKtQMV+Ahx3Ng+9lV8?=
 =?us-ascii?Q?m5EgKkQCSLLPbcHeg7yRnX1qd762l8fZLtokdwcGwsZuV7042gJI/sdVX5vo?=
 =?us-ascii?Q?uoG0WCKMepNgjRptoDfUYzCaYfB9pXc69GAYS4zxERrV4nq41OBuF6Bv5IZO?=
 =?us-ascii?Q?fdA/Wodt2x5KVNBxv0x8xjLSlGNDfyCtZgERSsvYXcfAv0GE56WOerpJ5dpy?=
 =?us-ascii?Q?n2aj90KhLDEgyHsyVTbj7IJN8aLK50xLri7CmBi1qTeUbT2tfVX6/IrMTrl2?=
 =?us-ascii?Q?oYlpA7Y8bOcW0wGt346B56FwJgR6jwgRpab0vF8F8RAdSUB38vQ4r7GVBzcF?=
 =?us-ascii?Q?sHRS+ME5CQ4x2vtwowCa0ImghyvO1HPXMzRPTUnC0pAe3c0P3QsCOkr3/JKi?=
 =?us-ascii?Q?gbpvuAkht6p4HkfmCtwMXCZROtpOHLk4nf3tVgNmNCELViKZBWb4ewnYAoVQ?=
 =?us-ascii?Q?aKxJKWi/yWyu9Am9nStyLb0vIkzJFbyiHfGLBUbY3IF1CxbUbBfUIoLyj1Ni?=
 =?us-ascii?Q?qXj3+M/7Im1f8fYOavVlzkrpwJURz8EaqRWcMsjlyA+NextMs/htAqko3cnu?=
 =?us-ascii?Q?ofpq3IBOlJ9n9xTQ1uYedHYE02pScVLWKa578V7+hQ1hPx2+yXgMfgCTNiKf?=
 =?us-ascii?Q?xziZAD4a/90KFbE6DkSFGnPVbpmYjxrHlVM1VYco7RKOOxABfXSl8PGvj1Jv?=
 =?us-ascii?Q?5gGeMO2QSCrJmh946q2qKtj4SIRfk6EkH7ZroTotw2ttYTaRDv1SO8o70pmu?=
 =?us-ascii?Q?jabVkC5A9001/z3I5Pod9yHD45iT42XFThODskvWxnkDJDrMKUwL2YbI2yDs?=
 =?us-ascii?Q?plvabZboFWnOTDzFLId/Os1Zospx1mlN2fZLgMtKi2a+FEqwV8Spn6kic9ZS?=
 =?us-ascii?Q?rD44myAQyoJFlXt448r26AxVdKuG1N2+Dr1bDvWEZT/eKLH98vHqbZWT9zEm?=
 =?us-ascii?Q?qQXwhTD6yAM3XFaMPCc3dG66uGJCClxIWk5Sv1N4s3jrahVngDjQW9ht6yMq?=
 =?us-ascii?Q?IlKElD2Gn0pUB/qO7MKGJeJ/Am8SAIwBjisXJmpU9pSBlm5guF81aKPwoVI7?=
 =?us-ascii?Q?Eolo7kLfzJqJjVjfQRlnkBFnL2r0fw31Tji8kMbjJnLTGED84ALENpqu1GmM?=
 =?us-ascii?Q?Ix8i+CFrcHCPhFfYTgbr5lcWX1jWJ447rEBcmQ8BDz1aI1y4OQ7/W4w3MtzL?=
 =?us-ascii?Q?U9QLKjS/fkTXNL5l0lkPBkqE/2KpMaqxalfIVWo/YwqX0Q2o7VRcabP3INqQ?=
 =?us-ascii?Q?DCwqT7x7ufwyUUWkPhSKcy1jYNAp7ElNyvNg+P/R2uigiN+0+dLj1xjXthwy?=
 =?us-ascii?Q?/NgnBFNviJE+CkhjcheW05qIh70y05bk2XJHC8HLmctP6556jCAmwYsSDiE0?=
 =?us-ascii?Q?q7kme/N3iQQ9xeIKJ4sbKo284ILKA176a235AkWEUtApDjJf3NmdwzQgOlUD?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ff88f9-fb50-4315-8d60-08db8e48cc0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 02:25:51.6118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UP8Ct+KSijpPEgC9NQARUUaOjJhV+La2XEb4WM8D5Xdx/4/xBDkaU5CxQJ/uSpwx/W/NcoRrxXeQdHLzMdvHMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
X-Proofpoint-ORIG-GUID: Ogc4pFBY5d3ISDEZO0Mqpxl_CkB-VkCC
X-Proofpoint-GUID: Ogc4pFBY5d3ISDEZO0Mqpxl_CkB-VkCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307270020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 02:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184904

From: Chen Qi <Qi.Chen@windriver.com>

The license checksum is updated because of the year change, the license
itself remains the same.

The exit_prototype.patch is refreshed to avoid patch fuzz error.

The repo is switched back to salsa.debian.org. It was switch from
salsa.debian.org to github mirror because, according to the commit
message, the github mirror was updated on a daily basis. But things
have changed and the github mirror hasn't been updated for months.
So switch back to use salsa.debian.org.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/ncurses/files/exit_prototype.patch | 10 +++++-----
 meta/recipes-core/ncurses/ncurses.inc                |  4 ++--
 meta/recipes-core/ncurses/ncurses_6.4.bb             |  3 ++-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
index fd961512e0..9dddbbccf4 100644
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -1,4 +1,4 @@
-From 4a769a441d7e57a23017c3037cde3e53fb9f35fe Mon Sep 17 00:00:00 2001
+From bc917b9bae0b11b02aa0ddd9ed62d9cd78ffc4f7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 30 Aug 2022 15:58:32 -0700
 Subject: [PATCH] Add needed headers for including mbstate_t and exit()
@@ -11,18 +11,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index f377f551..163f8899 100755
+index c2462f7f..33668cf0 100755
 --- a/configure
 +++ b/configure
-@@ -3423,6 +3423,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
+@@ -3458,6 +3458,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
    cat >"conftest.$ac_ext" <<_ACEOF
- #line 3424 "configure"
+ #line 3459 "configure"
  #include "confdefs.h"
 +#include <stdlib.h>
  $ac_declaration
  int
  main (void)
-@@ -13111,6 +13112,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
+@@ -13526,6 +13527,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
  #include <stdlib.h>
  #include <stdarg.h>
  #include <stdio.h>
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 367f3b19f4..78d6f2619c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c5a4600fdef86384c41ca33ecc70a4b8;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f2e5b99d5b6c0e6ee7cb39b992733b6;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://github.com/mirror/ncurses.git;protocol=https;branch=master"
+SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https;branch=master"
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 1eb15673d1..b875aee250 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -6,7 +6,8 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://exit_prototype.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
+SRCREV = "964ec9f9c6e3ac3aaa1a9161c6fb75f6d7f589b5"
+PV = "6.4+20230625"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
-- 
2.40.0


