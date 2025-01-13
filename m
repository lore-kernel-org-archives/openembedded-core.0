Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01BAC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 23:32:29 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.32686.1736811139563179283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 15:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bZuzsaGR;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: hiagofranco@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3eb98b3b63dso1222462b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 15:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736811138; x=1737415938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUgCphra+zLuHlVtXyU1tbBkK2jqBjkFR8uMaONLAI8=;
        b=bZuzsaGReDaQzMhcezMjau6TRGFcqTQvJZrQZVuk9c+ulEJHaRefqT5Ajc5Aaoq800
         xFdh/caTwvrREFrf4I79OL9jOynjb5UqEkM+CoOmMbNNSl9X36EyqTBzNykvugfEW8TJ
         gGtSttTumZ0GZw8PajwcvmjclhF3SF6/iKy+K9x9/WPLr2+DtB4xhNFvNh8PmN1njOaV
         akgBRsZBQgM45JMGY3LmBnTlZAL2ZUZLp82O2Z8kGFhUmSFX+6FPNd8Igp2XXf8dkIGN
         +7XTbv6zvOcuPM/uu1AN23gcRDX84MKU24xHPW72PAHT6T8kupMRUKHQ3f+iD1GIkPee
         NqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736811138; x=1737415938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUgCphra+zLuHlVtXyU1tbBkK2jqBjkFR8uMaONLAI8=;
        b=YWyLDeYzc/bhDNY5KmVuAm4YUxD7auwhmrTEyR74VZ3UucSUt2z++U0ZZqmoTNzCeB
         cHZRs4PbbHwcaDSViTJNmYLTlhkhE/YnI+UtqPBnAnzJ955hcN8x6i+LXkkn8RbjTZ5d
         oWuu5FYXiTB29Nvj1jY0JWyv4xUFE38je9z1zrt5kez1CdWmL7YAeT/kZzH6eiC+PNw9
         FtkLkMVZm9OvmtfWMSdgkJnR9YLlbMdAfXxbycFyMhKZgwQqR6nXxgkHre16DKdIUvHu
         uCCTwmoX7mOZT+fkC/aE+6GdKi+VsmpGsbssNz5WTFDHHCZhpILLrF/zbbCoujAJqfG0
         k0cQ==
X-Gm-Message-State: AOJu0Yx7hSLw+6maZHLGEZOjSz5S8TqjH+NF3HWQE+wEDLR5YR1LaBDD
	U+6rQgCc4Y1UMstJpYbtjJY2vKobIQdim04WAn5xj62MVLghrLmqG8XDHA==
X-Gm-Gg: ASbGnctAuArj0a0TaMBoOPoEO2KXXlwdJlpUZAP2QdQA+/gNdgOF45v1jWcn0mPlk6K
	oW9mM+VOMCIydMvRA2TDt6XYTT8Demut8otcq0ty359qjp0HiLiroWygfDqcV/BeoaVm16t6iJY
	nMxlLTTKhNAxUPFz0dLx9ltdIm/PxGKpZDOxvZbE9fSmyLJjEgTT4AUJKW05DcRvYpf7A79vrRI
	N2adx1EoC4MNg3T1ErDWhiAKUdXC7sqI+DGjL8KmPHNZuDGEqrrVJZ4ZXvYjkB/xULoamAcIQ==
X-Google-Smtp-Source: AGHT+IEQoqRbpieUVv+11Tdn3ZtVFax0dddlHFd/q8wdXu5Ii6FZDNtF51OiK8vxQ9JuNr+XknAPwA==
X-Received: by 2002:a05:6808:1301:b0:3ea:5880:fe1f with SMTP id 5614622812f47-3ef2ebd4035mr12807244b6e.5.1736811138274;
        Mon, 13 Jan 2025 15:32:18 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c0:f217:8a6e:d86d:fdd8:a559])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f0379eff5dsm3613689b6e.35.2025.01.13.15.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:32:17 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] eudev: backport patch to fix udevd hanging while trying to access /dev/urandom
Date: Mon, 13 Jan 2025 20:31:40 -0300
Message-Id: <20250113233140.40499-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 23:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209767

From: Hiago De Franco <hiago.franco@toradex.com>

Linux kernel commit 48bff1053c17 ("random: opportunistically initialize
on /dev/urandom reads") introduced a change where /dev/urandom blocks if
the random pool is insufficiently initialized during hardware boot. This
behavior causes /dev/urandom reads to hang for approximately 5 seconds,
delaying the boot process with eudev init script (when it calls udevd).

This issue has already been solved upstream, therefore backport the
upstream patch to fix this.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 ...nc-dev_urandom-implementation-to-sys.patch | 138 ++++++++++++++++++
 meta/recipes-core/udev/eudev_3.2.14.bb        |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch

diff --git a/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch b/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch
new file mode 100644
index 000000000000..668aa731aca1
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch
@@ -0,0 +1,138 @@
+From 95c871b7b912f39539777ac222ef7f8798bb0225 Mon Sep 17 00:00:00 2001
+From: Masahisa Kojima <kojima.masahisa@socionext.com>
+Date: Thu, 25 Apr 2024 17:23:10 +0900
+Subject: [PATCH] random-util.c: sync dev_urandom implementation to
+ systemd-udev
+
+Current dev_urandom() assumes that reading /dev/urandom
+will never block regardless if the random pool is fully
+initialized or not.
+This assumption is no longer applicable since linux kerrnel
+enforces the /dev/urandom entropy initialization from
+v5.18-rc2 with the commit:
+48bff1053c17 ("random: opportunistically initialize on /dev/urandom reads").
+
+With this, when we use the linux v5.18-rc2 or later,
+dev_urandom() will block if enough random pool is not supplied.
+It causes the boot delay, typically 1024msec(4msec * 256 = 1024msec)
+delay to fill the 256 bits entropy for the case CONFIG_HZ=250.
+
+To prevent this boot delay, this commit syncs dev_urandom()
+implementation to the systemd-udev.
+The systemd-udev implementation of reading /dev/urandom is as follows.
+ - Try to get random with calling getrandom(GRND_INSECURE)
+ - If kernel does not support GRND_INSECURE, fallback to GRND_NONBLOCK
+ - If enough entropy is not supplied, fallback to reading /dev/urandom,
+   this will block when the kernel version is v5.18-rc2 or later
+
+With this modification, dev_urandom() tries not to block
+as much as possible.
+
+This modification still keeps the backword compatibility,
+dev_random() will never block if the commit(48bff1053c17) is not
+applied to the linux kernel, the behavior is same as before
+in this case.
+
+Upstream-Status: Backport [a49a3aaa460add6ae7ea208b4cac630e56fe1180]
+Signed-off-by: Masahisa Kojima <kojima.masahisa@socionext.com>
+---
+ src/shared/missing.h     |  4 +++
+ src/shared/random-util.c | 70 ++++++++++++++++++----------------------
+ 2 files changed, 35 insertions(+), 39 deletions(-)
+
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index 1967840cdbf3..1caec0f9207c 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -79,6 +79,10 @@ static inline int getrandom(void *buffer, size_t count, unsigned flags) {
+ #define GRND_RANDOM 0x0002
+ #endif
+ 
++#ifndef GRND_INSECURE
++#define GRND_INSECURE 0x0004
++#endif
++
+ #ifndef BTRFS_IOCTL_MAGIC
+ #define BTRFS_IOCTL_MAGIC 0x94
+ #endif
+diff --git a/src/shared/random-util.c b/src/shared/random-util.c
+index 01a28c8ef4e9..852b00e4ce2b 100644
+--- a/src/shared/random-util.c
++++ b/src/shared/random-util.c
+@@ -31,45 +31,37 @@
+ #include "util.h"
+ 
+ int dev_urandom(void *p, size_t n) {
+-        static int have_syscall = -1;
+-
+-        _cleanup_close_ int fd = -1;
+-        int r;
+-
+-        /* Gathers some randomness from the kernel. This call will
+-         * never block, and will always return some data from the
+-         * kernel, regardless if the random pool is fully initialized
+-         * or not. It thus makes no guarantee for the quality of the
+-         * returned entropy, but is good enough for or usual usecases
+-         * of seeding the hash functions for hashtable */
+-
+-        /* Use the getrandom() syscall unless we know we don't have
+-         * it, or when the requested size is too large for it. */
+-        if (have_syscall != 0 || (size_t) (int) n != n) {
+-                r = getrandom(p, n, GRND_NONBLOCK);
+-                if (r == (int) n) {
+-                        have_syscall = true;
+-                        return 0;
+-                }
+-
+-                if (r < 0) {
+-                        if (errno == ENOSYS)
+-                                /* we lack the syscall, continue with
+-                                 * reading from /dev/urandom */
+-                                have_syscall = false;
+-                        else if (errno == EAGAIN)
+-                                /* not enough entropy for now. Let's
+-                                 * remember to use the syscall the
+-                                 * next time, again, but also read
+-                                 * from /dev/urandom for now, which
+-                                 * doesn't care about the current
+-                                 * amount of entropy.  */
+-                                have_syscall = true;
+-                        else
+-                                return -errno;
+-                } else
+-                        /* too short read? */
+-                        return -ENODATA;
++        static bool have_getrandom = true, have_grndinsecure = true;
++        _cleanup_close_ int fd = -EBADF;
++
++        if (n == 0)
++                return 0;
++
++        for (;;) {
++                ssize_t l;
++
++                if (!have_getrandom)
++                        break;
++
++                l = getrandom(p, n, have_grndinsecure ? GRND_INSECURE : GRND_NONBLOCK);
++                if (l > 0) {
++                        if ((size_t) l == n)
++                                return 0; /* Done reading, success. */
++                        p = (uint8_t *) p + l;
++                        n -= l;
++                        continue; /* Interrupted by a signal; keep going. */
++                } else if (l == 0)
++                        break; /* Weird, so fallback to /dev/urandom. */
++                else if (errno == ENOSYS) {
++                        have_getrandom = false;
++                        break; /* No syscall, so fallback to /dev/urandom. */
++                } else if (errno == EINVAL && have_grndinsecure) {
++                        have_grndinsecure = false;
++                        continue; /* No GRND_INSECURE; fallback to GRND_NONBLOCK. */
++                } else if (errno == EAGAIN && !have_grndinsecure)
++                        break; /* Will block, but no GRND_INSECURE, so fallback to /dev/urandom. */
++
++                break; /* Unexpected, so just give up and fallback to /dev/urandom. */
+         }
+ 
+         fd = open("/dev/urandom", O_RDONLY|O_CLOEXEC|O_NOCTTY);
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index 0e5610f77c2d..b3e7d092c58d 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://netifnames.patch \
            file://init \
            file://local.rules \
+           file://0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch \
            "
 
 SRC_URI[sha256sum] = "8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc1927f006f"
-- 
2.39.5


