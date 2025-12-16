Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D774D5E127
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 20:38:40 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4007.1765917516587644092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 12:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bVPfIgaL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.39, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVlhYogJIzz0ORSPcYjRp3bwVVdtL5nDWt28iNvdApuNDPgu1G21USHEo1JfgfEzeu8e2jvCRt5ccmm+JipdXXR4Z4DDoRMejYH3lHxEg7C13LqwA8Jz6niybXd9jmi56uDKsGJzFbMmIx9DFel3aoOoir73H3rS7r/xjIT+t6ZjAVlh8QDQmH8IKVc/dDaKEAvt5/lZWugiqynjsPGL5VSzms/bGuxqWZxupiWEdZUw1IoZ5bBVKsNYvu52dV91OB3PM23S4UOR3eUxckQhUXmNylKXbA2cQCw6KYd7XfeeKtY6zqbRIMVSuR7QaqKbtU8tM4Tx6Og+PRPPNNgbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nU+pgx2pmGTXzn7vR648d3/1Suvkigl7oQqkBkUhbgw=;
 b=y85DxTr0lj5ILvhUD9kd1H4qngiwhyCUvhR00uZ70Pi9iCBc+t5Om4iqd/wgO4qix/Yh50EHVEL6/kCngL/0AM0Yzlcp8wNnu5hT//AllNfLHPHLGa7vwr7Ft6Me4LaIrbmp5O2Owo4a7Kzm6dSCb9RhySaHVcBINV16V+Ize/PY46YPhhx/oj2qHlAnpUqcTRVNzMwSxSLccB++ClIZGdCzvNGFFCIK3Du0ZpIG+GUglVwMsBbCKbGzZiVG/WBru4lnA3F5f+08Bz5qxQChtxS3B+yPHOBiDS0sxp1F1cpR0JoGTPk2z7Eu5s0jmH48EX0dP8PnT8yDwPtbgtfIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU+pgx2pmGTXzn7vR648d3/1Suvkigl7oQqkBkUhbgw=;
 b=bVPfIgaLcbygpMSOhrQQIf9UjcoBMkdUz2JCxFeJS0UW5L7xiMwOxek0kUGZ1nSTYAzgxMD8nZHrdfZg/Gl8wRNC5S4ZQv4sT9i1iiRNFkqAhqYwKMR3t/KaAcjfB36hO75xVCH22d2ddgCvKVg5NptNgvFDG4AHjdAeRgP/hQs=
Received: from PH7P220CA0069.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::18)
 by SA6PR10MB8159.namprd10.prod.outlook.com (2603:10b6:806:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 20:38:34 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:32c:cafe::c2) by PH7P220CA0069.outlook.office365.com
 (2603:10b6:510:32c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 20:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 20:38:33 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:31 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 14:38:30 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGKcUhd402388;
	Tue, 16 Dec 2025 14:38:30 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv11 0/6] Display manager proposal for x11 and wayland
Date: Tue, 16 Dec 2025 14:37:57 -0600
Message-ID: <20251216203803.3870049-1-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SA6PR10MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 163f0bf4-428d-4f57-3cdf-08de3ce314c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X3dwC72cZWHucijGCuN24U8imfepKlbYEDN5xPw2CUwTkNCSvO1oaxUiXIf5?=
 =?us-ascii?Q?GrHllhy6X/L6+9Dc+GW26KQAQOHuGjz4O/x+rSKJQjdwGT7SRGkOhymWzhi0?=
 =?us-ascii?Q?mbjcQI0Fw0H9GdvJE4kZ4AdTWE3AZPTFVKabIAVGxmne10GepEsnA2viGknI?=
 =?us-ascii?Q?8YpWm9SGp+TaowAHmfHN5vQctdZ62JpAp6girjw8RZFUroca+xhn1U9g0/HK?=
 =?us-ascii?Q?p6zdvBb4r2aZXGnLJ4w4ralW7WHtEEbAbIyDgFFWFaTpHmDdMXYTqGJV4TQP?=
 =?us-ascii?Q?R+vgTdwgju71KLtqOJUfosdIfzLo1ncFoxRwavNdkTtxUDhMcxqZYSlVIEEM?=
 =?us-ascii?Q?BGIZ5v/JIqaTNZ65PoFFpcdf1jOStyjnwk7uv7K60SDNLGF4v+Q1+ThEPR9Z?=
 =?us-ascii?Q?16X+99/qsWD06mQlMcgjeE6Zmuzazc2yqjr5SMl+ntKFI+nMI38oKPtdIFtQ?=
 =?us-ascii?Q?jsH04cdZ98OPA8/g5AaKki8DnrZkGFXbfmXg4rsDRWxaVDXJb5/BKc7LlbM1?=
 =?us-ascii?Q?yg3ZSjwRwFj1EzOsxRzW08+CqEOxfFW1rQ20GB+tYsu9WPEwjp1RT+cdIouD?=
 =?us-ascii?Q?iMlSwDJaKlmQt6gcNg7TltuH2deM84CjgeyJXnpnSZMgQiuGiHxeM9FCLess?=
 =?us-ascii?Q?PFv8p05ht8vziwszgXWsiFkeVyfPiOeAdAlttPvz47277vXJ0hvOA5Hb4rjr?=
 =?us-ascii?Q?iJhMWFv8Ya3cF4dpyjboWQ1O9MP79w5lR/Lr2pvNSeV5dBG4Hll5oN2NwDaP?=
 =?us-ascii?Q?YIuXJU1dxBisXGFRmTYm+eXsCW3gsaN9mloUpUvtb+1h3OVcPXMRc0LvL7gn?=
 =?us-ascii?Q?sPQmEJHklNYBW5HY1NCO0U9OIVzwpxYWEPNoA0BCL1XeS0j/8XeHbya1eWQO?=
 =?us-ascii?Q?lSZTVZOYG6bS1RyO1DDsCyKYdF9lCeR0dpKYQA25Q7aNsf861c0NDkUvXNV5?=
 =?us-ascii?Q?0KTx9DAWilHZhteZMtMTFlI7N+921+37vZRRl4Td2Fhh0YrL5mJuqCXGOLFM?=
 =?us-ascii?Q?NTCyXjJQrG+Sd/DzuUp9VUJimWTa3GkgmLMBsQp5ocVFlSxknLjldg+pjoB9?=
 =?us-ascii?Q?QAjMRpci1ucM1ZfIBd/QYfbzhOIzX3mS4wrWRKq5BDClE+Ans9QwkkcbSYW9?=
 =?us-ascii?Q?da5sGIBwOYSqX4BamWOUHIXG5xWnrKlFyNomq2ZG73eYS6JUCKIvYkCzd82f?=
 =?us-ascii?Q?279aHobRnhtYbGam2YlZhuN27P7jqocMNZTzH65q5yJgzef2T6GfMCyBLB0/?=
 =?us-ascii?Q?/XUz+LqSHoSpQOD2JoUPbLBitBWjfhJCF2IIslBCQ3RLHaOAqCakIJU1kuH+?=
 =?us-ascii?Q?p2FbH+UpZtZuS9UpleHDnbBnvWc8k3ZbLpv+ACSsXOrrq2vLOLxmseCbUIYt?=
 =?us-ascii?Q?w/c3Saff7lxvqaFLyxfw7xw7eFcP7N1NsN0sIkSmFJmHzapF+FX+XGUUM47s?=
 =?us-ascii?Q?JDpCtw00ufVSrDAs7XPAuPcPjuapzlT9eAGmstnIZ6E5v6OS7HVF4TriUxWn?=
 =?us-ascii?Q?a/6rsfl8rgNi5MptvYkjQOiAzKbNJQqwQJ5DnlyCT37+f4mh21Cq7h0SGg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 20:38:33.6196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 163f0bf4-428d-4f57-3cdf-08de3ce314c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 20:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227985

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


