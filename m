Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66634EE498A
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:20 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.135])
 by mx.groups.io with SMTP id smtpd.web10.864.1692380896295340605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=VJAfMpZ8;
 spf=pass (domain: ni.com, ip: 40.107.93.135, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kgf6MmSvaQvZpyU/LlX08i/0PEagPJFcKR/+83sCMzF+Qj3M836lOHBDNORAf3uw+xY6FKyRgBG6ArnjM+RMkbtWeDW/kUf1pX8MAn27Ba9I5tMDv163tyQ/uBVUFkOkof0knVwRM+1Q4vtNCnEYMCvHZrtOx7t82xPSDGaks2jVk+c7U2SdQ6bOaUCGV5exA5JJLmEoilmbtGLxZ8MSBGT997vEeBu1HMUJoxvM2JWyUyPaBnzDT7v0dtTX7iPZUzTcwJrxm9vzRVAYA20UcdSRyevNLe40f+b6hsewCvw/nm3RypmXHUgrqqbfEk6Zqp5r2wAmwv/3r00/NbJcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnDNXqs6Kn8JLUG01Tin1+926MXrYMEuWYAISDMYcSk=;
 b=Q1hMRi9RTisNltx/KNRz0F85zZzpVnuGEvKAFZ14OEChJJfoqUqp4dP3MBS1MrbRBI/uaK94o4I1N/HhPNNMCWYVFlY9x1RR7K171QqH2NW1yglhZ/Z1nEGbOt2/ZVv/RZ5PWSWGY9UuKlDXRSZukr5iPPNNCoWWNoQiN/lK13eKVo2KKis8HSrFu3UtY+D8xi5uW7vl47gYviySXPdroWLWuOcI/Hx14eoR7RpCZNbOmKCQAjZeaLQb32Lt2PdlnIXr3BmQ+Y8ykWbCY3ic+z0b/Rjg6w5rQTPQkwl6K0rXkbly+Z3pxlC1LzpZQT3+zVGNmy7g5bIReEmwAlcfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnDNXqs6Kn8JLUG01Tin1+926MXrYMEuWYAISDMYcSk=;
 b=VJAfMpZ8ZyNY+XoSkgvDeht6aEJSMlqpb45aJqUhrsM++mn1IPopg6wGad/HElgxwgavYzitABd0M3PoleYtnwQmd7hTVP6bN3ZkukQSOAM9dF+FZ8oLCTIDAf/6m5DDXe9PeWO5r0ReDCJUHDdIMqZ9+g4KvojLlBkoSfu7HZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ2PR04MB9012.namprd04.prod.outlook.com (2603:10b6:a03:563::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 17:48:10 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:10 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v3 2/8] package_manager: Add feed support to generate_index_files.
Date: Fri, 18 Aug 2023 12:44:51 -0500
Message-ID: <20230818174754.988128-3-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:806:6e::9) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|SJ2PR04MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd587fe-2408-4779-df91-08dba013496b
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EjwwzmRomapa7oKCF9rsQJQWwVuHopRdPYUNuF6AS/oOtTMS+7uavWqcPvkvUdQ5/LDaKDkiba0r+HLQqz/0624F7sdXeuwkTsqHdqr53MSzPJI8+5EZXpN5BjI+bfBUEKdvGoH9GYG4AZjMghSoJvG2+bRcDUb/dAcPnQwapEQHA3Yncxht/KLLBSBlKmhI8DyZ6TQGzm9EjJBhtLU4vf5iY57+IBNEE4Q9UasYy2jRkHWYUF4F31quAZoGXjsHvyCE263p/9Vvn1ebd8BC5GRyoHD9tthhb46aURRQOT626u15xKGYSjFasq5LAHOZa8zF5GqOab/zW66uwiG8dhgPeC6ER/f3CpIBe6NEZsQiG3es0gtixoMqZPiYF3BSeQ1UEfgRHTf2jJy8l7tfgv4fYvzEGzXS5TKWKzMmRrnUDZNWOjcsM+1AwbkOZc9RmJjvr1c0t7/hoHQoAoNb/5kNRGKpkI2a3PQ54f6eoHGeCPSJnJPhCn3k2tyijbC+FHRt4uqY+XrZPFacddGAf1wjmRcBsI1c6NbF6rYpaWOjldfBu/oCsFm36IFK8ZBA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(1076003)(6512007)(36756003)(44832011)(5660300002)(41300700001)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cl4RZp9/SpE7R654/HBFldT9Dp2etT0Nw2JK4qU3zPUdfkBxVLYDELf+P5XM?=
 =?us-ascii?Q?wUzctNct0Loa6rZT4Q3uLbL25ZxrRU+4Ex5CkMzcwh1gU93fd0T/nbA3p5Sh?=
 =?us-ascii?Q?zWdDQ5oX/ho9KYRyBFmp3Nmdsn+TScPXD008AtDMJUeo0Y5X9I4ru5tw7h95?=
 =?us-ascii?Q?zoxEcmudirpp7eLEFk0LhJNcEJ91gYdBwZiKy5ONpZL647G2sj1aQ8zlUFv9?=
 =?us-ascii?Q?/+JOsr2CrtLwXWqfKdCvc8rabPrUKguDJi2ZYaWXTSfPOztFgtYfLJjYFHql?=
 =?us-ascii?Q?FGmJfMButFJxgFlY151FAZjWQ/2XtQsdOfb5VJHHawKQujiVPIj6t0ppEMb4?=
 =?us-ascii?Q?JbB5JzhcQqOdKjX/8Upy0tozVkzIO++61BQu0SpklaKtCzOS0qJfLIbsC3BY?=
 =?us-ascii?Q?Br/vcABrYayBw15uSxu/TtoKaJwBJTsmq1E6Si/tOkEVLICg4hr9xoIHYkJq?=
 =?us-ascii?Q?GvNkGZ8BhCoYfEhMpYZ3v4VxPUkbGY5+2pE6gVvE+8a7G5pAwpseTnq21nxF?=
 =?us-ascii?Q?HnZznXjjKCXTqWAcTwQ25YyvVrhEJdkQbZBbQxW9nfQNbCuJx3x96ZEUCVnf?=
 =?us-ascii?Q?WRk0VF8PaZJ9awTNtebEsWvMw1fw/m4CAztrCkNmdmZkt/NYl3v9jZphz0fW?=
 =?us-ascii?Q?0PeqsxM4A3aDefu6hg3VttBn7LjgTqCX3jQtrhkzcTbZ7cMyZ12xaaYINrTi?=
 =?us-ascii?Q?BLX87TKe6VeMWE7Tc9H8wjGfWzqmY4k0OqlGDbHIKxpq2s/zy4aQWR2vpE0X?=
 =?us-ascii?Q?Nq9sxawoXCuo6Wpg72kiLMeWHVkultHaVokupVakl5A/vzsHzl4HDH2EwIhK?=
 =?us-ascii?Q?y/UGgrXjaOSz0B5UPFNwq7jwJbHYSOjuB543koSA1Eyi6WHMCFWguHrE/Thl?=
 =?us-ascii?Q?fwSk0SqIKxfncmLQztyAV/O2W7q8o9MaV2g+qtUT0Lth9jg1Ps5alASE7Y6Z?=
 =?us-ascii?Q?3nZbs8qk7Y7SiOthzMTcfYO1wpnIaY3aDL+oARIHWcu7w4pb3a7a+LO/dzyO?=
 =?us-ascii?Q?G8fobWxNY4XF6Iilo4VbLK17dOMN7CRayzl9MiJJ/BIJLXIMy7z45a/d9pHU?=
 =?us-ascii?Q?7IdF9dDUA2+MHWlrpG15tCMEa5Vz6r2aImltWDZcaoT3OzhgLt76LyQlIhgj?=
 =?us-ascii?Q?JCZanMf8/zJpuDGqtvyJUc5lolmaSK6GtZBAFoYDh0u4qm6HTrjW9QOL/gtY?=
 =?us-ascii?Q?wsNc4NW/AQwR5HUN9VHmrOrJcOZSQdCXtIjKDAREAhSBYINNIeXptSHu5XR6?=
 =?us-ascii?Q?3cw0rtGl1tIrRFC3UpYOU4RhAgXFB2RnIxhwj17viPWxvevT91G6Ka6EB2rg?=
 =?us-ascii?Q?OhBFATAalNu2d3wD8TXXnpCG9y3GNHzo1qlrVDka3+qAWqbwcoTT2h2FI9hj?=
 =?us-ascii?Q?43fBm0GabPXSl/k9GiwVkaE8QcWGhLHcI/+9v2oAxSCTUeTN4zXBlxWqdz/N?=
 =?us-ascii?Q?hU64XXcx5H+UbfVqpFjpCKL/uk4azfew/gs6+CA3vfWRKxLf8uzMhQcqIOvd?=
 =?us-ascii?Q?5crLVXDLy0qbGSeGQD8wnakGSN7k+Rf9imBjvMWBP2zA8Ld2wHVkGZW29Igr?=
 =?us-ascii?Q?2KrLnCw9Ci9v4U8urq5DAN44VS13wqrTYH61HLKEHpOoF2vnI3zFrPsb6PPw?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd587fe-2408-4779-df91-08dba013496b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:10.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjcE/85fq0P9gPmWz/f1JCE1EDuxCr9kBiD6+3E1eigVA7lbx/z5FWzuaqm4fkQ0gzxVbaSmD6tJUbiCqLnFvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186385

Currently, the generate_index_files function only handles
the creation of index files in the DEPLOY_DIR_<PKG_TYPE>
directories. This change adds an optional isFeed input
that will instead point the index generation at a package
specific feed directory. If no feedname is specified,
the original behavior persists and the index is created
in the DEPLOY_DIR_<PKG_TYPE> directory.

The directory for index creation when isFeed is true will
be DEPLOY_DIR_FEED_<PKG_TYPE>.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 6774cdb794d..7a5ecc98908 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -536,27 +536,29 @@ def create_packages_dir(d, subrepo_dir, deploydir, ta=
skname, filterbydependencie
                         raise
=20
=20
-def generate_index_files(d):
+def generate_index_files(d, isFeed =3D False):
     from oe.package_manager.rpm import RpmSubdirIndexer
     from oe.package_manager.ipk import OpkgIndexer
     from oe.package_manager.deb import DpkgIndexer
=20
     classes =3D d.getVar('PACKAGE_CLASSES').replace("package_", "").split(=
)
=20
-    indexer_map =3D {
-        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM')),
-        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
-        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
+    pkg_class_map =3D {
+        "rpm": { 'indexer': RpmSubdirIndexer, 'pkgdir': d.getVar('DEPLOY_D=
IR_RPM'), 'feedir': d.getVar('DEPLOY_DIR_FEED_RPM')},
+        "ipk": { 'indexer': OpkgIndexer, 'pkgdir': d.getVar('DEPLOY_DIR_IP=
K'), 'feedir': d.getVar('DEPLOY_DIR_FEED_IPK')},
+        "deb": { 'indexer': DpkgIndexer, 'pkgdir': d.getVar('DEPLOY_DIR_DE=
B'), 'feedir': d.getVar('DEPLOY_DIR_FEED_DEB')}
     }
=20
     result =3D None
=20
     for pkg_class in classes:
-        if not pkg_class in indexer_map:
+        if not pkg_class in pkg_class_map:
             continue
=20
-        if os.path.exists(indexer_map[pkg_class][1]):
-            result =3D indexer_map[pkg_class][0](d, indexer_map[pkg_class]=
[1]).write_index()
+        pkgcfg =3D pkg_class_map[pkg_class]
+        feedpath =3D pkgcfg['feedir'] if isFeed else pkgcfg['pkgdir']
+        if os.path.exists(feedpath):
+            result =3D pkgcfg['indexer'](d, feedpath).write_index()
=20
             if result is not None:
                 bb.fatal(result)
--=20
2.41.0


