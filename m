Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB4FF88085
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7583.1776322115041611211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SwAN6eLE;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d75312379so180480f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322113; x=1776926913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTSTwpC5bDG19T7VWxJSvKNmzJSczFr0PvMMp4dsYB4=;
        b=SwAN6eLEWGGeMmSR2fDRpwlMo9smWYorE5LVsOlAC8HhRabqYXmDh+f+cY/Ud2ApPU
         A8PS0WzxdoR9rJz/fdWrhn4Jl8vi1v2/2h/iaNdcrEnyTtA57iZ1jfPCjixO9+fapsyh
         hMqQUaDLJ8MAhQ7fCHW+NbnAsLb5CamuFXSQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322113; x=1776926913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTSTwpC5bDG19T7VWxJSvKNmzJSczFr0PvMMp4dsYB4=;
        b=c7AXrLGCd8uwORB0reXJb09HYZjjkuZl/gcfzW0GpYFpPyO+HfnhB75KBAkNuveamZ
         vLRhnDn/bfgDj13vmve2HNDbKGgx8oX0xQcAJSsM6HEra353HBbt5MFai1iguElQe8/C
         EhRGDwGjtIgttCtvWj7esMpYY12qmPG6qduHk1hvSRWOrlTL33ytCq22SS23340R+JwB
         YNVYgD7FLcLvIZ0onJNcWOK6AgSYAlUv6ttO6rKWk9SpNk1CWet/ig5+lD/nAJIiu5N0
         x2IJVU8HI8jlUbDsiMahM1IizQ63pPrntt56qSEs6qwXNVGgOYMqk1tNk3+7Tnh4BzCc
         dVHw==
X-Gm-Message-State: AOJu0Yymx30e43YY0Yv4pih9WAKlc3ZwKLOe5r7h7GBg9Vn0fci/XN8M
	NJ9tGCzxoD6RU0q+0/Ck/20bcmyNGfy6y+AZRwe9gVzmNP9hbjPLKOLeh0JEKSetVoIzhwf2ed8
	udyN1/uQwv0TC
X-Gm-Gg: AeBDievrKCGV+ODh4mHnDL4CuKA+mO4b2bcBqrfxypS/sXx4bO+Dl+KUK2gTTYtec2U
	9qjyFbXGjDmgEQVYVXEjasOvRLuCLRiNJI4yVto7cJ8TCTY5d51T01lDL7ukisyCmv9c7MXQc7D
	JZxurYB5QzPbfm4kONTymApnWfKaSh7n64q68BpDDMH2MY/2VBZL6fe2OqaawEr6XNKPfumr0fA
	1KoEPixPo8d6O+Wgeg0MVEqouA3suVR7/UE/6kRpKzoKrfTiW94w0kWV3okKHrd+I5D8bNBWnG5
	CGoMAGEDI5B/uw0S8hP3q27Ia464ronDPquc4iwB67lEWok2jR+8xZkW66SC9zjn4bFGTpFPzmZ
	rTBYRYxpinz9kxj0mi89Y0sh4d3/4qNfOqIoq7M4YCp/icaR1nrZ/0qrW6EeoYY+lewWpyC/hii
	h+H7LyDZxc4XNweyidpqGjQPaRegXNU4anLmQL962wxetRreliowq8Yo3LriHg8ioR/u6uJfade
	QKAYzyOlbrasOuK3/rg2cb9mF7tEcYynvBmrQ==
X-Received: by 2002:a05:6000:1244:b0:43c:f257:c706 with SMTP id ffacd0b85a97d-43fdbb672e3mr547515f8f.23.1776322113148;
        Wed, 15 Apr 2026 23:48:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 23/47] util-linux: backport fix to build with glibc-2.43 on host
Date: Thu, 16 Apr 2026 08:47:24 +0200
Message-ID: <5fda90b79d6b0e4fd948927cb66d3bfad0e34b09.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235365

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...x-bsearch-macro-usage-with-glibc-C23.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3135bbb7c64..3bcf681f243 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
            file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch \
+           file://0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch \
            file://CVE-2025-14104-01.patch \
            file://CVE-2025-14104-02.patch \
            "
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch
new file mode 100644
index 00000000000..6194594f7fc
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch
@@ -0,0 +1,40 @@
+From 710a6989e0fc6dfc9290e2639022d1dbf429557f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cristian=20Rodr=C3=ADguez?= <cristian@rodriguez.im>
+Date: Sat, 22 Nov 2025 10:41:08 -0300
+Subject: [PATCH] lsfd: fix bsearch macro usage with glibc C23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+C23 requires bsearch to be a const preserving macro, build now fails
+with
+
+../lsfd-cmd/lsfd.c:1879:75: error: macro ‘bsearch’ passed 6 arguments, but takes just 5
+ 1879 |                                     nfds, sizeof(struct pollfd), pollfdcmp))
+      |                                                                           ^
+In file included from ../include/c.h:17,
+                 from ../lsfd-cmd/lsfd.c:48:
+/usr/include/stdlib.h:987:10: note: macro ‘bsearch’ defined here
+  987 | # define bsearch(KEY, BASE, NMEMB, SIZE, COMPAR)                        \
+
+  add parenthesis around expression to fix it.
+
+Upstream-Status: Backport [2.42 https://github.com/util-linux/util-linux/commit/711bda1441561bfd2eb6d45fe0bc789535c1f1a8]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ lsfd-cmd/lsfd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lsfd-cmd/lsfd.c b/lsfd-cmd/lsfd.c
+index 75cd1de..9aae240 100644
+--- a/lsfd-cmd/lsfd.c
++++ b/lsfd-cmd/lsfd.c
+@@ -1836,7 +1836,7 @@ static void mark_poll_fds_as_multiplexed(char *buf,
+ 		struct file *file = list_entry(f, struct file, files);
+ 		if (is_opened_file(file) && !file->multiplexed) {
+ 			int fd = file->association;
+-			if (bsearch(&(struct pollfd){.fd = fd,}, local.iov_base,
++			if (bsearch((&(struct pollfd){.fd = fd,}), local.iov_base,
+ 				    nfds, sizeof(struct pollfd), pollfdcmp))
+ 				file->multiplexed = 1;
+ 		}

