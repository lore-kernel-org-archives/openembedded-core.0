Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2935A7C034
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 09:22:59 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id g11-v6so15005621ljk.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 01:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=12zC5Hqr7rQVq27wJCQIV8C+K13Sg0LkuNJOudtv6Mw=;
	b=TclijrJ03i61aM0jxpBLyBvOTtxUiUd7dPXuVWOyXh4TIP0vDiMv3gM4/Ntd31lXri
	PiGOTRjBcvJ98MbS2yBChkOChy2qEyRX8njRMpBgYVXlBXKNY9FhKgwwupC5CnqZAdL5
	mGxXyVlc9d/tlmehPNoBDY0juHN0IPt+wPBQAFARSOkuNeFDbgQMnYRbGhlWwLPLWGj8
	DmTCUkoSZiejHdPM2+4eCtfmVSOu6uxL9dQDcHxRGU+OMsHTs1SBqpjdOm8napkKQKM2
	81unZ2Zcn8zFvkqXWrZxVkm+ZfjgslXO7spTfJlQcWtdvNUrDhE6uNYW8GivzZqhcBN9
	4Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=12zC5Hqr7rQVq27wJCQIV8C+K13Sg0LkuNJOudtv6Mw=;
	b=b37uwXRo2sO5JpB09jJF9ylonLvojuJ7SBpWX5Z6ALvpakYYQVriD29KNpNwsKEXQ+
	gfuNCy4jD/v/n1WjZUvATe5LD6DCGLKH81JyPP/fgCwpVu0VQWNilG6FE6YIo/4cSqPv
	Be/3oQ5NsFJj4E2Arwyqy6lqIc1rf6lPztUx+gGiIHSQ489a+Mx/N8XAOfftP5Cr1cnL
	wViF2bthUbY06nhUxDEVd7lHF44sAueYAnyn1FQ6F0a8c/awb7QNqp8wevcJqyT9Xq57
	3ifRglu1GnOHoPHM/7kFvmc0NvDVUnotbTrWiwU2prPpHUS00qlp8H8shDdRw6uHEzFa
	ccvQ==
X-Gm-Message-State: AJcUukfMZBp7bGbX/bPwi+KakTWmt95BdtF584lt3gwXiDFIsnNIZlC/
	KNKcCwP1Mt4MCioPhj9b+1DqkRAS
X-Google-Smtp-Source: ALg8bN6oeLhn5tfC3VuDcW1GMK+M5m4niU2JWcxTHSvco7ssQiDAeetQi1edkUyuEGwQh/pZ1WcBcg==
X-Received: by 2002:a2e:2b8d:: with SMTP id
	r13-v6mr6345397ljr.79.1547284979355; 
	Sat, 12 Jan 2019 01:22:59 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	q11sm14933726lfc.92.2019.01.12.01.22.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Jan 2019 01:22:58 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 11:22:47 +0200
Message-Id: <1547284970-20783-2-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 1/4] systemd: Correctly check ENABLE_GSHADOW with if/endif
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jan 2019 09:22:59 -0000

Use commit 4f07ffa8f5ab ("Use #if instead of #ifdef for ENABLE_GSHADOW")
from upstream to check ENABLE_GSHADOW correctly that is defined as 0
in case of musl.

While there replace specific patch with one from upstream that does
exactly the same commit 66a5b5ce9b99 ("basic/user-util: properly protect
use of gshadow").

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 ...user-util-properly-protect-use-of-gshadow.patch | 38 ++++++++++++++++++++++
 ...clude-gshadow-only-if-ENABLE_GSHADOW-is-1.patch | 29 -----------------
 ...se-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch | 28 ++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  3 +-
 4 files changed, 68 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch

diff --git a/meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch b/meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch
new file mode 100644
index 0000000..518c05b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch
@@ -0,0 +1,38 @@
+From 66a5b5ce9b991327d594f7b635de16999ca54093 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 21 Nov 2018 18:09:04 +0100
+Subject: basic/user-util: properly protect use of gshadow
+
+Commit 100d5f6ee6 (user-util: add new wrappers for [...] database
+files), ammended by commit 4f07ffa8f5 (Use #if instead of #ifdef for
+ENABLE_GSHADOW) moved code from sysuser to basic/user-util.
+
+In doing so, the combination of both commits properly propagated the
+ENABLE_GSHADOW conditions around the function manipulating gshadow, but
+they forgot to protect the inclusion of the gshadow.h header.
+
+Fix that to be able to build on C libraries that do not provide gshadow
+(e.g. uClibc-ng, where it does not exist.)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/66a5b5ce9b991327d594f7b635de16999ca54093]
+---
+ src/basic/user-util.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/basic/user-util.h b/src/basic/user-util.h
+index b6de0e423..cc899ee76 100644
+--- a/src/basic/user-util.h
++++ b/src/basic/user-util.h
+@@ -2,7 +2,9 @@
+ #pragma once
+ 
+ #include <grp.h>
++#if ENABLE_GSHADOW
+ #include <gshadow.h>
++#endif
+ #include <pwd.h>
+ #include <shadow.h>
+ #include <stdbool.h>
+-- 
+2.18.1
+
diff --git a/meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch b/meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
deleted file mode 100644
index 6d5faf5..0000000
--- a/meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a2c4d46944892174930135672508389a04e191f0 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 29 Jun 2018 13:53:29 +0800
-Subject: [PATCH 05/19] include gshadow only if ENABLE_GSHADOW is 1
-
-Upstream-Status: Inappropriate [musl]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/basic/user-util.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/basic/user-util.h b/src/basic/user-util.h
-index b74f16885..f9c1e29c4 100644
---- a/src/basic/user-util.h
-+++ b/src/basic/user-util.h
-@@ -2,7 +2,9 @@
- #pragma once
- 
- #include <grp.h>
-+#if ENABLE_GSHADOW
- #include <gshadow.h>
-+#endif
- #include <pwd.h>
- #include <shadow.h>
- #include <stdbool.h>
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch b/meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch
new file mode 100644
index 0000000..a9c1c9c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch
@@ -0,0 +1,28 @@
+From 4f07ffa8f5ab85011422bb7114f1cddf49d4923d Mon Sep 17 00:00:00 2001
+From: ChenQi1989 <40684930+ChenQi1989@users.noreply.github.com>
+Date: Fri, 29 Jun 2018 06:54:07 +0000
+Subject: Use #if instead of #ifdef for ENABLE_GSHADOW
+
+ENABLE_GSHADOW is defined to be 0 or 1. So #if should be used instead of #ifdef.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/4f07ffa8f5ab85011422bb7114f1cddf49d4923d]
+---
+ src/basic/user-util.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/basic/user-util.h b/src/basic/user-util.h
+index b74f16885..b2f198c89 100644
+--- a/src/basic/user-util.h
++++ b/src/basic/user-util.h
+@@ -102,7 +102,7 @@ int fgetgrent_sane(FILE *stream, struct group **gr);
+ int putpwent_sane(const struct passwd *pw, FILE *stream);
+ int putspent_sane(const struct spwd *sp, FILE *stream);
+ int putgrent_sane(const struct group *gr, FILE *stream);
+-#ifdef ENABLE_GSHADOW
++#if ENABLE_GSHADOW
+ int fgetsgent_sane(FILE *stream, struct sgrp **sg);
+ int putsgent_sane(const struct sgrp *sg, FILE *stream);
+ #endif
+-- 
+2.18.1
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index be836ff..0f1fa27 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -46,7 +46,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0002-don-t-use-glibc-specific-qsort_r.patch \
                file://0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
                file://0004-add-fallback-parse_printf_format-implementation.patch \
-               file://0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch \
+               file://0005-basic-user-util-properly-protect-use-of-gshadow.patch \
                file://0006-src-basic-missing.h-check-for-missing-strndupa.patch \
                file://0007-Include-netinet-if_ether.h.patch \
                file://0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
@@ -63,6 +63,7 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
                file://0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
                file://0021-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
+               file://0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch \
                "
 
 # Workaround undefined reference to `__stack_chk_fail_local' on qemux86 and qemuppc for musl
-- 
2.7.4


