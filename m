Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B337E94627
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 00:26:20 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9403.1770683175494138573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 16:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=snmvXnnO;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.63, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2uG/QEEenpOU8Es9BaStln0uWtaVp9pifNZGBgaasJb+jWv27ZGSuw4ClyIkqAHw99KeoHOCahvFDlvS2YZX7xOoGownLLgVCFhZG0U57LQxole2YB1WUhlzQpJMTwYKcSozcXysTlb9062Rxy3nalJr8dhujm1tXLBa2nZBUd3+w1xjkPuAOnR2t8ZwuqF2xz8YoMg5U/Pn12WuXJAKZ/E9o6So2xo0MUXYw6QDIEhNTMy8qDKnUuvaeXJn7qtWcYXQv1ZX8MqpCyKQn1cHZ30w1Et9mH5D/bM2ocSCaC0BvO7NyGRLYAx37t4K0qAWf8zmybAC4m6bpa0QoDsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCoLcXVhYfM0yjeC8wwuvztECmgqhoYfzZiRkdFtlYQ=;
 b=tPNaORkeyd5S5plvPYAJQnRPXruxDRuF6A65Srg2rFuNiIMC8tVgGsKuR4FyqdnggfBYcTvPJbpx15NBusPdhVyMxq4J147CebobnG1DhsaYb3yBfq9hGtvlNAF5ljIyZyhEgJDEhy4n+OLFtiPZSUnKWiE0aNUJ5WKelaNxLoksq0Vdp5OSHb6/FUgaMzRFuZYdX0w5zh55YqOWOf8e7j/W/95g0f8D+e1tiJCJq33uL7D1n3Yzg/nx8g8uayzPnOPDF1QljxPKjra/WdFsvDbo1SHjYT+BldYBPB8425oWYWHVZ+wHEhWCMjmIU9LkDK3yAQ6lfWcHqsGiri+dlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCoLcXVhYfM0yjeC8wwuvztECmgqhoYfzZiRkdFtlYQ=;
 b=snmvXnnOAaQfD56gAFvV2BQp7K+B8aZezGrQfEBGf1wzIp8j4MQqaqv0bCQnralLdR3jAyWFJithHRHZe1furM6MSTUADxCuoH/4TIsqv1Lkvmple4DWpGCAecoshZOXPcdJvi2+VDF/DKv8+1EvbIkgmdgBri7oLl1xN40q51Q=
Received: from MN2PR12CA0013.namprd12.prod.outlook.com (2603:10b6:208:a8::26)
 by BN0PR10MB4871.namprd10.prod.outlook.com (2603:10b6:408:128::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 00:26:13 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::c2) by MN2PR12CA0013.outlook.office365.com
 (2603:10b6:208:a8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 00:26:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 10 Feb 2026 00:26:11 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 18:26:07 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 18:26:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 18:26:07 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61A0Q7lr2925776;
	Mon, 9 Feb 2026 18:26:07 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][RFC] xuser-account: convert to standard-user-account
Date: Mon, 9 Feb 2026 18:25:07 -0600
Message-ID: <20260210002506.95298-2-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|BN0PR10MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: c0217205-e324-4f08-cc73-08de683afe01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JMcg3dzsV6mTlkokKSTFifIGCo/lKhYmG76q15TkxVeCbGI+q2m+rfW7uEmE?=
 =?us-ascii?Q?gXKmIz3yucd7PUhIJxq5OMDZIyUeigmGem6AuyLq3PjdA679cQaw8HSn99ql?=
 =?us-ascii?Q?38gF5aaWMan90PKHwycHv+cmf6w7OibFzDX9os3MU+2o7G9BUOnlQl+D+U8E?=
 =?us-ascii?Q?Rhw/Gav6TufJ6IEO2MR+fPhgVned3HM2lvgq3eWhF/EculiCJmTZI28K9zkV?=
 =?us-ascii?Q?t7LcTvgQziaXWj5fsNHmy8GiiN9z0oNunCAPNKZGizX+F1mK8sJmdbiGGhqs?=
 =?us-ascii?Q?V5bbh3QVyORSpLC/4CiQV4e1sP7thxifzdXfeRuyvPkUVCnP2kSM+zfpobLu?=
 =?us-ascii?Q?zkaQctz3do+kT0a+cVdv3GnrNbjsFQExdU4pvXLadB8EMLUuIqcAzyHcAPRj?=
 =?us-ascii?Q?uPeWzFDd5aGqlqjBRxxUzxej0Xqvu1cz+iqN7MtPiqE6Q4rNoIFqXZopx6sX?=
 =?us-ascii?Q?IblO/66lz7IVLopao7nWyHT2C649u3+yHbPvTpRwidXPp8prXxOCE5Xu5C5L?=
 =?us-ascii?Q?1cGzZb4V6YvWYo2Iw2tYCvf8MqGhGeCmoNPYB5fFAtoh7IifA7ea0n1TIZFL?=
 =?us-ascii?Q?65yHM8r4C6L2E4iknSyL8nONucw5acACuqcP61G1cQcSBiflZVFwvWChriNS?=
 =?us-ascii?Q?HY8KNZdyGcJK2KWew0+ME9rQ1vYlfDJzNCdjp+Tg738c2K+4Rw/erHexBNHu?=
 =?us-ascii?Q?XEaU2mNyG5cMidYaO8R/VNmQOab2WGpgWvBRtrOHpUMei8PAKe5LRte9Japj?=
 =?us-ascii?Q?C5PSbhMAT9Tm9mqTKo5O0+PkLl+1S8kZ9CIFe7TW//gMLmF3X518IJwhCjmo?=
 =?us-ascii?Q?15k5CScUNlsGkzxskNKS2jBDILVwuSoknhu/pWFSxGYuMJyvEWmz279VjdWs?=
 =?us-ascii?Q?e/B4pQ+HP8wnQnGZ4g+j5fck+lSUhVZLlsDFip/G8sChxYzyv41PWTdmb2wF?=
 =?us-ascii?Q?TdgOhd1sBNygQJnPOpGVmb6J5NwHJBUPiilwh8ZVhb8tYp4Wn776QFamh+ec?=
 =?us-ascii?Q?0zRG820oQjpJByuEVa6ptrvvi/CriuqkM7eRa/flwG40zCepP5eab1eQpz53?=
 =?us-ascii?Q?DzekzxNXj65EX0oCnKvz+R52YrPKJWH/oeUmiN10CHf5xBf2h3BN3w6qrT92?=
 =?us-ascii?Q?3+ikjxA59IvwQeRO8QqvxnpCQRWOjD1dam8NCVp7KfTvzqEMiQnzOOb8W1Y8?=
 =?us-ascii?Q?gpwwPY9jd+wv1RUH55HLL3HLPQwc5HrbH/EElzw/sa7HUod1hzq/rdN2Il5S?=
 =?us-ascii?Q?gwQYDvgKjX0CUQQ9jvZL+EvrsEfCWaruaxwLSzVWIbmzZE5ttWevxTNsvb9s?=
 =?us-ascii?Q?w8NHBfoNOP4Nl32BRkjrS2RD26mHRFoIoC5QNJrOSSjXfT34DsOsBHQUV0nE?=
 =?us-ascii?Q?zaGZTynfXhGCPPxdphe+yq9uW8wI5EpmbzJBP8+rt3digcmulKP1Mo20XGs2?=
 =?us-ascii?Q?rio2SaUNmJjRfBGJYMXkgcgYB67oF953RzumDhrcN0sLThA+NpRXFh4K+YBm?=
 =?us-ascii?Q?+oluoJIMNpeR63FI6BXWYXzr134eERMBJk+YaIztZTmpR/ikmZLCyxJiOE4z?=
 =?us-ascii?Q?Zdb3c5mA+Kz0xgrVRQpJ97fU3LQeNOrSVGJ415egV5Pix4t2XaEBT4qY6hL8?=
 =?us-ascii?Q?FQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wIMJD/4KbHkHIja6tFR8bIV8Gxj4YrCLvThoMWsAqAzxCYH5RDcz1saNeKVw3AV/fNbuGnfvXgqquYPSOsdrj/uNE5g68j3tOGd4Y/OJ7nAqcTzoFm4uW3+JWOn63jGE5nE11IRPZp0B1W/K00rDs/V1HDF9Clj50Wmi3gVi+YvUZZ8KpitokWsTnJ7Ey93PbPGdQji1Bu7IUhJoqpc/UMRwlzr3/6fwi36RJfF/SGTySsDX/jjBB9HBzSThbzz3AmhOv5/k+A0ri6aVDJErTGC2UvfiawyF3tQdOUqhYPTLqTFCsr2u/ngddrMd2KNe9Rpn24Vu9JvH2BjXQ+hHGqjstQiI6yT//mf7ET5PlLmp3i5D+RMoHP0szZGVLYiqMuExMogAPZNq9cxtDPF5VF2/VeNrUom0/7kbfDOYHU9poYcDuOyMSrgm8SwaBj2r
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 00:26:11.0859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0217205-e324-4f08-cc73-08de683afe01
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4871
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 00:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230828

From: Randolph Sapp <rs@ti.com>

Change this single xuser account template into a generic
standard-user-account that uses distro level variables for
configuration.

This allows for seamless configuration of multiple out-of-box scripts
and tests across layers without having to implicitly hope that the
username or groups haven't been changed by a bbappend or recipe
override.

This was proposed specifically to remove some issues highlighted in:
https://lists.openembedded.org/g/openembedded-core/message/230665

Signed-off-by: Randolph Sapp <rs@ti.com>
---

I'm thinking about adding something like REQUIRED_STANDARD_USER_GROUPS and
REQUIRED_STANDARD_USER_SYSTEM_GROUPS checks to the features_check class so
recipes can indicate when they will fail due to bad distro configs. Please =
let
me know what you all think.

 meta-selftest/files/static-group              |  3 +-
 meta-selftest/files/static-passwd             |  3 +-
 .../distro/include/default-distrovars.inc     | 12 ++++++
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/recipes-graphics/wayland/weston-init.bb  | 13 +++----
 .../x11-common/xserver-nodm-init_3.0.bb       |  7 ++--
 .../user-creation/files/system-xuser.conf     | 11 ------
 .../standard-user-account_0.1.bb              | 38 +++++++++++++++++++
 .../user-creation/xuser-account_0.1.bb        | 30 ---------------
 scripts/sstate-sysroot-cruft.sh               |  6 +--
 10 files changed, 65 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/user-creation/files/system-xuser.c=
onf
 create mode 100644 meta/recipes-support/user-creation/standard-user-accoun=
t_0.1.bb
 delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index 3fca4aa5c9..8bdf362ed7 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -20,12 +20,11 @@ pulse:x:520:
 bind:x:521:
 builder:x:522:
 weston-launch:x:524:
-weston:x:525:
+user:x:525:
 wayland:x:526:
 render:x:527:
 sgx:x:528:
 ptest:x:529:
-xuser:x:530:
 seat:x:531:
 audio:x:532:
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static=
-passwd
index cc6c5acd5c..b309dad101 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -16,6 +16,5 @@ pulse:x:520:520::/:/bin/nologin
 bind:x:521:521::/:/bin/nologin
 builder:x:522:522::/:/bin/nologin
 _apt:x:523:523::/:/bin/nologin
-weston:x:525:525::/:/bin/nologin
 ptest:x:529:529::/:/bin/nologin
-xuser:x:530:530::/:/bin/nologin
+user:x:530:530::/:/bin/nologin
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/di=
stro/include/default-distrovars.inc
index bbd936efa6..63c7a11c7e 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -64,3 +64,15 @@ KERNEL_IMAGETYPES ??=3D "${KERNEL_IMAGETYPE}"
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
index b231daf485..6f595f6d02 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -808,6 +808,7 @@ RECIPE_MAINTAINER:pn-spirv-tools =3D "Jose Quaresma <qu=
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
@@ -934,7 +935,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassigne=
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
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-gr=
aphics/wayland/weston-init.bb
index 29cfba0833..98ce3d0d58 100644
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
@@ -83,15 +83,14 @@ do_install() {
=20
 INHIBIT_UPDATERCD_BBCLASS =3D "${@oe.utils.conditional('VIRTUAL-RUNTIME_in=
it_manager', 'systemd', '1', '', d)}"
=20
-inherit update-rc.d systemd useradd
-
-USERADD_PACKAGES =3D "${PN}"
+inherit update-rc.d systemd
=20
 # rdepends on weston which depends on virtual/egl
 #
 require ${THISDIR}/required-distro-features.inc
=20
-RDEPENDS:${PN} =3D "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xway=
land', 'weston-xwayland', '', d)}"
+DEPENDS +=3D "standard-user-account"
+RDEPENDS:${PN} =3D "weston kbd standard-user-account ${@bb.utils.contains(=
'PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
=20
 INITSCRIPT_NAME =3D "weston"
 INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
@@ -109,5 +108,3 @@ FILES:${PN} +=3D "\
 CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/de=
fault/weston"
=20
 SYSTEMD_SERVICE:${PN} =3D "weston.service weston.socket"
-USERADD_PARAM:${PN} =3D "--home ${WESTON_USER_HOME} --shell /bin/sh --user=
-group -G video,input,render,seat,wayland ${WESTON_USER}"
-GROUPADD_PARAM:${PN} =3D "-r wayland; -r render; -r seat"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/me=
ta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 169269eefb..31bd75aeda 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -38,8 +38,8 @@ do_install() {
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
@@ -62,7 +62,8 @@ do_install() {
     fi
 }
=20
-RDEPENDS:${PN} =3D "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuse=
r-account libcap libcap-bin', '', d)}"
+DEPENDS +=3D "${@oe.utils.conditional('ROOTLESS_X', '1','standard-user-acc=
ount', '', d)}"
+RDEPENDS:${PN} =3D "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'stan=
dard-user-account libcap libcap-bin', '', d)}"
=20
 INITSCRIPT_NAME =3D "xserver-nodm"
 INITSCRIPT_PARAMS =3D "start 9 5 . stop 20 0 1 2 3 6 ."
diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b/m=
eta/recipes-support/user-creation/files/system-xuser.conf
deleted file mode 100644
index d42e3d1f50..0000000000
--- a/meta/recipes-support/user-creation/files/system-xuser.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.=
0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-    <policy user=3D"xuser">
-        <allow send_destination=3D"net.connman"/>
-        <allow send_destination=3D"net.connman.vpn"/>
-        <allow send_destination=3D"org.ofono"/>
-        <allow send_destination=3D"org.bluez"/>
-    </policy>
-</busconfig>
-
diff --git a/meta/recipes-support/user-creation/standard-user-account_0.1.b=
b b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
new file mode 100644
index 0000000000..1aa1e71bc3
--- /dev/null
+++ b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
@@ -0,0 +1,38 @@
+SUMMARY =3D "Creates a standard user account"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+inherit allarch useradd
+
+do_compile[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+do_install[noexec] =3D "1"
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
+USERADD_PARAM:${PN} =3D "${COMMON_ARGS} ${STANDARD_USER_NAME}"
+USERADD_PACKAGES =3D "${PN}"
+
+ALLOW_EMPTY:${PN} =3D "1"
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
2.52.0


