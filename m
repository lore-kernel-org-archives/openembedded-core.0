Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A28ED6E2DE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 19:11:23 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.169.1766085082073434809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 11:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ocmYpwg5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.35, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O20R+K48+TfrToX0XZZwm2aGy7+l5VdtVtUhPqFNJ0K87TI+IpH5C8EX8Gtct8H8WDmZniXx+XlgWpoHMbJwK4H2BWFDz/+hWYirWDnbAKf0YZKeUM2raYjg1Yx0fwGk7+Am8UFvXImcI2f4EpTM3NgZ+w+dd0meNWhy3H2lIL8UIOHc6/NU75VaGIVJ9kYn89Ce6lrsLwjvFQOfWnrEqvucKKRUOzMFcRRzxluaG976QNYQivAKzYiu6hVDV+CKRRTGC4cxM47ymEnXIuR2VMtu8ZlEaWx9PvrLhA5QaBjrdi+4eEe9Je+TiTvnt9BIc5GArj2xQIvWKKBdMEiMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLxvgfLABchp9DDpe6eK67mlS/qKcZA6/oZV+4BpE+g=;
 b=doXOby1fhADYhPriR5qRWjeQ+JGFtjCjUfhpV8K2qpW6scImbypF8hiKyYuuFIbKgbNbnZcOKtd0pyImdv0+HHTOzx6FLooaF4ag5X+APPXmhPHmg2pLzNlFHCyl/+eoUZQ7XLZc+3uFYuxRQWn3JSuWZ2xcC6pSI3c/O5FOdlTsAueIW/ItPnDZyTr3+RB831mJH+9QMXPH2d7NDSPiEmkGlOWR9w9TOvuGKblnFsLiMn02kUnUEaRKDH0iQfMKfOd5mEVtRH2WzUNxz5Bb7K3gBtEvCauUnhmwpTwMm5FvoqcOskgNWd5wuSETnDkjQLeENqutNOqnG9iDSlD67g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLxvgfLABchp9DDpe6eK67mlS/qKcZA6/oZV+4BpE+g=;
 b=ocmYpwg5OijMwOWFPbfFyFUgouGoGHBGbxqYiwKGnY8OZBB1xpPOOqsL1AiEpiVutyYvw15q8J2jMeWtADquOCaO7YCsevaSAmlQgZf2+nCRQZhTiVwKOx0ytQrlRvexbaNZ9WwiYi76tIFNCVSH1bAjo5CmXBL6g/IrMGg9C0Y=
Received: from CH0PR04CA0105.namprd04.prod.outlook.com (2603:10b6:610:75::20)
 by DM4PR10MB6183.namprd10.prod.outlook.com (2603:10b6:8:8b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:11:19 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::60) by CH0PR04CA0105.outlook.office365.com
 (2603:10b6:610:75::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 19:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 18 Dec 2025 19:11:19 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 13:11:13 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIJBDtE3796612;
	Thu, 18 Dec 2025 13:11:13 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv12 0/6] Display manager proposal for x11 and wayland
Date: Thu, 18 Dec 2025 13:10:20 -0600
Message-ID: <20251218191025.667701-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|DM4PR10MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: ac943b78-8549-4c58-6234-08de3e6939be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/InlX4ftDJ6k5gJJFx3eboV1o8HKMRXfSJYAvyuyqzF0N3y4k/FQS3LgoiL9?=
 =?us-ascii?Q?XKr1TWSB+Gvz6Mq+e1SdyBmBcT54KiYyKkXUD0r53I45jwqNZF/WDbnHUu1E?=
 =?us-ascii?Q?Kpv2hRQGygE50r8jywCsDg9ovCsNlluh6WRU7vB+5QySgsChfYUyGz7GiORt?=
 =?us-ascii?Q?lxmNtSxmXuf7LpzNTf8+gFaPnXePdlXcfnwDRKtzsDoN9bTKzsHcgc93Q02G?=
 =?us-ascii?Q?lK3PLe+RGzgo1TK7BUNVoTUofHgW61SI1FvZCWFKjyQ9efjWUB/6FUJp8k1a?=
 =?us-ascii?Q?Fu2PUKHkPANktYZYjzKywJ+K4nmygn6T3zOooq8qvQwczqsUYjwiS65c2Tqd?=
 =?us-ascii?Q?iz4oiJJzlj+YbzOtUHNDV8qruci7y6SK33KYyihS7OEcN1W4o8cm/V1+b/e4?=
 =?us-ascii?Q?e3PO+ovj2BM9Y7ZQ7ek05+UhYpmm2m3Enp0851llcnJjseqgymfQ0L4Fpv+t?=
 =?us-ascii?Q?oJ2sdAnc3CUyHLpqDSGRkSXOHH/6GrcrDJ7MrymztT8lgYAjpyiMJPCR1see?=
 =?us-ascii?Q?/0fnJB+PL3Z60ILJvz4qytqvcbclVkFwGGe2ot6oFXNVykLSbTmEEUt7+HCQ?=
 =?us-ascii?Q?IneNF96H0+rqxQl2wkVUAJq2n7Ryl/KJ5WnT5enFY1FcokikVlO1ddBFF37d?=
 =?us-ascii?Q?/s6LcqYAHViC94bQdxO3LRlKe8oVWYvCCAnOEtA2o0nC4XEBVV/fu4yNx7Y8?=
 =?us-ascii?Q?DikG/Oy58CcnrJ+9zYrBlzt+aFBKy/ZpvvQDPto3sF8TunmtRGE8DukgNfII?=
 =?us-ascii?Q?3FUS0fQOvZ3y2ven9SlB5cCd7pL0UbQCh9bxDxdzd4KkwRfYIVNCUn+AqXTt?=
 =?us-ascii?Q?Bi8L0R+yQ6OshPjNYtt3HCnvKx4nQ4ih9vR8A2YLZMhyg0sdaDXb/P5oaiXm?=
 =?us-ascii?Q?XiTAJwVa9vRDkQ9jWeCu6O7gxrnHcC+yyT2FSs/MiiqfBwABZcVmE+awUs2R?=
 =?us-ascii?Q?saLfBYYWfoDlOSfUpIsLXw/l4Pl8kxHw0wcbtpo/zqhBlqSfYUCs4Nw4sG3d?=
 =?us-ascii?Q?vubm4m9SrTg34c/YNDMABVQXPGouXxJzEaaMKoIPCNTcPWhAqAI7Q518yeWr?=
 =?us-ascii?Q?U4m/m8Cr/8AcwZncAqVUmmjqjrWKfg1sihrfkJkfIv3pgeD+RJxSs/DOHxBf?=
 =?us-ascii?Q?3ccncyqQPlHlqWTWZx0ZzdY+Y14yhW8JAEPZ8COobAbkamiauj4iVMNImN1h?=
 =?us-ascii?Q?njfJuBsjCP0Zz7szGOIgfFi4F4xiGRteaixY+60IOnCYevyQs0BhzmzV9DpH?=
 =?us-ascii?Q?g8Mfox3WAxefFezpCP5zxJpxl9klCWSoDnhg+kbDpLmbUS4mZqZJZAptRRn1?=
 =?us-ascii?Q?47KCUZLpU1PT/5/LU5Mj0Aleed+l09GpJ/8TLWq2huhdUjGmVzCO/Dx2SH+D?=
 =?us-ascii?Q?REDjLHQlNDBxLz9P2sqr1be+TpwaDmkCDV21GW+N5ckeXrszQYUsI/kI3iak?=
 =?us-ascii?Q?bW9SvuRBPvoSsQaAZMYaHjmt8uEpqgtWaWjXP0015TkmV4G4ZujwjDZ18tJA?=
 =?us-ascii?Q?WP4NQRhhlbBvIQstwTJqeoGioN3HHG8Jf2u7FIWxAqE35D/KOAlIeoBKdw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:11:19.3472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac943b78-8549-4c58-6234-08de3e6939be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228133

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


Randolph Sapp (6):
  emptty: add version 0.15.0
  weston-init: convert to virtual-emptty-conf
  weston: remove deprecated weston-start scripts
  xserver-nodm-init: convert to virtual-emptty-conf
  xuser-account: merge with xserver-nodm-init
  xsessions: add unique desktop entries

 .../conf/distro/include/default-providers.inc |   1 +
 meta/conf/distro/include/maintainers.inc      |   5 +-
 meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
 meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
 meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
 meta/recipes-graphics/emptty/emptty.inc       |  26 ++
 .../recipes-graphics/emptty/emptty/emptty.tab |   1 +
 meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
 meta/recipes-graphics/emptty/emptty_0.15.0.bb |  53 +++
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
 39 files changed, 342 insertions(+), 974 deletions(-)
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


