Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F9FD73EA4
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 23:02:33 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28746.1769727751834846445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 15:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TdxSBXXv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.56, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvIScpgwzsbQgUcsmaX2XWmPcTRuaVjxRsYkUTBJXK7w5FI+JkFKnmKAZ1fp6wCirRiGAnZ1p8vJC29JxJpu7Ynp3tMY6DOmMg01BqircQLRMDdkr2KBLOPB+DOxx2f69nBqiJTS5Tr+zt2d7ZXGfEyOPPvd0fXQ21oghQmuOX6rHlJeQwXOtShkkE+OYDUUS9JACqBpK0TS6oOMoWorzGJcHPVZ2Gy1/Az2v18nFWuOCBu+E53I4lL8aGi/SuJ8V51CzDguc6xkRbdRMioNCYLjFxPUi1dVanHVg3yez08+JHzGkE3FAkUSPQIA1LLVN69NRantOG+674292kzbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+V0aNpOuvgL35OtM4othbgHFTyjQmFUTDH9kJRRM6dc=;
 b=AZVaulBNQck5EyxkQgx0+V+RnC/lMz/uDg698O+F+REKVMSGx353cV1gFvUi9uT+1qKy8BLVpsJ5eJpoCpH5xwHxyhp/QMZJdYHYsVyCwl21L4o+hUv/mhqNTYcwdDue1CdkfMAv62nFoloLPtWzv7ZfjCra1+Ez9Zw3i5wVhr9P0Qyii4ahlddrto1auqykdK96enOJ7fJ3W8R0XX46PABhLIV5b3WxjW328mZUs703UXQdJU+b/B9m9nYkDZo50dJGHpJ8KhNyPPwi1FZtTu83BqBGpgKQI7QdHfbJwoKP9s6zXMGwK3dpKBcY6iGOnl+0VPvhhgOEoD4gFP36Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+V0aNpOuvgL35OtM4othbgHFTyjQmFUTDH9kJRRM6dc=;
 b=TdxSBXXviXC1fMYTzT6dfQ/dSVmWLRSROO0PkzIUhpXCuP6DErO44vJBE9+XILLBPUNOx8IQsaxV954oWzK7wQfynfnapOF8xPA7NdlQggZAezIYeyZjJH0iVkyP2qNvtV6V/MqPC/P0n9fZVtM+fI3EGKm+cj+wO64HF5r7/p8=
Received: from PH8PR22CA0011.namprd22.prod.outlook.com (2603:10b6:510:2d1::22)
 by DS7PR10MB5119.namprd10.prod.outlook.com (2603:10b6:5:297::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 23:02:28 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::93) by PH8PR22CA0011.outlook.office365.com
 (2603:10b6:510:2d1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 23:02:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Thu, 29 Jan 2026 23:02:27 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 17:02:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TN2QPG713167;
	Thu, 29 Jan 2026 17:02:26 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>,
	<a-christidis@ti.com>
Subject: [oe-core][PATCHv14 1/6] emptty: add version 0.15.0
Date: Thu, 29 Jan 2026 17:02:05 -0600
Message-ID: <20260129230210.2934333-2-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129230210.2934333-1-rs@ti.com>
References: <20260129230210.2934333-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|DS7PR10MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 52507a6f-b08d-425d-665e-08de5f8a78e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rgXYfz8ogolyGJpYtPJxDkOLEt2kOdYQU8kSnsFzGmP8MiRdffGufcBUOIs9?=
 =?us-ascii?Q?wnTvB6yWdMUrKCvAk8rT+Df8EfnY6mnaU3rMZgPuxOF6dxmUBzP+q1rGfS0h?=
 =?us-ascii?Q?4nna0AG/4KGFWKa1yJIDu9AG5zkMsE1IVxOUylTsBMn1acMLCNPQLcEbw9qd?=
 =?us-ascii?Q?J7zR/CjJYi7+jk3OX18q9NYWVyeTL3pEWwozLRsMyjEc6tA6aNmuWpaIdD8C?=
 =?us-ascii?Q?Nw/WGijoJhSmDftErfKYdifgK1KWfx6Z/5W2AvqJxLl5tEO5yjFRrtRLUoFf?=
 =?us-ascii?Q?nPwpYf19EGeYGplP13VlmkNBEWGVv9cKVIGhFa3KE5aDlC96gWXvBTQi5diM?=
 =?us-ascii?Q?wcBzVOcy+N7xJ5y6WnRxhyiYDxa72q4xLv9GtsWBrBVrmRDCCtjVjfVnzjPE?=
 =?us-ascii?Q?3D1k/y4gWXS5jPrbH0X3A1hekNyrdtm0+r2Jpbq8CsywfPCN326D9trmOgoE?=
 =?us-ascii?Q?KYjlvNmlzrv5xdpqhSyRIJcuBcutF6Ot0fpNFqQkLT+r74uEbxiFH3yIj7FX?=
 =?us-ascii?Q?LFYb5sZ14NtxgxpgzQnDdmKF3cP445E27i6tKdO+3If9mLlHFRMTFcV719gd?=
 =?us-ascii?Q?nn5h7Wv0fiHBU2scxsUkCQznFvgzDYnC8L0fzaoNU1oIcT3WVEJ6+iSQi4GL?=
 =?us-ascii?Q?lr2IEl/6lpAnDVezzcgpzHlLSTah13lUGt8eGpyKjfYsCza6+7k0kE+g5lvE?=
 =?us-ascii?Q?jUPKM0hoh6GnSf+3rUwCAwlnkwTOGQF1+VUxO2ZruOVi5VCQuGD6bQO1RUej?=
 =?us-ascii?Q?XRvZN4tnNd0FkOI053ZaFqj3DYfjicJbB/CpLoetVPSmb+Z4nlgf5mNKxdxj?=
 =?us-ascii?Q?IP4HPl6YZIXNFlNYPZlEPlWb2oOo1uD/3K3pCdAA9OF/XqVi2d0u/xi2ZSvt?=
 =?us-ascii?Q?eL5av0beLZPpqMay+8CqL6tUfq5wX12O/TmwE6SCY9cYlvI9SHMDBKi9VcSH?=
 =?us-ascii?Q?SvijvWkfPa1EApchEE9z1DZFgbB8xUZQaGyPXusjsqUWM6Nia2F7TPClFzXC?=
 =?us-ascii?Q?LcV2Tifn0yjwBhjxoTq4umOoMpWpEmJKh4A+L0Aj5FlwNvqbu2eECOJ36QyG?=
 =?us-ascii?Q?0WGSnq3b5tb9ZSAgd3z4LLcc5OGqOnCiN9Jjis3im7aqWE0zXfMMqpgfNafO?=
 =?us-ascii?Q?O/IM45vZIjBSJhRvt/mV6FE9Ur+T4+SFCzA2vFMLjUEWUreH4baOYu6Ok9zk?=
 =?us-ascii?Q?pSRd9r28qnMqR5Yw8Rnc/tbAOaiaxHf6m+3KKfKXSr5g4RcASuxfpqnBuqoB?=
 =?us-ascii?Q?/jCIfuPhYUTIYfibaAJEKoCqFIaAM+nQ8Z3lTr0dQO7eEe0HHBpwq5bhlxAA?=
 =?us-ascii?Q?ciy31gGz3NR2xKQDkay8zuB0PGZBSIqabbtucMuETkkusu5EBRGSltdh4cPP?=
 =?us-ascii?Q?iNJIbTn900rrd3G4eby0CKobgC3vGEXJu/Ah1Wosb2OcTAEFWZkx1xiQZrTe?=
 =?us-ascii?Q?EeeJlEJOA542iTGQ6ypB7hrd5PhyTKX43mB9qVffMVHKTI4/5HE8Rqpsn0t/?=
 =?us-ascii?Q?pej34HSXOHzSw0P/ak8kGkVhEPTMuBK0qdd3ip+kmMzL24zuaEg8DdCpN6W5?=
 =?us-ascii?Q?0pWIy6Yi7pVHXkRQ0vWmFXa642L2sk6J1ze9bU5IqTHVG7gvk3mjxW6GugkP?=
 =?us-ascii?Q?N3Nvool+3RrHvuddDvCQl36wcR8s73I4LjxmR/FGZNaa5KQe9eAHkI1bZYsN?=
 =?us-ascii?Q?zmzn+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	j8R9n0fdVdonK/LwyTsuCYf2cbyeC4GKkNvfDJgt5kMsOUJSNuKzVYaAW+/YHj9SMQwrZlHuP6iYTMjGx9eNRTZhrTjn1wiovzcqT1tQHJLsWnW5cse0q2guEQb/ncYkCEM6FzMU+0E9okJc5urG8D4F7rVGq6ucETYX+Bf2e+9Ey6xkni/X3QF45bqTnoesADI4tgg27AaPXtg1USl9s2lbtCtloYedhUHH6ZnMM8qRtWXQD8LVtpbuNz0tZaEPkJUIKDhYbBWctiS7r5JeuiAJSo78rbA2pFbMhCVm2Zmy0kgvYTWHKcQ9+Kre5UCxUrGuWdP2RLdQXm4uFUvNkPhrH+iVmOUg0nz87rX3xrxGYdjFPuEWzqrfdNDN2OgA623sg4sAgspZh4IjTg40YsAzj+HT/+v7tOk/iOxbuR1VshhCwHrYlor2RGOTH8E1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:02:27.0270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52507a6f-b08d-425d-665e-08de5f8a78e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230164

From: Randolph Sapp <rs@ti.com>

Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
relatively lightweight display manager that supports x11 as well as
wayland through both a CLI and an automatic login mechanism.

This can effectively replace the custom init scripts for both x11
(xserver-nodm-init) and wayland (weston-init) with a single tool with
more verbose logging capabilities.

This is split into two recipes. The emptty package provides the binary
and various agnostic configs while the emptty-conf package provides the
default configuration for the application itself. This RPROVIDES
virtual-emptty-conf, allowing other recipes to provide their own
configurations to override the default behavior.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-selftest/files/static-group              |  1 +
 .../rootfs-postcommands.bbclass               | 14 ++++-
 .../conf/distro/include/default-providers.inc |  1 +
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/recipes-graphics/emptty/emptty-conf.bb   | 14 +++++
 meta/recipes-graphics/emptty/emptty.inc       | 25 +++++++++
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 ++++
 meta/recipes-graphics/emptty/emptty_0.15.0.bb | 55 +++++++++++++++++++
 8 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.15.0.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index 252fdac67d..a197216165 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -29,3 +29,4 @@ ptest:x:529:
 xuser:x:530:
 seat:x:531:
 audio:x:532:
+nopasswdlogin:x:533:
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes=
-recipe/rootfs-postcommands.bbclass
index f0c7ee658d..2551e2cb67 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -45,7 +45,7 @@ POSTINST_LOGFILE ?=3D "${localstatedir}/log/postinstall.l=
og"
 SYSTEMD_DEFAULT_TARGET ?=3D '${@bb.utils.contains_any("IMAGE_FEATURES", [ =
"x11-base", "weston" ], "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES", "=
systemd", "set_systemd_default_target systemd_sysusers_check systemd_handle=
_machine_id", "", d)}'
=20
-ROOTFS_POSTPROCESS_COMMAND +=3D 'empty_var_volatile'
+ROOTFS_POSTPROCESS_COMMAND +=3D 'empty_var_volatile add_emptty_inittab'
=20
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES", "=
overlayfs", "overlayfs_qa_check", "", d)}'
=20
@@ -193,6 +193,18 @@ systemd_handle_machine_id() {
     fi
 }
=20
+#
+# A hook function to work around limitations of legacy inittab behavior
+#
+add_emptty_inittab() {
+    [ -f ${IMAGE_ROOTFS}${sysconfdir}/inittab ] || return
+
+    if ${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ]=
, "true", "false", d)}
+    then
+	echo "7:5:respawn:${bindir}/emptty -t 7 -d" >> ${IMAGE_ROOTFS}${sysconfdi=
r}/inittab
+    fi
+}
+
 #
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 #
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index 5101ad78f8..e9a6d299bc 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -67,3 +67,4 @@ PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "native=
sdk-libsdl2"
 PREFERRED_RPROVIDER_virtual-libegl-icd ?=3D "mesa"
 PREFERRED_RPROVIDER_virtual-libglx-icd ?=3D "mesa"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
+PREFERRED_RPROVIDER_virtual-emptty-conf ?=3D "emptty-conf"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index e830648945..97c91a0e62 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -170,6 +170,8 @@ RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-ell =3D "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-emptty =3D "Randolph Sapp <rs@ti.com>"
+RECIPE_MAINTAINER:pn-emptty-conf =3D "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-enchant2 =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-encodings =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-epiphany =3D "Unassigned <unassigned@yoctoproject.org=
>"
diff --git a/meta/recipes-graphics/emptty/emptty-conf.bb b/meta/recipes-gra=
phics/emptty/emptty-conf.bb
new file mode 100644
index 0000000000..0b98e2e13e
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty-conf.bb
@@ -0,0 +1,14 @@
+require emptty.inc
+
+SUMMARY +=3D " (Default config)"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install () {
+    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-config
+}
+
+FILES:${PN} =3D "${sysconfdir}/emptty/conf"
+CONFFILES:${PN} =3D "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN} +=3D "virtual-emptty-conf"
diff --git a/meta/recipes-graphics/emptty/emptty.inc b/meta/recipes-graphic=
s/emptty/emptty.inc
new file mode 100644
index 0000000000..7a0d4d257e
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty.inc
@@ -0,0 +1,25 @@
+SUMMARY =3D "Dead simple CLI Display Manager on TTY"
+DESCRIPTION =3D "Emptty is a simple display manager with a command line gr=
eeter \
+It supports both X11 and Wayland sessions, exporting required variables an=
d \
+creating user paths as necessary."
+
+HOMEPAGE =3D "https://github.com/tvrzna/emptty"
+BUGTRACKER =3D "https://github.com/tvrzna/emptty/issues"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Dd1e4d12c7d1d17=
367ba5668706a405ba"
+
+S =3D "${UNPACKDIR}"
+
+FILESEXTRAPATHS:append =3D ":${THISDIR}/emptty"
+
+GO_IMPORT =3D "github.com/tvrzna/emptty"
+GO_IMPORT_pam =3D "github.com/msteinert/pam"
+SRC_URI =3D "\
+    git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Ds=
rc/${GO_IMPORT} \
+    git://${GO_IMPORT_pam}.git;protocol=3Dhttps;branch=3Dmaster;name=3Dpam=
;destsuffix=3Dsrc/${GO_IMPORT_pam} \
+    file://pamconf \
+    "
+SRCREV =3D "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
+SRCREV_pam =3D "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
+
+SRCREV_FORMAT .=3D "_pam"
diff --git a/meta/recipes-graphics/emptty/emptty/pamconf b/meta/recipes-gra=
phics/emptty/emptty/pamconf
new file mode 100644
index 0000000000..9cbfd6c4a5
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty/pamconf
@@ -0,0 +1,10 @@
+#%PAM-1.0
+auth            sufficient      pam_succeed_if.so user ingroup nopasswdlog=
in
+auth            include         common-auth
+-auth           optional        pam_gnome_keyring.so
+-auth           optional        pam_kwallet5.so
+account         include         common-account
+session         include         common-session
+-session        optional        pam_gnome_keyring.so auto_start
+-session        optional        pam_kwallet5.so auto_start force_run
+password        include         common-password
diff --git a/meta/recipes-graphics/emptty/emptty_0.15.0.bb b/meta/recipes-g=
raphics/emptty/emptty_0.15.0.bb
new file mode 100644
index 0000000000..732bb45ff1
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty_0.15.0.bb
@@ -0,0 +1,55 @@
+require emptty.inc
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
+PACKAGECONFIG[pam] =3D ",,libpam,pam-plugin-succeed-if"
+PACKAGECONFIG[x11] =3D ",,virtual/libx11,util-linux-mcookie"
+
+DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/cr=
ypt', d)}"
+
+GO_TAGS =3D ""
+GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nop=
am', d)}"
+GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',nox=
lib', d)}"
+
+GOBUILDFLAGS:append =3D " -tags=3D${GO_TAGS}"
+
+export GO111MODULE =3D "off"
+
+inherit go
+
+DEPENDS +=3D "gzip"
+
+do_install () {
+    # general collateral
+    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
+    install -d ${D}${mandir}/man1
+    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptt=
y.1.gz
+
+    # pam config
+    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
+    then
+        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
+    fi
+
+    # systemd init service
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-systemd
+    fi
+}
+
+FILES:${PN} =3D "\
+    ${systemd_system_unitdir}/emptty.service \
+    ${bindir}/emptty \
+    ${mandir}/man1/emptty.1.gz \
+    ${sysconfdir}/pam.d/emptty \
+"
+
+RDEPENDS:${PN} +=3D "virtual-emptty-conf"
+SYSTEMD_SERVICE:${PN} =3D "emptty.service"
+
+inherit systemd
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
+
+inherit useradd
--=20
2.52.0


