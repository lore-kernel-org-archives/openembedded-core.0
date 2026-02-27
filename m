Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21421FEFB78
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 18:32:04 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.102.138.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103222.1772217116940797532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 10:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Xt33QjP0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.102.138.16, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/i2QzQuLRlu09GHpD4w5cI8zfG9CJOwu3I/xpbt5ZT566uqYVv1O3I1IZJuNOYgc0F7+KK7Z2m1AkNF8tPxeB1MmUBRfYMgw2+B/vj24ClNsJUxpLlD8DbgqRZ2xy2D67zesx6UXOTvvb7oDe1n2UPe6x8wb++wUThb4iRSDc48Caoy341gDAjmpzurgXVn0bmU0P7ys4+U3UtlSw482nVeKKdW8+QUUJKBj4AiFgMxdLLSwytQIgXhPJZ5B4sstue9ONl7q1NKMCbgtwlfDABzwm42PjJK+GsmY6LpoIqIbW64H4p2n5XJzDMj0pU1mm3hawOLRQClAqFt1Zf+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lHodY3bCv2zqPcYMtlTMDbOhuobmivwQ9f35tvleNY=;
 b=wjRvpbPgOKrkdhN9RABPfHUZxwUtavqNzxb9hBX9nAB/PXmpaGOSiFxY8BNcW7nBjTq87yn0B+xmOMlHrrbQmTN8Pk0Nz9bzPMryCDGgX0w8e3Y7x9SRKHNP97woB8Cp9yYpR7cOpHNIUvYQhKLrDM/sdpmRq/09yAdh4Z4/6R7Jo+3U6mCT/9lHeBS7Ym2TZnl/FOy37Q2jZz/pV/hozwFgcvcdQxlrY1OslfRobmbc+N4TzjmpfIS53T2W+o6RDDkD0e9EYLXguyQ182AGNOut8m17gm2rfgjVPJ1HPkpwH/rnti5MaCGTrCa8FercMOvjiv6dOkd1rICfvSAiGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lHodY3bCv2zqPcYMtlTMDbOhuobmivwQ9f35tvleNY=;
 b=Xt33QjP0afal/4qzjYKj00cICWI+1TEoJOy/fKsFe3+majs3tu1br3h1vRETB8Tnun5W9csylnEdM6OLV+quBoERH9oWIeXIXe+i5APow6PlyR93UhUsoL/vROdy5KhA5RFo2PQ20MGGjy83tOQERKW8l6Rgd7fR2mrnj8DsI/I=
Received: from SA0PR11CA0171.namprd11.prod.outlook.com (2603:10b6:806:1bb::26)
 by LV8PR10MB7798.namprd10.prod.outlook.com (2603:10b6:408:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 18:31:54 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:1bb:cafe::a8) by SA0PR11CA0171.outlook.office365.com
 (2603:10b6:806:1bb::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 18:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 18:31:53 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 12:31:53 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 12:31:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 12:31:40 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RIVeRV012242;
	Fri, 27 Feb 2026 12:31:40 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv16 0/6] Display manager proposal for x11 and wayland
Date: Fri, 27 Feb 2026 12:31:29 -0600
Message-ID: <20260227183135.64544-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|LV8PR10MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cef2fcb-d28b-4354-3fc4-08de762e7b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013|3613699012|12100799066;
X-Microsoft-Antispam-Message-Info: 
	PcObD2E6FeHUxAa0Usr40OgYgu5v2F57ulWL0f2ItnVLMJf5tB6qL7xW+MqU5tKhuL+lJ0zqAfVKjW0cB7ChEUm/uZFjUuRNFDmD80MxMwJ0G+eYSK9/jNq8OleYhof/PxhXzgCdxcDYeaDCoEOt+BYLrLmpTpTTASdp4jxz2fVMqbq9htuKxq9D8eE43o3acL2bM99YQ7nwDF6IztHDejfO8Dk1riGQTtLpuXZHOCMGipkdnyUyvxrCJSAjNtS7smdFC17Iz/38y48I1iuTtg4xhyT/YsxnTsGui3fuZX3kJKm1/vRNo22O4kjAMGGpUz3ZS8K/Rr/vo5aNO+QAqfuKuABvKcFCgZiwXdGxcaD70Hazzg0jJPq959a8WXhSg2rpj4HuURRzOiApPZBL+zLej1RUa5zpZYC0Bcmu0QoW802Nlh0Gt3w/jCNddhZiTzltZQi+jcJG/tdxZjOuhk9fA4plVLYc1Gjz5xrFR+lLwzyJDdOEkp8RpsV2Q+OnFchob/seOzBj9WwBgqAnw1Z6wBMyUpoVoKbMJ+JhboyeO2umGY0216/02jChmoZRMcuf0PszAOuvg0suno6G9UPcUGGGaSmRQHDjMd1gCs1f302STYQkdiDy6n1f6/xHSN8kGggdxJc70r8wknKqGpAwaagNXe1Xljig/Jq/hnuHHP0N224/z9ojCWMBq+JcsgoeuBrESns4S3VkfvLMGkrj5TxGruGMJUvBOGD8akwVeqsz/LAc47a6B+QNVPdnr3IXnztkvZYtJJUscdCmWh3/Ne0nSTu2k9nrlHO0+FayB2/BlIGBkWa1PZtpBWds
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013)(3613699012)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	baKgaoE4cWMNzsv3X74Bt7FkLAeyEp6/4NReN0d8KLY7naGL5j+Z7mfnHTgUspArQBZTqgbNRX6pe6IVPxEBrMJBsVCDP2W7ueP0qXtrNQXiTZ2KEHkaUk8w4XU84eHetdkkmJ47lTekucmvKtbeHxN2jVKwMRW4N7gmFFJ5MG1V6gNtPYOpPhP/tRDf1yLgzkUbkDTUEvvTCi+RWNn8aKEK019QTZVK+st3qs10o5b2DQoP/5XwDVjyEn8nrdwGuhpWfs4b5rso0wM2Hgy2cMccpAGjshSecXTGsOKUU9J0hlnLghV/Ych0drRbjemQyyFYtEqsR0CUIFCmCpqVd9tc8FjSYyfJ8aW8E0iNuFI+Kkz1pMyve7f9p1uQ5nhYwOZnsu0Gn4+cANSGGZs86BqC5l8GFF/Lwxim7Gb4J3x7aEg+kfQntqZfSDOW7Fz5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:31:53.8120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cef2fcb-d28b-4354-3fc4-08de762e7b18
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7798
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 18:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232110

From: Randolph Sapp <rs@ti.com>

No functional changes. Just bumping PR to help with automated testing issue=
s.

Information from v15:

Alright, now that cgo binary reproducibility has been addressed this should=
 be
good to go. One slight change from v13, I replaced the inittab.d entry with=
 a
rootfs-postcommands function since busybox-init doesn't support it.

Information from v13:

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
v14:
	- Move from legacy inittab.d entry that only sysvinit supports to
	  modifying the inittab file itself for both sysvinit and busybox init
	  support
v15:
	- Remind myself how POSIX shell "return" is supposed to work when not
	  given an explicit value
v16:
	- Bump PR to make sure caching isn't generating weird test results after
	  changes to source date epoch calculation method


Randolph Sapp (6):
  emptty: add version 0.15.0
  weston-init: convert to virtual-emptty-conf
  weston: remove deprecated weston-start scripts
  xserver-nodm-init: convert to virtual-emptty-conf
  xuser-account: merge with xserver-nodm-init
  xsessions: add unique desktop entries

 meta-selftest/files/static-group              |   2 +-
 .../rootfs-postcommands.bbclass               |  14 +-
 .../conf/distro/include/default-providers.inc |   1 +
 meta/conf/distro/include/maintainers.inc      |   5 +-
 meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
 meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
 meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
 meta/recipes-graphics/emptty/emptty.inc       |  27 ++
 meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
 meta/recipes-graphics/emptty/emptty_0.15.0.bb |  55 +++
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
 40 files changed, 358 insertions(+), 976 deletions(-)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
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

--
2.53.0


