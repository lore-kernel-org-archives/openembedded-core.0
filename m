Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465FFC25B78
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:56 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.61057.1716212034182707528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0czjCuYI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so76875615ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212033; x=1716816833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Un06W+P6q0q/EWD8nzbpt/TVBNssld/q56Ltc0iPjEw=;
        b=0czjCuYIVr80ecSjOLKcuzur+/1Uh8OWP5JYorJnOxg2IkXB/SJ/c48DATqqCV3y1p
         SSSrwnOHegsT21X8irt60F6O9TJOqgzo4bhB2YuZJvEWCi+hQ1519ntV62dvRuRrJPUp
         LAxS57zelu/vJWlwLCMqEFOn2cLBfSkR5K9ToeJ8oPf2Xa91J93GnmWG/6HeE0xhDNpl
         ibTAksTYez7M2f/NC1CH4ZE4MLb+IHF6punXbSq5GaMfmf9Pj3YblkM+PvqdtpAaXzMn
         9/AHaIrblcSlE3V7YfcISqdDfPIHC0kKx4+wmVpJv90bqks4FHdbhNi/QtSJNVD6YDzE
         hKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212033; x=1716816833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Un06W+P6q0q/EWD8nzbpt/TVBNssld/q56Ltc0iPjEw=;
        b=cioQ2g3mbPH5D2d5rR3lWkL28+/NkfklLtG3u5s+GAhtKNuXfx8lLv8sO/Z6h8uIVJ
         0NyUPsf2ZnyLcYfamShUvYQ5uhw/xkkrcdF3r80uMX5CPxUlWEJ+q3x/YDwvTTtSwG8e
         RK3zqKw0tdFGXqWf2tnVL5nE4+lmnc/91/EVhqX+Nyd7pM0vP9kRMR7Js/6b2efyBk6N
         ONma/+5hJ6Um10bQkKoCHFCfoNpWfImOKpQnVXXRTqLYUyIN8n4qUpWGc/D7+u8UDv1L
         4aeihzVDUWyMSSSNnUaOh767rdUjB52tPROdD9+5GGixfv568F7w0lJ8+2BJ5R5dw2oH
         RjtQ==
X-Gm-Message-State: AOJu0YxUKBIUutxMVp45G6FNyydfIsHsR/b6+aiqbIIOFButK7zWLZ1l
	Xo5foogTrY6dT6e8tTn0KhNCwFvAhP+M2zJVgZyNdHsYFbqeTjiULUU02sRO3qW4mabEuuZ58F+
	G
X-Google-Smtp-Source: AGHT+IH5muBqfe5lqgex1ClXPGpH3x/e/sYqCkCVUF/OPZBDIbUV7do5D22EvjCWk8owabvLzsjHiA==
X-Received: by 2002:a05:6a21:1518:b0:1b0:9b7:bbe3 with SMTP id adf61e73a8af0-1b009b7c0d3mr20612135637.0.1716212033499;
        Mon, 20 May 2024 06:33:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/21] go: Drop the linkmode completely
Date: Mon, 20 May 2024 06:33:22 -0700
Message-Id: <941c8535eaaca5790c9bc2b3d21d8ce402dbb431.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199582

From: Jose Quaresma <quaresma.jose@gmail.com>

This will make possible to restore the default dynamic linking globally
which is what we had before the 1.20.X release.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ad90fc2fc49c4199a59dfb1c1d81a7ba184a522)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/go.bbclass          | 2 --
 meta/recipes-devtools/go/go-runtime.inc | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index cc3564c36a..d32509aa6d 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -48,8 +48,6 @@ GO_RPATH:class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
 GO_RPATH_LINK:class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LINKMODE ?= ""
-GO_LINKMODE:class-nativesdk = "--linkmode=external"
-GO_LINKMODE:class-native = "--linkmode=external"
 GO_EXTRA_LDFLAGS ?= ""
 GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
 # Use system loader. If uninative is used, the uninative loader will be patched automatically
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 3f1e795dd9..413cf6d33f 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -15,7 +15,7 @@ export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not f.startswith('-fdebug-pr
 export GOCACHE = "${B}/.cache"
 
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
-GO_SHLIB_LDFLAGS ?= '-ldflags="--linkmode=external -extldflags '${GO_EXTLDFLAGS}'"'
+GO_SHLIB_LDFLAGS ?= '-ldflags="-extldflags '${GO_EXTLDFLAGS}'"'
 
 do_configure() {
 	:
-- 
2.34.1


