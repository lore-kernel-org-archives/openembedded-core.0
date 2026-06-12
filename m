Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B12CD98E3
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71817.1781274401087436875
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CtHNUq2C;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1342293f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274399; x=1781879199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jfd4ageqIPVzcycMCaK8VS5kE9alBzdWXoZWgDx9KAk=;
        b=CtHNUq2CfiOdT/TzGzlDhNy7ZL0F4Ft2rI+847ZM4ApdoOWmaJmUFmJikSwlgJ7Tit
         j48Bm51vwaI9yZT7zWfMeS79Nnmia4XgTchbCavl0zl5d2wzdzFlnGCS6OL6cTzsvbaJ
         k3ZoYvBz3y4XjwtKVLzMakMfmofJ4rKqB8ut4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274399; x=1781879199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jfd4ageqIPVzcycMCaK8VS5kE9alBzdWXoZWgDx9KAk=;
        b=jy2hZLSMInpcbQR6djLTlbUnqGOGkxyOX9Dv9JogHU1Kb4IiJpaTB2cP88VEmjFtDL
         Z1xdMSTS+ZQ3WFusRYNFrpMs9UiJbOygyTqMSPfS5OldSN9LuVaKD+Q/UkXtPKxnoqCs
         HzqQDAnPQoadrrJN9PMK2nmuam69QZ+HAap9LnCDNFOjIoJ0qR2/GoOOyXKm71Ad2lYu
         OJiarUdtxT3Y6of/j/7LMZsET9uDCAvy7iJAkm8N9ZsiPsrAuNpQsNnt+6UZulqbkx85
         oJh3SI+f9H6cWpDHuw3CpOSuvM/aVyXTilcifWGHg71x5WjTu2s8fdhbd72V0dBBQNxL
         g1WQ==
X-Gm-Message-State: AOJu0Yx2RsxhtE5qbs8+D3qX6Bvo9E8M0KwEtAZAsLcRBKR29au6K8Ux
	8Of2Q6fdchQ9elSdzHd820K8/gt0IYIigp6Wgw6afB4qMCny7ua3fEJFFS7Pg5FG5j4OMv3jw68
	XWT7ROw==
X-Gm-Gg: Acq92OF8d2zd+SMN5i4rEF1gziF71wJnF2X8TPK4h7FfjvcIwnHtNKzyrQttca18rMT
	4hx4PO6DC/BkAbimbXkQtgbr+OekXJbRIPzFHbNG+nhpkMg51iOQtW72PHa0XyPNuiVXGwaGu4g
	uKvGarVmhpLeYi00Rnrc6habc+z+Aev5XvkwgZtszD6jKT/C4p770SVB3F1cW1sesOGte82okK4
	GuIGtuKBCbwkEPfi08NA4qNDxM4MdMZwGAUPGYwVKuO1YLpq/lceRZCt30MP/VQpcJouxREx4vo
	FIYLuHNimMP2ot3W+hiAftNaQdzdZe8N2aXf+mNyG1uXSdWgfTyFDWmscJq/H/D7cowMeLaGw6w
	v+cA7OYTUjdorX8MMW1sT87OySA7aYMGUlGm4KQP+ZS6Yo4gvqhXF7m7O1zuNuW+qWZrx0b74bI
	QfYd3SeIlbLc8xeYkf+i8oFD4=
X-Received: by 2002:a05:6000:4709:b0:460:602f:85ac with SMTP id ffacd0b85a97d-4606cae532fmr4203713f8f.0.1781274399289;
        Fri, 12 Jun 2026 07:26:39 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:38 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 05/21] util-linux: Fix CVE-2026-27456
Date: Fri, 12 Jun 2026 16:25:55 +0200
Message-ID: <8a9fefa317baff6022334e46ab4ee87676c07699.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238627

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as 2.39.x upstream backport of [2] mentioned in Debian report in [3].

[1] https://github.com/util-linux/util-linux/commit/79164668a412b71fcb1495c7d299cc5e9741fa30
[2] https://github.com/util-linux/util-linux/commit/0ba0f14caa812349424df0da00ac2d97fee9d972
[3] https://security-tracker.debian.org/tracker/CVE-2026-27456

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-27456.patch           | 115 ++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4797682c5d..8380419634 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -46,6 +46,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://sys-utils-hwclock-rtc-fix-pointer-usage.patch \
            file://CVE-2025-14104-01.patch \
            file://CVE-2025-14104-02.patch \
+           file://CVE-2026-27456.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch
new file mode 100644
index 0000000000..4a5fef26d3
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-27456.patch
@@ -0,0 +1,115 @@
+From af0b619f8eb15f738c69e33e0bb3a794e9cccf17 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 19 Feb 2026 13:59:46 +0100
+Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
+
+Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
+prevents symlink following in both path canonicalization and file open.
+
+When set:
+- loopcxt_set_backing_file() uses strdup() instead of
+  ul_canonicalize_path() (which calls realpath() and follows symlinks)
+- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
+
+The flag is set for non-root (restricted) mount operations in
+libmount's loop device hook. This prevents a TOCTOU race condition
+where an attacker could replace the backing file (specified in
+/etc/fstab) with a symlink to an arbitrary root-owned file between
+path resolution and open().
+
+Vulnerable Code Flow:
+
+  mount /mnt/point (non-root, SUID)
+    mount.c: sanitize_paths() on user args (mountpoint only)
+    mnt_context_mount()
+      mnt_context_prepare_mount()
+        mnt_context_apply_fstab()           <-- source path from fstab
+        hooks run at MNT_STAGE_PREP_SOURCE
+          hook_loopdev.c: setup_loopdev()
+            backing_file = fstab source path ("/home/user/disk.img")
+            loopcxt_set_backing_file()       <-- calls realpath() as ROOT
+              ul_canonicalize_path()         <-- follows symlinks!
+            loopcxt_setup_device()
+              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
+
+Two vulnerabilities in the path:
+
+1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
+   realpath() -- this follows symlinks as euid=0. If the attacker swaps
+   the file to a symlink before this call, lc->filename becomes the
+   resolved target path (e.g., /root/secret.img).
+
+2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
+   if canonicalization happened correctly, the file can be swapped to a
+   symlink between canonicalize and open.
+
+CVE: CVE-2026-27456
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/79164668a412b71fcb1495c7d299cc5e9741fa30]
+
+Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vfq4-9h9g
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
+(cherry picked from commit 79164668a412b71fcb1495c7d299cc5e9741fa30)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ include/loopdev.h           | 3 ++-
+ lib/loopdev.c               | 7 ++++++-
+ libmount/src/hook_loopdev.c | 3 ++-
+ 3 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/include/loopdev.h b/include/loopdev.h
+index 903adc491..d03e9b65e 100644
+--- a/include/loopdev.h
++++ b/include/loopdev.h
+@@ -139,7 +139,8 @@ enum {
+ 	LOOPDEV_FL_NOIOCTL	= (1 << 6),
+ 	LOOPDEV_FL_DEVSUBDIR	= (1 << 7),
+ 	LOOPDEV_FL_CONTROL	= (1 << 8),	/* system with /dev/loop-control */
+-	LOOPDEV_FL_SIZELIMIT	= (1 << 9)
++	LOOPDEV_FL_SIZELIMIT	= (1 << 9),
++	LOOPDEV_FL_NOFOLLOW	= (1 << 10)	/* O_NOFOLLOW, don't follow symlinks */
+ };
+ 
+ /*
+diff --git a/lib/loopdev.c b/lib/loopdev.c
+index dd9ead3ee..4da251812 100644
+--- a/lib/loopdev.c
++++ b/lib/loopdev.c
+@@ -1193,7 +1193,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
+ 	if (!lc)
+ 		return -EINVAL;
+ 
+-	lc->filename = canonicalize_path(filename);
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		lc->filename = strdup(filename);
++	else
++		lc->filename = canonicalize_path(filename);
+ 	if (!lc->filename)
+ 		return -errno;
+ 
+@@ -1332,6 +1335,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
+ 
+ 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
+ 		flags |= O_DIRECT;
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		flags |= O_NOFOLLOW;
+ 
+ 	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
+ 		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
+diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
+index 8c8f7f218..ce39a7a70 100644
+--- a/libmount/src/hook_loopdev.c
++++ b/libmount/src/hook_loopdev.c
+@@ -276,7 +276,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
+ 	}
+ 
+ 	DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device"));
+-	rc = loopcxt_init(&lc, 0);
++	rc = loopcxt_init(&lc,
++			mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);
+ 	if (rc)
+ 		goto done_no_deinit;
+ 	if (mnt_opt_has_value(loopopt)) {
+-- 
+2.43.0
+
-- 
2.53.0


