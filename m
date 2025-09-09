Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F64CAC587
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 10:42:03 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.46])
 by mx.groups.io with SMTP id smtpd.web11.10058.1757414509114166754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 03:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=IadjApaB;
 spf=pass (domain: arri.de, ip: 52.101.72.46, mailfrom: mleonhardt@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7FSAkTbP8OKAQoHd5Kbw4yOSjozRDoRmAOup21/Rgk3yKInaNH0rPWCMHpF9sofTwRUNYLZhc5JeTKUf8uEo/bJCyLxp0w717X5NnrxHy9vc6ldYee9ISw7GWHt4N2LuJlgmxdC2dXIwK8ampcGO7YzSwLKsf8onPaPYxjlz3ZE3fJwAdHOsTO4Y8ypEkrH7MHLibHWZpXs+q5w4FSLverzgFL9rpxKYNZyBfk4XJdCb/Q3uQEBbmfEONnBGN3BIHpLPK4vZzZwst534xmpDN+DqcU44IwW+2OULcNwIzGAXZjyr1lCRa3DvAuP4KQSoSo+8AxQy/E56j1TnT4UUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvOhI7Ph/EyJH6xQcCNWGsAvujlG++fuiTH1waA78r4=;
 b=UTwBQMRJlQtdKE6pYrSo4Y64oFlqOgVf315AIeAjrfUIl7tY8hXuSYY5QYaDzfPQa/RQ2ZFaJ7QPslwtnCCxZ8Dpzwq0LkuIjvaeKhSXQdktIczs5DYslxJdwPBxJDvTdWJl78mmgRlvR+LnVOQr1fiXiCL9IdvIsADO5HA/j58WXPYZrkl4pGxu+MDfQMKmxlhcEwHnjzv2UkYXX2kei7Cpju6JeE81C4fBMH3yUkbLKSYvsOqrptBhTeSeSOVO1Nn7CTxqATF/sr/Pi48PkPwfcIVV8rmlodMeQHWuFu72+IeHNmu5nPFTUyzukOG1st+9PsXtS/rhlPhiGtUbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvOhI7Ph/EyJH6xQcCNWGsAvujlG++fuiTH1waA78r4=;
 b=IadjApaB3OTWskAEJD1MM6Y06dnhm2hLv5TIg09QT5dOKUKCl2KgnUkl/EwldiICOaImi18PRPiTCN13V8+aOFf9+8PeY2gE86kr6sn7Ifu7OSh9uVf42mFQR8vbp0qEfLbW4nRPj9944284v7PNiBvolObtqvJOs5JqafaowiQ=
Received: from DUZPR01CA0193.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::14) by DU0PR03MB9868.eurprd03.prod.outlook.com
 (2603:10a6:10:400::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:41:39 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::cf) by DUZPR01CA0193.outlook.office365.com
 (2603:10a6:10:4b6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 10:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 10:41:39 +0000
Received: from MN-CY2D6JH1QK.arri.de (10.10.225.72) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 9 Sep
 2025 12:41:37 +0200
From: Manuel Leonhardt <mleonhardt@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Manuel Leonhardt <mleonhardt@arri.de>
Subject: [PATCH 1/1] image.bbclass: preserve debugfs tarball with checksum fstype
Date: Tue, 9 Sep 2025 12:41:28 +0200
Message-ID: <20250909104128.72058-2-mleonhardt@arri.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909104128.72058-1-mleonhardt@arri.de>
References: <20250909104128.72058-1-mleonhardt@arri.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.10.225.72]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|DU0PR03MB9868:EE_
X-MS-Office365-Filtering-Correlation-Id: a5589c99-ba01-484b-f97f-08ddef8d758e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JAiGVIgX25rCaildK/V/3phNeNQUa9OQ3DNS5XtoapbXGk9g4nBjXGC+njjb?=
 =?us-ascii?Q?XVeey6keD2BmFQrIs71lf+uthKa5XpWMT3895WSoZ0h0yd26w3ASlRwJQP7Q?=
 =?us-ascii?Q?BhG3zPDlJcYqNtDN1BJXiOoeZ8xWxzd4YHduDz7eJ7KASKc5BcLEZbcHYfJ3?=
 =?us-ascii?Q?T+yUn5o5hWdj+pqa6hyhyqyH+xnrZ7+J2UoejRd0YiQ9tWHcg5dyegzwZ0+i?=
 =?us-ascii?Q?Z3kXFghpmv85DDR8tXBLzv3/6eBIGXLQbyqGm6jh7nZX9mcIYgCzSedR4XjM?=
 =?us-ascii?Q?cayoWq6LJfNfFiQikG71U5EX1NJazjDVJKQ/+jsoBm/OQ0hk1D1wjPr8oQwI?=
 =?us-ascii?Q?XgFKZvzwSzPNN9vs0Y67pgCtj/BseD6HkJly0nDeYseWckQPmBgRWThLoV0R?=
 =?us-ascii?Q?+wS83AQkv6PUI61zsmpxKPs2q1tCuzu5aK7kCI9yKMG4oRAnpEJOwsskHLmU?=
 =?us-ascii?Q?ZuIHCXde4LJL6VbtKFVsvv2S3stEKW6H0zxiu0mR3oFQwn08a/D5DXbkjeQ7?=
 =?us-ascii?Q?BQ2oexHKZGmMx4JSCHDQNd5354/LYPqXKD29tKpUiItRDWSGwky6YoLChnLX?=
 =?us-ascii?Q?yf5zC/ng6G8jHiXxaYLKmMVCyFqH2X03qnZDPW2ocvuHPY5e0QE48PqxyPg8?=
 =?us-ascii?Q?yaLcC3kHFa17WF5V2tOPfrX9InSnzIhrectBu34GC80Ka949tnxCGIC78gZZ?=
 =?us-ascii?Q?U8TbuuPQ8Uv3JqITQXf7dQuMxridXXe+RVhUI+J5tWE2fbuTWP+/8dUUgNNa?=
 =?us-ascii?Q?n0C+NI74gGyCzPeIGpEPpld0+HDjdbxiC9Mh5a71/NyW96BtLgqw3RMwwVNH?=
 =?us-ascii?Q?O7vXx3Qr8C3pQ4S/HFXfPLEHIomOuI59LS29b5hOnwW+WgmkaPteDYVI9XpQ?=
 =?us-ascii?Q?eQoxxK7heMz1shCmGfr+nc1BtQ9he1ZjP8ITxEbOHJG1zd6Mp7GzngzmNKyb?=
 =?us-ascii?Q?4W7UswDabtaK9happsS6g9OTrvfGRPdFNyy51sT8R+Qk4zNSzJuNCG4oIbyb?=
 =?us-ascii?Q?S89CVDpx8X/aFNDbqGIR3QpqtHyua4Ftmw33h9D135W1m2mCfWTc1q9JzBRb?=
 =?us-ascii?Q?sdc3AJ1J/e563dFSGEL1RsM/6tOnCxXVD9qxGCqWWwIRz2/IbJn0WJFaiCm5?=
 =?us-ascii?Q?nNQcbc5njYIjazlI7XOKywznFLI5O/ggIWhc7f76uUV1L5eHfEbsGkKSywMp?=
 =?us-ascii?Q?JZ+TSeIqc/0oipVZ8K2nFBM828CgYajtSF5vTHTddhb7WLbD44WqH7zebKO5?=
 =?us-ascii?Q?OHeb/C+DApkoN/QR6eNCjL6LKdSLBZJ3q8aFGk7mdF+Ifs/UoqGVoNbuTDwd?=
 =?us-ascii?Q?IQgen7g5IDQR8lP9uKCEdS/f+Fc4VfhiNy5aIEFDJYswsn0ta9VWJOmvLGAh?=
 =?us-ascii?Q?BTYBzjv18g6U0nUdV9RZ/zmiBV/fxUG7JsDXZsxkpAMN+v9vv6xgjSTo1IUp?=
 =?us-ascii?Q?WWFagP5iViUUfsdoIDVK7z2Yu1pPCGJF5x7iMcpvIJx5PfesZovUMzyxhXtI?=
 =?us-ascii?Q?FMel1vEHZwncuFkAl6YAKE98IDgaz3NXv3dt?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 10:41:39.5561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5589c99-ba01-484b-f97f-08ddef8d758e
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9868
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223101

Previously, when adding checksum fstypes to IMAGE_FSTYPES_DEBUGFS, e.g.
IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2 tar.bz2.sha256sum", only the checksum
file remained in DEPLOY_DIR while the tarball file was removed. The
underlying issue was that inside gen_conversion_cmds, removing the
debugfs_ prefix from type broke the comparison with alltypes where the
prefix was expected.

Signed-off-by: Manuel Leonhardt <mleonhardt@arri.de>
---
 meta/classes-recipe/image.bbclass             |  3 ++-
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 13 ++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 24a19fce1a..ccad308b93 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -481,6 +481,7 @@ python () {
             for ctype in sorted(ctypes):
                 if bt.endswith("." + ctype):
                     type =3D bt[0:-len(ctype) - 1]
+                    original_type =3D type
                     if type.startswith("debugfs_"):
                         type =3D type[8:]
                     # Create input image first.
@@ -493,7 +494,7 @@ python () {
                     subimage =3D type + "." + ctype
                     if subimage not in subimages:
                         subimages.append(subimage)
-                    if type not in alltypes:
+                    if original_type not in alltypes:
                         rm_tmp_images.add(localdata.expand("${IMAGE_NAME}.=
${type}"))
=20
         for bt in basetypes[t]:
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/=
selftest/cases/imagefeatures.py
index 94d01ba116..87c3da228a 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -277,16 +277,19 @@ SKIP_RECIPE[busybox] =3D "Don't build this"
         """
      =20
         image =3D 'core-image-minimal'
-        image_fstypes_debugfs =3D 'tar.bz2'
-        features =3D 'IMAGE_GEN_DEBUGFS =3D "1"\n'
-        features +=3D 'IMAGE_FSTYPES_DEBUGFS =3D "%s"\n' % image_fstypes_d=
ebugfs
-        self.write_config(features)
+        config =3D """
+IMAGE_GEN_DEBUGFS =3D "1"
+IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2 tar.bz2.sha256sum"
+"""
+        self.write_config(config)
=20
         bitbake(image)
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], i=
mage)
=20
-        dbg_tar_file =3D os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg=
.%s" % (bb_vars['IMAGE_LINK_NAME'], image_fstypes_debugfs))
+        dbg_tar_file =3D os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg=
.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
         self.assertTrue(os.path.exists(dbg_tar_file), 'debug filesystem no=
t generated at %s' % dbg_tar_file)
+        dbg_tar_sha_file =3D os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s=
-dbg.tar.bz2.sha256sum" % bb_vars['IMAGE_LINK_NAME'])
+        self.assertTrue(os.path.exists(dbg_tar_sha_file), 'debug filesyste=
m sha256sum not generated at %s' % dbg_tar_sha_file)
         result =3D runCmd('cd %s; tar xvf %s' % (bb_vars['DEPLOY_DIR_IMAGE=
'], dbg_tar_file))
         self.assertEqual(result.status, 0, msg=3D'Failed to extract %s: %s=
' % (dbg_tar_file, result.output))
         result =3D runCmd('find %s -name %s' % (bb_vars['DEPLOY_DIR_IMAGE'=
], "udevadm"))

