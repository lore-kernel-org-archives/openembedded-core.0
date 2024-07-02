Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93E8C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 14:49:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.26400.1719931785892019384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 07:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hnke96HZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36742cc9c12so2840893f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 07:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719931784; x=1720536584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIHUfEVXQZtnlf6toqFVd/PE949CxJKV8OiYFEbYVCM=;
        b=Hnke96HZqljcjTif0clkHr5ltSaxy0FcPLzfl5SWp0j3da1V6pXDzKkp7I4F/gK3fm
         L2AP9TI1yw9KbTNCO5S4d9VLIrftD1MdjDlIVaZ/9Z4UwxM5ekOPzXb1kpGtReLbc+z+
         PVFBPVJhhwQMozKn77L0O/EpZJI6iWYe7kzEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719931784; x=1720536584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIHUfEVXQZtnlf6toqFVd/PE949CxJKV8OiYFEbYVCM=;
        b=CIyrRaw2HGIitOoW11TQQPbXyeJZ+iz1BkRlCtKbiqJIauGAgx5+BqXk/PDA7Ds2nx
         WN0H9XOTokItv+GY/G3t9bZe2QHHjGadCNW/qlzjrfhO64cnz/viSQhv8F16W86dwJZN
         UcQZI5VIwK1uk4LQNIBvqMwvECcQ++/TGFV3MvcXex/MAMYOC7kSgFHVPSB9j+hO9dcX
         grlT5/NZERAgznb4LzzgTIHuU3qYLMayus5icOZqejXnYb11hfQEoQui76UGRpkEbWvs
         v//vKY0SmloAvShQjgFE2/7ePJh/K+4A3qQBsN0/H7XrjA4VH+kWxJuMG6WrMHQk+7OS
         YQ4Q==
X-Gm-Message-State: AOJu0YxL9IBqtScqpf5x9PNSRWJKabevVm9260Q8x8/G+8lpDYwYX67b
	faYEWFqHDEFYUTVE851qm5WKqh7Kujbs0zRLGG3YeO+zmfrERM1cq06fB83e7mexFrp+Jse46YH
	P
X-Google-Smtp-Source: AGHT+IGvSHf++kjcbGcupYxwd3bng+EXl2rlOqzQxCpjTp3eBWU+2EMVESMosqwqmhDDsn1ECN5PeA==
X-Received: by 2002:a5d:4043:0:b0:362:42eb:6f21 with SMTP id ffacd0b85a97d-367756a36a5mr5734743f8f.10.1719931783963;
        Tue, 02 Jul 2024 07:49:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e0e2:4d33:6557:e74f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36784e3e0f5sm2216016f8f.11.2024.07.02.07.49.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 07:49:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Upgrade 9.0.0 -> 9.0.1
Date: Tue,  2 Jul 2024 15:49:42 +0100
Message-ID: <20240702144942.2754761-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 14:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201430

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/{qemu-native_9.0.0.bb => qemu-native_9.0.1.bb}         | 0
 ...{qemu-system-native_9.0.0.bb => qemu-system-native_9.0.1.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                             | 2 +-
 meta/recipes-devtools/qemu/{qemu_9.0.0.bb => qemu_9.0.1.bb}     | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.0.0.bb => qemu-native_9.0.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.0.0.bb => qemu-system-native_9.0.1.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_9.0.0.bb => qemu_9.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb b/meta/recipes-devtools/qemu/qemu-native_9.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_9.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.0.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.0.1.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fb38fb44dee..6a5ab56436e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,7 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69"
+SRC_URI[sha256sum] = "d0f4db0fbd151c0cf16f84aeb2a500f6e95009732546f44dafab8d2049bbb805"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu_9.0.0.bb b/meta/recipes-devtools/qemu/qemu_9.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_9.0.1.bb

