Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92168C46467
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:24 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.45234.1673490804175441355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=N0dZ8PdP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id z4-20020a17090a170400b00226d331390cso19298388pjd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kiykc5uxO4M+9TzKTFLEN5f9DeyIUH7HGGqgfna2p1E=;
        b=N0dZ8PdPxlq20gmGWpw6MHnf0Leuo/tz+hZz7D0KS2wVDOdgGce0ldyhhZxrg7xeQx
         ItPInc+ekYCJmSElIerKRQ9FW0Yu05oqCX/Bwrn1eM1dZ89gOSdFmlGpFPDiXYsg6kEO
         rfsGiRWGg5TTrgi5eT0sc8Evl0Prg4i7XDDwhU+Xdp702iX7Dt1j20Tf0YHHCFsMbvZ2
         EYsCgQRmBZRQvgQPB2sz0ILuHI6GAIjSc56wTGzKh8Yo38n3DQ1Po5FXYugqo4ctoq4U
         PRhYaNpr9mj7Hsu2oKa9U2A6yYyrhsMqewdNdqhT6seZ09p5nOFVJr4EdVvnECRc7uYD
         knaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kiykc5uxO4M+9TzKTFLEN5f9DeyIUH7HGGqgfna2p1E=;
        b=1RougQjgKb2cKZdFEMcNBRS0R8HJoh2dOGQ72FoEP8hzQCmql5Zy4e35HvYs+Vus1u
         1LsLPNQayhmR52XNAuawzTmd4+jvzFFULCVMNO8R8FHeya2335VVd9NcguCkk4zcIGoX
         zu+lStG9kQZzM5UFHPJio8g7YCdHcu2qXr4YBztfYrD0Ey122pHvN4MmVsjQ+9DdG8Z9
         e8EdQuILRluJKvp9JPfLnXmx3dW2rd8dV4j39snh2vSCY+BwX4dBCC5UZNLCAyELXc3U
         SrA1KVvjZhYTJ37EA/tRl7Lrs+f+F+I0Cw0T1BOlrq3p2if0MQb9M7UiR232udEFh7KR
         V2Cg==
X-Gm-Message-State: AFqh2kq44baMwZ88Ly8f+F91z2oF0cxRCdw0psWtEeEJLrxHVI3aGqpO
	HpEcBOk6rrq5qXOmORZnPgj/BhWp2fCGURndHwo=
X-Google-Smtp-Source: AMrXdXuSGaGS3V84Z7SnPu6vOrVf6kAV2JpsDAj/JmIcu9XfXBXikepnFh+h8/3zBBLzN3FX4rmV1w==
X-Received: by 2002:a17:902:8e86:b0:192:b43e:272 with SMTP id bg6-20020a1709028e8600b00192b43e0272mr40568169plb.53.1673490803115;
        Wed, 11 Jan 2023 18:33:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/11] systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with a long backtrace
Date: Wed, 11 Jan 2023 16:33:02 -1000
Message-Id: <aa547f62262e2b41ef590843aaa9555c8403a758.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175774

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


