Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192F8F8DFEA
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:16 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28255.1776378789074481406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wRJ8NiDB;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so507125e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378787; x=1776983587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVxFLZXyxleC1/tWo9DUC3Wm/ch6/RCWSpYsaOU0/Q4=;
        b=wRJ8NiDBekYKj83kiAi/7XyH7YOl18mtoFI+2oOGbrLlhq2U8FhJSIaEPfmrACYrBu
         Gd/U5KosRKKJh9VjNzmqgd4kKkWo+rYYni0SQmmWf6DmmM6eJhGbJ6W+FQPY4gyrfpVW
         Wct6JaZbehfIV4AZsPT+hK81b+uflJ2+EN1UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378787; x=1776983587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LVxFLZXyxleC1/tWo9DUC3Wm/ch6/RCWSpYsaOU0/Q4=;
        b=tWWO/jcWM6etg+/y4HDWMPUwPuMnhloDba8nbxuiN7Rs8N26jG5qQ6WSX4Mua3UnB8
         IFkvjli2LVzIp8mucWvbMSujgXGVb1ORyaT+Sn68L+Tnt10k1996qWzf8clKYr7Vp378
         8xf+xNX02885AJHJUwkudDE9v3lEjpUnU7wzrHQjV9xxyF1uoBVUgrS7atKWhNtQ5uA1
         QzYw8yCbYWOgM3iyITKH63PtYtkwO75NHjLu+YjHSXEXzqkaE8crvcBENML3S+l5v9Dh
         ULnS9/LwEnQJyuQYc+NITQBckfehJirdbZcQkoaTtBKYLASGSZ8E/US8wMIvH6pHOy7k
         RLXA==
X-Gm-Message-State: AOJu0YzrJ+AJZMgWrrIbLeUnGVu+7ICDTgahs7BiYsKzzPJqUHrWfe27
	oaHCjuKxJjz8kpGvtkf3dlXB8/lNcgXTzfwUD/7c6oDL9AUA0rZ08zMYo+VFbiy1/s7VmFu5aUe
	aUj7Zt3GaAPZ7
X-Gm-Gg: AeBDiet0cVTdcIwvHkrvtZC+tg34+6AJSFEJe8vJk7DahOxbSDNR5udd/5n66tHzkKV
	cDVzifmtuSP7YX0ZAdWXtyQgVogUGIFRQjsvZbtP7GQhh3AYSdY9MJ6IEC5zykCAYNyex7C2mv/
	Ss0n7k9+MNp+lOUXAzz8g/DU3/pew1fBe5MslRgOfVSTHjCgAE3eAoha+NWvO6vwZOZn9pVMLHl
	6cMGtZUd/DZ8SjZYSPhpKOjfKpjPvaXoaa05RjxrSaZVG7kBy8Qj23RxTR6rK8VHEkHyEigMj5A
	Md+cJRDH3Nx0NxvifzOLldslrRwChop3p+OT7Ph+8eLB9vGUS4lmDX74NUyVMdKgLqYqYBsb3GZ
	hwaqf25lQalHiFq/UMF1t7y0zTfIQJdg4ncD7XKo7m9RPsdm4lj01PetPgLj4jjdqqWv5waTzGH
	YzY6Lybn1EsQshaSKhSEPgjEqSPAxwVdf3GR5wfcLl8Xu2tXo3tWrJgLRkEJKMBpTYpdmxM0Ycp
	g52oX3FWQ6atJZHFsHXnQPGSIUAXyr2m1T4aopBLqjmCQA/
X-Received: by 2002:a05:600c:8b68:b0:488:7f69:4abf with SMTP id 5b1f17b1804b1-488fb75405fmr5977795e9.12.1776378787121;
        Thu, 16 Apr 2026 15:33:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 13/51] binutils: Fix build with GLIBC 2.43 on the host
Date: Fri, 17 Apr 2026 00:29:56 +0200
Message-ID: <47c73e8d5c4b60e7a9124010352804507b76d75d.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235442

From: Zoltán Böszörményi <zboszor@gmail.com>

Added a patch to fix a build error in the CALL_UTIL() macro
when built against GLIBC 2.43 on Fedora 44. This fixes
binutils-native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.45.inc                |  1 +
 ...tect-against-standard-library-macros.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index f635d76069a..81d46bfb734 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -52,4 +52,5 @@ SRC_URI = "\
      file://CVE-2025-69644_CVE-2025-69647.patch \
      file://CVE-2025-69649.patch \
      file://CVE-2025-69652.patch \
+     file://0001-gprofng-protect-against-standard-library-macros.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch b/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 00000000000..b626c51b6cd
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,34 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Signed-off-by: Andreas Schwab <schwab@suse.de>
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5f66aee7f4bec7a2d8378034116f5e5c3dc50f41]
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().
+-- 
+2.53.0
+

