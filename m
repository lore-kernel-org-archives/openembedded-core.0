Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A51CCF9F8
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:22:49 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.102.128.41])
 by mx.groups.io with SMTP id smtpd.web10.3491.1761844954660659828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BN+KMBd0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.102.128.41, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr3oMCQG5somMItimWTd8HMOqV9jI/sS5s0ScosXX/IRxTlq9bVOzS45im5XiOW065Hx8hH6PwJkqBY1ItnjoF+fRuovCPQ9Y8bdc6QeDtNmxae1WpgJaTasaW0CzbbVeSglalxR47iBHEvyb5Of+2/v5o2LXNF9NGHCo32BVwCYVriZPvAXLsITAHlWqYqMr9UJGcWHnRZyKucAfXACXMqlgFkZfC1OXLFlz9nssZ/oOuwlRKpMFsrqiJOGnOz6o+6dR7rC8zMEqvz2IbxhymJCrD/X3838/mZLqiz5VI7y1+RBYbqi5Fh90dbwyJxqXWE+xqQHmk/i94l5h08X+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNPVA+CV7kMs6A6D2d9xrYfdb1Nyq6EqWgPuJBWzdMk=;
 b=hWZQcjK+PT263g0V+WNkT/GxnskDv9RZ8qG52sBjgGWEH5Z6E6tJ6FfIIocKZ8aB/dtWJZwxkki9PiugHAlWenhu4FhJF+TaK9/fncrrypbpNAIK4POOmw+EWwCFi6OdgFnn5fORxYucO5lb5n5XrzdqUuIxrqbygeljchi55pTWmc5YexXoymFwqyiz5Ge0xEPfPhWF2eXdimTTrlH/O2IH62usLLiEeE4wfXg6ksO1dQCXiw9BTgSQzsuXMNducCYNSSw9h5skFPdXsM7C6xScXcBy0T0NsFFDbnxL67fF+ZO5wbn/cpxfRnrN3xkWqaGsWyt7s1PeVreVMgb0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNPVA+CV7kMs6A6D2d9xrYfdb1Nyq6EqWgPuJBWzdMk=;
 b=BN+KMBd0A+H3beIaGH/Eca82jZ+khyi5Ra85BGRqd6nSfc0KjeBgjEhJan9i4F+RBqkk4SYABDTx8lRVK23mhseTjkmuk64lfHhQ8+CW0qe1rNBVF9keRT9zltmZjCKFifI0uNhj3BRKvXXokPKHBzgEMOQFOsQYtlTJwo244V4=
Received: from SJ0PR03CA0232.namprd03.prod.outlook.com (2603:10b6:a03:39f::27)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 17:22:31 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::9f) by SJ0PR03CA0232.outlook.office365.com
 (2603:10b6:a03:39f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 17:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 17:22:30 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 12:22:23 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 12:22:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Oct 2025 12:22:22 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59UHMMH22553670;
	Thu, 30 Oct 2025 12:22:22 -0500
From: <rs@ti.com>
To: <alex.kanavin@gmail.com>, <Ross.Burton@arm.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCHv2] x11-volatiles: register x11 volatile directories
Date: Thu, 30 Oct 2025 12:20:43 -0500
Message-ID: <20251030172042.118131-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|BLAPR10MB4865:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0b850e-922b-49f8-9582-08de17d8e83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4bofS5XmMAhEgrPdR+cLRWQ5dTd8oUgsrjQtcotyIp755ovO4cOFXyum57eY?=
 =?us-ascii?Q?GX1jyWnyZquastGqKPg1HHCFRRag9i8wZjbQsAldeK8WaskEDCe3MRhdLpcT?=
 =?us-ascii?Q?eOof17zmN1PUlcdfJBaa3tNDLrcKa4ZL6/xz/w0bLgueYVtaNrGrc1N/vUpI?=
 =?us-ascii?Q?+wHr4fsL+8Qr4VUaouuDdacZpSJYWTkS4CRakyQZQ2V0cryPzMKE/DG24s37?=
 =?us-ascii?Q?MeR8xKiStEci32huYo5vCeYui/gCwTvi9VVzgGqNlVX39UepX8sx/Jh1edtO?=
 =?us-ascii?Q?UAeMD2GJEiipJJF0aEVqEs2tQpXRqLQhuQhxJO3n3NXE2wUEt7vEooUBP/K1?=
 =?us-ascii?Q?s7UkMVSRvi1A1fagBjxpYNQ7tK6HDn4TZKFBUih9e4k/BWk0SNDeTrdgL0YY?=
 =?us-ascii?Q?sNGPnJQg71Frf/8b/2tgS12OxcLKO2LJIYj6uM21z/7F7Af6oe4w5VCTRccN?=
 =?us-ascii?Q?Nx9yULpvKXTGuGxU6KfEZQjUVjYvwKD1BVvFMTys27/L/X2n+yCuYZFwfQF9?=
 =?us-ascii?Q?KXfr7IYgPaAMT5u6THkLzfOpC3lu+nsMcD706ZyR8kFYv4zhbHQjtUeii5cb?=
 =?us-ascii?Q?6J/AxEWSJpVhx8xV0UrQVmpusH5Yy8T4bmmbsKSWinLhUCx0MZNcdtRQtsHT?=
 =?us-ascii?Q?J5Y3MuwOfc3JWiqfnAvQ5sW4uaKhB+oELBrmSb54oEDm4ggRIrG3CwVF7Wuk?=
 =?us-ascii?Q?py4dz3I0pqpWWj+M1rgdtFUl98MA5NdGprwuITbY7Mu2oExfLOjL2/POPiRF?=
 =?us-ascii?Q?bAL3ty3lUXPhnxSRI08QjTC9c7rhVRGn4MN+rlJroKXqimnSpLst6cKDZHNI?=
 =?us-ascii?Q?XoEoFWTrR0DZ/R0R6v7tOjk0/sSPUBLdbXMOjGz7hGGEUIHk2cNMwRVSMXPJ?=
 =?us-ascii?Q?qJlB/aLVUu32pjVGhB6d5VmjMubdNXr/EVHbqO1d30Evly5QtsbVDOQ54KF4?=
 =?us-ascii?Q?udXrvJffOMxYst5JPHfqAg76nmKKV8XlN7B02PZ5ABvzdg0Y083jpQKXp3i6?=
 =?us-ascii?Q?5yf9RG7jFGgrMYs8syHQ5NdII88GUkTdDqimAH1GmruaiZkiX2q72iBbmGuu?=
 =?us-ascii?Q?zAwkbuyJZbnlIklU3+/a8dzoTU1CHm/962YF+1g72cbzw3hZme2w/91cso4e?=
 =?us-ascii?Q?teBYGhJdXS6r6eSSt+6frKD7+O44Zd0HY9vJe3juYY5YoN7I+1OCuvLVJaCM?=
 =?us-ascii?Q?TXzENNas1ygHdbOA6KZaL6REmq7BoUjp8HUrAn77v6xMaHVDMmTXKnO5oVQB?=
 =?us-ascii?Q?xAAqn6DF/ZnoCsQJ0uuffPHiQVhOdF6PHp+Cs4OT8Ms5VCqnZiAnUPtY7X8a?=
 =?us-ascii?Q?MgiOeN0WsVr0xeur+zM7ws1JYEZ2+LxOsTqeyR/cFT63bASt6U8qTkSclwZw?=
 =?us-ascii?Q?goZXbhfYze/Sr4AqTQ/PYZ5U592YHisAwT3+AjfndkAuQcmejD50RjPzM6mo?=
 =?us-ascii?Q?7cWb9U3duRdmbxU7pMEXZfsoq7EZoQx6PxqtzXONcLSrFhvIs2T/aNdkwhj2?=
 =?us-ascii?Q?+7/xDQdkVZ7rfjP/A0bd9w+BwLG3RfOG6ObaQJSmujS84RajhWSBddonx/5V?=
 =?us-ascii?Q?3+Ba/LUmSZR3F72i+4w=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 17:22:30.8918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0b850e-922b-49f8-9582-08de17d8e83d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225517

From: Randolph Sapp <rs@ti.com>

Add a volatiles entry for popular x11 and adjacent utilities. This is
designed to mimic the systemd tmpfiles.d entries and prevent any one
user from creating these directories with permissions that may
negatively impact multi-user environments.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2:
	Drop bin_package and use allarch as requested. Manually specify=20
	do_configure[noexec] =3D "1"
	do_compile[noexec] =3D "1"

	To match old behavior.

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../x11-common/x11-volatiles.bb               | 23 +++++++++++++++++++
 .../x11-common/x11-volatiles/02_x11           |  6 +++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  2 ++
 .../xwayland/xwayland_24.1.8.bb               |  2 +-
 5 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/x11-common/x11-volatiles.bb
 create mode 100644 meta/recipes-graphics/x11-common/x11-volatiles/02_x11

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index c4142e2b72..6902bc0c44 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -886,6 +886,7 @@ RECIPE_MAINTAINER:pn-wic-tools =3D "Unassigned <unassig=
ned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wireless-regdb =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-wpa-supplicant =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
+RECIPE_MAINTAINER:pn-x11-volatiles =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
 RECIPE_MAINTAINER:pn-x11perf =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-x264 =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xauth =3D "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/x11-common/x11-volatiles.bb b/meta/recip=
es-graphics/x11-common/x11-volatiles.bb
new file mode 100644
index 0000000000..3eddc12152
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/x11-volatiles.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "Xserver Volatile Directories"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-2.=
0-only;md5=3D801f80980d171dd6425610833a22dbe6"
+SECTION =3D "x11"
+
+SRC_URI =3D "file://02_x11"
+
+S =3D "${UNPACKDIR}"
+
+inherit allarch features_check
+
+REQUIRED_DISTRO_FEATURES =3D "x11"
+CONFLICT_DISTRO_FEATURES =3D "systemd"
+
+do_install() {
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${UNPACKDIR}/02_x11 ${D}${sysconfdir}/default/volatiles
+}
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+FILES:${PN} +=3D "${sysconfdir}/default/volatiles"
diff --git a/meta/recipes-graphics/x11-common/x11-volatiles/02_x11 b/meta/r=
ecipes-graphics/x11-common/x11-volatiles/02_x11
new file mode 100644
index 0000000000..35c3698479
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/x11-volatiles/02_x11
@@ -0,0 +1,6 @@
+# Volatile entries to match systemd
+# https://github.com/systemd/systemd/blob/main/tmpfiles.d/x11.conf
+d root root 1777 /tmp/.X11-unix none
+d root root 1777 /tmp/.ICE-unix none
+d root root 1777 /tmp/.XIM-unix none
+d root root 1777 /tmp/.font-unix none
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/m=
eta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 14c45be432..3c8cb0173f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -26,3 +26,5 @@ RCONFLICTS:${PN} =3D "${PN}-extension-dri \
                     ${PN}-extension-extmod \
                     ${PN}-extension-dbe \
                    "
+
+RDEPENDS:${PN} +=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", ""=
, "x11-volatiles", d)}"
diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb b/meta/recip=
es-graphics/xwayland/xwayland_24.1.8.bb
index 900da524b3..a621af1a7f 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
@@ -47,4 +47,4 @@ do_install:append() {
=20
 FILES:${PN} +=3D "${libdir}/xorg/protocol.txt"
=20
-RDEPENDS:${PN} +=3D "xkbcomp"
+RDEPENDS:${PN} +=3D "xkbcomp ${@bb.utils.contains("DISTRO_FEATURES", "syst=
emd", "", "x11-volatiles", d)}"
--=20
2.51.1


