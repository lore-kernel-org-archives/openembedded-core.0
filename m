Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57341C433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:16:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.8012.1653048987224425256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RXNa43g4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 240661C000B;
	Fri, 20 May 2022 12:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653048985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4VNPSnnKK4pdm53P7/cThuDw22aQJfl+6XZKapFel3A=;
	b=RXNa43g4hZ0OBB0r4cuPC7CuxwHLD4ThZP3tIjfFew66f/FZQb8sTKnhmUul7tTw00dx7s
	fVXG7XC1K1SrHGTYIOqbbZHenc2uqeYDRmxe7h5+bXznMH+LD2Rsb8FUybLQfDDhQd07SM
	qO6a8vdcEDsUFvgD1qd9aI8osEp4fn1Sncz/u5yVym/7IUu8KZ2C3WhNLRmg4K+KJ1wVLO
	8E4BM/w2C6JIiPeU32+lAzEZlr+DYJ9yduphHFfteDOOBF2SUbCbowcE5hMuRU4jUB95F3
	Wl4piQhEQfwrTlJoyzvD7EH1bRbPWE8MKBqiW3rJkhetS474Y6fZjXd1NXR6QQ==
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] webkitgtk: limit the number of compilation threads
Date: Fri, 20 May 2022 14:16:17 +0200
Message-Id: <20220520121617.2993631-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:16:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165927

Otherwise the compilation may lead to out-of-memories.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.36.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
index 65757c36a733..e7cfe49e2b87 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
@@ -80,6 +80,8 @@ setup_python_link() {
 	fi
 }
 
+PARALLEL_MAKE = ""
+
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
@@ -164,4 +166,3 @@ src_package_preprocess () {
             ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
 
 }
-
-- 
2.35.3


