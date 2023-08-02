Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01288C04A94
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 21:40:54 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.106])
 by mx.groups.io with SMTP id smtpd.web11.571.1691012446627364665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 14:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=aN49h5jB;
 spf=pass (domain: ni.com, ip: 40.107.244.106, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItOvLBNY+ha4c6Rv9ScN0R+lbWelIrkil632iNO6NX2IObuiwwiwB+jcMQFdQtSmhBe1G0P9V3L60YFqsXCah/w2hUw93Oah8o18/6m0uZV39Cwo948d3M1v7oEYEojg54ilUmGvqTFvdcy+8qPkgQbm+fQUwn0dn3LbYRgr1Yvscj7JQXlN71vBi0HAFMx+RrmGBdnYbCt5jKaWqJEhFANqugL/jZlXnVpPRie5MH343h451oN8USiYNkrgz3s4Bk2otSaWc3XRQbdQtNqN5ppO+WclW/l73riYbryF4Zzo3/jeP4u7kdaA5qyW3YMZPEiINEIMW+Zm196oUdjVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRDSgsXOM6mYi/9X1SJY2pJUML4f21GWOnaQastIA3k=;
 b=muvvrL5KV47Jih9TACneIFrfBUkql0nnL/fWlbBRDjNGJtWFLD96hcwFdcYvlicsKPR+9Eq80QXEeuhBZG3WWCOwfRnJBAYZfRJAP+jU3KHhXkZU5hGD6LDozJMCHdRUZtB8A4+qzxjsi+kEPtI23x1GJusSrl6TX6zqvhCKm24Z5hmVm12AvJoZ17VHMcohy7aIgziblXv5JU+odU25zjRqXex3IkarRJNFKxtFhhTgNxGHVOYFug16N9wlQsqN11oiYj1F06fRFQfjR63WLo8Pq1eYlsVKihGlSa3uAkqD2YQ5GnA/4g+Td6K/ZZkRFBl0SBY4TagzbXfPsm0YGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRDSgsXOM6mYi/9X1SJY2pJUML4f21GWOnaQastIA3k=;
 b=aN49h5jBkK37Jm7SqxcgLwQ1lTZ8Rhl1GDe/YI/k3FxoUvpdq/lwwBbPJ0U0uEFc5BS2wEpBth2ihNJovoNkvelp/BMVynoeP8n2ZHWinsdVnpVkjlCa3UMbMXhpOgzm90kmiY2x3OSTFSmOzIVSueAzdeN3xlddNl6cQZzk4dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7294.namprd04.prod.outlook.com (2603:10b6:a03:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 21:40:44 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 21:40:44 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH 4/6] package_manager: Add generate_feed_dirs method.
Date: Wed,  2 Aug 2023 16:35:08 -0500
Message-ID: <20230802214019.1068795-5-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802214019.1068795-1-charlie.johnston@ni.com>
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:806:122::13) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d4e3e4-b0d5-4b86-551e-08db93a1205e
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nyNopdV/iF6/VEtiIrYFIhAtoBpFB7PboJ6PvOyJRtJVdtAcxXxY4lY9MDnYH3l5USHvNOGJMfuKmmgwtQGmwB7YblX3/Rz3b/PHG1PU26PT39DNUC5qNKcmNIQerNxJAfBvh0mpoxKDTO0AfQ8SzEkpdeEdWFVMDmDrPJbNvGzFROiZn2ZliNZfNTECIjJiK/F1xsM1ddb/BInuzoeqBSOO1BOid68uG36fDDiWHk0AmmS1fWRDa0QNmTAsYH4rp113cHTN5XL2Bo3f4Unoi0KJGZQ5SY1Fo+qRxpnYDa/ZSwyIsihENMP/dmN86z3Rbk0j/3XdoNjqYDJTsEeUnlcGq8KR0tSACl4M+d1uPFHGVGgb2MZwNlbqihfb2s1Vqw+EibPnj1hrbxXYiG6epTKqXtE8gv33efCAruyyDR+0ynUbZfwzWAywRzvaCi0cIsL02Nag3JBbreyXogpWm1mPqpwwHy/VrQnsNL2241LZT9ahCxVQ6A2gLpI/LQDKnlBc1KtlD2iu6MUKv4z+zfl4lwSWN5oF7wsVY+jWOYAJ5clCsfcrE2zG2Ybq4Bpt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(8676002)(5660300002)(83380400001)(2616005)(41300700001)(38100700002)(316002)(186003)(8936002)(1076003)(6506007)(26005)(4326008)(6916009)(66946007)(86362001)(66556008)(66476007)(6512007)(2906002)(6666004)(6486002)(36756003)(478600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pH7NmY6+H7zlJLbYbBdc0SF7rQMdRm9ih9b4WiICFlvuw5veqavGR0or+Qnb?=
 =?us-ascii?Q?1HHIpjb8uBkiq99wpaDwF+W9Z2/0sGo/PQnIf6TjeY8wm8Y72mENeRGlUHzm?=
 =?us-ascii?Q?DaU13ybagRCZJByQs+Y4ySccPeX6GJ6s+aHR35FF1JRPmPpm+WqCMF0Tl/kz?=
 =?us-ascii?Q?zzKaWp9EUjWdCyyRzRY4mroi43tHpLcNjUOW5JrWV0D7GHZqzzqdTUIEZoKl?=
 =?us-ascii?Q?vBvWIsEiVjB7vkyl0U5lVirtSl6zFnBkZPzX0zrthIHIziJbas2xLeKe7cw5?=
 =?us-ascii?Q?Sqni6aiDpmGgPDJZKcq70tL8xaT+myLg0UHcNb4PwA4VCnz6gTE4qskGe1KZ?=
 =?us-ascii?Q?1alwsSbKhR2vqQLRA6uUz8gZ/n6rr51oE7LUDqAJQa8CTfeesgSvZjmgpFXC?=
 =?us-ascii?Q?9BlXi7OPdv65rSqk6hufKdOYu9I12z7J8Lzc3QXWGqgCtQcM4z7OHTPhaNuQ?=
 =?us-ascii?Q?AM6k/K3npzX889+S31I5VtXwu2dQoREZzCGMR+mmvfMXyjsaNDaAm4TXrf9/?=
 =?us-ascii?Q?EZdq0CawMnROS2YZPEPo9HMWJ16+UXgsIFq0VhdqgrOZMOgm9cWzLIZdud2t?=
 =?us-ascii?Q?Ctto6Fi2vBeL9Iwk9aX+U2Y4O1C5nxjnG0gOLgzsPQFFyMx188jYtW2xaD/9?=
 =?us-ascii?Q?YwvDf22K7/MISiMpdD3cMsGb1wAOtJG5Jcxa3K2/LxvEKgJG2JGEWUm9/WpP?=
 =?us-ascii?Q?eFMwTyVdJdIlwwUfWhcr+BmQY1JhBZ4ZDRc2v7CqEVnVpwvF+IfXHU3+ysL6?=
 =?us-ascii?Q?hsFxUqzHarc5TT/jSvyBRZWTSBwdTl3y4K8Y0UqWgzIfMz1yX+/9PHTkB1aX?=
 =?us-ascii?Q?p34Gqm9JUmuO+OFDP4farsnF61P3O/PzeOBOjJuufCLZo/x1Fkv6QPjsJ2u2?=
 =?us-ascii?Q?1EnHcHhws51LKDodp+/nzZ2n4BfKOneZ1nNDZqb68ZKWax6xdvMLI7Lz+E1h?=
 =?us-ascii?Q?dfw7gyFqw5UFsRo3wQQhVevbDpA4v7zjuXmRUTnKFgwaKBWDmWabqzmI4AMS?=
 =?us-ascii?Q?iHP9/b5vLurNZz5gJJEKbk/BKm683cC6GT8RyOO3lA7Iwgh/qy+F6p560OXG?=
 =?us-ascii?Q?ylWVEQYaNAam7+7VCGptN73wN1RwleKZa4XdDQGqBCtlypEVFSNRwxxMa6cT?=
 =?us-ascii?Q?9omSV8LwuueJAZVJjm3fX6Tc5rRNcMZxor8XV3bFvvfx2A1txmZFqvhsns/R?=
 =?us-ascii?Q?gCc/sQaf/HIH2vKcVChKsxY1zM/MJH1hl6dA9BObGE65DtZ8DNbnkfslzqNP?=
 =?us-ascii?Q?oxveH/dNa/+a33+7PBcGvsUzcnTA8wuASQ3raTCDxsQghqFNbX5tj5iq14IW?=
 =?us-ascii?Q?FxI2VfTpLA9f709PJDNGDTzV0FCcQCJG8sWPsftvMgJaudZiYF4zEyihW+VA?=
 =?us-ascii?Q?r0T9rBu9A3gXs0TMmabUY8+xueLe+TetdarsdXnJHmI0+weAAg05jjErX0vq?=
 =?us-ascii?Q?99wMluKTtOdWp1gmiEw7Z2coOCuFnW8C4SZmjz2tLHUCZisDZkapZ5F6Ilrf?=
 =?us-ascii?Q?PRcaKIebhHUhEHqqFPznzmznW3f2dk4oyS2LjwPkLYOvfMhk38I/QGiJdxPl?=
 =?us-ascii?Q?cirrQV+0YYhbdi9smV+LOiaaGmfglhtDI9n60GAvv3r/6NMaItTRuUQ6JDGH?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d4e3e4-b0d5-4b86-551e-08db93a1205e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 21:40:44.6357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dY/NUbvUCwLTmSIeBSDZQnMwJ6Yle3gIPrfoB1b1bJimN72C4MRIFbwlHSK3YLWR3LTQr3EeuBcQ8aiq+nNhyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185438

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
index 10376dd9cd..e87ae6d8d7 100644
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
@@ -474,6 +490,15 @@ def create_packages_dir(d, subrepo_dir, deploydir, tas=
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


