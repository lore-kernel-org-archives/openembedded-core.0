Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABE6C41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 10:07:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.11956.1721297260056937502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 03:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YjHV0tCV;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-36798779d75so594720f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721297258; x=1721902058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4EvWlTFYImDFWyHWQd9BjrHQhy0DS3+wk3K/nZFiwc=;
        b=YjHV0tCVqoIkPCV9aUzBKNDwRP5LhWc9eADx4kBYuOCQElMQpk/5gWAwTe1L8M9Er1
         e2qE4Y0siXe08RSWaNtF3uvG7AvMcax5kZIzHF5Aedhox1m+30E8MgEehdx86Sifktzp
         qlEe/I7gjYa3rHE4D3h3HRpJ4LUHrCz6KvoPc8dR4GTvgMD0FnHcO5qXAvXM3+yUeP2P
         lXttM3sKn0AeGfGfq6KtWZhPnWr6C1Uu2mLWmeDjjBeRzrHOdjaqy1gkOsFQIvVIopzP
         brV5BcZfqF3XioCJiS8QVt/MBHDI2K44oAZzxpVni9Lzn8rI/iACkA9RdkG2PrAGi8et
         fpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721297258; x=1721902058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4EvWlTFYImDFWyHWQd9BjrHQhy0DS3+wk3K/nZFiwc=;
        b=Mq35bxdWFT0PD8RFiIztr0tSzldnS1+d8VQIEcfHj75puVlgmdQnynmceIppLr9CdA
         T/eBDxqmzlH2sw7i0szx01wECIwr0FsR4zY4qDYQ1KnaY1QTpQgqO5EycbbcF3PK0bvW
         3irFSeUFEEZWm/024P1X15w1y9q6R/SndjFgXHKjMAD7ve7lc+ntMacP+MnjW86N9RWC
         lKYq/IWezrCzGSxUyB2/JAiruElryyIlt0pY7jLvS7s6Hn45uw+PWWitbClHbdtptVw8
         YKYtAPrjuEnHsm2tqixOEWAYnlzoWxVHGKeTS9fzzSWeKTl8Z522SUka4XdZmEjiUUFZ
         Fo3A==
X-Gm-Message-State: AOJu0Yxt9lH/ydyCY2qy8FvxGFS2QyzZX2N74vKxVGa4CRr2egw/Klb5
	ThqEG7d4I4l/eSXEpCJUo3/Zntv5EzNeI9ApwJT6p/U+S4J53M6+5v0QYw==
X-Google-Smtp-Source: AGHT+IFU6jQ2tH6MUD4kAPyIGKuoFdU/wq92g3K2j6MaKGMuPylzy0aKX+7PXf5ISGyWpLRA8WLJgg==
X-Received: by 2002:a05:6000:400f:b0:367:434f:cab8 with SMTP id ffacd0b85a97d-36831730e38mr4550648f8f.43.1721297257786;
        Thu, 18 Jul 2024 03:07:37 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf3bdsm13805404f8f.30.2024.07.18.03.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 03:07:37 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v6 1/3] openssh: drop rejected patch fixed in 8.6p1 release
Date: Thu, 18 Jul 2024 11:07:26 +0100
Message-ID: <20240718100728.1917186-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 10:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202197

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
---
 ...igned-overflow-in-pointer-arithmatic.patch | 111 ------------------
 .../openssh/openssh_9.7p1.bb                  |   1 -
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index 4a08c0bd66..4f20616295 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -22,7 +22,6 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
            file://run-ptest \
-           file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
-- 
2.45.2


