Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4ABC3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 23:39:25 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1632.1747265957118110645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 16:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vl7r3YZn;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54EMAB593529244
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 17:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747260611;
	bh=Ob1mMq5vPX60sifH249pzD9qp8BndOApDyFOoVAfjBk=;
	h=From:To:CC:Subject:Date;
	b=vl7r3YZnc70qoGy/VS9v0moFLe7UrHR7r5bvSqVz6lf9GHSBkE6j8/e+joPHAxsiO
	 RFSH8FO3fQEz0K1m65pUJxQQMKe3jcplNAzDRND8KiH9XS64nBTutCWFxGrmhgbQNg
	 rU4G+gNuVDQJwMr28WOE/0EX/QM9UQBcRp3M/snI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54EMABmL018396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 May 2025 17:10:11 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 17:10:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 17:10:11 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EMAB8v037558;
	Wed, 14 May 2025 17:10:11 -0500
From: <rs@ti.com>
To: <mathieu.dubois-briand@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv3 0/3] Display manager proposal for x11 and wayland
Date: Wed, 14 May 2025 17:09:21 -0500
Message-ID: <20250514220924.2644712-1-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 23:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216560

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

v2:
	- Address spelling issues in commit messages
	- Attempt to resolve some test related issues with weston
	- Add additional logs to X11 related tests
v3:
	- Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When running
	  under QEMU the first auth attempt almost always fails.

Randolph Sapp (3):
  emptty: add version 0.14.0
  weston-init: convert to virtual-emptty-conf
  xserver-nodm-init: convert to virtual-emptty-conf

 .../conf/distro/include/default-providers.inc |   1 +
 meta/conf/distro/include/maintainers.inc      |   6 +-
 meta/lib/oeqa/runtime/cases/weston.py         |   2 +-
 meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
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
 32 files changed, 307 insertions(+), 886 deletions(-)
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


