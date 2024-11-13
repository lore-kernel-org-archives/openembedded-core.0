Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E76BD597CF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:28 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.3411.1731467780728250017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dezc/FUk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e4e481692so6320111b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467780; x=1732072580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgmi3zye11u4Jknej3KSPscg3nmKb8YPUOe6Vi7OrtY=;
        b=dezc/FUkL9M1W5rN9XSqZ69hWbKTYGFqlsxX0VrsERmQfEZ48IfXAdFxO/r+YOaMX7
         q5MlH7zyzuQQAfCKQAw/RQs6phDUJLPAH0ZEuIVnw6kTxM7zm04P9YlmVwCBkeSxlrRP
         eHtl5uwooShPe5nmKvRy2Z2Dc3UHWMYTgcuP3Dm3daLVDenqXE04Tl5ytkiZbRdhkf/8
         4zq9d34J8eqJD4slo8t+cHsus9zjWMrlKF1vpi/tSCSOACPvpw1mwoAFTKVkkejdXGv3
         ogrQq5gZzmKrLLUQktft1lfCEG7nwMgcbvxKJJ7V4DW4DmRwW4Ywz8nuWREDq7heiTAP
         7izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467780; x=1732072580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgmi3zye11u4Jknej3KSPscg3nmKb8YPUOe6Vi7OrtY=;
        b=Eo5IhBcMwO03N6Bpcd5u6IauTLdiiYENBV38RArt1pZvZhBnDLp29anDRjG4pBHhQB
         IPGCrBfS/AyvQ7FARXco4mI/Dkx43Vf8Xvz8ZIdH/5MOmd6H+qsAoWpGUbJfnrxRaV/x
         XXWjRaqU3zJ7xNg/hTVPFSi9rZEjSovCXvmrp+FmSJdaeeDrlef4dK4nLH/04kqQom0C
         GeAFd+rFQUF0TJgG/p5ydqkFjHbsfU31h3awIZf/+Gy4JSWtqSoZezjcvu+bsvZc5gbw
         3a2r9hxIj+sMiyc5RjQfiuR/cgz3Omc8JTG8xegFhZNu4qk3TPlnVCtG36vZa5e8CcXt
         aXdg==
X-Gm-Message-State: AOJu0YzzICN1RfFvEaYZDHDs8kZz8VJ43dfNTyecW/ygjCtsO75BogYq
	gDnThypGht/4qZqYAGWeDmHB2AGMFhw2+NkILQJ2+thaYiqT+U9fKCCKdUbWmOiMa9JPBuMyyoA
	I
X-Google-Smtp-Source: AGHT+IEBLnQ8DaHEXQel7vYjRCW4oQ4kPw8mkgyG0jfwLuE8pO7MM7Bk2lxrgCqnNf/s9bLK2Evl6g==
X-Received: by 2002:a05:6300:6387:b0:1db:ecd6:fb41 with SMTP id adf61e73a8af0-1dc2294ac6emr18935306637.15.1731467779689;
        Tue, 12 Nov 2024 19:16:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/19] ghostscript: fix CVE-2023-46361
Date: Tue, 12 Nov 2024 19:15:54 -0800
Message-Id: <3e9018fb14466495be7472a8620918347c732e86.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207074

From: Archana Polampalli <archana.polampalli@windriver.com>

Artifex Software jbig2dec v0.20 was discovered to contain a SEGV vulnerability
via jbig2_error at /jbig2dec/jbig2.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-46361.patch          | 32 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch
new file mode 100644
index 0000000000..d91a94e9d0
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46361.patch
@@ -0,0 +1,32 @@
+From 44ca5b9d023e1de33fcb8984c85bb29619c4db7e Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Sun, 5 Nov 2023 12:21:52 +0100
+Subject: [PATCH] Bug 705041: jbig2dec: Avoid uninitialized allocator in
+ command-line tool.
+
+This fixes CVE-2023-46361.
+
+CVE: CVE-2023-46361
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=44ca5b9d023e1de33fcb8984c85bb29619c4db7e]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ jbig2dec/jbig2dec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/jbig2dec/jbig2dec.c b/jbig2dec/jbig2dec.c
+index dc1fd56..78c8e89 100644
+--- a/jbig2dec/jbig2dec.c
++++ b/jbig2dec/jbig2dec.c
+@@ -567,7 +567,7 @@ main(int argc, char **argv)
+ {
+     jbig2dec_params_t params;
+     jbig2dec_error_callback_state_t error_callback_state;
+-    jbig2dec_allocator_t allocator_;
++    jbig2dec_allocator_t allocator_ = { 0 };
+     jbig2dec_allocator_t *allocator = &allocator_;
+     Jbig2Ctx *ctx = NULL;
+     FILE *f = NULL, *f_page = NULL;
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 969e637f5e..9f368a291f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -56,6 +56,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-29506.patch \
                 file://CVE-2024-29508-1.patch \
                 file://CVE-2024-29508-2.patch \
+                file://CVE-2023-46361.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


