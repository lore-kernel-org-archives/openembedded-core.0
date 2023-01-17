Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748AEC54EBE
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 02:05:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.187006.1673921149306706540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 18:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03811263df=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H23GNP028266
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 18:05:49 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqa36x-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 18:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtT0bwu8eZBWthBkt9iOxkDa/2hnT+VuQkUiZlkcIvCAsZATTQ35IINgScuayGWqFZsnI3/KLOsGN7i/DDN74H7oawF8r7il/TajebcrCzpOjkpodvgS/eWG5tr8Lk8xHeipZimomhsP//xvBCKaq/undYOk5MIXuGXvtrBospLoh5FqjnINE1XcZO9QUht4rnZkT6v72pjC+r08o0HCl14uSW3rMtJsMdEkxlr5kvR8zKAR4ZaclW0y309HK7nplUEsX6QTmzXN45IuBVRthC18u2Pbrs5U4V4ppyQwGhR3gVNO8sqxk7jTkrVd3HdE6CtFMxi5nJw44Of0p4rlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CBD8yB8mVd1nM/EAHxaBUjgIPYw/NWa6BCjjcDE3QQ=;
 b=eZ1E/dgavJlqJVcCM1h78149p24Oc1pdQi5A7xwZ35t5RsO2XYwlAXBnUV9+PUI/W3IsS9cX7WFXio8VOm3IY1L6Pqk3wHiNk/joP7ogcJi7lv4BFPHfSJdOdpp6+fJpx24U/zZUVTBWHYaehfsREjiInZ8/iRcHiWpEWTXKJigwJyuomqTRJxmt2AAydXDJ4tQMfrhzac/Gx8F8fpSA4R7HpKS9y3Qg/x4j3XzE/xIOdDcP9QSrAGvUyc8dYwByF4CPu2pL7uRiK1T4PPCtHtHGWx0sIojPFB7xHV9WYV3KgtkJFfAB+MGTQAAlCLOLbyWB9mfK57CjeAUr2/Sd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 02:05:47 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 02:05:47 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH 2/3] runqemu: add process of option QB_NFSROOTFS_EXTRA_OPT
Date: Tue, 17 Jan 2023 10:05:03 +0800
Message-Id: <20230117020504.697181-3-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
References: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: a76b0a3d-b9fe-4c6c-804c-08daf82f5952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ByF9xsXAg0w72ffdEIdnmNubYMU8gZUFDe3QdGmxIWhAWMrkiDw5B3aRgCbQ4CFKLJlL/l2ivcB7pmCiFkjVpy8PxkZmF9Hq+E+bQVfHUqkHSt86cvU88W/Xxq5LUaheoGFCiBAuZUH/9GqEt3+qn3MsF+RoZrfpUC5qiU8ibTKyYWVglmSyVIq2YHoBXVtXcglqoW1W2mgydjRJHgX5I2SPVzvRvUF5pa9gBh9VovO2iIcp9hN0zWgjA93OeHnJVn+/CEOZ2jj05TVET+rB634jIzN/8NUCesE8uXxTQcekHQ8csAvToxjUQ7DmP6fJeKzhyBnXX7J1Tcg/gi4WeX0atAHoIFGoABVwkKVTSV5K+g2tB100GaB9ENKop9bS+SFhA+LrckxPrI86wt28m5xGXHUWE+bhlfbTRf7Shxr6Ttm5Q7b10PPqBxRSvadGtzEwMeRodI17eoXtYUUbuyWONK8cx5hUkqAIUkG1uCiiBgssbrgfWaCzir4INf8RS0QPj3Dru5FsJMlZRJoaIWhl/rxi82GFzX/EfOJHM3blAoX70yL6wKSk5mNg9uc8sJW/FjQZKWR9bVQhZ1ADvJRVZjH1hCti0/uOIcD6jLSayN4V7X8hpTDfF42nhHdArGW5KV8R4yVmvF7fgvqmF1K9Bi6Vc5BZhZlhI976a8J+rYjfCscim7CrPbZgJWmFEPwyzCZzadMdDuKkgfO2kA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(6486002)(478600001)(8936002)(44832011)(5660300002)(6916009)(41300700001)(66556008)(66476007)(26005)(66946007)(8676002)(2906002)(316002)(83170400001)(52116002)(38100700002)(38350700002)(6506007)(6666004)(1076003)(6512007)(186003)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CRSWX5B3TteTl4GWvmkXxD7ou4FS8+hdg90tmSJu5WULUVzegIPbZ+gwBtNg?=
 =?us-ascii?Q?CHUa8MqIYZSiPQFP1akf95d/AfwpuwOe4OzOsESQU5TvcyemPs52MJ3H5+Eb?=
 =?us-ascii?Q?jQwRGo4FvMZ1/t73fIHpu47hor8IxcWmPMIz/qSqSPG5y0QaijCQoJOx6DPs?=
 =?us-ascii?Q?JGADZ6WSSmh5ienT6fR6NzaJ1GEd1069JvtK7x67ap8sEQj+OV2h5Ke38xnl?=
 =?us-ascii?Q?I91140u7dVNMWbm2/y9fR5TOmAXhBFvdo8onEwn72MriBIwE/gTwvCvfguGX?=
 =?us-ascii?Q?3JC7Igv8D7Rtz0Yh5kPx3awXOEq2Rw45tXbtcBguzzg2kHvQ3VR7Fmo5Udka?=
 =?us-ascii?Q?nnr7BZJVDgNeKxGs/sI/cEXYULCK8s9klFJIx+ac4ICQ3hWtxOYiWhGutBBv?=
 =?us-ascii?Q?DJnGMXGjA0fezK/hEy5xdlxXNzwwA2bka0oaZYslwK3HkTNkMS28NnXcAswi?=
 =?us-ascii?Q?ABBwYK9Q99mAbVMoziRk6iAg9IEe8UwBi1gJYJ3Uzsz1eBY80BysXr/j78vc?=
 =?us-ascii?Q?y9StZF99czwOcVK9pj29Jy/QiF4Or0XsClIDcwdMrfdGBIMsV2NcfsuFxOMM?=
 =?us-ascii?Q?FcUX3f5n4LSIkWgyW9Uy6Mhqm6qBR/O4VGoT5iHBTdAnNfKERVj0Gi/JKTd5?=
 =?us-ascii?Q?xXFsgdDrCug7YaS4WbfPbsS6SFLliBY2f9DfnGZ6cOMnAE0X6iX2l5MEVXoD?=
 =?us-ascii?Q?2HdGEwFgFY2RfVZ5XTGXRxfi+D2xCSEcllUlMwQ6Jsl1m7PbgJpStZkmlJq6?=
 =?us-ascii?Q?2kKr/yU/Kt0Dp6KUrqYxlNFuH4AvvaJWf/DDTHCPAdZoITKw0jIdCdRUWsVn?=
 =?us-ascii?Q?qrauB8sqrstJzIzEnUeVrna/r4j9BtXmL2hXnL2aog9I+NFyEj/vIGVve2SM?=
 =?us-ascii?Q?e7e0Q+tPjGdG52+e8URDYXHPbnZQN4qKGWxsp++QcCUTE9Pa9G5iJKguvysL?=
 =?us-ascii?Q?v+m3O3+FKr8rqVFts2V4FH52PWJHRg6pEOpH9Nnonqdoj9f9zEsIsxv3kqhp?=
 =?us-ascii?Q?sSo6uPveUNJ/CyqzcIh1MDyma3h+eQnN38lwIFApe/J3PtraD+73ceCR0OFv?=
 =?us-ascii?Q?sLRfryk5HiyGt9+NekNEvZl3yWA4/b86BEyq8DJ24nSi6SeWgnzIbldy6xnP?=
 =?us-ascii?Q?ahnG132QFQfJO5TbC/vXOtHIjRLrVHVxGFGjmz89aUdIITI0JHCgMOVbgGta?=
 =?us-ascii?Q?O56aEU7+5d+iF07InymYdv0Q0ZdR1s7emB8rWVZvDjSeI96V89eVji4wK2/S?=
 =?us-ascii?Q?o29pgjmuy8AxZ6SDrtR0rAH5rP1SnQ3pUSJbi7NyF4FnXSbeuFaPLWcaEkXR?=
 =?us-ascii?Q?yY8x00RGXHx+weOQav6/mIjHdeRxv0eyog2czSAK9hoLDFR+ogF73k5oBSKa?=
 =?us-ascii?Q?J1E54ZqSwCsHeDZXpCwSswqyQWNnNCzW+ueQU29zpPMeG5lX4n7u1yk6vvWS?=
 =?us-ascii?Q?q5eV/sABwZ3aBcTuJW+sov5CmIjKVJjWF1PEZEGVZmq+Xufj+A3dn9aNEPRD?=
 =?us-ascii?Q?O1oJfyrk/xLpVsXVYhup6sPxovCiHO1GXxrKxCYa2WHjkR6l2dIqSpfN2qSK?=
 =?us-ascii?Q?O4oQ6S+CyrSmRk3VkEEuVasjs5BolT8sr+lZnILBb+IZRxj7vibFP51HjUkU?=
 =?us-ascii?Q?vQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76b0a3d-b9fe-4c6c-804c-08daf82f5952
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 02:05:47.4732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VWJSldJ+OZTwxO5pNpSohx97xreZnwGoW83T3RP8ZzlqrwWsUaKeYIe65Vzb9oiBb25OwczkDWKMhUJklEIWNfWvQFEirSpTRuxUncrpxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-Proofpoint-GUID: WxwOSBgL38aVZECAd4896RvfyHjvaHwG
X-Proofpoint-ORIG-GUID: WxwOSBgL38aVZECAd4896RvfyHjvaHwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_18,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=921 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 02:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176022

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This extra options to be appended to the nfs rootfs options in kernel
boot arg.

Example config with qemuppc64 in machine config:

add r/w size in the nfs rootfs extra option:
QB_NFSROOTFS_EXTRA_OPT = "wsize=524288,rsize=524288"

re-build and runqemu with nfs again, we can observe the kernel command
line added our defined value in QB_NFSROOTFS_EXTRA_OPT:

Kernel command line: root=/dev/nfs nfsroot=10.0.2.2:/home/xchen5/testing/build/tmp-glibc/deploy/images/qemuppc64/testnfs,nfsvers=3,port=3049,tcp,mountport=3048,wsize=524288,rsize=524288 rw  mem=256M ip=dhcp console=hvc0 console=hvc0 nohugevmalloc

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 scripts/runqemu | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ccc557f308..5907390573 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1022,7 +1022,11 @@ class BaseConfig(object):
             # Use '%s' since they are integers
             os.putenv(k, '%s' % v)
 
-        self.unfs_opts="nfsvers=3,port=%s,tcp,mountport=%s" % (nfsd_port, mountd_port)
+        qb_nfsrootfs_extra_opt = self.get("QB_NFSROOTFS_EXTRA_OPT")
+        if qb_nfsrootfs_extra_opt and not qb_nfsrootfs_extra_opt.startswith(","):
+            qb_nfsrootfs_extra_opt = "," + qb_nfsrootfs_extra_opt
+
+        self.unfs_opts="nfsvers=3,port=%s,tcp,mountport=%s%s" % (nfsd_port, mountd_port, qb_nfsrootfs_extra_opt)
 
         # Extract .tar.bz2 or .tar.bz if no nfs dir
         if not (self.rootfs and os.path.isdir(self.rootfs)):
-- 
2.34.1


