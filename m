Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72B5C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 05:07:10 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.43755.1671512825551245529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 21:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RNHl43Of;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id c7so7721628pfc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 21:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rprOaDvsI0GiVGFHuVynDR7OSBH+kBURq4PV3aKpMUY=;
        b=RNHl43Of6Cv70UCMF4opumIk1OIHp9OB1ylZgGYAeqW5Y9COf3VbwvklJ5lbus4R2D
         BjnT2tN++HnaevxJ26zukRXw5+rChNw+gkCbrF68z+zv18Rsr2C+BQOl+Qw7YiKdXTR2
         LGs8G8aNOn0w5Ja5bwmWksKfwqfV+RR05tpvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rprOaDvsI0GiVGFHuVynDR7OSBH+kBURq4PV3aKpMUY=;
        b=BcTMqLP5d2m47h8MVBf6sTREMuJILwiBcf3fV7kYkb9t3qnihatSL5N4yu9MRZOUZt
         njM8cLXOL5LY2arePjQ780Hr9swEY/FKGsLw/I2JAp8CGY1OwPke0ge+Tiwun5gntlix
         psWhcrFeH5Nf4KTFl8bXN1Pc/bH6JsQwv8Vc6Q3GiebCgWeuJ2z6lozcG2JO9hZst/qP
         dQ0G6i5aiOMSJsrUf73TGPoNSCfyVseHv7q4kCNZvVi1jK5NRz6vviPLUVJ7MvQLY6AG
         Uv8eA41xgcyPIYl1Oqpweb4kcmrKjk6E3OEmHP/p7e4sTmcF0iKRNfajgPFWidkaxQP9
         15ow==
X-Gm-Message-State: ANoB5pkWlRBInG2WhhT7ItKSf21uXrdI74DRm8LlCvyR43R9Fgc/MhOE
	Z7eCpo8sahr1Dz6LDfKzDkdjq0PrWrDh/LOO
X-Google-Smtp-Source: AA0mqf6Fo4rv6NyR8TiZxW/WoWIgJNpu8iKYCji3flBjSz+vlhl+8rfTggy8cSEkiMz/jojxHFgG3g==
X-Received: by 2002:a05:6a00:1622:b0:57a:73a9:3ebd with SMTP id e2-20020a056a00162200b0057a73a93ebdmr27950213pfc.20.1671512824679;
        Mon, 19 Dec 2022 21:07:04 -0800 (PST)
Received: from MVIN00024 ([27.121.101.101])
        by smtp.gmail.com with ESMTPSA id d26-20020aa797ba000000b005745eb7eccasm7552018pfq.112.2022.12.19.21.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 21:07:04 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 20 Dec 2022 10:36:58 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with a long backtrace
Date: Tue, 20 Dec 2022 10:36:57 +0530
Message-Id: <20221220050657.35595-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 05:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174839

Upstream-Status: Backport from https://github.com/systemd/systemd/commit/076b807be472630692c5348c60d0c2b7b28ad437

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../systemd/systemd/CVE-2022-45873.patch      | 124 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-45873.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-45873.patch b/meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
new file mode 100644
index 0000000000..94bd22ca43
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
@@ -0,0 +1,124 @@
+From 076b807be472630692c5348c60d0c2b7b28ad437 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 18 Oct 2022 18:23:53 +0200
+Subject: [PATCH] coredump: avoid deadlock when passing processed backtrace
+ data
+
+We would deadlock when passing the data back from the forked-off process that
+was doing backtrace generation back to the coredump parent. This is because we
+fork the child and wait for it to exit. The child tries to write too much data
+to the output pipe, and and after the first 64k blocks on the parent because
+the pipe is full. The bug surfaced in Fedora because of a combination of four
+factors:
+- 87707784c70dc9894ec613df0a6e75e732a362a3 was backported to v251.5, which
+  allowed coredump processing to be successful.
+- 1a0281a3ebf4f8c16d40aa9e63103f16cd23bb2a was NOT backported, so the output
+  was very verbose.
+- Fedora has the ELF package metadata available, so a lot of output can be
+  generated. Most other distros just don't have the information.
+- gnome-calendar crashes and has a bazillion modules and 69596 bytes of output
+  are generated for it.
+
+Fixes https://bugzilla.redhat.com/show_bug.cgi?id=2135778.
+
+The code is changed to try to write data opportunistically. If we get partial
+information, that is still logged. In is generally better to log partial
+backtrace information than nothing at all.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/076b807be472630692c5348c60d0c2b7b28ad437]
+CVE: CVE-2022-45873
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/shared/elf-util.c | 37 +++++++++++++++++++++++++++++++------
+ 1 file changed, 31 insertions(+), 6 deletions(-)
+
+diff --git a/src/shared/elf-util.c b/src/shared/elf-util.c
+index 6d9fcfbbf2..bd27507346 100644
+--- a/src/shared/elf-util.c
++++ b/src/shared/elf-util.c
+@@ -30,6 +30,9 @@
+ #define THREADS_MAX 64
+ #define ELF_PACKAGE_METADATA_ID 0xcafe1a7e
+ 
++/* The amount of data we're willing to write to each of the output pipes. */
++#define COREDUMP_PIPE_MAX (1024*1024U)
++
+ static void *dw_dl = NULL;
+ static void *elf_dl = NULL;
+ 
+@@ -700,13 +703,13 @@ int parse_elf_object(int fd, const char *executable, bool fork_disable_dump, cha
+                 return r;
+ 
+         if (ret) {
+-                r = RET_NERRNO(pipe2(return_pipe, O_CLOEXEC));
++                r = RET_NERRNO(pipe2(return_pipe, O_CLOEXEC|O_NONBLOCK));
+                 if (r < 0)
+                         return r;
+         }
+ 
+         if (ret_package_metadata) {
+-                r = RET_NERRNO(pipe2(json_pipe, O_CLOEXEC));
++                r = RET_NERRNO(pipe2(json_pipe, O_CLOEXEC|O_NONBLOCK));
+                 if (r < 0)
+                         return r;
+         }
+@@ -750,8 +753,24 @@ int parse_elf_object(int fd, const char *executable, bool fork_disable_dump, cha
+                         goto child_fail;
+ 
+                 if (buf) {
+-                        r = loop_write(return_pipe[1], buf, strlen(buf), false);
+-                        if (r < 0)
++                        size_t len = strlen(buf);
++
++                        if (len > COREDUMP_PIPE_MAX) {
++                                /* This is iffy. A backtrace can be a few hundred kilobytes, but too much is
++                                 * too much. Let's log a warning and ignore the rest. */
++                                log_warning("Generated backtrace is %zu bytes (more than the limit of %u bytes), backtrace will be truncated.",
++                                            len, COREDUMP_PIPE_MAX);
++                                len = COREDUMP_PIPE_MAX;
++                        }
++
++                        /* Bump the space for the returned string.
++                         * Failure is ignored, because partial output is still useful. */
++                        (void) fcntl(return_pipe[1], F_SETPIPE_SZ, len);
++
++                        r = loop_write(return_pipe[1], buf, len, false);
++                        if (r == -EAGAIN)
++                                log_warning("Write failed, backtrace will be truncated.");
++                        else if (r < 0)
+                                 goto child_fail;
+ 
+                         return_pipe[1] = safe_close(return_pipe[1]);
+@@ -760,13 +779,19 @@ int parse_elf_object(int fd, const char *executable, bool fork_disable_dump, cha
+                 if (package_metadata) {
+                         _cleanup_fclose_ FILE *json_out = NULL;
+ 
++                        /* Bump the space for the returned string. We don't know how much space we'll need in
++                         * advance, so we'll just try to write as much as possible and maybe fail later. */
++                        (void) fcntl(json_pipe[1], F_SETPIPE_SZ, COREDUMP_PIPE_MAX);
++
+                         json_out = take_fdopen(&json_pipe[1], "w");
+                         if (!json_out) {
+                                 r = -errno;
+                                 goto child_fail;
+                         }
+ 
+-                        json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
++                        r = json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
++                        if (r < 0)
++                                log_warning_errno(r, "Failed to write JSON package metadata, ignoring: %m");
+                 }
+ 
+                 _exit(EXIT_SUCCESS);
+@@ -801,7 +826,7 @@ int parse_elf_object(int fd, const char *executable, bool fork_disable_dump, cha
+ 
+                 r = json_parse_file(json_in, NULL, 0, &package_metadata, NULL, NULL);
+                 if (r < 0 && r != -EINVAL) /* EINVAL: json was empty, so we got nothing, but that's ok */
+-                        return r;
++                        log_warning_errno(r, "Failed to read or parse json metadata, ignoring: %m");
+         }
+ 
+         if (ret)
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index ab349b7307..acca49c3cb 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            file://CVE-2022-3821.patch \
+           file://CVE-2022-45873.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


