Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277ADD73EA5
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 23:02:33 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28659.1769727752392706471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 15:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BFZaB0YI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.0, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVfwTzdUyuHKOtImJAn93xNdiQWRnmb7MJsrVnbwUHFfC02LTQCC1K36ATu4UTigxMoO/+PLF8CXN42gtf25oHOPA6oOy42ZCsZNeVQzdN6RqoxG8EMpuaSuKklVIdXs0mYo7kd4wXBrfUfVHEX9XXadyS4tp8/T9Y7uLQ6DKvCslBdbBBSKT37Yz3JtbN5BejurTDbgD2CzOYqkI2UT1FgTLafmnAbsA09f+LZ/uFiH6iOjJ9XVYL4Hx3MySr4FsShAPcVUji0wfRvsU2LUESAyeRs++u7s8RWeKMvJjQJpPCf2L2YpKkBrOmlDnhz/un6E7zJoyOgW2EdDPYsXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tZntWrL5bHYZLqRwQveHViIunVdQpSO90A5/KW+JK8=;
 b=OYA6OWulsYQljOGhe9fLkPEs9kGvtQQfAxfG1i7DbiuPvzbAJcm7uKFMK21sgVK0cu2v+aePO1cvFiDZkOyzn16R9Nw9xq6Geo9Vz9y2Ywxyph50uXgubbZ2XewsJfDA81QBi9DagszKtOOtI4YjjyYrjUT7ZLMOOcRp74E3HR9qXeiqFGfdo7A7FgQaBn9RLTGu1HVe8sAMHF4XG/Vz7fCr3Y/Ad4Y4boA0WXQnOSZ+Xnv6mgFm2+O1ruBqY+PR46U6RD4NfQH+zfWgtWopmFH3naf/OnnFFLEySK1k1HEh/3aVNB95X/8ynRufbiKJnZb0f5Q8QNKfJpLQp8TW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tZntWrL5bHYZLqRwQveHViIunVdQpSO90A5/KW+JK8=;
 b=BFZaB0YIC4KFlACK6z777RtO2AB9/25BcmVkwPsI8EJxhPPKJV/Z+/lniLATWER+nVfmR+fAiBJFqWmYygvtqsjLMgn47MGtazCn2sqzty9cXucdncuBMEsBj7q4nBz9ftl9CM8+k35JF/mxFLC97t4xpaQlQuTC5VW3/faWNoM=
Received: from BYAPR11CA0097.namprd11.prod.outlook.com (2603:10b6:a03:f4::38)
 by IA4PR10MB8375.namprd10.prod.outlook.com (2603:10b6:208:560::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 29 Jan
 2026 23:02:28 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:f4:cafe::b0) by BYAPR11CA0097.outlook.office365.com
 (2603:10b6:a03:f4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 23:02:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 23:02:27 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 17:02:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TN2QPF713167;
	Thu, 29 Jan 2026 17:02:26 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>,
	<a-christidis@ti.com>
Subject: [oe-core][PATCHv14 0/6] Display manager proposal for x11 and wayland
Date: Thu, 29 Jan 2026 17:02:04 -0600
Message-ID: <20260129230210.2934333-1-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|IA4PR10MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f928b9-7afd-44fe-e002-08de5f8a7959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+WWMw0O+PjgQGqc7inPPb2hnOCJTZQuHjLLBklzlydHa9q/i8kCvqDlC+TI9?=
 =?us-ascii?Q?tTvUGVvV6qhEKg8lv82gyn1/zCqham7TG0xXhQoHdw2CSWS7yGwX/pqHJPc2?=
 =?us-ascii?Q?NUo9u7ThFMUdgqpP5hxoDcBVRZDRmx6eN7tUUjQYm0YE5iN4KDHnGYVbGbkc?=
 =?us-ascii?Q?3z3m/TU7sgy/NeoqOBp2NsUk1hJKaWOzLi9YDaHrwMKrszR7ZTkcRYagVif5?=
 =?us-ascii?Q?mYbHMOeXXhLddFus1hCnKg8rrFb1tNPJJ4A+c4QuasxpmJn2RD/XblOoTaWD?=
 =?us-ascii?Q?V4GBNSAJtXKvIE9H3Zg6l/K9J3UnpoE9bIHpJQa9XljCcVm5rhhz7IgrEr/v?=
 =?us-ascii?Q?+YKZNGsESiEoYZyEZG0jorLkDTqKo4ii1EZnWyfr4Nzm+OpdVGRxLMZeAnv4?=
 =?us-ascii?Q?ErPWUysGerr2650X1p29E58nuYUgptYw1fUnWclEpVu0PphhNC2CGMTGr4iN?=
 =?us-ascii?Q?2MF35rXUouGalamDnb78T6ugjRYUdPJic/0dDY/lHqcIkLVMwF/G4/xKayNN?=
 =?us-ascii?Q?85yRRlasTpYrBVMFKMZ6YksnuCNVEcQkh59ULbGv0lx304uA6m/rH2n+lckK?=
 =?us-ascii?Q?76L9uctCMeLd2sfEaNj4A0vHpPq7arCKX0CSel4mAIdafmnEJ9X/UTkREKtY?=
 =?us-ascii?Q?EwjFxiSVR2CD8lYZz6GX1CpTkJcOdg6HbeIJSRezhhCe+yKD5Efu7nu3eHEt?=
 =?us-ascii?Q?vZAFHRAfrAlaIDPVMc1dWnK4ISni2OORUwNvOho1vdTwYd4/2BuCOXjhDTH6?=
 =?us-ascii?Q?K3JhYDwLfcFb+7/ms0//VN26DIsnWW80IFGRNctD/mfRM+sC1Oo6fGUGRVqK?=
 =?us-ascii?Q?Jl7e4sffJ1rQiRFyrwz2qjw51atb5FeBHeoUhRdJZjBc2Y2dkYYlvJzoBtTv?=
 =?us-ascii?Q?KgUleMuh6MUZvMHMXFi/f6k046hcNf/dKOvuMvi4qx9bqKdnXthPrfnAzhVD?=
 =?us-ascii?Q?hqB9W6L7kg6b4FhQpj2NQ78Na37+izZKLVJ+EYy+p7fMt42t6O/iX0mbQTGO?=
 =?us-ascii?Q?UHNghl/JL6rx+ZZ3RuT9YcAH0xhaa0nMY8k4IG0X4p3XDfA4chmS3EkpmVSL?=
 =?us-ascii?Q?kJfYfWTT6deehqbU0D8bahC/zvW6RwJ1o3lKI3u/VE5N3b3gSi7MM1IAq0Ll?=
 =?us-ascii?Q?Cya+jQjddwGVm/gvRPKOPZi/zwYSU1rqduDYTy9iOKrivUA5YdUA8FY7PEj1?=
 =?us-ascii?Q?33BU38IROxuDmc1mz45K7T/WMh8KKfX0k7C7CkgTS6uRy0NlJijT2X5bWDxS?=
 =?us-ascii?Q?xJS/WnuQ8tXN/u2lt8zLuwpInE7PkB3GE3XGzJmC7s811og0cpcJW3YU1alG?=
 =?us-ascii?Q?btDwsF7ZIHD1K1pnCkN8evEdfWY5SanRS3b6EAidtoSWct+U7h6dtC+Y7ily?=
 =?us-ascii?Q?AYN1DDHWh87CEeSb42+TS4B9ht3do1z01Bm8lTAYudKPvGb8IFIfRWy6EDry?=
 =?us-ascii?Q?aIicQJoXQq4r/8wEMMpCphuh17TPUoo5vcdq0XiT+npf0HYR6M1lFt5sY9MW?=
 =?us-ascii?Q?B/nZahDnQ6h3dFfSWvjgiRE4Ms4jruMD14F4efcbZejCGQGW4xqldA6g/d03?=
 =?us-ascii?Q?tMEilV9ITeGStlMImPs04h/v4ZKZB5XJ3NXhm8uh1E6QrKgFGhm2/w6kiQeF?=
 =?us-ascii?Q?HGXOK8bNFli5gWvhcc0ltulFk4YZLRaJbB33Y02VKMPf?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Z0i2rhLjQ/RA0I7H75mSPl6Zg9bQfe2+nPg/hBj8ZET7VXinUbeC3hwCVq6VbWpEm8zhKfY9FGEqQ4uQV4+hVm1ZiRuypkzqQPvx1Nwb8WfBzkPB/qqYHl5bZ1+Bv5CEpqqp+d5UqKUADOaoZQWAdOPimtZtXpYuYS7mR9Qf8C314lrtKq89H69xPj0f38cfCAt+Vmb+bR9phUCvkdfw09Hb+0ZWQIo5E+rQ3iy8+ougkfTNMfzK7sEwJJ2Cklsgcu8Odb53WOQF37+n10k3Yt5uiSp5t1DQrEO5fJFX6Uk4nP12sMOhPj5VfvDdsCWlb7rwCCYaI/Lnfv8kkDfi0GIJeg7BBMRqbcQR+sDMlw+w/joj5KpOzJvC1xzc8QUyU+AbNuq01OTxS6C7YSmYjLbpaZ2VTend0/Yr7G//9W3G9I5KsF8QtJjmP7zkXMLO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:02:27.7955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f928b9-7afd-44fe-e002-08de5f8a7959
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8375
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230165

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


