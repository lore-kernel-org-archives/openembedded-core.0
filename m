Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393E9C04FFE
	for <webhook@archiver.kernel.org>; Sat, 11 May 2024 04:08:34 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.7952.1715400503985301628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 21:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=atyvuWkS;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso1768789a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 21:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715400502; x=1716005302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a56+gCP3pM/WPt7E4zDDWizvkWufZLvuZnrEBVXtt2U=;
        b=atyvuWkSy3XsZhLZLpBfxDDYRKqCyZoovYji3duHvnrKYh6HvSHhCFTnnTjpQvgzLn
         QpsCrT2ve3UBgt+GosCkpFUsBw7vYHqZN5MM1KGQIwDlVL2OaXeAbFH0bhXnX7FMggwf
         y3WJ2ppyF9XOMggxrEHbW4X/KnXdXExMBZzTXQTTTrgHmkecAphVQxey9Rc6t3cmNm8/
         GlWOlgWuS2hTKvFwDpMu7QvuYgaA3JSBwsW8gBXjRhQqbhBoDtreg8Uk9jdWhDY7EXbl
         CmN+pIcFWT4SEnEfvzdTs8Tsr7G4SwLlZ0f4mfCNxZPVj6Id0DfehAUbVrCHVOEB1HL2
         ag4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715400502; x=1716005302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a56+gCP3pM/WPt7E4zDDWizvkWufZLvuZnrEBVXtt2U=;
        b=v6oQS/PZbkXzPIt1Fy0jkFdNqnQUMxhnki02R4u27QvN6oZb7x96Yrn2YwwkvpLKgN
         VdssG61o/UkGyT8AVRcEt0A7CT5T3qnJvFb8rfsKOgvEx4lHr8WIDRkqtjNxhAZ8eOKx
         S9zMe+NLfif3XdKvSyeQdVsje8PIKWxJ728Jqn2CpR2Klx6UV5SZNtkFMyurP3V39qDm
         imZaonmFANf6zdPqgJofU5Mt9uw7kbrb1O0Scx/mdcGaPNEghWCWVo2CItgOjhoWbVw0
         H6lkQCvm4pAS6DQYes+78ofw3KWTnWEXvU4KSHL9m7sVFseeeE3kSBJPtM1zqgB4aifq
         5SzQ==
X-Gm-Message-State: AOJu0YzIoR0KssFP1VKy+t5mMxiXKqbqDRByz1sBHGUx22IBLpvpwrnj
	RXg6i7FEp/NSmbfqJXTIs0TLK7QYoESFXpS2OnvkzuYuHPRJyp81W5f9TQ==
X-Google-Smtp-Source: AGHT+IFOuL5lxOdoadf7E35rlFCBT9knhCdmKnpeCfel+p73aiePa1KbMIMiGecfMOwlcxhEn9C+OA==
X-Received: by 2002:a17:90a:12c2:b0:2b2:a1d0:b61c with SMTP id 98e67ed59e1d1-2b6ccfeee24mr3422884a91.47.1715400500850;
        Fri, 10 May 2024 21:08:20 -0700 (PDT)
Received: from LL-2917.kpit.com ([103.85.11.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67126b666sm4393635a91.34.2024.05.10.21.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 21:08:20 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][kirkstone][PATCH] systemd: Add patches to fix systemd-udev delay during initialization
Date: Sat, 11 May 2024 09:38:11 +0530
Message-Id: <20240511040811.336618-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 May 2024 04:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199203

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Below upstream systemd PR fixes overall delay in systemd-udev in
initialization by removing multiple for loops along with delays in those
loops
By applying these patches from the PR improves almost 800 - 900 ms in
the initialization
By this system boots up fasts and also avoids some issues related to
this delay

PR link: https://github.com/systemd/systemd/pull/23043

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 ...0001-udev-move-udev_node_escape_path.patch | 120 ++++++++
 ...update-and-introduce-stack_directory.patch |  90 ++++++
 ...ve-stack-directory-even-if-it-is-emp.patch | 267 +++++++++++++++++
 ...-introduce-path_make_relative_parent.patch |  99 +++++++
 .../0005-udev-use-readlinkat_malloc.patch     |  74 +++++
 ...-link_find_prioritized-and-variables.patch | 190 ++++++++++++
 ...7-udev-use-path_make_relative_parent.patch |  43 +++
 ...ake-node_symlink-accept-NULL-devname.patch |  75 +++++
 ...k-when-updating-device-node-symlinks.patch | 277 ++++++++++++++++++
 ...ck-directory-run-udev-links-when-all.patch | 130 ++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |  10 +
 11 files changed, 1375 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_path.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-introduce-stack_directory.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-directory-even-if-it-is-emp.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_relative_parent.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioritized-and-variables.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_parent.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-NULL-devname.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-device-node-symlinks.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-run-udev-links-when-all.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_path.patch b/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_path.patch
new file mode 100644
index 0000000000..900ca81170
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_path.patch
@@ -0,0 +1,120 @@
+From b9168275c39a190441fee73ba1c8a64515fd3b0e Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 11:25:37 +0900
+Subject: [PATCH 01/10] udev: move udev_node_escape_path()
+
+No functionality is changed.
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/b9168275c39a190441fee73ba1c8a64515fd3b0e]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 84 ++++++++++++++++++++++----------------------
+ 1 file changed, 42 insertions(+), 42 deletions(-)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index bb34977d97..79d050cce6 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -222,48 +222,6 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+         return !!*ret;
+ }
+ 
+-size_t udev_node_escape_path(const char *src, char *dest, size_t size) {
+-        size_t i, j;
+-        uint64_t h;
+-
+-        assert(src);
+-        assert(dest);
+-        assert(size >= 12);
+-
+-        for (i = 0, j = 0; src[i] != '\0'; i++) {
+-                if (src[i] == '/') {
+-                        if (j+4 >= size - 12 + 1)
+-                                goto toolong;
+-                        memcpy(&dest[j], "\\x2f", 4);
+-                        j += 4;
+-                } else if (src[i] == '\\') {
+-                        if (j+4 >= size - 12 + 1)
+-                                goto toolong;
+-                        memcpy(&dest[j], "\\x5c", 4);
+-                        j += 4;
+-                } else {
+-                        if (j+1 >= size - 12 + 1)
+-                                goto toolong;
+-                        dest[j] = src[i];
+-                        j++;
+-                }
+-        }
+-        dest[j] = '\0';
+-        return j;
+-
+-toolong:
+-        /* If the input path is too long to encode as a filename, then let's suffix with a string
+-         * generated from the hash of the path. */
+-
+-        h = siphash24_string(src, UDEV_NODE_HASH_KEY.bytes);
+-
+-        for (unsigned k = 0; k <= 10; k++)
+-                dest[size - k - 2] = urlsafe_base64char((h >> (k * 6)) & 63);
+-
+-        dest[size - 1] = '\0';
+-        return size - 1;
+-}
+-
+ static int update_timestamp(sd_device *dev, const char *path, struct stat *prev) {
+         assert(path);
+         assert(prev);
+@@ -414,6 +372,48 @@ static int update_stack_directory(sd_device *dev, const char *dirname, bool add)
+         return log_device_debug_errno(dev, SYNTHETIC_ERRNO(ELOOP), "Failed to create symbolic link %s: %m", filename);
+ }
+ 
++size_t udev_node_escape_path(const char *src, char *dest, size_t size) {
++        size_t i, j;
++        uint64_t h;
++
++        assert(src);
++        assert(dest);
++        assert(size >= 12);
++
++        for (i = 0, j = 0; src[i] != '\0'; i++) {
++                if (src[i] == '/') {
++                        if (j+4 >= size - 12 + 1)
++                                goto toolong;
++                        memcpy(&dest[j], "\\x2f", 4);
++                        j += 4;
++                } else if (src[i] == '\\') {
++                        if (j+4 >= size - 12 + 1)
++                                goto toolong;
++                        memcpy(&dest[j], "\\x5c", 4);
++                        j += 4;
++                } else {
++                        if (j+1 >= size - 12 + 1)
++                                goto toolong;
++                        dest[j] = src[i];
++                        j++;
++                }
++        }
++        dest[j] = '\0';
++        return j;
++
++toolong:
++        /* If the input path is too long to encode as a filename, then let's suffix with a string
++         * generated from the hash of the path. */
++
++        h = siphash24_string(src, UDEV_NODE_HASH_KEY.bytes);
++
++        for (unsigned k = 0; k <= 10; k++)
++                dest[size - k - 2] = urlsafe_base64char((h >> (k * 6)) & 63);
++
++        dest[size - 1] = '\0';
++        return size - 1;
++}
++
+ /* manage "stack of names" with possibly specified device priorities */
+ static int link_update(sd_device *dev, const char *slink_in, bool add) {
+         _cleanup_free_ char *slink = NULL, *dirname = NULL;
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-introduce-stack_directory.patch b/meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-introduce-stack_directory.patch
new file mode 100644
index 0000000000..edc7ab5b38
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-introduce-stack_directory.patch
@@ -0,0 +1,90 @@
+From 7e7c36fbbb396364c386bf1edbe9b25179a134c6 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 11:26:08 +0900
+Subject: [PATCH 02/10] udev: split link_update() and introduce
+ stack_directory_get_name()
+
+No functionality is changed.
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/7e7c36fbbb396364c386bf1edbe9b25179a134c6]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 52 ++++++++++++++++++++++++++++----------------
+ 1 file changed, 33 insertions(+), 19 deletions(-)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index 79d050cce6..b4b865c021 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -414,33 +414,47 @@ toolong:
+         return size - 1;
+ }
+ 
+-/* manage "stack of names" with possibly specified device priorities */
+-static int link_update(sd_device *dev, const char *slink_in, bool add) {
+-        _cleanup_free_ char *slink = NULL, *dirname = NULL;
+-        const char *slink_name;
++static int stack_directory_get_name(const char *slink, char **ret) {
++        _cleanup_free_ char *s = NULL, *dirname = NULL;
+         char name_enc[NAME_MAX+1];
+-        int r;
++        const char *name;
+ 
+-        assert(dev);
+-        assert(slink_in);
++        assert(slink);
++        assert(ret);
+ 
+-        slink = strdup(slink_in);
+-        if (!slink)
+-                return log_oom_debug();
++        s = strdup(slink);
++        if (!s)
++                return -ENOMEM;
+ 
+-        path_simplify(slink);
++        path_simplify(s);
+ 
+-        slink_name = path_startswith(slink, "/dev");
+-        if (!slink_name ||
+-            empty_or_root(slink_name) ||
+-            !path_is_normalized(slink_name))
+-                return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EINVAL),
+-                                              "Invalid symbolic link of device node: %s", slink);
++        if (!path_is_normalized(s))
++                return -EINVAL;
++
++        name = path_startswith(s, "/dev");
++        if (empty_or_root(name))
++                return -EINVAL;
++
++        udev_node_escape_path(name, name_enc, sizeof(name_enc));
+ 
+-        (void) udev_node_escape_path(slink_name, name_enc, sizeof(name_enc));
+         dirname = path_join("/run/udev/links", name_enc);
+         if (!dirname)
+-                return log_oom_debug();
++                return -ENOMEM;
++
++        *ret = TAKE_PTR(dirname);
++        return 0;
++}
++
++static int link_update(sd_device *dev, const char *slink, bool add) {
++        _cleanup_free_ char *dirname = NULL;
++        int r;
++
++        assert(dev);
++        assert(slink);
++
++        r = stack_directory_get_name(slink, &dirname);
++        if (r < 0)
++                return log_device_debug_errno(dev, r, "Failed to build stack directory name for '%s': %m", slink);
+ 
+         r = update_stack_directory(dev, dirname, add);
+         if (r < 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-directory-even-if-it-is-emp.patch b/meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-directory-even-if-it-is-emp.patch
new file mode 100644
index 0000000000..6d2b178bd4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-directory-even-if-it-is-emp.patch
@@ -0,0 +1,267 @@
+From a28d67a90374a9d11bd5635f81961f72e5a8b33e Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 11:47:20 +0900
+Subject: [PATCH 03/10] udev: do not remove stack directory even if it is empty
+
+Then, we can always assume the directory exists, and the code become
+slightly simpler.
+
+Note, unused directories are removed by the main udevd process in a
+later commit.
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/a28d67a90374a9d11bd5635f81961f72e5a8b33e]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 158 +++++++++++++++++--------------------------
+ 1 file changed, 61 insertions(+), 97 deletions(-)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index b4b865c021..6ead839a5f 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -35,7 +35,6 @@
+ 
+ #define CREATE_LINK_MAX_RETRIES        128
+ #define LINK_UPDATE_MAX_RETRIES        128
+-#define CREATE_STACK_LINK_MAX_RETRIES  128
+ #define UPDATE_TIMESTAMP_MAX_RETRIES   128
+ #define MAX_RANDOM_DELAY (250 * USEC_PER_MSEC)
+ #define MIN_RANDOM_DELAY ( 50 * USEC_PER_MSEC)
+@@ -140,15 +139,8 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+         }
+ 
+         dir = opendir(stackdir);
+-        if (!dir) {
+-                if (add) /* The stack directory must exist. */
+-                        return -errno;
+-                if (errno != ENOENT)
+-                        return -errno;
+-
+-                *ret = NULL;
+-                return 0;
+-        }
++        if (!dir)
++                return -errno;
+ 
+         r = device_get_device_id(dev, &id);
+         if (r < 0)
+@@ -222,8 +214,8 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+         return !!*ret;
+ }
+ 
+-static int update_timestamp(sd_device *dev, const char *path, struct stat *prev) {
+-        assert(path);
++static int update_timestamp(sd_device *dev, int fd, struct stat *prev) {
++        assert(fd >= 0);
+         assert(prev);
+ 
+         /* Even if a symlink in the stack directory is created/removed, the mtime of the directory may
+@@ -247,129 +239,96 @@ static int update_timestamp(sd_device *dev, const char *path, struct stat *prev)
+          * timestamp of the stack directory is always increased at least in the above step 5, so A can
+          * detect the update. */
+ 
+-        if ((prev->st_mode & S_IFMT) == 0)
+-                return 0; /* Does not exist, or previous stat() failed. */
+-
+         for (unsigned i = 0; i < UPDATE_TIMESTAMP_MAX_RETRIES; i++) {
+                 struct stat st;
+ 
+-                if (stat(path, &st) < 0)
++                if (fstat(fd, &st) < 0)
+                         return -errno;
+ 
+                 if (!stat_inode_unmodified(prev, &st))
+                         return 0;
+ 
+                 log_device_debug(dev,
+-                                 "%s is modified, but its timestamp is not changed, "
+-                                 "updating timestamp after 10ms.",
+-                                 path);
++                                 "Stack directory is modified, but its timestamp is not changed, "
++                                 "updating timestamp after 10ms.");
+ 
+                 (void) usleep(10 * USEC_PER_MSEC);
+-                if (utimensat(AT_FDCWD, path, NULL, 0) < 0)
++                if (futimens(fd, NULL) < 0)
+                         return -errno;
+         }
+ 
+         return -ELOOP;
+ }
+ 
+-static int update_stack_directory(sd_device *dev, const char *dirname, bool add) {
+-        _cleanup_free_ char *filename = NULL, *data = NULL, *buf = NULL;
+-        const char *devname, *id;
+-        struct stat st = {};
+-        int priority, r;
++static int stack_directory_update(sd_device *dev, int fd, bool add) {
++        struct stat st;
++        const char *id;
++        int r;
+ 
+         assert(dev);
+-        assert(dirname);
++        assert(fd >= 0);
+ 
+         r = device_get_device_id(dev, &id);
+         if (r < 0)
+-                return log_device_debug_errno(dev, r, "Failed to get device id: %m");
+-
+-        filename = path_join(dirname, id);
+-        if (!filename)
+-                return log_oom_debug();
++                return r;
+ 
+-        if (!add) {
+-                int unlink_error = 0, stat_error = 0;
++        if (fstat(fd, &st) < 0)
++                return -errno;
+ 
+-                if (stat(dirname, &st) < 0) {
+-                        if (errno == ENOENT)
+-                                return 0; /* The stack directory is already removed. That's OK. */
+-                        stat_error = -errno;
+-                }
++        if (add) {
++                _cleanup_free_ char *data = NULL, *buf = NULL;
++                const char *devname;
++                int priority;
+ 
+-                if (unlink(filename) < 0)
+-                        unlink_error = -errno;
++                r = sd_device_get_devname(dev, &devname);
++                if (r < 0)
++                        return r;
+ 
+-                if (rmdir(dirname) >= 0 || errno == ENOENT)
+-                        return 0;
++                r = device_get_devlink_priority(dev, &priority);
++                if (r < 0)
++                        return r;
+ 
+-                if (unlink_error < 0) {
+-                        if (unlink_error == -ENOENT)
+-                                return 0;
++                if (asprintf(&data, "%i:%s", priority, devname) < 0)
++                        return -ENOMEM;
+ 
+-                        /* If we failed to remove the symlink, then there is almost nothing we can do. */
+-                        return log_device_debug_errno(dev, unlink_error, "Failed to remove %s: %m", filename);
+-                }
++                if (readlinkat_malloc(fd, id, &buf) >= 0 && streq(buf, data))
++                        return 0; /* Unchanged. */
+ 
+-                if (stat_error < 0)
+-                        return log_device_debug_errno(dev, stat_error, "Failed to stat %s: %m", dirname);
++                (void) unlinkat(fd, id, 0);
+ 
+-                /* The symlink was removed. Check if the timestamp of directory is changed. */
+-                r = update_timestamp(dev, dirname, &st);
+-                if (r < 0 && r != -ENOENT)
+-                        return log_device_debug_errno(dev, r, "Failed to update timestamp of %s: %m", dirname);
++                if (symlinkat(data, fd, id) < 0)
++                        return -errno;
+ 
+-                return 0;
++        } else {
++                if (unlinkat(fd, id, 0) < 0) {
++                        if (errno == ENOENT)
++                                return 0; /* Unchanged. */
++                        return -errno;
++                }
+         }
+ 
+-        r = sd_device_get_devname(dev, &devname);
++        r = update_timestamp(dev, fd, &st);
+         if (r < 0)
+-                return log_device_debug_errno(dev, r, "Failed to get device node: %m");
+-
+-        r = device_get_devlink_priority(dev, &priority);
+-        if (r < 0)
+-                return log_device_debug_errno(dev, r, "Failed to get priority of device node symlink: %m");
+-
+-        if (asprintf(&data, "%i:%s", priority, devname) < 0)
+-                return log_oom_debug();
+-
+-        if (readlink_malloc(filename, &buf) >= 0 && streq(buf, data))
+-                return 0;
+-
+-        if (unlink(filename) < 0 && errno != ENOENT)
+-                log_device_debug_errno(dev, errno, "Failed to remove %s, ignoring: %m", filename);
++                return r;
+ 
+-        for (unsigned j = 0; j < CREATE_STACK_LINK_MAX_RETRIES; j++) {
+-                /* This may fail with -ENOENT when the parent directory is removed during
+-                 * creating the file by another udevd worker. */
+-                r = mkdir_p(dirname, 0755);
+-                if (r == -ENOENT)
+-                        continue;
+-                if (r < 0)
+-                        return log_device_debug_errno(dev, r, "Failed to create directory %s: %m", dirname);
++        return 0;
++}
+ 
+-                if (stat(dirname, &st) < 0) {
+-                        if (errno == ENOENT)
+-                                continue;
+-                        return log_device_debug_errno(dev, errno, "Failed to stat %s: %m", dirname);
+-                }
++static int stack_directory_open(const char *dirname) {
++        _cleanup_close_ int fd = -1;
++        int r;
+ 
+-                if (symlink(data, filename) < 0) {
+-                        if (errno == ENOENT)
+-                                continue;
+-                        return log_device_debug_errno(dev, errno, "Failed to create symbolic link %s: %m", filename);
+-                }
++        assert(dirname);
+ 
+-                /* The symlink was created. Check if the timestamp of directory is changed. */
+-                r = update_timestamp(dev, dirname, &st);
+-                if (r < 0)
+-                        return log_device_debug_errno(dev, r, "Failed to update timestamp of %s: %m", dirname);
++        r = mkdir_parents(dirname, 0755);
++        if (r < 0)
++                return r;
+ 
+-                return 0;
+-        }
++        fd = open_mkdir_at(AT_FDCWD, dirname, O_CLOEXEC | O_DIRECTORY | O_NOFOLLOW | O_RDONLY, 0755);
++        if (fd < 0)
++                return fd;
+ 
+-        return log_device_debug_errno(dev, SYNTHETIC_ERRNO(ELOOP), "Failed to create symbolic link %s: %m", filename);
++        return TAKE_FD(fd);
+ }
+ 
+ size_t udev_node_escape_path(const char *src, char *dest, size_t size) {
+@@ -447,6 +406,7 @@ static int stack_directory_get_name(const char *slink, char **ret) {
+ 
+ static int link_update(sd_device *dev, const char *slink, bool add) {
+         _cleanup_free_ char *dirname = NULL;
++        _cleanup_close_ int dirfd = -1;
+         int r;
+ 
+         assert(dev);
+@@ -456,9 +416,13 @@ static int link_update(sd_device *dev, const char *slink, bool add) {
+         if (r < 0)
+                 return log_device_debug_errno(dev, r, "Failed to build stack directory name for '%s': %m", slink);
+ 
+-        r = update_stack_directory(dev, dirname, add);
++        dirfd = stack_directory_open(dirname);
++        if (dirfd < 0)
++                return log_device_debug_errno(dev, dirfd, "Failed to open stack directory '%s': %m", dirname);
++
++        r = stack_directory_update(dev, dirfd, add);
+         if (r < 0)
+-                return r;
++                return log_device_debug_errno(dev, r, "Failed to update stack directory '%s': %m", dirname);
+ 
+         for (unsigned i = 0; i < LINK_UPDATE_MAX_RETRIES; i++) {
+                 _cleanup_free_ char *target = NULL;
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_relative_parent.patch b/meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_relative_parent.patch
new file mode 100644
index 0000000000..dfc9fc9886
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_relative_parent.patch
@@ -0,0 +1,99 @@
+From d4f60bdc11d8e6275922ca5c7f80b130ebbb3d5f Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 07:01:59 +0900
+Subject: [PATCH 04/10] path-util: introduce path_make_relative_parent()
+
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/d4f60bdc11d8e6275922ca5c7f80b130ebbb3d5f]
+Comments: Refreshed first two hunks to apply patch cleanly without patch-fuzz
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/basic/path-util.c     | 18 ++++++++++++++++++
+ src/basic/path-util.h     |  1 +
+ src/test/test-path-util.c | 27 +++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+)
+
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index 338377d918..41e0d4d753 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -201,6 +201,24 @@ int path_make_relative(const char *from,
+         return 0;
+ }
+ 
++int path_make_relative_parent(const char *from_child, const char *to, char **ret) {
++        _cleanup_free_ char *from = NULL;
++        int r;
++
++        assert(from_child);
++        assert(to);
++        assert(ret);
++
++        /* Similar to path_make_relative(), but provides the relative path from the parent directory of
++         * 'from_child'. This may be useful when creating relative symlink. */
++
++        r = path_extract_directory(from_child, &from);
++        if (r < 0)
++                return r;
++
++        return path_make_relative(from, to, ret);
++}
++
+ char* path_startswith_strv(const char *p, char **set) {
+         char **s, *t;
+ 
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index 41bbc7bb86..8cd7f512a6 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -57,6 +57,7 @@ char* path_make_absolute(const char *p,
+ int safe_getcwd(char **ret);
+ int path_make_absolute_cwd(const char *p, char **ret);
+ int path_make_relative(const char *from, const char *to, char **ret);
++int path_make_relative_parent(const char *from_child, const char *to, char **ret);
+ char *path_startswith_full(const char *path, const char *prefix, bool accept_dot_dot) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix) {
+         return path_startswith_full(path, prefix, true);
+diff --git a/src/test/test-path-util.c b/src/test/test-path-util.c
+index e0583cfbab..a26e351233 100644
+--- a/src/test/test-path-util.c
++++ b/src/test/test-path-util.c
+@@ -477,6 +477,33 @@ TEST(path_make_relative) {
+         test_path_make_relative_one("//extra.//.//./.slashes//./won't////fo.ol///anybody//", "/././/extra././/.slashes////ar.e/.just/././.fine///", "../../../ar.e/.just/.fine");
+ }
+ 
++static void test_path_make_relative_parent_one(const char *from, const char *to, const char *expected) {
++        _cleanup_free_ char *z = NULL;
++        int r;
++
++        log_info("/* %s(%s, %s) */", __func__, from, to);
++
++        r = path_make_relative_parent(from, to, &z);
++        assert_se((r >= 0) == !!expected);
++        assert_se(streq_ptr(z, expected));
++}
++
++TEST(path_make_relative_parent) {
++        test_path_make_relative_parent_one("some/relative/path/hoge", "/some/path", NULL);
++        test_path_make_relative_parent_one("/some/path/hoge", "some/relative/path", NULL);
++        test_path_make_relative_parent_one("/some/dotdot/../path/hoge", "/some/path", NULL);
++        test_path_make_relative_parent_one("/", "/aaa", NULL);
++
++        test_path_make_relative_parent_one("/hoge", "/", ".");
++        test_path_make_relative_parent_one("/hoge", "/some/path", "some/path");
++        test_path_make_relative_parent_one("/some/path/hoge", "/some/path", ".");
++        test_path_make_relative_parent_one("/some/path/hoge", "/some/path/in/subdir", "in/subdir");
++        test_path_make_relative_parent_one("/some/path/hoge", "/", "../..");
++        test_path_make_relative_parent_one("/some/path/hoge", "/some/other/path", "../other/path");
++        test_path_make_relative_parent_one("/some/path/./dot/hoge", "/some/further/path", "../../further/path");
++        test_path_make_relative_parent_one("//extra.//.//./.slashes//./won't////fo.ol///anybody//hoge", "/././/extra././/.slashes////ar.e/.just/././.fine///", "../../../ar.e/.just/.fine");
++}
++
+ TEST(path_strv_resolve) {
+         char tmp_dir[] = "/tmp/test-path-util-XXXXXX";
+         _cleanup_strv_free_ char **search_dirs = NULL;
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.patch b/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.patch
new file mode 100644
index 0000000000..42179f2031
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.patch
@@ -0,0 +1,74 @@
+From faadf97500dc8e76350a409c127f3f0fed116f9a Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 03:29:07 +0900
+Subject: [PATCH 05/10] udev: use readlinkat_malloc()
+
+And try to read it only when the file is symlink.
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/faadf97500dc8e76350a409c127f3f0fed116f9a]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index 6ead839a5f..0320f2d041 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -147,7 +147,6 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+                 return r;
+ 
+         FOREACH_DIRENT_ALL(de, dir, break) {
+-                _cleanup_free_ char *path = NULL, *buf = NULL;
+                 int tmp_prio;
+ 
+                 if (de->d_name[0] == '.')
+@@ -157,15 +156,18 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+                 if (streq(de->d_name, id))
+                         continue;
+ 
+-                path = path_join(stackdir, de->d_name);
+-                if (!path)
+-                        return -ENOMEM;
+-
+-                if (readlink_malloc(path, &buf) >= 0) {
++                if (de->d_type == DT_LNK) {
++                        _cleanup_free_ char *buf = NULL;
+                         char *devnode;
+ 
+                         /* New format. The devnode and priority can be obtained from symlink. */
+ 
++                        r = readlinkat_malloc(dirfd(dir), de->d_name, &buf);
++                        if (r < 0) {
++                                log_device_debug_errno(dev, r, "Failed to read symlink %s, ignoring: %m", de->d_name);
++                                continue;
++                        }
++
+                         devnode = strchr(buf, ':');
+                         if (!devnode || devnode == buf)
+                                 continue;
+@@ -183,7 +185,8 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+                         r = free_and_strdup(&target, devnode);
+                         if (r < 0)
+                                 return r;
+-                } else {
++
++                } else if (de->d_type == DT_REG) {
+                         _cleanup_(sd_device_unrefp) sd_device *tmp_dev = NULL;
+                         const char *devnode;
+ 
+@@ -205,7 +208,8 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+                         r = free_and_strdup(&target, devnode);
+                         if (r < 0)
+                                 return r;
+-                }
++                } else
++                        continue;
+ 
+                 priority = tmp_prio;
+         }
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioritized-and-variables.patch b/meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioritized-and-variables.patch
new file mode 100644
index 0000000000..8fe4c9281c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioritized-and-variables.patch
@@ -0,0 +1,190 @@
+From 6b01e2905c387002a20b0a38f4b7670c8eb82cb8 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 11:56:52 +0900
+Subject: [PATCH 06/10] udev: rename link_find_prioritized() and variables
+
+Also shorten code a bit.
+
+Just for consistency with other part and readability of the code.
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/6b01e2905c387002a20b0a38f4b7670c8eb82cb8]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 62 ++++++++++++++++++++++----------------------
+ 1 file changed, 31 insertions(+), 31 deletions(-)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index 0320f2d041..f358564b41 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -63,20 +63,21 @@ static int create_symlink(const char *target, const char *slink) {
+         return r;
+ }
+ 
+-static int node_symlink(sd_device *dev, const char *node, const char *slink) {
++static int node_symlink(sd_device *dev, const char *devnode, const char *slink) {
+         _cleanup_free_ char *slink_dirname = NULL, *target = NULL;
+         const char *id, *slink_tmp;
+-        struct stat stats;
++        struct stat st;
+         int r;
+ 
+         assert(dev);
+-        assert(node);
++        assert(devnode);
+         assert(slink);
+ 
+-        if (lstat(slink, &stats) >= 0) {
+-                if (!S_ISLNK(stats.st_mode))
++        if (lstat(slink, &st) >= 0) {
++                if (!S_ISLNK(st.st_mode))
+                         return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EEXIST),
+-                                                      "Conflicting inode '%s' found, link to '%s' will not be created.", slink, node);
++                                                      "Conflicting inode '%s' found, link to '%s' will not be created.",
++                                                      slink, devnode);
+         } else if (errno != ENOENT)
+                 return log_device_debug_errno(dev, errno, "Failed to lstat() '%s': %m", slink);
+ 
+@@ -85,9 +86,9 @@ static int node_symlink(sd_device *dev, const char *node, const char *slink) {
+                 return log_device_debug_errno(dev, r, "Failed to get parent directory of '%s': %m", slink);
+ 
+         /* use relative link */
+-        r = path_make_relative(slink_dirname, node, &target);
++        r = path_make_relative(slink_dirname, devnode, &target);
+         if (r < 0)
+-                return log_device_debug_errno(dev, r, "Failed to get relative path from '%s' to '%s': %m", slink, node);
++                return log_device_debug_errno(dev, r, "Failed to get relative path from '%s' to '%s': %m", slink, devnode);
+ 
+         r = device_get_device_id(dev, &id);
+         if (r < 0)
+@@ -109,36 +110,36 @@ static int node_symlink(sd_device *dev, const char *node, const char *slink) {
+         return 0;
+ }
+ 
+-static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir, char **ret) {
++static int stack_directory_find_prioritized_devnode(sd_device *dev, const char *dirname, bool add, char **ret) {
+         _cleanup_closedir_ DIR *dir = NULL;
+-        _cleanup_free_ char *target = NULL;
++        _cleanup_free_ char *devnode = NULL;
+         int r, priority = 0;
+         const char *id;
+ 
+         assert(dev);
+-        assert(stackdir);
++        assert(dirname);
+         assert(ret);
+ 
+         /* Find device node of device with highest priority. This returns 1 if a device found, 0 if no
+-         * device found, or a negative errno. */
++         * device found, or a negative errno on error. */
+ 
+         if (add) {
+-                const char *devnode;
++                const char *n;
+ 
+                 r = device_get_devlink_priority(dev, &priority);
+                 if (r < 0)
+                         return r;
+ 
+-                r = sd_device_get_devname(dev, &devnode);
++                r = sd_device_get_devname(dev, &n);
+                 if (r < 0)
+                         return r;
+ 
+-                target = strdup(devnode);
+-                if (!target)
++                devnode = strdup(n);
++                if (!devnode)
+                         return -ENOMEM;
+         }
+ 
+-        dir = opendir(stackdir);
++        dir = opendir(dirname);
+         if (!dir)
+                 return -errno;
+ 
+@@ -158,7 +159,7 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+ 
+                 if (de->d_type == DT_LNK) {
+                         _cleanup_free_ char *buf = NULL;
+-                        char *devnode;
++                        char *colon;
+ 
+                         /* New format. The devnode and priority can be obtained from symlink. */
+ 
+@@ -168,27 +169,25 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+                                 continue;
+                         }
+ 
+-                        devnode = strchr(buf, ':');
+-                        if (!devnode || devnode == buf)
++                        colon = strchr(buf, ':');
++                        if (!colon || colon == buf)
+                                 continue;
+ 
+-                        *(devnode++) = '\0';
+-                        if (!path_startswith(devnode, "/dev"))
+-                                continue;
++                        *colon = '\0';
+ 
+                         if (safe_atoi(buf, &tmp_prio) < 0)
+                                 continue;
+ 
+-                        if (target && tmp_prio <= priority)
++                        if (devnode && tmp_prio <= priority)
+                                 continue;
+ 
+-                        r = free_and_strdup(&target, devnode);
++                        r = free_and_strdup(&devnode, colon + 1);
+                         if (r < 0)
+                                 return r;
+ 
+                 } else if (de->d_type == DT_REG) {
+                         _cleanup_(sd_device_unrefp) sd_device *tmp_dev = NULL;
+-                        const char *devnode;
++                        const char *val;
+ 
+                         /* Old format. The devnode and priority must be obtained from uevent and
+                          * udev database files. */
+@@ -199,22 +198,23 @@ static int link_find_prioritized(sd_device *dev, bool add, const char *stackdir,
+                         if (device_get_devlink_priority(tmp_dev, &tmp_prio) < 0)
+                                 continue;
+ 
+-                        if (target && tmp_prio <= priority)
++                        if (devnode && tmp_prio <= priority)
+                                 continue;
+ 
+-                        if (sd_device_get_devname(tmp_dev, &devnode) < 0)
++                        if (sd_device_get_devname(tmp_dev, &val) < 0)
+                                 continue;
+ 
+-                        r = free_and_strdup(&target, devnode);
++                        r = free_and_strdup(&devnode, val);
+                         if (r < 0)
+                                 return r;
++
+                 } else
+                         continue;
+ 
+                 priority = tmp_prio;
+         }
+ 
+-        *ret = TAKE_PTR(target);
++        *ret = TAKE_PTR(devnode);
+         return !!*ret;
+ }
+ 
+@@ -443,7 +443,7 @@ static int link_update(sd_device *dev, const char *slink, bool add) {
+                 if (stat(dirname, &st1) < 0 && errno != ENOENT)
+                         return log_device_debug_errno(dev, errno, "Failed to stat %s: %m", dirname);
+ 
+-                r = link_find_prioritized(dev, add, dirname, &target);
++                r = stack_directory_find_prioritized_devnode(dev, dirname, add, &target);
+                 if (r < 0)
+                         return log_device_debug_errno(dev, r, "Failed to determine device node with the highest priority for '%s': %m", slink);
+                 if (r == 0) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_parent.patch b/meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_parent.patch
new file mode 100644
index 0000000000..6a0ea22672
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_parent.patch
@@ -0,0 +1,43 @@
+From d6595c5ced636d44dc40adfb0b7cfc929bcac7a3 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 12:05:36 +0900
+Subject: [PATCH 07/10] udev: use path_make_relative_parent()
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/d6595c5ced636d44dc40adfb0b7cfc929bcac7a3]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index f358564b41..5a011cf86b 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -64,7 +64,7 @@ static int create_symlink(const char *target, const char *slink) {
+ }
+ 
+ static int node_symlink(sd_device *dev, const char *devnode, const char *slink) {
+-        _cleanup_free_ char *slink_dirname = NULL, *target = NULL;
++        _cleanup_free_ char *target = NULL;
+         const char *id, *slink_tmp;
+         struct stat st;
+         int r;
+@@ -81,12 +81,8 @@ static int node_symlink(sd_device *dev, const char *devnode, const char *slink)
+         } else if (errno != ENOENT)
+                 return log_device_debug_errno(dev, errno, "Failed to lstat() '%s': %m", slink);
+ 
+-        r = path_extract_directory(slink, &slink_dirname);
+-        if (r < 0)
+-                return log_device_debug_errno(dev, r, "Failed to get parent directory of '%s': %m", slink);
+-
+         /* use relative link */
+-        r = path_make_relative(slink_dirname, devnode, &target);
++        r = path_make_relative_parent(slink, devnode, &target);
+         if (r < 0)
+                 return log_device_debug_errno(dev, r, "Failed to get relative path from '%s' to '%s': %m", slink, devnode);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-NULL-devname.patch b/meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-NULL-devname.patch
new file mode 100644
index 0000000000..cb29367f4d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-NULL-devname.patch
@@ -0,0 +1,75 @@
+From 541a463fd5aad912c07c88d84e5a1c597c810956 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 12:08:06 +0900
+Subject: [PATCH 08/10] udev: make node_symlink() accept NULL devname
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/541a463fd5aad912c07c88d84e5a1c597c810956]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 24 +++++++++---------------
+ 1 file changed, 9 insertions(+), 15 deletions(-)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index 5a011cf86b..8e78546e18 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -70,13 +70,18 @@ static int node_symlink(sd_device *dev, const char *devnode, const char *slink)
+         int r;
+ 
+         assert(dev);
+-        assert(devnode);
+         assert(slink);
+ 
++        if (!devnode) {
++                r = sd_device_get_devname(dev, &devnode);
++                if (r < 0)
++                        return log_device_debug_errno(dev, r, "Failed to get device node: %m");
++        }
++
+         if (lstat(slink, &st) >= 0) {
+                 if (!S_ISLNK(st.st_mode))
+                         return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EEXIST),
+-                                                      "Conflicting inode '%s' found, link to '%s' will not be created.",
++                                                      "Conflicting inode '%s' found, symlink to '%s' will not be created.",
+                                                       slink, devnode);
+         } else if (errno != ENOENT)
+                 return log_device_debug_errno(dev, errno, "Failed to lstat() '%s': %m", slink);
+@@ -488,23 +493,12 @@ static int device_get_devpath_by_devnum(sd_device *dev, char **ret) {
+ 
+ int udev_node_update(sd_device *dev, sd_device *dev_old) {
+         _cleanup_free_ char *filename = NULL;
+-        const char *devnode, *devlink;
++        const char *devlink;
+         int r;
+ 
+         assert(dev);
+         assert(dev_old);
+ 
+-        r = sd_device_get_devname(dev, &devnode);
+-        if (r < 0)
+-                return log_device_debug_errno(dev, r, "Failed to get devnode: %m");
+-
+-        if (DEBUG_LOGGING) {
+-                const char *id = NULL;
+-
+-                (void) device_get_device_id(dev, &id);
+-                log_device_debug(dev, "Handling device node '%s', devnum=%s", devnode, strna(id));
+-        }
+-
+         /* update possible left-over symlinks */
+         FOREACH_DEVICE_DEVLINK(dev_old, devlink) {
+                 /* check if old link name still belongs to this device */
+@@ -536,7 +530,7 @@ int udev_node_update(sd_device *dev, sd_device *dev_old) {
+                 return log_device_debug_errno(dev, r, "Failed to get device path: %m");
+ 
+         /* always add /dev/{block,char}/$major:$minor */
+-        r = node_symlink(dev, devnode, filename);
++        r = node_symlink(dev, NULL, filename);
+         if (r < 0)
+                 return log_device_warning_errno(dev, r, "Failed to create device symlink '%s': %m", filename);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-device-node-symlinks.patch b/meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-device-node-symlinks.patch
new file mode 100644
index 0000000000..96ce076378
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-device-node-symlinks.patch
@@ -0,0 +1,277 @@
+From 57a272902aa821f9598dd0d74eab98d287473a63 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 12:17:23 +0900
+Subject: [PATCH 09/10] udev: use flock() when updating device node symlinks
+
+By locking the stack directory, we can safely determine the device node
+with the highest priority for a symlink. So, the multiple try-and-wait
+loops can be dropped, and the code becomes quite simple.
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/57a272902aa821f9598dd0d74eab98d287473a63]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 173 ++++++++++---------------------------------
+ 1 file changed, 40 insertions(+), 133 deletions(-)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index 8e78546e18..42efaaa028 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -1,11 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0-or-later */
+ 
+-#include <errno.h>
+-#include <fcntl.h>
+-#include <stdbool.h>
+-#include <stddef.h>
+-#include <sys/stat.h>
+-#include <unistd.h>
++#include <sys/file.h>
+ 
+ #include "sd-id128.h"
+ 
+@@ -22,47 +17,15 @@
+ #include "mkdir-label.h"
+ #include "parse-util.h"
+ #include "path-util.h"
+-#include "random-util.h"
+ #include "selinux-util.h"
+ #include "smack-util.h"
+ #include "stat-util.h"
+-#include "stdio-util.h"
+ #include "string-util.h"
+-#include "strxcpyx.h"
+-#include "time-util.h"
+ #include "udev-node.h"
+ #include "user-util.h"
+ 
+-#define CREATE_LINK_MAX_RETRIES        128
+-#define LINK_UPDATE_MAX_RETRIES        128
+-#define UPDATE_TIMESTAMP_MAX_RETRIES   128
+-#define MAX_RANDOM_DELAY (250 * USEC_PER_MSEC)
+-#define MIN_RANDOM_DELAY ( 50 * USEC_PER_MSEC)
+ #define UDEV_NODE_HASH_KEY SD_ID128_MAKE(b9,6a,f1,ce,40,31,44,1a,9e,19,ec,8b,ae,f3,e3,2f)
+ 
+-static int create_symlink(const char *target, const char *slink) {
+-        int r;
+-
+-        assert(target);
+-        assert(slink);
+-
+-        for (unsigned i = 0; i < CREATE_LINK_MAX_RETRIES; i++) {
+-                r = mkdir_parents_label(slink, 0755);
+-                if (r == -ENOENT)
+-                        continue;
+-                if (r < 0)
+-                        return r;
+-
+-                mac_selinux_create_file_prepare(slink, S_IFLNK);
+-                r = RET_NERRNO(symlink(target, slink));
+-                mac_selinux_create_file_clear();
+-                if (r != -ENOENT)
+-                        return r;
+-        }
+-
+-        return r;
+-}
+-
+ static int node_symlink(sd_device *dev, const char *devnode, const char *slink) {
+         _cleanup_free_ char *target = NULL;
+         const char *id, *slink_tmp;
+@@ -98,7 +61,13 @@ static int node_symlink(sd_device *dev, const char *devnode, const char *slink)
+         slink_tmp = strjoina(slink, ".tmp-", id);
+         (void) unlink(slink_tmp);
+ 
+-        r = create_symlink(target, slink_tmp);
++        r = mkdir_parents_label(slink_tmp, 0755);
++        if (r < 0)
++                return log_device_debug_errno(dev, r, "Failed to create parent directory of '%s': %m", slink_tmp);
++
++        mac_selinux_create_file_prepare(slink_tmp, S_IFLNK);
++        r = RET_NERRNO(symlink(target, slink_tmp));
++        mac_selinux_create_file_clear();
+         if (r < 0)
+                 return log_device_debug_errno(dev, r, "Failed to create symlink '%s' to '%s': %m", slink_tmp, target);
+ 
+@@ -219,54 +188,7 @@ static int stack_directory_find_prioritized_devnode(sd_device *dev, const char *
+         return !!*ret;
+ }
+ 
+-static int update_timestamp(sd_device *dev, int fd, struct stat *prev) {
+-        assert(fd >= 0);
+-        assert(prev);
+-
+-        /* Even if a symlink in the stack directory is created/removed, the mtime of the directory may
+-         * not be changed. Why? Let's consider the following situation. For simplicity, let's assume
+-         * there exist two udev workers (A and B) and all of them calls link_update() for the same
+-         * devlink simultaneously.
+-         *
+-         * 1. A creates/removes a symlink in the stack directory.
+-         * 2. A calls the first stat() in the loop of link_update().
+-         * 3. A calls link_find_prioritized().
+-         * 4. B creates/removes another symlink in the stack directory, so the result of the step 3 is outdated.
+-         * 5. B finishes link_update().
+-         * 6. A creates/removes devlink according to the outdated result in the step 3.
+-         * 7. A calls the second stat() in the loop of link_update().
+-         *
+-         * If these 7 steps are processed in this order within a short time period that kernel's timer
+-         * does not increase, then even if the contents in the stack directory is changed, the results
+-         * of two stat() called by A shows the same timestamp, and A cannot detect the change.
+-         *
+-         * By calling this function after creating/removing symlinks in the stack directory, the
+-         * timestamp of the stack directory is always increased at least in the above step 5, so A can
+-         * detect the update. */
+-
+-        for (unsigned i = 0; i < UPDATE_TIMESTAMP_MAX_RETRIES; i++) {
+-                struct stat st;
+-
+-                if (fstat(fd, &st) < 0)
+-                        return -errno;
+-
+-                if (!stat_inode_unmodified(prev, &st))
+-                        return 0;
+-
+-                log_device_debug(dev,
+-                                 "Stack directory is modified, but its timestamp is not changed, "
+-                                 "updating timestamp after 10ms.");
+-
+-                (void) usleep(10 * USEC_PER_MSEC);
+-                if (futimens(fd, NULL) < 0)
+-                        return -errno;
+-        }
+-
+-        return -ELOOP;
+-}
+-
+ static int stack_directory_update(sd_device *dev, int fd, bool add) {
+-        struct stat st;
+         const char *id;
+         int r;
+ 
+@@ -277,9 +199,6 @@ static int stack_directory_update(sd_device *dev, int fd, bool add) {
+         if (r < 0)
+                 return r;
+ 
+-        if (fstat(fd, &st) < 0)
+-                return -errno;
+-
+         if (add) {
+                 _cleanup_free_ char *data = NULL, *buf = NULL;
+                 const char *devname;
+@@ -312,11 +231,7 @@ static int stack_directory_update(sd_device *dev, int fd, bool add) {
+                 }
+         }
+ 
+-        r = update_timestamp(dev, fd, &st);
+-        if (r < 0)
+-                return r;
+-
+-        return 0;
++        return 1; /* Updated. */
+ }
+ 
+ static int stack_directory_open(const char *dirname) {
+@@ -336,6 +251,21 @@ static int stack_directory_open(const char *dirname) {
+         return TAKE_FD(fd);
+ }
+ 
++static int stack_directory_lock(int dirfd) {
++        _cleanup_close_ int fd = -1;
++
++        assert(dirfd >= 0);
++
++        fd = openat(dirfd, ".lock", O_CLOEXEC | O_NOFOLLOW | O_RDONLY | O_CREAT, 0600);
++        if (fd < 0)
++                return -errno;
++
++        if (flock(fd, LOCK_EX) < 0)
++                return -errno;
++
++        return TAKE_FD(fd);
++}
++
+ size_t udev_node_escape_path(const char *src, char *dest, size_t size) {
+         size_t i, j;
+         uint64_t h;
+@@ -410,8 +340,8 @@ static int stack_directory_get_name(const char *slink, char **ret) {
+ }
+ 
+ static int link_update(sd_device *dev, const char *slink, bool add) {
+-        _cleanup_free_ char *dirname = NULL;
+-        _cleanup_close_ int dirfd = -1;
++        _cleanup_free_ char *dirname = NULL, *devnode = NULL;
++        _cleanup_close_ int dirfd = -1, lockfd = -1;
+         int r;
+ 
+         assert(dev);
+@@ -425,51 +355,28 @@ static int link_update(sd_device *dev, const char *slink, bool add) {
+         if (dirfd < 0)
+                 return log_device_debug_errno(dev, dirfd, "Failed to open stack directory '%s': %m", dirname);
+ 
++        lockfd = stack_directory_lock(dirfd);
++        if (lockfd < 0)
++                return log_device_debug_errno(dev, lockfd, "Failed to lock stack directory '%s': %m", dirname);
++
+         r = stack_directory_update(dev, dirfd, add);
+         if (r < 0)
+                 return log_device_debug_errno(dev, r, "Failed to update stack directory '%s': %m", dirname);
+ 
+-        for (unsigned i = 0; i < LINK_UPDATE_MAX_RETRIES; i++) {
+-                _cleanup_free_ char *target = NULL;
+-                struct stat st1 = {}, st2 = {};
+-
+-                if (i > 0) {
+-                        usec_t delay = MIN_RANDOM_DELAY + random_u64_range(MAX_RANDOM_DELAY - MIN_RANDOM_DELAY);
+-
+-                        log_device_debug(dev, "Directory %s was updated, retrying to update devlink %s after %s.",
+-                                         dirname, slink, FORMAT_TIMESPAN(delay, USEC_PER_MSEC));
+-                        (void) usleep(delay);
+-                }
+-
+-                if (stat(dirname, &st1) < 0 && errno != ENOENT)
+-                        return log_device_debug_errno(dev, errno, "Failed to stat %s: %m", dirname);
+-
+-                r = stack_directory_find_prioritized_devnode(dev, dirname, add, &target);
+-                if (r < 0)
+-                        return log_device_debug_errno(dev, r, "Failed to determine device node with the highest priority for '%s': %m", slink);
+-                if (r == 0) {
+-                        log_device_debug(dev, "No reference left for '%s', removing", slink);
+-
+-                        if (unlink(slink) < 0 && errno != ENOENT)
+-                                log_device_debug_errno(dev, errno, "Failed to remove '%s', ignoring: %m", slink);
++        r = stack_directory_find_prioritized_devnode(dev, dirname, add, &devnode);
++        if (r < 0)
++                return log_device_debug_errno(dev, r, "Failed to determine device node with the highest priority for '%s': %m", slink);
++        if (r > 0)
++                return node_symlink(dev, devnode, slink);
+ 
+-                        (void) rmdir_parents(slink, "/dev");
+-                        return 0;
+-                }
++        log_device_debug(dev, "No reference left for '%s', removing", slink);
+ 
+-                r = node_symlink(dev, target, slink);
+-                if (r < 0)
+-                        return r;
++        if (unlink(slink) < 0 && errno != ENOENT)
++                log_device_debug_errno(dev, errno, "Failed to remove '%s', ignoring: %m", slink);
+ 
+-                if (stat(dirname, &st2) < 0 && errno != ENOENT)
+-                        return log_device_debug_errno(dev, errno, "Failed to stat %s: %m", dirname);
++        (void) rmdir_parents(slink, "/dev");
+ 
+-                if (((st1.st_mode & S_IFMT) == 0 && (st2.st_mode & S_IFMT) == 0) ||
+-                    stat_inode_unmodified(&st1, &st2))
+-                        return 0;
+-        }
+-
+-        return -ELOOP;
++        return 0;
+ }
+ 
+ static int device_get_devpath_by_devnum(sd_device *dev, char **ret) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-run-udev-links-when-all.patch b/meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-run-udev-links-when-all.patch
new file mode 100644
index 0000000000..7a6f614db7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-run-udev-links-when-all.patch
@@ -0,0 +1,130 @@
+From 1055172804e660df2e1c498dafa998ffd65e0c88 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 11 Apr 2022 21:52:49 +0900
+Subject: [PATCH 10/10] udev: cleanup stack directory /run/udev/links when all
+ workers exited
+
+By the previous commit, the stack directories are not removed even if
+it is empty. To reduce the inode usage of /run, let's cleanup the
+directories.
+
+PR - https://github.com/systemd/systemd/pull/23043
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23043/commits/1055172804e660df2e1c498dafa998ffd65e0c88]
+Comments: Refreshed all hunks to apply patch cleanly without patch-fuzz
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/udev/udev-node.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ src/udev/udev-node.h |  1 +
+ src/udev/udevd.c     | 10 ++++++++++
+ 3 files changed, 53 insertions(+)
+
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
+index 42efaaa028..4e7dca06de 100644
+--- a/src/udev/udev-node.c
++++ b/src/udev/udev-node.c
+@@ -24,6 +24,48 @@
+ 
+ #define UDEV_NODE_HASH_KEY SD_ID128_MAKE(b9,6a,f1,ce,40,31,44,1a,9e,19,ec,8b,ae,f3,e3,2f)
+ 
++int udev_node_cleanup(void) {
++        _cleanup_closedir_ DIR *dir = NULL;
++
++        /* This must not be called when any workers exist. It would cause a race between mkdir() called
++         * by stack_directory_lock() and unlinkat() called by this. */
++
++        dir = opendir("/run/udev/links");
++        if (!dir) {
++                if (errno == ENOENT)
++                        return 0;
++
++                return log_debug_errno(errno, "Failed to open directory '/run/udev/links', ignoring: %m");
++        }
++
++        FOREACH_DIRENT_ALL(de, dir, break) {
++                _cleanup_free_ char *lockfile = NULL;
++
++                if (de->d_name[0] == '.')
++                        continue;
++
++                if (de->d_type != DT_DIR)
++                        continue;
++
++                /* As commented in the above, this is called when no worker exists, hence the file is not
++                 * locked. On a later uevent, the lock file will be created if necessary. So, we can safely
++                 * remove the file now. */
++                lockfile = path_join(de->d_name, ".lock");
++                if (!lockfile)
++                        return log_oom_debug();
++
++                if (unlinkat(dirfd(dir), lockfile, 0) < 0 && errno != ENOENT) {
++                        log_debug_errno(errno, "Failed to remove '/run/udev/links/%s', ignoring: %m", lockfile);
++                        continue;
++                }
++
++                if (unlinkat(dirfd(dir), de->d_name, AT_REMOVEDIR) < 0 && errno != ENOTEMPTY)
++                        log_debug_errno(errno, "Failed to remove '/run/udev/links/%s', ignoring: %m", de->d_name);
++        }
++
++        return 0;
++}
++
+ static int node_symlink(sd_device *dev, const char *devnode, const char *slink) {
+         _cleanup_free_ char *target = NULL;
+         const char *id, *slink_tmp;
+diff --git a/src/udev/udev-node.h b/src/udev/udev-node.h
+index 86a829545a..0c545e4a0f 100644
+--- a/src/udev/udev-node.h
++++ b/src/udev/udev-node.h
+@@ -17,5 +17,6 @@ int udev_node_apply_permissions(
+                 OrderedHashmap *seclabel_list);
+ int udev_node_remove(sd_device *dev);
+ int udev_node_update(sd_device *dev, sd_device *dev_old);
++int udev_node_cleanup(void);
+ 
+ size_t udev_node_escape_path(const char *src, char *dest, size_t size);
+diff --git a/src/udev/udevd.c b/src/udev/udevd.c
+index b179dfac37..c519e19897 100644
+--- a/src/udev/udevd.c
++++ b/src/udev/udevd.c
+@@ -62,6 +62,7 @@
+ #include "udev-builtin.h"
+ #include "udev-ctrl.h"
+ #include "udev-event.h"
++#include "udev-node.h"
+ #include "udev-util.h"
+ #include "udev-watch.h"
+ #include "user-util.h"
+@@ -106,6 +107,7 @@ typedef struct Manager {
+ 
+         usec_t last_usec;
+ 
++        bool udev_node_needs_cleanup;
+         bool stop_exec_queue;
+         bool exit;
+ } Manager;
+@@ -933,6 +935,9 @@ static int event_queue_start(Manager *ma
+                 manager->last_usec = usec;
+         }
+ 
++        /* To make the stack directory /run/udev/links cleaned up later. */
++        manager->udev_node_needs_cleanup = true;
++
+         r = event_source_disable(manager->kill_workers_event);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to disable event source for cleaning up idle workers, ignoring: %m");
+@@ -1487,6 +1492,11 @@ static int on_post(sd_event_source *s, v
+ 
+         /* There are no idle workers. */
+ 
++        if (manager->udev_node_needs_cleanup) {
++                (void) udev_node_cleanup();
++                manager->udev_node_needs_cleanup = false;
++        }
++
+         if (manager->exit)
+                 return sd_event_exit(manager->event, 0);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 4d520c85f3..22ebc0a229 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -34,6 +34,16 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
            file://CVE-2023-7008.patch \
            file://fix-vlan-qos-mapping.patch \
+           file://0001-udev-move-udev_node_escape_path.patch \
+           file://0002-udev-split-link_update-and-introduce-stack_directory.patch \
+           file://0003-udev-do-not-remove-stack-directory-even-if-it-is-emp.patch \
+           file://0004-path-util-introduce-path_make_relative_parent.patch \
+           file://0005-udev-use-readlinkat_malloc.patch \
+           file://0006-udev-rename-link_find_prioritized-and-variables.patch \
+           file://0007-udev-use-path_make_relative_parent.patch \
+           file://0008-udev-make-node_symlink-accept-NULL-devname.patch \
+           file://0009-udev-use-flock-when-updating-device-node-symlinks.patch \
+           file://0010-udev-cleanup-stack-directory-run-udev-links-when-all.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


