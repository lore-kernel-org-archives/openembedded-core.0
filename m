Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B21C4450E
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1954.1783701432105959952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y5W05Gi2;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493e497643fso7168185e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701430; x=1784306230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rjb71hM8t83ahj6hK3oRTkhtztznAj2oOC+XdB7lx90=;
        b=Y5W05Gi2IUOXjrFtGakxWzCsRbsZS+qdB8oMKzYo9rw4t4hxaKw7RgGx6oBfUyzVZS
         mHb+bMMXLtPJmq59ec/jOA0hqHOKNjeiRGOztwx1VaLx4peq4HJdFaLJ+3wI/0DlbDq+
         1AWCWYlRGgLMvwEBW+5+Aop1U1VnVmmSTQeBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701430; x=1784306230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rjb71hM8t83ahj6hK3oRTkhtztznAj2oOC+XdB7lx90=;
        b=g//DrOfjRkjZx0AP/cDzpr+E64YosBVC5X6iROB4+capzCNkQIRq/61zjlJits7RBr
         vdHHPM/FkV17mNzx4kqpYs/itB5NGyrfiQG4xc+awDpT9dIBpNd5XPTZ8+iYxjZFde1B
         z2fA+MeaX6HSiGgQH8VvRyHkXhhQJdDT0WXjVUEU5VuSgO1kdGWtFT5ko0zDjo9abWVI
         E0zwMPO7UrbYsNRsE+4wp69W2G1kmVQCbrexEPoWbywEIf82qqHLPFhx+rUGPjlE60q8
         r0eUBRbxmbt26RIB8MH+2wHmb+xRMs1aw/X0o1iTRS/eaSbsLyW4BuUy1MZpiZusXcP7
         nbCA==
X-Gm-Message-State: AOJu0YwiFUsdo/gDtWyrveB1E/A2uY9TdS2VBLTMdeZ7PoBuTi8ECDvP
	wb9JngXluKBY0TJgw6JUMhKnhcREbn/04hhxVIGJlolNvqPqMWq1lziDNuyVVDIL+361rK2M09d
	nVeVUryw=
X-Gm-Gg: AfdE7cn09RRvIOBBKTb1/iRsn5OHM5zHaWEaCTgrp6HphIXR60O7+sP849hnKgrxNjT
	uk7sIGYkz5Vfh/vxlwQGRWsiNBw/T0LCYHT8TAoPNhqx6ELl/oWL2TvEYXEboxkTWcZhFAbBlvo
	+0/4/+qrrRJJVatdFSyzf7c0sCyH8L/+HXzv089EGB8AaIsGBcKoWOZtzGbwD+IaB/SXGPG3Bny
	JtGk9PGDhCB7CAZvu+n7X+5zpdfTFQGFTzl/DemZOHQEqfPWusfleLXFKvmYvD/3TazhX0GTjyq
	jugkNQP6fd6LFWYJ3DgEFV97m9+Wy7l0pw1iSfb84KxV/LfNtBm5VNq7b+Nls3+X17+ejnw2I4k
	JumVzK1OUwy7VKITsXQMp9YAYvdAwGUqe5QAi52d3ynb9Zy5FUk7O6k13onXHcu8QZRDVQONfLD
	2bMOiwpWMH03+D+Cs5tAFlC65fYY8MPwlAFcelVvToyzfeWPJVdKsptk2ppX0++9KuKM60Otx0R
	3BrQi7j983L2FhSN/A=
X-Received: by 2002:a05:600c:1d1e:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493e68bf03amr127273865e9.23.1783701430211;
        Fri, 10 Jul 2026 09:37:10 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/18] util-linux: upgrade 2.41.3 -> 2.41.5
Date: Fri, 10 Jul 2026 18:36:27 +0200
Message-ID: <743ed34569e6c0db29b91a4e6035ace4a39bb55a.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240673

From: Siva Balasubramanian <sivakumar.bs@gmail.com>

2.41.4 and 2.41.5 are point releases in the same 2.41 stable series and
contain only bug fixes and security fixes (no new features, no API/ABI
breaks), so the upgrade complies with the stable branch policy.

Among the fixes pulled in:
 - Several mount(8) TOCTOU / symlink hardening fixes (incl. CVE-2026-27456)
 - libblkid integer overflow in parse_dos_extended() and a use-after-free
   in partition probing
 - pam_lastlog2: fix libpam linking in the autotools build so
   pam_lastlog2.so links against libpam (fixes the runtime "undefined
   symbol: pam_syslog" / dlopen failure) [YOCTO #16320]

Drop two backports that are now part of the release:
 - 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
   (upstream f55f9906, released in 2.41.4)
 - the pam_lastlog2 libpam linking backport (upstream 5683ed6320e0,
   cherry-picked to the 2.41 stable branch as c8d0af0421f6, released in
   2.41.5)

Full changes: https://github.com/util-linux/util-linux/compare/v2.41.3...v2.41.5

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...2.41.3.bb => util-linux-libuuid_2.41.5.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   3 +-
 ...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch | 114 ------------------
 ...l-linux_2.41.3.bb => util-linux_2.41.5.bb} |   0
 4 files changed, 1 insertion(+), 116 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.3.bb => util-linux-libuuid_2.41.5.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.3.bb => util-linux_2.41.5.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.5.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.5.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 02358626669..aec8721ca32 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,9 +20,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
-           file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch \
            "
 
-SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
+SRC_URI[sha256sum] = "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch b/meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
deleted file mode 100644
index 0951c9f5fbe..00000000000
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
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.3.bb b/meta/recipes-core/util-linux/util-linux_2.41.5.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.5.bb

