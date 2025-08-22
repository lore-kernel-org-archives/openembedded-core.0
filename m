Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2033CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 05:17:31 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.1980.1755839850401827647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 22:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKov/697;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b47174b3429so1149191a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755839849; x=1756444649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmXzRbaWlI2MentMmNb08B26rzXCatww2rKamwbkjTQ=;
        b=dKov/697sucdO6nVFK54TiPtzPW8EX+H3Cb2556zHV4lWCEoBKU/9krvxOeko4kSPJ
         RqApAFQI40GttY4Wf44LyH6AiJ5jtDp1hpYYav5Yx9jBuQaP8CjvaruGSauv7uXydrdT
         dOc8WU+TkH/wPRhMPRf6x+qSn7y0lzAmRhRA4OLbL5VzehOJzopTAoIqhv2Y3cUdq+ld
         OWLCcwB4n37wg898ATbri2MTDdLXhyu748ex48kw98TySIlo+mGIdTHK4UfucaeI4azg
         S9LKlqpbu7HUP/f4maslJPfDJOsJefYtbNPN/y2YZdbHdUgkY5oSTerB6nxel9GkcwKi
         5SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755839849; x=1756444649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmXzRbaWlI2MentMmNb08B26rzXCatww2rKamwbkjTQ=;
        b=eE5SQEpmML6Xh9/LPbqCCHaF8e28/jtFByMU0yvKvGLulBRbWYTScp+r9a37p3wVpx
         QFNCi10hmtJJsu99FVeUqPNi/SWSZrySCuJTkaYRgfbOSvEgbDt23VVFS8OKipcowDQd
         pJFuNpvMAWd5WhuMLC4ofBxVJ9Jr8+e5CofTvuhQ5cWRSZuaANHYMKg4Q8rnnoL+pIaZ
         TrfirAXoRBsGdo3mX6PUL4A5B4sWfIwvHSF69oz4Zfq3MAww86ytpqJmMzpLbr2aIUAO
         R7P2MKo9gZcwkfCaHyCzQKu1x/yEV0b76KWR5fK2JGFISjII7epIOUiDgJqZ+170gLr3
         BCOQ==
X-Gm-Message-State: AOJu0Yx9UDXc42NJS3fsCQHyHVMRPEBfh/pDtA479zTtk2ZD+rM0WGl+
	uyRIelxt9+rPuDkeJTBlXxtD5ztAvUUwPdMBJVzxH+44ZrTorevpxEi/1c7FoOEt
X-Gm-Gg: ASbGncvSKepQ/wihVt3ds4m30hWm9UkqxUet1+W+YA4ktFtROTnOjuT4h2nsmqg9JJV
	yIgSwggiHmDEqpCZEXBuC63q94AHz/nkGZNsGYFF9eUsQE3y4BnBTF5af8+Q5IrGC3Yuo463XuY
	Wgx6OfO0+iVs/3K0JKx+UptPfRtjQms7U4PKrjgwH39VLHK7rWl9F0YDU7MTWUE3GwFRSvmK/oq
	kaI8LoHvR2llOz6v1oRRw9/uDr+8zgUJDh0lvGU8N2MJIz9pzvNkLnm5q7b7ozQVfdawgJQfUTf
	yHvQ3s6WS1jtkyV+y3AspXS5+VYDrDX8fbCD8Uwvm6V/f3LjiaN5O/7WusMdK3R7S85W1xjqp5j
	j6S6756ifjcRW1Art7O0SUO2AMl+muT2EVh9VqD3nz2IJ8xuGK51XwNcqP8D1T6S7Th+EXgUDJ3
	NHsI178SiamzPMjo0axq6v7E/Z8rzBRX3ZVmG7gL0=
X-Google-Smtp-Source: AGHT+IFABDIcokph2r1ksziCkTKdVr51Iy9xugW4/Z3s0tavOAaSKt1QFhiCjKnAFo12Prxog3Vcdw==
X-Received: by 2002:a17:902:e542:b0:240:2eae:aecb with SMTP id d9443c01a7336-2462ef872cemr28338075ad.43.1755839849339;
        Thu, 21 Aug 2025 22:17:29 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ebf7dsm71631015ad.120.2025.08.21.22.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 22:17:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] elfutils: Remove run-backtrace-dwarf from musl ptest XFAILs list
Date: Thu, 21 Aug 2025 22:17:23 -0700
Message-ID: <20250822051726.2429206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 05:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222303

This is passing ok with gcc/libgcc on YP AB

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.193.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.193.bb b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
index 67ce3827827..29a8ee5af63 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.193.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
@@ -66,7 +66,7 @@ PTEST_PARALLEL_MAKE = ""
 PTEST_XFAILS ?= ""
 # See - https://sourceware.org/bugzilla/show_bug.cgi?id=32232
 PTEST_XFAILS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' run-strip-strmerge.sh run-elflint-self.sh run-backtrace-data.sh run-reverse-sections-self.sh', '', d)}"
-PTEST_XFAILS:append:libc-musl = " run-large-elf-file.sh run-backtrace-data.sh run-backtrace-dwarf.sh run-backtrace-native.sh run-stack-d-test.sh run-stack-i-test.sh run-stack-demangled-test.sh run-deleted.sh run-compress-test.sh"
+PTEST_XFAILS:append:libc-musl = " run-large-elf-file.sh run-backtrace-data.sh run-backtrace-native.sh run-stack-d-test.sh run-stack-i-test.sh run-stack-demangled-test.sh run-deleted.sh run-compress-test.sh"
 
 do_install_ptest() {
 	# copy the files which needed by the cases

