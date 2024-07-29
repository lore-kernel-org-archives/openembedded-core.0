Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3657C52CDA
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:47 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.55970.1722258826448863153
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wjHXKgmZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7669d62b5bfso1846136a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258826; x=1722863626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe+jmpvBiUOh74xlesQFjio+wB8Imwfvps58vyv655k=;
        b=wjHXKgmZq7YTeAlUKoXivimpvpIO+BZnR/ZDiZ6WqvmJ/uhEcffSMl5pV9PuN7RqOp
         RXbwHUs2TUpR80WArWNiCkxeUywQOzCLrWBFTZenm+xqUT1V0fGN6f6EKd/eSGnykbKV
         emKH59+u8WLnew9xx9r4kXENVXKrtmD2cEuJzOcSF65tx/BehYT0t3ycvqKFQYLeZpPN
         VCst0u/cd0DBdzF2GC8AyDUhxvxcmuAtRe0ixpfULbDpGMoGoaU+kfvTr5V+L0tNFIWi
         2MGeCJz5g6iDmjV30hlp9IO5prS//s4/C4Wz1fThPnbTWuXuv3Qow8rm0vl470iB30NW
         g/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258826; x=1722863626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xe+jmpvBiUOh74xlesQFjio+wB8Imwfvps58vyv655k=;
        b=jnDfmIPL5zxxx6AeW/E/J0Qe2wKp5EcUTAVu09zJxyZvyYjVqhfesZo3RF+eC778Cw
         DZjJ//KhPzA54bfwEGHWTraFr/ovfyiWEGRmoUFW/Cxpuvf3hujxZa9SuFj3wDQJYr2m
         m1tV7XF7H48TRe8KHZ9Hv0GneTdA+tZmFZDIayUHHR+gZ5eGHRJaUgKQRAHtT4ejZE6y
         ct2R1qhEWznhoJBTIvxqKcG68QWeDHEdyb2rJdoM8GFvLDjizZkIVFx9FwbUH/coZqEC
         JNEbDe4odTxTzS+FBtfM7SvG0nonAP6Uk0Kl6QMGtZwk6nn7hTeeOJXO8l7HXVqh1bHR
         Xi7g==
X-Gm-Message-State: AOJu0Yw1XMVRcVEUF9/W9yFXEPutJGkYmDvY/ctI23CrbYJAkTad1Nk2
	SfmNP9StipCc+KyFBg7CU2vVnlHB/f2L3qtGr7GjoxD53oyhO/b7n/b8bDQ3soSlZkzxxrbgcad
	kqZM3FQ==
X-Google-Smtp-Source: AGHT+IGNmEZ5X0FHCde1Ms49oO7kEjB4i7cPT7DxCuBm0w8zgj+b/lFPtkho+hZnLna8czCxWqtkIA==
X-Received: by 2002:a17:90a:9a6:b0:2ca:8a93:a40b with SMTP id 98e67ed59e1d1-2cf7e606ccemr5450712a91.31.1722258825524;
        Mon, 29 Jul 2024 06:13:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/37] openssh: drop rejected patch fixed in 8.6p1 release
Date: Mon, 29 Jul 2024 06:12:45 -0700
Message-Id: <ea9b6812e2e547767d430a05f4f9282f6988468a.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202649

From: Jose Quaresma <quaresma.jose@gmail.com>

The rationale [1] is that C11 6.5.6.9 says:
"""
When two pointers are subtracted, both shall point to elements of the
same array object, or one past the last element of the array object; the
result is the difference of the subscripts of the two array elements.
"""

In these cases the objects are arrays of char so the result is defined,
and we believe that the compiler incorrectly trapping on defined behaviour.

I also found https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63303
("Pointer subtraction is broken when using -fsanitize=undefined") which seems to support this position.

[1] https://bugzilla.mindrot.org/show_bug.cgi?id=2608

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf193ea67ca852e76b19a7997b62f043b1bca8a1)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...igned-overflow-in-pointer-arithmatic.patch | 111 ------------------
 .../openssh/openssh_9.6p1.bb                  |   1 -
 2 files changed, 112 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
deleted file mode 100644
index 20036da931..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
-From: Yuanjie Huang <yuanjie.huang@windriver.com>
-Date: Wed, 24 Aug 2016 03:15:43 +0000
-Subject: [PATCH] Fix potential signed overflow in pointer arithmatic
-
-Pointer arithmatic results in implementation defined signed integer
-type, so that 's - src' in strlcpy and others may trigger signed overflow.
-In case of compilation by gcc or clang with -ftrapv option, the overflow
-would lead to program abort.
-
-Upstream-Status: Submitted [http://bugzilla.mindrot.org/show_bug.cgi?id=2608]
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
-
-Complete the fix
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- openbsd-compat/strlcat.c | 10 +++++++---
- openbsd-compat/strlcpy.c |  8 ++++++--
- openbsd-compat/strnlen.c |  8 ++++++--
- 3 files changed, 19 insertions(+), 7 deletions(-)
-
-diff --git a/openbsd-compat/strlcat.c b/openbsd-compat/strlcat.c
-index bcc1b61..124e1e3 100644
---- a/openbsd-compat/strlcat.c
-+++ b/openbsd-compat/strlcat.c
-@@ -23,6 +23,7 @@
- 
- #include <sys/types.h>
- #include <string.h>
-+#include <stdint.h>
- 
- /*
-  * Appends src to string dst of size siz (unlike strncat, siz is the
-@@ -42,7 +43,7 @@ strlcat(char *dst, const char *src, size_t siz)
- 	/* Find the end of dst and adjust bytes left but don't go past end */
- 	while (n-- != 0 && *d != '\0')
- 		d++;
--	dlen = d - dst;
-+	dlen = (uintptr_t)d - (uintptr_t)dst;
- 	n = siz - dlen;
- 
- 	if (n == 0)
-@@ -55,8 +56,11 @@ strlcat(char *dst, const char *src, size_t siz)
- 		s++;
- 	}
- 	*d = '\0';
--
--	return(dlen + (s - src));	/* count does not include NUL */
-+        /*
-+	 * Cast pointers to unsigned type before calculation, to avoid signed
-+	 * overflow when the string ends where the MSB has changed.
-+	 */
-+	return (dlen + ((uintptr_t)s - (uintptr_t)src));	/* count does not include NUL */
- }
- 
- #endif /* !HAVE_STRLCAT */
-diff --git a/openbsd-compat/strlcpy.c b/openbsd-compat/strlcpy.c
-index b4b1b60..b06f374 100644
---- a/openbsd-compat/strlcpy.c
-+++ b/openbsd-compat/strlcpy.c
-@@ -23,6 +23,7 @@
- 
- #include <sys/types.h>
- #include <string.h>
-+#include <stdint.h>
- 
- /*
-  * Copy src to string dst of size siz.  At most siz-1 characters
-@@ -51,8 +52,11 @@ strlcpy(char *dst, const char *src, size_t siz)
- 		while (*s++)
- 			;
- 	}
--
--	return(s - src - 1);	/* count does not include NUL */
-+        /*
-+	 * Cast pointers to unsigned type before calculation, to avoid signed
-+	 * overflow when the string ends where the MSB has changed.
-+	 */
-+	return ((uintptr_t)s - (uintptr_t)src - 1);	/* count does not include NUL */
- }
- 
- #endif /* !HAVE_STRLCPY */
-diff --git a/openbsd-compat/strnlen.c b/openbsd-compat/strnlen.c
-index 7ad3573..7040f1f 100644
---- a/openbsd-compat/strnlen.c
-+++ b/openbsd-compat/strnlen.c
-@@ -23,6 +23,7 @@
- #include <sys/types.h>
- 
- #include <string.h>
-+#include <stdint.h>
- 
- size_t
- strnlen(const char *str, size_t maxlen)
-@@ -31,7 +32,10 @@ strnlen(const char *str, size_t maxlen)
- 
- 	for (cp = str; maxlen != 0 && *cp != '\0'; cp++, maxlen--)
- 		;
--
--	return (size_t)(cp - str);
-+        /*
-+	 * Cast pointers to unsigned type before calculation, to avoid signed
-+	 * overflow when the string ends where the MSB has changed.
-+	 */
-+	return (size_t)((uintptr_t)cp - (uintptr_t)str);
- }
- #endif
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 8bc4f4269a..c71245b6c0 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -22,7 +22,6 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
            file://run-ptest \
-           file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
-- 
2.34.1


