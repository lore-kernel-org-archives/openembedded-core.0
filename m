Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3A7E6FE53
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:26 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109034.1766525180669847808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=groCU7dj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d52768ccso66749835ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525180; x=1767129980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4o2Pq5UFJoWs50ZUfiD1Jc3NzgOpLpteqP9wgIjLi1I=;
        b=groCU7djKV+ynpzosqAktRpX0jrI/dpAvGdHfOrBRLkwYkI2dsZQu6p8QJW7lyVyOZ
         ya4NixIqwN9qqjWSdd4N/sa6AjpvAKv0or01K7FHfW+GK4QjjuJ06mMZgBlX5JKNLenR
         N5owsOtPx1gdLRhtH4301Y6C81j4AvvMFfQuidqDVT71Pci2ZFZ4bDjQCKycCdijdJ/w
         LP/WRd9ZvgEpkja++apySgCs5cTS99XYqNIU3AwaRN6jJSXwqQceV8mvQH081c4/Ck/W
         fQXJvcBHJvbt4blHKb7tx0VbqnpBwtgDfE6tepe6TOfhU74iDIZQnf/eP7jL1MwVFWy8
         ZU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525180; x=1767129980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4o2Pq5UFJoWs50ZUfiD1Jc3NzgOpLpteqP9wgIjLi1I=;
        b=s+TVGdlHB+kTYwdo1bwqql0vgraNaB80y9/siG0MbQ3+zlvX2HxIQbaEdSqFKzoWEW
         RlDF6iujASkaO8su8kn+K8ppoen079lKfx9lUxEUFwxq9KVqxhCgeMoQFAZO2HdbMeno
         f6k6TfGnZ83YOwBkO7KME/d4Riv5ij0ihvhuXp0JZacVoM0KjUAQ7HhEIwKJ3D24y4it
         GXmR+FukkW4L2NkDExHH8VlfM1CTNImH4k8PoX/4vcwqZ0tR05eYwjh5owVwXoIh+9Zb
         hYE93yYpjqtSUv45UE0YttZaq9Y2zcE+HNk0Dibdfaat70K26gNfQb0MegF7vFKI2nVZ
         WBLw==
X-Gm-Message-State: AOJu0YybJtN7C3AkSjgTTS4UgOrlyLscYMDBC5SjvDL7tjEFIGxyEppU
	F8qOdQIQDchyYyO055xVqYkuD294xMHGkSPQJauz0sTKLlhBVeMZ26bMlfVFzQSS+HbnTscdiNA
	kmoVs
X-Gm-Gg: AY/fxX51wGqeLS5GEWXHaYvZEz/oLb6Ax5dnXY1P3frx16XdohoYSoj2RvtH+DiJgOp
	oGDMYCxhuljqtT4O7/eEG2VbsSXRH+CMWx9CqYsnvbLdhfGNzKP+5n1tdC1ajyIxqQ3whDLmN9j
	Jj/M8EnaP6R57Q6ao9qTIAedvA1IL8u/XeMOmdUyRVIUkUUu0dFcJqt9tenE1vJyLUW/VG2c4mw
	qPcHaBihNTXnUHx+1Hydy79sIHxqQ1S09HqJa1Ti4pUvfH4vVsKSLc99nzIab/dM4i5v1oJhpLN
	F5ImSkBIEUVUjZDr9SdVW2qzC4rDrrzBkBxvxqwMPMhxfKOacS93ImvZmpgXzZ+6OKRc9JPimss
	M22PC9FaY63eieCcvqFyczANFah3eiyhd/FWg1jtkKwtekXOitLQ2hS+i4OfzZ3xLwHxmLn+EsD
	k1Rw==
X-Google-Smtp-Source: AGHT+IG6adf+cb2IwDnTSK6+EbjWvG+VCgPlov0zBVOMvOJt+Tc8w9hjhaFBuDer2Yr/CD8IKbo1rQ==
X-Received: by 2002:a17:902:ccd1:b0:2a1:3dae:8f22 with SMTP id d9443c01a7336-2a2f2a4f425mr152698495ad.61.1766525179912;
        Tue, 23 Dec 2025 13:26:19 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] libxslt: Fix CVE-2025-11731
Date: Tue, 23 Dec 2025 13:25:58 -0800
Message-ID: <7196077d84cc8d49652b0d6b54963df579ab1a0b.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228500

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2025-11731.

[1] https://gitlab.gnome.org/GNOME/libxslt/-/commit/fe508f201efb9ea37bfbe95413b8b28251497de3

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxslt/libxslt/CVE-2025-11731.patch      | 42 +++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch b/meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch
new file mode 100644
index 0000000000..19702af6cb
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch
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
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index fc1fafbf19..4f86069d77 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/libxslt/1.1/libxslt-${PV}.tar.xz \
            file://CVE-2023-40403-004.patch \
            file://CVE-2023-40403-005.patch \
            file://CVE-2025-7424.patch \
+           file://CVE-2025-11731.patch \
           "
 
 SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
-- 
2.43.0


