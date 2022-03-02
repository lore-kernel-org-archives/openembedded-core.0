Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248E0C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 14:33:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web08.7732.1646231632021920063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 06:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=FsEEK8XC;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.49,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPeSIqRQbECZ48/LgotJjNg1PYRSYJZoLH9KvnOWQZNvFn6i8LsQjioo4EmMWZkDTQQiKxi4zYOWAAC4mn4Pz/mLhRQgfv7rlCOCFgTHoIuRObiab/KyME3z6ceRYQVsHi5Bg+D54GSCoyu5PGIAQTa5m2P+ZhFmwZErjT4JDw5ciKDnm7vefJLFn4+PNDnaS0XXm/nb1RsF9U/E1dlpEsZKfZLhJTQGfkzG8lIekedCfASBzczoFdaRGhsvkcEj90Cq0GhlqfDkzAkgfrBfA05TF/zNZhC1+vpA1pnbefWjghWRuyhXnWT/O6JHpx+nNKWMdeuJDfgFN5q3m3ef6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyYlhVJHVbwclsVQa9xRrWcNPxuRoNmDq0syQP7D5LQ=;
 b=eKNO8h+uo4zsCSY3AvvchAsTFYdDzq0iljHF/ePnFlgT7OONkgxumTubIq7+zYrFFDskhOgu2ai3o5KOsFFoKvJPjf94/zFOuhrKftAeX+QPe9F/HCxznuKIcCFkPcg/Gtx7wJeWqufbLV0QMVT5wXHHXRENpvt3FHAdq8qBTUDDMusKVAfXuHyUfqnhcRFuqmkP4Ry4rTkAaa1iZ1+zPzYzmjXUfRT2Zx7rB0aWlNr5N8pt8PuESH7XyRUC9VkmwWaXazobdHjRsQvPVYm3OikoT1qrX+5+gK9A/ZaIl1yTXV5iC04iCcHx30LCbfTP9/qB7f07doV3Ew0dIOE92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyYlhVJHVbwclsVQa9xRrWcNPxuRoNmDq0syQP7D5LQ=;
 b=FsEEK8XCMSXcBPfra1j9j0+lF1jzuxtTRWreaUC0xuJVT2ewfqLa74aC2l2g/NzIufRAfLuw+Sq5zsniMB0pwSF6IhtpLr7fhVb7tyskZjs5Hg7JG+J/SfVPSA8Cs1Rhu7HclatvxwjrZ5c/qF+AMUy0+Jl6/uTGS9m/iX8M8hY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM9PR08MB6983.eurprd08.prod.outlook.com (2603:10a6:20b:416::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Wed, 2 Mar
 2022 14:33:49 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::4a1:bad9:11c2:7de0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::4a1:bad9:11c2:7de0%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 14:33:49 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 2/2] oeqa: selftest: overlayfs: add test for image with
 fstab entry
Date: Wed,  2 Mar 2022 15:33:29 +0100
Message-ID: <20220302143329.4168-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220302143329.4168-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220302143329.4168-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0061.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::38) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db97994f-795d-4fe6-5ffd-08d9fc59aa2a
X-MS-TrafficTypeDiagnostic: AM9PR08MB6983:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB69836A22E3065CEE59B3E403D7039@AM9PR08MB6983.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	51xcopZ6vlMaHKom9RWPg5c1T5TaxdnSt4xSFK9CYS8Gz3mNFnnp5jG9sZwnfpHWJuVWCuthqUOdvOEbDGwwx4KaX/SwfZpphlyPPyuXEFQHD6FaD4WNj3RDcaTw8we1Kp1AtIK8M7vhijOC1tzYkuqqkaOa4i9srI+w0mED+rxlZhozwsNUOlqih+MX9/WJtkcYU+sjKnlPuEBRyfVD/KDKzBvPtz9LF0LK1CWmGX7HOMDDIPVbp08d+oWr7YrjUs7qsL0izS2CHy5yQV2V+Zug7i5GPn7geb9vWGBSOH7Ofre5PO3D/GeU+wPmJN6l2U32adNYSRsxgFx8XxMuXl1t+oSr/IKlAGbRYrNPnZTCYRx8qqnFmcyIpTYjq9suBzC2dNjNC3ZjdR9nSLMnZtCeeXbO2B0uNgqqWMRhZbVur4O0+Be/bcV2ZPDHudfEMXvTGwBII1WH+ZyR8y+1faYlA+TOxtu9pB772AujoZqbb5OgPp1n2f9Hl8R5nwbYfdQ6eo8jU1qFTzcxJr+E1ypcP3dNgtTwvdNbuooF722lkdSk0Y2DzRbrXiNXNY/IrvxJUL/Fj7fD6ZZAHZlAondAgvk+B/pL7c4cXZvzUGwG68qO0gnA1pGwMMs+QxD7VTSfIUcPbMeA3r7up7h2tUtCH0wZr9hKn669O2Vxy9A0VUJwNz+kgoF3SvjF9z/sqSeuj7hrq7O4QhCZ2qcLwg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(38100700002)(38350700002)(6916009)(1076003)(316002)(6486002)(86362001)(508600001)(2616005)(52116002)(83380400001)(2906002)(4326008)(8676002)(36756003)(66946007)(66476007)(66556008)(107886003)(6666004)(186003)(26005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YVxDd/luwMLQNQVEWux+Pr5NVdHL/vcZcajEtBDjzAFQim3d8fDpE3daPe5+?=
 =?us-ascii?Q?v55TD6IlYU8dYcF4mjA3DIx07ByNwq0BthBq+5fY27WtIP9EvBfvp3isjPKr?=
 =?us-ascii?Q?bR6v3mFC2KP/+tpJYXA0KS5d9mken0l99hryl6Q2BP27bPlNXm/U5ukrUWNq?=
 =?us-ascii?Q?nkhRYleIAilJ+0erHq8Z5OwNi/T3/j2aVB4CtQCzc2peoNR2uQevAvMZ6rNh?=
 =?us-ascii?Q?vWhB/FkmP1MmTd14TYVzscHvMUtA4W8/RO9udgpg6yt/rSnVNun+OV1CLoZU?=
 =?us-ascii?Q?zoZIAJa+6ShHqtjV/is36uIkkEmzUYOwO/zE355Sn9Dyn3peK9cTCbS83X1E?=
 =?us-ascii?Q?kzrLM73sZPYpb1mqH2BWn2cEIfBjlMO9XXHwyOE3M6oDQUG1si9psWHsuiY4?=
 =?us-ascii?Q?S7QTSop0Pu21mQ6A22CfOkVCJDbWnSjKBgV6BVtdRq9hI6a1CmNj5CizkivL?=
 =?us-ascii?Q?X6C4VmktT1Pyu+8iew99Tgjm0soB0c9vNNbfXMl6ktonw7/wlztccP1EO8MQ?=
 =?us-ascii?Q?ceOSJN1EAv7N/NP9+4Mx0xEqYf4mHNmuRIXaMkppEkM5zb1BvwRCvB2K/DHa?=
 =?us-ascii?Q?GtNmkkNCLyijJMFCCee2GgKqIrOsmywIGKBydX8f1r9T1ryphTs/8zLCWlaE?=
 =?us-ascii?Q?IDQh0Yv9ljl+W15PLKOiZazdQaedo/smzTnXTk7PXcn2aT/aKAMRsZOiI1gp?=
 =?us-ascii?Q?Xp9UtIAjqrONbR0xDUOa3oogWJrjZeYnzp8pczYfGGcH8jdAOViNG7NukF91?=
 =?us-ascii?Q?BWFd3zK0u2kpsvx1Jfx6o4sFM+PRd1nr1zo/F+jwIvdzomwuLbYcgeKVyzOY?=
 =?us-ascii?Q?m3kmSEPgPW78BZ3YmQQK7RcrO3rGt/BY0HaHcEsz2oXn0uDmgDDHaW88Iudi?=
 =?us-ascii?Q?qLdWB8xU84meXkMTOBX/lxaKp8eMywyqleYKp3ps4M5SeutXmmmcrj6HH+PI?=
 =?us-ascii?Q?aZ4E2fd7oT4251cgJ7le1NLA3VhxFca6SKtNylqUMozagrc+BmRDEJM8KpTd?=
 =?us-ascii?Q?QhCnBzpA9FaGDyz/HsnjQBsJfq09sx60MIzbeTMuqqF7wU0Hcl7S+1QeeKZx?=
 =?us-ascii?Q?0EkwizjB5fiEDo8Neh+TpIDB77QcEw+aUjVyiwusK1BzkNPFOAXM01KrifOw?=
 =?us-ascii?Q?gAiaKMWrvtqW/hztrbtE9qCG6y9VQTKGHF2TND3PyUQmgwlnG5nwQW1oCEOj?=
 =?us-ascii?Q?/wztJBM2X132svzz9bFgvvO/uiOGLC4OPgst4ejSqzOJZdW5d07jS1bQ4kXN?=
 =?us-ascii?Q?n++joVr/emjhecbibm+odSh9fF/Dcja6eeLognCJj1ZmoZ46hWoDZVTI69nT?=
 =?us-ascii?Q?zD+OBfTE3pzKvCd8WKO1ogVwDAmfFZ0e56KzY89hwvhX/h/OPhkFRc/HlvWe?=
 =?us-ascii?Q?jgoHzAZ+rke5LN5hG7XoZ7hHnMGfMLV6Dpsc2DBAe5BbKu9xyh4FWH8UPEK9?=
 =?us-ascii?Q?8gZNjnam0gSTSpiJih5jE34tB4n9s6JfWMSttGgaanG41Ep8Y8dM1UKE3s83?=
 =?us-ascii?Q?cQosJufr2Vf3AnVV8v8c+YPM9JCTO3HyKExq+XT+AEg/FEHrZstm2LuIKkqy?=
 =?us-ascii?Q?8ixE7LJgPcrkfmcqMHXWh8pT9c6MMbkKpajYUDT43/loZ6uZC6zDYo2GcEaX?=
 =?us-ascii?Q?Q7bocLqPOnwW5fBVhr9WIWY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db97994f-795d-4fe6-5ffd-08d9fc59aa2a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:33:48.8546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U2MPKkFhRGHHVsx0ZWAN2a+maTYKAQPzN5+rjleK0m2Xaij2vjHGKNUYpcKVPCM0br4DUtIi1FGlHoc03SmoRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 14:33:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162613

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../base-files/base-files_%.bbappend          |  2 +
 meta/lib/oeqa/selftest/cases/overlayfs.py     | 82 +++++++++++++------
 2 files changed, 57 insertions(+), 27 deletions(-)
 create mode 100644 meta-selftest/recipes-test/base-files/base-files_%.bbap=
pend

diff --git a/meta-selftest/recipes-test/base-files/base-files_%.bbappend b/=
meta-selftest/recipes-test/base-files/base-files_%.bbappend
new file mode 100644
index 0000000000..205720982c
--- /dev/null
+++ b/meta-selftest/recipes-test/base-files/base-files_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file=
 created by tests.
+include test_recipe.inc
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/self=
test/cases/overlayfs.py
index 79d36fa93c..56ae48ce64 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -107,7 +107,7 @@ OVERLAYFS_MOUNT_POINT[usr-share-overlay] =3D "/usr/shar=
e/overlay"
         line =3D getline(res, "Missing required mount point for OVERLAYFS_=
MOUNT_POINT[mnt-overlay] in your MACHINE configuration")
         self.assertTrue(line and line.startswith("Parsing recipes...ERROR:=
"), msg=3Dres.output)
=20
-    def test_correct_image(self):
+    def _test_correct_image(self, recipe, data):
         """
         Summary:   Check that we can create an image when all parameters a=
re
                    set correctly
@@ -124,31 +124,6 @@ VIRTUAL-RUNTIME_init_manager =3D "systemd"
=20
 # enable overlayfs in the kernel
 KERNEL_EXTRA_FEATURES:append =3D " features/overlayfs/overlayfs.scc"
-"""
-
-        systemd_machine_unit_append =3D """
-SYSTEMD_SERVICE:${PN} +=3D " \
-    mnt-overlay.mount \
-"
-
-do_install:append() {
-    install -d ${D}${systemd_system_unitdir}
-    cat <<EOT > ${D}${systemd_system_unitdir}/mnt-overlay.mount
-[Unit]
-Description=3DTmpfs directory
-DefaultDependencies=3Dno
-
-[Mount]
-What=3Dtmpfs
-Where=3D/mnt/overlay
-Type=3Dtmpfs
-Options=3Dmode=3D1777,strictatime,nosuid,nodev
-
-[Install]
-WantedBy=3Dmulti-user.target
-EOT
-}
-
 """
=20
         overlayfs_recipe_append =3D """
@@ -179,7 +154,7 @@ EOT
=20
         self.write_config(config)
         self.add_overlay_conf_to_machine()
-        self.write_recipeinc('systemd-machine-units', systemd_machine_unit=
_append)
+        self.write_recipeinc(recipe, data)
         self.write_recipeinc('overlayfs-user', overlayfs_recipe_append)
=20
         bitbake('core-image-minimal')
@@ -210,6 +185,59 @@ EOT
             line =3D getline_qemu(output, "upperdir=3D/mnt/overlay/upper/u=
sr/share/another-overlay-mount")
             self.assertTrue(line and line.startswith("overlay"), msg=3Dout=
put)
=20
+    def test_correct_image_fstab(self):
+        """
+        Summary:   Check that we can create an image when all parameters a=
re
+                   set correctly via fstab
+        Expected:  Image is created successfully
+        Author:    Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmuel=
ler.com>
+        """
+
+        base_files_append =3D """
+do_install:append() {
+    cat <<EOT >> ${D}${sysconfdir}/fstab
+tmpfs                /mnt/overlay         tmpfs      mode=3D1777,strictati=
me,nosuid,nodev  0  0
+EOT
+}
+"""
+
+        self._test_correct_image('base-files', base_files_append)
+
+    def test_correct_image_unit(self):
+        """
+        Summary:   Check that we can create an image when all parameters a=
re
+                   set correctly via mount unit
+        Expected:  Image is created successfully
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        systemd_machine_unit_append =3D """
+SYSTEMD_SERVICE:${PN} +=3D " \
+    mnt-overlay.mount \
+"
+
+do_install:append() {
+    install -d ${D}${systemd_system_unitdir}
+    cat <<EOT > ${D}${systemd_system_unitdir}/mnt-overlay.mount
+[Unit]
+Description=3DTmpfs directory
+DefaultDependencies=3Dno
+
+[Mount]
+What=3Dtmpfs
+Where=3D/mnt/overlay
+Type=3Dtmpfs
+Options=3Dmode=3D1777,strictatime,nosuid,nodev
+
+[Install]
+WantedBy=3Dmulti-user.target
+EOT
+}
+
+"""
+
+        self._test_correct_image('systemd-machine-units', systemd_machine_=
unit_append)
+
 class OverlayFSEtcRunTimeTests(OESelftestTestCase):
     """overlayfs-etc class tests"""
=20
--=20
2.30.2


