Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27187C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 20:32:41 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.108442.1701117158553549627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 12:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=SAeFS5a/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-456497-20231127203235553fce8154b15a8c49-jnpwkx@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20231127203235553fce8154b15a8c49
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Nov 2023 21:32:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kLQ6nuaun9tQbI7/QkH/U1KutLhbHIsLA+Y4R4D/qXA=;
 b=SAeFS5a/cgKtaqvk4F6LY6VpTFT0Q97X4IsNNd7PJ2pk1tLKxPLbpsNSB/KRGKuQ3+Q68v
 UoDTFWYzgLox8+041KMsQ9rigZsgY3XSr9Oz+xU2yHegAgvCC2/4ekGvaRzResz01+kTHQL4
 IfTagziv3TUE9cBhWonJEY++/8n6Y=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH] linux-firmware: require rdfind-native
Date: Mon, 27 Nov 2023 21:32:25 +0100
Message-ID: <20231127203230.2704211-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 20:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191326

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Since commit 3e79f6b83bd0
("Create symlinks for all firmware that is duplicate using rdfind")
linux-firmware' copy-firmware.sh uses rdfind, add it to package's
DEPENDS.

Fixes: 7c725d1f2ed9 ("linux-firmware: upgrade 20230804 -> 20231030")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index c0394b9b3b9..f7da5de6074 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1529,3 +1529,7 @@ INSANE_SKIP:${PN} = "already-stripped"
 
 # No need to put firmware into the sysroot
 SYSROOT_DIRS_IGNORE += "${nonarch_base_libdir}/firmware"
+
+# Since commit 3e79f6b83bd0 ("Create symlinks for all firmware that is duplicate using rdfind")
+# linux-firmware' copy-firmware.sh uses rdfind
+DEPENDS += "rdfind-native"
-- 
2.43.0


