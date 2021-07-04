Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.3115.1625432863912703484
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 14:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WzsR9LSy;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id s18so1253835pgg.8
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jul 2021 14:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4lkw1RnWThh/eCoYW5olebXswdcooBEdX91N+L8SPEA=;
        b=WzsR9LSyC1vyqB4IcXxA7X8yeFP/ebcyWmZsCaDvRu+ZkwbcQOXjNCqBHJ8c/PYtcI
         awbsy30YiCVbDLBZi0Ng3JoIQ38456vzFgg5zlQU7/LXGJ/lGsYmjexPHPESEXIzeku+
         /etSTHlPfxrb0C7T5VVoW1wnUD2PoDIS8UJm/NBAXkp3c8vymgaFnegqH0rOGHcTDiSr
         yjTZG1Og7KQTaWi3tPLzXrT25hxy4bS799Tna1bBohae/NJxiOndtTOyr1RPVJ5cxzwz
         v76oFcsBSaLcG3SmtiHrskTDGSITCLqYDyliTVEiT1GpppbTdcl5+I1a5YbQdp7eamET
         3img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4lkw1RnWThh/eCoYW5olebXswdcooBEdX91N+L8SPEA=;
        b=Za4pa8sBFgd2oxWs2NGOUI4qvuJvYWxMmVKyyyotoDdfzwuAVBLp3/kCpcsbelMskf
         1bcZbsgNW8Ew6RvxWjGk4gzDpy/68ecHnTZqoI9QPHzjUobS2/ZTEMCPJy/PhKemXABa
         Nlz9arF/3mwYzlhWJrU0fPvYKF/GTPReyuoD2VcnqmrneoqdBrJ+nYQhMLK+Vm5qp4/W
         BKwwJ5yEUAQRKipDnUU7Dq4oMkcQhwvYp/NDn0VX8bP9MLqH7wi7/Uv5J4KCqrxRzfA7
         4rEkRC3YRPRkbyqQL5gUfX4rIdDTI5JiZIKaA+dN3ArTR5yh8nWAmTgZOdJ80vn1FW/J
         T1xg==
X-Gm-Message-State: AOAM532gElB2NfvtoaJ3ik1Wj7wY1v6uxm0fJ0A4JJQLvoqgwMlJeiMp
	1YKzkn2v5hoW+6tjx4KreS4u1Nx2CF5NfA==
X-Google-Smtp-Source: ABdhPJw/f9RwrYnjAQ+H75PVY7n5qaJoUVZySvP7cLAMQwckAtN/6bitE73g/fi6xWgG8rDxk4KGUg==
X-Received: by 2002:a63:405:: with SMTP id 5mr12167498pge.132.1625432863237;
        Sun, 04 Jul 2021 14:07:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id v13sm19450873pja.44.2021.07.04.14.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 14:07:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
Date: Sun,  4 Jul 2021 14:07:40 -0700
Message-Id: <20210704210740.581650-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This recipe depends on u-boot and u-boot is not available for
qemuppc/qemuppc64 and there is no defconfig available either

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index 306296922c..88a8397c3c 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -25,6 +25,9 @@ RPROVIDES_${PN}-bin += "u-boot-fw-utils"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+COMPATIBLE_HOST_qemuppc64 = "null"
+COMPATIBLE_HOST_qemuppc = "null"
+
 RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
 
 BBCLASSEXTEND = "native"
-- 
2.32.0

