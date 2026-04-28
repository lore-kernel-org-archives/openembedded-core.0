Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471BFFF8870
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 07:05:08 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7136.1777359905299065089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 00:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gM2/qAEu;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so16635815e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 00:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777359903; x=1777964703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NrgBRjQ2GGFMMmDIxB6aUAm9LDfxdKYONIhnxtB1vo=;
        b=gM2/qAEu6UhibsHhg7QxWiti1+kOgj/wimbgE+AN7KJ84fM/GMWgK0KrGkB98Q3qKe
         5I6FoRcmpCrTwLvt/85fvGL4FDVEjXhd4L09kSWs9v9FHWG1vBbgHPomZbcptVUV4KOs
         hfdpTaPOyX6lPzxJj9IlihWEu4ag5fj7SiY8NdL511vNE4RSuP2YQ5RdophKmbvb82zN
         thuZJpnA0h9vwpmEGvecX2bsmBdOgYMzspRxAGVwxV2he51vmo5rQbP4mc+l8CeZKSXs
         C5sB41/+GvoIiH737dsskjWgF0LsV1fSqaY7gxM0wVpamIA1mKzm1j6evnQqBOGIechY
         8o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359903; x=1777964703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NrgBRjQ2GGFMMmDIxB6aUAm9LDfxdKYONIhnxtB1vo=;
        b=DnkKMlwNsoo4ohyqG7TABmO7EPMqn1d+meOwuQUKTExjHIWiJL2ThicDFjP+80bb+b
         7/zrF3IlLZdWjDNKZq0MawIFeK7ol8CrmHsn+b2J1MFNv0IN7mYPGoQm0eaDx1mdRxP7
         bF2y/TIjmLp+ee4qAimD1gNdLSFZfDxAr+nUVzatffn3na8l4KZtqLyazh1Y54vfarjf
         ++A5Hqyg3zKVhKnHZo+ZLWDTzkHDBtCiQHIRdqeUzZ0cCPW/KNCa0Y8ZjcHSpnbIL+Aa
         AenydILgYsHbnOq1xuSIqeGOlBxrGyxXRj4YBgbgZCMAtOdPTkBFUl27MR6k5VcHmNP0
         siWg==
X-Gm-Message-State: AOJu0YxkxRt1IvCWj5pH5mCf2Cm4yW42ckYkRGn8RrnvIdbrN2Bqg87N
	2HSJuDrGtvWBTCBt3PSDBomChEWPk26J1zgOkIObBjZuUnzGvMmC8kSylirRPICJvtqQ+TS4dKg
	NdcEp
X-Gm-Gg: AeBDiesdwErr6aYdudjPs1STlgCQZrn1i241Ba4ASRri580wwlaqynz8oRTih5iLOra
	69ogyGqMy2GXkpaqxtKy4Gg+eT9rWc38olclWpGUdHvhCQTmtFZ+G2B31wh88AakYxJ+UwQ2zo3
	NzEuZMBgZvzGKH0SUcldwDGMxeSxh3GVnoyQSwHCQGJ9NzJ9Lg2GIlbBVRFwZEQSdTmSU6jsY4q
	49l5lcQedfmTujymdfCK/koIUZDAprmGAd2HudiLJZztPlQSwqhfFLlT2mCLpNlocn/0wpey9ng
	RjEU+03eCHU0+qKpEH1rqawRFhyjcBfSIZYIVIr8EDZ6mSbL0SGv2DgfhImhAO+CtUDkDOwr7fL
	4wOBfEmg1sOpWOoB60nGpETSNGzNEgUnrjxC5aDNfCm+FDiKjG5QKXnP3IC9ALiDLCPW+a1D1mH
	nKwDCPmnth45RrDriFN9+JcYrnWTl/+i6Myv67OLqqu6dHkK4FLFlAJzDYNbTKDg==
X-Received: by 2002:a05:6512:6181:b0:5a2:a36f:3ef4 with SMTP id 2adb3069b0e04-5a74661fc35mr836891e87.31.1777359903056;
        Tue, 28 Apr 2026 00:05:03 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e0d9bsm4765121fa.6.2026.04.28.00.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:05:02 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [scarthgap][PATCH v2 2/2] ghostscript: fix build with gcc-15 on host
Date: Tue, 28 Apr 2026 10:04:47 +0300
Message-ID: <20260428070449.1820616-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428070449.1820616-1-mikko.rapeli@linaro.org>
References: <20260428070449.1820616-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 07:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236043

From: Martin Jansa <martin.jansa@gmail.com>

(From OE-Core rev: 02e282f6417274a93c6f01978bf33e2d171297b0)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...Fix-compatibility-with-C23-compilers.patch | 67 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch

v2: add this patch correctly to SRC_URI

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
new file mode 100644
index 0000000000..78f3fc1c34
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
@@ -0,0 +1,67 @@
+From c595086bfe206776676e290df98cd09e91210e27 Mon Sep 17 00:00:00 2001
+From: Alex Cherepanov <alex@coscript.biz>
+Date: Thu, 3 Apr 2025 17:19:41 +0100
+Subject: [PATCH] Bug 708160: Fix compatibility with C23 compilers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* fixes:
+  http://errors.yoctoproject.org/Errors/Details/853021/
+
+In file included from ./base/genconf.c:18:
+./base/stdpre.h:348:13: error: ‘bool’ cannot be defined via ‘typedef’
+  348 | typedef int bool;
+      |             ^~~~
+./base/stdpre.h:348:13: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
+./base/stdpre.h:348:1: warning: useless type name in empty declaration
+  348 | typedef int bool;
+      | ^~~~~~~
+
+Upstream-Status: Backport [Partial backport of https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/base/stdpre.h?id=ae940946473ceb8c5353bc6e7f04673c6e60502d]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ base/stdpre.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/base/stdpre.h b/base/stdpre.h
+index dda30b6..2f9c84e 100644
+--- a/base/stdpre.h
++++ b/base/stdpre.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -341,7 +341,9 @@ typedef signed char schar;
+  * and the MetroWerks C++ compiler insists that bool be equivalent to
+  * unsigned char.
+  */
+-#ifndef __cplusplus
++
++/* C23 has bool as a builtin type. */
++#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
+ #ifdef __BEOS__
+ typedef unsigned char bool;
+ #else
+diff --git a/base/gp.h b/base/gp.h
+index ad5bb61..cf2c9cf 100644
+--- a/base/gp.h
++++ b/base/gp.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -646,7 +646,7 @@ int gp_fseek_impl(FILE *strm, gs_offset_t offset, int origin);
+ /* Create a second open gp_file on the basis of a given one */
+ FILE *gp_fdup_impl(FILE *f, const char *mode);
+ 
+-int gp_fseekable_impl(FILE *f);
++bool gp_fseekable_impl(FILE *f);
+ 
+ /* Force given file into binary mode (no eol translations, etc) */
+ /* if 2nd param true, text mode if 2nd param false */
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 57a1098521..f7e1de734d 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://CVE-2025-59798.patch \
            file://CVE-2025-59799.patch \
            file://CVE-2025-59800.patch \
+           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
-- 
2.51.0


