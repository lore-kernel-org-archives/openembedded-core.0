Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05BAC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.267.1714512271675271224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hWBRT4yV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ec486198b6so9677925ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512271; x=1715117071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbbHASvjgVBahji6ntTnrPziFn/USPk3oaC9uAVLbb0=;
        b=hWBRT4yV1UVoX//QgN0pryusNW21LoWUoy0sOoeetk3AAXj2KHU3wy0EiSAyYAsS5e
         8SWwjWZFpfxqJIgqCUU1CeDUFnXVibwAvVMeSo+hk4YQbjDJMn0RekMJdkRnB+XJ5fvE
         OM63PrC6LaRO9LqqO1K05uQEeQjlexgduNaCQrsEr1peyBerqZ9P67Ssudz19fckC1Vd
         gDfzO2wlkSvsOWn9xUSE3BDL7835IwUpFQJ8yn5WqkfBMX0yG34FySfRWgtFCMwVxiP4
         CXgvOgHCCXu3BhSs8bUxJkr+6+vtlXo9fZvOtimozzz1W83WMWPQmSbLleaaos4B+xeV
         /Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512271; x=1715117071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbbHASvjgVBahji6ntTnrPziFn/USPk3oaC9uAVLbb0=;
        b=bb24BRs4bt1cQoFGKpvoUUTCB9WaZZYUZ326nhlBvgruzzxlHz+GPP4m7HAixrbItv
         vj2M/myfE06C2mmkyldL/+8hTkYRPOzxjnvt94yQ8pEsBrl6ME2/6VlGx0GWuNSniUHw
         EFiTqWUkCnuGiUkFls+eB8SmVCsrITrnDowxzlie7BD6ucYBzH3FXrkaK5Kin0iK9qz4
         t60w3u+zQHAvJd21e+jMq5puDKJ8ECL5XGzJfpuuxRxEt7/Y5XhQfLd3PXMAZDeb0v5v
         0pk6NmqcK14SWxa+xnsf9/kmpfMCvJGzLr2eXrgRfLI2hQIlYxIQLJoDzW3LilsHK4WA
         s2jA==
X-Gm-Message-State: AOJu0Ywo3lo211ebrGWL1gmo6FgGHhGF5gHB/X6gzVFRahvo1R8Nr+7l
	g6jsapuYw27Nsb4wUPS5LTr2BqeKrwFPPOZDpTQuBEjbWz1RLU+NsclrfYF6udRLs7oUJLLMFo4
	nmU8=
X-Google-Smtp-Source: AGHT+IE3NTnpNNyay3CTW0b/94PNg5uuAVEKgaQoqFc+mQdCu58/hlVa8bCjJNQPGFXWEnyZooc+BA==
X-Received: by 2002:a17:902:e551:b0:1e2:6165:8086 with SMTP id n17-20020a170902e55100b001e261658086mr661686plf.61.1714512270941;
        Tue, 30 Apr 2024 14:24:30 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/17] babeltrace2: upgrade 2.0.5 -> 2.0.6
Date: Tue, 30 Apr 2024 14:23:56 -0700
Message-Id: <0aac0507e769d3d250b0c649bdec821eb333349c.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198775

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* bt2: disable some warnings for 'native_bt.c'
* bt2: compile 'native_bt.c' with '-Wno-undef'
* Fix: src.ctf.lttng-live: expect NEW_STREAM/METADATA for inactive streams
* Fix: 'babeltrace2 convert': don't consider the '--plugin-path' opt.
* include/babeltrace2/plugin/plugin-dev.h: "define" -> "definition
* Fix: doc: escape double quote in bt_p alias
* Fix: bt2: pass _TraceClassConst to destruction listeners
* fix: 'load_module()' deprecated in Python 3.12
* tests: retry os.rename on PermissionError failure in lttng_live_server.py
* doc: fix uptream -> upstream typos
* fix: test_message_iterator.py hangs on Python 3.12
* plugin-dev: mark symbols meant to be public with __attribute__((visibility("default")))
* Silence -Wunused-but-set-variable error with clang
* Fix: Windows DLL path lookup with Python >= 3.8
* doc/man: make default values of boolean init. params. clearer
* RFC: docs: fix: Match stated automake requirement
* fix: make flake8 6.x happy
* fix: running black on python 3.11
* bt_query_executor_create_with_method_data(): fix docs note
* Fix: ctf-writer: null dereference in bt_ctf_trace_common_add_stream_class
* Update working version to Babeltrace v2.0.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5f05da60ca888456900f9fb0a52ef07db754c06)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
index 9a4007fb25..d6c75d7580 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=http
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
            "
-SRCREV = "66e76d1ea601705928899138f02730a3a2a3153d"
+SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


