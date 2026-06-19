Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7793CCDB466
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38120.1781857992146679423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E0ElkbJx;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4626fdc829aso1403175f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857990; x=1782462790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFzTV8SUPACvLkJ0Yek+3QZC0oAbPhHvJBRB/E17EUg=;
        b=E0ElkbJxJNSv7Aig1g50VqESJFmUAcXNDjpipZhPs/xIW5izDQr9tLzuVXu//kjF1B
         sJgpEfd1MGMbiSGR/01/KsqRFb7a0pq1FH7JXuVRf6hkBb+OLNBdEQm3PSWORrRQQXZZ
         tXTuz3ZoHhZHmoYkMcV8c47tlWsCSpeeqMZSRlnUNhEorQs0XYZhcpf89TTnlJEXalHr
         wL19p9pKdGwog8fqT7814Ba8YM2V/0mIlfmTFShfDk1mAqjkOAFBAanVDLZfKrlIzzzk
         GcgjfYWS22wbryNwtORdY6/mkjJrjRLxhMimQ8hd9gNl7uAAFrj3RqAeNW71o4X/n3RQ
         XDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857990; x=1782462790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lFzTV8SUPACvLkJ0Yek+3QZC0oAbPhHvJBRB/E17EUg=;
        b=Itv1spLMENR69Y47cv+qtFesF6QFizWzGMqvkyRG1aF2M+3zTeurtyuev351PrIo/a
         3OotM7ZwkJMnsQE1IGzZEba54IpbE5rFz/D0Ebk+/q3P3UZqqm2CXRM52bsWM8vu1Gie
         Z0FnxmX1dWpwgyCRETXCvbKqeNfC01VSlp3PPQME3cZEboT1wEYSgdImkhtYN7Kh7c3c
         /CnVqJ0gqwpeCmpQ3I1NKplEDKzqEQBmBA4LV8IGE8aD6QAKgPhOpx5eY4k5ASEYqa3R
         rgG29PPjCtYeKLdWFmgbKY9X0gNFIXZPL2wG3P1jkHPYYqmuLVjs782i7Xwd5GP85Vj0
         fHJQ==
X-Gm-Message-State: AOJu0YxUJoQabFW0ptQAeemfD4Pvyli6q8eX+rmkZRg+zLpjx09AoJRZ
	m7vKmXmNIumXhCLiDLQB3nFSeda/OWtjF/Co3bliLbVmtrugxkvc+mCKzhe4jsV2
X-Gm-Gg: AfdE7cm8GqqMbjyQaggbiEUC1A6MvDBcYpgchdyVqMWGnqwGlNiZLZBxdlzTkKsrzrq
	ds0XPIbywNgvomq5p4l6l4bqylT/40LyAPiEkkLgeWVM/6HitPl7BBP9HxKJ8ykJqMi7URl9qYk
	YCWRe6ctdwo3lA5MHA/JiVlG+23aWGSmR63u6yqC1glE5Nw+PVFv//3Cj/wWkzFUyO+YevZ0dPE
	diV9qimJ7V9BSQxZ//bi6G+Sm3hIs/Nn1G18GlbLsvgwuIR3wIuyjpMJ/2ixUGsesWFvQO0qTtv
	eJGRuSQibLhOMv60PgadjjY+VMA2KMhxbA1elubB5r2WBcs22Ccn536vWjLn54Jrywx56e9ldJL
	WG3qvqHoEgRvy5F9ssvERVO/liFQgbLEa3W8PauR0NQGJfVSmLF3MgDgqi4gKMT4jiKNtVrEd8J
	k0CDE7ZxGlD59PUUMUFgrLcmiS8pFcJklDc7h2aMeBUrac8F/j
X-Received: by 2002:a5d:5e91:0:b0:460:138d:c9b0 with SMTP id ffacd0b85a97d-4656d831749mr1939877f8f.2.1781857989957;
        Fri, 19 Jun 2026 01:33:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/15] util-linux: upgrade 2.41.3 -> 2.42.2
Date: Fri, 19 Jun 2026 10:32:44 +0200
Message-ID: <20260619083305.3505156-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239137

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...2.41.3.bb => util-linux-libuuid_2.42.2.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   6 +-
 ...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch | 114 ------------------
 ...gn-sockets-skip-when-lacking-sock_di.patch |  33 -----
 ...ests-script-Disable-size-option-test.patch |  13 +-
 ...code-avoid-using-shell-built-in-kill.patch |  33 -----
 ...se-RTMIN-from-kill-L-instead-of-hard.patch |  55 ---------
 .../util-linux/avoid_parallel_tests.patch     |   4 +-
 .../util-linux/configure-sbindir.patch        |   4 +-
 .../display_testname_for_subtest.patch        |   4 +-
 .../util-linux/util-linux/ptest.patch         |   6 +-
 .../util-linux/util-linux/run-ptest           |   5 +-
 ...l-linux_2.41.3.bb => util-linux_2.42.2.bb} |   2 +-
 13 files changed, 20 insertions(+), 259 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.3.bb => util-linux-libuuid_2.42.2.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.3.bb => util-linux_2.42.2.bb} (99%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..460b996403 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -16,13 +16,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch \
-           file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
-           file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
-           file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch \
            "
 
-SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
+SRC_URI[sha256sum] = "03a05d3adf9602ef128f2da05b84b3205ce60c351e5737c0370f74000679ce8a"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch b/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
deleted file mode 100644
index 0951c9f5fb..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From f55f9906b4f6eeb2b4a4120317df9de935253c10 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 19 Feb 2026 13:59:46 +0100
-Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
-
-Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
-prevents symlink following in both path canonicalization and file open.
-
-When set:
-- loopcxt_set_backing_file() uses strdup() instead of
-  ul_canonicalize_path() (which calls realpath() and follows symlinks)
-- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
-
-The flag is set for non-root (restricted) mount operations in
-libmount's loop device hook. This prevents a TOCTOU race condition
-where an attacker could replace the backing file (specified in
-/etc/fstab) with a symlink to an arbitrary root-owned file between
-path resolution and open().
-
-Vulnerable Code Flow:
-
-  mount /mnt/point (non-root, SUID)
-    mount.c: sanitize_paths() on user args (mountpoint only)
-    mnt_context_mount()
-      mnt_context_prepare_mount()
-        mnt_context_apply_fstab()           <-- source path from fstab
-        hooks run at MNT_STAGE_PREP_SOURCE
-          hook_loopdev.c: setup_loopdev()
-            backing_file = fstab source path ("/home/user/disk.img")
-            loopcxt_set_backing_file()       <-- calls realpath() as ROOT
-              ul_canonicalize_path()         <-- follows symlinks!
-            loopcxt_setup_device()
-              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
-
-Two vulnerabilities in the path:
-
-1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
-   realpath() -- this follows symlinks as euid=0. If the attacker swaps
-   the file to a symlink before this call, lc->filename becomes the
-   resolved target path (e.g., /root/secret.img).
-
-2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
-   if canonicalization happened correctly, the file can be swapped to a
-   symlink between canonicalize and open.
-
-Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vfq4-9h9g
-Signed-off-by: Karel Zak <kzak@redhat.com>
-(cherry picked from commit 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
-
-CVE: CVE-2026-27456
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- include/loopdev.h           | 3 ++-
- lib/loopdev.c               | 7 ++++++-
- libmount/src/hook_loopdev.c | 3 ++-
- 3 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/include/loopdev.h b/include/loopdev.h
-index e5ec1c98a..6bdb1393a 100644
---- a/include/loopdev.h
-+++ b/include/loopdev.h
-@@ -140,7 +140,8 @@ enum {
- 	LOOPDEV_FL_NOIOCTL	= (1 << 6),
- 	LOOPDEV_FL_DEVSUBDIR	= (1 << 7),
- 	LOOPDEV_FL_CONTROL	= (1 << 8),	/* system with /dev/loop-control */
--	LOOPDEV_FL_SIZELIMIT	= (1 << 9)
-+	LOOPDEV_FL_SIZELIMIT	= (1 << 9),
-+	LOOPDEV_FL_NOFOLLOW	= (1 << 10)	/* O_NOFOLLOW, don't follow symlinks */
- };
- 
- /*
-diff --git a/lib/loopdev.c b/lib/loopdev.c
-index 2359bf781..76685be70 100644
---- a/lib/loopdev.c
-+++ b/lib/loopdev.c
-@@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
- 	if (!lc)
- 		return -EINVAL;
- 
--	lc->filename = canonicalize_path(filename);
-+	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
-+		lc->filename = strdup(filename);
-+	else
-+		lc->filename = canonicalize_path(filename);
- 	if (!lc->filename)
- 		return -errno;
- 
-@@ -1408,6 +1411,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
- 
- 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
- 		flags |= O_DIRECT;
-+	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
-+		flags |= O_NOFOLLOW;
- 
- 	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
- 		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
-diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
-index 444d69d6f..34351116c 100644
---- a/libmount/src/hook_loopdev.c
-+++ b/libmount/src/hook_loopdev.c
-@@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
- 	}
- 
- 	DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device"));
--	rc = loopcxt_init(&lc, 0);
-+	rc = loopcxt_init(&lc,
-+			mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);
- 	if (rc)
- 		goto done_no_deinit;
- 	if (mnt_opt_has_value(loopopt)) {
--- 
-2.43.0
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
deleted file mode 100644
index ff596ff9d6..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 855dbea3e6b3c7ed9ba11eff38f888cc4b7678c8 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 26 May 2025 15:24:16 +0800
-Subject: [PATCH] lsfd/mkfds-foreign-sockets: skip when lacking sock_diag
- ability
-
-The ENDPOINTS will need sock_diag ability. The kernel might not
-enable related configs. Check and skip in case of lacking such ability.
-
-Fixes: https://github.com/util-linux/util-linux/issues/3590
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3591]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tests/ts/lsfd/mkfds-foreign-sockets | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/ts/lsfd/mkfds-foreign-sockets b/tests/ts/lsfd/mkfds-foreign-sockets
-index cd94da7..76138a7 100755
---- a/tests/ts/lsfd/mkfds-foreign-sockets
-+++ b/tests/ts/lsfd/mkfds-foreign-sockets
-@@ -30,6 +30,8 @@ ts_skip_nonroot
- ts_skip_qemu_user
- ts_cd "$TS_OUTDIR"
- 
-+lsfd_check_sockdiag "unix"
-+
- declare -A tcase
- tcase[NAME]="state=connected"
- tcase[SOCK.NETNS]=
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-size-option-test.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-size-option-test.patch
index 4181f5b5ae..924c8c6827 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-size-option-test.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-size-option-test.patch
@@ -1,4 +1,4 @@
-From 1d38887185c0424a82bcf05efbd8585df1bba8cf Mon Sep 17 00:00:00 2001
+From 078231e4ecb5fa12107cd463f42e4c63ef3ff15c Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Mon, 5 Jan 2026 09:56:41 +0000
 Subject: [PATCH] tests: script: Disable size option test
@@ -24,20 +24,17 @@ Signed-off-by: Paul Barker <paul@pbarker.dev>
  1 file changed, 6 deletions(-)
 
 diff --git a/tests/ts/script/options b/tests/ts/script/options
-index 3cbd5c8ab463..4da51cd83c66 100755
+index f46cc34..537ea31 100755
 --- a/tests/ts/script/options
 +++ b/tests/ts/script/options
-@@ -57,10 +57,4 @@ $TS_HELPER_SCRIPT --return --append -c "exit 127" $TS_OUTPUT </dev/null >/dev/nu
- echo $? >> $TS_OUTPUT
+@@ -103,10 +103,4 @@ $TS_HELPER_SCRIPT -Bc -- echo dashdash-bundle </dev/null >/dev/null 2>&1
+ mv c "$TS_OUTPUT"
  ts_finalize_subtest
  
 -ts_init_subtest "size"
 -$TS_HELPER_SCRIPT --output-limit 9 --command "echo 1:1234567890" $TS_OUTPUT </dev/null >/dev/null 2>&1
--$TS_HELPER_SCRIPT -a -o 9 --command "echo 2:1234567890" $TS_OUTPUT </dev/null >/dev/null 2>&1
+-$TS_HELPER_SCRIPT -a --output-limit 9 --command "echo 2:1234567890" $TS_OUTPUT </dev/null >/dev/null 2>&1
 -echo $? >> $TS_OUTPUT
 -ts_finalize_subtest
 -
  ts_finalize
--- 
-2.43.0
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
deleted file mode 100644
index 72daf7f8e4..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 514ff160e37c0cca5eee79892a6b65516a92de34 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 15 May 2025 16:44:33 +0800
-Subject: [PATCH] tests/ts/kill/decode: avoid using shell built-in kill command
-
-This test case should do the same as other kill test cases, avoiding
-using shell built-in kill command.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/d2eeccf36542d506b660641a07a44f3976772897]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tests/ts/kill/decode | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 03bc25f..5714989 100755
---- a/tests/ts/kill/decode
-+++ b/tests/ts/kill/decode
-@@ -18,6 +18,11 @@ TS_DESC="decode functions"
- . "$TS_TOPDIR/functions.sh"
- ts_init "$*"
- 
-+# make sure we do not use shell built-in command
-+if [ "$TS_USE_SYSTEM_COMMANDS" == "yes" ]; then
-+	TS_CMD_KILL="$(which kill)"
-+fi
-+
- ts_skip_qemu_user
- 
- ts_check_test_command "$TS_CMD_KILL"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
deleted file mode 100644
index ecd8d18213..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 75c10a9edefc1597f708043e5561c2ff87305bf0 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 4 Jun 2025 16:27:19 +0800
-Subject: [PATCH] ts/kill/decode: use RTMIN from 'kill -L' instead of
- hardcoding 34
-
-glibc uses 34 as the value of SIGRTMIN:
-https://sourceware.org/git/?p=glibc.git;a=blob;f=signal/allocrtsig.c;h=8ed8e37dd6c41f94be6eef042ce9db1af1153228;hb=HEAD#l27 """
-static int current_rtmin = __SIGRTMIN + RESERVED_SIGRT; """
-
-musl uses 35 as the value of SIGRTMIN:
-https://git.musl-libc.org/cgit/musl/tree/src/signal/sigrtmin.c
-
-With the hardcoded 34, test case fails with the following difference:
-
--Ignored: HUP QUIT TRAP PIPE ALRM
-+Ignored: HUP QUIT TRAP PIPE ALRM 34
-
-Extract the value of RTMIN from 'kill -L' to avoid such hardcoding.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/c5d5e8873029d170fcab38a6fbd5d5a355574b9f]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tests/ts/kill/decode | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 5714989..524b4e5 100755
---- a/tests/ts/kill/decode
-+++ b/tests/ts/kill/decode
-@@ -53,14 +53,19 @@ ACK=
- 	    # Sending one more USR1 is for making the signal pending state.
- 	    "$TS_CMD_KILL" -USR1 "$PID"
- 	    "$TS_CMD_KILL" -d "$PID" | {
--		if [[ $("$TS_CMD_KILL" --list=34) == RT0 ]]; then
-+		SIGRTMIN=$("$TS_CMD_KILL" -L | grep -o '[0-9]\+ RTMIN' | cut -d " " -f 1)
-+		if [[ $("$TS_CMD_KILL" --list=$SIGRTMIN) == RT0 ]]; then
- 		    # See man signal(7).
- 		    #   The  Linux  kernel  supports a range of 33 different real-time signals,
- 		    #   numbered 32 to 64.  However, the glibc POSIX threads implementation in‐
- 		    #   ternally uses two (for NPTL) or three (for LinuxThreads) real-time sig‐
- 		    #   nals (see pthreads(7)), and adjusts the value of SIGRTMIN suitably  (to
- 		    #   34 or 35).
--		    sed -e s/' 32 33'// -e s/' 34'//
-+		    sed_cmd="sed"
-+		    for ((i=32; i<=SIGRTMIN; i++)); do
-+			sed_cmd+=" -e s/' $i'//"
-+		    done
-+		    eval $sed_cmd
- 		else
- 		    cat
- 		fi
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 19c113febf..44a8d768d2 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 1f55d079887f0ef7857819e9c8a1def8180c69d4 Mon Sep 17 00:00:00 2001
+From 4303ca5212f78fa276be750e077303f5090b7e33 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f664d12..8d9efaa 100644
+index e2061e7..f816656 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 31d00f7983..6d50cfd2c0 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From d521ca39a781873882b52ee52f46294596f41848 Mon Sep 17 00:00:00 2001
+From d91f680b43b0c70ee7c4f3b74996c342ca15129e Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index d32b11d..f664d12 100644
+index 13bed69..e2061e7 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 1c9e0ce4f2..1382e10c30 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 05b495cbe9ffa7b45d9a383610aa95e31f2ab1e3 Mon Sep 17 00:00:00 2001
+From 42cfda0aa633f3a6786be1e490202cc9fe89e4e5 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
@@ -10,7 +10,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 1d7a425..b1f0986 100644
+index f92520a..c32005c 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
 @@ -455,7 +455,7 @@ function ts_init_subtest {
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 1763c47da0..3c529f2ea5 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 4c0e374ba6c64d07da8acba5476cf8638c54820d Mon Sep 17 00:00:00 2001
+From 238020ed859acb41f1f43352afc28db14cecb34e Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 01e9970..c3313ff 100644
+index 02db406..e09d6df 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -66,6 +66,7 @@ sysusers_DATA =
+@@ -67,6 +67,7 @@ sysusers_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index 1410229172..aa855d701a 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -23,7 +23,10 @@ modprobe loop
 mount --make-shared /
 
 # lsfd/mkfds-bpf* have issues with the gcc 15 upgrade
-./tests/run.sh --use-system-commands --parsable --show-diff --exclude='lsfd/mkfds-bpf-map lsfd/mkfds-bpf-prog' | sed -u '{
+#
+# chrt/chrt-ext needs skipping due to linux-yocto not enabling SCHED_EXT:
+# https://github.com/util-linux/util-linux/issues/4429
+./tests/run.sh --use-system-commands --parsable --show-diff --exclude='chrt/chrt-ext lsfd/mkfds-bpf-map lsfd/mkfds-bpf-prog' | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.3.bb b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
similarity index 99%
rename from meta/recipes-core/util-linux/util-linux_2.41.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.42.2.bb
index f01cbaba9f..4943d5c7ab 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
@@ -424,7 +424,7 @@ do_install_ptest() {
 do_install_ptest:append:libc-musl() {
     for t in tests/ts/col/multibyte \
             tests/ts/lib/timeutils \
-            tests/ts/misc/enosys \
+            tests/ts/enosys \
             tests/ts/dmesg/limit; do
         rm -rf ${D}${PTEST_PATH}/$t
     done
-- 
2.47.3


