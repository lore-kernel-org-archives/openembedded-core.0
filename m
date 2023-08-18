Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5074FEE498C
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:30 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.102])
 by mx.groups.io with SMTP id smtpd.web10.871.1692380904571287049
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=FMejlIjc;
 spf=pass (domain: ni.com, ip: 40.107.94.102, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTO8BsAP+ksGgY6fAWHghgtxzUIbjER0G2cYeYSyNVTVzutUh1WfdRkLC8oJikHCIFVCYgwhj4LwUawtgI8WdFJhxahNiVoe3CorQTrQCkDt9nn8AqKdOgwtrj0Tjx9FsBomjYXAVRUXKdQpm1dmMsRoOKvfMKuTu11HvYtx32hOkG708eG7yNufnNB4VicRcP2ZQzakCvCmVADbLnPkcCznfQiXZ53gCgjyFeg7NIUS7iyWH2lozwX0FNRqiLLgOCsBnaIrLIF3Z1PWKzD9H7i6+yf9ns5xFB0ArNEeiiEvyHVLbgERZvxngyBwpSiEV29OZKKw996wUb19HjCaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sQfhYHCrA54H85qkbdrv1Jiwl/y2pE71O8NkRvRgpk=;
 b=SkCY+8c2Acs2Ns1WBeII9l/VCFRLl9Cs5G5/SWkozdfaW9FropEAZdmPt/ewgKGQ8D8/4loqK0pfui+4Rd95EZesB+JKBcQwsPTOFcPLMUnh/9558Tv0qREObM1f53OB15sv9wKU4sViYA7bvpVNIv8VlhL8pkJCk7/OwUBtqwOekkCMtQAOxpIw4wbavhGSFepne5025ZBQhhmDitJIZQNrozdoKIjbU61nMsx2p2WlU2lb5w0972bsy6NIPZq/dAk7/X6aGo0BjdOdeCuvwiF6/9KgObYey8rlzlvm5FI++KK18uj8Cpq1DrrnKgmZlszKzRa+tXJwtWUwfy6ylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sQfhYHCrA54H85qkbdrv1Jiwl/y2pE71O8NkRvRgpk=;
 b=FMejlIjc0re9wPZ0AZs1B0mbZWsqw4GYKDNsa6nRoHWVp7QdTG58Cj94v+K6T9CzgIfhzhqbbYa1BrBIJP+QQAwz3yHNMO544sDLroPOO3/R2If5XswX4SFIgVel/Hvvc6+a9KLkosXFt2g8P3yiKBQQvMetKrGN75jvvlXVlrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ2PR04MB9012.namprd04.prod.outlook.com (2603:10b6:a03:563::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 17:48:22 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:22 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v3 6/8] packagefeed.bbclass: Add cleanfunc for cleaning feeds.
Date: Fri, 18 Aug 2023 12:44:55 -0500
Message-ID: <20230818174754.988128-7-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR01CA0007.prod.exchangelabs.com (2603:10b6:805:b6::20)
 To BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|SJ2PR04MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 6367a1c1-fc44-4598-9e87-08dba013508b
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F78nyZtnPNF3wLj8q9shYr22aFieXtXRXkoYeNa/6avnQt/st7qLu8+q3SLhWEXJ3njo6E/bR6+TY1+DHAn4BKy20UGusNA6rHAY2L1+6kwVrPxhUzecXIYB2MiQP6KKZpt1+kyLPPGBzDoHd0HS0EjjWWqwqX2Qfij/8nIvB/x+Z2lbE0Uc5zXJMlT8+LYRzdWszxZnzAmkIhRhwEwqYaLC89hdHtb3KMZUau2H1ye8F6IrBSwf3oNNVbDbpgW3ET3QJchW0ozTMwpvQcFbMkLZt2yolnEhtA15wuMzrQVEUZoa66Zq+vypgYXQ5YLCIcF5+GoDwTWn7AVVgi4R8DajT1k9MSImQmfUcMilya1jBEfmmXB+4qSGNqVSog3EKGN1otMpmyhXxoVBtlSTwt3PbKV7lS+icaIxk1tZ6bxWBSGXerpqDR/5nARuk9tznJ8m1nPRdxds/HTFFA3YB3mtMixeD94YqFGiITOifKlympxgX7jd/j8Io0NexQb7q4vRK0ebjAe0HrPaSTCps9ysOj1YtrXEjLelaTB5/98wTqtzLmJJtZNsNa1FYePc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(1076003)(6512007)(36756003)(44832011)(5660300002)(41300700001)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nnKrGCTAIwKOs0fMlf4utC1vMK7BGRPyCXytRYgtOy5Ia57d7ZkFR+73gmDh?=
 =?us-ascii?Q?VIeodDk82UthALBGt0bok9sr9VPzL8cmYY7SOnYSmehDJLKntwAKT3+UkOZw?=
 =?us-ascii?Q?3HWIK9IxUV8CtCX5zul3flXmi4RCuvHSueGnZYfR6OglpwTuYZVf9AMlM4B2?=
 =?us-ascii?Q?CK0ZIUiPYiH+7xzdx136pEKkQLDbWxE0H09vflCqwEReR3yultlthb03RNBq?=
 =?us-ascii?Q?CLPTRxYbK2D2Ld3IFM6LJE7Lu7ePMBay0D8a9F1ayXAMvb8Y7O/qlJXLJSK/?=
 =?us-ascii?Q?MVnt9qm2aGBAq9OdCyFV6srxg2wopM3XjHCTkAosnu/Q5J/jKy1S08x6jMJP?=
 =?us-ascii?Q?uCSwhIJ6dfYiXBOb4W4YDFtuxrflrTopNuw/j+PdzMBMCFcCtDwNQvlw5xjl?=
 =?us-ascii?Q?l4X7GQzGmZW7PLhuU0o9XhN/Oz/biKvu9FoagtdMZi5lz2G5v16vV6QLEBHm?=
 =?us-ascii?Q?raLoSxr/1GOCZYmxD28TG/UKSFceeil3iG4c9yvkx9XF0kn5cAClTDpEw4tG?=
 =?us-ascii?Q?E6S+PZYf5f66fTgXIPglUL76XZjDoa2rMNZ1souQ9+trBpnNEHpNfGJf3WQQ?=
 =?us-ascii?Q?S+wVXyQ4qqc5izXfUeiJHOW2aH7/M+LvZMsfuLH6hpsCu+cm30ZEgUe4+J3u?=
 =?us-ascii?Q?hsLPGY8ggHnA+tZnPzGf4cydkCzV9it6rYc/uKDxVgMDHyDWAMnPEkJYdWFd?=
 =?us-ascii?Q?O4ef36XLGSGAuku8PLzvVg1Exb20eEmiHnC9EwyvpfncZcbR594a4S1czl+/?=
 =?us-ascii?Q?irlPwSHWG3qScmjKjsAYmeMuWo8kmUkeSB/gwVeQMSDM9mP9MMNLbgvifpoe?=
 =?us-ascii?Q?kp3Az8XgmSg2CUmyk2UuWbDOsrWMKialr04hzpwiNLWpJSjKoxE8qvkwmnUb?=
 =?us-ascii?Q?YWwZG9tQQxHqZF2epWYTnAtCt/X97YtIeU6Q32xxRrPaN4T/l59ewXfkZXlF?=
 =?us-ascii?Q?VPHUt28Ud0sS4mOYhkaaAbsJlC6DiOHx+AyayKXQa9wZ0sL8xx5Ok2xbefPh?=
 =?us-ascii?Q?m9f5gbbs3gmVd9b85nbkeIK9FFh/QYkZagdmEQUiu9fEDs60i9Txhbf8Nuth?=
 =?us-ascii?Q?M7KxG0//a6EC4KbitIDSr2gsucwDNLVPPax6NNBDkU5yw/i01rSYcqDOV3PG?=
 =?us-ascii?Q?dxoYae5tI/595Vv1kEbM3LKCwW8aH2cZJPputHOyyg8t1e6EyWCz2P6Vc1q4?=
 =?us-ascii?Q?L8LG0a0rfDpw9u8GPOBbU4H9k2HSwdwPHkmL0ISmGOL8+egQGdJObcQIDGqq?=
 =?us-ascii?Q?GQHeFumUUL+PwPD9Rq17YbPBhQvZXOBjVsvbAnWMaUUX9hH7gXhS2R4quECj?=
 =?us-ascii?Q?v74OGgZ6zZdBtv5jAbWY6Cy3YjtXHU5hdv/x1Rw7TMRYKU5ZC2LJfeUIH0ZF?=
 =?us-ascii?Q?OIx8PY/UV8YcCKdIPZ/J/SWi0Uf8nHe173Id64ffmtwq2CR7U6G1hKCMnEi7?=
 =?us-ascii?Q?V61EkHkD77imfLnA+28Gd2dHrzQwVhDVzfklclqBubbgrQAZuLvuooxsoFBY?=
 =?us-ascii?Q?bDexpjUnwywKOzS+1P6/yujTr1v0Iu2zhmeO0Wr7YM1qGAFOi0OZo7l1iJtf?=
 =?us-ascii?Q?w1ImgCQ6MvhgRnM/TDrK18OvFBaODc0Qs41yomrG7RSVcLK2JXPnvszL3D5Q?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6367a1c1-fc44-4598-9e87-08dba013508b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:22.0645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AdtWygxW1DQZHFgEoZjQxqgNnJe2LZz0kyB5pZuIm4Q6qkOJDslNQbJ2QfqU4IB2vUO9P2ykMZX7pOus9IGpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186389

Since the packagefeed build logic does not use sstate,
the deploy directories will not be cleaned by a do_clean
or similar commands. This change adds a function to wipe
all feed deploy directories for the given feed when a
clean command is run. That is, regardless of the value
of PACKAGE_CLASSES, all DEPLOY_DIR_FEED_<PKG_TYPE>
directories will be cleaned.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes-recipe/packagefeed.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/=
packagefeed.bbclass
index de075294645..0bd37790eb2 100644
--- a/meta/classes-recipe/packagefeed.bbclass
+++ b/meta/classes-recipe/packagefeed.bbclass
@@ -47,4 +47,16 @@ addtask packagefeed before do_build
 do_packagefeed[recrdeptask] +=3D "do_package_qa"
 do_packagefeed[nostamp] =3D "1"
 do_packagefeed[rdepends] +=3D "${@' '.join([x + ':do_packagefeed' for x in=
 d.getVar('FEED_DEPENDS').split()])}"
-do_packagefeed[cleandirs] +=3D "${DEPLOY_DIR_FEED_DEB}/${PN} ${DEPLOY_DIR_=
FEED_IPK}/${PN} ${DEPLOY_DIR_FEED_RPM}/${PN}"
+
+CLEANFUNCS +=3D "packagefeed_clean"
+
+python packagefeed_clean() {
+    bb.note("Cleaning feed directories for %s" % d.getVar('PN'))
+
+    deploy_dirs =3D [d.getVar("DEPLOY_DIR_FEED_DEB"),
+                   d.getVar("DEPLOY_DIR_FEED_IPK"),
+                   d.getVar("DEPLOY_DIR_FEED_RPM")]
+
+    for dir in deploy_dirs:
+        oe.path.remove(dir)
+}
--=20
2.41.0


