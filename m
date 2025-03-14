Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306A0C35FF7
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 00:30:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2835.1741912215431827452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 17:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=irShwXGq;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0TuEX1479203
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 19:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741912196;
	bh=BZKOcYj1YR2+w10LFQJ1e1JFw1r4uMA85oj0Ap0TdcE=;
	h=From:To:CC:Subject:Date;
	b=irShwXGqCSqtyzaLBp4ZEWebwZDd6aVxVJbhLu26jgv0tqBo84zPRh3Gz/+wC2pNd
	 CiYwpEwgeIoBwL38hFT414VBnBvcMm2eN+xt9qSOjvVFzdK+YT/Q046auQ+DoVBzBm
	 BvmF1OX4NTfpl1akjbCKGA/DQRUD95z6abXk0zbQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0TuS0108693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 19:29:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 19:29:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 19:29:55 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0TtAv061940;
	Thu, 13 Mar 2025 19:29:55 -0500
From: <rs@ti.com>
To: <otavio.salvador@ossystems.com.br>, <alex.kanavin@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][RFC 0/3] Display manager proposal for x11 and wayland
Date: Thu, 13 Mar 2025 19:29:32 -0500
Message-ID: <20250314002937.672768-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 00:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212814

From: Randolph Sapp <rs@ti.com>

Example implementation of emptty for weston-init following the request on the
previous RFC [1] and previous example [2]. This variant is applicable to master.

This packages emptty and a default configuration for emptty as "emptty" and
"emptty-conf" respectively. This allows the existing init packages to override
the configuration similar to the way grub boot configs are handled.

The weston-init package still handles the weston config and weston user setup as
it always has. The only real difference from a consumer standpoint is that the
autologin group for the weston user changed from "wayland" to the more generic
"nopasswdlogin".

[1] https://lists.openembedded.org/g/openembedded-core/message/212640
[2] https://lists.openembedded.org/g/openembedded-core/message/212785 

Randolph Sapp (3):
  emptty: add version 0.13.0
  weston-init: convert to virtual-emptty-conf
  default-providers: set virtual-emptty-conf

 .../conf/distro/include/default-providers.inc |  1 +
 meta/recipes-graphics/emptty/emptty/init      | 26 ++++++
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 +++
 meta/recipes-graphics/emptty/emptty_0.13.0.bb | 80 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston-init.bb  | 61 +++-----------
 .../wayland/weston-init/emptty.conf           | 77 ++++++++++++++++++
 .../recipes-graphics/wayland/weston-init/init | 54 -------------
 .../wayland/weston-init/weston-autologin      | 11 ---
 .../wayland/weston-init/weston-socket.sh      | 20 -----
 .../wayland/weston-init/weston.env            |  0
 .../wayland/weston-init/weston.service        | 71 ----------------
 .../wayland/weston-init/weston.socket         | 14 ----
 12 files changed, 206 insertions(+), 219 deletions(-)
 create mode 100644 meta/recipes-graphics/emptty/emptty/init
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.13.0.bb
 create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autologin
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket

-- 
2.48.1


