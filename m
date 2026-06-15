Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63642CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 19:18:24 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137595.1781551098623607238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 12:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Thz2hxq8;
 spf=pass (domain: ti.com, ip: 52.101.62.35, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKQwfF2xS0VRuHMVmlqA7BA9fhTvEryfzLrqCqQZgbhHxXWCQTLfxWIG0XSs0lwm1h/P55un5TfMJ3TYbbIHIZcK+yziVwjIN7075VqIY9J+c0bJPTN2RFEJaBUBw1QLSyKikIA8RIIAGhYVkNdAleftZ7t/kC22BY+/52M657aqXBhwFI0l+xz/Zlsno9intqPWnhKtTBwu4UvGwzOXzY+XuAMWrbxiuP3IipsnRq6l8lwMA2GUSuVxlFJ7Xjh064PnelVPJ0vbZKl3ctHBZJ3Ehq7uxenhC88s3Shx7p2BrF/6NXHt7MQrMnqeC99o1QrvZuyS9hkc80j90UvVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZzlBOYqA/lbnbx7F2UXHfUOBYuErapruzSIApJ4qF4=;
 b=ctXu7AIp7lM9gbc8/8dXHioe+nQlFv+6HwBbfNaRH3jEMk3Y4t1CXxVRMW4WCoWruE/Hyb+8LSWj/IPSITnldFY9kMzi3jqB99EmJrFYf/fAr8xB6OuUb/7a0r1i7RppBkG8t+wWxODeqcgvC/t4Xj6cWxQTvzV6vitSKaeLnnprAU8BvbixcGlOVKMqsSE7gb1Wi5z7CZDflUt0yqHovWeNqNKJQWWvxz/hQekMljYSDuVpkpAucwNwZkGckTCtgH7gUPsEs1CEGClTmnkBedd2Q2oaS2mQHsDwgUra484d7eV/lzBRYx4rF9wPc4aXxARfmgWXHuTW05VcZOnJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZzlBOYqA/lbnbx7F2UXHfUOBYuErapruzSIApJ4qF4=;
 b=Thz2hxq87rnJdDKyahK5vIJkH4+vStTVNz7kLPQJj1ntrxt993lXBB4EpazujJi8wR9tgTrR+3Za+JEw0xPyx5nE65ZvxyNYbZy3XyVn5H6e4x7RmQgZWPTuE0cQJ6fR8Ohh4WERgqw0Ipg/+yZTWxgbHQJLhz5sFS6DljGebK8=
Received: from SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::23)
 by IA0PR10MB7547.namprd10.prod.outlook.com (2603:10b6:208:493::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 19:18:13 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::3) by SJ0P220CA0016.outlook.office365.com
 (2603:10b6:a03:41b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 19:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 19:18:12 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 14:18:05 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 14:18:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 15 Jun 2026 14:18:04 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65FJI4qa2563248;
	Mon, 15 Jun 2026 14:18:04 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCH] xuser-account: convert to standard-user-account
Date: Mon, 15 Jun 2026 14:17:02 -0500
Message-ID: <20260615191701.2736293-2-rs@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|IA0PR10MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d07cac-3ff5-4c67-3048-08decb12d83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|56012099006|6133799003|3023799007|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	FNobe+QPmgFM4gtnOOrosfYC8TlOR2K+NBRwZIR8Y6RvVlH5arO74w2GeB3w7HDH4fC6CEBJNiwDptp2iRRMVaIkKPUiZJBGtyOBwDG8utIaiwsQnZPtdLqcs37inp487JKAlXGc1T3FpxtV664MGDFUpAZ+06/aKGZgnT2/XsOACD55qYnaNA6iyKBKMw2KnVV3mYSyRc9MT+N8jvZRlwSXQyFFofYjbKYW1UkeXR7lCUf35pwsSgV2zP8Z6zgNXBBE0hXkF7fLii+JrdUgnn6eJbX6C1/4MHzGtBpoO97Ay/b3oeO7Z3cpVxO2g3BtzR56MkT7Hk0hSNFVspeXYbq1A7Qioj/xD6XnSG3WUJr7Czz2/UPB5gUgoUVQyD+zH8S5+gli0Qbxe/X6zBdaIo8IVMeXDa2MN6OxgOkhZ7x5liY5ubZrYrCyQHDMGNKBbUhPZIkJrQUaVmwf8XCeE1ERpizdNP4opF9eC/CGdJjoA3p4/vhlihLTGI6KwciWriPY/YFReUWMi5c/Q67XdyHHr+s2D/2ubfXldKP65Z3X15H3itHw7Q51p0k/I+0zpBi1MppC+5koDsxxULdrMHIM5Evglc1b8cdimX+6AVSDdbQtaQJAEmGoE6rYVBCtgywJ/e/CrZEhcFgtTnLAy+dCUbolhRL68nO4D38nmKg5CcyoPZKaQUMPgIRCede0
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(56012099006)(6133799003)(3023799007)(18002099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PZ704dDT6Pvu/5sGzafxliL5iAYfSzVZXDmD/zWEQZ3tBw5uu0FJMbJElDZX5DdfonjyTuxBpfUz2cDv3eejF0W3Ox7tk2abL9ukWniRtCXoaebvpKjExahWQXF690ZtVN3YS4dkcIoZvtS/S+8l9/dXMAYtOnDzoWawIxQM9Auw8/0jG9zOQIFza5VDiz2Uww487GmwkCQWvCFOwhgvIGRW/odhNPcBnwDbLIJ2OjtrHyaYYvRdt5FcTq9JL+2d1mc3Tsh+ofDWp3Fj72sRYLV+E8YU+geih4GbCWUkLnAhne8GjIepP5B3vI5LZCdKiQ39uvWqqWfdm6MpzWuETqS5UICmxLFOseZ7UhGvwKYExOQ/tL/PDlO3DHxVFaE6D78d28cjLeO9+cIHbNL9W196sVpKYFcQnR65FqGMX7Z/3ZX6xKvdsT8GbP4TbxSx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:18:12.9433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d07cac-3ff5-4c67-3048-08decb12d83b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7547
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 19:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238859

From: Randolph Sapp <rs@ti.com>

Change this single xuser account template into a generic
standard-user-account that uses distro level variables for
configuration.

This allows for seamless configuration of multiple out-of-box scripts
and tests across layers without having to implicitly hope that the
username or groups haven't been changed by a bbappend or recipe
override.

This also adds a class and a variable to allow recipes to assert that
the user is in requested groups.

This was proposed specifically to remove some issues highlighted in:
https://lists.openembedded.org/g/openembedded-core/message/230665

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-selftest/files/static-group              |  3 +-
 meta-selftest/files/static-passwd             |  3 +-
 meta/classes-recipe/standard-user.bbclass     | 26 +++++++++++
 .../distro/include/default-distrovars.inc     | 12 +++++
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/documentation.conf                  |  4 ++
 meta/recipes-graphics/wayland/weston-init.bb  | 12 ++---
 .../x11-common/xserver-nodm-init_3.0.bb       |  8 ++--
 .../{system-xuser.conf =3D> system-user.conf}   |  2 +-
 .../standard-user-account_0.1.bb              | 46 +++++++++++++++++++
 .../user-creation/xuser-account_0.1.bb        | 30 ------------
 scripts/sstate-sysroot-cruft.sh               |  6 +--
 12 files changed, 105 insertions(+), 49 deletions(-)
 create mode 100644 meta/classes-recipe/standard-user.bbclass
 rename meta/recipes-support/user-creation/files/{system-xuser.conf =3D> sy=
stem-user.conf} (90%)
 create mode 100644 meta/recipes-support/user-creation/standard-user-accoun=
t_0.1.bb
 delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index 6a9ece20a8..9ef91bbdca 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -20,12 +20,11 @@ pulse:x:520:
 bind:x:521:
 builder:x:522:
 weston-launch:x:524:
-weston:x:525:
 wayland:x:526:
 render:x:527:
 sgx:x:528:
 ptest:x:529:
-xuser:x:530:
+user:x:530:
 seat:x:531:
 audio:x:532:
 empower:x:533:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static=
-passwd
index 98017c8153..cddf095ff2 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -16,8 +16,7 @@ pulse:x:520:520::/:/bin/nologin
 bind:x:521:521::/:/bin/nologin
 builder:x:522:522::/:/bin/nologin
 _apt:x:523:523::/:/bin/nologin
-weston:x:525:525::/:/bin/nologin
 ptest:x:529:529::/:/bin/nologin
-xuser:x:530:530::/:/bin/nologin
+user:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
diff --git a/meta/classes-recipe/standard-user.bbclass b/meta/classes-recip=
e/standard-user.bbclass
new file mode 100644
index 0000000000..ff931b8092
--- /dev/null
+++ b/meta/classes-recipe/standard-user.bbclass
@@ -0,0 +1,26 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+STANDARD_USER_PACKAGES ?=3D "${PN}"
+REQUIRED_STANDARD_USER_GROUPS ?=3D ""
+
+python __anonymous() {
+    d.appendVar("DEPENDS", " standard-user-account")
+
+    for pkg in d.getVar('STANDARD_USER_PACKAGES').split():
+        d.appendVar("RDEPENDS:" + pkg, " standard-user-account")
+
+    active_groups =3D set(d.getVar('STANDARD_USER_GROUPS').split())
+    active_groups.update(d.getVar('STANDARD_USER_SYSTEM_GROUPS').split())
+    required_groups =3D set(d.getVar('REQUIRED_STANDARD_USER_GROUPS').spli=
t())
+
+    if not required_groups.issubset(active_groups):
+        raise bb.parse.SkipRecipe(
+            "one of '%s' needs to be in STANDARD_USER_GROUPS or "
+            "STANDARD_USER_SYSTEM_GROUPS"
+            % ' '.join(required_groups)
+        )
+}
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/di=
stro/include/default-distrovars.inc
index 69c6db589b..88c3bc38be 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -66,3 +66,15 @@ KERNEL_IMAGETYPES ??=3D "${KERNEL_IMAGETYPE}"
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=
=3Dgit;rev=3Dmaster;branch=3Dmaster
 CONNECTIVITY_CHECK_URIS ?=3D "https://www.yoctoproject.org/connectivity.ht=
ml"
+
+# The STANDARD_USER_NAME is the default underprivileged user account name.
+# The STANDARD_USER_GROUPS is a space delimited list of user groups that a=
ccount
+# should belong to, and STANDARD_USER_SYSTEM_GROUPS is the same but for sy=
stem
+# groups.
+#
+# Please take note that not all tooling currently supports changing these
+# variables. Scripts like sstate-sysroot-cruft.sh and reproducible builds =
expect
+# these values to be the defaults listed below.
+STANDARD_USER_NAME ??=3D "user"
+STANDARD_USER_GROUPS ??=3D ""
+STANDARD_USER_SYSTEM_GROUPS ??=3D "video render tty audio input shutdown d=
isk wayland"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 86048e791c..76db73a462 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -815,6 +815,7 @@ RECIPE_MAINTAINER:pn-spirv-tools =3D "Jose Quaresma <qu=
aresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-sqlite3 =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-squashfs-tools =3D "Robert Yang <liezhi.yang@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-ssh-pregen-hostkeys =3D "Richard Purdie <richard.purd=
ie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-standard-user-account =3D "Unassigned <unassigned@yoc=
toproject.org>"
 RECIPE_MAINTAINER:pn-startup-notification =3D "Unassigned <unassigned@yoct=
oproject.org>"
 RECIPE_MAINTAINER:pn-strace =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-stress-ng =3D "Unassigned <unassigned@yoctoproject.or=
g>"
@@ -941,7 +942,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassigne=
d <unassigned@yoctoproject.
 RECIPE_MAINTAINER:pn-xserver-xorg =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-xset =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xtrans =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xuser-account =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-xvinfo =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwayland =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-xwininfo =3D "Unassigned <unassigned@yoctoproject.org=
>"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 842cf31739..8701e001d6 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -346,6 +346,7 @@ RDEPENDS[doc] =3D "Lists a package's runtime dependenci=
es (i.e. other packages) th
 REQUIRED_COMBINED_FEATURES[doc] =3D "When a recipe inherits the features_c=
heck class, all items in this variable must be included in COMBINED_FEATURE=
S."
 REQUIRED_DISTRO_FEATURES[doc] =3D "When a recipe inherits the features_che=
ck class, all items in this variable must be included in DISTRO_FEATURES."
 REQUIRED_MACHINE_FEATURES[doc] =3D "When a recipe inherits the features_ch=
eck class, all items in this variable must be included in MACHINE_FEATURES.=
"
+REQUIRED_STANDARD_USER_GROUPS[doc] =3D "When a recipe inherits the standar=
d-user class, all items in this variable must be included in STANDARD_USER_=
GROUPS or STANDARD_USER_SYSTEM_GROUPS."
 RM_WORK_EXCLUDE[doc] =3D "With rm_work enabled, this variable specifies a =
list of packages whose work directories should not be removed."
 ROOTFS[doc] =3D "Indicates a filesystem image to include as the root files=
ystem."
 ROOTFS_POSTPROCESS_COMMAND[doc] =3D "Added by classes to run post processi=
ng commands once the OpenEmbedded build system has created the root filesys=
tem."
@@ -388,6 +389,9 @@ SSTATE_MIRRORS[doc] =3D "Configures the OpenEmbedded bu=
ild system to search other
 STAGING_KERNEL_DIR[doc] =3D "The directory with kernel headers that are re=
quired to build out-of-tree modules."
 STAMP[doc] =3D "Specifies the base path used to create recipe stamp files.=
 The path to an actual stamp file is constructed by evaluating this string =
and then appending additional information."
 STAMPS_DIR[doc] =3D "Specifies the base directory in which the OpenEmbedde=
d build system places stamps."
+STANDARD_USER_GROUPS[doc] =3D "Specifies the default underprivileged user'=
s groups."
+STANDARD_USER_NAME[doc] =3D "Specifies the default underprivileged user's =
account name."
+STANDARD_USER_SYSTEM_GROUPS[doc] =3D "Specifies the default underprivilege=
d user's system groups."
 SUMMARY[doc] =3D "The short (80 characters or less) summary of the binary =
package for packaging systems such as opkg, rpm or dpkg. By default, SUMMAR=
Y is used to define the DESCRIPTION variable if DESCRIPTION is not set in t=
he recipe."
 SYSLINUX_DEFAULT_CONSOLE[doc] =3D "Specifies the kernel boot default conso=
le."
 SYSLINUX_OPTS[doc] =3D "Lists additional options to add to the syslinux fi=
le."
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-gr=
aphics/wayland/weston-init.bb
index 29cfba0833..feecda7c83 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -26,8 +26,8 @@ PACKAGECONFIG[use-pixman] =3D ",,"
=20
 DEFAULTBACKEND ??=3D ""
 DEFAULTBACKEND:qemuall ?=3D "drm"
-WESTON_USER ??=3D "weston"
-WESTON_USER_HOME ??=3D "/home/${WESTON_USER}"
+WESTON_USER =3D "${STANDARD_USER_NAME}"
+WESTON_USER_HOME =3D "/home/${WESTON_USER}"
=20
 do_install() {
 	# Install weston-start script
@@ -83,14 +83,14 @@ do_install() {
=20
 INHIBIT_UPDATERCD_BBCLASS =3D "${@oe.utils.conditional('VIRTUAL-RUNTIME_in=
it_manager', 'systemd', '1', '', d)}"
=20
-inherit update-rc.d systemd useradd
-
-USERADD_PACKAGES =3D "${PN}"
+inherit update-rc.d systemd standard-user
=20
 # rdepends on weston which depends on virtual/egl
 #
 require ${THISDIR}/required-distro-features.inc
=20
+REQUIRED_STANDARD_USER_GROUPS =3D "video input render seat wayland"
+
 RDEPENDS:${PN} =3D "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xway=
land', 'weston-xwayland', '', d)}"
=20
 INITSCRIPT_NAME =3D "weston"
@@ -109,5 +109,3 @@ FILES:${PN} +=3D "\
 CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/de=
fault/weston"
=20
 SYSTEMD_SERVICE:${PN} =3D "weston.service weston.socket"
-USERADD_PARAM:${PN} =3D "--home ${WESTON_USER_HOME} --shell /bin/sh --user=
-group -G video,input,render,seat,wayland ${WESTON_USER}"
-GROUPADD_PARAM:${PN} =3D "-r wayland; -r render; -r seat"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/me=
ta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 169269eefb..4b8f7ff7b2 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -18,7 +18,9 @@ S =3D "${UNPACKDIR}"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit update-rc.d systemd features_check
+inherit_defer ${@oe.utils.conditional('ROOTLESS_X', '1', 'standard-user', =
'', d)}
=20
+REQUIRED_STANDARD_USER_GROUPS =3D "video tty audio input shutdown disk"
 REQUIRED_DISTRO_FEATURES =3D "x11 ${@oe.utils.conditional('ROOTLESS_X', '1=
', 'pam', '', d)}"
=20
 PACKAGECONFIG ??=3D "blank"
@@ -38,8 +40,8 @@ do_install() {
     BLANK_ARGS=3D"${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0=
 -dpms', d)}"
     NO_CURSOR_ARG=3D"${@bb.utils.contains('PACKAGECONFIG', 'nocursor', '-n=
ocursor', '', d)}"
     if [ "${ROOTLESS_X}" =3D "1" ] ; then
-        XUSER_HOME=3D"/home/xuser"
-        XUSER=3D"xuser"
+        XUSER_HOME=3D"/home/${STANDARD_USER_NAME}"
+        XUSER=3D"${STANDARD_USER_NAME}"
         install -D capability.conf ${D}${sysconfdir}/security/capability.c=
onf
         sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/security/capability.=
conf
     else
@@ -62,7 +64,7 @@ do_install() {
     fi
 }
=20
-RDEPENDS:${PN} =3D "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuse=
r-account libcap libcap-bin', '', d)}"
+RDEPENDS:${PN} =3D "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'libc=
ap libcap-bin', '', d)}"
=20
 INITSCRIPT_NAME =3D "xserver-nodm"
 INITSCRIPT_PARAMS =3D "start 9 5 . stop 20 0 1 2 3 6 ."
diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b/m=
eta/recipes-support/user-creation/files/system-user.conf
similarity index 90%
rename from meta/recipes-support/user-creation/files/system-xuser.conf
rename to meta/recipes-support/user-creation/files/system-user.conf
index d42e3d1f50..7e94a1c938 100644
--- a/meta/recipes-support/user-creation/files/system-xuser.conf
+++ b/meta/recipes-support/user-creation/files/system-user.conf
@@ -1,7 +1,7 @@
 <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.=
0//EN"
  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
 <busconfig>
-    <policy user=3D"xuser">
+    <policy user=3D"@STANDARD_USER_NAME@">
         <allow send_destination=3D"net.connman"/>
         <allow send_destination=3D"net.connman.vpn"/>
         <allow send_destination=3D"org.ofono"/>
diff --git a/meta/recipes-support/user-creation/standard-user-account_0.1.b=
b b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
new file mode 100644
index 0000000000..558f1c70da
--- /dev/null
+++ b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
@@ -0,0 +1,46 @@
+SUMMARY =3D "Creates a standard user account"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+SRC_URI =3D "file://system-user.conf"
+
+inherit allarch useradd
+
+S =3D "${UNPACKDIR}"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+COMMON_ARGS =3D "--create-home --user-group"
+
+python __anonymous() {
+    common_args =3D d.getVar("COMMON_ARGS") or ""
+    user =3D d.getVar("STANDARD_USER_NAME") or ""
+    pn =3D d.getVar("PN") or ""
+
+    unique_groups =3D sorted(set((d.getVar("STANDARD_USER_GROUPS") or "").=
split()))
+    unique_system_groups =3D sorted(set((d.getVar("STANDARD_USER_SYSTEM_GR=
OUPS") or "").split()))
+
+    if unique_groups or unique_system_groups:
+        joined_groups =3D ','.join(unique_groups + unique_system_groups)
+        d.setVar(f"USERADD_PARAM:{pn}", f"{common_args} --groups {joined_g=
roups} {user}")
+
+        # make sure all the groups exist
+        groupadd_str =3D ""
+        for group in unique_groups:
+            groupadd_str +=3D f" {group} ;"
+        for group in unique_system_groups:
+            groupadd_str +=3D f" --system {group} ;"
+        d.setVar(f"GROUPADD_PARAM:{pn}", f"{groupadd_str}")
+}
+
+# default case, and a requirement to satisfy the parser check
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "${COMMON_ARGS} ${STANDARD_USER_NAME}"
+
+do_install () {
+	install -D -m 0644 ${UNPACKDIR}/system-user.conf ${D}${datadir}/dbus-1/sy=
stem.d/system-user.conf
+	sed -i -e 's|@STANDARD_USER_NAME@|${STANDARD_USER_NAME}|g' ${D}${datadir}=
/dbus-1/system.d/system-user.conf
+}
+
+FILES:${PN} =3D "${datadir}/dbus-1/system.d/system-user.conf"
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta=
/recipes-support/user-creation/xuser-account_0.1.bb
deleted file mode 100644
index 04f506e7a3..0000000000
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY =3D "Creates an 'xuser' account used for running X11"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
-
-SRC_URI =3D "file://system-xuser.conf"
-
-inherit allarch useradd
-
-S =3D "${UNPACKDIR}"
-
-do_configure() {
-    :
-}
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf ${D}${sysconfdir}/db=
us-1/system.d/system-xuser.conf
-}
-
-FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
-
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--create-home \
-                       --groups video,tty,audio,input,shutdown,disk \
-                       --user-group xuser"
-
-ALLOW_EMPTY:${PN} =3D "1"
diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft=
.sh
index b2002badfb..5e1ae9c535 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -127,9 +127,9 @@ WHITELIST=3D"${WHITELIST} \
 # generated by useradd.bbclass
 WHITELIST=3D"${WHITELIST} \
   [^/]*/home \
-  [^/]*/home/xuser \
-  [^/]*/home/xuser/.bashrc \
-  [^/]*/home/xuser/.profile \
+  [^/]*/home/user \
+  [^/]*/home/user/.bashrc \
+  [^/]*/home/user/.profile \
   [^/]*/home/builder \
   [^/]*/home/builder/.bashrc \
   [^/]*/home/builder/.profile \
--=20
2.54.0


