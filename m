Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3815EC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 10:21:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.48416.1711362099533822048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 03:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CK2ieKpA;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56b0af675deso5087536a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711362097; x=1711966897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRSwF/CXh/s3tOZttVwLhP9J/WoctFJsVTUiVqtoUf4=;
        b=CK2ieKpA60ciM36i96bGT5ApeDAlU4p6D8zyAxA/KdQRY89GthMlO5cjhyfthktAn/
         PZFGsSxm90rN8YBsTHG7zDXUllAddAZY3Py8wlN0AquxtlNx6GpUD4JBbQ5pQ4IwgAts
         BWlT+1qU5SLJf6DqVw3j1qMZYBN72zHFG8F+A1q5w5cY7LeUNM6SasCk9+3tCiMb1YvD
         iHzM5KoVixnuGtoxSGY99B/2Q/EnAcMETHInJuKFuWO65Mfvp+4Z1jYiDjcxcqkC2KGC
         86Di+Yf02dwYXhpB8qKUmvl4aI1rc17rImwwnNMRGbjBDoynfCxXB+SgA63hswbm4JIa
         WxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711362097; x=1711966897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRSwF/CXh/s3tOZttVwLhP9J/WoctFJsVTUiVqtoUf4=;
        b=Ynpmm1l2JXbtjfRKbcOew7aPdHJErcO4fyquOQx/ScFAgN2KMGq7dHBSbmak4IAmCf
         bc0ma7SYQEjq0BBMuQZb2s2JZEYNgcrjDx0Ee++QuFIZ+pgctOiyjYL2VIVpvOYc8zdl
         5z26iSynElWDneuW1tpJcgdFumkEWofvHUS90yqnoms9VSH564GKB+WtHAnHr9p9hOUD
         kYxpgh9aht3WRjqpPJtilJcepjMQXCcCYa6dpgnat28u3SY56FC+m3AdshwveUiZ8KOe
         4PnrFtPRURU2oyYpx+nR/C88X2H4RufEZZ/srcyrawVu7u3SzjR22RRO1duRpdaROrmF
         SS+Q==
X-Gm-Message-State: AOJu0YwVznWGIaLIRV3bQAKuZ58jdgQhSYejc5/ajeXp8TWHlVq14PF2
	jAKHYArleFq1DYVlXbBX0fhRuGakPeQELBISE32ycLaIqGbqzTtWakUBxm4d
X-Google-Smtp-Source: AGHT+IG+KbX1mR77+v1leagiCUBUXUyMKQAh27sa0LeClyLrEFJA5HavH/bkE9cfthFz9UhBBOicDw==
X-Received: by 2002:a50:874b:0:b0:56b:cfef:b2de with SMTP id 11-20020a50874b000000b0056bcfefb2demr4923073edv.26.1711362097406;
        Mon, 25 Mar 2024 03:21:37 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id r13-20020a056402018d00b0056c18b79cd3sm423441edv.22.2024.03.25.03.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:21:37 -0700 (PDT)
From: max.oss.09@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v1 1/2] perf: fix build with latest kernel
Date: Mon, 25 Mar 2024 11:20:54 +0100
Message-ID: <20240325102055.1037135-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 10:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197483

From: Max Krummenacher <max.krummenacher@toradex.com>

Kernel commit 9eea8fafe33e ("libbpf: fix __arg_ctx type enforcement for
perf_event programs") added with 6.9-rc1 tools/include/uapi/asm/bpf_perf_event.h
which for arc, arm64, loongarch, riscv and s390 includes headers from
the arch/${ARCH}/... directories.
Thus the build in OE fails as those headers are not present.

Fix this by additioanly copying all files in arch/${ARCH}/include/.

Fixes:
ERROR: perf-1.0-r0 do_compile: oe_runmake failed
| In file included from work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/linux/bpf_perf_event.h:11,
|                  from libbpf.c:36:
| work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/asm/bpf_perf_event.h:2:10: fatal error: ../../arch/arm64/include/uapi/asm/bpf_perf_event.h: No such file or directory
|     2 | #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 4f26813de0..6408c65462 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -139,6 +139,7 @@ PERF_SRC ?= "Makefile \
              tools/scripts \
              scripts/ \
              arch/arm64/tools \
+             arch/${ARCH}/include \
              arch/${ARCH}/Makefile \
 "
 
-- 
2.42.0


