Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF606CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:31:41 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.722.1758231091638322827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vkCcD7UX;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58ILVKwk096281;
	Thu, 18 Sep 2025 16:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758231080;
	bh=8CZxCRDwYKF9QaXR84LQ0/c94G8GTEFYbxmsYWJ1LXc=;
	h=From:To:CC:Subject:Date;
	b=vkCcD7UXhP1JqHvGO37f6qXLsY7+hB75DlDU9ezlHAmUlj/+cbo+E+gpEYl/Ge++i
	 8JxSV2wT5QE/byci509eufpM1wJ0gBKStLejDcn2ia9ZTEM5U+ss4RDY/VcSsS586P
	 EolHNmOQuWRa3opCtDBy0vCwm9pPn5wOEKcD6H2A=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58ILVKpV2647593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 16:31:20 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 16:31:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 16:31:19 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58ILVJjN1220031;
	Thu, 18 Sep 2025 16:31:19 -0500
From: <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv8 0/6] Display manager proposal for x11 and wayland
Date: Thu, 18 Sep 2025 16:30:43 -0500
Message-ID: <20250918213053.339280-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223686

From: Randolph Sapp <rs@ti.com>

We've recently run into some issues with weston-init attempting to start Weston
prior to all drm devices being registered. There's not really a good, scriptable
mechanism to listen in to device registration events that works with the
existing weston-init package. Well, at least one that doesn't involve polling
files or introducing more dependency on the init system being used.

I also see there is also a lot of scripting around starting X11,
xserver-nodm-init, that (from my limited review) should experience the same
issue.

I'd like to introduce the following display manager for oe-core, emptty [1].
This display manager is, as described upstream, a "Dead simple CLI Display
Manager on TTY". It supports both x11 and wayland sessions, with togglable build
parameters to completely remove x11 and pam dependencies. It's licensed MIT,
which shouldn't be an issue for any users. (It is written in Go, if you have
opinions about that.)

With this, both weston-init and the xserver-nodm-init packages can be re-tuned
to leverage this display manager and simply add a user and emptty config for an
autologin session. This can resolve the current behavior across init systems
without additional scripting, and move some development out of this layer.

This lists myself as a maintainer of emptty as well as xserver-nodm-init and
xuser-account since these are currently unassigned and I've reworked them
significantly here.

Sorry for the delay on this series. I found a few bugs in emptty that I wanted
to address before submitting this officially.

[1] https://github.com/tvrzna/emptty

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

Randolph Sapp (6):
  libx11: create tmpfile dir for x11 domain socket
  go: fix sigaction usage on i386 platforms
  emptty: add version 0.14.0
  weston-init: convert to virtual-emptty-conf
  weston: remove deprecated weston-start scripts
  xserver-nodm-init: convert to virtual-emptty-conf

 .../conf/distro/include/default-providers.inc |   1 +
 meta/conf/distro/include/maintainers.inc      |   6 +-
 meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
 meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
 meta/recipes-devtools/go/go-1.25.0.inc        |   1 +
 ...ng-cgo-on-386-call-C-sigaction-funct.patch | 248 ++++++++++++
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
 .../weston/systemd-notify.weston-start        |   9 -
 .../wayland/weston/xwayland.weston-start      |   6 -
 .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
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
 meta/recipes-graphics/xorg-lib/libx11/99_x11  |   1 +
 .../xorg-lib/libx11_1.8.12.bb                 |  15 +-
 .../user-creation/xuser-account_0.1.bb        |   3 +-
 39 files changed, 581 insertions(+), 918 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go/0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch
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
 delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
 delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start
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
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/99_x11

-- 
2.51.0


