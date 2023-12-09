Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A88C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 23:27:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.31651.1702164440054330580
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 15:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l+ayDbx0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8696A1C0002;
	Sat,  9 Dec 2023 23:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702164437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BEbMT3H8mMeDYspc7b4z6Y4Hu8/OiuLTVaNbsngBwFk=;
	b=l+ayDbx04/QxHactjOOLUJnZ0lJMMReaWAt8gVdEnLg+LlKaZWVf2BAcVUTkjUMIxUGO3b
	5lnxYrVtEKB19Q24PWpG4ENTJuDEyy9to9RhguksW5q4/nmAHc4efiGsmlMrzQEAHmqFvb
	fkfGHfb92WzrqVZkG07K72OrOu4PrFxtIo9Nj2mZxI5GqFyA1R0g5W9rzH7mkLXpg7bFU0
	V2I5KTu/o52lZlICxSCk2S+5VHlNugv1acXZWqXNF/e1qLABLKaFfmXhogr6DAljhTGnDT
	DPnmKZBKq4wbJML5h0lsZyBaaP7xkDcNCbJmaoe9zI0RieoaaerV5Uhr1Ajb3Q==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] pseudo: drop syncfs probe patch
Date: Sun, 10 Dec 2023 00:27:02 +0100
Message-ID: <20231209232710.1006536-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 23:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192106

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The patch is now upstream and SRCREV has already been bumped

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../pseudo/files/syncfs-probe.patch           | 44 -------------------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 -
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/syncfs-probe.patch

diff --git a/meta/recipes-devtools/pseudo/files/syncfs-probe.patch b/meta/recipes-devtools/pseudo/files/syncfs-probe.patch
deleted file mode 100644
index 23f01673e3c2..000000000000
--- a/meta/recipes-devtools/pseudo/files/syncfs-probe.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e38b1fec2eb4a5dcefafdab7f1a240966f3632f1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?=
- <pidge@baylibre.com>
-Date: Wed, 6 Dec 2023 13:00:29 +0000
-Subject: [PATCH] subports: Add _GNU_SOURCE
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-[YOCTO #15074]
-
-The syncfs probe in ports/unix/subports was failing if the compiler does not 
-support implicit function declarations. syncfs is protected and requires 
-_GNU_SOURCE, so the answer here is to pull it in.
-
-Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
-
----
-Upstream-Status: Pending
-
- ports/unix/subports | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ports/unix/subports b/ports/unix/subports
-index e41b036..bd5a2f6 100755
---- a/ports/unix/subports
-+++ b/ports/unix/subports
-@@ -1,11 +1,13 @@
- #!/bin/sh
- cat > dummy.c <<EOF
-+#define _GNU_SOURCE
- #include <unistd.h>
- int main(void) {
- 	syncfs(0);
- 	return 0;
- }
- EOF
-+
- if ${CC} -o dummy dummy.c > /dev/null 2>&1; then
- 	echo "unix/syncfs"
- fi
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 31b2d5fad20d..699cab11c668 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,7 +2,6 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://0001-configure-Prune-PIE-flags.patch \
-           file://syncfs-probe.patch \
            file://glibc238.patch \
            file://fallback-passwd \
            file://fallback-group \
-- 
2.43.0


