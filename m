Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A333EC43219
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:19 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.2914.1668262209303418385
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QyY3FXKf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id f3so144839pgc.2
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMqEvf83jTTHbZq8r3QSPpvvEGMqZRKpzL4R9wJgEAU=;
        b=QyY3FXKfALWTUDsNSVUJ+fOTF+4GglYmk783HvysojUwXbZnnWey7XOAgCYatLva9L
         YP8C3+sYyMpWqBxktET/HUtzMrmKg3zu8V6n2HtWJcF9acZ6axi3mWWe4EzYrVp47OOQ
         EeLh6f/Es+NH8TkuhqirvIfaVGK43i2ZwX2NvcjT2Uim9cwzxl0yOEUcAlB+Z37FPmZD
         oDiTfMJ3YvpJyommsQw05UIhzSEKz4xmk40+2Tn6YbOigC2D4dkE6PZg9RNmTNG40qIr
         PRjaUInXODKs3GpQpLEDBL7g1QGImb6LIkoP05vNEKSNBMBmEUuxUCJ6gGNwiTuw5K/Z
         IR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMqEvf83jTTHbZq8r3QSPpvvEGMqZRKpzL4R9wJgEAU=;
        b=WVLekxeLmgC0zYMjpeXp24iOW6rJwpUReDLaA7/g9XPqV4d8p7O5LlYDh+KTGQJBmI
         xmYWTdfflfk33gXmBRnurkgp2irRIFj0+dZ5gWpQiSMo4Iy2c3dXP+BFq72GbhotVqW6
         6YudIqyp49Rxo1rYKDoDHHRqIp2QWq6vtEEWkTNN7noFx3hlzmhUjp+80ecxH9sJLzdF
         aRRCQagh3M80aH05thVRwRNqyfwGvJUtSK13D51VyG2PhvqBHKUv19vDOTkK1VImmIVN
         3DSJZbgzuikhV/EI0mInIfIcYUAtuVy/OnAwmrwKl8zj+g7CXw+XBSpOtkAMqpDGgTlC
         FAVA==
X-Gm-Message-State: ANoB5plcnw5mxoW8xnJDnUM+C4bK68/N+ZdF/g2zXwnYDQ5K9MhLWed3
	S6c3g6ZkJdUHJWvyhKt6Uvefz+IXiowIWXme
X-Google-Smtp-Source: AA0mqf7dXEsJpZHRCQh0e3RORwgAcIrYA7yooUEewQ0MELIQfaxIQDYgVzd8HgHSwoNmw30N9Si9gg==
X-Received: by 2002:a63:4d43:0:b0:41d:c892:2e9 with SMTP id n3-20020a634d43000000b0041dc89202e9mr5457532pgl.457.1668262208257;
        Sat, 12 Nov 2022 06:10:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] bluez: CVE-2022-3637 A DoS exists in monitor/jlink.c
Date: Sat, 12 Nov 2022 04:09:49 -1000
Message-Id: <c008c56e9b03f0ce3eccf4c01799ae8e987e5cd5.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173150

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/monitor/jlink.c?id=1d6cfb8e625a944010956714c1802bc1e1fc6c4f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2022-3637.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7ad054b3a7..a71d339928 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -58,6 +58,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
           file://CVE-2021-3658.patch \
            file://CVE-2022-0204.patch \
            file://CVE-2022-39176.patch \
+           file://CVE-2022-3637.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch
new file mode 100644
index 0000000000..4ca60f99d5
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch
@@ -0,0 +1,39 @@
+From b808b2852a0b48c6f9dbb038f932613cea3126c2 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 27 Oct 2022 09:51:27 +0530
+Subject: [PATCH] CVE-2022-3637
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/monitor/jlink.c?id=1d6cfb8e625a944010956714c1802bc1e1fc6c4f]
+CVE: CVE-2022-3637
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+monitor: Fix crash when using RTT backend
+
+This fix regression introduced by "monitor: Fix memory leaks".
+J-Link shared library is in use if jlink_init() returns 0 and thus
+handle shall not be closed.
+---
+ monitor/jlink.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/monitor/jlink.c b/monitor/jlink.c
+index afa9d93..5bd4aed 100644
+--- a/monitor/jlink.c
++++ b/monitor/jlink.c
+@@ -120,9 +120,12 @@ int jlink_init(void)
+ 			!jlink.tif_select || !jlink.setspeed ||
+ 			!jlink.connect || !jlink.getsn ||
+ 			!jlink.emu_getproductname ||
+-			!jlink.rtterminal_control || !jlink.rtterminal_read)
++			!jlink.rtterminal_control || !jlink.rtterminal_read) {
++		dlclose(so);
+ 		return -EIO;
++	}
+ 
++	/* don't dlclose(so) here cause symbols from it are in use now */
+ 	return 0;
+ }
+ 
+-- 
+2.25.1
+
-- 
2.25.1


