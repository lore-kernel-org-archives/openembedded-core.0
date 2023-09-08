Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620BAEE7FF7
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:38:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.38931.1694180309110355092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Fkz5ujV4;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40078c4855fso22406645e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694180307; x=1694785107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHjM2ya66WX0/5H36CrFNVi44p+9MAVeN7j+54P9buw=;
        b=Fkz5ujV4VExeJ5WAodFYN+1tV1PzNBwH3ihGcCzdurqaSt6gNt1GWY5qCqvky3fCr7
         8rLVg3hJ+N2uFvUt01iDRG+yAX5rqsRmKjZXNfHmBFQZKDD89Z0DoB61zDcsVC9xkeNP
         aP+Mio6ddCWgiUlLmJygGQ2wLzTSusawdc1yYk7IaeKslSfNZY30bgNkyM6eRNUcXfR5
         2mLD3oa5s+fJsTj+4i/2qwQD5mWOYVnB2yKDoQqwvj7hW3hygweQyuTEd0DaIJ/evBpz
         c3afS9gQmxzw80v1cnPjj4aN+ZQGcvblpIO3Pqv8yynKZgKp9I8h0wJZXhv3dBKeUhZC
         KIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180307; x=1694785107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHjM2ya66WX0/5H36CrFNVi44p+9MAVeN7j+54P9buw=;
        b=acpD3ymJs8rgM+ayYyb6lp3hUj3i9xsUWro6PeftMZXLzSG7+YYgj+6zzMap/CREqo
         hdvx7kxnt4k0tU8D5nt13ghWPLM0lftGU81bAPTT9Mtvt4CKsSUnYK1XbsvHAXF+9stf
         5V3Ym+p0KESqUSuELqbSCg75UEXh8SjL3ujovWOk1Kgtmq7dngEjib/MojRh1cSNxWfx
         EdOt+Xs/DIq9kjmUe5ihpcptdccrVIF5WUat/p/siMi2yoCeUz8hXP/f9HdPQVbAfMhG
         ZmiiQv9LkFjJnM4952gPYHXpzdUO9gFhzUIZAs46d7YDxNjk5tO4oQT5ERzwUK0DKmhf
         pbrQ==
X-Gm-Message-State: AOJu0Yz7R5qtHinmgU+7TN1H20knVRqXGF599ruUBiid1Rgjh1b1mGCf
	lh5uk9DLQ+C0R/hOH9DwjiAizl7M98Y=
X-Google-Smtp-Source: AGHT+IEJbndcK2E8a9il3rD17IZIme+MpspEGPINEWSMFeof8QLYKpp4GY/fV2jSJv9kOkghGOLrSA==
X-Received: by 2002:a1c:7908:0:b0:3fe:2463:2614 with SMTP id l8-20020a1c7908000000b003fe24632614mr2288550wme.24.1694180306838;
        Fri, 08 Sep 2023 06:38:26 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b00402f7b50517sm1856285wms.40.2023.09.08.06.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:38:26 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2] pybootchartgui: also match do_compile and do_configure subtasks
Date: Fri,  8 Sep 2023 13:37:56 +0000
Message-Id: <20230908133756.720810-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:38:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187419

This will match other deviation subtask of the same main task,
a couple of them can be found on oe-core layer:

 do_compile_kernelmodules
 do_compile_ptest

 cmake_do_configure
 setuptools3_do_configure
 cargo_common_do_configure
 python_pyo3_do_configure
 python_setuptools3_rust_do_configure

This task will be also painted with the same color of the main task
but using alpha blending.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 3d1ff695c1..c6e67833ab 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -659,12 +659,21 @@ def render_processes_chart(ctx, options, trace, curr_y, width, h, sec_w):
             x = chart_rect[0] + (start - offset) * sec_w
             w = elapsed_time * sec_w
 
+            def set_alfa(color, alfa):
+                clist = list(color)
+                clist[-1] = alfa
+                return tuple(clist)
+
             #print("proc at %s %s %s %s" % (x, y, w, proc_h))
             col = None
             if task == "do_compile":
                 col = TASK_COLOR_COMPILE
+            elif "do_compile" in task:
+                col = set_alfa(TASK_COLOR_COMPILE, 0.25)
             elif task == "do_configure":
                 col = TASK_COLOR_CONFIGURE
+            elif "do_configure" in task:
+                col = set_alfa(TASK_COLOR_CONFIGURE, 0.25)
             elif task == "do_install":
                 col = TASK_COLOR_INSTALL
             elif task == "do_populate_sysroot":
-- 
2.34.1


