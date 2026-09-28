Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF99CA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 05:00:49 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50755.1790571641714550869
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 22:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lLZyhljI;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-346c612c7a8so579348eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 22:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790571641; x=1791176441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pElyuMjcrVgPL7IKdzlzPT1XpHKVB6z1XKJdcSTjXLs=;
        b=lLZyhljIlqw2Sh7t+IEza09aKO7c6wlFQfh/d+uxDvmWFpElFX9QuRq3ZIr9R0YNm/
         XpAVI67++ECBVWEzePBvJwFSt/UCzoFbX3J41hsCnAX3egdDHJ7jVCL7yNGzKyOq95+5
         P40hDSA5bTH4ulZ8M4CI3QQdVBl7Rfmh4hsLzOndWRryvuZOQX9vrNgbZuouM9r63nVI
         6jqW1YLmn9rVR8umZ4bgeyUZYtI1F9ohbFPQhY0CDBQZSzeq54LEcVOuiXdVPzlIHiRk
         EaAaYYyK4fRJSQrMhtKQAFFiaiVBwcWl0WqPGLmsni5dplHG45F/OyCyh54WfrmonNLK
         Xbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790571641; x=1791176441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pElyuMjcrVgPL7IKdzlzPT1XpHKVB6z1XKJdcSTjXLs=;
        b=x73GJvpOWYWG4+KgvgbanqdHxbYmTacgWlpV9q0Fd0hJcxOicwVgk4nd6Gdw6fv6e1
         GUEjz3tF0Yp7F0xNI0vuP8F2T/fte2FgjI5gHjIY839vGQzoDfHyiJ8NF2LlCF+4sXdE
         FYoX2jnpyARuZD1SEu/IfcuZQWPIhHmBMUpLqQHFkpAIwC7MA7WR8u+2O8yPzx+/xTrM
         8Dol2zTvXexWgMunqKPCLPkaIGVGk7BK3KaKQFzsrx6EBoHh4kwMY3kTpefe4S/VQwkx
         WRf+8dXD52gqT9E2CZHfOAbquISz69z0bkjizrakXtjpthjOF3ns0R76LK2upHqxdPmx
         NUKw==
X-Gm-Message-State: AFuF++mr2T/7cFU3mG1hO3WZlopQhZv41rZbPeKIK8NLtjsfDcM+p1Qd
	0ZnpNlAYYARGbu7O0CnjRHRdlvkruKgWEQ1f9yHxEqmH5y8MT6kT0cAsFlXxjCkm
X-Gm-Gg: AYBFou0x6RxTDsPMh6blHdBwun1YUomCwb6SOhbHMy0dLmhewo7Px3rPvxaKOkKYzv6
	wzz+nuyuU4qpaQKzVeGwtSa+o80u4mXgRRAyN2bf7YIDhxKUdUTX/kDuwDgPII50RPVoLCqw22W
	NZeEdArK1SqH1wySVH8c/cYP7h6hIv3zGFBFYaSQjCwsIoGHosq/5PdcNR3ACWXoUymTAyFuWBw
	3NcmA120w0qVI9tFFK0JFmqFtQ8KNUXDRyrB21pW10bTA+2VxGlFVcRA+Oyn7pGaWkK/+z/tnoi
	xXYXqWpdLf5IkOWz/RFC/jO4Omt7N320X7lle0FCL1pjqEMj11kiTirxjPkAEzd9an13ZHa+TWF
	7khv1ezkDbD+q5hZ4cHlQqDhCDsuMUlrIEpCsWffWRyoY97wbnPmE6hMf9NEE5h76KTpb2XYL9J
	zo3LVL6P0aJ9/apYDlDT8ni8htmvFhHapLvNFMtwkd99je4/JSZhHGQWZOmEc3WJjFZcfxDWdeB
	4s8eYzFGI8Z4RIuBrV1KS1TnaglrYR57EpWVCQtspUPIaSzzWmB+M8dvk68s6YojMeXeQagrSE0
	VEJa629HQBlGEg9wnmzrJcuaJfOaX2RXcupiRRJdP+4SRTzsCGordcjVCNO0WAZSiEqH9eBlCiq
	8TLJb8QjqVYlxX08BiZaycr66NMUJNcEDQHjb27uqaZcKxjzMZ65ERIvKtTktU9dW8r4qTZLLln
	89be2bZxFjNcigBarFg5wG9iYmwKRPJk+5kaUayg==
X-Received: by 2002:a05:701b:4203:10b0:144:e246:a0b5 with SMTP id a92af1059eb24-146d077bc5amr7865592c88.40.1790571639616;
        Sun, 27 Sep 2026 22:00:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21781677c88.4.2026.09.27.22.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:00:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/2] elfutils: Fix backtrace ptests on musl
Date: Sun, 27 Sep 2026 22:00:35 -0700
Message-ID: <20260928050036.3640902-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 05:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246725

musl is built with -fno-asynchronous-unwind-tables, so libc.so carries
almost no .eh_frame and its CFI only lives in .debug_frame. Without it the
unwinder cannot get out of abort () and run-backtrace-dwarf.sh fails with
"No DWARF information found". Add musl-dbg to the ptest dependencies, like
glibc-dbg for glibc.

run-backtrace-native-core.sh then unwinds the thread correctly but loops on
musl's __clone, which has no end-of-stack CFI. That is the same reason
run-backtrace-native.sh is already an expected failure on musl, so mark the
core variant as one too.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.196.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.196.bb b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
index 4541000840..167fe44d87 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.196.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
@@ -54,6 +54,7 @@ EXTRA_OECONF:append:class-target = " --disable-tests-rpath"
 EXTRA_OECONF:append:class-target:microblaze = " --disable-symbol-versioning"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-dbg glibc-dev"
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-dbg"
 INSANE_SKIP:${PN}-ptest = "debug-deps dev-deps"
 
 do_compile_ptest() {
@@ -65,7 +66,7 @@ PTEST_PARALLEL_MAKE = ""
 PTEST_XFAILS ?= ""
 # See - https://sourceware.org/bugzilla/show_bug.cgi?id=32232
 PTEST_XFAILS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' run-strip-strmerge.sh run-elflint-self.sh run-backtrace-data.sh run-reverse-sections-self.sh', '', d)}"
-PTEST_XFAILS:append:libc-musl = " run-large-elf-file.sh run-backtrace-data.sh run-backtrace-native.sh run-stack-d-test.sh run-stack-i-test.sh run-stack-demangled-test.sh run-deleted.sh run-compress-test.sh"
+PTEST_XFAILS:append:libc-musl = " run-large-elf-file.sh run-backtrace-data.sh run-backtrace-native.sh run-backtrace-native-core.sh run-stack-d-test.sh run-stack-i-test.sh run-stack-demangled-test.sh run-deleted.sh run-compress-test.sh"
 # systemwide stackprof tests need userspace CPU activity, which minimal qemu images lack
 PTEST_XFAILS:append:qemuall = " run-stackprof-system.sh run-stackprof-system-gprof.sh"
 

