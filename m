Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DA4C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 05:54:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.465.1667800484274650513
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 21:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BlK7fKKr;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so8671471pjs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 21:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5aWDXyKh0I1HSuNQJ3ifamGiNyyBD6ggKA6UaBN2Sk=;
        b=BlK7fKKrTUpXNgcAVOOGbnBKGtRitaQT2BLXEy/7zZ494ID3sjyinotJC0vBaAoVAx
         KsOZwjMTK2kmLOs2jY5+8ra2FqeaxY+QPbCAfM14u5zLdCFko5EkZJkOLgMsHZjNskKn
         QsEFhP3ymedeuWjk1csRu7z41YfMGs5MmZV2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5aWDXyKh0I1HSuNQJ3ifamGiNyyBD6ggKA6UaBN2Sk=;
        b=QYtwrMRW18fl02qva+xp3v4WrjVG33dmd/1Bu9RnHWYXqzY/kxxwovWcWu7cnrMy3y
         RgTeAr85z8o07qkpp5Om1LgMT5KrDlAgnvrFFdoRAk6NOeW5uikqydoXx0eYeOlEr/7Q
         qMobE0MGQVoFjFdguxMamiFm+sKE3QEFk4FxbPAG8Lo3GcU6jomuFlwsfDHtU/TruQrW
         97QQ/efG8Szzt3+kAvvftYwhAB3efQOq87TFORA8XYhD3dG1r7BsrXCrZzijMp67YQNL
         WdzYao8LoNvzCmbbiu/QVhMq6VJQVWEeFRPlaIq/4NvSlmanRNN3xbUVCy3YQMpa7ksQ
         iSBw==
X-Gm-Message-State: ACrzQf0+uJ1638OGS7jVNzD2+PYmhQBAz+rG9jMOQtQVS7HGGS6WRO9F
	b+xu+SsyWiPH61seh+U4tc0tnYCPmtEbBA==
X-Google-Smtp-Source: AMsMyM5XvaAW25llR9hVzsmX1vpj3kKP9HlWAB0GzmwpfiPDmefo4EXmWeBnd/z+IJbXX6YFn6UJsw==
X-Received: by 2002:a17:902:8693:b0:17a:f71:98fd with SMTP id g19-20020a170902869300b0017a0f7198fdmr49182090plo.25.1667800483202;
        Sun, 06 Nov 2022 21:54:43 -0800 (PST)
Received: from MVIN00024 ([43.249.234.214])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902684400b0017808db132bsm4038277pln.137.2022.11.06.21.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 21:54:42 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 07 Nov 2022 11:24:37 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] bluez: CVE-2022-3637 A DoS exists in monitor/jlink.c
Date: Mon,  7 Nov 2022 11:24:36 +0530
Message-Id: <20221107055436.7810-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 05:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172824

Upstream-Status: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/monitor/jlink.c?id=1d6cfb8e625a944010956714c1802bc1e1fc6c4f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2022-3637.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index eaac9ee849..0ef3192c77 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -57,6 +57,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
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


