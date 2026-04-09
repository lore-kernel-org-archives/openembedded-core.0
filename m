Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9747F31E3B
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:28:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.135343.1775748527933181210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pkSV3kCs;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-482f454be5bso11102335e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748526; x=1776353326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCXIkJbDCgDTJxFWdRmzTui09o8vqsTX7yMXYfLflVU=;
        b=pkSV3kCs+RbyFUdhC5CMjY/3M2yehdwRK7WRqJ8Wy6qMNM5pbnQLT69OG4fhVakQDp
         lGNoCx/VwoQtFAj5Gh1443yajkIiCh3Q8huZ5OPmT9ztbkyp16VgvLB9Iqq8XljPtMS1
         29kBSyHg7vgKqm/SiCnqWYuae/P2/faNeFPXMmq2I3SNTJpjoGeyByEE+WkX8YKG8T4O
         RDfAf36yJLHP/s2g1LrBlVQs5kFkD+JLJN6G3Vvghg74fTpJ1MzyRTRYGqXVKDg3I86w
         Q8ZQg+sZxAm+/rJdKHXELx9c/X5ENSopfxRQu8rORGZgoQF+lz9PttyP0Q3oeHdXIKCX
         cJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748526; x=1776353326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YCXIkJbDCgDTJxFWdRmzTui09o8vqsTX7yMXYfLflVU=;
        b=Lwimh+qmgQeGfFez3lJK3SdlNZx+i0OehOwJYOSChu6kTvAmXOF6CtjhaB4WEnE4Am
         VJYK8u8jGPhT9gX8pPN7+8ooKRVLvDIi+VsdMeAqgsnx45pYekdfFBoNlF2qgby436gb
         jEwYA+1kay0KeanO9fifzLqgNgSkcNol1JgZ+fCEWTPicAG3oW7Ej9ESKQjE1RnRy9gx
         1TcceqNfKASOnyMibZwiZAMwg+tpoJ8sxIyoxJ5fKS3CGZjdkt/chv4me4olTwVTboqc
         vWNv+0gh8B7up5EZhPxlqH1aJHHHiRHGgBVN0xt03TYg5mZZwQVxcmY4+sC1B8XqFXnQ
         OU3g==
X-Gm-Message-State: AOJu0Yyh3qIBqdmxXq7C/wItMELBHvg4rwIqqPhbm+BanLsMCjljLOZN
	mtKQ+Aasy2DfLTim33X1HqDFgPPHnEr4mGhtRtGZBK9P7aqggFrWa2zmIJy+og==
X-Gm-Gg: AeBDieu0wjXbCjxsHKpkTT6XVZBzLUtWZtOYzYvhMWgEDPfyTX9vKY+FsJGlDi8lYPb
	4HM/IFFnSv9pKiIRmAyuZQA5aDcrH6Jd1AJscEDZqLeGwl+44v+nD0kIKvXVr5UIXTk0I/WN/Lo
	X6raWW1WQGN/mixhl3rUt3t/zH/WD4hCo/z85CFDBSFhzIbzpvLI9CED7vLScKgUJTETPGerDdd
	lKwEzB4eml2IQhdIMkGk2EQjyMouhHlpT9k5e/yTPPO11Pw0L7MTkywj9RJauYl+aZg8I6YbrSG
	2lhS070m+cY5O7WIkpltYD8sQJ7XRYt+++JAtJbCf3CQlbvHumDZxEEaXcpVawGCUmWzJ3cF/fX
	lTYTDaHlPR3JVJ5QUk5H/XDJAMV/C76mugfvVUsN/iYZJ5uB13u7SrQZGyJ4OBkflcwJim0eCvv
	mrglhqqsdEZluNPDceSrN+9+6+Txu2PUBYjDYk
X-Received: by 2002:a05:600c:4e89:b0:485:3428:774c with SMTP id 5b1f17b1804b1-488cd5282c4mr50166205e9.4.1775748526231;
        Thu, 09 Apr 2026 08:28:46 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532f337sm3741005e9.9.2026.04.09.08.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:28:45 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH 6/9] util-linux: backport fix to build with glibc-2.43 on host
Date: Thu,  9 Apr 2026 17:28:25 +0200
Message-ID: <20260409152839.2894434-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409152839.2894434-1-martin.jansa@gmail.com>
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234922

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

