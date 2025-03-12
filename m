Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077F5C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 20:15:48 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.5250.1741810540511024719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 13:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jHkU83jc;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CKFV8W1676982
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 15:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741810531;
	bh=8+Wk5p0I+ygQSgdm45G1PMheoNUgGqoFlolS+au78hs=;
	h=From:To:CC:Subject:Date;
	b=jHkU83jcua8ix0OPF8R1OpemIFYLaJIop+lQJknC4IS+x7cEBLmvuwcKOixuf7KuT
	 1MYMqc7jeojZXljz4j5gHnbEdJXcTJh6moZDkVKMyyr0hobAHKOS6+lngZPmrfCvk3
	 9tH01LcfPffEIPAqWcpmLBTF16X73N+gIsrkctU8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CKFVBx033141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 15:15:31 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 15:15:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 15:15:30 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CKFUNE013021;
	Wed, 12 Mar 2025 15:15:30 -0500
From: <rs@ti.com>
To: <otavio.salvador@ossystems.com.br>, <alex.kanavin@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][scarthgap][RFC 0/2] Display manager proposal for x11 and wayland
Date: Wed, 12 Mar 2025 15:13:15 -0500
Message-ID: <20250312201316.1060199-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 20:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212726

From: Randolph Sapp <rs@ti.com>

Example implementation of emptty for scarthgap and weston-init following the
request on the previous RFC [1]. Please forgive the fact that this series is
targeting scarthgap and does not currently apply cleanly to master. Considering
this is still an RFC and I have not refreshed my sstate for master I figured
this would be the fastest way to show a proof of concept.

This packages emptty and a default configuration for emptty as "emptty" and
"emptty-conf" respectively. This allows the existing init packages to override
the configuration similar to the way grub boot configs are handled.

The weston-init package still handles the weston config and weston user setup as
it always has. The only real difference from a consumer standpoint is that the
autologin group for the weston user changed from "wayland" to the more generic
"nopasswdlogin".

[1] https://lists.openembedded.org/g/openembedded-core/message/212640

Randolph Sapp (2):
  emptty: add version 0.13.0
  weston-init: convert to virtual-emptty-conf

 meta/recipes-graphics/emptty/emptty/init      | 26 +++++++
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 +++
 meta/recipes-graphics/emptty/emptty_0.13.0.bb | 78 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston-init.bb  | 59 +++-----------
 .../wayland/weston-init/emptty.conf           | 77 ++++++++++++++++++
 .../recipes-graphics/wayland/weston-init/init | 54 -------------
 .../wayland/weston-init/weston-autologin      | 11 ---
 .../wayland/weston-init/weston-socket.sh      | 20 -----
 .../wayland/weston-init/weston-start          | 71 -----------------
 .../wayland/weston-init/weston.env            |  0
 .../wayland/weston-init/weston.service        | 71 -----------------
 .../wayland/weston-init/weston.socket         | 14 ----
 12 files changed, 202 insertions(+), 289 deletions(-)
 create mode 100644 meta/recipes-graphics/emptty/emptty/init
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.13.0.bb
 create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autologin
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh
 delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket

-- 
2.48.1


