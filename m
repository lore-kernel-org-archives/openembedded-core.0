Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA760C71153
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 14:36:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.19040.1693319762911581031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 07:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kPF7iiR4;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so3733257f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693319761; x=1693924561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wCdoU2KAD7OhNZdEEOtYFyvzrlmT9MqwX7hU9Tt6opI=;
        b=kPF7iiR4GFUkplLMFm/NXAKyx6UGPnHRTUwX4Y4rwpNaNFm6lX8RCsO4UgcfCJXMUZ
         F/ba23NJEC3XTeDNUxeWVJ15SGpLWCR0zr0WmfHrFcoE1t82lQqSoJmwJNr5yyiA0WMb
         d8MtbGZ0h+Rr2W59tjeDDVvfijDvYdYvwR+eHgcHfqwj1Cp8waA+61+hoXmxxG5eHvF+
         wEHYymPpfWgla1xE8nBw47llA/LF1MVVrEfGfEgr+DiD7j8Zq74a2dYF3L9Wb1SMj90b
         3TrryukgFnQCcgFNOQsvnLLXAOccRPvbOLfDp/gIWNuAXYgIujiWiIvty9spK+do5lI4
         JdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693319761; x=1693924561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCdoU2KAD7OhNZdEEOtYFyvzrlmT9MqwX7hU9Tt6opI=;
        b=JJO0VOtwxhPMCO7o+TXiQeDzb706Jdnp4eOdpr7WBruIzqE9beXNkysUrufLoZLGNu
         8StkhmgeF99cMDrFFXxWhmiLw4u6uUUUdgGzA7RN7pqXBt7N0Qi7f3AlQoW8K5lrSLFe
         n68IB1Qw2Nk5LPw3sQvjypIn1TrGkWH/LBZV1PdIVhSqsPv6RrUdFwRNEUfxMVWUYdZr
         bQSOtIsROpxLfiaMvCThrvxCHFmMJbgoLY2ItAiNrcXB7+jE0OYHkZbiWVg9FRJcTCa3
         MaD9kFpuCjdJvuo0n2ezWUpXXhF94FnY3POKL9FZ3teXtUy0vcvnMCMiRACj+hwPtjJT
         XhKA==
X-Gm-Message-State: AOJu0YxAPxolqKtdYo+ux3UHwAGXNZE5kJT+lpUwkS61u12w41JSKc0l
	gEzdHJi83TqkYFiSMSApfo6s+SVd5wv8suLk
X-Google-Smtp-Source: AGHT+IEpdXdGt2r+InIhZbFmplmVzK3ZBCIQvEO8xGvfiOWhPqR2JdmHAzp0/Mhn/770Ck04XSJbfw==
X-Received: by 2002:a5d:670d:0:b0:317:6cc7:6b21 with SMTP id o13-20020a5d670d000000b003176cc76b21mr20912725wru.69.1693319761044;
        Tue, 29 Aug 2023 07:36:01 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0acc00b003fee6f027c7sm17209760wmr.19.2023.08.29.07.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 07:36:00 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] pybootchartgui: also match subtasks of the main ones
Date: Tue, 29 Aug 2023 14:35:41 +0000
Message-Id: <20230829143541.3837919-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 14:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186862

This will match other deviation subtask of the same main task,
a couple of them can be found on oe-core layer:
 do_compile_kernelmodules
 do_compile_ptest
 native_add_do_populate_sysroot_deps
 do_package_qa
 cmake_do_configure
 setuptools3_do_configure
 cargo_common_do_configure
 python_pyo3_do_configure
 python_setuptools3_rust_do_configure

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 3d1ff695c1..2beb3c7c67 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -661,20 +661,20 @@ def render_processes_chart(ctx, options, trace, curr_y, width, h, sec_w):
 
             #print("proc at %s %s %s %s" % (x, y, w, proc_h))
             col = None
-            if task == "do_compile":
+            if "_setscene" in task:
+                col = WHITE
+            elif "do_compile" in task:
                 col = TASK_COLOR_COMPILE
-            elif task == "do_configure":
+            elif "do_configure" in task:
                 col = TASK_COLOR_CONFIGURE
-            elif task == "do_install":
+            elif "do_install" in task:
                 col = TASK_COLOR_INSTALL
-            elif task == "do_populate_sysroot":
+            elif "do_populate_sysroot" in task:
                 col = TASK_COLOR_SYSROOT
-            elif task == "do_package":
-                col = TASK_COLOR_PACKAGE
-            elif task == "do_package_write_rpm" or \
-                     task == "do_package_write_deb" or \
-                     task == "do_package_write_ipk":
+            elif "do_package_write" in task:
                 col = TASK_COLOR_PACKAGE_WRITE
+            elif "do_package" in task:
+                col = TASK_COLOR_PACKAGE
             else:
                 col = WHITE
 
-- 
2.34.1


