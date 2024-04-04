Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109F9CD1296
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 20:47:14 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.3589.1712263628766628374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 13:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EO0YvX0w;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78d423ab87dso60160885a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 13:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712263628; x=1712868428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwNkPuX1wVCsUBt3ZV/vt/aRFtMVdbPoFMzgKhq2OjU=;
        b=EO0YvX0wBFgmJ+rTSVsNiJ004lUUsND79D62UHqL65xLGmqefDDt75Uc0UTk5LGYgy
         R+10oH/8bwz9F90imkKcFC84WIYTowX+TWlg+Wh1HmrGday8WzsPM5WqOC3OPbrhbZwP
         QjQCuREHUTiiu7GPUT4ouhoptJDKHVZj0LT+Amg5i3WnXw2YcOfcc3+/NRjNMcO167Mk
         l+LquqkhLhb3dQBjl/YFg1xE+lGU2WouJb9Jor2gRwekDMurFaUQnFC0dJMTVq1KR17Y
         2R0C9bf8UKx+Jp+YfJ4NwOCbRTsJj/+OIR0DnkAl4oF5gR8dibCNRN7+JPa2QIw/MloD
         kB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712263628; x=1712868428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwNkPuX1wVCsUBt3ZV/vt/aRFtMVdbPoFMzgKhq2OjU=;
        b=Te20HVUh7v/oKOkqYTp9qoady7pFXeoRCzOU0WVrE1ycOEmVrc43BZngiHYFfJGgBP
         jqaSLoKg8vIlOIglAewFezNxOZfYKv4Cb1OnvJBtLSbeDRLm/Fmcgc5ZV5Hf6KyWvXFb
         y7oYjhNfm5JRX2qEw6QAjUooEbZZUrXfUkm1YiPXxSPn3ePTboAWYCo+ibsjleIcoQrU
         EWNdbs3SOryb29XTQh6DTyrUIVJ5Z4cyJfDjkMivIcdu7lPtpUz5vtoREoGpSIaLzBgZ
         YrooXWxx7ZkDniI5gtky6nWjZWRFVTcMyJubxD2EuxLrSFLVFCWBurANSGPmbfVOu4lf
         3i/Q==
X-Gm-Message-State: AOJu0Yy5t2cEdaKXSCt5C+5UCG1LWp1YmJfvYmL1XzqkW9OBqt2hhtcU
	70X+AlchS2OJjBdNwIWDmu0WYkHM9arhVt1b2Sjhz3kZSg9fsNTJ
X-Google-Smtp-Source: AGHT+IG9NfCQCTomrbYu/800W3ABs2hJfdM7pVd9FZzqYLqkYh4gpGNms4fvQYIMOO+RqNp6GBfAvQ==
X-Received: by 2002:a05:620a:1245:b0:78b:de23:f2c9 with SMTP id a5-20020a05620a124500b0078bde23f2c9mr696200qkl.73.1712263627728;
        Thu, 04 Apr 2024 13:47:07 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id u14-20020a05620a022e00b0078d3ad47448sm69359qkm.104.2024.04.04.13.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:47:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2][RFC] perf: make bpf asm include arch conditional
Date: Thu,  4 Apr 2024 16:47:02 -0400
Message-Id: <20240404204702.3380236-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404204702.3380236-1-bruce.ashfield@gmail.com>
References: <20240404204702.3380236-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 20:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197973

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

This is a further refinement of the perf header that
is required outside of tools.

I'm trying it this way first, versus making the perf
source copy not warn on missing files, since we risk
skipping warnings we want to see!

Bruce

 meta/recipes-kernel/perf/perf.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2f540cd54b..3cc7f63610 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -129,7 +129,9 @@ EXTRA_OEMAKE += "\
 # honour a JOBS variable.
 EXTRA_OEMAKE:append:task-configure = " JOBS=1"
 
-# include/uapi/asm is for: include/uapi/asm/bpf_perf_event.h
+# the architectures that need this file can be found in
+# ./tools/include/uapi/asm/bpf_perf_event.h
+PERF_BPF_EVENT_SRC ?= '${@bb.utils.contains_any("ARCH", [ "riscv", "arm64", "powerpc" ], "arch/${ARCH}/include/uapi/asm/bpf_perf_event.h", "", d)}'
 PERF_SRC ?= "Makefile \
              tools/arch \
              tools/build \
@@ -140,7 +142,7 @@ PERF_SRC ?= "Makefile \
              tools/scripts \
              scripts/ \
              arch/arm64/tools \
-             arch/${ARCH}/include/uapi/asm/ \
+             ${PERF_BPF_EVENT_SRC} \
              arch/${ARCH}/Makefile \
 "
 
-- 
2.39.2


