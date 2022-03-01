Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E2DC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 04:13:51 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.4735.1646108030129994730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 20:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z5rqyGen;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 12so13418791pgd.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 20:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJURL1qqtDhi20aOhkKfjQ20ZTgBr25LaWLWM85AcFU=;
        b=Z5rqyGenytK42Wfz4X+X+yCimLBYKNtudg+dabXSHm8rIYmJf+qLGMA+0U8TrB22Cs
         tcxqVOHcrY77roVDio7vsK2UhVUWzMArvitHcAaFOzoctYnpsNAMdGNXvleCJKP7OIgz
         ZnSWFQuulgRfx/8WUYmZfLLLkaw2ATmSSLkDHg0j+mm1+yAu5nqrSGDC8M1kKXhUZje7
         ZDSb6oAuMYdCY3Ldd2G66+pttq9SWivH/oqbPTS4clK+QKIQXcD0UWQgwemzwyRH6bMt
         D0xRzBn5QNX2T7XWHxhyjdznsFG+2u4W8+9vx/Ijy6pl8DHeGF54hlafAPF0S/322g5i
         lCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJURL1qqtDhi20aOhkKfjQ20ZTgBr25LaWLWM85AcFU=;
        b=WgHkGOnOs4ZRrRtdh9ZoYO31rr1nloiK5X8+LZ3ozJMaqM6/3M+OTNxDc95Wz3yeza
         jz7/MQ6yTBOtsYFf6u0Lq/mNRmmZLYxxXjX7ZZff1qUR/dfY3HXCovcvWV2yvFnOVdOt
         kL1fEGPl5H7fG/zbCozxnJZ8ZVifFrthw2R/Jl7ZnVS9/O2B6Wpj0avJI7dR5pfx65+1
         iaNExTrlqdD6zJTzl3oJYWwJiPyOIvVfIV5OkbAk6QUgEnCGD2mdVbGrJg20PPiPRluW
         yMVqYxDaNIonIVAoHzbHoUWpHDmFZ5MjN3+ckpl0QPvVnXSOb3yogcdeRCeJGJFXbzJB
         C+cQ==
X-Gm-Message-State: AOAM531JCBJR2dHMFP3iVk8q/h4VibhNrhAkefnhIUMPR01S2Xh+ZOJJ
	2ZToJFMtSXe5yWkBJ2/2aaxawd2S5Bmzow==
X-Google-Smtp-Source: 
 ABdhPJzbIMjqEApDYc0CgjaXDhiLl00PNEim9UCVNYlugwroHOWrUwvuz73IXBvwUPDSpQh7xFTfHg==
X-Received: by 2002:a05:6a00:21ca:b0:4c9:ff9:47e3 with SMTP id
 t10-20020a056a0021ca00b004c90ff947e3mr25403501pfj.10.1646108029237;
        Mon, 28 Feb 2022 20:13:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 mi9-20020a17090b4b4900b001bc8dd413fesm765759pjb.19.2022.02.28.20.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:13:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libical: Pass TOOLCHAIN_OPTIONS via CFLAGS
Date: Mon, 28 Feb 2022 20:13:46 -0800
Message-Id: <20220301041346.1703440-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 04:13:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162523

This ensures that right sysroot is used during build, otherwise we see
warnings in build about using wrong sysroot and it fails explicitly with
clang

x86_64-yoe-linux-ld: warning: library search path "/usr/lib/gcc/x86_6
4-pc-linux-gnu/11.2.0/../../../../lib64" is unsafe for cross-compilation

x86_64-yoe-linux-ld: cannot find /usr/lib/clang/14.0.0/lib/linux/libc
lang_rt.builtins-x86_64.a: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libical/libical_3.0.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.14.bb
index 717eb11e125..879ad8ed595 100644
--- a/meta/recipes-support/libical/libical_3.0.14.bb
+++ b/meta/recipes-support/libical/libical_3.0.14.bb
@@ -18,6 +18,8 @@ UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig gobject-introspection vala
 
+CFLAGS += "${TOOLCHAIN_OPTIONS}"
+
 DEPENDS += "libical-native"
 
 PACKAGECONFIG ??= "icu glib"
-- 
2.35.1


