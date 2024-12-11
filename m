Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC4BE77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 21:59:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6604.1733954347570834024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 13:59:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IB47WuY7;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3862b364538so691610f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733954345; x=1734559145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0S4h4bjQHNxCguBepnEcHHxqvMFu2otDmuUiyFjCFo=;
        b=IB47WuY7yWz55UZVJ0PTMBwW/ssxQO2PlAK4iusppPH6W+2Bt6zbAvbxmgjg5oT/Ik
         ovdyuU1x0Vilo+e+Y0Co/nLdr5ku+dlNr9JvXc31N91L4GCxTkPlkhEV3OnoHexZGCOz
         EawHLb0zA3TL/btI13Pgc/LoERHOqcDu7us8QjtM7AHhsyilvsqFYmegLAr536CpMmyC
         bBpA6OmNgDzIduMz5viK2YkQr9xUNecag2BULbnDxWJrI8FYlM5LOcr8Y0UkLWY9jzzi
         8l6nTr5OqRPGUsFX5WcW3OLlFYfICtCfqNVmVOUpECzzAGytP/xJP1hD3lh+/zIlbh0B
         nHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954345; x=1734559145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0S4h4bjQHNxCguBepnEcHHxqvMFu2otDmuUiyFjCFo=;
        b=A2YNhwXfP1ueUn5ZYBAQ4RGkPoRG9LT/cTO4SYFXm6aIlmqsUgxgDahhfJEFAply2o
         EOwoQi4uF5QoE+ebtfT/vp5D7O4UWKz/0BYJPrVpaAaPNsIBkmJVXREOi70YWRjzpTs0
         jQXcbqpovKe/Re+WhXBaznPWFvW90tsxpXBO6IP6ZzQGnH7fY/cxpARECnOpTGw1yHu9
         CyyR9myAnwWBupiNWxEYEpoVEOBf1VkpXEp58GXHUpYPRwjTDaEy+m22yEn5xL+o9qNW
         k7xGj6LnyiryEpPSchgghGfzm6TI2s2iJoD8XONH6KT0I+6OokskuAHrWm6yCll1NDgq
         41XA==
X-Gm-Message-State: AOJu0Yyo0QHgZdMMtTkwjSD//nsLzpke2zeGx07NEBfaFkR4rOr81jhr
	iunOKXwTgwJ2Lexe6fQyoWHFSNjEHY52P5qp76HhkCon7wwCXS3N6Vz9uw==
X-Gm-Gg: ASbGncvo42bhXhbL7bKIffkKW7CUzCWXTwhkPu/zD0lqKA46VT03UpVW6U2FXBSw74c
	uX+SK6fQMbqgrAvjZ8EFmYJsBw3vnWiDG4zuDpLOoOzOrzBK0FroIBcwNyVK4wJaKRTWFbmRsBu
	8c+wFo7zwPNQazssFwa07IjRbvYkIpa3x305+LdefC1Rm9DxwGDSDm6+lQI//J5qHn2hmWXBD3v
	9asCvHD8h1fnBihJUYd+LwlCQyiieYYiFW9wFlDiqppCyM3z5Or8oXuR14RzoVV6BPrHUbO0g==
X-Google-Smtp-Source: AGHT+IH1MuDU0Y2V4nEyCxd67BcyGAO2jZ6WotWjuzqL2VVtDZLU8F5N6UF4N+pjWp0rsPFTI+TTKw==
X-Received: by 2002:a05:6000:4609:b0:385:faf5:ebb8 with SMTP id ffacd0b85a97d-387887cd649mr693358f8f.7.1733954345506;
        Wed, 11 Dec 2024 13:59:05 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c5c98sm2180792f8f.58.2024.12.11.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:59:04 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/5] busybox: add klogd service to FILES
Date: Wed, 11 Dec 2024 22:58:37 +0100
Message-ID: <20241211215859.2187259-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
References: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 21:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208612

From: Adrian Freihofer <adrian.freihofer@siemens.com>

busybox syslog.service file contains:
  Also=busybox-klogd.service

That's why busybox-klog.service got automatically added to
FILES:busybox-syslog. Since this incorrect auto adding feature gets
dropped from systemd.bbclass this needs to be added explicitly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/busybox/busybox.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 67a9111e5bd..f778cff0f4a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -24,7 +24,14 @@ EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
 FILES:${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES:${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_system_unitdir}/syslog.service ${sysconfdir}/default/busybox-syslog"
+FILES:${PN}-syslog = "\
+    ${sysconfdir}/init.d/syslog* \
+    ${sysconfdir}/syslog-startup.conf* \
+    ${sysconfdir}/syslog.conf* \
+    ${systemd_system_unitdir}/syslog.service \
+    ${systemd_system_unitdir}/busybox-klogd.service \
+    ${sysconfdir}/default/busybox-syslog \
+"
 FILES:${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
 FILES:${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES:${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
-- 
2.47.0


