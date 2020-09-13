Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.31875.1599969558989749402
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 20:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mif9lokq;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id j34so8994692pgi.7
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 20:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rK7G86VRoI1Nr7mxLDInzIbBkKkIYW2orJD45RRHs4w=;
        b=mif9lokqP1I7wlyWjujq/pNLzs+3HlhiM8pWq1f0wO3t+8ap1XTqV1tkxT58va9ff2
         onzMQzVkzlR34MPJfjbg99Yxp/GokjxEMdcl4yeEl2SMZJcIHuyjk2Tj5HwqhTrd9iKU
         UT6wCqy2XG+7Pf+HC2TZeZoIO57w5cm7ODUYb0EpO4jZmwJtnn/9Hyslyh/zHlXKJEDr
         e/elCU07xz1j4K4aQ6Qrrbg1BptQ+InMFUukyseZu5akWfqrM6nrSaENBV4xaP1MWwaw
         DkBVxYoCgBJsWv4BWxRSfWLMIysNyyufygtmUcgHd0F+wSR7qVEwKKiqAaG11aJEwzeR
         gROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rK7G86VRoI1Nr7mxLDInzIbBkKkIYW2orJD45RRHs4w=;
        b=fXNSfRpK2asER3E0xxBsMCW58qMpAXPzGLKnyz6YhRJDSWx4MZoHhvayNWBb40n/6a
         LlrD00hy8ThupVCbVpinFYJmumQDsqbYVJS1dMPP+k/AXH9oUZlXwA43LT2zDWDFDeRi
         1SYcs3IfyxAa8nwbU/lJfrdECxiUlCvNwDVkkn/KArd0SwjENPGE71ndgE9Qo8QEd4YI
         UWsnO/pXPxVxkRojFeDplH+ebwPQg7DqFCQXdioRQdmSM5NfAKrbmXT3rOkKM1pAKtaS
         WxRBP02JsBuKH4J2QPE7K7TIqpZbh9Z5jLvG1bhgOU7O6tAhAwKwTSxHlcczqMw1oXuf
         0i5w==
X-Gm-Message-State: AOAM530lUnphjHV3/JMCJUKxIbgTfv5Qcg9MQOw74BS36wmBieXzbBxt
	WJLttnNRux0YacBM3N/JJDNfTC9rp9M=
X-Google-Smtp-Source: ABdhPJxIoxeGPJ4rPrVEWp6Uzl7ACB5ZOxL+5ry7dXMifjhOWLSOtECH2+SBGQd4l80MzA8gEg6MUA==
X-Received: by 2002:aa7:94a4:: with SMTP id a4mr8573756pfl.49.1599969558234;
        Sat, 12 Sep 2020 20:59:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1aa:69c3:1411:f726])
        by smtp.gmail.com with ESMTPSA id il14sm5313771pjb.54.2020.09.12.20.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 20:59:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.comt>
Subject: [PATCH] core-image-sato: qemumips use 512 mem
Date: Sat, 12 Sep 2020 20:59:16 -0700
Message-Id: <20200913035916.24165-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster808@gmail.comt>

Fixes:

WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login into serial console as root using blank password
WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
root
<<< run_serial(): command timed out after 60 seconds without output >>>

In another run, this error was seen:

Failed to reload daemon: Refusing to reload, not enough space available on /run/systemd. Currently, 14.3M are free, but a safety buffer of 16.0M is enforced.

With updates to systemd and Qemu we should revert: 499a31cf06 core-image-sato: don't use 512MB in qemumips

Signed-off-by: Armin Kuster  <akuster808@gmail.com>
---
 meta/recipes-sato/images/core-image-sato.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 673106eb6d..878e0eaa8d 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -12,4 +12,3 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
 
 QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
-QB_MEM_qemumips = "-m 256"
-- 
2.17.1

