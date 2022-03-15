Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E90C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 22:45:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.18333.1647384355291179687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 15:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oIvFpbKg;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0073afa2a2=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22FMd6r0024023
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 15:45:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=SoNMd7qSQbUzk6C7Y+lKkrYk6IzTPRdcxsnRAGJsQls=;
 b=oIvFpbKggCXnEMm1zyAL74B7fOio51+1yEodl4wpr0YXIKwV8ocXM+MWzHm+qYwD+RQE
 cv9eNwGg5kZIVfK5L49rd+7kr/YtYOSDOL5ux/T8C5LkcRyw+Yk9jcA2XW2tPL/yybts
 1eot5myh+zop3aDrJu1VGAx5yjboiE51Ksaw9SQ7665eXerfWzR/TC/TLOBkoOIr099o
 7YP7Edotal4LFPHWOqbz8gyWtK4pUfrdGgMGKSepY4zZk4L73/pW8hZ0lk9PtxRs2NaZ
 LZRydZA5hUWIVenQb2pwGIQgcqGM9X32gPv+euDITAN4/Scjfg/BgQrG7NdUOdop7f0/ Nw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erqp9audk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 15:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVDO83klrBA54Va/j8zBRMzSpnPymf3qyvVlMp2apJFk3z7NGt7wU8hRVuohgvQpJ65EEuBZbe8198Mu0rQmCjTfLyt+vZFaHh7CQw9VQoAoyOVQ3WSqKnIWAlROpISnbLXkRIR8mstalFGRTf3BMCc32BgMn6yDa2BVKHft6oYFpEwUV1Zh821YPazVgtL6rORVHVRqjJcxpB6l3jnp18x3Oa9Aco/CwttKUKXCQEDX0hxXHFucswNAyOkBMysxkQWYqkvTPM2Yz1rKwA0Qhjwu0rpX8rVuGexgYHPp35YXGyWMOF8pXO5JurzFoAKR2s+1t7HqA50MNoMuVIWgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoNMd7qSQbUzk6C7Y+lKkrYk6IzTPRdcxsnRAGJsQls=;
 b=Gp2j+jFfgy83u7rKKY/T/rUf06pAxvz5y/bVWqqlMN8mekiI6HE8+mOjU0Q8fBdbq6Y13/WHzQ647cstFP0r3Aq4zsMq5yqyXG/BjuX6PH4iJ1BgAWr3y1ewiMfbLNqyv0/xCLZYZba3wB7PR+LAlyDJmIumM5ePOkTOudiYCBf7HiSzezke4wzYimOsgmyDvb3b/1PzfflFUdKNxsiNNIZ3+6WZINO1JXH12LMWxxbdig/Rv7o0C++mvMHWki1Ip3qc2UE7Fhqu5nD6l+9Z/GW0PJY4ILALPZjIOOLw1hISarR1ynEkcA9wX/w4VSAgcwNUNKpgeeava1N4QinQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 15 Mar
 2022 22:45:51 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5081.014; Tue, 15 Mar 2022
 22:45:51 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] expect: modify fixline1 script
Date: Tue, 15 Mar 2022 15:45:37 -0700
Message-Id: <20220315224537.5956-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5b1924c-2593-4b0d-67e2-08da06d58e6d
X-MS-TrafficTypeDiagnostic: DM6PR11MB4705:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB47057A0A961B211F55F5B20888109@DM6PR11MB4705.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vuzPSa2yzTmL8ZVyljqSX+4c3bJ5OwTbqR0AKd5fKnaeXg4sJ+X9ZGOnzXHMDbVq5HtE2fZpkpfIBPpxDmkprSr6Y8bGMRZZYtqToZQ5fVCo/OU2BXhsweo5nEDg2++PFg+z6/9EL2QIj5T7XOtmfmqQXP2NRlq/SrRtCQ9fYJgApkHv2XpF/xBUeFXoUF4SgO/zI1JowZ3CubcpVPucM4UOzYwa02i+2Jqz35j1nvszgb94xePGf6LVcj/s3t9354/uI2gIJ4mTW27j61gKoLrU2O+YGZcEbFaoVhmTJxRq7a2wDLctLz9hCzNS0A3JR0TFwOmWqy18oicPHkxSUo5Eaboackda5tRDzXXAX1iS2OADZp7K0ADH7Y7KGmeTSImAnMwDk9i1ISH3dUIEE1YAsURqZ0CAdU0mp5RN2Q9mPUPyjAHv5aMeIICgpouQvKmoPhlGxN552oxScUkd8ZqVVQeeXKYtR9XKffVYp3ZmOZlDmOiqtD0kN6gFzH6/P5RMF4efWLXimShgz2aa9/vjRywei7LZuXgfMzKDyS+NarJjJv++t9+AOkJNzT286xNM5jyo+U/8E239R5V1yfDV5gUtSGgOBxxZzB5ndrp0yU/3IuOD1fUiEC5EKLbsuRQNiKnZOMX7fOv3Y4UWAi4G9+1VRVgje/NN1MqFMTjRXQcEEA1vloHMiPSl70WYEzWid/rqGfSFjsFpRNe+Tg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(6486002)(44832011)(186003)(26005)(5660300002)(36756003)(8936002)(6666004)(1076003)(107886003)(508600001)(2616005)(52116002)(4326008)(86362001)(6506007)(6512007)(316002)(66946007)(66476007)(66556008)(8676002)(38350700002)(83380400001)(6916009)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V5Rr3q55BpS4tcaFOPtTrtf3O/1C8Fqw19jkviol1s1EgfMRqnU4cwQ8SauC?=
 =?us-ascii?Q?ierUhEmc3tLIH5fH348R2HAgYtT9B/dpxJiAM3jQsPOFjZWc+z9dsFxS+yys?=
 =?us-ascii?Q?kEgJzliONQwHrJCf63ULd8jmmgbQb4vp/pM0QHE8nA7NC5Mtv/rqpz8rQjBl?=
 =?us-ascii?Q?iL5Fc3XF7Bb0VvFSsUGyWbtHK5Fo3JF4pJWdVXOV1OhPwsM4+owYG8M6hGER?=
 =?us-ascii?Q?foqtiThA4UdvUgEJqm7NNlCRfEsqrQC160ac97FH2hUMP/NgbsIWvz3hoGSG?=
 =?us-ascii?Q?C37JpN0uKE340nMbt7hwktAU1WUh06BbK17qUh/Pj1XKUk3Xec1OTVXXdo+z?=
 =?us-ascii?Q?ziu6B3Du85c6LZRHpbUdqQlpHrgj1Kw6i5WleXwI1Ic76022sDMXOadWCNKT?=
 =?us-ascii?Q?0prHgYTlZlpvYpKJLmELcgN63wr4GTZlKuga0gdOSDZ1aClv1N8MFxVuHwnS?=
 =?us-ascii?Q?2EBDL1AFJt+bGxLysMc0ZA7dvebCWiQVL2ufb95JoIDTMqZHG/wW1BOPcig7?=
 =?us-ascii?Q?q3eDqgKeq743/R9oLJwEaIJz+qJEHzO8XoDNYPtoa2r7q9+0Mx5Flaq3oV2k?=
 =?us-ascii?Q?kJBBI18hCxcDRgOtejiFUoKI0ZO/jzsXglX3XIM94SCj1VqiLKgdfIZWyi0q?=
 =?us-ascii?Q?jQ+AqfSDbznWBVz0fqjxNQ9wWZn3PLT6aqXY5e0fhBg5n7P9xEffpm3a7DnR?=
 =?us-ascii?Q?hc449DcuRFFuoqUZ1qo0VR0cvNmHnehB5TLsJILLlYdbQlx++uYC4NHiYRBP?=
 =?us-ascii?Q?hUHSE+0e37/s+ZMPxWtupYzN6/7qq9DiJLePIWETHySynHR0va1IUe0Uq+5k?=
 =?us-ascii?Q?TP2hWTXL0zPVsrKxAzir+I60x/4z2RwerJMCwRuFKb7uX3uM96W0KTtBuv32?=
 =?us-ascii?Q?AfEG9tQua1m97aYjg/3I/wfokR82K+0A3I+I5XnlRShCGkmEHRY+tJywlFm0?=
 =?us-ascii?Q?Zq2SAxTZhmguJWxucrILmVHztXHVsiSpchLdyurFS2dyWtJVS5tbMEC+Y/um?=
 =?us-ascii?Q?lZwFSV4EH3zxyeuLvCyrpXgMH4V+1th6dbRiSn03TGobwZMikooaf1RyD4Kp?=
 =?us-ascii?Q?IguyI6NBJ4FsT/hFLq57oNuRoJHAeAPsU+PrQoCVk71SS+A4EemCIuhNmePo?=
 =?us-ascii?Q?vr1Ig7Xph/YFY/3up421BLHlngUKeMt9SUzyDNZWCQNe4xLBFmsr7itQFxq7?=
 =?us-ascii?Q?06Ou8igtwKr2iK9ljSMF1s3p5m5pjMC2u5/+GvEvAlGtY2hjp0C/9vc2LBJk?=
 =?us-ascii?Q?d8AK2GRBqSu6z/MTyiW7fBTNbKlOaF1cKjb6xbL7TopkccWoYYSZQqq7j3Yp?=
 =?us-ascii?Q?ZI6n3B2lR1DCPG9dhg3mtk/9++KxXBTKDbBK7d/bqG61qF+aaZok6fwXC/cw?=
 =?us-ascii?Q?vSrCZ+Zp8lDeZ1TFoq6SU6ZEBUlBsOcnRID+TwF6TT2xrTgnWbmEek9GaHQS?=
 =?us-ascii?Q?aBB5rkkNWYBQ03UfXbE5S/pbHZqJsOf4uqFWpEIPpV9zlaVsh9EOGw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5b1924c-2593-4b0d-67e2-08da06d58e6d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 22:45:51.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BB1GwCjKaOIG21Qsgc6Y1apUcy659nh2IqINgq6+6VZpwmqltRDyWziacRzAnSV+HE4Y89Ok/CpVfPszf65C+cXwqvr/Y3AO2cg9cuQLUF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
X-Proofpoint-GUID: 78TajuuB-eq3n9jiOu5LDwr6zZPXnW4j
X-Proofpoint-ORIG-GUID: 78TajuuB-eq3n9jiOu5LDwr6zZPXnW4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_11,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=706 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 22:45:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163316

fixline1 needs to be processed by fixline1, but we
short-circuit that.  Enter the multi-line shebang which
I am a bit queasy about, but expect loves it.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../expect/0001-fixline1-fix-line-1.patch     | 31 +++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch

diff --git a/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch b/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch
new file mode 100644
index 0000000000..d6f5d7ff0e
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch
@@ -0,0 +1,31 @@
+From eef7c44c10de32ba399ab162cb5799fafdce3fa5 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Tue, 15 Mar 2022 22:00:04 +0000
+Subject: [PATCH] fixline1: fix line 1
+
+Ironically, fixline1 needs its first line modified by
+fixline1.  We do that, manually.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ fixline1 | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/fixline1 b/fixline1
+index 113e9bb..8a38e96 100755
+--- a/fixline1
++++ b/fixline1
+@@ -1,4 +1,7 @@
+-#!expect --
++#!/bin/sh
++# expect won't see the exec \
++exec expect -- "$0" ${1+"$@"}
++
+ # Synopsis: fixline1 newpath < input > output
+ # Author: Don Libes
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 4214ab0f27..e22fa140d5 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-Resolve-string-formatting-issues.patch \
            file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
            file://0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch \
+           file://0001-fixline1-fix-line-1.patch \
           "
 SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
 SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
-- 
2.35.1


