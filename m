Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F702CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 20:47:14 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.3586.1712263627210626884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 13:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+ro2QZ/;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78a5580333bso82880485a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 13:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712263626; x=1712868426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DL+MeZGRBiU6A2gb25Vk70F/fOYVqkmhBT9rQ/2D8kQ=;
        b=k+ro2QZ/ks5PA+uytgWZr11RB11YLWj15HxK1J6vZ1M1Mls5wqJGmuz8afWPWcAhYJ
         AOnt8uJqcH+vARNknOcPqkNW6dsUBn+RcR1d7X/GwwkP+8i7NAPGyu0+E2llYWGCPqNU
         ClXekoK+hbM6P3+n2QbYaLu1DxtTTYD9J8apfgCLCWmY01JQPyT3LoGyGdECTS1zej6T
         sU36yabsXY7831tViqWp2kkNMNoHCDXgKJFUQV8JNi2tFa8JnLx5d1jIGhRWWnZvuMJo
         VWlGBe0spQ+y84V97C9Eyb+X/Pqk2oOgJoafE6f22R3YSxnj5/qr1OXp8Wl0q8RKS6OX
         C1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712263626; x=1712868426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DL+MeZGRBiU6A2gb25Vk70F/fOYVqkmhBT9rQ/2D8kQ=;
        b=Bgqdhg2mn31t102Fq5+TBU76Lot66sFPjpS2GCTwdh6vD4Bljaaqr4LD6ts+oC+7OT
         LwYhTWey+wxbkaky3Z77X+t22G/s3r9lXrtw+vHv8uJUcSJa0785LrKDJNqG86l4/2n0
         cAGJZbZIDsV6o35zNaXMOOek01gaIYYv4ShQhV1br8PG6R9f0hKlo0/p/KDszp7vG/hz
         uxhgycGmtkNuObyIKQVbEoqZsgMXrrykzZKTHfBx456iDsV6rh2mFHuNJoTtRFfI//qf
         aGljDYlmgAh85apv7Uj8P1DFnSNywFMxw+qCGKLYO4uC7KItbtMiNRNFaPpSYM1TsBok
         y01A==
X-Gm-Message-State: AOJu0YyTdpmvm+Um4eg1sEctiJYnBhepbRAT+RWOSlRa6z1qCSQgGcdT
	ncdzBvtZLDgv6VZIqgqN+ZXvFLRzkdde+JNPuvVTdcmXxiQMzxoy
X-Google-Smtp-Source: AGHT+IE5n+Mqo+1i+zRUzyAmSx8Jvf0BHpU/5BKWYRe8qNZGmEArxGAqmkjfpaa0KupYaU8+jOwdeA==
X-Received: by 2002:a05:620a:2401:b0:78d:4450:304d with SMTP id d1-20020a05620a240100b0078d4450304dmr2986948qkn.59.1712263626213;
        Thu, 04 Apr 2024 13:47:06 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id u14-20020a05620a022e00b0078d3ad47448sm69359qkm.104.2024.04.04.13.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:47:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] perf: add asm include required for v6.9+
Date: Thu,  4 Apr 2024 16:47:01 -0400
Message-Id: <20240404204702.3380236-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 20:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197972

From: Max Krummenacher <max.krummenacher@toradex.com>

Kernel commit 9eea8fafe33e ("libbpf: fix __arg_ctx type enforcement for
perf_event programs") added with 6.9-rc1 tools/include/uapi/asm/bpf_perf_event.h
which for arc, arm64, loongarch, riscv and s390 includes headers from
the arch/${ARCH}/... directories.

Which results in:

  ERROR: perf-1.0-r0 do_compile: oe_runmake failed
  | In file included from 1.0/perf-1.0/tools/include/uapi/linux/bpf_perf_event.h:11,
  |                  from libbpf.c:36:
  | perf/1.0/perf-1.0/tools/include/uapi/asm/bpf_perf_event.h:2:10: fatal error: ../../arch/arm64/include/uapi/asm/bpf_perf_event.h: No such file or directory
  |     2 | #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
  |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We copy the uapi/asm directory to make sure the header file is
present.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This is a tweak of the commit from max to only include the uapi/asm
directory.

A second patch will further refine it.

Bruce

 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2c6ab060e3..2f540cd54b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -129,6 +129,7 @@ EXTRA_OEMAKE += "\
 # honour a JOBS variable.
 EXTRA_OEMAKE:append:task-configure = " JOBS=1"
 
+# include/uapi/asm is for: include/uapi/asm/bpf_perf_event.h
 PERF_SRC ?= "Makefile \
              tools/arch \
              tools/build \
@@ -139,6 +140,7 @@ PERF_SRC ?= "Makefile \
              tools/scripts \
              scripts/ \
              arch/arm64/tools \
+             arch/${ARCH}/include/uapi/asm/ \
              arch/${ARCH}/Makefile \
 "
 
-- 
2.39.2


