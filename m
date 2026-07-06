Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF96C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:55:38 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149351.1783338932947512465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RILXuxDB;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1532885a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 04:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783338932; x=1783943732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eaa8wIVV8wndeD/pb8lJNCFzntKgtGHtP2lioA+9evs=;
        b=RILXuxDBe+JdWR+sNdJvvx+iui8tYFClo5jSIzxaawaUz2phOeEINs/eesv7Mu/Z1T
         HxyP73yNEB9L0XgbxIxWRyQlTTG3y2DuYbtI64S+XQjPGuMax4rAzI+72/VZPVY7NPct
         dpkanskLBZjaAuz284FNI+uY5RHsKXY8TGlwLXd/vO+Pi3Z1AvQwIkKi/NtOlDlb9zZi
         b5yUZJEYaK5T/uDDMA3R/5tH+5xiPdSSmNq1iTeaG1jqbVn+kMs+ajWHilKsfejUItLA
         QJb6Y9BIfp2zqGrFB9WJ5vnfJc5ml1gCznqYs7yBLB9w+1yuEIrSy+UF31Zlh/TrTKhf
         vo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783338932; x=1783943732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eaa8wIVV8wndeD/pb8lJNCFzntKgtGHtP2lioA+9evs=;
        b=hd/9WgqDm+i4O7pDcK+LQKg8dz312nt/h8vFQRCAOHt90vOsSbc1RrM1+MPATwKNzl
         tNobTPfAEgrB+ocOwScrUeEKuOqqwjkwYVkRjZ508WYl4L46b6CpUvrOATlgihpiFDG7
         tYWN6Xrvmd/6RfKxO9K5dVy8tUIweZcyh0EZRNcMlpuQjmWhplA+wQLduWaN0XSWcotY
         6hdA+tkYc4NHNSXt8PL8PsETDrTgLv/n4UIxtR31Yw183LHSQ5fxEyVA593iIzoxgZIv
         3w9kQb/vN+zOFB8a8sKDHhqAQ22LuKWDsDvAl9I18ot49jye9Xz7O78qCpPS05cvLKDD
         IUyw==
X-Gm-Message-State: AOJu0Yw80AwLlKhSaglsI8SD5CMqRt/VeOX6mkM5Wx7zQHycjPaAMWQV
	jqMcVOYX4uK0sfgk36hbhZKhdAH60xTRcLbTeHOphH6X9Lru8lTRsDoM6KpRdThjwv4=
X-Gm-Gg: AfdE7cmz3CmVTMISw4y+zt+Tn+W3l+KLABZF09Z6ix/MrJZr+skpMoHEF5UHFU9PT6u
	eynHOtG6nkHmoCWCkqBqrtf9BNIsJAoh0uKffUIgKFrZzFEPqIEHncCMVD2rDQ2v8gQLZ+GsMt8
	kHxu4VLD6vd7lTTZpSAhUJVeXKqxsqy2oYAUeukTrmPGYTs/wLc40lc6YO/WmpvnGjjo0lIxzhG
	bia0+yfjZepO43lVl76GZU3c78d5aWmNlSL91R10LU0CzZb0vY2WSAq0U2hXsdIjszq6rSNUi9r
	osZWoyun4p5LbDT6pU9OgEYsxYYRrIs3iVPLeGtIIlpMdqODpKACRKfst71fkAZSsi6V+nqjEUW
	m1oKYIX0G7LP17S8RQ/sim7+/XH86TSxAe3rbThRCwJ3NuUbuD9RHCMflDIMseylQa3+UfJmSSZ
	E6Ma33xjbiaOCNneB6ATxFtyOFDzRf1CIGwxa0PFGDYBgXy0W7jBG1dr9SwSk=
X-Received: by 2002:a05:6a20:7286:b0:3bf:79d6:f063 with SMTP id adf61e73a8af0-3c08eed6a1emr238882637.43.1783338932103;
        Mon, 06 Jul 2026 04:55:32 -0700 (PDT)
Received: from naduvan.timesys.com ([136.185.139.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm53153631c88.14.2026.07.06.04.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:55:31 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Chen Qi <Qi.Chen@windriver.com>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [OE-core][wrynose][PATCH] util-linux: upgrade 2.41.3 -> 2.41.5
Date: Mon,  6 Jul 2026 17:25:16 +0530
Message-Id: <20260706115516.19878-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240260

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


