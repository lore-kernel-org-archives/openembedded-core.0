Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A53C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 05:45:12 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.47914.1638769508505825781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 21:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IWIXH1Bu;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so9914388pjc.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 21:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o1C1q5CGMnWDB6m42rDM94Gju20i92G/SyKCOa2ykjw=;
        b=IWIXH1BuMWEbdVmU3LkM/LsIndv9LvrVE00oTBa+hJgj9R9brfx2ySzTFAnkdU84AW
         w+e0HLO2rbr+kcRw5oRydT7ke9p+PqmVbP34qAV2RLwUcdUNmuayFoPO8LRAQBorAObN
         4P1zhIt1OaJXMI2JvDu0kKxYQ7tN+kuizNfq/RffjAs/UCDWyZqy3V/vNG/LLZACbBSO
         LCbEjGSrKIhSdMJRkD7B+9LE4aHZjUPcKc2Sicd8/kdloRWGihOGXBNtH5BqscnqLx0m
         hHeMgG0Yhkpqia07v96HJXyxaDOSc+8hXTYWPoq76wbq1MgeE9lFAgVweRv1wgPwh3Cz
         hZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o1C1q5CGMnWDB6m42rDM94Gju20i92G/SyKCOa2ykjw=;
        b=stdrBxMHL4zdWQrrUug50qh4gzbaFSndFdovKjdJqpj66F/gOC1vNYO4ZkBVeFFjIW
         dpuRGIYo+Q646Nhmv+xFf2+Dr2hfQ1FyvWn+B93qAy7oQ4+6eA73jtvzxOdLbeuEBRav
         jRiNwu3qRR9N4d1BB/JP+j3LllHVBoikr4cQ+GkJbsxrwf44Vlg/DBJHc7YTzEelI68h
         Fhks3usX9+Z2uzi3/aBC/4zt231jdRhNmCnWS6wRHdB27qpEBkpgD14pmeJ+MZ1/TbUi
         FFTa1+OrJOV91gYi5vX6zkR12uO9gackjYXMG2nZAzqLY83VqDkoxjx3cfhenBZ7fNoi
         FsXw==
X-Gm-Message-State: AOAM530e+ObESeNVbPSrWx5Zzb9fNO7twj1G6F/hSnZcwVWSSM8YGwJm
	bJJXQTlA9kIKCc9w3E7iP7oZX0UAJT4=
X-Google-Smtp-Source: 
 ABdhPJzz7v+L1YDfLGC81WQ4XE2Md+hxIykZkw/BrODqJzTONQRTqFZ7yGoOq/3vVG/ImVsTS9yIPw==
X-Received: by 2002:a17:902:9f98:b0:144:e777:f88e with SMTP id
 g24-20020a1709029f9800b00144e777f88emr41753670plq.31.1638769507829;
        Sun, 05 Dec 2021 21:45:07 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 p2sm8693286pja.55.2021.12.05.21.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 21:45:07 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] Build libstd-rs in release mode to compile mozjs
Date: Sun,  5 Dec 2021 21:45:04 -0800
Message-Id: <20211206054504.61115-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 05:45:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159205

When mozjs in firefox is built with DEBUG_BUILD = "1"
in local.conf, it will fail with the following error:
   rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_div_rem
/asymmetric.rs:57:
   more undefined references to `core::panicking::panic' follow

Switch to building libstd-rs in "release" mode as that works
around the issue and builds mozjs successfully. This is a
work-around that can be used until the root cause of the debug
build error is resolved.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/libstd-rs.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
index 987956344a..96eaa2bdc0 100644
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -19,9 +19,12 @@ RUSTFLAGS += "-L ${STAGING_LIBDIR} -C link-arg=-Wl,-soname,libstd.so"
 
 S = "${RUSTSRC}/src/libstd"
 
+CARGO_BUILD_FLAGS:append = "${@' --release' if d.getVar('DEBUG_BUILD') == '1' else ''}"
+
 CARGO_FEATURES ?= "panic-unwind backtrace"
 CARGO_BUILD_FLAGS += "--features '${CARGO_FEATURES}'"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
+BUILD_DIR = "release"
 
 do_compile:prepend () {
     export CARGO_TARGET_DIR="${B}"
-- 
2.31.1


