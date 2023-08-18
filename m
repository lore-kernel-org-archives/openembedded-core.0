Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E34EE4987
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:20 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.135])
 by mx.groups.io with SMTP id smtpd.web10.864.1692380896295340605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=JI5VkgEz;
 spf=pass (domain: ni.com, ip: 40.107.93.135, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVOlbxZAzdFDxJNNMcdTkFAGwQlYrzUk4JSSYQGvKFwWpp7QxA1s5kRiRq5G0e7rXB+VeBOF4vicZ53mSfsb418C7GKG1rKWkB8fwM7L4kL1ltGvIiesj1p/RvVILz3nPwBE/sAeHzaiq5gIGgvfP8KUYX8pgHYO7kYrq2z5ODsDUokyAwTPCEeMEj8jYhuexAO0IbEUV8Fz8T260zxWMN+yH4ijmTv/zjF+PvjwKKUzm9G4+/hPWkx6IubkjcXqMLscRwfNnD61kIqoPITsapVa/RzrU/d9isF0pJerSzVrKpNfFWV80R0CxP3QXummKN6HITBJhedBLuJKVRmCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xA6Fb/jKlrZKk6psnkQDezoT+MBLnLBH0BMZaqIQDY=;
 b=QwFtZrHBV9n+RsZnivlgVbB1Ou8cp51rYd3miAoJHW16tngtx3p3GFUzOZjt+KLsmA+8CNP7erDbl9q7B5iPTYSifVjxi8Ih6r/BV9j+mGpq2ORuRHG24UzstM3K/QEQ6Q6QYypDfaZwQlQrvpEfm1unzf/DIYj36pmaHzTbocXKq3MckRLH6F9pMekAqIH0VQPEaZq+UhNbVDOWnXBi2167JGkihbQmnUJwFoGXqWaBuDftMWASOO6wIahFjZiWQeQRzt50Y1ySBavCIOoTODhC5Gzw7r8X/G2Gvt8Sr33u5GLxXa+FbD+cFxut49/Or2T0Wjto3w6nwlRhb7DuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xA6Fb/jKlrZKk6psnkQDezoT+MBLnLBH0BMZaqIQDY=;
 b=JI5VkgEzs99k/hXnsTpPJhtEZsjKw6CRBoDjfpTPWPZqTPhBnSwqPohui7fNYGVsey1sYWoSLRAINz/5niJg5QpcHYVqdt9GA5GXyjM4xRVoH9465NuQgO9Osl+2Cvv2UH4IcSWo/vjVqou9iekB/NlXud7//3hfrl/i3qBx1ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ2PR04MB9012.namprd04.prod.outlook.com (2603:10b6:a03:563::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 17:48:13 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:13 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v3 3/8] package_manager: Add _find_task_pkg_deps helper method.
Date: Fri, 18 Aug 2023 12:44:52 -0500
Message-ID: <20230818174754.988128-4-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0104.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::14) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|SJ2PR04MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: ca569df6-ce2b-4453-7174-08dba0134b4d
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vqz43qCD94MFe/fA8Uu5bz63NPcrJnAiTkM0c8gGpKksLbehHWt8oVAr5jvmC8jZJEN3TU5p8aE2llzgo4UO8WwHelbIrqLhGEMk7QIA4YiAPFn9Tva7fpAMP/7/xTFoDwWaq4u4NMEjfST3xVg34osyDsJ+u4BjfX32kdD1Wz/6ZtX2yW9jtzOvbJfmiYppT+b2YtCQiFVKahuC5CGbMoxC1jf30MPPlSrpaK3yXHgHx+ue3y7xeBGucPKywLOIhVjUSN54WV8g7zddBqvVoeYH1X+BOsIzzrq02hPluUJykA3vwyncLaR639pr4/aD5HfBdzbUOrKDrCgYCEfWqGfvH+Mi89IYeI4VtxeTx5fd4aY3amIZJ6Rs46lCJH2oVJNPshaJfEcvzVhgRHpE3Pb9ykv2SgTp7zalE70tE0qex9LQoRMPt+jaugHjKmYgOVxPV313wAMvip4ohGBbM7q11/oK/zx9msdOstLRdkQDYhVbOkZeB8qmNszEl8+aaTj8afAMiEEywB9oLIklDYuLkSw66na7/84lAqiCTCRVKO32/WQBkduLjw0e43sD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(1076003)(6512007)(36756003)(44832011)(5660300002)(41300700001)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MSZXZk1xfCLoEjvewWMryK9Y3IUFKNT4UmVFsjxorDy1jlLmMalKW2NzTBNi?=
 =?us-ascii?Q?dKbr0aAcKDzV3EVGLHn124fPOlLAL2LXSl5wrghGAyzy9bl1mQrqgbCJ1HY4?=
 =?us-ascii?Q?GKzlZoIY9/jj9Q7U8N3pjrtvgaA8Nc5sSVIG37DVOhXJ8fL9zvZe4TCCePhY?=
 =?us-ascii?Q?KFjqiHtcTbcmvtiy504HB8b37bZbsPTkxxtlxGQIYSGd/LsNajN6cROJn96V?=
 =?us-ascii?Q?kUDXI1ix/jLK/I7NHOklqGSZtwt3fO18TmKl0tkCCJIajeq2Ky7uRia4IgA7?=
 =?us-ascii?Q?WxDYEfuUFhY7CyBgCGImXA3fDMsgxfCLEbnkPS0R0EruFY7h95Nw9IBrtEm9?=
 =?us-ascii?Q?Llf3vvlnZLppRa1z1MJeKSpLOrfanJJmNE8AVQhNO+bPQipr8Dcs3DtRkrTx?=
 =?us-ascii?Q?gK7L9uy78drxdd+O5f9NHvvTR/4DnW3JaKsD1VEGypzHaSnGyQrdhvAxYpZt?=
 =?us-ascii?Q?EiD+un8Rxag+eQF2W8c+sNcoOKeex8oG2EYabkAWIgnyAqC3d4ijBpW5xeUP?=
 =?us-ascii?Q?5re7P75xznPBYoLcvnj2TV4RkxRlFCXlX1zzr2BEMHPRtCDpCBgSy3MG65Xo?=
 =?us-ascii?Q?Ym6fcMOByTbII03M5s0Q2MdiwKhWaUiRi0JIJxPwSGuwMBnNhHOSBKs1osud?=
 =?us-ascii?Q?6AFm2KbuHmJEBSQKewNSGNQa+ExBpOcCg372VvqnAE5Pa/HxHuDYKrM5ckVs?=
 =?us-ascii?Q?5pKlhp2ZpWhH6lB5xmIYxz9DWH0UMlw6A49NkmHYwdVtFQZ30BKgtVUzT7Ta?=
 =?us-ascii?Q?jEd2J1Z/PJnq8pJr1257xiVmIlO5BVNr1tpE+IEmZGcaooUoQ2LgzgrvwZjq?=
 =?us-ascii?Q?hUpbVLUMGVcrsgkTWmMSRcP7rsdcuIZVx9RgaTVAfqfojATF7l7KNk3izgqU?=
 =?us-ascii?Q?Q65RNF+UfmsPgAbDs/g4iFW8qRhhCu8IbVUasHeIguYZTpmso8N0WE5oz5k0?=
 =?us-ascii?Q?iCbVMmSQhRUg3yJ9wLTSrpqdG7kyVLc/7LzF+qJZMCsSWdGn89R50o2kOSbq?=
 =?us-ascii?Q?HlKKbAUVYVcIabX+FEkwRNNQyPgfvmmqlwl4ZPKsw9PijJS8pakOAOi1AmVR?=
 =?us-ascii?Q?/2jJyvN7A0UeqTiBB074KiQYl90XT5pNZq2LcqAuf1rs49JNXmoSIiGnd+Ne?=
 =?us-ascii?Q?tbPyhGzTfRDPL8Rd7WdFYN8Bn/smLrl5ESP+kAlj3/hi2fkRfosu9nxDAbEa?=
 =?us-ascii?Q?6onuJ25JsMQHHkp4yQnLlYkj9vuhL4RIQBKQ8cvFlWLXeMen+ywE2YfSgxbC?=
 =?us-ascii?Q?73Jl8shdjkGapmH3Lj5DZF/3oc79P30ARYhzvJLtAl3E3awmm37qk+rfDuP6?=
 =?us-ascii?Q?pe80doU8R38RKOPu9fUO399ctN8Q31UwmNISn4TszK3zzgF89LsVcMTXhsb9?=
 =?us-ascii?Q?GZPhOtwDB9ZOK2tHoC5nAaNhGEtujXea3rqz+H6vKySv4eOibtlSbWbLCV9K?=
 =?us-ascii?Q?QXGus9cpVYuOTv1YqWcpcSPcRHp6r9h7hje4gqkRyPmDV6HEWuHbUVk4xxIY?=
 =?us-ascii?Q?iPr1t5ysP6Nxl6Rk70dGoao48/heEu6mpQ3KTBK36UYktnhWQSTlDZo1S7ez?=
 =?us-ascii?Q?gsjWRSXvaBYIxs9/xADUsVzwf1S86E24J7Aq7xexvAJFB1NyYyi6bgdFUsaQ?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca569df6-ce2b-4453-7174-08dba0134b4d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:13.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5YDXcRBXAALARcE1IVOJYh/LGfDNip6p5ku3Vm39VLngcDuO7QDVsmQjM7W0XjEhLTIU7ZiyDX43jZ7rBQtGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186386

To make the logic from create_feed_dir reusable, this
change splits the logic used to traverse the package
dependencies into a helper function.

Additionally, the logic used to find the initial task was
updated.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 51 +++++++++++++------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 7a5ecc98908..4c6b5452f80 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -476,31 +476,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
kname, filterbydependencie
                 oe.path.symlink(target, subrepo_dir + "/" + arch, True)
         return
=20
-    start =3D None
-    for dep in taskdepdata:
-        data =3D taskdepdata[dep]
-        if data[1] =3D=3D mytaskname and data[0] =3D=3D pn:
-            start =3D dep
-            break
-    if start is None:
-        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
-    pkgdeps =3D set()
-    start =3D [start]
-    seen =3D set(start)
-    # Support direct dependencies (do_rootfs -> do_package_write_X)
-    # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs=
 -> do_package_write_X)
-    while start:
-        next =3D []
-        for dep2 in start:
-            for dep in taskdepdata[dep2][3]:
-                if taskdepdata[dep][0] !=3D pn:
-                    if "do_" + taskname in dep:
-                        pkgdeps.add(dep)
-                elif dep not in seen:
-                    next.append(dep)
-                    seen.add(dep)
-        start =3D next
-
+    pkgdeps =3D _find_task_pkg_deps(pn, taskdepdata, mytaskname, taskname)
     for dep in pkgdeps:
         c =3D taskdepdata[dep][0]
         manifest, d2 =3D oe.sstatesig.find_sstate_manifest(c, taskdepdata[=
dep][2], taskname, d, multilibs)
@@ -536,6 +512,31 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
kname, filterbydependencie
                         raise
=20
=20
+def _find_task_pkg_deps(pn, taskdepdata, mytaskname, taskname):
+    start_task =3D next((dep for dep, data in taskdepdata.items()
+                  if data[1] =3D=3D mytaskname and data[0] =3D=3D pn), Non=
e)
+    if start_task is None:
+        bb.fatal("Couldn't find %s:%s in BB_TASKDEPDATA?" % (pn, mytasknam=
e))
+    pkgdeps =3D set()
+    tasks =3D [start_task]
+    seen =3D set(start_task)
+    # Support direct dependencies (do_rootfs -> do_package_write_X)
+    # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs=
 -> do_package_write_X)
+    while tasks:
+        new_tasks =3D []
+        for task in tasks:
+            deps =3D taskdepdata[task][3]
+            for dep in deps:
+                if taskdepdata[dep][0] !=3D pn:
+                    if "do_" + taskname in dep:
+                        pkgdeps.add(dep)
+                elif dep not in seen:
+                    new_tasks.append(dep)
+                    seen.add(dep)
+        tasks =3D new_tasks
+    return pkgdeps
+
+
 def generate_index_files(d, isFeed =3D False):
     from oe.package_manager.rpm import RpmSubdirIndexer
     from oe.package_manager.ipk import OpkgIndexer
--=20
2.41.0


