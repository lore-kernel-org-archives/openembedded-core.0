Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808EAC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.43711.1742834032619140249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZiptWdj;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224100e9a5cso88985685ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834032; x=1743438832; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgdckzxfRRJRynVpchZ+STqiFpRNhUkvnnc1YwwJeKI=;
        b=PZiptWdjqmK3z+vsici2jPom7VynygThKbyoezV3hx/Emk/fJU35ZmQvdsyGJjS4V/
         tpu/1fdA92Kz6vpKIATpCB1UVGlxQtQguSxE12yTSwnZmFxb/CXataTWQV/VkmnPhrUu
         9G/lViGlYp3F7KX8c84YTcNTWohjJGKo1AThAMYluy4UeFuzt3LqN/3uUwoW2+zjqaMi
         3vpUOd5OsxGkMpYit5i4f6Jn9xiy2ztiCMohFBEXkeJT496sWswiKiMJGtMzMAZU7s4Y
         bL67paLQT0uHWf+DbsKfqh58DTNIx8wUtIpDrMG6Xsx6yGhrihVdXFxI6FcYQak/vyW6
         0cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834032; x=1743438832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgdckzxfRRJRynVpchZ+STqiFpRNhUkvnnc1YwwJeKI=;
        b=vYF44BV4U3xopzDgyEXCsrQVHDgqKMOkellw4yYOr3Q6Z4shFCbyVBOLJbmmLzJbWp
         Qo1gLJ3awq/OrTDzqPaIG/VFQPsm0LiGp419KWvszWDezu8reZDFJY6BYsVhEfxGasTB
         R6QTIksZvlqI306FmlbxfSauc0hMqUG8BkJSLp9R1EfVqNKrHlJiD1qCaMJmeUxsbFH2
         PCrxl2y3cbsyylzfK+bqcw6wf7GK9F8l7IzrLUM2K7fkbhgvZgIGboUHB8iPwXn7yr3A
         0grHPWO9C6iYroNvtfW4Q7CUNpkXS5OTYbgJ6dxnkXgEPmv5tch/6PzvIYfmGSOa09lF
         QTag==
X-Gm-Message-State: AOJu0YxBbah83M5PypIgY/Us4iOjqwdPObwlOpESpdtJbCHPD2K0BiFm
	q/q01lghEGjyqI/7MWW91fvLq9dlJo4quHHUh5TtrcoCULQcKQAvvK2GlqZi
X-Gm-Gg: ASbGncv85O5j9R9E2uyakfXlvXgaxVp9lnSom35uit1FahfUuWaM00hXglfdfwqtFhh
	kpYTPKWZZiDIolRD+agdj+wr4GYduljqzrTKoY9w7ZVNNLoD0+75cjg6JOQZuarFhx2kTYidReZ
	S9yIO5XknGOSqzOZOjeao+9T+DaHHgaxi7rHidlYi13syMWBkYV2NqC7vxpBsRGsb9FE/+OP5rt
	qe911jRetOvMViMZz5lPavL0AlebAB4m+ozM2QdnttDCbRT8MD0zCPFg3S4l6SwjxF5h0nxbxtj
	KXQQ0Gdpa2+uMIK3dNR1+SdXBmWIXniLsr66
X-Google-Smtp-Source: AGHT+IGuGZMhIrsbuQnFrUtAXW0Ihx2FFF4ogG78/5gcPD+n1abYPiXcZ1q8Z0szBd8RVIy5Buvzig==
X-Received: by 2002:aa7:8892:0:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-73905a3b9d0mr21366676b3a.18.1742834031765;
        Mon, 24 Mar 2025 09:33:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:31 -0700
Subject: [PATCH 10/21] bc: Add missing params to getopt/getenv signatures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-10-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213542

Fix build with GCC 15 on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...missing-params-to-getopt-getenv-signature.patch | 40 ++++++++++++++++++++++
 meta/recipes-extended/bc/bc_1.08.1.bb              |  1 +
 2 files changed, 41 insertions(+)

diff --git a/meta/recipes-extended/bc/bc/0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch b/meta/recipes-extended/bc/bc/0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch
new file mode 100644
index 0000000000000000000000000000000000000000..f43f3360757d33c5737da2e78618c1b348f41243
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch
@@ -0,0 +1,40 @@
+From 493997b0d2c3dc6469f967d8f619ed934667c71e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 18:33:08 -0700
+Subject: [PATCH] getopt: Add missing params to getopt/getenv signatures
+
+This ensures it can compile with GCC 15 on musl
+
+Upstream-Status: Submitted [sent to bug-bc@gnu.org]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ h/getopt.h   | 2 +-
+ lib/getopt.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/h/getopt.h b/h/getopt.h
+index cc45f46..5ea5eac 100644
+--- a/h/getopt.h
++++ b/h/getopt.h
+@@ -141,7 +141,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int ___argc, char *const *___argv, const char *__shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int,  char * const*, const char *);
+ #endif /* __GNU_LIBRARY__ */
+ 
+ #ifndef __need_getopt
+diff --git a/lib/getopt.c b/lib/getopt.c
+index b270074..3e6d071 100644
+--- a/lib/getopt.c
++++ b/lib/getopt.c
+@@ -197,7 +197,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ #endif
+ 
+ #endif /* not __GNU_LIBRARY__ */
diff --git a/meta/recipes-extended/bc/bc_1.08.1.bb b/meta/recipes-extended/bc/bc_1.08.1.bb
index 473d78d8a7741d25c08941c8d080eeecb16a87a6..5fbbe7ef6abaea27c28280641007677a3048636c 100644
--- a/meta/recipes-extended/bc/bc_1.08.1.bb
+++ b/meta/recipes-extended/bc/bc_1.08.1.bb
@@ -13,6 +13,7 @@ SECTION = "base"
 DEPENDS = "flex-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://0001-getopt-Add-missing-params-to-getopt-getenv-signature.patch \
            file://run-ptest"
 SRC_URI[sha256sum] = "b71457ffeb210d7ea61825ff72b3e49dc8f2c1a04102bbe23591d783d1bfe996"
 

-- 
2.49.0


