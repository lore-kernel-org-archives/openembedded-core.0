Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E33C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 14:18:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.90])
 by mx.groups.io with SMTP id smtpd.web10.52428.1737987470685573069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 06:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector1 header.b=qaIL1L+0;
 spf=pass (domain: phytec.de, ip: 40.107.21.90, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiVZXRv5L64eAPJJoQLUviZ4QPgbjIx6cYRFW9/RAGf2wvqxemJGTmDNZfVjfjAEUsWN6TgdCaSD5kl9ejb49AUhstK+z3v7P0T7FWVr5da/91Xj4qx8hfrmqKAKLttjN1619SXhNgiabjKbOzguJlsCaX8MYiRTweHNC5sfhpOLPy0xQsMCs10kLaLw50yf4nFcL9MPOpQUdDTvvMa2n0hBvlo3Qy9htrEvJbUeFUKJ89tBobR2ml0GaYfHrCZrgihwFQTD2/d4R8aygFlB06ArlS86NX44wgHeMDLS8tdzzJdKf0RHcaUHt9DNl1JZpsu71bjJlIjcv0nMNJYd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YJy/JnA/Zp1ZK5g/ORnawcT2AVl/1wJi+TujYItz5I=;
 b=FgWgjJTNth621YXqFVCGQatxaf2XYKytzkt48jGf9yaBsiJc7Im1DJm6E8Bv5zC3XeqlLSqq/b4z8d+bbFWTz6dy0GOae6L2mdNivClfpEPZ+aHBVx3aL1g9SzEZBAwQFaLrEF51MCN1WD1n9rdVnj8VNm0/zZtLV6x4V59ShRlsEAQNgCddPTVgGLRR1edcr6XNLhW0ppoKRvtuab7NkPhT2RfMm7n89DpSAHyrD4D/IW/95wzAm00BbFcLpAgbOMHer/eHSIB/Ik2P3w87svDp1gibtQXHx/VeyJw98xbnQSVx3lKDSsk74FpzK929Tp52mKBz8U7YSIMAQHBXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YJy/JnA/Zp1ZK5g/ORnawcT2AVl/1wJi+TujYItz5I=;
 b=qaIL1L+0NNReg0M28UEY6j59uQxm0HqMXZP9d60beqd4NRwQYpHLNcKZ6z0I2qG5qOFV29xg2Y4d4wbUeZJUKgtCQ+WKQZTyLM2LSFktJOmfhYRDnoZDLUjITcnPRTRoIh++0M5JAtntIajAN0/GL0ZAgqwMG9+HpkqXyja1J6R9/r0HV1iMKJ7nkFE7n6IO0v7bZ4XQQlsHoe6y5u8xIrIQs/LAGiXxH6FMcnbOJDpCSvcOenmMcsAtVP+UqIXz6EUQoUVrVhQT5Dn7G7VRnKwkA+4AMNf8WPwBAnvMBAY2YSnheLw26eBs1/NX7GJA8XTjAWROe+G0b8ZcVudNsA==
Received: from DU2PR04CA0284.eurprd04.prod.outlook.com (2603:10a6:10:28c::19)
 by AM8P195MB1059.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Mon, 27 Jan
 2025 14:17:43 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::58) by DU2PR04CA0284.outlook.office365.com
 (2603:10a6:10:28c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.22 via Frontend Transport; Mon,
 27 Jan 2025 14:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 14:17:42 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 27 Jan
 2025 15:17:42 +0100
Received: from llp-anderweit.phytec.de (172.25.32.242) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 27 Jan
 2025 15:17:42 +0100
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <openembedded-core@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [scarthgap] uboot-config: fix devtool modify with kernel-fitimage
Date: Mon, 27 Jan 2025 15:17:31 +0100
Message-ID: <20250127141731.380898-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.32.242]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|AM8P195MB1059:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e856af-72c6-42c2-e98f-08dd3edd5d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zM0lcWl3rXqLtFwQblkB5oBqcNJTdRhumt/K1G5yF8neCW3ZMtkqK5XhAs1G?=
 =?us-ascii?Q?oRB4YesWefnmoYL4kXoReS3oh6NzK3fTghPXrzkGVVX5utFMXBlzBxIpQf4R?=
 =?us-ascii?Q?dljC/apAiXkxr08eGbYvsGtAjYSfs9xym12UFpjrHMbjxrrE9ItdEiDsML4G?=
 =?us-ascii?Q?4xJYi32lOnw0H5l4pbJbGJX5sFfwrwn9Sxzs6JP5qgn0MaU6w4gZSzLwHOUJ?=
 =?us-ascii?Q?QPOR9g/NF3N5BfKOU0PUrHJdzw8bDBBOhtoWgYL2uIC4lkRiv0izu7AZ/RSG?=
 =?us-ascii?Q?P//Cyfs2Q7sR4koszpOnm4Z64gNLUtx/R/Pfg5OTwY31BzONqTziOEs1zP0c?=
 =?us-ascii?Q?EnOHVQTquzBjfUQjQ/UvJMWXWCtwB7Yd0Lu7m9FxaezhQmJ05ar9cogSOK2d?=
 =?us-ascii?Q?3/lS1jD26J8cZ+XmxcLpCwwJNGLs0SZi5+iTjudk7c+sMSSLNDxs1W4ZkV3B?=
 =?us-ascii?Q?QsK3wtBq1X/prBQz9TXIHN4ylYUI5CTu3t8yEXmm7vvKyc8HqHEpmpaQB0k/?=
 =?us-ascii?Q?w/mUbs7doS6U9oVu4UkBkUGKJlbVVm8isst67ufjvA5q3ReQkpUyDNoizvD7?=
 =?us-ascii?Q?DxfW7yxhjxrJ2ZZ5pSMOthYHBgQlpjgzkYw6XKibm8dEpLAOVPcSGr3xWzXN?=
 =?us-ascii?Q?ba7OlUD3sbaiyZeWJt6xWFHBt7TitLOpL6TGdxfeS1yL7L7mRyRec0BDwqra?=
 =?us-ascii?Q?L/TkkV4THSgh2vJC+OKstHxTSpyG5xaKt+lFaUh3t/6S0/5Sjl4N+W52zfHD?=
 =?us-ascii?Q?SKnHPgXhfNWqHL//jVvEFUsHrXwYndkrmL/2i2iBD0N1c2/1dKFeK/gRDB4Y?=
 =?us-ascii?Q?wFubROsJqexX0WlA5cVyuT8RD9Lc9FtHZxzaG0gGRwiVPgduxqzEPTIzWfsD?=
 =?us-ascii?Q?Anz4lq0rHqNZtHJ1FcYdTL19WDWAxaJIl1yuOiZC3Lh4H0xHgHmNrJqDhEOK?=
 =?us-ascii?Q?rkWOwmhFCP9pBsuvVxRR0RBnQOdvjlPtvr6VlW1K9TskYGmUKvY675Xynv5n?=
 =?us-ascii?Q?2TuIgp+mg60U0/mICHEatETjKCJQRghYNOWIhHxHC/uI6qa1hvRpcWnxgYQP?=
 =?us-ascii?Q?RPTGxaED3oe3y6SVWWxQRrkhD+0Ds3llLgaV4tKiSwlr9mN7C2ZJvkFdh8q+?=
 =?us-ascii?Q?BVEBAndlFb+MysdMQnE8QGnQu0z/M5Ej384XCl7cYDiEVowQBnT8ZOWeNvFS?=
 =?us-ascii?Q?z0frs1+h60yMfquOyI4Y/qrybh70aX/feWwhgoZoh1fIqdk3fntrQKFzakcG?=
 =?us-ascii?Q?FgJ1a2Ag9mZ9psTmTYEHJTbGSj7HgsVc6sDwqKOC5SWsto/d0x479d1VjJg5?=
 =?us-ascii?Q?h6xPQiWwp9VkjEdKgpWPltpxXTMfBxByrSz+kgTI2TrG23QcChpsdZRkc6Sq?=
 =?us-ascii?Q?MDmQUC20VT5SN5nFt5fL+xyAOozMf6Su2hnOWKQCPD79T7tjnEwUkbnGQrkI?=
 =?us-ascii?Q?sn9E6Cgo1rTsO/6p14IIWqIZ+bjwrPshujfKboN+MCohDcwWiQ0kYQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 14:17:42.9738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e856af-72c6-42c2-e98f-08dd3edd5d4a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB1059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 14:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210301

From: Adrian Freihofer <adrian.freihofer@siemens.com>

How to reproduce:
- UBOOT_CONFIG must be used. With UBOOT_MACHINE it works fine.
  A simple example based on oe-core is to modify the
  beaglebone-yocto.conf file like this:
  -UBOOT_MACHINE =3D "am335x_evm_defconfig"
  +UBOOT_CONFIG =3D "foo"
  +UBOOT_CONFIG[foo] =3D "am335x_evm_defconfig"
- A build configuration which inherits the kernel-fitimage.bbclass is
  needed. For example:
  MACHINE =3D "beaglebone-yocto"
  KERNEL_IMAGETYPE =3D "Image"
  KERNEL_IMAGETYPES +=3D " fitImage "
  KERNEL_CLASSES =3D " kernel-fitimage "

devtool modify linux-yocto
devtool build linux-yocto
...
| cp: cannot stat '.../linux-yocto-6.6.21+git/am335x_evm_defconfig/.config'=
:
  No such file or directory
| WARNING: .../linux-yocto/6.6.21+git/temp/run.do_configure.2081673:172 exi=
t 1
  from 'cp .../linux-yocto-6.6.21+git/am335x_evm_defconfig/.config
  .../build/workspace/sources/linux-yocto/.config.baseline'

The reason for this problem is that the uboot-config.bbclass sets the
variable KCONFIG_CONFIG_ROOTDIR to a path that makes sense for u-boot,
but not for other recipes. However, the kernel-fitimage.bbclasse, for
example, inherits the uboot-config.bbclass, which brings the
u-boot-specific path into the kernel build context.

This change removes the uboot-specific KCONFIG_CONFIG_ROOTDIR path from
recipes other than u-boot itself.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from b23581a22619c52724c8e078f29e871e2ee74259)
Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 meta/classes-recipe/uboot-config.bbclass | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index e55fc38b7c7b..bf21961977cc 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -101,12 +101,12 @@ python () {
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
     ubootconfig =3D (d.getVar('UBOOT_CONFIG') or "").split()
+    recipename =3D d.getVar("PN")
=20
     if not ubootmachine and not ubootconfig:
-        PN =3D d.getVar("PN")
         FILE =3D os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
-                 setting up your machine config" % (PN, FILE))
+                 setting up your machine config" % (recipename, FILE))
         raise bb.parse.SkipRecipe("Either UBOOT_MACHINE or UBOOT_CONFIG mu=
st be set in the %s machine configuration." % d.getVar("MACHINE"))
=20
     if ubootmachine and ubootconfig:
@@ -140,9 +140,12 @@ python () {
             if not found:
                 raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %=
s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
=20
-            if len(ubootconfig) =3D=3D 1:
-                d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("=
B"), d.getVar("UBOOT_MACHINE").strip()))
-            else:
-                # Disable menuconfig for multiple configs
-                d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
+            # This recipe might be inherited e.g. by the kernel recipe via=
 kernel-fitimage.bbclass
+            # Ensure the uboot specific menuconfig settings do not leak in=
to other recipes
+            if 'u-boot' in recipename:
+                if len(ubootconfig) =3D=3D 1:
+                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getV=
ar("B"), d.getVar("UBOOT_MACHINE").strip()))
+                else:
+                    # Disable menuconfig for multiple configs
+                    d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
 }
--=20
2.34.1


