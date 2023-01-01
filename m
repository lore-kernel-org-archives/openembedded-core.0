Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244A7C3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:06 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.15986.1672594679357675460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sH61HYNq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id v3so17145426pgh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kiykc5uxO4M+9TzKTFLEN5f9DeyIUH7HGGqgfna2p1E=;
        b=sH61HYNqV+naqE+A4RS8DXaL7uoIKqP0Vo0K3WDFUVdPuRBKICEJtA3TKAg6vk6K3G
         SVC8QOgyOizwCXQG5s70DR07s4ruK4z6uExLz6UhFoUju7tyZDKKuvpQjcldzcWfhmng
         l14qrE3SkfgunBPyEAlygS5wTXCyEpgC0RWbHKrKYg2qCXM9gE165ULZeJs19b5xBm1Z
         q1JMdFur06Gbf8pbYH/WGkI7qLl+duDw/E6LrOf2JT1kzOLan9ls7GQziBu+ObJagC99
         nq3cGA3gfxdQy0m4tp16h7e7HPHI2jKJhWlOOtOn43uOdXn7mN+TiXqsN8+6CCC2VNJg
         /YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kiykc5uxO4M+9TzKTFLEN5f9DeyIUH7HGGqgfna2p1E=;
        b=PO4IDkXJX2c/TOlZjaOdGX8j6mRb9GNhkESCnCRp4ZyOj66AiE9qmZjgSstamw95vY
         ykV7svMfnwVrA/i5Np//tmNpGoP1pN1h8QD+uVUly2QvsKJaN6Ux78vvNIsm6BhlEh4T
         PGGPAJiDlhPleLchCNsilsbiG/T5R+4teRQgexz4cPuIVNHPn3NfBwm457hQRHJ/Mr/O
         If4UVR4SPTsHuGXo2rZgSZgIo8bGA7nFh8708GGJBHdJDIa40wLhanLk2DB0ScoPTAMH
         so7++5m8iwbkrlVyA43XimY+TGHCrhI14uNW0ocx4qJ3X72uz8sT/5pDjvUerXpSIzMO
         PKog==
X-Gm-Message-State: AFqh2kqA3BhhmKB0/ZAIK+crrokANhuBksoKKNuKpsQFaRMfhnBLjANf
	fc4tZgubz45upEsI0+chX6esHXuoBWD6zgbvtlo=
X-Google-Smtp-Source: AMrXdXu6g1hsblgSaYGAciayBSUmigrq2stp7NO2vUQHOFwznY/F0o77wn8HHws4MYu7vBxahWR3yg==
X-Received: by 2002:aa7:9eca:0:b0:581:f654:a374 with SMTP id r10-20020aa79eca000000b00581f654a374mr10562462pfq.24.1672594678251;
        Sun, 01 Jan 2023 09:37:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.37.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:37:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/29] systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with a long backtrace
Date: Sun,  1 Jan 2023 07:37:23 -1000
Message-Id: <fd4a567b92db122b5204edfa4465ed9e4cf15070.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175189

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/systemd/systemd/commit/076b807be472630692c5348c60d0c2b7b28ad437

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


