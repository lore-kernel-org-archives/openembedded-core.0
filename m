Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAFAC7EE2F
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 01:13:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.10061.1686359635753602123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 18:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NzJ6iGej;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35A1Dn53071812;
	Fri, 9 Jun 2023 20:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686359629;
	bh=i78Y4TdDuQpeXXY6Gs+tIleBdBdgupgoW0CO1B+OZsU=;
	h=From:To:CC:Subject:Date;
	b=NzJ6iGejIA8WqN8HFqqLD/5oly9PNM4SxTxIIF+6v9wgvJqvBnqRYlxfcyeXpih5Z
	 KbKXCCqeOv66S/fqIYpETsB9PsW4e74XEPDhspJL4dxhpQpdASLcjnMqb2booKAhGN
	 nFzlhFfCJgywoLgN8eUxMPrPqjBEKbxq+aw3eRhA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35A1DnjP032340
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 20:13:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 20:13:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 20:13:49 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35A1Dnhi110838;
	Fri, 9 Jun 2023 20:13:49 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCH 0/6] weston-init: add extra config for weston global socket
Date: Fri, 9 Jun 2023 20:13:33 -0500
Message-ID: <20230610011339.3716428-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jun 2023 01:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182602

From: Randolph Sapp <rs@ti.com>

Cleaning up some parts of weston-init, adding guards to systemd init
scripts, making sure users are in the correct groups for interacting
with graphics devices and finally attempting to help direct users to the
global Wayland socket when they are allowed to interact with it.

The only functional change here is the addition of a profile script that
checks if the user is in the correct group to interact with the global
systemd socket at /run/wayland-0; if they are, then we set
WAYLAND_DISPLAY to point to that socket directly.

Randolph Sapp (6):
  weston-init: make sure the render group exists
  weston-init: add weston user to the render group
  weston-init: add the weston user to the wayland group
  weston-init: fix the mixed indentation
  weston-init: guard against systemd configs
  weston-init: add profile to point users to global socket

 meta/recipes-graphics/wayland/weston-init.bb  | 88 ++++++++++---------
 .../wayland/weston-init/weston-socket.sh      | 20 +++++
 2 files changed, 68 insertions(+), 40 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh

-- 
2.41.0


