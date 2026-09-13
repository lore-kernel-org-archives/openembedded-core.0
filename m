Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A41C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 16:47:40 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2173.1789317254289944516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 09:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.225.141, mailfrom: aurelien.desbrieres@gmail.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso760145e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 09:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789317252; x=1789922052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNqfeCCgcaM8Lzi23mIZh61yrq5EWnVUMASCEN9LdtI=;
        b=cea8nfvBFyM10Ud0+8Ev0FM/51JftwmP4lFG5a0TN/zFMsLOiI+GRV+Ni/R2zKbXbB
         PqrkxmP2PNjtRRQfZpBe0s1y/fmCm61+IChrjhXBgdyd85gnuNoXhBnSPd5VoAoMUYst
         XtBxt0fldZgXiQvgI1vl7o0+6BP/J5kazgVQCpdGV9y22CyCe1o69GyQyRm9Xni8yQGK
         Hh50aQzjF41XJkUq+Yjcoboh3ihopilkkmOUjMbct2bVk44Rs67Nz4OM8C+u35rcnF7k
         PgaX9TvO56eq3IeQ5kruCfV0nb09aFWSugcljh6+lO8X+LEt9gjxHo12ovmNwlkP5KZq
         PCVA==
X-Gm-Message-State: AFuF++ma+7cHgyakaptGkQxzzVpoqqUZliBSY3pqoqMzUBR++W83iKIj
	pJXkGG5nXdP3/xxeagp9bwlAP4xSlOQMGowlZ4y59DZzbhqVn/S4LcpDplyZyA==
X-Gm-Gg: AYBFou04ELSK8JZpwRh7wIk7726rOQ5QIwe8lk+1owMFGu+jhOkjuLcPDxOW2fMPbfE
	8GfdpBzBnM9RCYlB4j80G4AAJvgGtSBqyn20fs31tNPgJUHBlcJ1/n+eEapQZrL5tNmTiuEWKVW
	bCBMAhod2RNlkVTYfRsqGVL2a9nKp/saFEAKApbJhLrxwZk6Hm2o/dVoTLgBcb/SpBRahsvHxLS
	xnZz9Dn0OEYdyJtLrP4KK6OYOvSiMle9F/eZ7dX8ahkZY6FKTWFAUs06j9tTlMWyzni5PPgh4wv
	rX3KF2WORxwWDBgSDNxh9Imiz9lVJukCwdQmp0BkbytPAu6p2uLjKT4E6sxnimb3z1VRkP57QoL
	ZAPVZO+l3i+ClK85k4oHvO7FB8xArLTjmqLLrEh8RdyRNGJnAqIik/DI/tpvwBNdyaDrlJlje+9
	7z0gGcolyFrSNNw/7CT9BahB500WanG04krJdhj2NaTLCiOJd/LG1IpAQOud0S0CymDdbq08CY+
	zuy/ru9RJG4n3rgTZRMuOjUqCU/xNL0vHlzNFzreCZCjgQ=
X-Received: by 2002:a05:600c:1c29:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49e61d2e5b7mr131569875e9.0.1789317252186;
        Sun, 13 Sep 2026 09:34:12 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm378995595e9.13.2026.09.13.09.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 09:34:11 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: openembedded-core@lists.openembedded.org
Cc: aurelien.desbrieres@gmail.com
Subject: [PATCH] binutils: disable gprofng for native
Date: Sun, 13 Sep 2026 18:34:10 +0200
Message-ID: <20260913163410.3039548-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 16:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245720

gprofng's CALL_UTIL(x) pastes onto its argument, and glibc 2.43 defines
strstr as a _Generic macro, so the paste lands on the expansion:

  ../../../gprofng/libcollector/iolib.c:898:18: error: expected
      identifier before '_Generic'

Only the native build is affected -- it compiles against the host's
headers, while the target build uses the sysroot's. binutils-cross
already passes --disable-gprofng for the same kind of reason, and the
recipe carries the same line for toolchain-clang and libc-musl.

gprofng is a profiler the native build does not ship, so disabling it
costs nothing here.

Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
---
 meta/recipes-devtools/binutils/binutils_2.44.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.44.bb b/meta/recipes-devtools/binutils/binutils_2.44.bb
index 99b5ce178d..f623a849e2 100644
--- a/meta/recipes-devtools/binutils/binutils_2.44.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.44.bb
@@ -20,6 +20,12 @@ EXTRA_OECONF:append:toolchain-clang = " --disable-gprofng"
 # | ../../../gprofng/libcollector/../src/collector_module.h:78:13: error: duplicate member 'pwrite'
 # | ../../../gprofng/libcollector/dispatcher.c:578:8: error: 'struct sigevent' has no member named '_sigev_un'
 EXTRA_OECONF:append:libc-musl = " --disable-gprofng"
+# | ../../../gprofng/libcollector/iolib.c:898:18: error: expected identifier before '_Generic'
+# CALL_UTIL(x) pastes onto its argument, and glibc 2.43 defines strstr as a
+# _Generic macro, so the paste lands on the expansion instead. The target
+# build uses the sysroot's headers and is unaffected; gprofng is a profiler
+# the native build does not ship.
+EXTRA_OECONF:append:class-native = " --disable-gprofng"
 
 EXTRA_OECONF:class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
-- 
2.55.0


