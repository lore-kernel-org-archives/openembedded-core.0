Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867BCC44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 06:22:58 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17895.1784787770539046998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 23:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HsTLp6iA;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caf228a910so2660505ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 23:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784787770; x=1785392570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZ6FRfZ0LqrgtLh0DauXGhtylsW1rCi2PmUAmApri0A=;
        b=HsTLp6iAnQ83vd/bD052L+QlRrh6c5ROJ+znu8IXlFoygTt+Vnr3tdrZfRvblqqjLc
         qIjv+DHhKKm/noo/4cq2b1Td/Dt41saymPfN8jtnAD4OspxqrNEWvpf+1F6k7nRT9cRv
         OfFyn2jgZnzaHZ2k1idZtMVxpcKWvW3k0iq459zV7CJ6K9e9hLHbpEmUCUu2QU5i+1x+
         ApgiyQHA8Y34uJ1y1HbgNrtovq8sWxX+BNG/w2zNtTvpXRuW8T6Z3RPNdjd2HsUtzXr5
         38kIw4uB7aOEGWdMUcMFnCiCx8efd0sNlo8ryvyJUnTfs1wmA7bmHVMoPdWRIx1HJpd+
         440w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784787770; x=1785392570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZ6FRfZ0LqrgtLh0DauXGhtylsW1rCi2PmUAmApri0A=;
        b=KpdkJ/QoXp6qVc/62igNzU/D9cafN2KtnfdZcZHH3CyxjvQbfnACwBn3TxFkRNv6uz
         zr7dw67GDu1n5vhYReOO71EW/9gcosQJZ5hZtDQvd87IFeobqvHDUu/UX18YeofLRoIT
         klOrUIkQId2EejnM0L/qeFs5VhDB8Tsfh3R23fWPUneR1A3ImDSlf7coShhwTZetNs34
         U8qFMr4Nvhjo521EZ9AM5tuzlPCMc3PFVFCzZTiFjSizFgx/cFfSs65DqAXCN7CpsdvC
         9Zx1pe4NwGCkozhZvehrMmFjoNqZed/Oh+SQH0fD+53vCUenK85V/lcVYQvU++yi4z4d
         co8w==
X-Gm-Message-State: AOJu0Ywk3AFC46SzgzW1DevBDXISF4vG7SiB6GO6/V7b5qaqJCp6YT5Z
	8noTfdV70zlih8b5qi9acoHlNDi33WUreVuUap0njbBAxqtviuaJB2gGwMe4/g==
X-Gm-Gg: AR+sD11oGU88rWtLA3wrHBfylrHedKfFRe9x33uYrG1qGFFAoS5klgErwUncqizri00
	6VDjaF83sZcTb6ogfJ/0Xh2SwTpf/0PKxGTYFaZuz2U364BkFAucPYdja57TKo+qt9oQ8mJSAX3
	C8BjIZb0FCoDe9acoXkFCdyb2RdKeJ5B2dMJBjO3HVEt6C7yBbYibTxNyZ+SYH0HlA23OtQ6hMO
	vvGe8gmr5TpzaJQTg6XBSXiaDfq5bjRmglPL+s5bhNMKtIyeimof9mx520r6B6HrjCCkwrANIDs
	zU7AWADZujvLDAlSYCLLic1ElWa5QxApkPcUCZ8Qj5uUtwuBtjliJLYu4KmqHVo5bi639Fxvw4J
	r5O0i2ymyLSJ4plSCuSXzBXBl6vDHThotgS+CBWZXFpADLzUzPnXLbpZuPrUaTxXCZRsyGP5VpC
	CKH1HOtc5Xeun/2g2EQ/polKFJ4hIMG5XiRdd3akTPoD2yFg==
X-Received: by 2002:a17:903:b90:b0:2cc:f7c6:834e with SMTP id d9443c01a7336-2cfa6c86a5dmr22921865ad.32.1784787769825;
        Wed, 22 Jul 2026 23:22:49 -0700 (PDT)
Received: from naduvan.timesys.com ([122.178.22.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm15842158eec.7.2026.07.22.23.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:22:48 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Yoann Congal <yoann.congal@smile.fr>,
	Chen Qi <Qi.Chen@windriver.com>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [OE-core][wrynose][PATCH v2] util-linux: upgrade 2.41.3 -> 2.41.5
Date: Thu, 23 Jul 2026 11:52:40 +0530
Message-Id: <20260723062240.2516398-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706115516.19878-1-sivakumar.bs@gmail.com>
References: <20260706115516.19878-1-sivakumar.bs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241775

2.41.4 and 2.41.5 are point releases in the same 2.41 stable series and
contain only bug fixes and security fixes (no new features, no API/ABI
breaks), so the upgrade complies with the stable branch policy.

Among the fixes pulled in:
 - Several mount(8) TOCTOU / symlink hardening fixes (incl. CVE-2026-27456)
 - libblkid integer overflow in parse_dos_extended() and a use-after-free
   in partition probing
 - pam_lastlog2: fix libpam linking in the autotools build so
   pam_lastlog2.so links against libpam, fixing the runtime "undefined
   symbol: pam_syslog" / dlopen failure [YOCTO #16320]

Drop the loopdev symlink-attack backport that is now part of the release:
 - 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
   (upstream f55f9906, released in 2.41.4)

Full changes: https://github.com/util-linux/util-linux/compare/v2.41.3...v2.41.5

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
v2: Correct the commit message. wrynose only carried the loopdev backport,
    not a pam_lastlog2 backport, so only one backport is dropped. The
    pam_lastlog2 libpam linking fix comes in natively with 2.41.5. (Paul
    Barker)

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
index 0235862666..aec8721ca3 100644
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
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.3.bb b/meta/recipes-core/util-linux/util-linux_2.41.5.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.5.bb
-- 
2.34.1


