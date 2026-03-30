Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8511061B13
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 15:16:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53847.1774883792591825702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 08:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K9WEw4D0;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so3242257f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774883791; x=1775488591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCXIkJbDCgDTJxFWdRmzTui09o8vqsTX7yMXYfLflVU=;
        b=K9WEw4D0aAl1O80pbqiDtQSUOo6AuKmNKE+nbaxVKtafMYqmwBCvPxoPJkjBUUs42G
         RLIHPeUPqL2ahQY/QVq4HSSaLzZsHvQeNq9aL31g9F8EDDxYHKYS/7yXI4Amth6BevNe
         i6ImBFkkuJAfy4RR0fi47UokCWOTq8F8qR3E++0O3khTxC3e3r4XBQacU07kbKz6Yfnd
         P8yX30tV9hZ5A4sE8zLf9q0y26AF8zAdvRt8kdlXpxMVCYU5JdZXEDff6a3Y2xFwICR1
         G5C+uDNqlso/5CjHOWKBABnoKeE/iH2afSX7yUvn8OWCpw9IsSGfwgL+m1EbtFrv2vG1
         Rn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883791; x=1775488591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YCXIkJbDCgDTJxFWdRmzTui09o8vqsTX7yMXYfLflVU=;
        b=CeGcrgcenBV3ZzKHAgh3/zPdHXKTOofwypupkS43/XOfKKfHbIxb/3QkUQDjFbBDNf
         r9V2npjPz0FIjYsXwKtszljnDzYz0lZIvGq1Ze/6bvpYnH1UsMesdhSgmPxr9rFsBXfu
         uWWwbORX5M7rtjGrNS6BGVsSknRlKcH3M1gTWYEgToSA5r2OwSIIrq+qYsqWeYXpfCc6
         QCGD2ubiX8IiHXN1n4Jb8Ve8hDCVZzJLhj8IQJZR2+Kkq/OMbLKiC5U6x34ziqZr7PCY
         vc7u9AiUZU60QNbFH1wad7C94IqyR7d0klJTun7N7ajJR1+HkWBRG9kj7eWCYEVnZTy6
         q4ww==
X-Gm-Message-State: AOJu0YwywIx/hqiG23nRFLY7ugxfyOKXwrOhGE+RWIYbeL3RCXmf9Yr1
	QcL6yM6m3uQphPxEQiTF3GaCUpF5cv23L9/K2r4CnVRe3xeyk1ZyOL5047YKXw==
X-Gm-Gg: ATEYQzz+Zjo3Z1LwQ1r+8MvUZBLdrA5iH6NO3klLcG6TRh9UQY6kR7pc3Umj+0ivADW
	Xr48MHZ6LnhW3v7MsZigzWJUUGAW/dA4YTSG93N//h4/ZvfEM4PtmEx5hAq2Rjm5zn5PDDKsMkp
	Wxu/3Si/XNB62mnxR23m1ldrheuDhPkg/2mSR+iEyD6NyN4m5QIs+AizJplF3+4usVQGLHoGBSy
	fN0d/S3Z4qQp3KpTqzzAtN+GJzwEeq066BRlMpADS6W2L0F7orTrtncfUmH47fVhFUkDRGUcNzG
	iQ8tEQGcv2OQcf/g2wKYuZNyW38BiSWhbpnNR7ZGpiT6VJXi20HjXRuuF4iTuHhheZNnTbnGHny
	lUmvRk92oP+NxcsE+29ufFfE+Tt/feoMVZmhOsH7ierHjRGkCIOxU0cnRIZZMoR9cm3lOTd92/z
	sXkKGY1d1/gfaqzwApRh0Ghg2AqoTc6BYa1iEQ
X-Received: by 2002:a05:600c:4f53:b0:487:18c:7acf with SMTP id 5b1f17b1804b1-48727edfcacmr215564135e9.25.1774883790779;
        Mon, 30 Mar 2026 08:16:30 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873069961esm192068455e9.12.2026.03.30.08.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:16:30 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH 6/7] util-linux: backport fix to build with glibc-2.43 on host
Date: Mon, 30 Mar 2026 17:16:15 +0200
Message-ID: <20260330151620.3835312-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330151620.3835312-1-martin.jansa@gmail.com>
References: <20260330151620.3835312-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 15:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234247

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...x-bsearch-macro-usage-with-glibc-C23.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3135bbb7c6..3bcf681f24 100644
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
index 0000000000..6194594f7f
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

