Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA1AE77182
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 16:44:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.24071.1734021861988571545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 08:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H/AJGZOZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3863494591bso443881f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734021860; x=1734626660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0S4h4bjQHNxCguBepnEcHHxqvMFu2otDmuUiyFjCFo=;
        b=H/AJGZOZng3wm2/Yt0rItzCKbv7ttJSvbs0l4Ftl8diyctgqi8yMwlAkVlT9YSswkv
         dJBBiLR1XGnpu09Vx2A/k0x1HshWmlxAhImqqxv3xCTllD+NgYk52Xb057K7jcTsFB46
         jfG9HG8COP6+NhsMl69hswggV4Q13Pibu8UdmOD9HOjmYaTWc0Q1Vj5z/7hM5jAg5hON
         vLbWtKjblO7D/qQbeIyLtKxLcc8D4sJ0oF7k/gEVQrrK5+9OX4QC4WdIRoHiP9x1wOws
         rZtIl/LN0j80+kzor5iyvXSd5w17uGtYs1XggOYc+48KuGGTaVVcaQksk66X7ha4lVYW
         NSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021860; x=1734626660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0S4h4bjQHNxCguBepnEcHHxqvMFu2otDmuUiyFjCFo=;
        b=dz51QaxmYkVADteL9xcvHZ22g50xsA61kuY80fxoY+bzh12wi4nULUEgDaZ8UUBsmJ
         9WSrODZPfsqN8rrXX6Jihb9/lv5zgGIfYS9q/CAsWFPS+qQIiTpk6vFCXpreYSrrHm/e
         TMp+4LogentZNUWx8ShY1S0z2wR0u7HmUtMWgOuxFXl+SJnT9wpNzW6hGapRuiZYjs3c
         /0A9ZiS5JHfwgjMlDW2AQ0KYFkbtnxdRvsyTJVTTiMpRjcuRDh/c/VQl/1rRqRIxeBf/
         +/qudcbboU9Ks0XMUZNHSkR5+8mex2hFWOrZYa+k/B4xORidRnUzz5obLJ+UKYIqVNNP
         R21g==
X-Gm-Message-State: AOJu0Yzakb0zePGwmt1DRf93viuuP8SsGoxnK8aZNer593+8X1sdHqw5
	/STtGqBuKSHz0ZXh8DnGxlIXSrCuyK+x1ALd5qKL9zglx5VPiERTolLZaA==
X-Gm-Gg: ASbGncsU+sa+5EgEWAweipkoCiO7O3/F1YtKAMztEMHy/IDRToOAFJcvZF2UQ3YHyHa
	vYZwHpGTJw0LtnR508VgrRS7wmySktYr4lm+S5rJky4RcGUYRR2s/u/FqLXjb9hJfMnKsCttkEC
	ubhHRpSVg4BljMtfVaNVayzMyfaC+hh6KHdivNeiaUwX1LJjNE2GIdOQjh+UjCJK1vqiMpVXcJL
	rfdEPxJxKZ0phszz2VVFNaZXNy/5dqJbImHB4XSmHpeu+gB+yHPfTUoFtM/hzxUgQVT+1HBnUWO
X-Google-Smtp-Source: AGHT+IHSNn8li5showmsXB9PFSvOT35ezcW/DrXyZD3tC21NcKwW7yA+CxFAbb8hN8c7lE8q2PMf0g==
X-Received: by 2002:a05:6000:2702:b0:386:5b2:a9d9 with SMTP id ffacd0b85a97d-3864cea05b0mr4839078f8f.53.1734021859844;
        Thu, 12 Dec 2024 08:44:19 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4815sm4473331f8f.26.2024.12.12.08.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:44:18 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCHv2 1/5] busybox: add klogd service to FILES
Date: Thu, 12 Dec 2024 16:55:22 +0100
Message-ID: <20241212164407.2904755-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 16:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208654

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


