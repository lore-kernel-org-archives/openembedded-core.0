Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FB0C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 19:53:22 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.64970.1699300395625203822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 11:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9/z8F3n;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9dbb3e0ff65so675716966b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699300394; x=1699905194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WhGWrOdFLlcx/A4LoL7zyfQEceXN6aSy6oFj3kgjkw=;
        b=R9/z8F3nDIrHL6uSBCMr5GPZUfRiJ+8Wa7aXr7w4qG2EuW5AvftteQMIgRYoZUEYcu
         WHyEpM8Dk3FJMWysUOo2yrtUeVEk++DS0OWuTJ0k/f5TdYDIj5Nk++VMD4Xq+IKo8IwI
         w0fpo0+np3FrMVboH5yr/dIG9FkR7MQVnPGqWNhck28UclZjf+GXzIEhBRIAcrjRm39c
         EL8qHKUYf3Krz2u789hvDzcfpW021mO9/YA4MASqPoEyOHA0PK/7kLWMrHT4zimVC4Zx
         YvJQ0qxvJNFiu09RP796K1uVbbZkOlK2PSckPo5ANWFlJbB8MfrEfium/R5A4rn8znj1
         TDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699300394; x=1699905194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WhGWrOdFLlcx/A4LoL7zyfQEceXN6aSy6oFj3kgjkw=;
        b=mjL7wZDdC0dx88stykRtdBR9GyXUpYBFH28bmfSD7rtoVtiSyxHSBsxTbvPfxIQiEQ
         sAz2wltA7uiQW2/8gFHnizPwW8GpKnHpFZ1hjEfcIUwAnBui4R3VkLT6nPOzs+CvV3eN
         baGY73sLVJPCNBaqXpe+EzJiQGmZZoIIJBypagWoXPlkYHonxbqlFVtJFfsvsMIh7kq3
         E1z2oOJ9FBrLs1JzL7aZaK0cLwCW/qN1BMS07urt/j+cY+EsyvUQNl1qYY0012Rc/RBY
         IsFuex0fZRUZW/4iWXs78NqyV9FO+DoP01srwXcLwVKlViY0wqeiBc591PuX3VlMVz2D
         aEJA==
X-Gm-Message-State: AOJu0Yzs04STy28QzJGfSfUEwzVJ3AFwAe4LM3OYd0GJDif3WUCqdd2/
	+mHnNQ2i22q4XwU8priD7GMO33zmHys=
X-Google-Smtp-Source: AGHT+IEZr1dLQE4xhW24JAaQtudF1x4agm+ezLT10RHM4M/F9pYRuxjQZMCAi2QiZlIvqxPjAG/Q5w==
X-Received: by 2002:a17:906:eec5:b0:9bf:5771:a8c8 with SMTP id wu5-20020a170906eec500b009bf5771a8c8mr13712801ejb.69.1699300393464;
        Mon, 06 Nov 2023 11:53:13 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id jx1-20020a170906ca4100b009cd52d08563sm186462ejb.223.2023.11.06.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:53:13 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@bmw.de,
	bruce.ashfield@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] perf: fix build with latest kernel
Date: Mon,  6 Nov 2023 16:52:19 -0300
Message-Id: <20231106195219.3851918-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 19:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190245

From: Max Krummenacher <max.krummenacher@toradex.com>

Kernel 6.7-rc1 commit 02e85f74668e ("tools: arm64: Add a Makefile for
generating sysreg-defs.h") uses files from arch/arm64/tools/,
gen-sysreg.awk and sysreg.
Without the files the build of perf fails independent of the used
architecture (confirmed with armv7 and qemux86_64).

As arch/arm64/tools/ has been added with 5.13 allow perf to build
even it that directory does not exist.

Add arch/arm64/tools/ to PERF_SRC.

Fixes:
| make[3]: *** No rule to make target '.../qemux86_64-tdx-linux/perf/1.0/perf-1.0/arch/arm64/tools/gen-sysreg.awk', needed by '.../qemux86_64-tdx-linux/perf/1.0/perf-1.0/tools/arch/arm64/include/generated/asm/sysreg-defs.h'.  Stop.
| make[2]: *** [Makefile.perf:456: arm64-sysreg-defs] Error 2

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 5 +++++
 1 file changed, 5 insertions(+)

Hi all

I see some other options:
- drop perf support for kernels<5.13 and simply add to PERF_SRC
- drop the bb.fatal in favour of continue and simply add to PERF_SRC

Any comments?

Thanks.
Max


diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 675acfaf26..dae9320169 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -117,6 +117,7 @@ EXTRA_OEMAKE += "\
 # honour a JOBS variable.
 EXTRA_OEMAKE:append:task-configure = " JOBS=1"
 
+PERF_SRC_OPTIONAL ?= "arch/arm64/tools"
 PERF_SRC ?= "Makefile \
              tools/arch \
              tools/build \
@@ -127,6 +128,7 @@ PERF_SRC ?= "Makefile \
              tools/scripts \
              scripts/ \
              arch/${ARCH}/Makefile \
+             ${PERF_SRC_OPTIONAL} \
 "
 
 PERF_EXTRA_LDFLAGS = ""
@@ -162,6 +164,7 @@ do_install() {
 
 do_configure[prefuncs] += "copy_perf_source_from_kernel"
 python copy_perf_source_from_kernel() {
+    sources_opt = (d.getVar("PERF_SRC_OPTIONAL") or "").split()
     sources = (d.getVar("PERF_SRC") or "").split()
     src_dir = d.getVar("STAGING_KERNEL_DIR")
     dest_dir = d.getVar("S")
@@ -171,6 +174,8 @@ python copy_perf_source_from_kernel() {
         src = oe.path.join(src_dir, s)
         dest = oe.path.join(dest_dir, s)
         if not os.path.exists(src):
+            if s in sources_opt:
+                continue
             bb.fatal("Path does not exist: %s. Maybe PERF_SRC does not match the kernel version." % src)
         if os.path.isdir(src):
             oe.path.copyhardlinktree(src, dest)
-- 
2.35.3


