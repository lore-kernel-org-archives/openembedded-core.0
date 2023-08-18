Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666B4EE498B
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:20 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.105])
 by mx.groups.io with SMTP id smtpd.web10.866.1692380898390671173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=gvjWdfow;
 spf=pass (domain: ni.com, ip: 40.107.93.105, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYmwBEUCIkYQJSX3wdGAM0/YpjbEiqJk5Dt41fZALhUleo5zwqZGDDSU1jTWfM3ACfLWDwlPbXkN8iEidUlJ+dxrWjyg/051otO+o12FhDAaeNOs4HGscngjVnuYMcaVqZZAvsyyOI/O6lBKD3T9sAuYZ24ueQ7rNLOGqY5JMTsnPhu0kVxnk8098rR5jjCl4PImEUNPuHi/MtXVaQWeSAnV1sJdhemweEx0Hbi5CwDmAXbKvcTSzgR+HQ9sfRFIidX2DkqSYF12OWRhhKqoH9DdkyeqTqeSrjzfUi0r3XY/NsKYtTwXU14zH8KH8qwLBA8tBoKZajoV3JRXUIQvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+szWXseoR+n8yM5s6V5BPFuOekf/dHluHBdoCEoH9dc=;
 b=cqoVDzD/i1+7gRBqr3DSiEK30uP2qS/SYnSGLvxbtOLFngbiNfTfYyoISyjCi0bS2tGxjbYDlbs/1tgSjbnGC8cWkHJwuWL1Pi12cGureMr73Ihh6zlYe8MYfuJbfAwtlyZq5B6YsqMGWAs8kFzc/IJiLm2gmDCYYG/cdEOCY5WyG2cofq2saLItrak5g/8Nq2i62N+m83X3XAAgNeHdUF4PB6uplDYkCEAgB7vgdLMGMp8sS7LmRUA0TsZ2PEQ/nVSynrah3jyOaNxvMiNFpP8s0LtRnZnP3oVPcVn+AHLlgD2n6LGnkm2GYYRMPtXDBRQA+kqOtYCGEkP53keapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+szWXseoR+n8yM5s6V5BPFuOekf/dHluHBdoCEoH9dc=;
 b=gvjWdfowK1hYLiC+vdvcSdr2es+CrS/LERO8H20UY1wWWEsrnVModpUZE/ly+yAXOkDwpkh52BM9/oxbUqa8YFDcLyVw4hUO7x2a47cTuwnPFpa/KaLJA80KgRTTlIj+xr5KyHAhLPU4+WWGo5xRxt8tjHHph6IOwfWq2CcscyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ2PR04MB9012.namprd04.prod.outlook.com (2603:10b6:a03:563::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 17:48:16 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:16 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v3 4/8] package_manager: Add generate_feed_dirs method.
Date: Fri, 18 Aug 2023 12:44:53 -0500
Message-ID: <20230818174754.988128-5-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:806:d1::15) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|SJ2PR04MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: a3640274-1cbd-439a-3b92-08dba0134d49
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zYR86/kLKzKpb3z7f6LGtxEKDVX4UlkabR216kyR2dsFiRmohURTAqfiX05PoumHhxw8XJFJnF6AGpnOdvrLFPosfZ4Peh0BujSs2veFV8BLLyMWVGbQKxAwV7JFOxOJfCXMKKqb2Q8VOKmXIVnNrJyuCsrrLeQYIjKvcINta8PREmlwl+rR8OlSP/W9+AYV0XFZODYcPBBxRk+I9GsyrcohKCeQkyxDyEKUySQaPX5XH8CJTdwTnHcwbjLL06fbKmbBogFn3RogUQTAsBmpaL7FhkXkBE1QiP/6L87ZohyJB9pzLwBq6ZvFi41fhswbJN+NEXsJ5uaug3NiwYG+aNRdobuzlPp4Ev7LXy7aCu1RvxgmMty7WXt3v6J3Iloy9D6N+1AzoauZBx4Cy2yWk4GWrr98MzurqbOM2tD37IbPQhCEsdjBhHbDGkUOxnepxVB3c6Anp4PJpAwFg87oF3FcM2PtLmJciXzbsKXbwlvIW8zhI2FmVBz3e7Khqu4KXHP5Ssl7fyo5OK3lVtvu2A9bBv0TPWOLWNVqs6oDMvOXmwmmgEy8gWBtv2FZEciq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(1076003)(6512007)(36756003)(44832011)(5660300002)(41300700001)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xzHE9gsbt8QuCMskG7CX3e/sj1AtVaxJ5JHvwfwu5E1jXVsT4Gr3rXq//LAo?=
 =?us-ascii?Q?tc/rcIxpxtnaj12hANm+jHfMZ2X2eomkJfs0L8zYtr3IT6FRrwZ1VoUcPb01?=
 =?us-ascii?Q?nW5wAIfAaIASshH30AL5bgs2a07khCPqXoEAwyo9yk9XEAUYOhqLMdJRpaPU?=
 =?us-ascii?Q?pPdoP6ToOctcfAV65oIVs2EuGmqtiOn57sHjTw9u2S3kv341tXpdx5R4xThA?=
 =?us-ascii?Q?2RNKOC1+EaLNb0o/X158622cG/sPhvDU6S/V7MLw3yMhSrUVVA25kOsu7n87?=
 =?us-ascii?Q?hJEsWKtGGLuAPAQb4pFTkpbtDl2azMO9130fAXWfJp+DXGUny6UYQypwXeqQ?=
 =?us-ascii?Q?Y2U8Vi6BJKG3en1Jf6NbnjZAKkm3cOGpSYyC5SfNTjua4xhvwa7Z5o3gDdbh?=
 =?us-ascii?Q?wbz49XsiQb+vglWrsncSxvhFrS7a51WOdmsB08r8IlKiYv7Gscps6RZyFX3E?=
 =?us-ascii?Q?GTsA4/Y8IUGQNQg1jLxE7dl5h3q6++5+sh/Zqxz+F7GF/30u7vcTm+B4LW8z?=
 =?us-ascii?Q?5ayDJ30HusoeOfhAtJTMrqABtVwTNSQahrX14Anlvk8sTXRJhtmfXR9+q7MS?=
 =?us-ascii?Q?lLPKcwPjvI254YS2UUGy21exW3OtR1/KFVFKnSEcUZvggAv7ByPrtjFWLpgY?=
 =?us-ascii?Q?S5xcwaRg8ngLBqQBiJI/WTDKErTPsE1EtlsUKXqPcbfAGjvIDoK9nkx3slym?=
 =?us-ascii?Q?LZT4hMseCQ8w7+jMr30E6wuzPBvOLlgJk5LpVLAym8LstUfr+8cRLHgECYlx?=
 =?us-ascii?Q?4oeI1Nf4GrdwNHyfYQz1pkKIeWR8cBL6+RKNUnLjgOHJ/45aORTdvuiJ6DBD?=
 =?us-ascii?Q?tpRhgc9iwEdpcXBUUQ4SrPvozxZV3rkicIA7OHdSfbKltsOQof8iH1hS4sU2?=
 =?us-ascii?Q?/l2GKu/3xaYu2v6VPRMdHhqT4V5atRABoUN0OTJ4VXri5FVzb3TBFtFn5gNv?=
 =?us-ascii?Q?hipMyVwJOk0gHydOIEOYLO839ohh79N/wPeXcB1EsJX8fbZMv2J5l0QY101X?=
 =?us-ascii?Q?oT9oxgnWOTqSt415VlPXE2zlsx20ohvJV0ZmNH/boSpyv2fSAC9kZReQ8oFa?=
 =?us-ascii?Q?XF4P5sh+/a2xo4rTHO6QHt7cZ+mIo7OM8mkzQPksrZZCmdShpQirDiSPZfDE?=
 =?us-ascii?Q?BEpjzWLtOt7lBwLYQ8Le4gx5e0rCeYklCQL9muu0H3qD/R7gfXlXQdb/GRrL?=
 =?us-ascii?Q?9P3NSaGtjHZyv+eATx9GvdZJ4xOZ/EyF5Ori5pVjhho6gkPmwY8/Ym5LQ24X?=
 =?us-ascii?Q?lswa/wnmGuyRLXSPo4XUVehZANQQ6m2Z5R2sRLcak5Uj4yFO435tWJU+4UId?=
 =?us-ascii?Q?bsnljvQV4VkiJEHKueVwYxQMfUsHsvirRpdB3fGtENUY3Z+PkbzxcaB9yAIK?=
 =?us-ascii?Q?B8i0uaVNVH9pl5b9g++P4GrGVibn9/TBrpTW9kbTelmFR1LKH30oEMvN2+ed?=
 =?us-ascii?Q?F8CimlGGJj9l6HMq2Wm1bsxVZmQEQgW/IcTRWv1KhmyruVFE/M03MdLIhxn3?=
 =?us-ascii?Q?AkXxsJlSrLqtHVzI3qB/MsCQ3EGiOQ/yd8OdFStYuGolo8Qua8qQJQBKX7RG?=
 =?us-ascii?Q?kLGTN8uv5rzB5ep9BmX7WKqPD3AfLQlmRWGqmYKtu6LsSzDXPRuaH2EtMd8i?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3640274-1cbd-439a-3b92-08dba0134d49
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:16.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xp17VBVCESGvul0GblitSkopTkqaOwIxk0UNteQoFTmL4ZnKXU+z3ZLVAOrgnc65oyQPacjt85JrY/J/zwVTiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186387

Add a generate_feed_dirs method that will call the
create_packages_dir method for each package class supported
in the build environment. The value of the PACKAGE_CLASSES
determines which feed types are built. For each package
type, the new method will determine the proper name for the
package_write_<type> task, the directory to pull finished
packages from, and the feed directory to copy them to.

To support side-by-side feeds or situations where one feed
is dependent on another, the create_packages_dir method has
been updated to support an input called assumeprovidedfeeds
which lists feeds whose packages and dependencies can be
assumed to be provided in a separate feed. Those packages
and dependencies will be excluded the feed directory for
the new feed.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 27 ++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 4c6b5452f80..d4eed027df4 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -449,7 +449,23 @@ class PackageManager(object, metaclass=3DABCMeta):
             return res
         return _append(uris, base_paths)
=20
-def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydepen=
dencies):
+def generate_feed_dirs(d, assumeprovidedfeeds):
+    classes =3D d.getVar('PACKAGE_CLASSES').replace("package_", "").split(=
)
+
+    pkg_class_map =3D {
+        "rpm": {"taskname": "package_write_rpm", "pkgdir": d.getVar('DEPLO=
Y_DIR_RPM'), "feeddir": d.getVar('DEPLOY_DIR_FEED_RPM')},
+        "ipk": {"taskname": "package_write_ipk", "pkgdir": d.getVar('DEPLO=
Y_DIR_IPK'), "feeddir": d.getVar('DEPLOY_DIR_FEED_IPK')},
+        "deb": {"taskname": "package_write_deb", "pkgdir": d.getVar('DEPLO=
Y_DIR_DEB'), "feeddir": d.getVar('DEPLOY_DIR_FEED_DEB')}
+    }
+
+    for pkg_class in classes:
+        if not pkg_class in pkg_class_map:
+            continue
+
+        pkgcfg =3D pkg_class_map[pkg_class]
+        create_packages_dir(d, pkgcfg['feeddir'], pkgcfg['pkgdir'], pkgcfg=
['taskname'], True, assumeprovidedfeeds)
+
+def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydepen=
dencies, assumeprovidedfeeds =3D None):
     """
     Go through our do_package_write_X dependencies and hardlink the packag=
es we depend
     upon into the repo directory. This prevents us seeing other packages t=
hat may
@@ -477,6 +493,15 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
kname, filterbydependencie
         return
=20
     pkgdeps =3D _find_task_pkg_deps(pn, taskdepdata, mytaskname, taskname)
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
+
     for dep in pkgdeps:
         c =3D taskdepdata[dep][0]
         manifest, d2 =3D oe.sstatesig.find_sstate_manifest(c, taskdepdata[=
dep][2], taskname, d, multilibs)
--=20
2.41.0


