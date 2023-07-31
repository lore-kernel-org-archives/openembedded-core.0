Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B217C04E69
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:53:41 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.122])
 by mx.groups.io with SMTP id smtpd.web11.5527.1690840412431435187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=Otu1sqOv;
 spf=pass (domain: ni.com, ip: 40.107.94.122, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn7VTdVF5mDWRiBffxB3y57pkoOWtyw3Q9nTehNc6TJd+cQIdqzKPRfUrArIntiDIvNaHd6q8NT871SAQrLdhGwJupOnWyKBjLNbxDAOKQYyZ3fq7sToAMXfNnfy5TjpBgHmYZN5i+pVy/unu4BgJS9gVX9lb8HOzEkOwUxz4Rh7o7SWMLgxzSO+9eiw6/YuGhPfyRLzorKE2uG0CrdEuYxslhVuSGBgbXlX3vm3k+W9NahXEzWhA23+5NDIFsUwaaN8aM8ENvaB1wfvIf88h/fjw8CSkczdP2GbVUl3I2mWgZaBoYFS4DH4mQ7vXMJ7zmeREDQy3ZKGTJPv6cmE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LDGI6bwPX6zTahRoiWfaBM40ZI0UfMWc59x1+GQj7E=;
 b=eNtP0gaF/jrya3ItXmcSTtSRh2a/Vqe1gBgoVwXy6NEuBTlJ+8w+eVWsMsFFEAahT+8GMT46oiRfhYmGFORyivL1V0ozi5bH1PYPn8T5U8BFF2gqSi1xapMRVmp04gnDJxDfkCd5V8/yLTmwEHmPg8efMBgW6OCqSoqBpzZeldEoNvJlSTI4XdZDqcVmrTDIiPrekxuYsavReBGMJcAk2D6YOQMBP5uvOVX6CHPL0eKo6tvnvB/63ijnfOZaaSAzzyOoKJBSnNd2sGAQUDEpG+vGQcAgDmZjttVXSNdBsds/89UzUQ2xpGxqR5NVWXXOSbE8rD6l2mEdGgViUC1vOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LDGI6bwPX6zTahRoiWfaBM40ZI0UfMWc59x1+GQj7E=;
 b=Otu1sqOvVg6OL0Pzfy5pYzsyvTBDu3s+x17F3ToFG7RT5z0zNOyU/K01VVSeXjAHzp8gUmUcF6KfOovGVVbnMJwnkgoQrf8VIdi/OdXIPLbLcQb6+mJXfxTIDHbdCmTHYfAimnvWNI/B302FntvgctMLcvXyg5Hr8dy22SvHoEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ2PR04MB8510.namprd04.prod.outlook.com (2603:10b6:a03:4fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 21:53:31 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 21:53:31 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH v2 4/6] package_manager: Add generate_feed_dirs method.
Date: Mon, 31 Jul 2023 16:43:01 -0500
Message-ID: <20230731215310.3949441-5-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731215310.3949441-1-charlie.johnston@ni.com>
References: <20230731215310.3949441-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:806:121::33) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ2PR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e3cbde-2a76-490c-0655-08db9210945c
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KWzsLuqNonjHcm2CnzqTtWJ2JGNlUqmQvtX4y4/74RsDr6zzMLseqcsQYzQ2jD8rOiIBHN9iCxbwZpr4Mni9gR0Y/hJf4/nVTY6jGpyr0tBbTmj6/A0HlU2en/1c4C0cPT4AKo2cjKZSuMYRBBo5Di7LRLdgzuAnmk3NKaL/GYKyIqL0o5kjXflvy3Z4+2gHEgNMjeXMYcV2nQ/EOdCUoav9fjGgTM2L45oR3Pi4+z835bD17/Juj+I6jnk1fTxmBvAmhc9sF0Lpzb3z5NGUV/3OBxcxD1anp/j5WvezDjQhfL4SdFWpPPlGTRhudngU3qMKo+K3QMN4labb6mQPCMZSW0Yefq8V0AJSVWNIXvWN+/wDzEr0fX2ui6JP6eb7wp1Q98IBcJjEKPw0QDp8P4CzUrlFg6sYvzonDvuLFxdTiAbqIlkm1bNxBlNqA0arxypIVZ3FzcC4lXwTmjWJGuKY3neSMPs/UdaUE+9AIoHZauD6XJDWGfilgXBSbLWVcFwJzk98TthXG22n1jTPBTxgQoe0C4RyQOqrKMyRIqBNLW4+wEyaDNtn+BEM4MOU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(44832011)(6512007)(6486002)(36756003)(2616005)(26005)(1076003)(6506007)(186003)(66946007)(66556008)(41300700001)(38100700002)(66476007)(86362001)(316002)(4326008)(5660300002)(8936002)(6916009)(8676002)(2906002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X106kG1bFG1RH/CRTc9HmyM+th8jIsy0sT7OTBuEpWdmAxNFYGEZLmJJu+Vl?=
 =?us-ascii?Q?qUT+AYLcZN5RJWhAARSpXK8Rc6z0Gij5flDruAOEBIIlmDBzcbKOguLGQnvo?=
 =?us-ascii?Q?LxlxaCVYuZZjk1/P1ezZzAbolpGhyLeYD/g/UacwD+dRThCvXXKeQ5UhQnqD?=
 =?us-ascii?Q?YGLiqe/TMSDCkA2dyT+DD3hU0UsYpUvvAktaxi0QdVgtNrFHSsSc1BHrGnP1?=
 =?us-ascii?Q?hcwxjeQhaudcB0VqOUv+pXBREeya/mszfc6oGf9PM6y+2utvhQx3v7YgCwgm?=
 =?us-ascii?Q?uS7j4cIPn8dYUklB5QDY4YYFZJUqDapIX0EzzzAK88wfs5qm83BxyOOxSXaE?=
 =?us-ascii?Q?g1dOgctCp0f+DPzswK12M2QdgdaD+KKDPimx2OfYgJq1DZdKQtYRnyivprZd?=
 =?us-ascii?Q?jij0yp6lD0SXBxZwJXHUnql0cQ/Ihavm6VSGcasPz3bmpJGxzq13INXPpC91?=
 =?us-ascii?Q?bOOinKz+dEHesiUP3tTVwft55/CXDVTefyDgffa0VKZInSsKPhiep4HNmpcl?=
 =?us-ascii?Q?gQwinwURu9j6+KpyodPUWkpkuJYwfQjbf21cDLWI8VhRoBF1HWjJPFRzWyav?=
 =?us-ascii?Q?cSKt7A9wonMmMl2bRenioAMIW7qINaIcZjohQ8uaD3Azg+JeocjmIVSgGeBp?=
 =?us-ascii?Q?Rg+c48mJT2MMFoQXaEpFQ4Zc4Z0BgzHaAJSkrzE7Wp8wvRE6dvY9cXnSpHdr?=
 =?us-ascii?Q?MSQL1M7woAbRZ0IBati6GTEsvR5aL38C4l7hgz8ild35WpnK7RNr+5w+poo+?=
 =?us-ascii?Q?g+if47mOPuArMG6+yi62K1/0EbrCP5/JMc1u1wtzSoCd8Xm109ROFXN8zDR/?=
 =?us-ascii?Q?CxjzKvF2NIonuY9nHAAopH6jfQONbKnjNXUJPF24OdmnY1xKsesrlDDHT/XX?=
 =?us-ascii?Q?ybXyZSX1e/bcjqMYBwtbbjWpJf431FmQVe411DvbYib/cCvxiIV0zwPPzV6I?=
 =?us-ascii?Q?vc904yaHmLOeiLbSAaobfvtz5ftQckGVScHIM+6W27B2QsaeeOGceSR4J1I1?=
 =?us-ascii?Q?JMEDcuWkCL8VOqribgps0NBOTEcghjryo+xGDSOEKr0Mlpo+dv26k03PciTS?=
 =?us-ascii?Q?uLLtI19q/nAOEYE7Mp5odKylBkqjy5/dSrsOVgoLbdVK/eI2rv14obkKBk1M?=
 =?us-ascii?Q?eaiwED/U5UGYvD+VhF1Nko+kPhorU/U002hVcX+vbq9+e28KrrHPWZiBEm7X?=
 =?us-ascii?Q?yzN93l9dKyUu1NaFYMTVcouZKQT5FB3j5EXsdsBT7ho0T+DsE2wEyTJocmOT?=
 =?us-ascii?Q?CAjbMMQcupgnP9jjv9fQx2ttzpKwg9GwFH5/PWhgGhmXjaDIQrv0GCvz04vi?=
 =?us-ascii?Q?yHHKtIwa4Xfb5gtX0BkHXjss3wGYr3BA8mqHwUkhYVaoDIjLGphZms4HVcQ8?=
 =?us-ascii?Q?DyiiOnN59dPyTWri/bYc18R9jb4eVLOyyKU+3fG5KIpq9CnRl9UjD0W5bJ7X?=
 =?us-ascii?Q?WuAJYkone8i8Hw00oejdDxZl1tkIPVCmbZFApyWX9OoPu3LwQCaxMT67DKAf?=
 =?us-ascii?Q?p5xfT7ivMxQpKoAlDwusHMTHLOTcdU1ZBVH8jIqL12d+mTletdVpxS2OXJc+?=
 =?us-ascii?Q?UwhNt8B1LG7V3DlSNjwOjg9dMLE24C2sHQ4U+OOF0N3VRspxNDchqxM6Ox+d?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e3cbde-2a76-490c-0655-08db9210945c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 21:53:31.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23kiPeecmp7/sl4y+qal+z3wHIQY0W8p8cBQiYmD4wDM2cOSqei9LqQibJG4PJzukCCdTmxmKiOm+W7u+Kiigg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185178

Add a generate_feed_dirs method that will call the
create_packages_dir method for each package class
currently supported in the build environment. The
value of the PACKAGE_CLASSES determines which feed
types are built.

This handles knowing which tasks to look for, which
deploy directory to pull packages from, and the
deploy path for the feed to be created at.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/lib/oe/package_manager/__init__.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 7d040bcaf2..3daee3b0bc 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -449,6 +449,23 @@ class PackageManager(object, metaclass=3DABCMeta):
             return res
         return _append(uris, base_paths)
=20
+
+def generate_feed_dirs(d, feedname, assumeprovidedfeeds):
+    classes =3D d.getVar('PACKAGE_CLASSES').replace("package_", "").split(=
)
+
+    indexer_map =3D {
+        "rpm": ("package_write_rpm", d.getVar('DEPLOY_DIR_RPM'), d.expand(=
'${DEPLOY_DIR_FEED_RPM}/%s' % feedname)),
+        "ipk": ("package_write_ipk", d.getVar('DEPLOY_DIR_IPK'), d.expand(=
'${DEPLOY_DIR_FEED_IPK}/%s' % feedname)),
+        "deb": ("package_write_deb", d.getVar('DEPLOY_DIR_DEB'), d.expand(=
'${DEPLOY_DIR_FEED_DEB}/%s' % feedname))
+    }
+
+    for pkg_class in classes:
+        if not pkg_class in indexer_map:
+            continue
+
+        create_packages_dir(d, indexer_map[pkg_class][2], indexer_map[pkg_=
class][1], indexer_map[pkg_class][0], True, assumeprovidedfeeds)
+
+
 def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydepen=
dencies, assumeprovidedfeeds =3D None):
     """
     Go through our do_package_write_X dependencies and hardlink the packag=
es we depend
--=20
2.41.0


