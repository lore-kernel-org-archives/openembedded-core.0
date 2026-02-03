Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3A2E73143
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 01:21:11 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6847.1770081662671428572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 17:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ggR3Snbx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.47, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZkfCp2tjA+DqRqjkm3enJPnFNRl6EK8CD1jeXHVr5I3OlOYmEPXpBKUarEKn/LPGAVHpt4lg51ATyfVQh7PwhSEAVb+ZhZWJJWVh6DE1xwsfl8ZuJNP9g3LV9XoW3/4dd+2UdEo5uaK9+rtAEoDITLCjyCuEDo8RYmxWshts9Wv92ytg1rFHkYEDy/W9KYQDsx5mJUFNFYTs958vu8jACpxOpciii8pxRtNgUb1kvrH/AvtR1ay8CCk3qJPAOLmKEWPHmJJqyUqI71rkQoAVKqC8RJpoYyvOxlenXtU9moLpyJZALUXlZJzTnKy+kMOIq3+y7ApT7aIvLvlri2qyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLqSTewUbS3qK/KGkeHSewHhOkF88oc8XkIbxv1knCc=;
 b=iPSJnBMu9AukDsghLXL7Jz94R12CAyWmECQ/wDVCzxWn559zVH/xLwz8UttMIVMzKGCI5w2c8ytht1O+vsfjpDW6EqaZwHw3by7Snfugy1xU14xn34eV50SZ/Dd3Di69OQePk5KvaowfCtInfg1vlMIr5I5Z9b0Zmv8JJBKwDQ5k4MOaaQp+g9t2+q7GQhgUpA4hDqk2s3LJF6oFNVHikIUe++N41kIGEQt7Zlo7XEaPQt1NzxnqCq8U/K7YHMUOSy/WC1txphkRcG9bPPrq9dJORkFrydAuHAHPJVS+pGOHwLYW3lE6OQ4ayZL5bBQGUaF8PR/RdsSbbNLTxggXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLqSTewUbS3qK/KGkeHSewHhOkF88oc8XkIbxv1knCc=;
 b=ggR3Snbxq1VRFdhPbRKzxzVxHHPpkvD17bkzQDazTlSw5ngV3j4IDllRqIneuFu/uTmaPpjK3nCuuiP3YCMuerbsCPXDFYqWBqVHfrtRbTxnS4fBrLhEGC1NufK2kCJehd21GY3s8rugVrci4gBgxMEoruXm+xUK1KBRGLMUw/o=
Received: from SJ0PR13CA0235.namprd13.prod.outlook.com (2603:10b6:a03:2c1::30)
 by PH0PR10MB4776.namprd10.prod.outlook.com (2603:10b6:510:3f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:21:00 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::93) by SJ0PR13CA0235.outlook.office365.com
 (2603:10b6:a03:2c1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 01:20:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 01:20:58 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:29 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:20:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131KTrU3095493;
	Mon, 2 Feb 2026 19:20:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv15 0/6] Display manager proposal for x11 and wayland
Date: Mon, 2 Feb 2026 19:20:22 -0600
Message-ID: <20260203012028.4008229-1-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|PH0PR10MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1d409c-9755-4e92-fbf0-08de62c27c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zkNNi1GGsElJVV287/dpIsjldnxntw/jNPqcX7JcdefFv84vsQ+cH9yVXtJD?=
 =?us-ascii?Q?LRPha+TGoX1prOrHKgzbl9lwzxJ+e7eONlvkg3G4TCGLAcYlpIgHo9ThGeyv?=
 =?us-ascii?Q?lTBtAGTY8vbpqIfycFX6BN6rRcmAYt7n72k9hSOZ12XiyQWFdDBd2zxNfhXR?=
 =?us-ascii?Q?N/3sWgyRhXYANFSlUe9k+ILd06eJBK3n2FmajcwHLGZdiQW9vHBmUqF1cGZl?=
 =?us-ascii?Q?wDpL8e3lnrbNenam2W5nP3STjvtfiVNs15cKTQX2ZryNK4KoW7iPNLgEKZTd?=
 =?us-ascii?Q?6FOee4hbZ4i6AoI87T/hSM1Uc3phe2PDRFgCjGvtC0z5f9nimXly/VYKm0+5?=
 =?us-ascii?Q?l506gXCOi4HAXEgFwsw7IpEOqPkhXOHpGvJaO8o2wlJaVtQ1T67Bv30ZPPGQ?=
 =?us-ascii?Q?8MGI82jHFLM/frRwUkuASPGVUbdSFmYflKH1Nc9K/TlBZDFXpNj+T9jAwJkK?=
 =?us-ascii?Q?mCwR6kA8p16FYUnJdLq6i2MVdUoySyvASD1clEkdoW8v9a2D3xTkvlcBgus/?=
 =?us-ascii?Q?s06tH+lbW9bwrm8hJoE/CjhJuPpi3FsakwBfPzRqblY5bzbBIIs2E/glhDif?=
 =?us-ascii?Q?DHosLg1EJJ9jPwCPPb9U0AAaTszj4QO4hy2TpWURYOGSUhmqpkJqFJAkv0rO?=
 =?us-ascii?Q?IdT6ZwArFpXnFN8O0DAlBUFYCjlT6ngdmBqMuR+d976LFuVdFF9YEjwBcRJ+?=
 =?us-ascii?Q?EGVZrhbSH2MHfkZgkStNAgEjLkSSFJgsWGjNCJBct5qZr3tyfFpNQy2nY990?=
 =?us-ascii?Q?I7nId97kavgepykyboj5gT815fbYbGdu6PsseD9k22WPbllqghiLJKeOe/Lb?=
 =?us-ascii?Q?BLcWxehSJ0rtVst4JRnmBWqdgkZ6HN9owaRG4zGizLm7T43DCa0/3P9Hw8dS?=
 =?us-ascii?Q?h2bzN16RHywG0nVaIo52ln5kc1Tf0cMyAa2VoUL2amKAKz+kXndcHlddZWlm?=
 =?us-ascii?Q?W7FbuM7I9MuYo4h12BiLpzettE5VR1qSBMdnT+1pXBNxv+PeHkYNp5pdkgKq?=
 =?us-ascii?Q?Zjn/GQENu90uR6fiNrBHfkSzyg00MsZY5CP/fO2H1H7g/isd/xMVsrUhKyYH?=
 =?us-ascii?Q?QbZDT0jne/juJWu6pehjdUUpogwj9apu7upspAh6ktToV2khCTm8kREYzuCq?=
 =?us-ascii?Q?SuswQMupM07flowMxqvO6CeUhu6J49qcdpvhWBijrzP+r0aREgVDpho9+qjW?=
 =?us-ascii?Q?dI/qeANAimFbC76WiU6Cyxljd53I7rXBUDNf39O7y05mJIjP8EQOB+yn/M8b?=
 =?us-ascii?Q?aPMXuayW4k209/JITJ+cCLFafaS9vN5dI3eDXwwIxiGQ0S36FgvRGHAO1uy5?=
 =?us-ascii?Q?8yyTe9kRU/rOrkVauZMIQDw0zn5c78qh+2wER6Poy0dIgmuZOi6yeeTsTL0E?=
 =?us-ascii?Q?LjBzWXSBhTXwTqWELZo9G4AwAPjmgRrWUS/wF9R5B8GREh/8pH3kSRl73PWa?=
 =?us-ascii?Q?zFe1EBNEz2sPwaQKkbwns8YkmiZX09KMdMafdGYZXInkMz4JEv9v+3/XeWqv?=
 =?us-ascii?Q?zEiIt6KY75o4UA3t8mSdHeQwEs9zrVI4ok3LejqBhtTCvAhSQVNA1tYx02qn?=
 =?us-ascii?Q?NSEPASTeQMZum+a3nasssobJVJTo1FdhrPKChE/0mR8hgwzC3p3Er5cMlvsp?=
 =?us-ascii?Q?gCXFG8zCXoXlCNXYXYg03OMZPK0mmCiVz/DgFscHVJnW?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pbZHtoLPZCa7tZwCyvHrbWFDO0fK/GnIju5B1lDBZxBR4HDogrUlsn1Vgd2kBpZn4YY38HMZzBXXtVpUxOo/Q9VwFTNSdqn+WsNQv7TxLRJmPUa5Cfy8ZqXHZQzN7jRbTyh8SrsA18gQFNTLfkg5sFgHtL9EBMQ4DdFtVO3AI4bNXvw4+eJxVXh/3YBoJ+1iA/oav8aKLvBeEUcX+qjp1EECCbDSSaWmT4xNamuC0ccWJq9NA0GDPCuB1wtANvnMryrhDEXZUOUyqwGHTFSewbiTO8kmh3TK5P5fjuqdELX7qmidiSGZ/aj4LJ/3vT+qCtJ22sfmTwMijDnYHXn/HejjeMisp7dJ3RSSBL5d2ERpIlanC83AcNh7fKsIxm/ZxpjmXqLh+Au8/o65h5TNKEnuHl7jxImoWWv382+3I8HzvSXuA+WHvq0RR5CIilcX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:20:58.5397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1d409c-9755-4e92-fbf0-08de62c27c97
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4776
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 01:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230413

From: Randolph Sapp <rs@ti.com>

Alrigh, now that cgo binary reproducibility has been addressed this should =
be
good to go. One slight change from v13, I replaced the inittab.d entry with=
 a
rootfs-postcommands function since busybox-init doesn't support it.

Information from v13 follow:

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
 meta/recipes-graphics/emptty/emptty.inc       |  25 ++
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
 40 files changed, 356 insertions(+), 976 deletions(-)
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

--=20
2.52.0


