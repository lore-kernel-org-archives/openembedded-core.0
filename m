Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4B6CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 15:50:30 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.489.1762444229755777266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 07:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NxL9Z8hv;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-948673fdc47so38646439f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762444229; x=1763049029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZzqHPfNFjvJ90eZe5XWshlu5BbRv6rLCweCWO9d6yA=;
        b=NxL9Z8hvZMHw6PaHac81n+fNvBCeA9mkyCYA4HejAVGpEWqeBx+s7tjqp9NB2FR91V
         /97dz4OBrQWGoV+Ln4ZUcldiF/S6J6Fg3/xOiRmcdjokovA4oHiuuMIILxkf2i0viXz3
         QDb20KJZ6ZMhfA/Ov2qxVmLlhdj4ahK0q17OVx7KggSmkPzsZrWCnre/pqv/29eND0Vg
         lBGH6cqXwLdLIyczgbVEEwV/vTrc4kF/FCEyF2ZlQlC6JfsvwrSP2zFi0VDGB6yA59Z4
         TmsRyFbXsjz1cHZRYUV+yQhBBvSX2IWWifsIW6tdXPSSUomqkAWvEQwOnesV552vyKq0
         /yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444229; x=1763049029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZzqHPfNFjvJ90eZe5XWshlu5BbRv6rLCweCWO9d6yA=;
        b=ieMI9mFGqT+Ls9lppUv1m7qKmHNqLZTMgrYMUFvLDFMmjA/KzfzusKKoyel6HkM2k3
         K2Z/eZ76XSwFY1R3fNJOHmHZvTlWg1z4mDZYZDGwRV44bTOorj+ZHyzGwDT5BFTTiv+8
         4II7vSBsOenocwK4lsXP7lkVQSWychDuKEOAgT4hluRryRMbgCLbMVF8lxcERIk7+JlY
         PL7EWC8pXoue4xvQIYZxMcKIbD9Lds57tRNzaUfeYxDIQabcr+Ie/q53ZZI/f/2HIaDk
         tALOF7etU+NB/siRYpFDFwAeXGniD+bXeqhIM95Z7D1OMijc+lUgIyI14QueiHB9G9ON
         0jUA==
X-Gm-Message-State: AOJu0YwcyuW58qPyhTrpATYdH0Jj79yRQMr+VEgffnc0LwdXWFyq7U6i
	9rSmnzwEv5waoTrqv0o1qKcqPoalXRXWHaprCmKopvw0wnneJXelYhv5vz1iJw==
X-Gm-Gg: ASbGncvhnkKTxV9RPjg/c8zd+JJnGrd0PGur+F3XoXMdnKsT1wY5WTpbplIEy36NY6N
	rjhgwpzcyPOBoJZlR9X5p70oAjQp2QoaRlCedCWKw4NnxSFSbWAQ3i2KKufE+UXfgGLiXTYSPl8
	du4PXHHG6jd24blrWeKgjC+ufdc1S9xkY7Ulf3Y5flrN3qxDhCJwNhOZAVAz5IkfMfJQPy2heik
	TmEFJXEtiAv9gEjKbTTjBNfJ6C62uCcaZnLyt7H3GFg1jKl5M9qdU9QOnIW8Qf+RoSm6k46wpaI
	tUSpIP/1Yx6P5imS8x0OslYNGNlBlJ2TecmOfQsajjvICsz1GsGMuwFm61J643onRJ1L0T7EiGa
	IESs2/TyH88lbPlMVGL98I8ZodShUmbQWu9i6+l9reYzOGIo69Ly5vlmQBLocLJWLxiBHcHsp4w
	==
X-Google-Smtp-Source: AGHT+IEHeAykdLQUpO3gPqUMx2fYijXrSBz0LqlzNspSQL5bnKwXAMJ9m4vUeetaGE3TZ84/gzZLhg==
X-Received: by 2002:a05:6602:3d2:b0:945:ae17:9ae4 with SMTP id ca18e2360f4ac-94869cc040fmr1175746139f.1.1762444228553;
        Thu, 06 Nov 2025 07:50:28 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::9115])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9487956c4a0sm104543539f.7.2025.11.06.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:50:27 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] wayland: Remove event_loop_timer test
Date: Thu,  6 Nov 2025 08:50:21 -0700
Message-ID: <20251106155021.16738-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 15:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225981

The event_loop_timer test requires precise timing constraints (10's of
milliseconds) which cannot be achieved on qemu testing targets. Remove
this test to prevent spurious failures.

[YOCTO #14861]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...1-tests-Remove-event_loop_timer-test.patch | 42 +++++++++++++++++++
 .../wayland/wayland_1.24.0.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch b/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch
new file mode 100644
index 0000000000..e662d6cfd2
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch
@@ -0,0 +1,42 @@
+From 61fa7e7d9c282798988907cf3b8928c88d7a7930 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Thu, 6 Nov 2025 08:35:26 -0700
+Subject: [PATCH] tests: Remove event_loop_timer test
+
+The event_loop_timer tests relies on very precise timing of the
+execution (10's of milliseconds). However, on the Yocto Autobuilder qemu
+testing, this sort of precise timing is not possible, resulting in
+spurious test failures.
+
+Remove this test to prevent these failures, since there isn't a simple
+way to increase the timing constraints.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ tests/event-loop-test.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/event-loop-test.c b/tests/event-loop-test.c
+index a51ba8f..0c39b09 100644
+--- a/tests/event-loop-test.c
++++ b/tests/event-loop-test.c
+@@ -238,6 +238,7 @@ TEST(event_loop_multiple_same_signals)
+ 	wl_event_loop_destroy(loop);
+ }
+ 
++#if 0 /* Timing requirements are too tight for qemu testing */
+ static int
+ timer_callback(void *data)
+ {
+@@ -280,6 +281,7 @@ TEST(event_loop_timer)
+ 	wl_event_source_remove(source2);
+ 	wl_event_loop_destroy(loop);
+ }
++#endif
+ 
+ #define MSEC_TO_USEC(msec) ((msec) * 1000)
+ 
+-- 
+2.51.1
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.24.0.bb b/meta/recipes-graphics/wayland/wayland_1.24.0.bb
index 5fb7951781..de7ee516bb 100644
--- a/meta/recipes-graphics/wayland/wayland_1.24.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.24.0.bb
@@ -15,6 +15,7 @@ DEPENDS = "expat libffi wayland-native"
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
+           file://0001-tests-Remove-event_loop_timer-test.patch \
            "
 SRC_URI[sha256sum] = "82892487a01ad67b334eca83b54317a7c86a03a89cfadacfef5211f11a5d0536"
 
-- 
2.51.1


