Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE23CDB484
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 13:29:10 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.27795.1697722142783945291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 06:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=BQ5GtegO;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=oNlcl/R+iiTIhukYGV9s0MNgXz/akVD5V2hoQm9wjEo=; b=BQ5GtegOTSu8xxDhaOhhB4whPV
	4zCtH2t3ABGfG7ctDVoWfTPleNRzHFCTncp2DUqL0MyohkLgahRDXr75V49N++wUhwkgNCUazGS5z
	/gtyViS6GTy9wuayeUnrsXVaSCUCTXszGrwOYRbzsME5OUIX2BaDYBZbyMO6x0nIPIYxNvPXp9rQN
	4fjYjaRkh9oo8fVfkVSjfoEl4JvB45peyehpjO2OemlQuCX+nHVW9B9fR+FPgOokHt0LFnLh2y4nH
	NlJtxyr1L64WpIrTJplr5WaJjKfDqtlRAxcupncVh8aF+8XQCBBTgP/FHxOUhlPP5oH7K7p/yxacm
	aM2xvXTw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qtT58-00062l-42; Thu, 19 Oct 2023 15:28:58 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qtT57-000JkX-Oo; Thu, 19 Oct 2023 15:28:57 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk,
	alex@linutronix.de,
	steve@sakoman.com
Subject: [OE-core][mickledore][PATCH] weston: default to launcher-seatd
Date: Thu, 19 Oct 2023 15:28:41 +0200
Message-ID: <20231019132843.2623456-1-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27066/Thu Oct 19 09:45:47 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 13:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189458

Lets use the launcher-seatd as default, launcher-logind is "sometimes"
failing to provide input events. Further more is the launcher-logind
depricated in newer versions of weston.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/recipes-graphics/wayland/weston_11.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-graphics/wayland/weston_11.0.1.bb
index 0838791a6b..09753e7c51 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayla
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
-                   ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'sysvinit', 'launcher-libseat', '', d)} \
+                   launcher-libseat \
                    image-jpeg \
                    screenshare \
                    shell-desktop \
@@ -71,7 +71,7 @@ PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=fals
 # Weston with webp support
 PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
-PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
+PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
 PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xwayland"
 # colord CMS support
-- 
2.42.0


