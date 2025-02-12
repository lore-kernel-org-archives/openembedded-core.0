Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441CEC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:11:48 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.19882.1739376702480164823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YSPYOBSg;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6fb0200b193so31724247b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 08:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739376701; x=1739981501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7LGWRlgAu8KTgjitSCubvwnOj2VYlHP26ICQJZdNTs=;
        b=YSPYOBSgBVRSS6v0PC767TZsf3EETtsTnHHhtNJJ37ouF0wV7s0ryVq/aY2OhrVUBO
         y+2oycmRZb51FhdjNknNKMbcpli+XQ0lCFIscStg3c+gL4xCbCoyq6YRaJJPwg3tmhVT
         0vMk5gDHq4jzyJQUepxIfkEhy/7RBKWIgq4nT1YtNEsUIdzcXGVC0bmbfQZfifzMmtR7
         c5AX7utLYlLUmUeBi6+o+ElGTylK6Q+VW/DEs38OaG2EwXCmZ2uoPP8jOxHBaD7U3ZX0
         5vNM9ABtQZQih5x9XVg3dxkvLwTv/uhkbGjW3LFKB7gYhJlKEvknLQHk/OS8YKO1rQ8V
         Q0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376701; x=1739981501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7LGWRlgAu8KTgjitSCubvwnOj2VYlHP26ICQJZdNTs=;
        b=k2Mx7iFbhPeMHomG5w3wHWoE8/CP2aGNlRp3hFvwNOrguQPYIXbQHeYEg8sd2B566L
         4cPuY9isKa6K+G1O6okptN17YFxh8RDXWQij8Hp4jTwOXS2FKasTPmh30qx2GeBa3mWf
         DXuRZ0jfKaZgINL/seoXMpdNaosPbuH7uwGvc4kiRX4EmJkXJg6EDN1fXtHMiRWxWKUi
         G2d0b1Gk36ZVSspdOdPsT2HWWFvsnGjr6ddXVIwDR8pkbbvH+Z2WeRzlGTnjX/Ixoghr
         As/IQRHDpGsTkj7UeLj5qzIsMAsooqqsKTq40K2Bji8Ui51XX3U9Zl782c+RQnqsa0uP
         y6gg==
X-Gm-Message-State: AOJu0YyBpAIVB77xDyKPGBn1gEKTR0IRuGM4JVpGWtYSVKJKGGsXBrF/
	DRDGkzgr4loMH0wHsUuJ3qIKk6XSdsOHVn7rJJePlpJ0W2sdv7M44FGQ4g==
X-Gm-Gg: ASbGncuqfRSfnP5LwBK+5wRWxkScMnSAAhDM4MWJLzHfSKeS1bRGEfN3TAb+Vlmxl61
	n7R/k2D4LWOzUTYS978SH6Bfr1gyXpFzbwraZKJt4UqK+Ibcr5moyiZdd89hykz0CPcD/GA49y4
	FX+YYKMyy7DKplSrhJ/qyl1R/W2/T5diFsEO/uuiizeq5gjp0ujfkiHEjJbap09KQFt0GAXkxMe
	kp/Y3wgG3xg3fLlodioPBjipHkoKnzEbt/lZ5wMBW/VwwkD+53ytvvFhfXf1gwdjh3vyeciw4MY
	VWopIMh6IpzLQk0TwPI118v1Vux+XEDX0d999im4
X-Google-Smtp-Source: AGHT+IHo5A1z78Spi+PI0H/gN1Db5kKksWzu0Veru9EyyAi4lfQ03O1SpAYUyTJJWfMmRSdH+UUzmA==
X-Received: by 2002:a05:690c:6a12:b0:6f9:ad48:a3d7 with SMTP id 00721157ae682-6fb1f57ecedmr41691877b3.1.1739376701320;
        Wed, 12 Feb 2025 08:11:41 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd5b08bsm27107917b3.60.2025.02.12.08.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:11:40 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] busybox: fix menuconfig on newer hosts
Date: Wed, 12 Feb 2025 10:11:28 -0600
Message-ID: <20250212161128.1933320-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211256

From: Dan McGregor <dan.mcgregor@usask.ca>

The lxdialog.sh script compiles a short program as a link test. That
test program relied on an implicit return type of the main function,
but gcc >= 14 now warns on that by default. This caused the test
to fail and prevented menuconfig from starting.

Use a full function declaration to fix this, allowing menuconfig to
once again run on a newer host.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...-menuconfig-fix-lxdialog-gcc-warning.patch | 29 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc-warning.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc-warning.patch b/meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc-warning.patch
new file mode 100644
index 00000000000..42be243af86
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-menuconfig-fix-lxdialog-gcc-warning.patch
@@ -0,0 +1,29 @@
+From 3386123c87a3398c1f1426bf72dd3707e74167c9 Mon Sep 17 00:00:00 2001
+From: Dan McGregor <dan.mcgregor@usask.ca>
+Date: Wed, 12 Feb 2025 09:47:22 -0600
+Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Fix gcc warning
+
+New gcc warns by default if a function is declared without a return
+type. Use a full c99 function declaration for main in the test.
+
+Upstream-Status: Pending
+---
+ scripts/kconfig/lxdialog/check-lxdialog.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 7003e02..4808b21 100755
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
+@@ -55,7 +55,7 @@ trap "rm -f $tmp" 0 1 2 3 15
+ check() {
+         $cc -x c - -o $tmp 2>/dev/null <<'EOF'
+ #include CURSES_LOC
+-main() {}
++int main(void) {}
+ EOF
+ 	if [ $? != 0 ]; then
+ 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+-- 
+2.47.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index c3131eb4531..83efe991033 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
+           file://busybox-menuconfig-fix-lxdialog-gcc-warning.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
2.47.0


