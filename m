Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B949E748FC
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 22:01:47 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109795.1766527300208296681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 14:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kVZ8q4m7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.7, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKrVilypVGt1L7KBgkegp7fxBTJSD0X4Qn5RyLUeBWE35Mg95LCHoQadFqxKZcFo/sx0L3lYvlAla0gOqWVY4XbOCA3+WHiTv2APszV4d5NuTOjDI88ZKVrwhcv41wK7/ncdFikryBX0pk1ySbVWs3lW98e6W/Mk48SCLJioE+tZZ6v8quGFSYRd3ZcKiAtZjgeaHju23mRZv5D7hM7P59Dyep/IHycngZYoRCXn1A6vhcCvCFot04KXgAE4zoUa2fCQyu2QHa7tKJIQ4bZ5TR1xMVM8+1BZeDRzwjZrpNVljFbv2Z8MfmN4gidvscVYhphidziV7mdCaPZ2G8r1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whaGM4xrUi5Sn2O5xjA3VI90KLAiv+bp9bGTX8z4IHA=;
 b=LsEayakm2h2KiZ/Zu0onVmMlD1duMT8uEscuOP70QCkys5PiARDxWvF3wDI+KtILzMoJ8T1ddQUKdoyVXDwj6KMx7DFsZJpp1FnAYbLgoKvlT3zw05ZdXKQuCrLI468lP+UMAlTT/+1x0EMPK5gAuWJlFkrXQ+1KDG7X5RSz6T2yrejlKkc0HmP+FpyPFJjmSX4AlDjl0DGU+YJWq5HOjWyAiZ00UNjT86QAm82osxQO3GSwSPMFvT6SjNAU2Vnnmy7ifzvj7vXpzXvQDEp58Oc40FORBuAkxzFNhZXdmu+3WIw67GzmFtkMe7H/oc4SVQ5d1TYraul1Y0bcCikeQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whaGM4xrUi5Sn2O5xjA3VI90KLAiv+bp9bGTX8z4IHA=;
 b=kVZ8q4m77pD7syB8EzXcLQvi+rxFcRJvz8b7bviO1QlRmXxwFdd4onmxSfxiud0cjOgPj1UDUTKGcTvZdaNpV/gsg4OAL1SGCYt2NCvvUbWloRUzpE1mYtjQcf2mGiezisLi+tIbEqJrwS54UDSaNftCiNhVQyeOyy9F8vQUiVk=
Received: from PH0PR07CA0102.namprd07.prod.outlook.com (2603:10b6:510:4::17)
 by PH7PR10MB5745.namprd10.prod.outlook.com (2603:10b6:510:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 22:01:36 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::ac) by PH0PR07CA0102.outlook.office365.com
 (2603:10b6:510:4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 22:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 22:01:35 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 16:01:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BNM1TJO3656883;
	Tue, 23 Dec 2025 16:01:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv13 4/6] xserver-nodm-init: convert to virtual-emptty-conf
Date: Tue, 23 Dec 2025 16:01:12 -0600
Message-ID: <20251223220114.2259233-5-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251223220114.2259233-1-rs@ti.com>
References: <20251223220114.2259233-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|PH7PR10MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b9b4a1-9f92-44e1-7f59-08de426ed6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rn5+0DTDKCK1o8cdo3ciLXBJURylaYa79nx24veD064gTm/ylt6W9oqGSAly?=
 =?us-ascii?Q?eVIf4jB5S4yWGgbnTuKQVmQbdTXbORs07rQESK5qdzYbd9WnxsU/fYrU5FyT?=
 =?us-ascii?Q?XiYMUIjqyokOcos+Bn6zbaHFFTAV2OJlww/gV1Mcqf/jWMbktyRwqqkTgt5T?=
 =?us-ascii?Q?gRhDmd3F+wUDgcyubca/eKQVRTt3ZtktAmUO3bjQrWQqrMVS4BPh/LelIT8D?=
 =?us-ascii?Q?Y7LoPOny0lCjIAd1wCDwYiEWMGaw4nC/1HHYOlCsgGG+7ct/V+SQV+RFNrxH?=
 =?us-ascii?Q?zyZcwosG16BV0L3ZSONdf3HnZ/jyyjJu2ruqmdc7XIaZ2BPVlIREBQVcq/s0?=
 =?us-ascii?Q?IAagfhRjATYkHa9p2n1XyYV43YygDgXsVdQW/How4/rCCOZh/nGcM7jJ1AoD?=
 =?us-ascii?Q?QKywn19n2guWyD7EbAqT1bcpo0RSlWIaZQfexafDbA9bbzMrdY17UqoTVcJJ?=
 =?us-ascii?Q?f9A/QeleqW4ZXqWnGNmwkxw8gZuYhkIzwIMWqTTvNxxQqmGw4DW8laSciNsm?=
 =?us-ascii?Q?RCwGGIUukzo54lm8wZx0idgPC0Gq/KnIA1HD7Kn2Y6fC7jlAhh9aLv2YP64e?=
 =?us-ascii?Q?7UF+6O+zaiGtdXs/Kva03aljDBZ3OoEGj+QCjRvGB/zOX7UZSxSnfM1tomqD?=
 =?us-ascii?Q?tMlyAK/YjXoHVW3892RyKOrivx43EEs//9Y2cvbsFSaf1/C593zZet7O6bff?=
 =?us-ascii?Q?aHt6ZizZWfq77hQetyKfVxDQel0BMXnJ49lOtmkYlhuDcXf9DW3AgJvuIJTn?=
 =?us-ascii?Q?IIx3jJETFMW8BjESPH+yevdDvSfuEFzq9dniVc1mRSSpWJevuyGt1Xp5aHs3?=
 =?us-ascii?Q?6nAF34sK3K8UvLzmWERnE6x8w0Dxe7TnbuUAIljTmMvybq/Hm4nu1aj+mYbl?=
 =?us-ascii?Q?6vEBxynVSDj116TaRN1vpMLxbavEBM8sEdj67KIpx0+tV61QDbmLYzgJ9/Yu?=
 =?us-ascii?Q?s2/6LMAIWN9w/rKWT3h8w8WrwGjDhJMDmcIf8DF9E3G5FaYwHErH1qPP8g0V?=
 =?us-ascii?Q?tJSQNOExvuvWh1cECUdxzaYXU/VW6dx2NmkFhhvCrQlCpsvVjh4cDAZYbo2g?=
 =?us-ascii?Q?gvbxHTiLHBGTcivm6ctLW7smchodNZID7CiPAif7TElRE08SBa/FtD/ki8sl?=
 =?us-ascii?Q?yIjiHbiBQNTtuzuhf+xv3eKZTb5c0DztlytikibBfAbYgduG4qrt3W9BeUun?=
 =?us-ascii?Q?yVkCDXjq1hlPSCcGe6xaCkMfrR9SnuuW4F9wPAQFCVA368Cz/y66Jiqlc6NG?=
 =?us-ascii?Q?H0mnl0TiE9Nqk79vSNefvEcvPtMDjgDMXbkqacqmhwN/K9Dpa6D/rbE/SIHs?=
 =?us-ascii?Q?GfNXdnX2YeJwQBfNVl/cmzGzac4gAoGWyKk0GI9+MSJNCx6YABPefla1DQ+j?=
 =?us-ascii?Q?jYyYnnUcJ7u2VagmxxnLDUNdzvLJqt88od9lTbrOck1ThpfTddV2EbQSUsod?=
 =?us-ascii?Q?DTKBNvw7qv6nmuY2nLphhLrOuMtR651imiKs4Nw4q7oJ3+KWkn4u4Y4UaIHQ?=
 =?us-ascii?Q?WZ5Jdq863kZi2qc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 22:01:35.1559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b9b4a1-9f92-44e1-7f59-08de426ed6e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 22:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228509

From: Randolph Sapp <rs@ti.com>

Convert this script package into a simple config for emptty. This is
capable of using either the root user or the underprivileged xuser
account based on the same ROOTLESS_X variable. The xuser will leverage
the nopasswdlogin session provided by emptty for automatic logins.
Runtime provide virtual-emptty-conf as we need to set parameters for the
default session.

This also gets rid of the xuser security/capability override since
emptty sets up required components as root before descending into the
specified user. This does not currently handle loading of autostart
applications in "/etc/xdg/autostart".

This explicitly removes rooted x11 support for security related issues,
as this recipe has always automatically setup passwordless login for the
specified account. This was particularly useful for the underprivileged
xuser account, but is quickly a problem for the root user.

See the following discussion for additional information:
https://lists.openembedded.org/g/openembedded-core/topic/115318655#msg22390=
6

License-Update: GPLv2 scripts were replaced with MIT based config files
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/conf/distro/include/maintainers.inc      |   4 +-
 meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
 .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
 .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
 .../X11/Xsession.d/89xdgautostart.sh          |   7 -
 .../X11/Xsession.d/90XWindowManager.sh        |   7 -
 .../x11-common/xserver-nodm-init/Xserver      |  25 --
 .../xserver-nodm-init/capability.conf         |   2 -
 .../xserver-nodm-init/default.desktop         |   5 +
 .../xserver-nodm-init/emptty.conf.in}         |   8 +-
 .../xserver-nodm-init/gplv2-license.patch     | 355 ------------------
 .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
 .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
 .../xserver-nodm-init/xserver-nodm.service.in |  13 -
 .../x11-common/xserver-nodm-init_3.0.bb       |  64 +---
 .../user-creation/xuser-account_0.1.bb        |   3 +-
 16 files changed, 35 insertions(+), 605 deletions(-)
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/=
Xsession
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/=
Xsession.d/13xdgbasedirs.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/=
Xsession.d/89xdgautostart.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/=
Xsession.d/90XWindowManager.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xser=
ver
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/capa=
bility.conf
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/defa=
ult.desktop
 copy meta/recipes-graphics/{wayland/weston-init/emptty.conf =3D> x11-commo=
n/xserver-nodm-init/emptty.conf.in} (95%)
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/gplv=
2-license.patch
 delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init/xser=
ver-nodm
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xser=
ver-nodm.conf.in
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xser=
ver-nodm.service.in

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index cc28ca5af2..560f089592 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -928,12 +928,12 @@ RECIPE_MAINTAINER:pn-xorgproto =3D "Unassigned <unass=
igned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xprop =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xrandr =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xrestop =3D "Unassigned <unassigned@yoctoproject.org>=
"
-RECIPE_MAINTAINER:pn-xserver-nodm-init =3D "Unassigned <unassigned@yoctopr=
oject.org>"
+RECIPE_MAINTAINER:pn-xserver-nodm-init =3D "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassigned <unassigned@yocto=
project.org>"
 RECIPE_MAINTAINER:pn-xserver-xorg =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-xset =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xtrans =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xuser-account =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
+RECIPE_MAINTAINER:pn-xuser-account =3D "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-xvinfo =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwayland =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-xwininfo =3D "Unassigned <unassigned@yoctoproject.org=
>"
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/ca=
ses/xorg.py
index 09afb1e3d1..8593be5b77 100644
--- a/meta/lib/oeqa/runtime/cases/xorg.py
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -20,4 +20,12 @@ class XorgTest(OERuntimeTestCase):
         status, output =3D self.target.run(cmd)
         msg =3D ('Xorg does not appear to be running %s' %
               self.target.run(self.tc.target_cmds['ps'])[1])
+
+        # dump last 20 lines of emptty log in case of failure
+        log_cmd =3D 'tail -n 20 /var/log/emptty/7.log'
+        msg +=3D '\n\n=3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D\n\n'
+        msg +=3D 'file: /var/log/emptty/7.log\n\n'
+        msg +=3D '\n\n%s\n\n' % self.target.run(log_cmd)[1]
+        msg +=3D '\n\n=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D\n\n'
+
         self.assertEqual(status, 0, msg=3Dmsg)
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsessio=
n b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession
deleted file mode 100644
index 0b73127ae1..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession
+++ /dev/null
@@ -1,38 +0,0 @@
-#!/bin/sh
-
-if [ -x /usr/bin/dbus-launch ]; then
-    # As this is the X session script, always start a new DBus session.
-    eval `dbus-launch --sh-syntax --exit-with-session </dev/null`
-    echo "D-BUS per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
-fi
-
-. /etc/profile
-
-if [ -f $HOME/.profile ]; then
-    . $HOME/.profile
-fi
-
-SYSSESSIONDIR=3D/etc/X11/Xsession.d
-
-export CLUTTER_DISABLE_MIPMAPPED_TEXT=3D1
-
-for SESSIONFILE in $SYSSESSIONDIR/*; do
-    set +e
-    case "$SESSIONFILE" in
-        *.sh)
-            . "$SESSIONFILE"
-            ;;
-        *.shbg)
-            "$SESSIONFILE" &
-            ;;
-        *~)
-            # Ignore backup files
-            ;;
-        *)
-            "$SESSIONFILE"
-            ;;
-    esac
-    set -e
-done
-
-exit 0
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsessio=
n.d/13xdgbasedirs.sh b/meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession.d/13xdgbasedirs.sh
deleted file mode 100644
index 912f79761c..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/13x=
dgbasedirs.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-# Minimal/stub implementation of the XDG Base Directory specification.
-# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
-
-# If the runtime directory hasn't been set already (for example by systemd=
,
-# elogind, or pam) create a directory in TMPDIR.
-if [ -z "$XDG_RUNTIME_DIR" ]; then
-    XDG_RUNTIME_DIR=3D/run/user/$(id -u)
-    export XDG_RUNTIME_DIR
-fi
-
-if [ -d "$XDG_RUNTIME_DIR" ]; then
-    # If the directory exists, check the permissions and ownership
-    if [ "$(stat -c %u-%a "$XDG_RUNTIME_DIR")" !=3D "$(id -u)-700" ]; then
-        echo "ERROR: $XDG_RUNTIME_DIR has incorrect permissions"
-        exit 1
-    fi
-else
-    mkdir --mode 0700 --parents "${XDG_RUNTIME_DIR}"
-fi
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsessio=
n.d/89xdgautostart.sh b/meta/recipes-graphics/x11-common/xserver-nodm-init/=
X11/Xsession.d/89xdgautostart.sh
deleted file mode 100644
index 3d7008ca45..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/89x=
dgautostart.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-XDGAUTOSTART=3D/etc/xdg/autostart
-if [ -d $XDGAUTOSTART ]; then
-    for SCRIPT in $XDGAUTOSTART/*; do
-        CMD=3D`grep ^Exec=3D $SCRIPT | cut -d '=3D' -f 2`
-        $CMD &
-    done
-fi
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsessio=
n.d/90XWindowManager.sh b/meta/recipes-graphics/x11-common/xserver-nodm-ini=
t/X11/Xsession.d/90XWindowManager.sh
deleted file mode 100644
index b936dedf3b..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/90X=
WindowManager.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-if [ -x $HOME/.Xsession ]; then
-    exec $HOME/.Xsession
-elif [ -x /usr/bin/x-session-manager ]; then
-    exec /usr/bin/x-session-manager
-else
-    exec /usr/bin/x-window-manager
-fi
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver b/m=
eta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
deleted file mode 100644
index 0edbfbfc20..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-
-# This script is only needed to make sure /etc/X11/xserver-common
-# can affect XSERVER, ARGS & DPI: otherwise systemd could just use
-# /etc/default/xserver-nodm as EnvironmentFile and sysvinit could just
-# source the same file
-
-. /etc/profile
-
-# load default values for XSERVER, ARGS, DISPLAY...
-. /etc/default/xserver-nodm
-
-# Allow xserver-common to override ARGS, XSERVER, DPI
-if [ -e /etc/X11/xserver-common ] ; then
-    . /etc/X11/xserver-common
-    if [ ! -e $XSERVER ] ; then
-        XSERVER=3D$(which $XSERVER)
-    fi
-fi
-
-if [ -n "$DPI" ] ; then
-    ARGS=3D"$ARGS -dpi $DPI"
-fi
-
-exec xinit /etc/X11/Xsession -- $XSERVER $DISPLAY $ARGS $*
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.=
conf b/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
deleted file mode 100644
index 7ab7460816..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-cap_sys_admin	@USER@
-none	*
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/default.des=
ktop b/meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop
new file mode 100644
index 0000000000..3357cd9a7f
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop
@@ -0,0 +1,5 @@
+[Desktop Entry]
+Encoding=3DUTF-8
+Type=3DApplication
+Name=3DDefault X11 Desktop
+Exec=3Dx-session-manager
diff --git a/meta/recipes-graphics/wayland/weston-init/emptty.conf b/meta/r=
ecipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
similarity index 95%
copy from meta/recipes-graphics/wayland/weston-init/emptty.conf
copy to meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
index 1918cc02a7..bdb3bec782 100644
--- a/meta/recipes-graphics/wayland/weston-init/emptty.conf
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
@@ -11,13 +11,13 @@ PRINT_ISSUE=3Dtrue
 PRINT_MOTD=3Dtrue
=20
 # Preselected user, if AUTOLOGIN is enabled, this user is logged in.
-DEFAULT_USER=3Dweston
+DEFAULT_USER=3Dxuser
=20
 # Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin =
group. Possible values are "true" or "false".
 AUTOLOGIN=3Dtrue
=20
 # The default session used, if Autologin is enabled. If session is not fou=
nd in list of session, it proceeds to manual selection.
-AUTOLOGIN_SESSION=3DWeston
+AUTOLOGIN_SESSION=3DDefault X11 Desktop
=20
 # If Autologin is enabled and session does not start correctly, the number=
 of retries in short period is kept to eventually stop the infinite loop of=
 restarts. -1 is for infinite retries, 0 is for no retry.
 # AUTOLOGIN_MAX_RETRY=3D2
@@ -41,7 +41,7 @@ VERTICAL_SELECTION=3Dfalse
 #LOGGING_FILE=3D/var/log/emptty/[TTY_NUMBER].log
=20
 # Arguments passed to Xorg server.
-#XORG_ARGS=3D
+XORG_ARGS=3D@NO_CURSOR_ARG@ @BLANK_ARGS@
=20
 # Allows to use dynamic motd script to generate custom MOTD.
 #DYNAMIC_MOTD=3Dfalse
@@ -71,7 +71,7 @@ SESSION_ERROR_LOGGING=3Drotate
 #DEFAULT_XAUTHORITY=3Dfalse
=20
 #If set true, Xorg will be started as rootless, if system allows and emptt=
y is running in daemon mode.
-#ROOTLESS_XORG=3Dfalse
+ROOTLESS_XORG=3Dtrue
=20
 #If set true, environmental groups are printed to differ Xorg/Wayland/Cust=
om/UserCustom desktops.
 IDENTIFY_ENVS=3Dfalse
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-licen=
se.patch b/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license=
.patch
deleted file mode 100644
index eff975e341..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patc=
h
+++ /dev/null
@@ -1,355 +0,0 @@
-COPYING: add GPLv2 license file
-
-this is a local file recipe and the license file is missing.In order
-to pass the license checksum checking, the license file is needed. So
-this patch add the GPLv2 license file.
-
-Upstream-Status: Inappropriate [licensing]
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-diff --git a/COPYING b/COPYING
-new file mode 100644
-index 0000000..d511905
---- /dev/null
-+++ b/COPYING
-@@ -0,0 +1,339 @@
-+		    GNU GENERAL PUBLIC LICENSE
-+		       Version 2, June 1991
-+
-+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
-+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-+ Everyone is permitted to copy and distribute verbatim copies
-+ of this license document, but changing it is not allowed.
-+
-+			    Preamble
-+
-+  The licenses for most software are designed to take away your
-+freedom to share and change it.  By contrast, the GNU General Public
-+License is intended to guarantee your freedom to share and change free
-+software--to make sure the software is free for all its users.  This
-+General Public License applies to most of the Free Software
-+Foundation's software and to any other program whose authors commit to
-+using it.  (Some other Free Software Foundation software is covered by
-+the GNU Lesser General Public License instead.)  You can apply it to
-+your programs, too.
-+
-+  When we speak of free software, we are referring to freedom, not
-+price.  Our General Public Licenses are designed to make sure that you
-+have the freedom to distribute copies of free software (and charge for
-+this service if you wish), that you receive source code or can get it
-+if you want it, that you can change the software or use pieces of it
-+in new free programs; and that you know you can do these things.
-+
-+  To protect your rights, we need to make restrictions that forbid
-+anyone to deny you these rights or to ask you to surrender the rights.
-+These restrictions translate to certain responsibilities for you if you
-+distribute copies of the software, or if you modify it.
-+
-+  For example, if you distribute copies of such a program, whether
-+gratis or for a fee, you must give the recipients all the rights that
-+you have.  You must make sure that they, too, receive or can get the
-+source code.  And you must show them these terms so they know their
-+rights.
-+
-+  We protect your rights with two steps: (1) copyright the software, and
-+(2) offer you this license which gives you legal permission to copy,
-+distribute and/or modify the software.
-+
-+  Also, for each author's protection and ours, we want to make certain
-+that everyone understands that there is no warranty for this free
-+software.  If the software is modified by someone else and passed on, we
-+want its recipients to know that what they have is not the original, so
-+that any problems introduced by others will not reflect on the original
-+authors' reputations.
-+
-+  Finally, any free program is threatened constantly by software
-+patents.  We wish to avoid the danger that redistributors of a free
-+program will individually obtain patent licenses, in effect making the
-+program proprietary.  To prevent this, we have made it clear that any
-+patent must be licensed for everyone's free use or not licensed at all.
-+
-+  The precise terms and conditions for copying, distribution and
-+modification follow.
-+
-+		    GNU GENERAL PUBLIC LICENSE
-+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-+
-+  0. This License applies to any program or other work which contains
-+a notice placed by the copyright holder saying it may be distributed
-+under the terms of this General Public License.  The "Program", below,
-+refers to any such program or work, and a "work based on the Program"
-+means either the Program or any derivative work under copyright law:
-+that is to say, a work containing the Program or a portion of it,
-+either verbatim or with modifications and/or translated into another
-+language.  (Hereinafter, translation is included without limitation in
-+the term "modification".)  Each licensee is addressed as "you".
-+
-+Activities other than copying, distribution and modification are not
-+covered by this License; they are outside its scope.  The act of
-+running the Program is not restricted, and the output from the Program
-+is covered only if its contents constitute a work based on the
-+Program (independent of having been made by running the Program).
-+Whether that is true depends on what the Program does.
-+
-+  1. You may copy and distribute verbatim copies of the Program's
-+source code as you receive it, in any medium, provided that you
-+conspicuously and appropriately publish on each copy an appropriate
-+copyright notice and disclaimer of warranty; keep intact all the
-+notices that refer to this License and to the absence of any warranty;
-+and give any other recipients of the Program a copy of this License
-+along with the Program.
-+
-+You may charge a fee for the physical act of transferring a copy, and
-+you may at your option offer warranty protection in exchange for a fee.
-+
-+  2. You may modify your copy or copies of the Program or any portion
-+of it, thus forming a work based on the Program, and copy and
-+distribute such modifications or work under the terms of Section 1
-+above, provided that you also meet all of these conditions:
-+
-+    a) You must cause the modified files to carry prominent notices
-+    stating that you changed the files and the date of any change.
-+
-+    b) You must cause any work that you distribute or publish, that in
-+    whole or in part contains or is derived from the Program or any
-+    part thereof, to be licensed as a whole at no charge to all third
-+    parties under the terms of this License.
-+
-+    c) If the modified program normally reads commands interactively
-+    when run, you must cause it, when started running for such
-+    interactive use in the most ordinary way, to print or display an
-+    announcement including an appropriate copyright notice and a
-+    notice that there is no warranty (or else, saying that you provide
-+    a warranty) and that users may redistribute the program under
-+    these conditions, and telling the user how to view a copy of this
-+    License.  (Exception: if the Program itself is interactive but
-+    does not normally print such an announcement, your work based on
-+    the Program is not required to print an announcement.)
-+
-+These requirements apply to the modified work as a whole.  If
-+identifiable sections of that work are not derived from the Program,
-+and can be reasonably considered independent and separate works in
-+themselves, then this License, and its terms, do not apply to those
-+sections when you distribute them as separate works.  But when you
-+distribute the same sections as part of a whole which is a work based
-+on the Program, the distribution of the whole must be on the terms of
-+this License, whose permissions for other licensees extend to the
-+entire whole, and thus to each and every part regardless of who wrote it.
-+
-+Thus, it is not the intent of this section to claim rights or contest
-+your rights to work written entirely by you; rather, the intent is to
-+exercise the right to control the distribution of derivative or
-+collective works based on the Program.
-+
-+In addition, mere aggregation of another work not based on the Program
-+with the Program (or with a work based on the Program) on a volume of
-+a storage or distribution medium does not bring the other work under
-+the scope of this License.
-+
-+  3. You may copy and distribute the Program (or a work based on it,
-+under Section 2) in object code or executable form under the terms of
-+Sections 1 and 2 above provided that you also do one of the following:
-+
-+    a) Accompany it with the complete corresponding machine-readable
-+    source code, which must be distributed under the terms of Sections
-+    1 and 2 above on a medium customarily used for software interchange; =
or,
-+
-+    b) Accompany it with a written offer, valid for at least three
-+    years, to give any third party, for a charge no more than your
-+    cost of physically performing source distribution, a complete
-+    machine-readable copy of the corresponding source code, to be
-+    distributed under the terms of Sections 1 and 2 above on a medium
-+    customarily used for software interchange; or,
-+
-+    c) Accompany it with the information you received as to the offer
-+    to distribute corresponding source code.  (This alternative is
-+    allowed only for noncommercial distribution and only if you
-+    received the program in object code or executable form with such
-+    an offer, in accord with Subsection b above.)
-+
-+The source code for a work means the preferred form of the work for
-+making modifications to it.  For an executable work, complete source
-+code means all the source code for all modules it contains, plus any
-+associated interface definition files, plus the scripts used to
-+control compilation and installation of the executable.  However, as a
-+special exception, the source code distributed need not include
-+anything that is normally distributed (in either source or binary
-+form) with the major components (compiler, kernel, and so on) of the
-+operating system on which the executable runs, unless that component
-+itself accompanies the executable.
-+
-+If distribution of executable or object code is made by offering
-+access to copy from a designated place, then offering equivalent
-+access to copy the source code from the same place counts as
-+distribution of the source code, even though third parties are not
-+compelled to copy the source along with the object code.
-+
-+  4. You may not copy, modify, sublicense, or distribute the Program
-+except as expressly provided under this License.  Any attempt
-+otherwise to copy, modify, sublicense or distribute the Program is
-+void, and will automatically terminate your rights under this License.
-+However, parties who have received copies, or rights, from you under
-+this License will not have their licenses terminated so long as such
-+parties remain in full compliance.
-+
-+  5. You are not required to accept this License, since you have not
-+signed it.  However, nothing else grants you permission to modify or
-+distribute the Program or its derivative works.  These actions are
-+prohibited by law if you do not accept this License.  Therefore, by
-+modifying or distributing the Program (or any work based on the
-+Program), you indicate your acceptance of this License to do so, and
-+all its terms and conditions for copying, distributing or modifying
-+the Program or works based on it.
-+
-+  6. Each time you redistribute the Program (or any work based on the
-+Program), the recipient automatically receives a license from the
-+original licensor to copy, distribute or modify the Program subject to
-+these terms and conditions.  You may not impose any further
-+restrictions on the recipients' exercise of the rights granted herein.
-+You are not responsible for enforcing compliance by third parties to
-+this License.
-+
-+  7. If, as a consequence of a court judgment or allegation of patent
-+infringement or for any other reason (not limited to patent issues),
-+conditions are imposed on you (whether by court order, agreement or
-+otherwise) that contradict the conditions of this License, they do not
-+excuse you from the conditions of this License.  If you cannot
-+distribute so as to satisfy simultaneously your obligations under this
-+License and any other pertinent obligations, then as a consequence you
-+may not distribute the Program at all.  For example, if a patent
-+license would not permit royalty-free redistribution of the Program by
-+all those who receive copies directly or indirectly through you, then
-+the only way you could satisfy both it and this License would be to
-+refrain entirely from distribution of the Program.
-+
-+If any portion of this section is held invalid or unenforceable under
-+any particular circumstance, the balance of the section is intended to
-+apply and the section as a whole is intended to apply in other
-+circumstances.
-+
-+It is not the purpose of this section to induce you to infringe any
-+patents or other property right claims or to contest validity of any
-+such claims; this section has the sole purpose of protecting the
-+integrity of the free software distribution system, which is
-+implemented by public license practices.  Many people have made
-+generous contributions to the wide range of software distributed
-+through that system in reliance on consistent application of that
-+system; it is up to the author/donor to decide if he or she is willing
-+to distribute software through any other system and a licensee cannot
-+impose that choice.
-+
-+This section is intended to make thoroughly clear what is believed to
-+be a consequence of the rest of this License.
-+
-+  8. If the distribution and/or use of the Program is restricted in
-+certain countries either by patents or by copyrighted interfaces, the
-+original copyright holder who places the Program under this License
-+may add an explicit geographical distribution limitation excluding
-+those countries, so that distribution is permitted only in or among
-+countries not thus excluded.  In such case, this License incorporates
-+the limitation as if written in the body of this License.
-+
-+  9. The Free Software Foundation may publish revised and/or new versions
-+of the General Public License from time to time.  Such new versions will
-+be similar in spirit to the present version, but may differ in detail to
-+address new problems or concerns.
-+
-+Each version is given a distinguishing version number.  If the Program
-+specifies a version number of this License which applies to it and "any
-+later version", you have the option of following the terms and conditions
-+either of that version or of any later version published by the Free
-+Software Foundation.  If the Program does not specify a version number of
-+this License, you may choose any version ever published by the Free Softw=
are
-+Foundation.
-+
-+  10. If you wish to incorporate parts of the Program into other free
-+programs whose distribution conditions are different, write to the author
-+to ask for permission.  For software which is copyrighted by the Free
-+Software Foundation, write to the Free Software Foundation; we sometimes
-+make exceptions for this.  Our decision will be guided by the two goals
-+of preserving the free status of all derivatives of our free software and
-+of promoting the sharing and reuse of software generally.
-+
-+			    NO WARRANTY
-+
-+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANT=
Y
-+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
-+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSE=
D
-+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
-+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
-+REPAIR OR CORRECTION.
-+
-+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITI=
NG
-+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES=
,
-+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISI=
NG
-+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
-+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
-+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHE=
R
-+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-+POSSIBILITY OF SUCH DAMAGES.
-+
-+		     END OF TERMS AND CONDITIONS
-+
-+	    How to Apply These Terms to Your New Programs
-+
-+  If you develop a new program, and you want it to be of the greatest
-+possible use to the public, the best way to achieve this is to make it
-+free software which everyone can redistribute and change under these term=
s.
-+
-+  To do so, attach the following notices to the program.  It is safest
-+to attach them to the start of each source file to most effectively
-+convey the exclusion of warranty; and each file should have at least
-+the "copyright" line and a pointer to where the full notice is found.
-+
-+    <one line to give the program's name and a brief idea of what it does=
.>
-+    Copyright (C) <year>  <name of author>
-+
-+    This program is free software; you can redistribute it and/or modify
-+    it under the terms of the GNU General Public License as published by
-+    the Free Software Foundation; either version 2 of the License, or
-+    (at your option) any later version.
-+
-+    This program is distributed in the hope that it will be useful,
-+    but WITHOUT ANY WARRANTY; without even the implied warranty of
-+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+    GNU General Public License for more details.
-+
-+    You should have received a copy of the GNU General Public License alo=
ng
-+    with this program; if not, write to the Free Software Foundation, Inc=
.,
-+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+
-+Also add information on how to contact you by electronic and paper mail.
-+
-+If the program is interactive, make it output a short notice like this
-+when it starts in an interactive mode:
-+
-+    Gnomovision version 69, Copyright (C) year name of author
-+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show=
 w'.
-+    This is free software, and you are welcome to redistribute it
-+    under certain conditions; type `show c' for details.
-+
-+The hypothetical commands `show w' and `show c' should show the appropria=
te
-+parts of the General Public License.  Of course, the commands you use may
-+be called something other than `show w' and `show c'; they could even be
-+mouse-clicks or menu items--whatever suits your program.
-+
-+You should also get your employer (if you work as a programmer) or your
-+school, if any, to sign a "copyright disclaimer" for the program, if
-+necessary.  Here is a sample; alter the names:
-+
-+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
-+  `Gnomovision' (which makes passes at compilers) written by James Hacker=
.
-+
-+  <signature of Ty Coon>, 1 April 1989
-+  Ty Coon, President of Vice
-+
-+This General Public License does not permit incorporating your program in=
to
-+proprietary programs.  If your program is a subroutine library, you may
-+consider it more useful to permit linking proprietary applications with t=
he
-+library.  If this is what you want to do, use the GNU Lesser General
-+Public License instead of this License.
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nod=
m b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
deleted file mode 100755
index 116bb278bc..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ /dev/null
@@ -1,75 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: xserver
-# Required-Start: $local_fs $remote_fs dbus
-# Required-Stop: $local_fs $remote_fs
-# Default-Start:     5
-# Default-Stop:      0 1 2 3 6
-### END INIT INFO
-
-killproc() {            # kill the named process(es)
-        pid=3D`/bin/pidof $1`
-        [ "$pid" !=3D "" ] && kill $pid
-}
-
-read CMDLINE < /proc/cmdline
-for x in $CMDLINE; do
-        case $x in
-        x11=3Dfalse)
-		echo "X Server disabled"=20
-		exit 0;
-                ;;
-        esac
-done
-
-case "$1" in
-  start)
-       . /etc/profile
-
-       #default for USER
-       . /etc/default/xserver-nodm
-       echo "Starting Xserver"
-       if [ "$USER" !=3D "root" ]; then
-           # setting for rootless X
-           chmod o+w /var/log
-           chmod g+r /dev/tty[0-3]
-           # hidraw device is probably needed
-           if [ -e /dev/hidraw0 ]; then
-               chmod o+rw /dev/hidraw*
-           fi
-           # Make sure that the Xorg has the cap_sys_admin capability whic=
h is
-           # needed for setting the drm master
-           if ! grep -q "^auth.*pam_cap\.so" /etc/pam.d/su; then
-               echo "auth	optional	pam_cap.so" >>/etc/pam.d/su
-           fi
-           if ! /usr/sbin/getcap $XSERVER |  grep -q cap_sys_admin; then
-               /usr/sbin/setcap cap_sys_admin+eip $XSERVER
-           fi
-       fi
-
-       # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1=
211]
-       su -l -c '/etc/xserver-nodm/Xserver &' $USER
-       # Wait for the desktop to say its finished loading
-       # before loading the rest of the system
-       # dbus-wait org.matchbox_project.desktop Loaded
-  ;;
-
-  stop)
-        echo "Stopping XServer"
-        killproc xinit
-        sleep 1
-        chvt 1 &
-  ;;
-
-  restart)
-	$0 stop
-        $0 start
-  ;;
-
-  *)
-        echo "usage: $0 { start | stop | restart }"
-  ;;
-esac
-
-exit 0
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nod=
m.conf.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm=
.conf.in
deleted file mode 100644
index 4a9670d8d2..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.=
in
+++ /dev/null
@@ -1,7 +0,0 @@
-# common environment file for sysvinit and systemd
-
-XSERVER=3D/usr/bin/Xorg
-DISPLAY=3D:0
-ARGS=3D" -br -pn @BLANK_ARGS@ @NO_CURSOR_ARG@ "
-HOME=3D@HOME@
-USER=3D@USER@
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nod=
m.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-n=
odm.service.in
deleted file mode 100644
index 43aaa84c0f..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.servi=
ce.in
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=3DXserver startup without a display manager
-After=3Dsystemd-udev-settle.service
-Wants=3Dsystemd-udev-settle.service
-
-[Service]
-EnvironmentFile=3D/etc/default/xserver-nodm
-User=3D@USER@
-ExecStart=3D/etc/xserver-nodm/Xserver
-Restart=3Dalways
-
-[Install]
-Alias=3Ddisplay-manager.service
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/me=
ta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 169269eefb..ed056df72f 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -1,25 +1,16 @@
 SUMMARY =3D "Simple Xserver Init Script (no dm)"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bb=
e"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
 SECTION =3D "x11"
=20
-SRC_URI =3D "file://xserver-nodm \
-           file://Xserver \
-           file://X11 \
-           file://gplv2-license.patch \
-           file://xserver-nodm.service.in \
-           file://xserver-nodm.conf.in \
-           file://capability.conf \
-"
+SRC_URI =3D "file://emptty.conf.in \
+           file://default.desktop"
=20
 S =3D "${UNPACKDIR}"
=20
-# Since we refer to ROOTLESS_X which is normally enabled per-machine
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+inherit features_check
=20
-inherit update-rc.d systemd features_check
-
-REQUIRED_DISTRO_FEATURES =3D "x11 ${@oe.utils.conditional('ROOTLESS_X', '1=
', 'pam', '', d)}"
+REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 PACKAGECONFIG ??=3D "blank"
 # dpms and screen saver will be on only if 'blank' is in PACKAGECONFIG
@@ -27,45 +18,18 @@ PACKAGECONFIG[blank] =3D ""
 PACKAGECONFIG[nocursor] =3D ""
=20
 do_install() {
-    install -d ${D}${sysconfdir}/default
-    install xserver-nodm.conf.in ${D}${sysconfdir}/default/xserver-nodm
-    install -d ${D}${sysconfdir}/xserver-nodm
-    install Xserver ${D}${sysconfdir}/xserver-nodm/Xserver
-    install -d ${D}${sysconfdir}/X11/Xsession.d
-    install X11/Xsession.d/* ${D}${sysconfdir}/X11/Xsession.d/
-    install X11/Xsession ${D}${sysconfdir}/X11/
+    install -D -p -m0644 ${S}/emptty.conf.in ${D}${sysconfdir}/emptty/conf
+    install -D -p -m0644 ${S}/default.desktop ${D}${datadir}/xsessions/def=
ault.desktop
=20
     BLANK_ARGS=3D"${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0=
 -dpms', d)}"
     NO_CURSOR_ARG=3D"${@bb.utils.contains('PACKAGECONFIG', 'nocursor', '-n=
ocursor', '', d)}"
-    if [ "${ROOTLESS_X}" =3D "1" ] ; then
-        XUSER_HOME=3D"/home/xuser"
-        XUSER=3D"xuser"
-        install -D capability.conf ${D}${sysconfdir}/security/capability.c=
onf
-        sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/security/capability.=
conf
-    else
-        XUSER_HOME=3D${ROOT_HOME}
-        XUSER=3D"root"
-    fi
-    sed -i "s:@HOME@:${XUSER_HOME}:; s:@USER@:${XUSER}:; s:@BLANK_ARGS@:${=
BLANK_ARGS}:" \
-        ${D}${sysconfdir}/default/xserver-nodm
-    sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/default=
/xserver-nodm
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${S}/xserver-nodm.service.in ${D}${systemd_system_=
unitdir}/xserver-nodm.service
-        sed -i "s:@USER@:${XUSER}:" ${D}${systemd_system_unitdir}/xserver-=
nodm.service
-    fi
=20
-    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)=
}; then
-        install -d ${D}${sysconfdir}/init.d
-        install xserver-nodm ${D}${sysconfdir}/init.d
-    fi
+    sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/emptty/=
conf
+    sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/conf
 }
=20
-RDEPENDS:${PN} =3D "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuse=
r-account libcap libcap-bin', '', d)}"
-
-INITSCRIPT_NAME =3D "xserver-nodm"
-INITSCRIPT_PARAMS =3D "start 9 5 . stop 20 0 1 2 3 6 ."
-SYSTEMD_SERVICE:${PN} =3D "xserver-nodm.service"
+FILES:${PN} =3D "${sysconfdir}/emptty/conf \
+               ${datadir}/xsessions/default.desktop"
=20
-RCONFLICTS:${PN} =3D "xserver-common (< 1.34-r9) x11-common"
+RDEPENDS:${PN} =3D "emptty xuser-account"
+RPROVIDES:${PN} +=3D "virtual-emptty-conf"
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta=
/recipes-support/user-creation/xuser-account_0.1.bb
index 04f506e7a3..f1e4cb674f 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -24,7 +24,8 @@ FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-xus=
er.conf"
=20
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--create-home \
-                       --groups video,tty,audio,input,shutdown,disk \
+                       --groups video,tty,audio,input,shutdown,disk,nopass=
wdlogin \
                        --user-group xuser"
+GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
=20
 ALLOW_EMPTY:${PN} =3D "1"
--=20
2.51.1


