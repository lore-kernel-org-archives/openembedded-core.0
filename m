Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20587C43217
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 14:06:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.7322.1666101956646411156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 07:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KREWCYCM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8F140FF812;
	Tue, 18 Oct 2022 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666101954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8OQNneRPCvyXHC/d78y2/6LQj12zHLKHruqIy89XUVA=;
	b=KREWCYCMxYdhu5ou2xHZcHcD8AETRC++mewca5Sso1gv+s6tceLNpEmMO0eQnDj9hO5UJd
	65UoiD6zWNvNOpe6qfy8d9bUIQCAcdsIg8rpdjPKoeBL7JTcHLh2QdTbGoPv1HLdovMIA3
	nmo7bHFQXoVoWID5T+XyFQidjopzVpCwR6casV7Z//lCbD69q8NCknBirTpvVfDs4qf/Oi
	k+7LnXxnJLhXL0FPlnJl+gDQKH30DnixzCU4t+b/kMaNAw43iwksrlXd6of6I+5uFaYQnL
	9lz8WAdoklOifhz3oAy47gjZ72ZNHKlUYhXKTn9o6zHTsXNwHJyiNvAWKSSrmw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] xserver-xorg: move some recommended dependencies in required
Date: Tue, 18 Oct 2022 16:05:52 +0200
Message-Id: <20221018140552.318259-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 14:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171941

From: Thomas Perrot <thomas.perrot@bootlin.com>

Otherwise, xserver will no longer start when NO_RECOMMENDATIONS = “1”,
because dependencies in XSERVER_RRECOMMENDS are missing.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 057a1ba6ad48..6b11c79be6ee 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -80,9 +80,9 @@ PACKAGES =+ "${PN}-sdl \
 SUMMARY:xf86-video-modesetting = "X.Org X server -- modesetting display driver"
 INSANE_SKIP:${MLPREFIX}xf86-video-modesetting = "xorg-driver-abi"
 
-XSERVER_RRECOMMENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp xf86-input-libinput"
-RRECOMMENDS:${PN} += "${XSERVER_RRECOMMENDS}"
-RRECOMMENDS:${PN}-xwayland += "${XSERVER_RRECOMMENDS}"
+XSERVER_RDEPENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp xf86-input-libinput"
+RDEPENDS:${PN} += "${XSERVER_RDEPENDS}"
+RDEPENDS:${PN}-xwayland += "${XSERVER_RDEPENDS}"
 RDEPENDS:${PN}-xvfb += "xkeyboard-config"
 RDEPENDS:${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
-- 
2.37.3


