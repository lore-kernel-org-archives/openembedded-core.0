Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00665E748FB
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 22:01:47 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.110134.1766527297335991098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 14:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=w2XGww2Y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.32, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNlZEc6cF05/Vyq4Uo9z2qxLD6PQAO4N31Lr2kPtUsVLE52zqkUmERpWQ+JQOZsof9UhjnGqDkx0SipRaiQgYDXeRwmx3yVvZqzf+yV00kqMQdmPcMUDLNh47DCoWGlsMsYIxoRhERhyWUxvaXDfwLtff3dvnAqgyDUw+X1qtg0oorXRHMkkD5g6z0T+nrxBwOZVmvGmIz+BRxDbQ++7WdKt1YcbkPq/E7s5O7yY1t7mDp0p/1exJdsaGhfMJ4babqmoVTn1TusJHy05eE6PY1KOcoTzNHyYmDRMphPIBX8ttZep8glN/nLg7lUVcbceLsHkePNbwpANx4b5sF1Y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n++2lbC5yjym5zh32bZeSioHAxIuwz48t+qE8C3tbw=;
 b=YwmCJ+2QRbUcbvWjPk6GnBwED0wz/N/5ru55rP0fUtOp54SUmpWy7VfeHCjqxvz1vLTITMvcTWLDu3fjYbH/MY3VlgLgJbZRr7uyym7DLInKNFEqqs3DapSMlim9yYt6r1e42hCsrJO7+33hMSCPnzSMvQOsjvkYK8lmebahmx8M/M+I/XmCEa4QiB2Y+a1Ys1kF8b2D6TcUmS08KXKIh1skMn1vVZ3ab0vX+dq1c9eVk64Qg7ZS3QCINUbva7IdoSNV/5ycYS2JoqWwsitoR7K1/RMDnDnViSWvqW7fiqVx8GKR4u2HQdGUCF9HeVqYhqw9PzHoyU62pBr+GWhi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n++2lbC5yjym5zh32bZeSioHAxIuwz48t+qE8C3tbw=;
 b=w2XGww2YnJGc+iuOLJDxPlXeshIbpJ/HwOqxaEgUvr/uzaYKYUxhSek2Vj+YTfMu+AK1iPfGATDEMZHplrBbtJzoLL4cdfXlTOWrJzCTvowi4R1VnrjXW/Mc3L/tMUGWk+OypWkzjWx+ttgX/e8wumK+xXRp62O0QtKdfyJCvF0=
Received: from PH0PR07CA0119.namprd07.prod.outlook.com (2603:10b6:510:4::34)
 by BY5PR10MB4275.namprd10.prod.outlook.com (2603:10b6:a03:210::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 22:01:34 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::90) by PH0PR07CA0119.outlook.office365.com
 (2603:10b6:510:4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 22:01:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 22:01:32 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 16:01:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BNM1TJK3656883;
	Tue, 23 Dec 2025 16:01:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv13 0/6] Display manager proposal for x11 and wayland
Date: Tue, 23 Dec 2025 16:01:08 -0600
Message-ID: <20251223220114.2259233-1-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|BY5PR10MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 47386fbf-00d2-467c-5eeb-08de426ed563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S03Mbt5ODfdPSfcTPonVxHkn2ibJadPutE82tu/1RNXjzLDv+askP/ykJzrF?=
 =?us-ascii?Q?s3qvNDQCxh0H2c0UYLfxVEBb74arSOy+XEEEV8as7lMUNFTf8yyxvB69iym7?=
 =?us-ascii?Q?4IAa76w8WoA0cpwJOO/D8fjhuYENtYFZUz+U4eqXRp/nL7TW9JZep+zMdnrP?=
 =?us-ascii?Q?gxJW4DL1vby6o++lfoKvNiNGfU7eV88NgEqL5U97jciwkaBpP36/SsL5vnVK?=
 =?us-ascii?Q?NB/TIV09SojDf6BkVu/YOsLDks95M6MPyOLzP9KKt/X/2WCmYklDAfcF9F9O?=
 =?us-ascii?Q?tEV77MnzscSBeOLfzbAqJx44cebMJBI+72VAGBDuHAS8gsH6B7oK3n/Mr5XG?=
 =?us-ascii?Q?rNsQnwMgUb/jtCi5BFxgf7TWHpE8xISRztCq2ISZRviCRH8OLp6lmO1LwgE9?=
 =?us-ascii?Q?I264+f2HkZ6KoNzVbXYD8fBjwB+Pj2y6T/GmXlY6kypyWSN42OIY3AvpCg2k?=
 =?us-ascii?Q?WK1xKnK2TM3g66THWboJrerovNAvjZGsC+ULU0WM2WG6DmzdzriyC8hXaZtC?=
 =?us-ascii?Q?h/A3gjdsJpJz3VDSmyksqPQkxHrNz7+aq9XyUKeR1T6JPNlsEk7VgUl9fKMe?=
 =?us-ascii?Q?/3TYMhpqOHFmtVFLZ3pcqoVq/NzeH+mTJn6mLevNQmdZRDGUcg5qODXAs/QE?=
 =?us-ascii?Q?X6w36kH93N+W+iR2Y7I5r0+IDCzWGUxMr7qmUq3P/I4RjHqA4tw1Wn8t+UiA?=
 =?us-ascii?Q?mwm1/1ldtQ2Y+daQl8prpSORXiEtp19EFsfHJVTuiANFU4hCYHQGc+BEjACu?=
 =?us-ascii?Q?CyteeKACz4JB5oSdQ6vvfus+s2jQalT+SMrCX4RffdVrgo7Zfxyr+EtxrSRH?=
 =?us-ascii?Q?Q693IDgc0KfFD+Qn0OVqa/8K3AYRQ16mFaeTNCsqDl3Jqt9ETB5O3EuwBDXl?=
 =?us-ascii?Q?f9E6WN1cMS+74jN7i9ZHV7E23zI4IhgWX33iKkDWBXczzZC2D0T74O8QsHFA?=
 =?us-ascii?Q?80iDL2ztwHVfp43dgJXFHdLWr/Ns5k1UPJY5EQLBUeu53zwndzOntJ+XdKPL?=
 =?us-ascii?Q?SUsPWm7VcbYJg+1sx+2TtCko/9qS4BE9F+HdNYnl+RCtGVIw0Av+SH97xbz7?=
 =?us-ascii?Q?X2clt7jFc5+QuLXwYY3x+LIgs5bBkbkl2oFiAiv6dKqORlkYYsb1CJieQKM+?=
 =?us-ascii?Q?gfXQQ/xs9B+So4woU/UkV5vqmLoxAL78ZZ7lQnDTqTPiOyhQFlC8Z8TNAGsB?=
 =?us-ascii?Q?zDoHkGC7a4VZ1NsyebNnAdGzVPyQGP+gtSdhgZYql5VAtvH8kb4ZaSvCyIl6?=
 =?us-ascii?Q?vVSuz1v4yUmFJWqQjiwdNhwrV7TeZ2bvVe7n3qDKANHpocWK9p3XsgbRY14h?=
 =?us-ascii?Q?+RCYn82+WODQufEmEzJvE0Flg8LRfR25kT5BRpoCXxoI6FCtPuKCtpeCiVti?=
 =?us-ascii?Q?NiFOcJNO5FXhShEEnG7sbBqJXDdjO9TmonYOgKpjkAtZUmWdaJiJWwRfujGS?=
 =?us-ascii?Q?FkmTKAb6NJ3tpQL6EXuyFw3Ah3RTBz5T+x0GxLBzkrbaplfw7rztaU2l7NFV?=
 =?us-ascii?Q?+ibQvU/wMNLE+s94dOkj5YJHs+s8QlwVexcUTo8Xow7H10ZG6XbwFwl9eo2f?=
 =?us-ascii?Q?LTUfFJRugOFhov+UGrPZSs6j4vdMZ1zmfF/u4LyR?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 22:01:32.6726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47386fbf-00d2-467c-5eeb-08de426ed563
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4275
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 22:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228506

From: Randolph Sapp <rs@ti.com>

Hello maintainers, I wanted to wait for the latest tag to get cut before
bringing this back up, but here it is. This version addresses most of the
concerns I've seen regarding this series and adds on a little more function=
ality
considering we now allow for proper session selection.

This led me into a bit of a dive into the desktop-entry-spec [1] and associ=
ated
validator [2] that I wouldn't mind some opinions on as well if people are
curious about that.

Legacy details follow:

We've recently run into some issues with weston-init attempting to start We=
ston
prior to all drm devices being registered. There's not really a good, scrip=
table
mechanism to listen in to device registration events that works with the
existing weston-init package. Well, at least one that doesn't involve polli=
ng
files or introducing more dependency on the init system being used.

I also see there is also a lot of scripting around starting X11,
xserver-nodm-init, that (from my limited review) should experience the same
issue.

I'd like to introduce the following display manager for oe-core, emptty [3]=
.
This display manager is, as described upstream, a "Dead simple CLI Display
Manager on TTY". It supports both x11 and wayland sessions, with togglable =
build
parameters to completely remove x11 and pam dependencies. It's licensed MIT=
,
which shouldn't be an issue for any users. (It is written in Go, if you hav=
e
opinions about that.)

With this, both weston-init and the xserver-nodm-init packages can be re-tu=
ned
to leverage this display manager and simply add a user and emptty config fo=
r an
autologin session. This can resolve the current behavior across init system=
s
without additional scripting, and move some development out of this layer.

This lists myself as a maintainer of emptty as well as xserver-nodm-init an=
d
xuser-account since these are currently unassigned and I've reworked them
significantly here.

Sorry for the delay on this series. I found a few bugs in emptty that I wan=
ted
to address before submitting this officially.

[1] https://gitlab.freedesktop.org/xdg/xdg-specs/-/merge_requests/110
[2] https://gitlab.freedesktop.org/xdg/desktop-file-utils/-/merge_requests/=
28
[3] https://github.com/tvrzna/emptty

v2:
	- Address spelling issues in commit messages
	- Attempt to resolve some test related issues with weston
	- Add additional logs to X11 related tests
v3:
	- Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When running
	  under QEMU the first auth attempt almost always fails.
v4:
	- Add a tmpfile entry for the x11 domain socket directory.
	- Remove some scripts associated with weston-init that were being
	  shipped with weston
v5:
	- Move tmpfile data to individual files
	- Add explicit entries for these in the FILES variable
v6:
	- Do not attempt to ship a tmpfiles.d entry in libx11
v7:
	- Include a backported fix for go/runtime to address segfault issues
	  reported on x86 platforms in previous revisions
v8:
	- Sign-off backported patch
v9:
	- Resolve merge conflict in maintainers file
v10:
	- Remove the ability to run x11 as root in xserver-nodm-init, see
	  https://lists.openembedded.org/g/openembedded-core/topic/115318655#msg22=
3906
	  for more information
	- Merge xuser-account and xserver-nodm-init as this is now a direct
	  dependency with no other consumers
	- Fix warning about multiple providers for virtual-emptty-conf
v11:
	- Bump emptty revision to 0.15.0
	- Add session entries for all the session providers
	- Make autologin default session configurable for xserver-nodm-init
v12:
	- Add util-linux-mcookie as a runtime dependency to emptty when x11
	  support is enabled
v13:
	- Add nopasswdlogin to the static group definitions list, also register
	  it in the emptty recipe itself since the pam rule provided in that
	  package mentions it
	- Always ship the legacy inittab entry, since it's possible the end user
	  has some unusual distro configuration with multiple init managers
	  enabled

Randolph Sapp (6):
  emptty: add version 0.15.0
  weston-init: convert to virtual-emptty-conf
  weston: remove deprecated weston-start scripts
  xserver-nodm-init: convert to virtual-emptty-conf
  xuser-account: merge with xserver-nodm-init
  xsessions: add unique desktop entries

 meta-selftest/files/static-group              |   2 +-
 .../conf/distro/include/default-providers.inc |   1 +
 meta/conf/distro/include/maintainers.inc      |   5 +-
 meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
 meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
 meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
 meta/recipes-graphics/emptty/emptty.inc       |  26 ++
 .../recipes-graphics/emptty/emptty/emptty.tab |   1 +
 meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
 meta/recipes-graphics/emptty/emptty_0.15.0.bb |  59 +++
 .../matchbox-session/matchbox-session.desktop |   6 +
 .../matchbox-session/matchbox-session_0.1.bb  |  13 +-
 .../files/mini-x-session.desktop              |   6 +
 .../mini-x-session/mini-x-session_0.1.bb      |  13 +-
 meta/recipes-graphics/wayland/weston-init.bb  |  66 +---
 .../wayland/weston-init/emptty.conf           |  77 ++++
 .../recipes-graphics/wayland/weston-init/init |  54 ---
 .../wayland/weston-init/weston-autologin      |  11 -
 .../wayland/weston-init/weston-socket.sh      |  20 -
 .../wayland/weston-init/weston-start          |  76 ----
 .../wayland/weston-init/weston.env            |   0
 .../wayland/weston-init/weston.service        |  71 ----
 .../wayland/weston-init/weston.socket         |  14 -
 .../weston/systemd-notify.weston-start        |   9 -
 .../wayland/weston/xwayland.weston-start      |   6 -
 .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
 .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
 .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
 .../X11/Xsession.d/89xdgautostart.sh          |   7 -
 .../X11/Xsession.d/90XWindowManager.sh        |   7 -
 .../x11-common/xserver-nodm-init/Xserver      |  25 --
 .../xserver-nodm-init/capability.conf         |   2 -
 .../xserver-nodm-init/emptty.conf.in          |  77 ++++
 .../xserver-nodm-init/gplv2-license.patch     | 355 ------------------
 .../xserver-nodm-init}/system-xuser.conf      |   0
 .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
 .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
 .../xserver-nodm-init/xserver-nodm.service.in |  13 -
 .../x11-common/xserver-nodm-init_3.0.bb       |  73 ++--
 .../user-creation/xuser-account_0.1.bb        |  30 --
 40 files changed, 349 insertions(+), 975 deletions(-)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.15.0.bb
 create mode 100644 meta/recipes-graphics/matchbox-session/matchbox-session=
/matchbox-session.desktop
 create mode 100644 meta/recipes-graphics/mini-x-session/files/mini-x-sessi=
on.desktop
 create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autolo=
gin
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket=
.sh
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.servic=
e
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket
 delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.wes=
ton-start
 delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-st=
art
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
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/empt=
ty.conf.in
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/gplv=
2-license.patch
 rename meta/{recipes-support/user-creation/files =3D> recipes-graphics/x11=
-common/xserver-nodm-init}/system-xuser.conf (100%)
 delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init/xser=
ver-nodm
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xser=
ver-nodm.conf.in
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xser=
ver-nodm.service.in
 delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

--=20
2.51.1


