Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146CCC3DA41
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:25:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2880.1687537499072476803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 09:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rrHzm7eF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOst9129998;
	Fri, 23 Jun 2023 11:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687537494;
	bh=Vc2x6KlJt0aObivtvx6J6hzM59qsBNEaLcFprfp6+S4=;
	h=From:To:CC:Subject:Date;
	b=rrHzm7eFrPLoj8GxoyKMt3q6QTekQ+BcwC+kAubu/FokJpTHrbTU4ZcO+/3ae+/n4
	 Sr4NevsPI4SjGEEsBcI5XBEWxAyzYwLICcPHaRLB4tk/3nHlI3Tjc7J+j+xNF6rQdy
	 hyuC/GBXCA8qN8iyZz1vJAFX8muVu+KWQej1aSiw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35NGOsrp009764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Jun 2023 11:24:54 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Jun 2023 11:24:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Jun 2023 11:24:54 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOs1A023142;
	Fri, 23 Jun 2023 11:24:54 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <denis@denix.org>,
        <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, <rs@ti.com>
Subject: [oe-core][kirkstone][PATCHv2 0/8] Backport all weston-init qol updates
Date: Fri, 23 Jun 2023 11:24:40 -0500
Message-ID: <20230623162448.3162089-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183338

From: Randolph Sapp <rs@ti.com>

Backport all the weston-init QOL updates. Getting closer to the point
where we can actually drop our distro specific weston-init bbappend. May
submit a few more QOL patches sooner or later to completely drop it.

Resubmitting this because I forgot to CC Steve and myself on this
series.

Ming Liu (1):
  weston-init: introduce xwayland PACKAGECONFIG

Randolph Sapp (6):
  weston-init: make sure the render group exists
  weston-init: add weston user to the render group
  weston-init: add the weston user to the wayland group
  weston-init: fix the mixed indentation
  weston-init: guard against systemd configs
  weston-init: add profile to point users to global socket

ssuesens (1):
  weston.init: enabled xwayland

 meta/recipes-graphics/wayland/weston-init.bb  | 53 ++++++++++++-------
 .../wayland/weston-init/weston-socket.sh      | 20 +++++++
 2 files changed, 53 insertions(+), 20 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh

-- 
2.41.0


