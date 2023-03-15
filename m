Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F118DC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 01:47:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2289.1678844867716317288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 18:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2438f68b89=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F0wpmq014031
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 18:47:47 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2avg32x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 18:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ym8MO1T87zyiiFjFJ4NDq8V2hVq1u7CyMwdx2mLesHSvORBUA+OqBfNvTOZOam8Xpx2aHrnBxw42YQXE4Ck7pVSqwzPopDo2qLUkQRS1GhlqGUtYhy//8CAt4WcVg2AcLZj9FKChaYaktBojZe65qhFPdnjLpOMQ3RMPJUyny1dhVU5y5x4W/kva1mSJeZxvlcFOEMjgqEidKOlqsbyb+dchvL40T0Fyy6fHyC0D8js4ax5du/5hFmxVEKFclgtXx7qzDwtPN2Fye01Ta1F4HfwncGVHKAJddwGxWqeFGCH4yaDCa/kE7c3QBg+5EnLoeoP5on3G3cdt1tBxnPq34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aU+9WAaB/jmj3siFOAupKJN0FclXaAlWlzmZoCSYUzc=;
 b=LsDY7RZmrYVqS2mHKGWk96hghVvCRH8EqO1Q9fSZwaVSFeHdn4dH15oJp0qfmR9//PmGW/f5mDfSN0VYcfbT2czZUcD0ytcFccuMp7DQ/l1B/K14SfdQ+VCFhyNsF2Ea/lYujY57+cBFgzSW4+jHizA7oYL0aKmJ5ODxk9p20YpA/jt/aFk4h2m9/Ob6/8/jIQoPVmTuZaAXLk6TeQNh9caVJcw+gb9jL/Ca5wVUCP+X71JOmKv2Iperus6yj5aTaQwHtMUEK0jOK+mx/cUNikRUjPhmFMs/JJn/4XdbD2HhD+l8+SWCrh8iQWM0Ejgo63rm50/GpaC/pgnr31W6Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB7774.namprd11.prod.outlook.com (2603:10b6:208:3f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 01:47:45 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 01:47:44 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] rng-tools: disable rngd daemon start by default
Date: Wed, 15 Mar 2023 09:47:28 +0800
Message-Id: <20230315014728.86644-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 855958e8-8e9f-424b-b973-08db24f74595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PXEOorNfIWpUn/kNX8C5GKkjQg4cvpWrI2eBTfSptkeykg9q030PAajOGehAcQluF8IlQ4MT02GBiXuiEkTHPchZSzfh+icGnHumgtF/GQdjB/jXxI+kmXEU418/u891TBBUONV3sAfb5gTr7oQS6Z/AlUgAxbgj+/5SK5Lp+bVO+Pj2tjT0edHP7y1rs58hc1NHcUdFbj6LRKuew2fh6dqOPtvP+RFIpZp5QJynrF5DY3QJPipP1en9yR7ogwIGWKuv2urlo8sCqXd1d45v2ZOILROmES64WuqWWzG0xPWB0rTUcs048O/guMHJUED7Y5oPCrp0NgmxQ17Zlx5RmexYjnhF5XCkMVA8r7gMwjviH+ncaJH0Ul75NCHBL6zKFMetA0/dB8xffWryO6P0tMT7ujZeah+FsazSOu3Xi0p9zrEabjN72Lu2aQauGqKI2Y84JX/j1jgeJfZMTKQrYO5d3y7ZLrlPPDcaz1y+l7o9Sfp4vgYFLxspHlR6VRIoAC/RGZ22k7TKIqBgSge4Tu8RVZ4jrKu2rfReZF4NqB1wOHdcKrUk1/kBqGhXKEiTKszaKPNMA4h5ow85uYFce/xJL/gftQhORPce/EGfM5eXC7CpZtUZdl8PcDHyiQtwy3zMipDwUHen4a2cEmNCXDxDWdDaFmwimRJjtRgv4mo0Ss+5mmZjXqGJsAasNXTD1z53jLqGPAXNzHCEJUfvGTSTKWGnn8lHZRK9fEGI2gY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(376002)(366004)(396003)(346002)(451199018)(5660300002)(66556008)(44832011)(41300700001)(83380400001)(2616005)(966005)(478600001)(6666004)(52116002)(6506007)(26005)(6486002)(186003)(6512007)(1076003)(6916009)(83170400001)(8676002)(66946007)(8936002)(38100700002)(66476007)(316002)(38350700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?46rNLqMP0nAtbb4lBxaGk9KPqBfuhEJuI7SXIshm7xAq4Y0M4V86gbC9I3na?=
 =?us-ascii?Q?6oIkWlQAzIYvSFQjRIMwTrp5hVlofJFhYIL5UkU+xBLcfR0ugoCj+b0mLxlJ?=
 =?us-ascii?Q?LUnLN/CJiVpxYLmv9fb4PxWPVgSdcMQyg/hobncSFg+4RE8Kvoyc5cniqQyz?=
 =?us-ascii?Q?aQgXOG98RnNLQn+R2hY0OtUhUiB5d6gWkS7vnHwXCj9nyPi1/3OZw5QblQiK?=
 =?us-ascii?Q?Y2eoQ02JIFl+c8oOo/YFBUauVRTTQw359c6j/KuNPjS+zB9m93MOurBG9XHA?=
 =?us-ascii?Q?E0J4mS0GXXd0YToBeS/otZbebApvD1TIcfAZyYpnrpWoYidB7zNXJqNxWL7T?=
 =?us-ascii?Q?5Ba5IGIMILSVU7a9MjJDEqx9rOBLtCvvO2nBQWgUQK97bHSurZ6YjpZoMo4r?=
 =?us-ascii?Q?HOFadLMUyAT5nftrUde42LcQfuJaHD7+E5B2YQqdevvAqel3idFqCEs81MmS?=
 =?us-ascii?Q?RnzAPTJZahY1OYtPIzbiN+YllTSmUnTyLMMnITo1UnvGo9tgYvHqcwcZB2Ay?=
 =?us-ascii?Q?T1+ZWtqdQiIt7UxBdVWKG9h3Dd+x9kXvqKcMqj/y0rbbsHWOmhe8rPe4AlGE?=
 =?us-ascii?Q?9ler/WOQSmjg4blRRFIxMxkJNYfoeF+xSx7FdK9inPkxA1fwr377gqMyXHJf?=
 =?us-ascii?Q?Cwvh4DYHPNsvih2f+THphD2nCtq/VfZGK5GG5m35/GiihFp0bKDW0qv+Vyja?=
 =?us-ascii?Q?DQ4/NrXmhpd9+KWTfhLhAOdSIwTZ6+1uQ4/cCf6Ee9ILOvpXL/kjbpg+kv8m?=
 =?us-ascii?Q?kLLyvIeZdvMYMLMpHxqEnVK75+4FMEFJRM5MJOQWnmZRYMI27rwq6L56YTsS?=
 =?us-ascii?Q?H2t21wHDXx7od4IF1SKJvxRhxoeIV8GOaRigJo4bi1sWxOdhuqAYfousMxx+?=
 =?us-ascii?Q?Skyr8DwxNDJrf5oX8HhDMbuux8w2QO5B9SY16fscCX+hDuGp6i87OT2NokXr?=
 =?us-ascii?Q?cRI0Xe1v3UkwwzrG5RitytdhOZEUnYkl0ZztZTQhGjq5rGHQbkj7LZxP0Qn5?=
 =?us-ascii?Q?7dppZVEaRspeDTjNLLTOPUrDTuSmpgjgX/tr/TJlE7TS513toI6RMP6yAASI?=
 =?us-ascii?Q?+6QgxOkjYlxIcYXSUB5jSU7OZ7FuCTiHHdNNeYGWeooOGv5pOXGSBsB/qDTi?=
 =?us-ascii?Q?FEWHPSLCk04Hbd0k6bepLPl6XkFUCwkBFcKmLol4834cPMcrfUSyR7IH7BnY?=
 =?us-ascii?Q?CL1d7m0Qgf6gjlOmM6NxoXz2zUgZykAKexkEIoSrDaHM/+E7ZI5bh/pndINt?=
 =?us-ascii?Q?3VXQtx/nXRpjFovw4+DjaowPBBzF4QZqOg58BxU5UYq2c0ke/qvhU8X2Xc10?=
 =?us-ascii?Q?A4RWCzMqqsAj75Vu6x2XWjDBWV9wPUoSL48yRVQOad3oBONeyjfsfmwyg/P5?=
 =?us-ascii?Q?TZtiL2qPVq5G+weNxls47YIh4tShG9LVzJIPgxypdj+MoJ3dnhUlQjI4SrNq?=
 =?us-ascii?Q?5BcyNQOJncrTZU8N+JTwfW5ize5S76ikVOAJFKXgsaCqNk6dv0rmoYYzw+SZ?=
 =?us-ascii?Q?o8ats50tYenunUVZj+DB8yG3+kOqWnq2oQTzdt7n8xiSp78ktLMetzZeplWF?=
 =?us-ascii?Q?dLHT3vgS0OHoNRQz+E7DnIrYNFMdPSwhUk66xz+9t4FO5CKdhM4j9x99ojqf?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855958e8-8e9f-424b-b973-08db24f74595
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 01:47:44.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGTp/r0osNkUDLFdcybgq82XoCya2kuMdLsUz94KDCLHeBTtzeOK9x+p5pYHw64kgTsFSOp6AMOZ0Ik8E8gRZUVvTpQF5k7o1dRtldNhGYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7774
X-Proofpoint-ORIG-GUID: RQ6Qo4hU7MbXuKmyiH5K__xURPiNr78I
X-Proofpoint-GUID: RQ6Qo4hU7MbXuKmyiH5K__xURPiNr78I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_16,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=990 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 01:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178518

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Since we removed the openssh dependency[1] on rng-tools, there are no package requiring
rng-tools in oe-core, meta-oe, meta-virt, one of the reasons for keeping rng-tools
build into the image is that it can be used to test[2], so adding an option to disable
rngd daemon by default since the linux-5.6 and later /dev/random won't block anymore[3].

By default, this option set to 0 to disable the rngd start, when this option set to 1, the
rngd daemon would start normally (if someone really need it).

Reference:
[1] https://git.openembedded.org/openembedded-core/commit/?id=868dfb46d96a27ec9041cb902fb769330277257d
[2] https://linux.die.net/man/1/rngtest
[3] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../rng-tools/rng-tools/default               |  1 +
 meta/recipes-support/rng-tools/rng-tools/init | 42 ++++++++++++-------
 .../rng-tools/rng-tools/rng-tools.service     |  2 +-
 3 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
index b9f8e03635..02659742fd 100644
--- a/meta/recipes-support/rng-tools/rng-tools/default
+++ b/meta/recipes-support/rng-tools/rng-tools/default
@@ -1 +1,2 @@
 EXTRA_ARGS="-r /dev/hwrng"
+RUN_RNGD=0
diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
index 13f0ecd37c..6c8ce00104 100644
--- a/meta/recipes-support/rng-tools/rng-tools/init
+++ b/meta/recipes-support/rng-tools/rng-tools/init
@@ -12,27 +12,39 @@ test -x "$rngd" || exit 1
 
 case "$1" in
   start)
-    echo -n "Starting random number generator daemon"
-    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
-    echo "."
+    if [ $RUN_RNGD = 1 ]
+    then
+        echo -n "Starting random number generator daemon"
+        start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
+        echo "."
+    fi
     ;;
   stop)
-    echo -n "Stopping random number generator daemon"
-    start-stop-daemon -K -q -n rngd
-    echo "."
+    if [ $RUN_RNGD = 1 ]
+    then
+        echo -n "Stopping random number generator daemon"
+        start-stop-daemon -K -q -n rngd
+        echo "."
+    fi
     ;;
   reload|force-reload)
-    echo -n "Signalling rng daemon restart"
-    start-stop-daemon -K -q -s 1 -x $rngd
-    start-stop-daemon -K -q -s 1 -x $rngd
+    if [ $RUN_RNGD = 1 ]
+    then
+        echo -n "Signalling rng daemon restart"
+        start-stop-daemon -K -q -s 1 -x $rngd
+        start-stop-daemon -K -q -s 1 -x $rngd
+    fi
     ;;
   restart)
-    echo -n "Stopping random number generator daemon"
-    start-stop-daemon -K -q -n rngd
-    echo "."
-    echo -n "Starting random number generator daemon"
-    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
-    echo "."
+    if [ $RUN_RNGD = 1 ]
+    then
+        echo -n "Stopping random number generator daemon"
+        start-stop-daemon -K -q -n rngd
+        echo "."
+        echo -n "Starting random number generator daemon"
+        start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
+        echo "."
+    fi
     ;;
   *)
     echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restart|force-reload}"
diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
index 5ae2fba215..be88ab125a 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
@@ -7,7 +7,7 @@ ConditionVirtualization=!container
 
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
-ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
+ExecStart=/bin/sh -c '[ x$RUN_RNGD != x1 ] || exec @SBINDIR@/rngd -f $EXTRA_ARGS '
 CapabilityBoundingSet=CAP_SYS_ADMIN
 IPAddressDeny=any
 LockPersonality=yes
-- 
2.34.1


