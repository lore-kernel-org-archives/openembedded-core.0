Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA944C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 22:05:12 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.51895.1700690712270231336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 14:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OsMi8Hkj;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso279727b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700690711; x=1701295511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHhgOlmAnyXgqLIzxnMZv+eOBZW/l7nQg7Si9jrislo=;
        b=OsMi8Hkj89/B7AaP6/E+Pjx6mkyWADOAL9K3L3jSuYZbhlpjnf4h8ZLjdPgmduY8I7
         RqEvOEMzcfizsjjAOut8XKN7GvW2Wv9O61fTLFmLBj+zABF1AsMcEJU4WPkO6ILk9q9c
         p5bpDgib+hIQjby23ctsj5JViYp53u6sJgU+lcRT4MPpE8SsZo9EqAJ5iCqAQhgrLxkm
         +uFcy6iYBmHueIPXMYjqUgmLPf0sWqIxvlwDbSBZdH832FHD+QRReVMZuUvikHcDcTYd
         EaAgeAi7F7NTPKFfaOzSZJRG5x9BziLq2GjqiAR9zGmd195eb8G2lphpzNIxRr3nUV0h
         ue6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700690711; x=1701295511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHhgOlmAnyXgqLIzxnMZv+eOBZW/l7nQg7Si9jrislo=;
        b=ol1zxhwEKtqFhtWOkb9LZhQrbXhMdHvPhWUh/xwcsdz3N+Bt8j5jsoSvZWfAz5wnU1
         PjEwGRBXh6Xi+g1Ek6olZIbbgQ9W1OSuyglKhP5e9h+aXuiiREXwXzRQkrh8fbD+YCvU
         PjeKHbIuyFekkD7jP7HmtkIB3UMXbjuLL5SCG2nSI6GszJGFR5zkIPk6cvNGNrTmVu7O
         NhlymnROblUQ4l4360ZHBD41BO+JprhEgwbhYhpgDNvZkKKvsywIhZGxTD9UJm4iZBU/
         TUmn20CISxe6uMQtOLVVMSakOYF/L6TkSfe2xwPRL6D5Bnt5HRubWFWCRX43lOzoUPGq
         BBpg==
X-Gm-Message-State: AOJu0YyCe53SaizJZz2U75TJKFnGPJtw6HI2WsEE0cAPcLSpQ91jKbrV
	bH2IyV4miWGyoCU48VNxLNjcC/cubdzuHg==
X-Google-Smtp-Source: AGHT+IGckKpQXVccvp6ahV3/vehg+Mv9AC0DqGEQaWPj5Y8rPgSmL78oxfW1Mkn2Vkhd/Gb1ZmREFg==
X-Received: by 2002:a05:6a21:6d8b:b0:187:9f36:c30a with SMTP id wl11-20020a056a216d8b00b001879f36c30amr3657817pzb.39.1700690711091;
        Wed, 22 Nov 2023 14:05:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id b12-20020a17090ae38c00b0027782f611d1sm252519pjz.36.2023.11.22.14.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:05:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] init-manager-mdev-busybox: Keep sysvinit distro feature on
Date: Wed, 22 Nov 2023 14:05:08 -0800
Message-ID: <20231122220508.3148727-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 22:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191124

The rcS script that busybox-init provides is able to run scripts that
are available as part of sysvinit, therefore its fine to keep sysvinit
distro feature enabled so that we can build complex systems with
busybox as init system.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/init-manager-mdev-busybox.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/meta/conf/distro/include/init-manager-mdev-busybox.inc
index 12091cba68c..a5a61bbe4d2 100644
--- a/meta/conf/distro/include/init-manager-mdev-busybox.inc
+++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
@@ -1,5 +1,6 @@
 # enable mdev/busybox for init
-DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd sysvinit"
+DISTRO_FEATURES:append = " sysvinit"
+DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
 VIRTUAL-RUNTIME_dev_manager ??= "busybox-mdev"
 VIRTUAL-RUNTIME_init_manager ??= "busybox"
 VIRTUAL-RUNTIME_initscripts ??= "initscripts"
-- 
2.43.0


