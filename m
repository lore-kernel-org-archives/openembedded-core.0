Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6E6C47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:44:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.22317.1705671868535915922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 05:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OTIY4cg7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso8345125e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 05:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705671867; x=1706276667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9CTWXsIRB4aXMygk2T49abZROa3vSJRm4lUvtogAgYA=;
        b=OTIY4cg7pjfr0IgT57mn/sGa/wDYjuePpLe0AYvtRAEzYEd58OZDPjrUOMXZiPo87f
         T3zQBBhdRTDzAin9CAPyJBlY8aI3FCf5WA+XtS/bWbMyr16bGX8nak2IHJPlPQKOzXBi
         BZQ+W5apd3iwcioS8Im8kMq8YqN6yyV7AGVRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705671867; x=1706276667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CTWXsIRB4aXMygk2T49abZROa3vSJRm4lUvtogAgYA=;
        b=dsGAKIr6jGdYNPSP/cLLo/r32X6LuxaB2Mng+fNuGBfBXdtVF5t0ZmT5axkxEEwMNP
         Odnl9R/jVb24Vm5ry0hGUND5siZQM0i534jnEWEyiEfXcA/VyXBVWdKV5xRrBLfpAKa3
         f0W3BAuGPnIDeP9a7FYvjjCFLBV06EJzA9wcWrw494Fe+nKQDyB8EH3VADoQmmdo3ROL
         fzK73La40dlpxMpPJFzjcH/TFMbxBRcjW0xXVZ03ABEIPDv9ijEefvd+vEqHZ+hRnzCf
         ds5/h6ioiHjt6Q5wdpvok3H/K6P9mq/H3F3GdWyOjgJ9nypwE215yQyVH+PC2gJSgS12
         uMjA==
X-Gm-Message-State: AOJu0Yxa+jUoG9kWmmsfugNSrK+aI16MYiLFGEofUYA76NnsTDWlJmmi
	90S721IkRPN5T18DgJXgwZ9DGsGKkjWua6ds4RtX9MmfOzBO1DWRtufFgQUfY6h3EnNAiOI3UlX
	Q
X-Google-Smtp-Source: AGHT+IGctO3m7pnRjSqr7KJ1bMWDoeUUewQfykNWElYLoybU8wbnuW+OTPPyJEk5BITnpdu2AwpYHw==
X-Received: by 2002:a05:600c:3ca0:b0:40e:9f7a:c266 with SMTP id bg32-20020a05600c3ca000b0040e9f7ac266mr292065wmb.167.1705671866648;
        Fri, 19 Jan 2024 05:44:26 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bdad:632e:4428:9197])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d65c7000000b00337d6db207dsm2957860wrw.30.2024.01.19.05.44.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:44:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: add PACKAGECONFIG for sndio
Date: Fri, 19 Jan 2024 13:44:25 +0000
Message-Id: <20240119134425.106617-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194045

In qemu's configuration this is an 'auto' configuration option so if the host has
the sndio headers on then it gets enabled, causing sstate reuse problems. This is
particularly problematic as some qemu pieces can 'see' into the host pkg-config
due to openGL linkage.

Add config and disable by default to avoid host contamination.

[YOCTO #15284]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 70515d980e7..4ebf17e6c00 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -237,6 +237,7 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
 PACKAGECONFIG[pipewire] = "--enable-pipewire,--disable-pipewire,pipewire"
+PACKAGECONFIG[sndio] = "--enable-sndio,--disable-sndio,sndio"
 
 INSANE_SKIP:${PN}-common = "arch"
 
-- 
2.40.1


