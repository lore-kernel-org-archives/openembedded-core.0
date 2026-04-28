Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543FBFF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 06:46:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6838.1777358775291720557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 23:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Da9cj0Zc;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38ddd8d3b7fso84690441fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777358773; x=1777963573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaXCxItamtiDu/3wfVe+Aw3vdEZKxtKhbdQeHOa0jY0=;
        b=Da9cj0Zchtyqh54iFpKQexLtmzPHcDU4RwyQxcwso7G2fB4bFjpXvEPCmqhfQIkQBm
         OJ92WLAcItazmMJepshhUn18kspBEmRXOADmbMSOC/uMxD2rHU0rsfamUQq+Iz4wW5u4
         pWpREQGvGVijZKSXmSmfG4CcXvm9bBkgnBacjP5DuCdRmssQ/Hvu1QSkFd5k0nP5X02r
         5VEXiSKhJ9jsxuHVb5dKUX4umADgKZkeSktRk7eBFg1RG3hvnbPGVufUnxnwETHELey3
         0Lsa3Gh8AcvrNk8yIQNRBFyZvg7rHW1eKufau1FJbaexuNsjdMOsFIV4pNfPDpNDYz0A
         7I1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777358773; x=1777963573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NaXCxItamtiDu/3wfVe+Aw3vdEZKxtKhbdQeHOa0jY0=;
        b=ltH8hbya8tWRJU/6I/GlnMbm/bjwfdHwvBE4CfDufvufgYDJWtPt2JkDTUUAV22Npp
         N70Pt3Qdl93PscuLL5TODxwUzKL7NQmSkGjSGM6LMrSfsXFcG251YvM1W5wWNH09TdCi
         GHyO/dDIBjdIcuXDA5BZ5q0s9CUa4qcJNM4VhT4hjIovb1wU6yN2EOinQnwBh3CSbZsx
         khVoVYmx3gJhJeMTWxofkYPhoudiJ6AEdA8Qqo+HN7eqn9UtuPCMLQSAQBPmijqYLagh
         a6vHgX55LRzS1Rj6Ybt/IwedzqRTdamk0ZDsJGjs9oiBuUt3lpH3R2UiidG6SU+cEKx0
         pq5w==
X-Gm-Message-State: AOJu0YyC/GiitJJeZN4JuD4a18KslbFqTHlZWrijypx9gf2szureltUr
	Mzdd+MpE9HSvBOYwE5zuj/S7RZlt/VexATkDVY/T8q0VytKpUIaFK8TUfvTPKLiFNbf3gVrTw4G
	8h5MQ
X-Gm-Gg: AeBDietgiD8cg842msY0ayj9CnGMGFRHguxT1qu3wHvAssSuGrm3JGlriseZ/VTKmLD
	br+7QsROdnBzikEXsmPsjqki3xTNBi0RS/N2EIFPsmHPUSQOApCR/s4oAf+B7Dk2GvnTVjS8qUR
	Y9SZo8QdBdN1qWrtTpcwUwLSgCDMce6KHrugrts1mCHW2mMyVmUfaL4lETpfFpdb9q57OLTQ4si
	/qJbQE/CXFWUNaff9Qpy+SrY6NT2sMM2Jo11Wz9UBWOEfPaKSXJT4RD6t6za3gCTdEH++mMOkTR
	/4p70JNFfOuxIwuzbLuef2NDWLOQAQXuEaGWW+JoozVBJeLiaG2dlbquYTaKsX/H63Crp7PId3/
	m8ibi/qRFTBveeyVVw1edbfcPh+eSrf8zXUjWgpYs7Zvt+GZiTEJsk49rx9Oczgqqe/l2SnIX/5
	qUcPLMH7skEDhZJegj9KwKpn8J0YYCeXNm9jrURKPYDsDfz5y7ashD94JUyIrS/mEmEiSIo7G7
X-Received: by 2002:a2e:8a86:0:b0:38e:ae31:f0ae with SMTP id 38308e7fff4ca-39240b4f0a1mr5461571fa.0.1777358773254;
        Mon, 27 Apr 2026 23:46:13 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f34533esm4415911fa.16.2026.04.27.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 23:46:13 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [scarthgap][PATCH 2/2] ghostscript: fix build with gcc-15 on host
Date: Tue, 28 Apr 2026 09:43:20 +0300
Message-ID: <20260428064329.1591381-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428064329.1591381-1-mikko.rapeli@linaro.org>
References: <20260428064329.1591381-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 06:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236038

From: Martin Jansa <martin.jansa@gmail.com>

(From OE-Core rev: 02e282f6417274a93c6f01978bf33e2d171297b0)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...Fix-compatibility-with-C23-compilers.patch | 67 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |  4 +-
 2 files changed, 68 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch

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
index 57a1098521..8f132d55c6 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -25,9 +25,7 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://CVE-2025-59798.patch \
-           file://CVE-2025-59799.patch \
-           file://CVE-2025-59800.patch \
+           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
-- 
2.51.0


