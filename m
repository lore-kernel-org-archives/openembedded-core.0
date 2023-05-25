Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EF2C7EE29
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 15:05:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.14447.1685027143631616881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 08:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LbDI23Zs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685027141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YnuRFvy541APqe/RcGLS4NisPmxbAPosBPiTO+ptqtw=;
	b=LbDI23ZsuDKruQQXme35jkC28WwtVX1h7MUtANRTlP+dlxnD4W2ogfxastJMq6q4yG+hja
	iODGnx9drOYc2s15ZaoGAnzf0B6gqyyRsswEjCQC+zbF0k04AxXGPmh4IYx5kQtshBO8zh
	NBOLtWXq3aucgx5wKHvSfnLaddOmIxanx4U+WrcHzG9YsPo/bHU0iz9YmF0HfDux9kklXN
	P8+47aiNqHyGPEWN5yrLob8KN3ClYgrxqrlhX04gbQ79qOL0cjg0IXgqPETisIsTXjrRS1
	gc+ENKOkpWqUjEJUFHmd05K2yBfxV0jaItTWNKogB5JB3tZO1/oSDn0O6/dOcw==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 658D3FF811;
	Thu, 25 May 2023 15:05:41 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Tim Orling <ticotimo@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] psplash: enable fullscreen and disable startup-msg
Date: Thu, 25 May 2023 17:05:32 +0200
Message-Id: <20230525150532.1624622-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 15:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181714

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

by setting PACKAGECONFIG entries
- fullscreen wasn't set by default but caused
  issues displaying the image (image translated upwards,
  white stripe at the bottom)
- startup-msg was set by default but didn't seem
  to work, showing a white stripe in the lower half
  of the display.
- progress-bar was already enabled, but it can
  now be disabled through PACKAGECONFIG.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Tim Orling <ticotimo@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index aecbd2ce46..e590eb978f 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -65,9 +65,12 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d update-alternatives systemd
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} progress-bar fullscreen"
 
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
+PACKAGECONFIG[fullscreen] = "--enable-img-fullscreen"
+PACKAGECONFIG[startup-msg] = ",--disable-startup-msg"
+PACKAGECONFIG[progress-bar] = ",--disable-progress-bar"
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
-- 
2.34.1


