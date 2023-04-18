Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5A6C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 06:09:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2014.1681798178157456457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 23:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3472b19045=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33I5wLjX032323
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 23:09:37 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q01kdjy7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 23:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/4ZQP1+y78k3wVLE3B0ylQCd0P8RY6eWWKoBiIB2epvRumdU0XWR5twPHMKdn90C0tKq+S6RLwxQTgDoyD3yGHFM971EVLWC+QE/Z5n6BrHwL4z6kMTwWDTS5AGpK5/+tkrh+fpSfq8921+gdRFmiqGArsQRghl8teBo56MNQm/TmZuoJmMJdOd+8kKKcYx/oHw3jwSQvj6Gt5vz4nTY9grRWSVo2p/GiFCLml+0eU//4kvPepFZkqcoyZUmD8vELsbF0MiwqYd9RNsBdjcB5S0YNCUSnU/AQMCZUm+qdMdnM6Lb/avGO0gQ8nxgNmTDAIKSRYpxfx85IrMulZZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctAuC3y/3TJTmJ+dSO3wscI0HK0UkIy3/1FyjucrQF0=;
 b=c/qTDrsrM6qNHu7ktCDGnf0Me5AyvRpPLkhKZrgb4fEzt6wZ27CklaZCEK32VW4bKYNsKzI8ppHwCeCiVmeTsAx3xj21hh8vwqcI+baeFbTzLtLvef3kJrp3zvKDd8gklbx0Ue+JrfecOUZh0sJwtVSpmuggXkksT+mHtuLS4MsI8Inro2jFE6TKhK/7bvLWX5MrUXpfF+Hl2bqsUPA8Ytj8fWOY6jMgeXlBlrAVLfnl6rfqbsFG3g5FARJp/AC1IsrfMxHuVj2t1ki4QNBGcvja5XcmEsx7vorXv2AfiB7cyNNSV+stMbfEm7G4URfYYZFx1+52z1sKETeEhkjdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 06:09:34 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 06:09:33 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] shadow: backport patch to fix CVE-2023-29383
Date: Tue, 18 Apr 2023 14:08:59 +0800
Message-Id: <20230418060859.241917-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA3PR11MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 1830468b-d518-4da9-d8be-08db3fd37ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5NahmlsFJ6/y3VAvWkV9Gq6xLyjT8THWAL/YQhCycuHdjIEmFJ347LqsvJH6R5IQzGH5TmIuzux6LL7ZyUEg7xKGsaIfCNEYHwwqtFm9m4wxYn770mc9Q35IouoqoGl7qU1ntnl07v3OwJQNJ0YgEO1wYxxAyPFXvRj+gxlqbN5xEegARpFuGxzcyCdunlIx2uoSgJ4eR1n6kr8ZrHiEGNRmUY5p3JziGl1UZWVj/yA1wz2AEc1zNG+E8tpTeV85UgM31Gd+Rvaj2zMSaz0uBcUchxutc9+gSU/v92pwlErYJgIRmcm/IhM3xMFBRugq572qd4H2eU7czcguML/fhNL23ST5xeZGBDxma1MCNyJEwGOPrQmHrxsp6NCwcjLfrpiTiLRjLUGOEQeU2mcRjIDTNAfL8jZInHibbkWBWPxa+Arn1kMAp3NpKF16UsVxFxHv0AbEVdBKKQDK7NIfclSmvw+Eg/9feGxFRNyXNt5nIf0hfm3nN4IuUmWQyEAnsEmctU5yiOAohD4JSVHQHibe6pTZ3idw//FeNPu1GbnB6tCU9Ditn2/lQfhMJjF1HVyaeGjpL7ofbqqyuhmfp+S5qNzOfRe/MOtlabW2AkchvsnNEX8F2in2y0eulEdoAYISmWVwgP3yf5VYREET2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(396003)(39850400004)(451199021)(38100700002)(8936002)(38350700002)(8676002)(44832011)(5660300002)(2906002)(478600001)(52116002)(6486002)(6666004)(186003)(2616005)(6512007)(1076003)(66946007)(6506007)(66476007)(26005)(41300700001)(316002)(83380400001)(6916009)(66556008)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pf6KCEfDRUTTCw5/hA4XlmUiI/KDMhAUw/sPUsfNobgVdoAGQpZ7p49SHz0M?=
 =?us-ascii?Q?Q/6YQQad8aH/rZ3Ftg3HL7sWLu2qu0u8S0aKWIT0G/uWlwDTdybFsDefsE9p?=
 =?us-ascii?Q?Mx2LlPsV0lBdIT75L2Y5iAlADr9JWmr+eeHLoKMLFnGkI0T2xb4fBYrydJsy?=
 =?us-ascii?Q?lmMb3bhYAMwk9VaENXG8KNpW+vF0O9tfl6L1+DMw5pf++nibRdLBKIi26ULu?=
 =?us-ascii?Q?C+KQJOkD2rJelfsSScXkhYaiCdprBoOPj1IXS+wt4URkaNKzYsAa8UBr06Pc?=
 =?us-ascii?Q?PVNqARL85mcvo0I7ndOFXC/pWCtu+uFbkGouyLndFpT8JrKCt6bWHS9z/zf8?=
 =?us-ascii?Q?n5hOFp+kUaDyxJh9BQUDIrL9oKmzrYHt+EbEi2tENghCq5+0wYs88fFCoTob?=
 =?us-ascii?Q?z4ww/oRD0om5wsGvRdZpvAqIJkORf2v0LLVlcCOSm35qRsRgJcLbtgN4gVS8?=
 =?us-ascii?Q?H3GaT5JCygeGLeYjiRFqLWtfRouZXGEsNrHDZQ6JmBDx64YzHZPUlXgDsGzR?=
 =?us-ascii?Q?aPxa7XspPVVc+nDeV6XD14F5KyVidC8fl2voSV4PHonUpqip6V2nGvR8SJhx?=
 =?us-ascii?Q?PO+DubbZXColAQY6zcefGTWlkAc2V1+x2i0JeIovcMsS9+Os/fRy0xJgKpI2?=
 =?us-ascii?Q?bUYg1uyA4qibnVc/CQq2t42K5UejthPEpWz3FV3dBLQyPI7QTJQ7xbQ+ZmeW?=
 =?us-ascii?Q?Fjk2WLzq5BXqALlfte7ElY+82EXuXwOZXEUTC9Hbpzo/mMsHeKecKpjmgnk6?=
 =?us-ascii?Q?tFo0mG7AO9QUtDuXN2kKtQcLyDbyZb16KriKKu4t2f17qTrpeKhD+9Zy7Cxr?=
 =?us-ascii?Q?NGMxVgsO8xLdpK4mwsP5oluYKP8JTOrzWJHJwYs/0pLk7DEk18XwYckBHb9f?=
 =?us-ascii?Q?F8/OWxJwMRQqYk4wZBbTl55LITVWA1t5AxOLgnt0TcvCFpnIA5KdyuG6XgyZ?=
 =?us-ascii?Q?yTOuQkyBz9+3glRAIrpGujx8ys5KlNoh1qxxGeZi7tZyFWUrV5avUucZDmEH?=
 =?us-ascii?Q?y7xGE8IrQwiDHoosqWPCEige8TRFH33uHZO+qPqGWu17DHZ+5O3wKyRUBWLU?=
 =?us-ascii?Q?OsKWm4WsrdvKfYdpeiuoqcWwaONAxW+QxectvF+lWPRd6bn5ShkGbMsYe5hA?=
 =?us-ascii?Q?KT32edET804DMDP0lU4gpxnB0C3bBSokSx3zQbkTZa/GjnkssFWowaAYeeNA?=
 =?us-ascii?Q?6p76aF++7OTVSY+K4cXYMaQN4W/R8efgNl5tqsVVlRWo9k2/CB91CHpCqKfN?=
 =?us-ascii?Q?MGwq64p9vV+v74kp4B6HbPW09Ucz5Pya3sNgObrSLSllfz3wAeG3DlcU47h6?=
 =?us-ascii?Q?e9xdYmSTuGgfbBxeDtBGs2IvJPXVZjVuiFrnsRdozPMqABO7Fn8eenqQX/7l?=
 =?us-ascii?Q?qIkEzS3p68XGaDjGBK15Qt2Vvp7u0c4x9IUrYf4sTjMhFV6dcmYCN+l3pDaw?=
 =?us-ascii?Q?V9mrzZKz07FmzNvEhFZwOSZNxUiR/1f921R1RPMgUEnE8a8wHYcITaDe2TTZ?=
 =?us-ascii?Q?aNX13ZIBEDolcaT6Sfc4ptAM45ae936DzYPEejKGf/btkB/R5VHtngE9xpnx?=
 =?us-ascii?Q?DAPmrTDKyOImdorhueelcL3nYWcEGVvUPkxI0EvmZo20ZVMrgNvtjABz+Fbi?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1830468b-d518-4da9-d8be-08db3fd37ac8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 06:09:33.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHafdwb3GhPTNVy+UhRIUe+XFKhUchlwm9/Y/gLbHQbFAoHlJRk9BarKa6NW0AVxSOFyUZpS3eq2JmPOEyifuEwxDjlsNMxaYpo774gyKXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7554
X-Proofpoint-ORIG-GUID: maPfbCfB4A9GAvIPsACISoZzJ1ArI55I
X-Proofpoint-GUID: maPfbCfB4A9GAvIPsACISoZzJ1ArI55I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_02,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 06:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180179

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../0001-Added-control-character-check.patch  | 53 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Added-control-character-check.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Added-control-character-check.patch b/meta/recipes-extended/shadow/files/0001-Added-control-character-check.patch
new file mode 100644
index 0000000000..f53341d3fc
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Added-control-character-check.patch
@@ -0,0 +1,53 @@
+From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
+From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
+Date: Thu, 23 Mar 2023 23:39:38 +0000
+Subject: [PATCH] Added control character check
+
+Added control character check, returning -1 (to "err") if control characters are present.
+
+CVE: CVE-2023-29383
+Upstream-Status: Backport
+
+Reference to upstream:
+https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ lib/fields.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fields.c b/lib/fields.c
+index 640be931..fb51b582 100644
+--- a/lib/fields.c
++++ b/lib/fields.c
+@@ -21,9 +21,9 @@
+  *
+  * The supplied field is scanned for non-printable and other illegal
+  * characters.
+- *  + -1 is returned if an illegal character is present.
+- *  +  1 is returned if no illegal characters are present, but the field
+- *       contains a non-printable character.
++ *  + -1 is returned if an illegal or control character is present.
++ *  +  1 is returned if no illegal or control characters are present,
++ *       but the field contains a non-printable character.
+  *  +  0 is returned otherwise.
+  */
+ int valid_field (const char *field, const char *illegal)
+@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
+ 	}
+ 
+ 	if (0 == err) {
+-		/* Search if there are some non-printable characters */
++		/* Search if there are non-printable or control characters */
+ 		for (cp = field; '\0' != *cp; cp++) {
+ 			if (!isprint (*cp)) {
+ 				err = 1;
++			}
++			if (!iscntrl (*cp)) {
++				err = -1;
+ 				break;
+ 			}
+ 		}
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5106b95571..8546501a04 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
            file://useradd \
+           file://0001-Added-control-character-check.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.32.0


