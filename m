Return-Path: <bhargav_das@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7852CCF5396
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 14:32:02 +0000 (UTC)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web11.10639.1729693912346070908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 07:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: bhargav_das@mentor.com)
X-CSE-ConnectionGUID: vPHkW1IySR6mjvheejq8ug==
X-CSE-MsgGUID: XIkf/1xTQfegirzAaOBIXg==
X-IronPort-AV: E=Sophos;i="6.11,226,1725350400"; 
   d="scan'208";a="44208024"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 23 Oct 2024 06:31:51 -0800
IronPort-SDR: uvBZtz6M214UDQLe/+sduIpD+KH7NFxG0ulBLtGSKmjfuBiEYWanrhBSu30iAlkzIHCJ42PC0Y
 zqvwKZodfHCcAvy3hGDfr7F+cpVD+iRR1RI/JnK5tum1RoiYyS4eULvrchvGAwtxs5Ck9oWYSv
 lfXa34DCQF1wQLPjg42NYlQEn+qVwMKqPy1mzOeG5cVbzqwJrERoMZ7HHUVnu0THOWsgfO8PaS
 oetjwU0Mp2gA4Lk4IMkvk80i4rbtg9E7wGPFTD+OsbR9g6WNW/C+lO9JuqrBuLu9FCwwOqFKpV
 UxM=
From: Bhargav Das <bhargav_das@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Bhargav Das <bhargav.das@siemens.com>
Subject: [PATCH] libinput: Add runtime dependencies for 'libinput measure' command
Date: Wed, 23 Oct 2024 19:57:30 +0530
Message-ID: <20241023142730.477569-1-bhargav_das@mentor.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: svr-orw-mbx-10.mgc.mentorg.com (147.34.90.210) To
 svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206242

From: Bhargav Das <bhargav.das@siemens.com>

When using the 'measure' subcommand such as,

libinput measure touchpad-size 800x480 /dev/input/event0

The following runtime dependencies are required.
* python3i,
* python3-libevdev,
* python3-pyudev

Signed-off-by: Bhargav Das <bhargav.das@siemens.com>
---
 meta/recipes-graphics/wayland/libinput_1.26.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/wayland/libinput_1.26.1.bb b/meta/recipes-graphics/wayland/libinput_1.26.1.bb
index 487270505a..74fbbdb000 100644
--- a/meta/recipes-graphics/wayland/libinput_1.26.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.26.1.bb
@@ -46,4 +46,6 @@ RPROVIDES:${PN} = "libinput"
 RREPLACES:${PN} = "libinput"
 RCONFLICTS:${PN} = "libinput"
 
+RDEPENDS:${PN} = "python3 python3-libevdev python3-pyudev"
+
 FILES:${PN}-ptest += "${libexecdir}/libinput/libinput-test-suite"
-- 
2.34.1


