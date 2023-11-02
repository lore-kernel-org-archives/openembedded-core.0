Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF258C4708E
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:03:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.40645.1698951785153074701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=czBTQtXm;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so1354265b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698951784; x=1699556584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEwxC2WgeiZBxH7B2mBnYyToWvezBpMl2lCteRFPQP8=;
        b=czBTQtXmAgJUY/a9MOpwyGxL0AsrvoOWJczObwMzYHU1vInzmyeoynvdWJnfwSUhfo
         zdz1MilbfHb0WEq79JfuUfsEXlD1YjQPUou0cAU9d8VSBUCF4AVUIDB8ePyYZsVBoiqK
         1cuDc3m4ft563QaLGNzdcNYFqyZqDgi6O4+RgDfyulW2+n9pAp9eBb5hBMKZMxoL+wyq
         Ssx9hrmURsuJ9jvZ1AlqdSfb+eiYsQIKTRGhRUHehC6QBqmrUSGwJOdQNviWankwZ9GV
         8fwPB4/7JUVikxIpC5/RXN3x+zY7/rfSECp0u8Ejl6u+e4Ef+9upaKc4DH6yWQuMJL8F
         X/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951784; x=1699556584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEwxC2WgeiZBxH7B2mBnYyToWvezBpMl2lCteRFPQP8=;
        b=WzO9WRbaZ+XUy3SGx36b2Zi2hQ8tF0nRPYs6lMFdKtw1cuF7cSYI8p9EDPoZ7SPNtN
         u24F/4+lpFCnBHPjSkSr6gGsIluXUMBibfNxX2SWlEKeMP5XnXdiJ4smJJN9gWTlYEbj
         y0nYBvHRY2/O3LDPBqjKjlic0QMZllIPtVtrL3yRLeRystS5mAcDkOoWIuHvCGLb13d2
         M9kECW9WVJox6keCitndSnE0SVQSOQd0uJbrkMKDzY8pcd5pYeomHe5YbwWWjLpKzCiv
         d7nw6l2YkZZyNLcdxDRDi6DiSgCzyfGhy/gtOQi707Sdk7ojZNLBwRTKuTuMI3QA7Ukn
         wROg==
X-Gm-Message-State: AOJu0Ywv2vfUfA3fS7Lj72OItv2aEUiWmqCQvkX7s4KVqa2FhqL66Uf+
	I/URdGimGtZYdcJgrZ0DO/EllkAIa1WYMg==
X-Google-Smtp-Source: AGHT+IE5zmZbmUXIKslCo8XV/JlRiT1EGYxZ2ta/sNxslSG3TTq7QXO/AFoHfGxK7XgsnPazFKpKbw==
X-Received: by 2002:a05:6a00:1ca6:b0:6c2:c5b6:3963 with SMTP id y38-20020a056a001ca600b006c2c5b63963mr7677286pfw.0.1698951784200;
        Thu, 02 Nov 2023 12:03:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id m5-20020a62f205000000b006c0678eab2csm100636pfh.90.2023.11.02.12.03.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:03:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] meson: Add check for riscv64 in link template
Date: Thu,  2 Nov 2023 12:02:53 -0700
Message-ID: <830c45958c9fb1600d75634cb0986d7ef327fde3.1698951553.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1698951553.git.raj.khem@gmail.com>
References: <cover.1698951553.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190093

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/meson/meson_1.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/meson/meson_1.2.2.bb b/meta/recipes-devtools/meson/meson_1.2.2.bb
index 6a07168ee1b..c38d88fe61f 100644
--- a/meta/recipes-devtools/meson/meson_1.2.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.2.2.bb
@@ -66,6 +66,8 @@ def generate_native_link_template(d):
         loader = 'ld64.so.2'
     elif 'loongarch64' in build_arch:
         loader = 'ld-linux-loongarch-lp64d.so.1'
+    elif 'riscv64' in build_arch:
+        loader = 'ld-linux-riscv64-lp64d.so.1'
 
     if loader:
         val += ['-Wl,--dynamic-linker=@{OECORE_NATIVE_SYSROOT}${base_libdir_native}/' + loader]
-- 
2.42.0


