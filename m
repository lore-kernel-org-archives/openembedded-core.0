Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70368E6FE41
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109348.1766524978314327956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UuDQtcZk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f1bc40b35so90324515ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524977; x=1767129777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nslpJaQPR0Bf1gNrD81xGr4aTJKi+psK56BBI5gXJSU=;
        b=UuDQtcZkFgbvbQaLa6or97F0G5LGxsMtcBqOqAv3qCCb84KkzELKsCcxwBWGgCeGd8
         EAjWF3m6SCdCLF5VAMh9hvl+hKqxJN0vG5l2j5yXJBLMWtxWn3GbepFUzZ8lKPEd9q2p
         DX/vACZnPOyInWYJiiIhruxZDd9P4dc6ZEkzFK7tBP7eD/V3TLpv7jnFgHE01xq81HvM
         DuynCf2vtJ6sKcEu5f0ClA8Em3f3bQxFDrPQMgx+hEOcQ+rm+PQlKe0RVGfN9ZiVRKhT
         aLV63L4J1K+evZTAD/GlGZhsKDRiYK7/0EMSlmdKZpwsDzsRBZYuNUgF48ob16NeCv9H
         mHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524977; x=1767129777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nslpJaQPR0Bf1gNrD81xGr4aTJKi+psK56BBI5gXJSU=;
        b=YnFUOtpIyUPnK+0fav10m6XU202i/ODv3vlK3KVVl8zoO5uNmj/ylZmNu7HOxE77Cv
         F9Bu8npwHxrh8p6Tz2nv9IgyyLB46nFWn0Ut3oNad/Eu7hRYh3XiS+au+gniP2OGZwJI
         GIHbgital/hTZH4HOx9UVuNVyB2/4t7tYj68evfb1MtZr4g/kmWY/EV/3CKyBW3xDJ9W
         Tg4NWD6Mc1deahNykSlkTxPKM12msZG0O6Mmh9QdhGeEe0l6dfNvndQNSJxygzWZ1S4X
         wtaNkbPt1pJlL9acKm0Sd+xX14XVABNvyUSNiJkRXqCcoiiO6xTKEtuhCleZLP7vcXM3
         pjPQ==
X-Gm-Message-State: AOJu0Yw+XS8QfAvWk5te2OjNeprq4msCi0MWUtq4lOJX2M2PpusqUe93
	W1TokLYFaokajewKidAiIhJCogU5wbAXXFBkqxl2dCNX62+PRJr91B2St1fH0zBD+b9R6ITzGj2
	vA3BS
X-Gm-Gg: AY/fxX4UAFUvU3giPPISm4LILsMFzrKzABJ4QS5TRZWiDre4Y21TIIjaBbwIG81iI7B
	w347QN5u2n9TVo9m/9Z2y8DTdwdFH62EAxA4S1aol94kzW7idaJiendBIFAtw+fP0r+arr1kExz
	65YT9Jxvf5bFbbwGI4L1cm1YI5yI9U5cbJzSHT3DleMfoHXdwZd+OAMg1dcZR+Ou4tZTGer+Ep7
	MKIkB+kuEpGs21RNtQC/T/HoQNKwzntm744Zf0dS7kjKe0jIOMjbYFglE6M5JGSL6MB0zp7LJgJ
	qASZfO8dNFB0UKlEF2bXMRI5Yd956hZDgY9jNBHEWfgozkauEwAT2pdHVXy8k2i5Q9WQWGYU2oS
	4WG+Hnn1BqceFJjOPRPWbpM2UQFP4nEG/lT1fCrGLRsVk8mCC1L00h4CJrvtorfWwJLPQ4wnIRN
	0gDw==
X-Google-Smtp-Source: AGHT+IFy41hzndAlpZS4v6eJ9wJKhUF83c+UWZcCW5VqnSXIDIvqecfRqTLsT2lQMHhiabe8HiYNcA==
X-Received: by 2002:a17:902:ce01:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a2f2329badmr172973275ad.21.1766524977572;
        Tue, 23 Dec 2025 13:22:57 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/18] libxslt: Fix CVE-2025-11731
Date: Tue, 23 Dec 2025 13:22:16 -0800
Message-ID: <e70c70e0359418197699f18c9e2cbfd7ebac705d.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228484

From: Mingli Yu <mingli.yu@windriver.com>

Backport the patch [1] to fix CVE-2025-11731.

[1] https://gitlab.gnome.org/GNOME/libxslt/-/commit/fe508f201efb9ea37bfbe95413b8b28251497de3

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxslt/files/CVE-2025-11731.patch        | 42 +++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2025-11731.patch

diff --git a/meta/recipes-support/libxslt/files/CVE-2025-11731.patch b/meta/recipes-support/libxslt/files/CVE-2025-11731.patch
new file mode 100644
index 0000000000..19702af6cb
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2025-11731.patch
@@ -0,0 +1,42 @@
+From fe508f201efb9ea37bfbe95413b8b28251497de3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Dominik=20R=C3=B6ttsches?= <drott@chromium.org>
+Date: Wed, 27 Aug 2025 14:28:40 +0300
+Subject: [PATCH] End function node ancestor search at document
+
+Avoids dereferencing a non-existent ->ns property on an
+XML_DOCUMENT_NODE pointer.
+
+Fixes #151.
+
+CVE: CVE-2025-11731
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/fe508f201efb9ea37bfbe95413b8b28251497de3]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ libexslt/functions.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libexslt/functions.c b/libexslt/functions.c
+index 8d35a7ae..a54ee70c 100644
+--- a/libexslt/functions.c
++++ b/libexslt/functions.c
+@@ -617,8 +617,13 @@ exsltFuncResultComp (xsltStylesheetPtr style, xmlNodePtr inst,
+      * instanciation of a func:result element.
+      */
+     for (test = inst->parent; test != NULL; test = test->parent) {
+-	if (IS_XSLT_ELEM(test) &&
+-	    IS_XSLT_NAME(test, "stylesheet")) {
++	if (/* Traversal has reached the top-level document without
++         * finding a func:function ancestor. */
++        (test != NULL && test->type == XML_DOCUMENT_NODE) ||
++        /* Traversal reached a stylesheet-namespace node,
++         * and has left the function namespace. */
++        (IS_XSLT_ELEM(test) &&
++         IS_XSLT_NAME(test, "stylesheet"))) {
+ 	    xsltGenericError(xsltGenericErrorContext,
+ 			     "func:result element not a descendant "
+ 			     "of a func:function\n");
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
index e08e92085d..e33b1bb902 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -14,7 +14,8 @@ SECTION = "libs"
 DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
-           file://gnome-libxslt-bug-139-apple-fix.diff"
+           file://gnome-libxslt-bug-139-apple-fix.diff \
+           file://CVE-2025-11731.patch"
 
 SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
 
-- 
2.43.0


