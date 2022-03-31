Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72659C433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 22:22:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3536.1648765337932162394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 15:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Xzecky1l;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1089597e26=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22VLpsWF007504
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 22:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=vgKzyhv+5pPoPkXizyHH7NWh/kyO3L1CHH6TwsqNwHQ=;
 b=Xzecky1lI3vypOh/Oaf5dzVXAwPzEN4ukmvzJEy70i7Xic9c60sc4eSPXFuQwpwPjzxy
 oSsYVpVtDIEsdIPpQlE/64+TnYIbF/t6p+1iglmTRGgfIGGWFYKsI+fL0/ic7HvWlFfm
 ohqsqJFyqSKHCzFYQjV11qhQftCEdpAV2ekBSGMkHSaMrpTk8hEdfQYWkwYWMQm5/A55
 hA74GkERi3XNxWG6yvsZplbZgOoM1rS+aODmoakIG9szrNZJFbCif2DDNEmqxYlI4uiN
 H4fXMKmifR9cHM9bSMZ25uZsicha7sFI4a+82mk3rLzTiP32WHggJPyTNMx/fs7TJ2o9 SQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1r2155f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 22:22:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/OHk5+cVIuQR/DkhZwg2sFyybBIQk/6vmP0S25GQYL2imvs17pY20RrxtpIhuegrfB7hOH2Y91DFtBf60ixwypJ8i901P98vMKq5miTnyx+1mflho1sMYZQskhfEqCb7rrvvFLmDUuD3vwx9KZBxL4Sj4keI7imQl490BVpRzUTkUmrvjo3qHGv+jQbhpvb3ZoU985jczGXUWSnDwMkluO8MnyCHxND6vve8wcnN8b+gxBAHxsa0HM3zN7WFoEyR70SfySJ5b0bJQF+BuAdn9MQgqNtBfFJibA5ul3xn2nWaGMiy48LejUnPgv8/6cVt/BaZ8QbNTLRIZVgZKe5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgKzyhv+5pPoPkXizyHH7NWh/kyO3L1CHH6TwsqNwHQ=;
 b=ikIfY6fhBxjtFs4P5iMbHsiHCiTxEVXXUcgSNPvpItUXM1mcNSTuNFv3Ul3lLN/68t+23M+CvGSM3kCKAb9qSwkgdqmNFdHEDATNnQ3QSAFvQVqg75nVv7skEkgVV7FlREeBR6XTl+FL8h5x0SmhycXLxGywMuxpt4cSRNL+hIdrtwS2UtcfHoOl2ZwC7cdP0dGotWsHvrwxQKsp71nd//nE6XDqrw24a3oWuQ2Mu2OWhnNJBOYKH1FwyDX3M7c7zuZdfKb/cAZjFtymijo7lqc85Rp51uJF9/XT7Yk1CXxDrahNMbWj1x9ys7otSrRokc36lR61w5gx4qZNpcELOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Thu, 31 Mar
 2022 22:22:15 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 22:22:14 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v2 1/3] busybox: Exclude .debug from depmod
Date: Thu, 31 Mar 2022 15:21:51 -0700
Message-Id: <20220331222153.76037-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0808e49-ac0d-4ca4-5b15-08da1364e88b
X-MS-TrafficTypeDiagnostic: CO6PR11MB5571:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5571202E6DE075847A76DF40EEE19@CO6PR11MB5571.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B3mxU3ikl7wE96R1AL5do/gRfaBiLnL/r796kc6Woi5oUeQqXN+O6wgt1+wsWc64+2r+5nMrfkUpfTOvQRwI4icVm/iCtjFTK0LQ/wTRGb9SOWU18lh0GXuB5mvyVfY9gcY3qis9iLtP0simjDu7t+kz5stNSE0g1YOwktvlWCBClMKXnTcyBsHG91OxenEU18aC4fn/W65oRBFtJ8ya8tVkcRTCAhjOJ7vGPqCIS8AnMvhx1VwBHy/VWzwQ+WPTuC1whJqNwWBnL8iXIfs1qVRbOWImS7+f1BcbGuMMQGJ8Vzn8dBZNmwxCMyoGvPkjPPpd3dajFqXrFKi1cyibOOLe+9tNit8nxwUluTxOvOMGloIdLWDVjE7Yy6kEorxIRk+HniF6e4ZCKP6p1UqO0rCHSjSxa4jfAYeShE4scDzlGQlVctSg4oJxdIYVnDsuvWsO3EhR+/cwfTWx2nXu7bhKvdFA03X3FQjURbD3pPU8w62IRCEGerH32TvzYEdynsNuXn14K3bHOa163/C4eKF6IKOO6kxQpvndBziF0l+J3NnjMPIOSIQ5S/LB3gsJrmob5a+QF8U26iwMsIOrktO0NhCRiYf8Cc6astHuDnyrIypsMXXeyi7xEVJq+tFTS+F82+i+G1HEdKyUD15lpsg9jiCSQI34IVwvk2masb3nH/4wlskaxSGYDbwdWUC2G4fVAg9VVKbgnHfLjywc+RWqAPj+oeie3j2G/qsdRbxcvzqmCYrGw2FRQoUU+xQ6mSRlpC4D9sYZBdASpxZIWFrgppG2U57QlD+1wS1+JMbTqdbrqdCaM989Q3iKbYV0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(1076003)(2616005)(6506007)(6666004)(107886003)(5660300002)(44832011)(8936002)(38100700002)(38350700002)(186003)(26005)(6486002)(86362001)(6512007)(508600001)(36756003)(316002)(6916009)(66556008)(66946007)(66476007)(2906002)(83380400001)(52116002)(8676002)(4326008)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nZB41bZd6gHLbDUFi+4gqz88zWYIY5kenUX8cUGNFdIYcBqerBVl06mDlmi/?=
 =?us-ascii?Q?PPGhecepzkTSZL8n3/JylAWD+bkeEcebZFsXyDjyNKovUkjCWkdYZ/qvofky?=
 =?us-ascii?Q?PmrienjmgsNqyBlC36DuEeGTFahcXNgLILW/Z53ZEotanH4TgCnXaduT5d3d?=
 =?us-ascii?Q?XW9bex8Zf6CcUOFjYLPBVASCmtjnWAYDyG4RmZoa5GHL4kiTlw5bS+LA0mEf?=
 =?us-ascii?Q?X/XtbPteZ958B2Gvj4lqsQdr7YjmY9EbnNeK9kDVRe2URLrlu5D+sPIDYKxu?=
 =?us-ascii?Q?HuM5IQr+x6LBkwi+y2VKS7vxU2py1a7FyX8wHtByJgyp9jjHsDK09AHsRWsx?=
 =?us-ascii?Q?RlFFCZ2996FNO0oyyx0DfiUWJe/sHLofK4Md7rTpjrjXQLpM18UfZEwf39NB?=
 =?us-ascii?Q?FTSrA7O1+cyQMrANDK9rDV//E4tRkpGmEaqesRD8O2sZRjfEAtBO8mi9Kwuq?=
 =?us-ascii?Q?wyDw2XwDawlwl5rcLqTQu2cces67fFuwOv7eYkXT4UP+lZbhdQSkRmwm/vRt?=
 =?us-ascii?Q?uqkgX4p42Ln4vzKQl5AHAcqLY4Cwbi+0kx5evnoj6sXHzbykKsNRhlBKGT/T?=
 =?us-ascii?Q?0t/XP4rwyx4lwQS4cGpC+oBKP/WhNEBVaQVS47GxITN5cciIbJy0YVf9Aqea?=
 =?us-ascii?Q?ko6el8TGCrB/teM4ksy7d9yjCrURk7a4U2+TKDQDmotNJlZ7e5CgB0EQgjiE?=
 =?us-ascii?Q?KydHn03EB5jbSZUCxqim15SYF4NlAg/S6+i/sz9+FtLp64yTtP30I2Fghvui?=
 =?us-ascii?Q?sfqxOhmBTAZa02XGPVH/RNz3cQa0Nx1wEAG8ftQIvMwMGMBoHD5SA0x6XxBy?=
 =?us-ascii?Q?bSRnXm0o82hVY7A2B+lvShPMWAwa9B9dyynXz08FKd2wm8yQIQbmiqm1M1l1?=
 =?us-ascii?Q?YKaxxOMHBgqlLrqXHeNnF/WckKwtG23iLkgvHSU8Ql1hISqaZYcyBe8g/HOG?=
 =?us-ascii?Q?gEIJsbyImJuYX8TDcSbe2E740rmj7K/KZGDj2GLEgf60hrLFUYSw4HOLO/ra?=
 =?us-ascii?Q?qdhZJgiRkYNHRsLdh1AVGG0BX9Gklc/TuENjJPP19iHry8PuZL4CY6+JdDoF?=
 =?us-ascii?Q?/P9ty6EQDSBlrkwiKNW67jmlltIZO8/ympuplBc3SjYO/JQ+pGzdOS7Yyjbq?=
 =?us-ascii?Q?kTvE4mBK4fkfZaBcCMF+mjq6y60VWk7rpZpMQ//k3ztZ3vp12FoZLpo0ATI4?=
 =?us-ascii?Q?5vqe5FAhhTr+5HATiAlsJ5UXsRIpdXlXHcwV2Xud3aEOtOorwmcL0YYMPm1f?=
 =?us-ascii?Q?V08TwnkRiSpJJZSA9eFFwjG4YH4qbb+P9AqOQZwLvnCUPknTKri6bKrzVUZE?=
 =?us-ascii?Q?nQPc21bZcDSS0DMbe4rmAHiy/LGtnvK959YSi4/S7yGKWjATJAcb/JPJAlvN?=
 =?us-ascii?Q?QVKNYzlaqj6+BXJ0/WoqIu1SzlftxYzfeNj5bFsJ7U3S2GQwrYK2Bulcd3l7?=
 =?us-ascii?Q?dEaqoDgAaNJbBcCvmUtCWySpTU3eTOPiJc7vxUioKIgQFItTcaKd4SGLUMNl?=
 =?us-ascii?Q?G/UbzCa/5qfaZq49ncWJ1AR0GJE/5juNXRaNNgARRSNf2PpXDJJpFXxrt74O?=
 =?us-ascii?Q?dI9pRQSUGVZklgxsZD9DsL8hy3HGqJSzQ4z+yS4Wl2mkn6LlhmEBluNy+MMN?=
 =?us-ascii?Q?fAzoJPguU0+wmOpFx6bId8eimb/Flkq0i7UTqER61wRNc8yCj4HVPAwFiCyo?=
 =?us-ascii?Q?4yfnlye04FqvHJv6tP56L77D54mOH7dEv/9JyEx3cDyTCh8rqxnn+I0Yk534?=
 =?us-ascii?Q?NGeY5KUbut7t+r5K7HMimwgFvFEUFTY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e0808e49-ac0d-4ca4-5b15-08da1364e88b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 22:22:14.8899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9XKPYUkOhajuHRXVmYNSzSEFJdR6iGajm+xASbrOPdXkr4EhEAegMIV+ApJm8xvVu+CVPsLumB1N3Xey4jleEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
X-Proofpoint-ORIG-GUID: bINMbw1vNx8VCu_sMh87oa01St-eqYFZ
X-Proofpoint-GUID: bINMbw1vNx8VCu_sMh87oa01St-eqYFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 22:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163873

As with the kmod version of depmod, exclude .debug from being
searched. Since busybox does not use the depmod.d and any 
configuration file option is ignored we just hardcode it.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 ...001-depmod-Ignore-.debug-directories.patch | 32 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
new file mode 100644
index 00000000000..354f83a4a5f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
@@ -0,0 +1,32 @@
+From 5f6ed003f10ee0bd4a508d5f59129a29f0920dfc Mon Sep 17 00:00:00 2001
+From: Saul Wold <saul.wold@windriver.com>
+Date: Thu, 31 Mar 2022 11:21:45 -0700
+Subject: [PATCH] depmod: Ignore .debug directories
+
+The .debug/<module>.ko files do not have the correct symbol information
+since it's split away from the actual <module>.ko file. Just ignore it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <saul.wold@windriver.com>
+---
+ modutils/depmod.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/modutils/depmod.c b/modutils/depmod.c
+index bb42bbe..aa5a2de 100644
+--- a/modutils/depmod.c
++++ b/modutils/depmod.c
+@@ -43,6 +43,9 @@ static int FAST_FUNC parse_module(struct recursive_state *state,
+ 	/* Arbitrary. Was sb->st_size, but that breaks .gz etc */
+ 	size_t len = (64*1024*1024 - 4096);
+ 
++	if (strstr(fname, ".debug") == NULL)
++		return TRUE;
++
+ 	if (strrstr(fname, ".ko") == NULL)
+ 		return TRUE;
+ 
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 7ce17170462..ab11f3d89a8 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -1,6 +1,7 @@
 require busybox.inc
 
 SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
+           file://0001-depmod-Ignore-.debug-directories.patch \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
-- 
2.31.1


