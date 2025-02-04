Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CEEC0218F
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 06:55:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.110317.1738652132439724116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 22:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EWhjd0Nj;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: nikhilar2410@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38da84c9e4bso215077f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738652130; x=1739256930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yA8fWFUUj9fP5qlLNDele9HuJM/BWCJfgBeRscOfVFE=;
        b=EWhjd0Njesf8aeMnD2+fa7skGu8c7+FaBOZYAzenvstpTAcUZxJmsRH49fe4oiCMgD
         /WoXYZ+ljZwlmPgnr7jSU1JKocEHnPxrssK+O5MZns7ut1X/VYE8yaHW/6cw9IYbyHJg
         bXobajijjtuNYNzpOyD7zlhHmiskOHUmcAx8OQD1JfqJ2QPrZr/cMHvteJjvJCIG0QuL
         aAS9VvbWekPevW4SgWty3kVq/7bYwO4bDShyxAgBeWZtsPGKQ5/CJsJXttBQ8zBG0QIg
         ZP6qnJwST3E4wPXqTYzJgNVA8ZASqd+IJyDw1mr2+89TWSC/bl8GYAoraai7hB+DWI1A
         TNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652130; x=1739256930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yA8fWFUUj9fP5qlLNDele9HuJM/BWCJfgBeRscOfVFE=;
        b=Oo06QUKPWOVGivqrBTcxjjVpqODcCnPNTfuldklisVqFJ1U+gMdxsNMcb735FnolBf
         bl9yhMdFvoVj1OWbSXp1kciduh0CTa8znUnt/p/Jj1hy6kqTcbXqYEQ60yNMIQ9HeFMc
         6ObuI9Bj6P1j4f6R5qSK4npXjgakc1PzxGIvhxzZ/irEf8EYnIVcAgNUhRA/FB4R/UP6
         fHBQkOQwlTqYw0wKiuf9nTVIFovQYI1mgbVUnLKWpG6+tdCXqYRrObY4xC55fsHUy1rS
         /OgVBbKBksYMvoXek9aVbj69/JT1LE/SQhqeVcxa61VVXnWlr3KXJnJfyJ3W1Xh23UKU
         IPOA==
X-Gm-Message-State: AOJu0YzbWkgPVOMpRCoB4mOelPkFaPqgkmLyUNuXhjwgOn6UldWRYrQT
	8W+x9IiqSORhydVqyXjEumUkmvBqV7BtPoP9wL6leOqNQYWMR6On3oOGANg=
X-Gm-Gg: ASbGnctkwk80y2upC7vrEPY+TMmeI93s7w3bJe1/bQScqJMZKo6xHZK1fvKMnJphKTN
	czpS/2ADh4V9AvjRKMBKc917aPVA5ZSDbsvJPi6Myq2urEV+5OCOqg50Sc7ZZ9Xmun86Z/8W5fP
	UjY6RD36L64orfigdi8mfBUuwAV6HCbBlXvHlgQULCS49sbmw2EeB3x3OJ+xNZG1ZIH3u0oJVAx
	twpCxZlXi0N4dHrx1ey/S1S3CXTkxrcuYFx6Jz6cUPH+Aa20YMqpwQK7OZd1epBYvmUOtlMd2D0
	m9LjflIy3+q4DFB56DrOz9vBLiJXlDGU
X-Google-Smtp-Source: AGHT+IFmAaDzQ3evnupAoaMOMMgF/ib2FAIYed4I8R/674eSpKXPv0GRHhsdrFBQVdxTknyzjxcpqA==
X-Received: by 2002:a5d:6da7:0:b0:385:fae2:f443 with SMTP id ffacd0b85a97d-38c51e8e145mr19026953f8f.34.1738652130045;
        Mon, 03 Feb 2025 22:55:30 -0800 (PST)
Received: from GIW-21.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b61f1sm15107535f8f.68.2025.02.03.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:55:29 -0800 (PST)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: Nikhil R <nikhilr5@kpit.com>
Subject: [OE-core][kirkstone][PATCH] glibc: Suppress GCC -Os warning on user2netname for sunrpc
Date: Tue,  4 Feb 2025 07:55:26 +0100
Message-Id: <20250204065526.3999-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 06:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210751

From: Nikhil R <nikhilr5@kpit.com>

When building with GCC -Os, a warning is triggered indicating that sprintf might overflow.

Error:
  netname.c: In function 'user2netname':
  netname.c:51:28: error: '%s' directive writing up to 255 bytes into a
  region of size between 239 and 249 [-Werror=format-overflow=]
     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
        |                            ^~               ~~~~~~~
  netname.c:51:3: note: 'sprintf' output between 8 and 273 bytes into a
  destination of size 256
     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

However the code does test prior the sprintf call that dfltdom plus
the required extra space for OPSYS, uid, and extra character will not
overflow and return 0 instead.

Upstream-patch: https://github.com/bminor/glibc/commit/6128e82ebe973163d2dd614d31753c88c0c4d645

Reviewed-by: Carlos O'Donell <carlos@redhat.com>
Tested-by: Carlos O'Donell <carlos@redhat.com>
Signed-off-by: Nikhil R <nikhilr5@kpit.com>
---
 ...press-gcc-os-warning-on-user2netname.patch | 61 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch

diff --git a/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch b/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch
new file mode 100644
index 00000000000..7068a81518f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch
@@ -0,0 +1,61 @@
+From 6128e82ebe973163d2dd614d31753c88c0c4d645 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
+Date: Wed, 21 Sep 2022 10:51:07 -0300
+Subject: [PATCH] sunrpc: Suppress GCC -Os warning on user2netname
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC with -Os warns that sprint might overflow:
+
+  netname.c: In function â€˜user2netnameâ€™:
+  netname.c:51:28: error: â€˜%sâ€™ directive writing up to 255 bytes into a
+  region of size between 239 and 249 [-Werror=format-overflow=]
+     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
+        |                            ^~               ~~~~~~~
+  netname.c:51:3: note: â€˜sprintfâ€™ output between 8 and 273 bytes into a
+  destination of size 256
+     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
+        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  cc1: all warnings being treated as errors
+
+However the code does test prior the sprintf call that dfltdom plus
+the required extra space for OPSYS, uid, and extra character will not
+overflow and return 0 instead.
+
+Checked on x86_64-linux-gnu and i686-linux-gnu.
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Tested-by: Carlos O'Donell <carlos@redhat.com>
+
+Upstream-Status: Backport [https://github.com/bminor/glibc/commit/6128e82ebe973163d2dd614d31753c88c0c4d645]
+Signed-off-by: nikhil <nikhil.r@kpit.com>
+
+---
+ sunrpc/netname.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/sunrpc/netname.c b/sunrpc/netname.c
+index bf7f0b81c43..c1d1c43e502 100644
+--- a/sunrpc/netname.c
++++ b/sunrpc/netname.c
+@@ -20,6 +20,7 @@
+ #include <string.h>
+ #include <rpc/rpc.h>
+ #include <shlib-compat.h>
++#include <libc-diag.h>
+ 
+ #include "nsswitch.h"
+ 
+@@ -48,7 +49,12 @@ user2netname (char netname[MAXNETNAMELEN + 1], const uid_t uid,
+   if ((strlen (dfltdom) + OPSYS_LEN + 3 + MAXIPRINT) > (size_t) MAXNETNAMELEN)
+     return 0;
+ 
++  /* GCC with -Os warns that sprint might overflow while handling dfltdom,
++     however the above test does check if an overflow would happen.  */
++  DIAG_PUSH_NEEDS_COMMENT;
++  DIAG_IGNORE_Os_NEEDS_COMMENT (8, "-Wformat-overflow");
+   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
++  DIAG_POP_NEEDS_COMMENT;
+   i = strlen (netname);
+   if (netname[i - 1] == '.')
+     netname[i - 1] = '\0';
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9400e1e9208..d9cae79ac2f 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
+           file://0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1


