Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E527FD1F9BD
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:30 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.4801.1729018286406226511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UdF0S2ep;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2211409b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018286; x=1729623086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5GqWygiqKPQ3YSwgrNKoRuD0vlGPDc52BttpQIHufk=;
        b=UdF0S2eprg+QlV8lX86EJ1ynF92cHIoy5AJPwYt3i8NMas59/G1u2Jd8j5vyXSeqq1
         P9ctaJ5H5CXDdXXlXyr1a770+D/lSR3DRx2PHYV1YBIOh4lFpntZt2THJ8RRQeyFa2W9
         nNL+NkOXl+JoZ5D/zRksiWd0Mi4NB8tEf9lMYfw2VBA9fRKeTUveGdZhOZaLuC1bRe/R
         q6ooYMxdKSzNWYgr577NipEuRpTNPE3tCqwGCB+ZwRuDAODTZTE+y6BOuAXAW9e/OpBU
         8pA4eh13hkxzgZMKqmwLi2i2dZyPBhncjhAKvPq0EsvzmyrwjmD9iftjKqzBJu8nKivz
         Q8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018286; x=1729623086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5GqWygiqKPQ3YSwgrNKoRuD0vlGPDc52BttpQIHufk=;
        b=aRfwGVP7/XytNIWlkPd3RNoGs8qZ3E4fjwFBsVlCYb8uzLfCnDo7ISoyRNMWLYl4fu
         LiDc1PPXxZg9YGG7YxMI8QH4qojOhKcjKMdaTSvP0boUO2PqFW2JTzcO2xllsJEDRLAY
         wahlIDMeTGwypQUvPDZRFwSNqZpMn0aY7sSZLnArx4JFQQfrEKz6L7dXvkIXDxgTku72
         qv7YinNrKQvaJYiwBxnzqwrYe0MTEBQQHY8LSWTPe5fQkxie6WqXFVTmLTtUGe/kFqcJ
         nJAMTBM1cuTbr6ZTP4vj+q9bM6u9VY48YxSQUorRUkcuL+WGeWjkip8oqVlITjVo196G
         RegA==
X-Gm-Message-State: AOJu0YzBA93UvQX1j8bbqei//2b+1L2S7k/L8FBQZ8JyxkWfVc1u+YAd
	jPyEAEDnzJSSutK5/MtyywIhJQ796wCWVnTB5mF5C/5hpOAPuf2YoK3/feyGi+jhW4dDGAMUdAD
	a
X-Google-Smtp-Source: AGHT+IFUkBDEvOK+4m/nycnXVc0MuQZ3LrY2a+8mn//TQDrydBTdyJMRBXFF+SNYa2LGqckCwfHbvg==
X-Received: by 2002:a05:6a20:d81a:b0:1d9:a72:87e9 with SMTP id adf61e73a8af0-1d90a728911mr641544637.10.1729018285627;
        Tue, 15 Oct 2024 11:51:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/18] recipes-bsp: usbutils: Fix usb-devices command using busybox
Date: Tue, 15 Oct 2024 11:50:51 -0700
Message-Id: <bb7dad01066d22c3cc4465bdf39ec4e310821d15.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205938

From: Teresa Remmet <t.remmet@phytec.de>

Unknown find parameter -printf makes usb-devices script unusable with
busybox. Replace the parameter to fix this issue.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7c9f827e914b7c27856d995da553a2e41372321)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...devices-Fix-usb-devices-with-busybox.patch | 37 +++++++++++++++++++
 meta/recipes-bsp/usbutils/usbutils_017.bb     |  1 +
 2 files changed, 38 insertions(+)
 create mode 100755 meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch

diff --git a/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch b/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch
new file mode 100755
index 0000000000..dbe5d7c18b
--- /dev/null
+++ b/meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch
@@ -0,0 +1,37 @@
+From da155d965a34b5c5770dc30fa52eb7ef405f3a30 Mon Sep 17 00:00:00 2001
+From: Teresa Remmet <t.remmet@phytec.de>
+Date: Thu, 5 Sep 2024 08:37:48 +0200
+Subject: [PATCH] usb-devices: Fix usb-devices with busybox
+
+The busybox find command is missing the -printf parameter leading to
+the error:
+
+find: unrecognized: -printf
+
+Replace the parameter with sed.
+
+This patch was originally created by Daniel Fancsali.
+
+Upstream-Status: Backport [https://github.com/gregkh/usbutils/commit/da155d965a34b5c5770dc30fa52eb7ef405f3a30]
+
+Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
+---
+ usb-devices | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usb-devices b/usb-devices
+index 5f60ad5a1ed0..51f48b4ad628 100755
+--- a/usb-devices
++++ b/usb-devices
+@@ -192,7 +192,7 @@ if [ ! -d /sys/bus ]; then
+ 	exit 1
+ fi
+ 
+-for device in $(find /sys/bus/usb/devices -name 'usb*' -printf '%f\n' | sort -V)
++for device in $(find /sys/bus/usb/devices -name 'usb*' | sed -E 's#^.*/##g' | sort -V)
+ do
+ 	print_device "/sys/bus/usb/devices/$device" 0 0 0
+ done
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/usbutils/usbutils_017.bb b/meta/recipes-bsp/usbutils/usbutils_017.bb
index a2e340ea4f..83d5c7287d 100644
--- a/meta/recipes-bsp/usbutils/usbutils_017.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_017.bb
@@ -13,6 +13,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://0001-usbutils.pc.in-Fix-Cflags-entry.patch \
+           file://0001-usb-devices-Fix-usb-devices-with-busybox.patch \
           "
 SRC_URI[sha256sum] = "f704c4cb78a060db88b43aac6ebfd3d93c2c5cf1d6dd0e42936faaf00814ab00"
 
-- 
2.34.1


