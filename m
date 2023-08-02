Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AF9C41513
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 21:40:53 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.94])
 by mx.groups.io with SMTP id smtpd.web11.569.1691012444686742684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 14:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=UGvHOT3k;
 spf=pass (domain: ni.com, ip: 40.107.244.94, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH5r81C4Bl9X8eVSWmezlNsJgwjbqwp+53j2Mm4G1Uo5OAaJTk0euJeDq0luzhq4mrNSXSNxo6yC+Ixr7eGNnxNtdnlssre7u8hDlDtYTUluzajwuoBMTeiR6XYhqteoKmIra5mdDeQYm7mLP4SJ2q87IwqeM6tQv9WsRMD5yOHr+1/9bWakGJvGalicLsq4G6xOZHK+1LJQf2m8zUdKUZPxN0UfPokSXdn8zj4/4GpetUDg59+MviFsEZmUj8VfBZWZUSu2eLFyoEAPx74qKQ/p+j7SALpfcOIiWl784HgXHxF7tJLlGWf1sHrfer1xsU12pF7Tqe9IFTAM5mw2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuPwA88eIXUpOOgCZaOYW5rrr+ec8kp5dtlBDAw1nJU=;
 b=GXw55GQz8L0K4jqbpw99VggxKsVz3bLjGMafWSV9ZptM+LHvqQAtr+D2bbZ6BZq7+x3vh7gpHeUuLD1967PeIHCavBNmyCpzL6gB81Z4OgQkN5V0dL49Nv/Z4gug7XDsZ44UpHlV/EMgiZ/VpJOO2z4Xp3V0bvySG07vvTtLl7XCKTYNmegYmU9Op5dA+rSVgbNz/hRvdPNqjhIhBvU8360OFu+jtOCCT7wPLwTyxDaifWry1U10xem5zMKNfA45B3dtp4ItJA8yFndNKzRH+BOBl+giE2fy3o8fDk48GthapTzj/MFhFySZbe6hql3TvWOiwIX+4vYa5WFrrPUzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuPwA88eIXUpOOgCZaOYW5rrr+ec8kp5dtlBDAw1nJU=;
 b=UGvHOT3k4cGkdv/+zUEWQZpsFXoEbVrkgBFmGJr4moCpD1/nN7fpuKZUEtA0oQeXHc4dX+T01Z6Prn60OnHpXORVB12LleQsAEO0iF3DsC5+PsxdljrxKbPMMLPCNwQz9lZeZoO62XOiwU0UOIv5GJ9+9dHHAFnFgmkpkbb+P4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7294.namprd04.prod.outlook.com (2603:10b6:a03:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 21:40:42 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 21:40:42 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH 3/6] package_manager: Add _find_task_pkg_deps helper method.
Date: Wed,  2 Aug 2023 16:35:07 -0500
Message-ID: <20230802214019.1068795-4-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802214019.1068795-1-charlie.johnston@ni.com>
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR10CA0035.namprd10.prod.outlook.com
 (2603:10b6:5:60::48) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cccf26-0445-4bac-3015-08db93a11f0e
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZRyijzxkhc53hyhHR0NXE643z/0EF4oMqAIbqS9kjvqUJDiOC+wSeP504NBGkUddMfBaJFot20vbBrc2H6QWSymqKqwQNwCka75kod/YFqWg4QN2LIcUPxPc+J9n9NGNdlY7bqL7FlDZhzDFkEX8tKqX0bvYXxQUVAcokva4gvKQxJWE9Xi6eXkEjDyJtixP52d6cB/YjYBBOyvjmeO8GRHHXWDf0hHy8jkETMgcliuMISgShlTcffcuS0yyzk1ZET6qq7fAIJZx+CMap8jGloV/vYgZty2Pd9IwTE+h6vqe0a1IGC1kroJMSNqzIcVEbWH/tA7w/UM+J0Pia1QdhF+O8IMympXHXOmfEumdpSuRAcanC3osbkhRXE4GI3JZS39vq3yVP3Ld+Coed6waHWmP6w3GkVzKkfp2RqEFJPkw90pAAtP2HcXrhBWLSJMEy1/uH8zYYzH6SL/+cyLqOnQw70voxxdzauD3ykp0FDu/V64CG43VH7bgw8AoTXFYVmnn+v1RSikDr4ymW8DWDT5g2b5QjdsjrRz+lhtTPCSuy91J/WwBG9JphVvIwHPb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(8676002)(5660300002)(83380400001)(2616005)(41300700001)(38100700002)(316002)(186003)(8936002)(1076003)(6506007)(26005)(4326008)(6916009)(66946007)(86362001)(66556008)(66476007)(6512007)(2906002)(6666004)(6486002)(36756003)(478600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DDbizLHcuK0ZcG98DCjM7CSNjh6yZXzFxAlZZqikLjiHnu+66Ra/RP3kgOro?=
 =?us-ascii?Q?XygnmFVxDScCgkEOWrTOnSfK06f72OneIqkYLdufPPHCSGkNe5vm5MBsb6x4?=
 =?us-ascii?Q?WoasH08d+r/8AZoz88GjxaIv9LSSW0Vol6o6oQZ2hQQ1Y/HickCrga+Z9co+?=
 =?us-ascii?Q?qeYFbpLpZEjeUtlZMp3XXb3Wq1TXmpJeefFqoYA6rUijah3IBYK3vSnPd14D?=
 =?us-ascii?Q?AD+0RlxP3mrnmeHv/Q10pDQHHHw1i32Nrd3KsUU+sciOMaX7k95Uz7oboGdv?=
 =?us-ascii?Q?KjdicJtwxb8kL/kkqVRC+sOnyDhigMNIR9zHp8JSBosoazwdK12oxg5LH3ow?=
 =?us-ascii?Q?ZanHQ1k4+FyocNB/oQlTGqr2DigU5eQ9J2RtOboDPJbBIIwnMYdkRKOX/Lq1?=
 =?us-ascii?Q?fJGNgyxEjzLJ3PHPDkz5bzN0WWNEblLkRjpCKtbaTFTi3t3igil3MlZkl/o3?=
 =?us-ascii?Q?mOXFyVYZm6p57C41Qp1KJT6ghCL9jka6eyIfWgj8/RrKpDqEdej6ZsXKs3yL?=
 =?us-ascii?Q?V1r2Fy8xB5cTE5NnRk/9Du2YAlcfkG6EHTCzWhW9K6CG/gzqO1cjpMK0Ji9O?=
 =?us-ascii?Q?PA8BWVI6tSkq2HXEDiXs9utctIXqLBO4ZJmJ0lGQFJTvhPUlo8j5Mi0ine5V?=
 =?us-ascii?Q?lbIlQlmwNzy27pBs7WVF8P3/qxVvRR3o9WRpapI6K8gViVCCtbF/gaVircz7?=
 =?us-ascii?Q?A56QdEGB59pFuSC1uA5AnhbQC1NNnQTsNsvu69wngJBbee/GgZuciaOfn/+u?=
 =?us-ascii?Q?0L6SZcRq62nxM2PXp2X4CChN6/RMZsSJlF9rGYnMmPJYoxFdbGZPfO4b8BWI?=
 =?us-ascii?Q?4JKc5ZLvCvqBKkRHe5FLwLUYEkkAyHP1KrwhAKhuARk3CkiZ8OJj4XX1t9a+?=
 =?us-ascii?Q?kcFI6EZx3J5KBUFmZMtnbnNIsCoBdD8O6nY3c0+yCjW6gxaTqGuNETKAxa3Z?=
 =?us-ascii?Q?Lw+3CuYX2a7y8q0JwT40KzUsjUSXGOCkUMElqSXHpjd4l+i2fEm5xaWhja7q?=
 =?us-ascii?Q?lBochvbEyu4QPoJ90bj0hDcBy+Jghav6nI31DHh34WvXguguV+jIRcI7teaf?=
 =?us-ascii?Q?a8hpSckodL2cS238CXvgJNYUM9835YVLP2IsXukyPcLzVlXzW7yBJn1XNgm3?=
 =?us-ascii?Q?X0wzWf0Ffo7QknxG/ZvOK/ePOyTy1/7ZhibalHuTUASvPBGszotfZJ4pCzFq?=
 =?us-ascii?Q?Jgb2fsPiNvZaqWBtKwG7Np5o4cXfQCsyMq2zadABzVktWp5D6gCGL5AeTju2?=
 =?us-ascii?Q?0eUMxQsM5PFujtFHs81iNU+eTDnk/PUZzq/yFeSl7SF2yyHb7UeJR9qGdKmC?=
 =?us-ascii?Q?P4UVvS9/fOXGY5nXuEzyXe2nbYpv/Yz3Bqi6QsBHIt1QpKHTLaLk6h/krIKn?=
 =?us-ascii?Q?nDtE9JqRrQSJTCSNCOIf6+EGVAOP0SufQUum6mSc80pwFQrdyxnL408w2NNI?=
 =?us-ascii?Q?3UTfqo8cf0kjeqGWhyCraHf1YyQwONxGuwRghbc5/pXCsOT9/T/vyM7tYld5?=
 =?us-ascii?Q?P5TUPIZpQaMjOzvWNrRo+B82T0gD88sDIfUGt3xr7a1u5B4mekQAG+xBE6aa?=
 =?us-ascii?Q?ZUkDfgJrfb1fCge+NznolAPgTN5vBSf1kLRBgS8oRgWOf9XQ4AYUarW95Yr9?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cccf26-0445-4bac-3015-08db93a11f0e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 21:40:42.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXA0j5gujmM4706KHgu+pm7b1UKzClJKFJ2V7im7rggxlNBcJ4eKMJoY844RQUv+vnTEe1T3fcIzknJ3zQNuiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185437

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
index af4254caf5..10376dd9cd 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -473,31 +473,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
kname, filterbydependencie
         oe.path.symlink(deploydir, subrepo_dir, True)
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
@@ -533,6 +509,31 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
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


