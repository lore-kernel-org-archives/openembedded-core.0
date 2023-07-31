Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82142C41513
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:53:41 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.91])
 by mx.groups.io with SMTP id smtpd.web10.5473.1690840418721861909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=GNQASt18;
 spf=pass (domain: ni.com, ip: 40.107.94.91, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrZWTS4SezRvmh1tl47LzTmiRb+uo+doYQKygI8/MHSGx2AfyR1mJpNEAB9iTWhQ2L1t7B3MkuqbeqMQlY3qLNfCpj0BBNh67tOCFtBu5jkYvY9n5Vh6vGb21N+cM1kjBRT2dxJd70zw2bO2v6omW+r8alC1dKE+sDjDwGBUbn2NfsIDs2BBRbKVRKPBnb8QGwyupHqszz4cReBPTuIXUEYxc8gvaIrLptIR1cIai9M0uTNQvAXQaDvJg562ay/RACqr6C2x23iUCuiYcUGLxgPjhdyc6xihX+s6bUMss9/PGmrTfSdvPzyWAZX7x98XKs+WtPZ0LoHLXil7yT5Xhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXky5BQUCr8iWXgm6MIstxc+w6aBYz0o5M+YQMtgtPI=;
 b=Joo6ivB+FIqvUIMDuG2a6sVP/ZgwF3ghL7vGgGiwn9FLjybxGydbW3yvWhce9L16C3zxkRBFuLH4NzGpnCUEqRE/5oaCxs6Gz2FarcvEotFKKvyUcLmAHL+mihHNTSzB45zzlHn1mfGPVKpzK+QdZQIufd336kdtZ8uvYjXtAcWBEw9zgS6jFl5uVfWCvqgYYgxBo9uBufk2r3oiTMSwMk0YXr5OW+BVuRncEbD1rRz42eBIvp2/N84rD2ktHEd3BhO2RNxN7rA9eNpY0XILiJMo5e+aZGKM3Mi0mnkuMQy24/nYljE/PZTrB9MhGqG3v1sMbtVDpGRzsRPylYoXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXky5BQUCr8iWXgm6MIstxc+w6aBYz0o5M+YQMtgtPI=;
 b=GNQASt18Z4R2qqORvgC0qFSFJT7j1PuMV8tvg5nSBkm76uvGh+6uUiJ7n28w6Om7XmSBnLeleIINK47sw+bKQ2r0mMdc3cNGyIJcHYlAhi1+y1tnUQvhZ9Rdph4aBaUlN+qYelFPQtgpFhujtSL3KFPmkyOkBxiF+bYfobhiDps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ2PR04MB8510.namprd04.prod.outlook.com (2603:10b6:a03:4fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 21:53:36 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 21:53:36 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH v2 6/6] packagefeed.bbclass: Add cleanfunc for cleaning feeds.
Date: Mon, 31 Jul 2023 16:43:03 -0500
Message-ID: <20230731215310.3949441-7-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731215310.3949441-1-charlie.johnston@ni.com>
References: <20230731215310.3949441-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:806:6e::35) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ2PR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c87ba2-324f-4233-2fca-08db921097c2
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	51umvytwif7H1PkljjtioaZG8fYxMkBlYBSmqc+Lb+WXGoS+JXf0t0bFRp1NV4EMwTm63tX98FhAaB9Rcpd6xeV5CT0Kk/+d+jUQjhKd5+CN0uh3AO4nsG0V6q2qcKzeCzgQlqhKOMsUgl/wcnsAKo2xOBivS9MeQZaGX+fmZZJZcQuPdi4SaejZmGLa00J1JYrWjiP4KA/9/OgwURx4KR8rIYyiwuX9SaboyqlSaW1N9ujy88NgAct7iivF5oPFFufPtXYrFnap6fa0r8irfN9pKRyhfLC6KZ1wMQtv6pDtTfltWDWF8gPIQjsru6oXpc2ORu+VKnAT7Rf8I3qNOwc7wTCqINAegWbMsZWx14zJ8ejVXPmBxL+TjDfSg9slB0/A3tSaKFZiIgJE4jAaR648yGsx4dj5k7sP8WsRvF0PvhQPyvy4cUhmSY0cA/9HTTymSOHdDZcH1gKlWVk7v42AmdBMZa9FPz5SYWTdFy1PX+9qnb52i0WMBCjhgNX8krZRWhLY1pDNlXiJ5pEoX7JbSK3V4CkIC0SzT5TkQq1+5Fo3uRPd39R335YbCsOk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(44832011)(6512007)(6486002)(36756003)(2616005)(26005)(1076003)(6506007)(83380400001)(186003)(66946007)(66556008)(41300700001)(38100700002)(66476007)(86362001)(316002)(4326008)(5660300002)(8936002)(6916009)(8676002)(2906002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AetZZ51BOA5NiMg8iZDJgnW715TVxgcpB4HNLHy14milb8mDa78QkK2fVu5k?=
 =?us-ascii?Q?nQ8FVDadIyK1VqrmI06eRTzkekzuvrj0QQ/nEirMYKvNpVvJieN+vzu1qM8y?=
 =?us-ascii?Q?QvJjVMpW7MasfNv7SjpMFiD0IpHE7UpyKPSUDKHbcaM0J2it5MDYV6xTjtQP?=
 =?us-ascii?Q?7z4s00ztWMOnRKbGfumUMKrnSYo84BJPfITLHrkWP7JV9k97M+R6gO48cZ9P?=
 =?us-ascii?Q?zDd4YQnoUXJH0guAsH0AKQ6ka9ObHDk/APKSWtw0HPWhwm4xAyFDOTyVD8q8?=
 =?us-ascii?Q?OAObaL2yftbmrWvE13CUJWdpxipRTX1UGCucLN4xLM0QoR12FCYFmwgdhKdM?=
 =?us-ascii?Q?L3GIZWWVNaRZIwlX3eLxCsEIjGLRm4Kf2rzz2xwDCrhe9JPTWDFNDJA/M+E2?=
 =?us-ascii?Q?jkR/3gtb3Uok3DiOaOn9KOfub0PUI4dc2uCqiFcT1bKdoi8xbJxigLHsYDL/?=
 =?us-ascii?Q?ysJctO5EIto5QWCz+y4A0vBViTVhMsBU8yiAFuVexolKv1WRxefj9Auf+c2/?=
 =?us-ascii?Q?ez5lqMDIZXE57+HTotd3mc+LU/eSLeOCuyVWgze47Ar83xGV8pBNg3o9SJu+?=
 =?us-ascii?Q?D84anpj4+5nIvJtk97IWlvaiuMQeg2n+fQY4JrJeTRCNw5oWikTTuI2Qy2Fa?=
 =?us-ascii?Q?wI3PbZKN4m7QWW0TKrnDJLwdbiRI81ikvESfdUcn0Scj9S39Tl2pryRjPlJ0?=
 =?us-ascii?Q?yfZcsCbdJ9Xjgpj1b8VaXNE8RFLLBuNuZqi06M+clZzJNe6i9StCN20oIWPi?=
 =?us-ascii?Q?i2ks2kbifvkv5Bf5wXyPMa22FgaX9Q1lNWEC0tcKSnBpd3sZomS+FeTDDh6n?=
 =?us-ascii?Q?OcayBeGGrifXQATDQ1LHoyWVoDEzl1BxJVCKQJ1iRFrZFj5bKA2/ZjXMA35K?=
 =?us-ascii?Q?+MzM5/upX2PPjwiHdCF2D8UU2Lw87vCZF0MxTx/HrPNSxkqDhETWG5KHi5ls?=
 =?us-ascii?Q?uFcqZ28DNMlWJbvL56Ye4iIx64HwxMxw4cp9Ck5uyczUIYMVZzh7Uc1MmnlY?=
 =?us-ascii?Q?TeUNIgo8xaV8haK9+if8lNpZ5JP4oMTHUML+fuMberZi7VtIploHoWHMC//3?=
 =?us-ascii?Q?c4G1bOIdQNkiwej88qxq0mb5FTEl/Z9i2U8WuwStHyatgFdsBG9f4svmWakT?=
 =?us-ascii?Q?wYlvxAO4BrEAN8mx33QkWH31sp1Y5T1vfl2QZ453FI52Bjce8A21W1wnH28l?=
 =?us-ascii?Q?gfGKKatT4i5SrVj6O8HC3c7G9TLBI7iD73nntnAdCOq0+9gbR1zUqOU8D9hM?=
 =?us-ascii?Q?H9fqDlonFswiPOpj7x3U3Gx+lrKiG2W//IQbJBjlb9h+ZJrZ6W+HNVwDeliU?=
 =?us-ascii?Q?8upLFjADK+9X3Fcew1sOZfOzEKaFoOt8v8v7a83TR5sKO07rw0t4wwqRgLqp?=
 =?us-ascii?Q?z/LIc+szMwr0CpgS95WOTh6lOvCrm92+5JxxmkKHN803kfvfHy2URQMozXp/?=
 =?us-ascii?Q?JlvS45i6XGiswVsqLL/KxhLeGfKJdyBjErJWlXClSIOUfoAviL2g6TP0OHtr?=
 =?us-ascii?Q?WS6CRmsGH1IAvRVjp5w/BkY8lofhu8vX1sJfLR8bmj+dUn7i+InLGKd2seBF?=
 =?us-ascii?Q?qQfmLBS+8eg+zsSj4Lpp/bMoZMQTf1WRjGjckoVVKrITBW24VW1cSWrUCxoX?=
 =?us-ascii?Q?eA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c87ba2-324f-4233-2fca-08db921097c2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 21:53:36.7488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El2xP0iNpKqio7orssFzd0Rxxa/PlH+NOxjBcVbo834WMETcnMwq3rY3MQjeLqLr+grs2ceREK2ZQeT3FrHKDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185180

Since the packagefeed build logic does not use sstate,
the deploy directories will not be cleaned by a do_clean
or similar commands. This change adds a function to wipe
all feed deploy directories for the given feed when a
clean command is run. That is, regardless of the value
of PACKAGE_CLASSES, all <tmp>/feeds/<pkg_type>/<pn>
directories will be cleaned.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes-recipe/packagefeed.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/=
packagefeed.bbclass
index 04b45e7723..1df09b85c2 100644
--- a/meta/classes-recipe/packagefeed.bbclass
+++ b/meta/classes-recipe/packagefeed.bbclass
@@ -24,4 +24,16 @@ addtask packagefeed before do_build
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
+    deploy_dirs =3D [d.expand("${DEPLOY_DIR_FEED_DEB}/${PN}"),
+                   d.expand("${DEPLOY_DIR_FEED_IPK}/${PN}"),
+                   d.expand("${DEPLOY_DIR_FEED_RPM}/${PN}")]
+
+    for dir in deploy_dirs:
+        oe.path.remove(dir)
+}
--=20
2.41.0


