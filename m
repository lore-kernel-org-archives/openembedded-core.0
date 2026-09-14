Return-Path: <WXbet@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98760C88E6F
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 18:21:58 +0000 (UTC)
Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4548.1789410113107334103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 11:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ilhbe61q;
 spf=pass (domain: gmail.com, ip: 74.125.225.74, mailfrom: wxbet.oe@gmail.com)
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48433107499so1715857f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789410111; x=1790014911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMv554aOQVE7jkJQU/uhosufNA/5E5vPvbBVAqVmaQo=;
        b=ilhbe61qLzaUCRgZjvd1BKn+B3H6zh2RBzGoRabWjKvpRvggpsBKKiH0Mi05bISBcB
         pNmH7q6U7yqH9fvCqBkwv75wjvffHjbBh98Jn9lGTXxfJghr26QeJx6lQkjYA/NT2SmH
         nILrU27lUV+2ZaKJ3aKJFWsRFW82pt8tk/fJsk9uq+RlASx9CXmT30vy6hoioDAAgLHc
         I2kalWfmEynkzcUdz5Kve+DVGyaPKHQKUrKdsIn2Xs+rCsNZBn0rn/uxb5yrH1BYcCIO
         59cpZ9gxkERYs5YnzUi79TuqhY0tgup6EtI1J2lRZBmJrEVlMzDzQ+lfF9XhOP8xCCY4
         kjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789410111; x=1790014911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GMv554aOQVE7jkJQU/uhosufNA/5E5vPvbBVAqVmaQo=;
        b=hZbkoqqPaGrrXRDuriBWcyR2r0OgL/1V7U6fg+zqEosK4muhWvrJR+ZbHDliqXpBRP
         G0u8FTVPjDu9kiv5xWnDD6va2VRnM7UkayRvMe5aFwp2CMNqORLr9LZGtoYhT4eNErml
         V0v/WH9HGaEuw/GUPkovcobJArf2d/W5tQ8tzZyh9003WHs8ZnL3WlvGufzIPoIkT9H7
         v6XC3minrCOlLIQdUvwHcv4nindul1RL8YZABuGI10HbJVhkiX1NtvnwyboKPlw6egQX
         J+ZeaBNdDIadUTZbRyVELJXZ8kW3O7LdZPlPT88KRKYVDEJqjMX5uiXMdlLgDU42Asy5
         QoJg==
X-Gm-Message-State: AFuF++l8NtF8UZdMPGUmqQ2TVwH1jhCQyKEgGGlHYzK1QGp1JG7EynN7
	RkkSamdyn7YblSbCkB87isUP8+EUDW5IBFY2BACKSBTeSB6t3VPIRf7TtCYHKOY6IzUQvln+
X-Gm-Gg: AYBFou3KSQyIlZesr0uJZC0M95UsytYJU2Ogi3ejD/b0lRvrWJojN43JmBVlfwA5FUq
	Pno3KN9gic0ghGKKDAzFYOM2bUH4xgagLuV/ZEh7t4GV9uWDsegUyXHkqHWEj7JcIV4Wq5UEtQ0
	hvWp/BdZcIAS8rqrvTVLdMWFysHBe+rhw5uYeHiHql3t+7slSwMUAcY2WiWjDekJElEuCmJA4rk
	KXp7qQd0i0oiITfA3/zvpKubE68nfynijXmUqfHaA1hMPJIOwcrDDIGScYcD+3eYBmG1baub2J4
	QbxR/ZGfSdxGCg+tyTH/5DDQ9ydS1AZlxcBt2l+tyLyjDR8CLEKFQ5Ysf5l9jrahw9xxYx0QjRX
	1A5A3UMYyqp0jd+6yg5m6+z3D0xiiYS+h0A36/KlghcPvAkHsSh7Viv1aRpRaPCXM1Jl3MclU3q
	uPO2sxW7IqoPAgtbg2vVVUBB74PFOcmUEZbYHio/zD75ojWSlpiwxU7fIdChiXX120cv8uD6BuR
	geI/np2FSKld7if22P1drFCxhZ2GjgX+A==
X-Received: by 2002:a05:600c:3b9f:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49e7a6933bbmr54366025e9.27.1789410110454;
        Mon, 14 Sep 2026 11:21:50 -0700 (PDT)
Received: from localhost.localdomain ([94.31.114.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d67de8asm12048595e9.12.2026.09.14.11.21.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:21:49 -0700 (PDT)
From: WXbet <wxbet.oe@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: use absolute paths in the kernel-image scripts
Date: Mon, 14 Sep 2026 20:21:30 +0200
Message-ID: <20260914182130.19543-1-wxbet.oe@gmail.com>
X-Mailer: git-send-email 2.47.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 18:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245792

From: WXbet <57314510+WXbet@users.noreply.github.com>

On the target, the postinst of kernel-image-<type> creates the
${KERNEL_IMAGEDEST}/<type> link with a path relative to the current
directory, and the postrm removes it the same way. opkg runs package
scripts in the directory of its caller, so an upgrade started from any
directory other than / makes ln fail. The fallback then copies the image
with install, which the busybox defconfig does not enable:

  sh: install: command not found

and the postrm leaves the link behind.

Anchor the link location at / as the rootfs-time case anchors it at $D.
The link target stays relative to ${KERNEL_IMAGEDEST}.

Signed-off-by: WXbet <57314510+WXbet@users.noreply.github.com>
---

Notes:
    The relative path seems to date back to bb946b8cdb ("classes/kernel: Use
    a copy of image for kernel*.rpm if fs doesn't support symlinks"), which
    moved the link from do_install into the postinst. When $D is set at rootfs
    time, the link is still anchored at $D. If the on-target case is meant to
    be relative to the current directory, please let me know how package
    managers are expected to call it.

 meta/classes-recipe/kernel.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 0a6d754108..8d8af113f7 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -136,17 +136,17 @@ python __anonymous () {
 if [ -n "$D" ]; then
     ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
 else
-    ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
+    ln -sf %s-${KERNEL_VERSION} /${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
     if [ $? -ne 0 ]; then
-        echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
-        install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s
+        echo "Filesystem on /${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
+        install -m 0644 /${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} /${KERNEL_IMAGEDEST}/%s
     fi
 fi
 set -e
 """ % (type, type, type, type, type, type, type))
             d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
-if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
-    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
+if [ -f "/${KERNEL_IMAGEDEST}/%s" -o -L "/${KERNEL_IMAGEDEST}/%s" ]; then
+    rm -f /${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
 fi
 set -e
 """ % (type, type, type))
-- 
2.47.1.windows.1


