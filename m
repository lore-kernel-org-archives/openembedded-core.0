Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9116ED6DDF8
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 12:41:52 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.19952.1731674511706609919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Nov 2024 04:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zi9GUXTA;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: mail2szahir@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so1590045a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 04:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731674511; x=1732279311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3y12zMJQZlUsaxkfTR5S4MfTg72G4IhXWeM1khrmmZ0=;
        b=Zi9GUXTAtR+cxUoaYvtBB6cMqSXzRXNfZFGriCFQP/trRdi3lTHgBwRZuLpTzIO/Ip
         t9sk9oalZz1n6dwoX+9h7Y3RMv8Y4PtSP3Iw1yti+A3hdw0a51YRSdLrBO0ufyV902Hz
         yl4UkWEkRECvBeG8YitIS2FYBKBflmrMoSEca5rIwQgoTw9nn0OuY88qwU06NdrC8c6k
         pcscMSC2zxJ+JN00LVsOb/wof4IZMzdstPePhCX7hevgX5hfCGadD+02Ah9NVVV7tec+
         XkAAVI2N/bUJFuIcqYXN5v7N7mxqW4tur8IAMpYmnU6fNskhIOrIcFoX5R75VwO0m27C
         YGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674511; x=1732279311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3y12zMJQZlUsaxkfTR5S4MfTg72G4IhXWeM1khrmmZ0=;
        b=MTksy88+AVpSYTLOSnTiPYTSLcZb8nsetbwQfp2w407CII9malhQDpPXz9iK1Bg9pq
         UHq2eNeeifCfdZHtN93VYJ76E/3Xbh6DnM9cP2EY/e3aB6/lLz0ZDzzBBqs8tHyTe0xh
         1vGbvrwuLNBuQUHnTjbjF4R1ke8VY9n0KK0x1u0Ba9w9MbC0Oj6SuPMQuleyN3i68psa
         EgOSX4v8KGteKnN0dpDHILGCM2cv6XvPA3By059QO4lbQkKVLgMQ19H2nvzquujdXJJh
         36V3osFpCVVjIZ8Gp2Bim/pzFP6ffaCeld88oMgtUXQL8Ae5zp9hEVZy7oynbthXTz15
         Qmxw==
X-Gm-Message-State: AOJu0YzhoONHUxHxkivWnJbd4XySGrFqHP97X6lBKZK2KA+eIj5vNW/4
	ZhsBhNfFaqDrDS18P1L1agvlu8OA5mEjDisr51L6PXLdgAP8eiaA5TUOIA==
X-Google-Smtp-Source: AGHT+IHqAT5qotkOcu8qpH4+CiuTmP19Mi6l9xkLKcZTgYCwZD1+Xe3m4hMHqYVA1Pn8rUpbApXELA==
X-Received: by 2002:a05:6a20:3d82:b0:1d9:c615:944f with SMTP id adf61e73a8af0-1dc90b238a2mr3413224637.11.1731674510507;
        Fri, 15 Nov 2024 04:41:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e02e:c09b:70ed:f8da:86f7:37cc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea024bdb19sm2819480a91.36.2024.11.15.04.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 04:41:50 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Subject: [OE-core][master][PATCH V2] alsa-lib: enabling ptest for alsa-lib component
Date: Fri, 15 Nov 2024 18:11:15 +0530
Message-Id: <20241115124115.14318-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 12:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207183

These changes enable ptest for alsa-lib.

1) Removes the test suite execution 'make check-TESTS' call
using patch file.

2) Compiled the test directory source code using "oe_runmake check" command.

3) Copied all the required binaries into PTEST_PATH using do_install_ptest()
 function.

runqemu test result:
10/19 binaries are failing due to not getting PCM device handle.
those are,
chmap, midiloop, pcm-multi-thread, timer, user-ctl-element-set,
audio_time, pcm_min, queue_timer, playmidi, oldapi.

Below 9 binaries are passed on runqemu ptest,
config, midi_event, rawmidi, control, pcm,
client_event_filter,latency,namehint,seq

Signed-off-by: aszh07 <mail2szahir@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...001-remove-check_TESTS-from-automake.patch | 27 +++++++++++++++++++
 .../alsa/alsa-lib/run-ptest                   | 17 ++++++++++++
 .../alsa/alsa-lib_1.2.12.bb                   | 16 +++++++++--
 4 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-remove-check_TESTS-from-automake.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4a48188562..f0ffe11347 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST = "\
     acl \
+    alsa-lib \
     apr-util \
     attr \
     babeltrace \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-remove-check_TESTS-from-automake.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-remove-check_TESTS-from-automake.patch
new file mode 100644
index 0000000000..9ef3021cc3
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-remove-check_TESTS-from-automake.patch
@@ -0,0 +1,27 @@
+From 4afdc83b4069a4505c5928577321eef8097e5258 Mon Sep 17 00:00:00 2001
+From: Zahir Hussain <zahir.basha@kpit.com>
+Date: Mon, 11 Nov 2024 22:08:33 +0530
+Subject: [PATCH] remove check_TESTS from automake
+
+Upstream-Status: Inappropriate [Project-Specific]
+
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ test/lsb/Makefile.am | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/test/lsb/Makefile.am b/test/lsb/Makefile.am
+index ceb4d71..c537bf0 100644
+--- a/test/lsb/Makefile.am
++++ b/test/lsb/Makefile.am
+@@ -1,6 +1,4 @@
+-TESTS  = config
+-TESTS += midi_event
+-check_PROGRAMS = $(TESTS)
++check_PROGRAMS = config midi_event
+ noinst_HEADERS = test.h
+ 
+ AM_CFLAGS = -Wall -pipe
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
new file mode 100644
index 0000000000..dad94c23df
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+set -eux
+
+for t in *; do
+    if [ -f "$t" ] && [ -x "$t" ] && [ "$t" != "run-ptest" ]; then
+        if "./$t" > "alsa-lib_$t.log" 2>&1; then
+            echo "PASS: $t"
+        else
+            echo "FAIL: $t - Log"
+            cat "alsa-lib_$t.log"
+        fi
+    else
+        echo "SKIP: $t (Not executable or not a file)"
+    fi
+done
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
index d9136052b7..da743a243b 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
@@ -9,10 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://run-ptest \
+           file://0001-remove-check_TESTS-from-automake.patch \
+           "
 SRC_URI[sha256sum] = "4868cd908627279da5a634f468701625be8cc251d84262c7e5b6a218391ad0d2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
@@ -42,3 +45,12 @@ RREPLACES:alsa-conf = "alsa-conf-base"
 RCONFLICTS:alsa-conf = "alsa-conf-base"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_compile_ptest() {
+        oe_runmake check
+}
+
+do_install_ptest:append() {
+        install -m 0755 ${B}/test/.libs/* "${D}${PTEST_PATH}";
+        install -m 0755 ${B}/test/lsb/.libs/* "${D}${PTEST_PATH}";
+}
-- 
2.17.1


