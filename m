Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B82C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 13:15:27 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.11332.1712322918843812192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 06:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JAJoxQW5;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-432b72c706cso16635601cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 06:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712322918; x=1712927718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQ2FweSROPNzLbnTRECQJnSBzyoozr0oSomcjwYzxEE=;
        b=JAJoxQW5cIfoG960/X8GW/a5UG35HBWioZONXwcayTMTYkYQhHCYNWRMjT1m1hWjQI
         +Z+vPewH4ITG9tT2TJGRSGRIVn6jxCV2BecTiP/QlyRucEmCzFMxTKYkx4mntp9lOZ9h
         HccpUraWOeJ429ZBnQI81bqbLP8V/BXxoyqw/bDFfZpxXYbGc19i8WNAQv9NqD0jfbSW
         CKEZF1PzHkE8GgQmGlZJge03n61mHnlrdbnbG7ID6h54XsjF3ijPJehfLsgLgDgd5qD5
         i9ljUoHE7awAMvlA/+4U6erYndcvKXxhO1TRXPwz0xws7QirILPdZ/vHtvr4X74WTKdU
         RTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712322918; x=1712927718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQ2FweSROPNzLbnTRECQJnSBzyoozr0oSomcjwYzxEE=;
        b=atfSNv3Tm5gsg/QbB3Oe/l3dHcZExBCjZxAHO1zAGYJQVUPnCEtDwZzPXeqeVoyMe0
         hbv9f3T6WG0dE2mU8z8OtJ6G0WcowoDTIHuCfJbhOCQY8P7lpSHBj5v/USDehHGPKrG9
         m40nADHwFrvgNJ88d4xQITiMcKVuMo4228qXqagW8tPny4fuSdS7G0WLNM+LkuDUjJOd
         bQp9XkwfO/ivMKK4Ou5Ks4gYxrUXwx87ftt5ZdtxuQ/84I/NRu0TUzYWM1Mg2POlN8rG
         AT3bf7vuOaGJO1iayf6SJmVzJn9YFfhNeukCQQU9Q1J3yQAqSSpN8nNxWqkm8ajOOOs/
         O+5A==
X-Gm-Message-State: AOJu0YwXBabmgObUcFr6Sd7gZR9twQuUJ4H0Jh+HcLlxCVpGD36KbSQw
	I/lJdpIUd+uzPGwk3Pj5ixQYIeq9ycnurAnx/RsW840QMtcaURmm
X-Google-Smtp-Source: AGHT+IF66Hbl9X8olXGqXRmSZRjstmhT+5uhifgyL9auyKpM03005700pFfSpVjT2nIy6XPzjHiauQ==
X-Received: by 2002:a05:622a:304:b0:434:6095:3ba1 with SMTP id q4-20020a05622a030400b0043460953ba1mr1696652qtw.23.1712322917760;
        Fri, 05 Apr 2024 06:15:17 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id hc15-20020a05622a2a0f00b004318358451fsm740869qtb.75.2024.04.05.06.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 06:15:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][RFC][v2] perf: make bpf asm include arch conditional
Date: Fri,  5 Apr 2024 09:15:16 -0400
Message-Id: <20240405131516.4056515-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 13:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197986

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To keep the perf source copying as small as possible, we can
further refine the arch/uapi copy to the single file that we
currently need.

To avoid a warning from the general perf source copy routine,
we make the .h conditional based on the architecture.

The supported architectures will not change often, so updating
this arch list is very minimal effort. Alternatively, we could
add a PERF_OPTIONAL_SRC variable and not warn if a file isn't
available for a given architecture.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: As suggested by Max Krummenacher <max.oss.09@gmail.com>
powerpc doesn't need to be listed in the architectures that
require this file. I've also clarified the comment in the
recipe to indicate we are only listing supported archs at
the moment.

Bruce

 meta/recipes-kernel/perf/perf.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2f540cd54b..095ec0f281 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -129,7 +129,10 @@ EXTRA_OEMAKE += "\
 # honour a JOBS variable.
 EXTRA_OEMAKE:append:task-configure = " JOBS=1"
 
-# include/uapi/asm is for: include/uapi/asm/bpf_perf_event.h
+# the architectures that need this file can be found in
+#    tools/include/uapi/asm/bpf_perf_event.h
+# We are only listing supported arches at the moment
+PERF_BPF_EVENT_SRC ?= '${@bb.utils.contains_any("ARCH", [ "riscv", "arm64" ], "arch/${ARCH}/include/uapi/asm/bpf_perf_event.h", "", d)}'
 PERF_SRC ?= "Makefile \
              tools/arch \
              tools/build \
@@ -140,7 +143,7 @@ PERF_SRC ?= "Makefile \
              tools/scripts \
              scripts/ \
              arch/arm64/tools \
-             arch/${ARCH}/include/uapi/asm/ \
+             ${PERF_BPF_EVENT_SRC} \
              arch/${ARCH}/Makefile \
 "
 
-- 
2.39.2


