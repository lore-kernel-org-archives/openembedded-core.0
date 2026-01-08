Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B23FD1D493
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 20:22:54 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16044.1767903770563937476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 12:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vdFgWGMj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.40, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2xKOOj34F99ZkdT1Bkg7WiUYvh2rMCd6tNjBJgFe8aZkC7VefpuM3cGM2dejIs7xWBSb9423CxUvwSggWbyEyPICJCIcVb3eVqqtgb2doag1wJeskhzGgdXEJgydeezz79wPRK+UESiRDTdgs+iyEZwtS16eReC73yEZOsV9fbkridzC0Z7+TRPpjLeFckx2VRZJ9Q13bHumFM/SLri36AvJLlOiLdg2JVpCbpqBU8yYmfFi1l+wHzm0njOyvuBUYloYgJiMgNt6aDW5GPv3dZmgxUvLmLmAw7RTTaXaaDGae2UaPPYYoRRBjtogKpTQ7txgkSc1Ki+LBHHH4cISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkN03Ah8tNIXoeGPhVf0wJOx2PFT/kqbglMzxIAgiN0=;
 b=GR4DplKC60o69oXUzwYnY7F7VUrJpHskcitbYpY4BMctjs34x72txErx7ee6r7xlmNzybPu7a55ggUBaPUb8L/EEiiRfgObJ81v1IFrexDYNMG/l1XhDmLrsrmTXZijyr0Z58KKR1WxHDMlcNFbf9eUWlJbAqtMn7H1eQlIqx0VjVN4MefPrCrKWRLhsUJsT9HXzyYsVz2mfwQQigknkYI9FzTLzNE5bf5uYIWu3sTgLRKiu+AW7ojwXsZwYBmxjXATZlDA1iqrIoOq0bFccWtQRevfVdx0AxIgaqqwqt7oOOEbEEbRjvwzMZkT9QEdtjKab7RYLkX0gWKvb5IB8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkN03Ah8tNIXoeGPhVf0wJOx2PFT/kqbglMzxIAgiN0=;
 b=vdFgWGMj+uEWLpZm+OfB5GxMuYMowSUemRVVxEjwa2Vj4LvAWFtrnBY0xD7/RkxL4UFxIUhO6bosEfld4LWa2G0KWMPNZQsY6xnDF1tvObWNBUSrJtOQkXX9kLJyvULbCATSSUREjWscI2doXV7rxBFDErsEswmgnGqHHYvF3Y4=
Received: from SJ0PR03CA0251.namprd03.prod.outlook.com (2603:10b6:a03:3a0::16)
 by DS4PPF72472EF09.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 20:22:47 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::1e) by SJ0PR03CA0251.outlook.office365.com
 (2603:10b6:a03:3a0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 8
 Jan 2026 20:21:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 20:22:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 14:22:39 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 14:22:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 14:22:39 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 608KMdEG2934711
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jan 2026 14:22:39 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vdwWl-0000000AAS9-0Y4V
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Jan 2026 14:22:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/3] u-boot: Overhaul UBOOT_CONFIG flow
Date: Thu, 8 Jan 2026 14:22:37 -0600
Message-ID: <20260108202239.2423335-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|DS4PPF72472EF09:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fcfef8-3937-4b49-e8e8-08de4ef3ae10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34070700014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0tjV8N1YAZQUtMp0VLOP2mvXH8WZWITvyzOylCzwqazdB96T/LcJ0cZLe6nf?=
 =?us-ascii?Q?j0V0icxFIwQ7iq7TkctdS7bHBJtp2kSRpLMVKjy6aNaicEmBO2jHUSKY5U7I?=
 =?us-ascii?Q?URq0LLFiluvhH5sY2cQd+JrVQzVFTXH2e/WOGWqRJfBQqrbfmGpJYfUsL0h1?=
 =?us-ascii?Q?TYAkFvcZPeV1dNzTc9pxwTB0jzZ0oG+cKA/9p3KVdnVBtGLYB+SXtHm7EGCM?=
 =?us-ascii?Q?iasqDR1CzqREd68FZuKkGlRl+qWr+uaqh3G/y0a8f9X6kfl51QzjVps3Bk87?=
 =?us-ascii?Q?lG7EUXDff4caHegt/TtAS1J7ztLDHB/SUMlUkYvXtVRVY+JJ5hDJuaTxil4F?=
 =?us-ascii?Q?ZiK/XHEl3ylfCzvaP106716/6Iau49ITxQYQM/9mPeOKZmQjCoZ6ejIRkkdA?=
 =?us-ascii?Q?4DvvguNaeLfXCp9me0EjyxRkasZmUUMpTkJDEeH3aiLQp1k9wyDKWtvJfXqq?=
 =?us-ascii?Q?5viZxPIUzk3m51bP7mmSoAHfI9d2JMoYNbtr3DV6vWbh6XZbMGnHyZl8jAge?=
 =?us-ascii?Q?nM8F18tuPqyG/FWv2poKJp8gePFSbwn6ESd/brdKKp7X2bVBp9omikMw93yo?=
 =?us-ascii?Q?Dq+DUdkWbd/TkoJwCZ7k1Mu71IeQlDlpjRiad6kbYhiUIhGbRqxEjd1YQVVo?=
 =?us-ascii?Q?FKWfd+1GtVJgr+1r7PAGE+6uBq2cTYtJ6+9Ux+9RY1QAgHXwUEMj9yPQ2nHn?=
 =?us-ascii?Q?UXUKo/i3K4J0cuCWN/KHguLcbBdBKuT5Oc1WbN73ZpnRG7l5K3TycQzhJ8/e?=
 =?us-ascii?Q?9xRRsq2K1Ph81M/BIGnv2rARpOJ4Rq9xJq0v2DqekYaSjEQIybagYt0q9bo5?=
 =?us-ascii?Q?AQ8ORTrtLE05uJKAhpTeXzdbcPAyN/zXErn5KgZmC32/MGA6yYF7kd5PbNEL?=
 =?us-ascii?Q?b8aMfGCTbgm+HtxnEmvU6jpMZCgGgLuU9M84Q5KTrHpjCV/U6p1dRYp3nywq?=
 =?us-ascii?Q?7OND/Ygm6peUWbDYef7AV57rObCt5ANBdU/BpOk98LkVJ4pgLR4tMHOTSQLQ?=
 =?us-ascii?Q?lDKShocRTZ0hFyY340zBDzseBlkZw+tAbSHlpBYIFRIjRzI4xenzOO3M/l8o?=
 =?us-ascii?Q?0lUmycaoLkurhq8XZc4sq5HXFhKZvPe1Q5m6O2iq8ERS09giDfXbqOAfMlwv?=
 =?us-ascii?Q?V8Y8eRdOMWUK2xeq6oiIDAjXM1rKKwj07VXHJp4fs/Ofetd9Lobult3Fwv9r?=
 =?us-ascii?Q?Y3huE4Hj/OO2FpZM4djEhpQFiBsqakYgWp+qGdzjmC9HYDFZ5LJ4xVtvjFmO?=
 =?us-ascii?Q?QgTTNY6GbkzTaKbNn7RdSiOWncOOg75A3I1iTgj7idRtZdlZfpYkqr0y2J/4?=
 =?us-ascii?Q?3AhtxJJZ5jMUtZGxsJWasNOLjEfXFjH90mX6dfJbfwvJ9QfN3ffYPN4tsQ16?=
 =?us-ascii?Q?RcVbF+f+lG9ufUWzDASzn+MLH7qXlYGXL5QEJ7p0a2Eftlm6p4kiH1RaJGgq?=
 =?us-ascii?Q?VemVdWcbmsHa1R67NvL/1c5gJSJRzvMy+olRbZiUAnIOYybHtBNnMxpzXewY?=
 =?us-ascii?Q?3+pjSvvma8fGoqLpnh19Wb8kd/PgxmpbmipbB5XOWa9GFOld2OI8jCLMtn61?=
 =?us-ascii?Q?jdwyjWaEYnu1N056MUc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34070700014)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 20:22:43.6277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fcfef8-3937-4b49-e8e8-08de4ef3ae10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF72472EF09
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 20:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229088

The existing flow for setting UBOOT_CONFIG options is a little
confusing.  The comma separated list is difficult to remember which
slot is used for which option, and the order of the options cannot
be changed just added on to.

This commit overhauls the UBOOT_CONFIG flow while maintaining the
backwards compatibility with the existing settings.  Rather than use a
comma separated list, a new set of placeholder variables have been
defined where the same config flags can be used to specify all of the
needed changes:

UBOOT_CONFIG =3D "foo bar"
UBOOT_CONFIG[foo] =3D "config1,fstype1,binary1"
UBOOT_CONFIG[bar] =3D "config2,fstype2,binary2"

becomes:

UBOOT_CONFIG =3D "foo bar"
UBOOT_CONFIG[foo] =3D "config1"
UBOOT_CONFIG[bar] =3D "config2"

UBOOT_CONFIG_IMAGE_FSTYPES[foo] =3D "fstype1"
UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "fstype2"

UBOOT_CONFIG_BINARY[foo] =3D "binary1"
UBOOT_CONFIG_BINARY[bar] =3D "binary2"

The previous addition of makeopts has been removed and replaced with:

UBOOT_CONFIG_MAKE_OPTS[config] =3D "opts"

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/uboot-config.bbclass     | 119 +++++++++++++++----
 meta/classes-recipe/uboot-sign.bbclass       |   9 +-
 meta/recipes-bsp/u-boot/u-boot-configure.inc |  12 +-
 meta/recipes-bsp/u-boot/u-boot.inc           |  22 +---
 4 files changed, 101 insertions(+), 61 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index 81057b5cad..715fb5c1d2 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -2,12 +2,33 @@
 #
 # The format to specify it, in the machine, is:
 #
+# UBOOT_MACHINE =3D "config"
+#
+# or to build u-boot multiple times with different configs/options:
+#
+# UBOOT_MACHINE =3D ""
 # UBOOT_CONFIG ??=3D <default>
-# UBOOT_CONFIG[foo] =3D "config,images,binary"
+# UBOOT_CONFIG[foo] =3D "foo_config"
+# UBOOT_CONFIG[bar] =3D "bar_config"
 #
-# or
+# UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "fstype"
 #
-# UBOOT_MACHINE =3D "config"
+# UBOOT_CONFIG_BINARY[foo] =3D "binary"
+#
+# UBOOT_CONFIG_MAKE_OPTS[foo] =3D "FOO=3D1"
+# UBOOT_CONFIG_MAKE_OPTS[bar] =3D "BAR=3D1"
+#
+# For more information about this, please see the official documentation.
+#
+# There is a legacy method that is still supported where some of the above
+# controls can be specified in a comma-separated list.  This method was
+# deemed to be limiting in terms of expanding support to more and more kno=
bs
+# that might need to be turned to customize a config build.
+#
+# UBOOT_MACHINE =3D ""
+# UBOOT_CONFIG ??=3D <default>
+# UBOOT_CONFIG[foo] =3D "foo_config,images,binary"
+# UBOOT_CONFIG[bar] =3D "bar_config,images,binary"
 #
 # Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
 #
@@ -113,9 +134,13 @@ python () {
=20
     ubootmachine =3D d.getVar("UBOOT_MACHINE")
     ubootconfigflags =3D d.getVarFlags('UBOOT_CONFIG')
+    ubootconfigimagefstypes =3D d.getVar('UBOOT_CONFIG_IMAGE_FSTYPES')
+    ubootconfigimagefstypesflags =3D d.getVarFlags('UBOOT_CONFIG_IMAGE_FST=
YPES')
     ubootbinary =3D d.getVar('UBOOT_BINARY')
-    ubootbinaries =3D d.getVar('UBOOT_BINARIES')
+    ubootconfigbinary =3D d.getVar('UBOOT_CONFIG_BINARY')
+    ubootconfigbinaryflags =3D d.getVarFlags('UBOOT_CONFIG_BINARY')
     ubootconfigmakeopts =3D d.getVar('UBOOT_CONFIG_MAKE_OPTS')
+    ubootconfigmakeoptsflags =3D d.getVarFlags('UBOOT_CONFIG_MAKE_OPTS')
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
     ubootconfig =3D (d.getVar('UBOOT_CONFIG') or "").split()
@@ -130,42 +155,70 @@ python () {
     if ubootmachine and ubootconfig:
         raise bb.parse.SkipRecipe("You cannot use UBOOT_MACHINE and UBOOT_=
CONFIG at the same time.")
=20
-    if ubootconfigflags and ubootbinaries:
-        raise bb.parse.SkipRecipe("You cannot use UBOOT_BINARIES as it is =
internal to uboot_config.bbclass.")
+    if ubootconfigimagefstypes:
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_CONFIG_IMAGE_FSTYP=
ES as a variable, you can only set flags.")
+
+    if ubootconfigbinary:
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_CONFIG_BINARY as a=
 variable, you can only set flags.")
=20
-    if ubootconfigflags and ubootconfigmakeopts:
-        raise bb.parse.SkipRecipe("You cannot use UBOOT_CONFIG_MAKE_OPTS a=
s it is internal to uboot_config.bbclass.")
+    if ubootconfigmakeopts:
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_CONFIG_MAKE_OPTS a=
s a variable, you can only set flags.")
=20
     if len(ubootconfig) > 0:
         for config in ubootconfig:
             found =3D False
+            binary =3D ubootbinary
+            imagefstype =3D ""
             for f, v in ubootconfigflags.items():
                 if config =3D=3D f:=20
                     found =3D True
                     items =3D v.split(',')
-                    if items[0] and len(items) > 4:
-                        raise bb.parse.SkipRecipe('Only config,images,bina=
ry,make_opts can be specified!')
+                    if items[0] and len(items) > 3:
+                        raise bb.parse.SkipRecipe('Only config,images,bina=
ry can be specified!')
                     d.appendVar('UBOOT_MACHINE', ' ' + items[0])
                     # IMAGE_FSTYPES appending
                     if len(items) > 1 and items[1]:
-                        bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % i=
tems[1])
-                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+                        bb.debug(1, "Staging '%s' for IMAGE_FSTYPES." % it=
ems[1])
+                        imagefstype =3D items[1]
                     if len(items) > 2 and items[2]:
-                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % =
items[2])
-                        d.appendVar('UBOOT_BINARIES', ' ' + items[2])
-                    else:
-                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % =
ubootbinary)
-                        d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
-                    if len(items) > 3 and items[3]:
-                        bb.debug(1, "Appending '%s' to UBOOT_CONFIG_MAKE_O=
PTS." % items[3])
-                        d.appendVar('UBOOT_CONFIG_MAKE_OPTS', items[3] + "=
 ? ")
-                    else:
-                        bb.debug(1, "Appending '%s' to UBOOT_CONFIG_MAKE_O=
PTS." % "")
-                        d.appendVar('UBOOT_CONFIG_MAKE_OPTS', " ? ")
+                        bb.debug(1, "Staging '%s' for UBOOT_CONFIG_BINARY.=
" % items[2])
+                        binary =3D items[2]
                     break
=20
             if not found:
-                raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %=
s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
+                raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %=
s has no match in %s." % (config, ubootconfigflags.keys()))
+
+            # Extract out any settings from UBOOT_IMAGE_FSTYPES[config]
+            if  ubootconfigimagefstypesflags:
+                for f, v in ubootconfigimagefstypesflags.items():
+                    if config =3D=3D f:
+                        bb.debug(1, "Staging '%s' for IMAGE_FSTYPES." % v)
+                        imagefstype =3D v
+
+            if imagefstype:
+                bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % imagefsty=
pe)
+                d.appendVar('IMAGE_FSTYPES', ' ' + imagefstype)
+
+            # Extract out any settings from UBOOT_CONFIG_BINARY[config]
+            if  ubootconfigbinaryflags:
+                for f, v in ubootconfigbinaryflags.items():
+                    if config =3D=3D f:
+                        bb.debug(1, "Staging '%s' for UBOOT_CONFIG_BINARY.=
" % v)
+                        binary =3D v
+
+            bb.debug(1, "Appending '%s' to UBOOT_CONFIG_BINARY." % binary)
+            d.appendVar('UBOOT_CONFIG_BINARY', binary + " ? ")
+
+            # Extract out any settings from UBOOT_CONFIG_MAKE_OPTS[config]
+            make_opts =3D ""
+            if  ubootconfigmakeoptsflags:
+                for f, v in ubootconfigmakeoptsflags.items():
+                    if config =3D=3D f:
+                        bb.debug(1, "Staging '%s' for UBOOT_CONFIG_MAKE_OP=
TS." % v)
+                        make_opts =3D v
+
+            bb.debug(1, "Appending '%s' to UBOOT_CONFIG_MAKE_OPTS." % make=
_opts)
+            d.appendVar('UBOOT_CONFIG_MAKE_OPTS', make_opts + " ? ")
=20
             # This recipe might be inherited e.g. by the kernel recipe via=
 kernel-fitimage.bbclass
             # Ensure the uboot specific menuconfig settings do not leak in=
to other recipes
@@ -176,3 +229,21 @@ python () {
                     # Disable menuconfig for multiple configs
                     d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
 }
+
+uboot_config_get_indexed_value () {
+    local list=3D$1
+    local index=3D$2
+
+    local k=3D""
+
+    IFS=3D"?"
+    for value in $list; do
+        k=3D$(expr $k + 1);
+        if [ $k -eq $index ]; then
+            break
+        fi
+    done
+    unset IFS
+
+    echo "$value"
+}
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 66b9698c1d..9cb5c6ccf3 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -530,15 +530,10 @@ do_uboot_assemble_fitimage() {
=20
 			builddir=3D"${config}-${type}"
=20
-			for binary in ${UBOOT_BINARIES}; do
-				k=3D$(expr $k + 1);
-				if [ $k -eq $i ]; then
-					break;
-				fi
-			done
+			config_binary=3D$(uboot_config_get_indexed_value "${UBOOT_CONFIG_BINARY=
}" $i)
=20
 			cd ${B}/${builddir}
-			uboot_assemble_fitimage_helper ${type} ${binary}
+			uboot_assemble_fitimage_helper ${type} ${config_binary}
 		done
 	else
 		cd ${B}
diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bs=
p/u-boot/u-boot-configure.inc
index f3d9e55105..337b8ed6c3 100644
--- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -35,17 +35,7 @@ uboot_configure_config () {
=20
     builddir=3D"${config}-${type}"
=20
-    unset k
-    IFS=3D"?"
-    uboot_config_make_opts=3D"${UBOOT_CONFIG_MAKE_OPTS}"
-    for config_make_opts in $uboot_config_make_opts; do
-        k=3D$(expr $k + 1);
-        if [ $k -eq $i ]; then
-            break
-        fi
-    done
-    unset IFS
-    unset k
+    config_make_opts=3D$(uboot_config_get_indexed_value "${UBOOT_CONFIG_MA=
KE_OPTS}" $i)
=20
     oe_runmake -C ${S} O=3D${B}/${builddir} ${config_make_opts} ${UBOOT_MA=
KE_OPTS} ${config}
     if [ -n "${@' '.join(find_cfgs(d))}" ]; then
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index ffa9ef2d59..a58bba2160 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -78,28 +78,12 @@ uboot_compile_config () {
=20
     builddir=3D"${config}-${type}"
=20
-    unset k
-    IFS=3D"?"
-    uboot_config_make_opts=3D"${UBOOT_CONFIG_MAKE_OPTS}"
-    for config_make_opts in $uboot_config_make_opts; do
-        k=3D$(expr $k + 1);
-        if [ $k -eq $i ]; then
-            break
-        fi
-    done
-    unset IFS
-    unset k
+    config_make_opts=3D$(uboot_config_get_indexed_value "${UBOOT_CONFIG_MA=
KE_OPTS}" $i)
+    config_binary=3D$(uboot_config_get_indexed_value "${UBOOT_CONFIG_BINAR=
Y}" $i)
=20
     oe_runmake -C ${S} O=3D${B}/${builddir} ${config_make_opts} ${UBOOT_MA=
KE_OPTS} ${UBOOT_MAKE_TARGET}
=20
-    unset k
-    for binary in ${UBOOT_BINARIES}; do
-        k=3D$(expr $k + 1);
-        if [ $k -eq $i ]; then
-            uboot_compile_config_copy_binary $config $type $binary
-        fi
-    done
-    unset k
+    uboot_compile_config_copy_binary $config $type $config_binary
=20
     # Generate the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
--=20
2.43.0


