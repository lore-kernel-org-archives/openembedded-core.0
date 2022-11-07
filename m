Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBCEC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 05:30:49 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.281.1667799040607495128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 21:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JJ/Ua6ua;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id b62so9534020pgc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 21:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZnaqVnQHq6R8c2ShmUCtM28FQ/4q4fYLJyEUW0dvzw=;
        b=JJ/Ua6uabgpByX5IUQ/DAc/DN3ZAOXBS1+0P9zIPuPcCnOpFUcwnOWc9WLn/JdPYsk
         BsQRdVcJ3Q5Q+RGRulmtTB7I3//+qdkdkjZqyVkf1t+LK6yJJKXZ3XL4MGDvK+VQHZ8L
         C6hWIZxo6d827tPaOaaevNwwvXUE3+NF55GNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZnaqVnQHq6R8c2ShmUCtM28FQ/4q4fYLJyEUW0dvzw=;
        b=ECu5TBrRfz7fYFT1oYgd65ZC8q+ktfCWTa7wekUmGD6Hx/7zovU7LTE6bgrhuXl/V4
         T3QGodD7LZfuhVbdmTocvoHMaA9DuY82ZCamN65fN9L1A/pXEKwMU6hgTOfXoOfMNhxc
         3/GjGxEzkEfkce5i85mm0O/KHOkP8ysC3qqytCoxWtMUVNXfucdulOcRFHxMw3AduEXp
         1715ffhg4fnjMMtiB0/DDd/I1JPJ2F/6suvLAK0+MmnNlo0SmqKoJaYkkj887jxolQ+1
         VCQUT7uZ6pC2stfVfEYnTgL/VcOqojgnNcDKnS8Bju3EzIFytRzftwbferxLdxKhXU1J
         B7OA==
X-Gm-Message-State: ACrzQf3G7i/USyemtRq0/+MZ+Sdv9q5820MbmlK3169zqe0g91L7FdQ1
	iPIsFNLLikiIYZUaT/T2reoz1jYLLIPb2g==
X-Google-Smtp-Source: AMsMyM7tQx8LR93ZRLNusUVokL8PiBxB7/zDV99HqBu7Fxl+byiT/hZvVTOyKCgcfcZKJB6L30IcaQ==
X-Received: by 2002:a05:6a00:32c9:b0:56b:a54e:68be with SMTP id cl9-20020a056a0032c900b0056ba54e68bemr48797450pfb.16.1667799039707;
        Sun, 06 Nov 2022 21:30:39 -0800 (PST)
Received: from MVIN00024 ([43.249.234.214])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090a6a0f00b00212e60c7d9csm5125558pjj.41.2022.11.06.21.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 21:30:39 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 07 Nov 2022 11:00:34 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] bluez: CVE-2022-3637 A DoS exists in monitor/jlink.c
Date: Mon,  7 Nov 2022 11:00:32 +0530
Message-Id: <20221107053032.7064-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172822

Upstream-Status: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/monitor/jlink.c?id=1d6cfb8e625a944010956714c1802bc1e1fc6c4f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2022-3637.patch         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca8..07d36ab74b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -53,6 +53,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://CVE-2022-3637.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch
new file mode 100644
index 0000000000..5bd00ddca5
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch
@@ -0,0 +1,39 @@
+From 8b8a8f76b64a72ddc78f9052f80c87c0da72bcc6 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 3 Nov 2022 11:56:44 +0530
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
+index 9aaa4eb..f9d4037 100644
+--- a/monitor/jlink.c
++++ b/monitor/jlink.c
+@@ -107,9 +107,12 @@ int jlink_init(void)
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


