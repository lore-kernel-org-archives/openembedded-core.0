Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E37F53D81
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 17:25:39 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56361.1773681931233201956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 10:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=duriul2X;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.48, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6hkEnme19z9zMO/UJ6Gm5LgeP6Id8fSGqKmaINMuxeuUcIR2hH8uOBSdAGO0BY0/xAdOzReisuccDiQAUY0G9v6l8hl2D7HfrndUuFtYO0fOjLiN++l8tUrRJIaQncKISJGaVAgdkGaL1Yc8otTrzgsEHLkZkpuA/NNAzeBPB5552n7gQaa3DqvCiPRIbtvVVKwq3BlaBnUHGKA2ckJqL5FSHfj0oB7XfztLkFqRMoHeIIf50IufyXnXB/oY2pgFvtXka5ee68SlGVyCrwORBpttryQ9khwoMnE+0qFlYmqPrbo7ntBG4R1Q1v0pHV9EKhrM0NEy9UEMe4h+ZErpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLhbsDiCUKb0yHmUSiaI+6GCXjEyPo/xoEvnKWLl9GQ=;
 b=LY3kHkfXZD9IcVVfV0RIGvWOBWEpUR5pujqCuvejND+LbG3ntBZ3TEE4UZgE3obPOSVLDORvd0l0Zll2fiGwQd6PJrH6JKWn456UG6ZHUE9eYROKZmE8IfVohGeHoHpW/Wzx3aXDaIlNoK7JZ5upmaNSsDtED1CfsusbIQbuSdJY+ll/2kmWi2+WpJd9HSgwTB4Mo3RaK/O1s2OA+Wn3Q4LTgxIAd0844A5N/oBuJdeHHE44Pf5/DC3Bir3su8g0NKR4+ax+cW55JiRqN4t4IBvDYlNe1qze53GJC5ghEJ59xP+GapUdyGiAWQ/pkKJPvhO4/S7JD9JMjggr76VZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLhbsDiCUKb0yHmUSiaI+6GCXjEyPo/xoEvnKWLl9GQ=;
 b=duriul2XH5vyb8x09bGvr3J9n1U+CBlprMLWR22SxRKccNE7qDYVbeu7p3x3XBHoJSoqxaWUv1O8yBhl+TPehK+lhc2ydDISdYUdY6dRcqONtYPHFSYPr9KJiNj4Yb4jGl5bKZhGRf/R3B7NIBfQZZyBctyhb5WnwQ8wYEqgH3Y=
Received: from BN9PR03CA0581.namprd03.prod.outlook.com (2603:10b6:408:10d::16)
 by CY5PR10MB6141.namprd10.prod.outlook.com (2603:10b6:930:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 17:25:28 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::6c) by BN9PR03CA0581.outlook.office365.com
 (2603:10b6:408:10d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 17:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 17:25:27 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:25:10 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:25:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 12:25:09 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GHP9sD1674917;
	Mon, 16 Mar 2026 12:25:09 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Mar 2026 12:25:09 -0500
Message-ID: <DH4DRGOK9QNT.3LUCU841H1ANP@ti.com>
To: <rs@ti.com>, <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>, <paul@pbarker.dev>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv16 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <18982E1417FE35B6.1454197@lists.openembedded.org>
In-Reply-To: <18982E1417FE35B6.1454197@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|CY5PR10MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e41099-4102-4492-64a4-08de8381045c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|22082099003|18002099003|3613699012;
X-Microsoft-Antispam-Message-Info: 
	6TwTSapASOT/d/OYXEYwjBna82a1zk4FzM6CRK0Rnb56miYszbDiJjxTQVjsEjtKIK7I64Sr0MHwK7qHDyjGxBzplYjzDZxXXtZv9psZPQHojVzw3ujraDux7KMOFjXAKOtogD9g4G5/klAaZ5US95fhVdNbYVoIkQZOrzi/hEAXd3DESUwpfsvU9uKz/2pGZ4c5dLdqZABLcEOOaVrlJfH8ygFgJnBEWUEhJWSCICaT62+H+qOpIO/xwWphAcwro+wCMnps2/mXiSOV5CCFanoV7FuihhT5acrs1+HCcRM09/U+x4wIdBPUXwYL6kPA+pVhnyJ4H/dLIWIxJdjKcGr4eiLdemI0M7ycTCzsvZkqoggu9WkuWlviMN1UFxursu4es1qVkL0rdEUWLf9832kMTGAexBfP3narNzQg+rRms2miougiGdw+ZjivVKeQtRBzj2zeZdg1Nwfi+sBEml2W1osTIUBj5zgVVVBpxnIUxXiQG0LgrgLZ4m67puCjqxW3NOe4tM3V8ZhImjiqPDsepT4ZdPtPhRasWJK4Hya2vVggYbt6MLja4IpOwWMxABpEy0uAYi+Lyph9evSyBvM8HNgab68UAHlBw3K2twIfw/+oicTrhuP5MAbv0eAt/+q/mSCqL59P1ZsZNlQs9H6YbUcYK8NvCtP/fRlCSbb9yUh76KU7JKKx4HHfexUQk/TnP/Yq7b3KB+ykcgMzznOBOOoEusMqWyLZXLS9q8lYoWWb1B7REGAghI4eM33pzGdAEbNQjJL0B6DLRZpS8A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Vk5IUgiOMOo5UPUaVKnzlgqel+ioGodw3QpS/7CR5F5LO9rHckI47kEPQrYlAJ7OTQk2dwh6Jr1PrnLbGd/TwjDIS2umCD0zZtU42YrHmPqUt3echxBp2Mx0B0cj0lDT15mmldowG8ib3/s+b+KtvfQLyb91nCY8AG5ceHWznxfibVTBDUjGUSZwdDK4CF0eXdzMifhLHWeV5nT5lmDxpS2xsOu6YbcfK/1bxAhnw9OnG7bD7VZAUMnVEbsS+8bZl0f7s+3GIvadriiJWkbVC0gCLgbXy0C8pJ1jLByuceUDWmqa7fWlapH+5SO1lKTQpKNoFQr4xHXaOYsrzIR5Y8j6ixKGOSTdesiJaEbQ0/JdsP8VpQsDicx7ZZHHmKZG01fjCO8KP9Z4/bufAMFjZo0EpYQRqm7Uvwsqyr2uXB9fPJtXNH7k27Ew2Flw6Eqj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 17:25:27.9139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e41099-4102-4492-64a4-08de8381045c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233265

On Fri Feb 27, 2026 at 12:31 PM CST, Randolph Sapp via lists.openembedded.o=
rg wrote:
> From: Randolph Sapp <rs@ti.com>
>
> No functional changes. Just bumping PR to help with automated testing iss=
ues.
>
> Information from v15:
>
> Alright, now that cgo binary reproducibility has been addressed this shou=
ld be
> good to go. One slight change from v13, I replaced the inittab.d entry wi=
th a
> rootfs-postcommands function since busybox-init doesn't support it.
>
> Information from v13:
>
> Hello maintainers, I wanted to wait for the latest tag to get cut before
> bringing this back up, but here it is. This version addresses most of the
> concerns I've seen regarding this series and adds on a little more functi=
onality
> considering we now allow for proper session selection.
>
> This led me into a bit of a dive into the desktop-entry-spec [1] and asso=
ciated
> validator [2] that I wouldn't mind some opinions on as well if people are
> curious about that.
>
> Legacy details follow:
>
> We've recently run into some issues with weston-init attempting to start =
Weston
> prior to all drm devices being registered. There's not really a good, scr=
iptable
> mechanism to listen in to device registration events that works with the
> existing weston-init package. Well, at least one that doesn't involve pol=
ling
> files or introducing more dependency on the init system being used.
>
> I also see there is also a lot of scripting around starting X11,
> xserver-nodm-init, that (from my limited review) should experience the sa=
me
> issue.
>
> I'd like to introduce the following display manager for oe-core, emptty [=
3].
> This display manager is, as described upstream, a "Dead simple CLI Displa=
y
> Manager on TTY". It supports both x11 and wayland sessions, with togglabl=
e build
> parameters to completely remove x11 and pam dependencies. It's licensed M=
IT,
> which shouldn't be an issue for any users. (It is written in Go, if you h=
ave
> opinions about that.)
>
> With this, both weston-init and the xserver-nodm-init packages can be re-=
tuned
> to leverage this display manager and simply add a user and emptty config =
for an
> autologin session. This can resolve the current behavior across init syst=
ems
> without additional scripting, and move some development out of this layer=
.
>
> This lists myself as a maintainer of emptty as well as xserver-nodm-init =
and
> xuser-account since these are currently unassigned and I've reworked them
> significantly here.
>
> Sorry for the delay on this series. I found a few bugs in emptty that I w=
anted
> to address before submitting this officially.
>
> [1] https://gitlab.freedesktop.org/xdg/xdg-specs/-/merge_requests/110
> [2] https://gitlab.freedesktop.org/xdg/desktop-file-utils/-/merge_request=
s/28
> [3] https://github.com/tvrzna/emptty
>
> v2:
> 	- Address spelling issues in commit messages
> 	- Attempt to resolve some test related issues with weston
> 	- Add additional logs to X11 related tests
> v3:
> 	- Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When running
> 	  under QEMU the first auth attempt almost always fails.
> v4:
> 	- Add a tmpfile entry for the x11 domain socket directory.
> 	- Remove some scripts associated with weston-init that were being
> 	  shipped with weston
> v5:
> 	- Move tmpfile data to individual files
> 	- Add explicit entries for these in the FILES variable
> v6:
> 	- Do not attempt to ship a tmpfiles.d entry in libx11
> v7:
> 	- Include a backported fix for go/runtime to address segfault issues
> 	  reported on x86 platforms in previous revisions
> v8:
> 	- Sign-off backported patch
> v9:
> 	- Resolve merge conflict in maintainers file
> v10:
> 	- Remove the ability to run x11 as root in xserver-nodm-init, see
> 	  https://lists.openembedded.org/g/openembedded-core/topic/115318655#msg=
223906
> 	  for more information
> 	- Merge xuser-account and xserver-nodm-init as this is now a direct
> 	  dependency with no other consumers
> 	- Fix warning about multiple providers for virtual-emptty-conf
> v11:
> 	- Bump emptty revision to 0.15.0
> 	- Add session entries for all the session providers
> 	- Make autologin default session configurable for xserver-nodm-init
> v12:
> 	- Add util-linux-mcookie as a runtime dependency to emptty when x11
> 	  support is enabled
> v13:
> 	- Add nopasswdlogin to the static group definitions list, also register
> 	  it in the emptty recipe itself since the pam rule provided in that
> 	  package mentions it
> 	- Always ship the legacy inittab entry, since it's possible the end user
> 	  has some unusual distro configuration with multiple init managers
> 	  enabled
> v14:
> 	- Move from legacy inittab.d entry that only sysvinit supports to
> 	  modifying the inittab file itself for both sysvinit and busybox init
> 	  support
> v15:
> 	- Remind myself how POSIX shell "return" is supposed to work when not
> 	  given an explicit value
> v16:
> 	- Bump PR to make sure caching isn't generating weird test results after
> 	  changes to source date epoch calculation method
>
>
> Randolph Sapp (6):
>   emptty: add version 0.15.0
>   weston-init: convert to virtual-emptty-conf
>   weston: remove deprecated weston-start scripts
>   xserver-nodm-init: convert to virtual-emptty-conf
>   xuser-account: merge with xserver-nodm-init
>   xsessions: add unique desktop entries
>
>  meta-selftest/files/static-group              |   2 +-
>  .../rootfs-postcommands.bbclass               |  14 +-
>  .../conf/distro/include/default-providers.inc |   1 +
>  meta/conf/distro/include/maintainers.inc      |   5 +-
>  meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
>  meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
>  meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
>  meta/recipes-graphics/emptty/emptty.inc       |  27 ++
>  meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
>  meta/recipes-graphics/emptty/emptty_0.15.0.bb |  55 +++
>  .../matchbox-session/matchbox-session.desktop |   6 +
>  .../matchbox-session/matchbox-session_0.1.bb  |  13 +-
>  .../files/mini-x-session.desktop              |   6 +
>  .../mini-x-session/mini-x-session_0.1.bb      |  13 +-
>  meta/recipes-graphics/wayland/weston-init.bb  |  66 +---
>  .../wayland/weston-init/emptty.conf           |  77 ++++
>  .../recipes-graphics/wayland/weston-init/init |  54 ---
>  .../wayland/weston-init/weston-autologin      |  11 -
>  .../wayland/weston-init/weston-socket.sh      |  20 -
>  .../wayland/weston-init/weston-start          |  76 ----
>  .../wayland/weston-init/weston.env            |   0
>  .../wayland/weston-init/weston.service        |  71 ----
>  .../wayland/weston-init/weston.socket         |  14 -
>  .../weston/systemd-notify.weston-start        |   9 -
>  .../wayland/weston/xwayland.weston-start      |   6 -
>  .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
>  .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
>  .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
>  .../X11/Xsession.d/89xdgautostart.sh          |   7 -
>  .../X11/Xsession.d/90XWindowManager.sh        |   7 -
>  .../x11-common/xserver-nodm-init/Xserver      |  25 --
>  .../xserver-nodm-init/capability.conf         |   2 -
>  .../xserver-nodm-init/emptty.conf.in          |  77 ++++
>  .../xserver-nodm-init/gplv2-license.patch     | 355 ------------------
>  .../xserver-nodm-init}/system-xuser.conf      |   0
>  .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
>  .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
>  .../xserver-nodm-init/xserver-nodm.service.in |  13 -
>  .../x11-common/xserver-nodm-init_3.0.bb       |  73 ++--
>  .../user-creation/xuser-account_0.1.bb        |  30 --
>  40 files changed, 358 insertions(+), 976 deletions(-)
>  create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
>  create mode 100644 meta/recipes-graphics/emptty/emptty.inc
>  create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
>  create mode 100644 meta/recipes-graphics/emptty/emptty_0.15.0.bb
>  create mode 100644 meta/recipes-graphics/matchbox-session/matchbox-sessi=
on/matchbox-session.desktop
>  create mode 100644 meta/recipes-graphics/mini-x-session/files/mini-x-ses=
sion.desktop
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-auto=
login
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-sock=
et.sh
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-star=
t
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.serv=
ice
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.sock=
et
>  delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.w=
eston-start
>  delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-=
start
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X1=
1/Xsession
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X1=
1/Xsession.d/13xdgbasedirs.sh
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X1=
1/Xsession.d/89xdgautostart.sh
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X1=
1/Xsession.d/90XWindowManager.sh
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xs=
erver
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/ca=
pability.conf
>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/em=
ptty.conf.in
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/gp=
lv2-license.patch
>  rename meta/{recipes-support/user-creation/files =3D> recipes-graphics/x=
11-common/xserver-nodm-init}/system-xuser.conf (100%)
>  delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init/xs=
erver-nodm
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xs=
erver-nodm.conf.in
>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xs=
erver-nodm.service.in
>  delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.=
bb
>
> --
> 2.53.0

Hey Paul, have you gotten a chance to review this series yet? I've been tol=
d you
may have some comments.

Randolph

