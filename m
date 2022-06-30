Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C0CC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 18:35:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28871.1656614134280540045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 11:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mqHK2fmK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4180e694f3=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25UFQ78O001894
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 11:35:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=nYUVSxr1wHw0vfggGrbFFJqZLbAVizl4f8HTT3EuaLs=;
 b=mqHK2fmKU5tuvcMrndRNYyykt1xPbJue0qQuxZvM1E4C6OgodF7UWkBzeMvfqCCwHDzv
 mtMSt4r148eXXAiEwYrPsKL5NgDZQ0GktThNDvbqHPyNdXVE05ipzmobs9HqpTGbmfFH
 FzdiwV3Bjae99R9hjK+ODS2vSdw5YyxAk2Z6qgTCzxAMBiasrk+e9Aa4LzoThTdTAn4A
 VwIWg0IEzLt6LrB8Lkda/MULp5WgDlDaS+K+mn5KDQSj1cLKlhlBGKt12bO4oRaQSQs9
 Vxm2KskX/XO8+tsfq4FTYxmBi6O2oYDW7xUw662ObmpL3hlLaxBQHPvDCkOJgFKtUV+U Tg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwwn4c80g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 11:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTwVV2+A3ag4uiWXmLCSAcKcs7GMGEszzGiggmeB+8SP7Y5MWFIZAHdGzhbAYIyQX+U2mXYQJ/+XKDzN8bSmP4AWj2LcUtaIH2nit2FV0qoY7YVweevsTOGdwr8j2V9KW5DS3ZZJu4lBiOVbTGmn4FqbEe4bbhljxvtvXPksyCET75HHoGBHy1UbI4PB7fEDMuG+vWZFC6y0yLCzcV2vgFw2Df1i6Fox+5CA4QDyflPsswx838lya9WMChq1zNLZRXrTTsCFDGhcEJm+26NNBECntf61Vj+116xYZ8Xfyypwe9dxXxMom3DjUL+pORCVq+1My1R9u1IedxIyXofuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYUVSxr1wHw0vfggGrbFFJqZLbAVizl4f8HTT3EuaLs=;
 b=ktov+of7l3/ALH0FQEcAcB7/1bGvMD69+f7GtQpVxFmkFYOFi2XsdnjiQUd8UIhRp57SMnE+meVLvRVfR5EHNQ0Cy+cW12uPFBozCjrFRAklT4ULCNQmKIPRjKctXgKUXzQg24LWs1JxUuMiB955i/a5EDh9PG6UBrCzwP/lLWdwc3jDMrLVSpy7/cADI9UbIZihMIZq6D9iDu1E3C+ODOEFNrVd0/5yMuRc2nSSWqhTdpCHmDF1inMwkM/UsOGIZSpuy1Wo1YRtRafAzD1EDgAjsNZt1GRYpyeGf48uDRwvtnouw2w191nWTI4ywJNRWa3dyPKb1Qli8gSUruE50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by BN6PR1101MB2308.namprd11.prod.outlook.com (2603:10b6:405:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 18:35:30 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 18:35:30 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildperf/base.py: skip reduced_proc_pressure directory
Date: Thu, 30 Jun 2022 14:35:17 -0400
Message-Id: <20220630183517.1633208-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0113.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::16) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7395b6d9-9ef2-43a0-0e63-08da5ac74f4c
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2308:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	54kkcq98PxvHJUUY29BWqr405MNAqwNSp+nEdf7pMeWZD7nUsTtqxB7eOf2P8umHekMXScLguK9TvJ3vr2Nm1EBZO0T6tB6+RifH+yCo6EtPAREMQaXNa+yJ6E/aaoMCwCMO8Qd89am0l/VfPlRoaqwoSd1zneRhoHxRmGhaOU77uzr7FKFVb2D/0Vixz9gsXQG1OHRfa0qmXMhHcdjKotLIFHH8KBW0yBs+kgPhhjsvW0Ba8WIKbvDePcMh8FaikuGJKdtsWYqsfkYIuAUL5C1GZ6dSzQjVZqcBcBGO49NbmpVqIUxI2UNu+qWwfONbu8KSicT8S/CFU+VtTd5XDWAxDbXezEJdvrf3frM6RIc4W7VafvKbz8jY/7iRQDPEJtAwbxJPIogrP2N+qM53qaXxtXwVFPfazhScIsIDj96wya81VRE7GWbFqXdW7SKjHplRSsD44X2VZrR6kpKAsd3dTdvF5HcOgLSOWtcFSgs3jogDvlO32Rv8KENYNHwLPHIMSQPhR/0mJwbGgHkKLT9fAY5UFEjQuZQ2R6+YX8hzxKGL2gz76q1cyK9zweXxGtdgSAbuy5hZ+ph5iqQPa6K1GWGe+0zwO0hfC1BDaZXtqhPNghSy2xJ574L0T8yP834lWfKZ9QOgYo2/qEvPg+usA3sg4Oei7kEwfo0A1ddblYRDwOphmsD78qayHVUDNcw1QIS/WZh2nUOG09SGA6npAolgc3DgAkyMLl355C4QCpYyMcXVwAaS0kl4cNwLdOEnZu2fpVAkv12XUwPEadS+nFl5EDiXpp9Hf8A3D+xh90Wlwd9OKR4riyezq8q7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(66476007)(66556008)(36756003)(8676002)(44832011)(66946007)(38100700002)(8936002)(316002)(6916009)(83380400001)(6486002)(5660300002)(478600001)(6512007)(26005)(2616005)(52116002)(1076003)(186003)(6506007)(41300700001)(2906002)(6666004)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XD38Ns5mjip6PK87VoPb3gZOJtZISNYJoe2XsQ2m70++4jWJ5LAGN/Cps3LT?=
 =?us-ascii?Q?Przm3j86mA3iuO9Aoa3H3h/cqO83Ia8gisVVBYzCo+MSGDuk/hMpbfwirZah?=
 =?us-ascii?Q?cwXiO9H82MwAVFd9mi4ccw6aSAxsoInEJb3sSS6WeXKKUKcmF1JWWdWy4CMN?=
 =?us-ascii?Q?zmdARG+0zkT24Ly9jK47ypITY62kjmol3uJPrHM7sssFN1RjwHRQXBgADRye?=
 =?us-ascii?Q?E8/fX5mEYK9EVnpRQlZ9cfr5fCcJyeC4Bz4jhDOdBZUqGPuovebsHWNeAFZt?=
 =?us-ascii?Q?63xHUMRLj1B0tCrLShB8f5cthVQPqJ4ERuVO6CpLSipZ+J+by28w6Oap9c9o?=
 =?us-ascii?Q?LAQOmyprRiBH9qSpwweHfIWAKjDxs+sV9pi2FHRqcuiw3YQoGUSlP8Qme/Rv?=
 =?us-ascii?Q?Y90FrZLHabQU5o/Tl0QWByqbHaa3A5BgXS4PIh5MnLagOR1KqyegkM+Az+MY?=
 =?us-ascii?Q?QukTCZqC/ccmnpDy1pgM00mdnZVYgBsyB/1A4VGIjl2RpTCNcGZ9JT/Ue/6/?=
 =?us-ascii?Q?a3MQAwhJU1zwlkGewSTx6gjyGAs23Z6DbsEzjZL1RGu7iE/5akYBj3a6qTFx?=
 =?us-ascii?Q?YYxLgvZqcbb0o3Mq0qR7mjZjOmVzOFGhP0aDBYlZq2+LF9iAS+4SkbV4E2j9?=
 =?us-ascii?Q?G3cwN26Jz9YkNhWM/BTSn1N7TU9NoZaQla9HbBrDYIxWcYlp8CjsqDYmmNnd?=
 =?us-ascii?Q?0ChuxdVWh1R1CO95QhC7629zsGXrH9gvMSolHBmZ4E/l5lJFlcmPdN3t82eA?=
 =?us-ascii?Q?ByFS1pLbCwsR0QqhyHmeDP0E/covYZFsVENiFzSv84hRsgXP0EBeNQxRN5GU?=
 =?us-ascii?Q?h0oRZ4uxX3dwzxjXpTsq8F93FfXlp7+CtN2fEDXzeIlbRuGEecSVczXFpl4U?=
 =?us-ascii?Q?hZBWY1ncNPuf84USj46uMMNLOdFTUlxpWA6qxp/9XdLDly8PaNP8i7UGNsfd?=
 =?us-ascii?Q?O5s+/B/wec3hde82bfGlyJkqbJp/9nUwnhbToaILj3Xq2iULhcnF6hgBiv3A?=
 =?us-ascii?Q?ZhN+DnXMZIyZNeVTlm/96JDcjENTWOUDrKMZvkYOdjdW4U1vj6p4r3LSouOK?=
 =?us-ascii?Q?MsYJWXOxm3ioVdM2sb87vB7E7bfRnHdmlLXmT0pf2eU0CwuR4LuxmzEeTN6n?=
 =?us-ascii?Q?iPtLT46JrSlEAJaaOFBPFUqm2UdzhYU7CGrhnueUv7r8LUDBcSZF4SmbntZ/?=
 =?us-ascii?Q?+YqoSWWm3DF/UJebxPdKLQVO7JnjLrE2Y55jrEMDH1NjEDog58QOltlIrpLX?=
 =?us-ascii?Q?KqDmYAy2whvdisbmv7KdYtId7TXBo6j1Towjrc1HIkxug3aQyJNbr4fJ6sso?=
 =?us-ascii?Q?Qq/AYQ1PAxFmd/2AH5yH4Chu/bf1P7D71fvPuE8Y1a/C6NQwlKQcH6vfw9a1?=
 =?us-ascii?Q?IBxPgjE650/AJHMQRZoA3SLmAnGuXq9o3ZmqUj8kG1bQxdqVMuxLjpIarw8E?=
 =?us-ascii?Q?bIhWqbVPx3s7U9+N/WYw6lwWO19NYlViQ1FSvAWbweKFmxyFFtcIDlJCJdOJ?=
 =?us-ascii?Q?vIWSMeLe2dgWx/A5O0zvpcrj6Eqb8h3d9eHYxBVSamGTi1GdGMfPrOUwAXCs?=
 =?us-ascii?Q?gZIWa97PmwtexQIazR9tdUU6D6unx8PYhl/BdVfpJEtvYD1e/7qqDq0sLzQ2?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7395b6d9-9ef2-43a0-0e63-08da5ac74f4c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 18:35:30.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +AfmdueJeRUolEqk0Zuushw9pZorVU6jHfVkQWP1wGI6CoAcQLF+2aXBGxB9/dtilwt0J9HTV8UqHEc5F1wdIML3U+1kCiH36HeOL2xA704=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2308
X-Proofpoint-ORIG-GUID: 2McrGQGuywzaJZCW68VYxdxk2_4ZFX6n
X-Proofpoint-GUID: 2McrGQGuywzaJZCW68VYxdxk2_4ZFX6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=540 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 18:35:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167432

Buildperf was designed to skip all non-directories under buildstats, i.e. proc
log files. With the /proc/pressure stats being collected in a new directory,
the following error was seen:
	meta/lib/oeqa/buildperf/base.py", line 392, in split_nevr
    	n_e_v, revision = nevr.rsplit('-', 1)
	ValueError: not enough values to unpack (expected 2, got 1)

Add an additional check to skip the reduced_proc_pressure directory.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
---
 meta/lib/oeqa/buildperf/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 5f1805d86c..5d656c781a 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -444,7 +444,7 @@ class BuildPerfTestCase(unittest.TestCase):
         buildstats = []
         for fname in os.listdir(bs_dir):
             recipe_dir = os.path.join(bs_dir, fname)
-            if not os.path.isdir(recipe_dir):
+            if not os.path.isdir(recipe_dir) or fname == "reduced_proc_pressure":
                 continue
             name, epoch, version, revision = split_nevr(fname)
             recipe_bs = OrderedDict((('name', name),
-- 
2.35.1


