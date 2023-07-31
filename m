Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E52C04A94
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:53:31 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.95])
 by mx.groups.io with SMTP id smtpd.web10.5468.1690840410786187176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=W6tgtQZD;
 spf=pass (domain: ni.com, ip: 40.107.94.95, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEm5SNxCH0uE60fsEilquThHu8ssII94vEGf/iriX8owJZpL3wFUtXU8/QzEH5Ct9yHUObrMiKcG/pqu9UYL7cjLcvw/Detc7qkovB6FqLWIeX851Rt/gBkRPi6svn1NPU3EElPr1gFbUMFlvgOoKINHXCOrSarTBQofyrqzNdOUZmKFrx3sIONPwAAZrmEzjkumYVO4IXQZL+q43+bCN7ucPCcgd4SYrczr3Iu3F1/YiWZr3dD0r89GPAmuwkiz9EObiDUrARwcq8HiqG2lmluWxFW2oB6widK7rOpI9qruUEH3+YhEvt5LEV9zp7/SH5bT6DL1QFFxZt1D1EIDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLjpp+j9SUVPiE/VHTtgZEwH5G6Tkb1zt6gKoPJrSL4=;
 b=QSl7V4bf4Uz3kHxv0e3nFkC+y2fiAmg5J+AIU7IZA1Gupewb3uip8BXJ2o2/wZC7VOYT6PZPz9fNJ74AFgcbKJxQmQMbHq8wjATX+qjE83laDuLn7s3o2tA8PqHW0BWvMyACIZ5W+d13juMEkeKJPxsvOM4N3IIGPr3JclsEeENLt04syvM6h210I+IgMJXNMeOnVqEIjMkyKxj4OtP8kBzERd+tKeY+69mdivlZeLqZesxZFEcWBIZlIanhPZRosOW8JNFS77qRgohPjrl6SlS3BQ4GIpJmufJwCYa+jIA64COiggD1moYcbCpuDv8IkDLkOflWGXGjH6pIlAhX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLjpp+j9SUVPiE/VHTtgZEwH5G6Tkb1zt6gKoPJrSL4=;
 b=W6tgtQZDivMufYh1pLMwih/BHTjzncV2kclshUo370fRF2+JDFP06qxyl/1aduOHXTRpYW3DUkSL1iAjKn7McXUsYZQfE3sb4wFVTafDe+s/H8MHSCfdB0P4Lhk6taitb0GEFMMbBo/KBHrGS8c+7ULynDyQVGevt+h5FGY60oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ2PR04MB8510.namprd04.prod.outlook.com (2603:10b6:a03:4fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 21:53:28 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 21:53:28 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH v2 3/6] package_manager: Add _find_task_pkg_deps helper method.
Date: Mon, 31 Jul 2023 16:43:00 -0500
Message-ID: <20230731215310.3949441-4-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731215310.3949441-1-charlie.johnston@ni.com>
References: <20230731215310.3949441-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR01CA0011.prod.exchangelabs.com (2603:10b6:805:b6::24)
 To SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ2PR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ceac06-6758-4ddb-f7bc-08db921092e0
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3lIPWtjGEsfpMv+Sdvp7cLRD2gxtfHGzIeXuRtBVQKSUT581wpLpYjWlFHeJa/njixvws5+v1qP8+HtAuGIei7Mfu4OWJQsMjNSj/wgoFhc9uWmf4984dgH2oACosOsAflJWekWb5h+0FNcKoBL192I+4Jh9V1iUc2eYepExuWE1ZahA6X+vYrHv5pKGoGTWu57j7KzQmZr+xY4FP5TYAo71FbaJmi2EWQyerwDPhFjPr6cZNOJNu2LCBlBrPYxgsz7Vtm6gNqTKPIv18NkuZE1x4a2dO3JOrXUcxbl5HviX63j777A3n0bpmaua6yvHXbU0NJiIMa1Sq+VWqF5QWScLVVajywG58Ick3qB1Z1Z1I5BKXpWtZyqqX0f/VIdEuMruVhLFdje2UT21c10muAUpi8hVQ2YaPQMVDHpQsd3Phm7/ej/mVOoqjFNJsQ734b7JQDa3LanQJhmkitLlaa6w66+rmBABazbNLEexGtuyJDCxymPvXbxxjq/ZDxLOxuINcgL6jglCQc2YCe8QMUrnibT4A52cyRBQUAUXjHYIc8GSvHBijtbyDhyYdYPV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(44832011)(6512007)(6486002)(36756003)(2616005)(26005)(1076003)(6506007)(83380400001)(186003)(66946007)(66556008)(41300700001)(38100700002)(66476007)(86362001)(316002)(4326008)(5660300002)(8936002)(6916009)(8676002)(2906002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J1m/C4hauriT9Fp9mjh60Q9YQIgw98rkmnE1kOL8j9o1eyKNAbgMt8eNFssW?=
 =?us-ascii?Q?teK4FXP7tpNEdpEzBBLTJVc2ya+hSEXLu4Vbt/exU7afUhDfpWLLUKNJ6qSj?=
 =?us-ascii?Q?sGN/seFUOxbByLzHevwBDsUceEyznNNMs9DQlBD2oZEQp2hKI0ILAD6xXWvn?=
 =?us-ascii?Q?2hv6x2WSNbHx/wECCbS56dfsUrennxfu+gbMDhqvinONu9eqY64q5VFDX2An?=
 =?us-ascii?Q?JE6dhAmaxsrcBQf4f0LmAbQOHNc8oy3zxUSFVT7CxY3zdeHYX2/c/NirD4I7?=
 =?us-ascii?Q?NBbp3jWj2wGS1MkLyv+CRtz2NhNy+aZxVYQXj+f/ADG6vvJ7Ndf0Re2gSaF6?=
 =?us-ascii?Q?awuH5tT74y2NJ7wvKGB/FSj5n27ACYeJuMaZhEEgQXTlI2uZkk2k607/DlxV?=
 =?us-ascii?Q?w6iz6KiQgSaNFy2VJgsJR2Cff0K7r8CMtQ2GqaonPw1Gi8p5SEcaVEgtE9/x?=
 =?us-ascii?Q?+Mmvwj7NsjxqRrTbZnD1c3GhnaFpRLLrPKdO6khjE7Y04oBQENZ1U/HCfWuI?=
 =?us-ascii?Q?dobRDzUlNAODbVcHXqnAG2/r94PxJ4aQoPIFo7K8Vu3rJMnStMUjYXacfQ+d?=
 =?us-ascii?Q?jI83/93OPr4KmjfFNCkO7799dcNOmCjyaOZZJy2nyDqn9IlTbPClPALWpTux?=
 =?us-ascii?Q?bjyralmiUkbe9EDTgePzy+2zl3XXugXZ5Eq/E3k7xqpjuegNwQ2PzB3EqrOn?=
 =?us-ascii?Q?wHUPIc2+7nr5FCTDLWvJ4tmuALDK8L1ILj8MO0PA3uvBsMV8MRpqxAu45ZtT?=
 =?us-ascii?Q?+HkNmn9bzsN15pg8LZA4HSGuNDvMKBGQqAWbmpzA698mYPvvVx/mhgiBO7Lo?=
 =?us-ascii?Q?PeUcgMtt20kpyHH/UK6Xk8wBRF/C1ZO3qM3fL5a1eCq8DEcGxebHJuH1quOj?=
 =?us-ascii?Q?kw/d0NDwl2X3kYqdX7w7FQJBhuia2Nldi3fGfaIveI3dyB5pq8+fGZ+k+nVN?=
 =?us-ascii?Q?NaFk3YrvtrWVkN4qz5Eq/E/WVB4EllZt8IFRZYuBkaD1Fcn9afs3Hg+e8h3T?=
 =?us-ascii?Q?lS7oXHO4GWaSupq8JieDMtqTPe7vgFtCjM9ZFLEZlCp58sYrSWvPeLXGze1E?=
 =?us-ascii?Q?G4N2dacCy1xC06/U3qZePioAsdF1uCBUo5J7c2OtpFSLdCCQiVH+whfxCqbv?=
 =?us-ascii?Q?tVbLO8MeWxKBQv+ZOmFg1dOrc/2DMuWdt7E12UvPbcqX/gVB+cxiRDsJvR7Z?=
 =?us-ascii?Q?mNYOX8cvllpIwv6lW9PNCpnbDsvzgfN1gR9A+HnMEd6ErDEbkTgYmkeYgXqW?=
 =?us-ascii?Q?nKP16wFfP7IKZTNmfA61arscf8mBZLva1zxi6bNmQnATo1mA7HDwhDa4WUNP?=
 =?us-ascii?Q?ZDcNDgd+gHpGd3ix8HKVY+ZJzQ8zizuWFTM5J/SxZ/eyHlLQL+6zewUAh5Z1?=
 =?us-ascii?Q?VGd97choCfGH3huTj/RCZisL3/huccfOo/Dtgv4eylTuCrXSqzprXlHsVw0J?=
 =?us-ascii?Q?maMrADjPah+655S5YVUVy7q5rw2DY6nMpXVrb0ngJfgfjs8TC3/QDpmlP6Mj?=
 =?us-ascii?Q?JJNa+ef0Y+CsaI7v8PetPV6TRAmsCxIdoRY/Pq8rZejq3Dwlq1iVGbY2zgM5?=
 =?us-ascii?Q?/xcXYcdeEUkocV5pA1RyU2gto9yWn8rYgxQAmGFTggQwugmTgNzRJIz8Ju8m?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ceac06-6758-4ddb-f7bc-08db921092e0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 21:53:28.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KTkOhSR2cEJGIJKrP07o+sx6Qz/Z89jze4d8y+WMVZagNru0ArY1w1FpEd43YRx+mCZaSuPZe4eXhz7fW6a6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185177

To make the logic from create_feed_dir reusable, this
change splits the logic used to traverse the package
dependencies into a helper function.

Additionally, the logic used to find the initial
task was updated.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 60 ++++++++++++++-----------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 0934cda89d..7d040bcaf2 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -449,7 +449,7 @@ class PackageManager(object, metaclass=3DABCMeta):
             return res
         return _append(uris, base_paths)
=20
-def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydepen=
dencies):
+def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydepen=
dencies, assumeprovidedfeeds =3D None):
     """
     Go through our do_package_write_X dependencies and hardlink the packag=
es we depend
     upon into the repo directory. This prevents us seeing other packages t=
hat may
@@ -473,30 +473,15 @@ def create_packages_dir(d, subrepo_dir, deploydir, ta=
skname, filterbydependencie
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
+    pkgdeps =3D _find_task_pkg_deps(pn, taskdepdata, mytaskname, taskname)
+
+    # Find any packages which might already be provided in a separate feed=
 or repo
+    # and remove them to avoid duplicates. This assumes any dependencies o=
f the packages
+    # are already met as well.
+    if assumeprovidedfeeds is not None:
+        for pkg_pn in assumeprovidedfeeds.split():
+            provided_pkgdeps =3D _find_task_pkg_deps(pkg_pn, taskdepdata, =
mytaskname, taskname)
+            pkgdeps =3D pkgdeps.difference(provided_pkgdeps)
=20
     for dep in pkgdeps:
         c =3D taskdepdata[dep][0]
@@ -533,6 +518,31 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
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
 def generate_index_files(d, feedname =3D None):
     from oe.package_manager.rpm import RpmSubdirIndexer
     from oe.package_manager.ipk import OpkgIndexer
--=20
2.41.0


