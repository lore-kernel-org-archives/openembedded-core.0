Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E30CC3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 20:32:03 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.128.1746217918461056248
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 13:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bbIJbxTe;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542KVdlE3941849
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 15:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746217899;
	bh=uIVP+rgHsFwbWt7k8LWSB58raO3IW9qo9VQCofZtSYA=;
	h=From:To:CC:Subject:Date;
	b=bbIJbxTeQlotbjvan22LYU5oWegUCuoWzy2/KZW/Q+4eS5WsHxIG4wPM2vyYMRVfa
	 4mWJkw5JJ+CnjXGM5SiLjrwYkACm+CeRKJJ4EkZFn3JAnbXN/B21fG7/Qa0Z5H8h94
	 aB9rxMt8ZIXcNOSwK6/jq8lA+O8oadLFp3E7BbUw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542KVd49107078
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 15:31:39 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 15:31:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 15:31:39 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542KVdGH126709;
	Fri, 2 May 2025 15:31:39 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCH 0/3] Display manager proposal for x11 and wayland
Date: Fri, 2 May 2025 15:28:38 -0500
Message-ID: <20250502202840.3148565-2-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 20:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215925

From: Randolph Sapp <rs@ti.com>

We've recently run into some issues with weston-init attempting to start
Weston prior to all drm devices being registered. There's not really a
good, scriptable mechanism to listen in to device registration events
that works with the existing weston-init package. Well, at least one
that doesn't involve polling files or introducing more dependency on the
init system being used.

I also see there is also a lot of scripting around starting X11,
xserver-nodm-init, that (from my limited review) should experience the
same issue.

I'd like to introduce the following display manager for oe-core, emptty
[1]. This display manager is, as described upstream, a "Dead simple CLI
Display Manager on TTY". It supports both x11 and wayland sessions, with
togglable build parameters to completely remove x11 and pam
dependencies. It's licensed MIT, which shouldn't be an issue for any
users. (It is written in Go, if you have opinions about that.)

With this, both weston-init and the xserver-nodm-init packages can be
re-tuned to leverage this display manager and simply add a user and
emptty config for an autologin session. This can resolve the current
behavior across init systems without additional scripting, and move some
development out of this layer.

This lists myself as a maintainer of emptty as well as xserver-nodm-init and
xuser-account since these are currently unassigned and I've reworked them
significantly here.

Sorry for the delay on this series. I found a few bugs in emptty that I wanted
to address before submitting this officially.

[1] https://github.com/tvrzna/emptty

Randolph Sapp (3):
  emptty: add version 0.14.0
  weston-init: convert to virtual-emptty-conf
  xserver-nodm-init: convert to virtual-emptty-conf

 .../conf/distro/include/default-providers.inc |   1 +
 meta/conf/distro/include/maintainers.inc      |   5 +-
 meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
 meta/recipes-graphics/emptty/emptty.inc       |  26 ++
 .../recipes-graphics/emptty/emptty/emptty.tab |   1 +
 meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
 meta/recipes-graphics/emptty/emptty_0.14.0.bb |  53 +++
 meta/recipes-graphics/wayland/weston-init.bb  |  61 +--
 .../wayland/weston-init/emptty.conf           |  77 ++++
 .../recipes-graphics/wayland/weston-init/init |  54 ---
 .../wayland/weston-init/weston-autologin      |  11 -
 .../wayland/weston-init/weston-socket.sh      |  20 -
 .../wayland/weston-init/weston-start          |  76 ----
 .../wayland/weston-init/weston.env            |   0
 .../wayland/weston-init/weston.service        |  71 ----
 .../wayland/weston-init/weston.socket         |  14 -
 .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
 .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
 .../X11/Xsession.d/89xdgautostart.sh          |   7 -
 .../X11/Xsession.d/90XWindowManager.sh        |   7 -
 .../x11-common/xserver-nodm-init/Xserver      |  25 --
 .../xserver-nodm-init/capability.conf         |   2 -
 .../xserver-nodm-init/default.desktop         |   5 +
 .../xserver-nodm-init/emptty.conf.in          |  77 ++++
 .../xserver-nodm-init/gplv2-license.patch     | 355 ------------------
 .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
 .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
 .../xserver-nodm-init/xserver-nodm.service.in |  11 -
 .../x11-common/xserver-nodm-init_3.0.bb       |  57 +--
 .../user-creation/xuser-account_0.1.bb        |   3 +-
 30 files changed, 297 insertions(+), 885 deletions(-)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.14.0.bb
 create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autologin
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/13xdgbasedirs.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/89xdgautostart.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/90XWindowManager.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch
 delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in

-- 
2.49.0


