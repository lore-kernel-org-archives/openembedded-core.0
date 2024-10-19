Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BD2D3C923
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 18:48:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.11589.1729363712282883911
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Oct 2024 11:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lT/ZmdFT;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71ea2643545so1637837b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729363711; x=1729968511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMSsURNUbxVpA//mVMRGTyjvnWTsEsEfnWldCuOR24k=;
        b=lT/ZmdFTsc9N7jjUOX9lZ0NjD7AItNakA6quJyQuDI8Ae4B/jSTF/MUjjM1RkZVrvP
         SeJToKPxVv45JraUCng+wSIxNNa4jYlMNeXL7XpXZXGwIlTQGJJLZCCXqHroT6UHxERc
         0x15g8l253Q3SnuSdl/uCRpU+pdnTd7dEMT8m9pZEZ5EQQ/qiSaRvT2YCv7zwRXafEix
         uBzylXLf8pLlF0ohOd30r+E1XAsQVccTNh2JuAjB+8NTV3a4LNaPF10WG6Zi9ss6xQvu
         th8MIkWu81IoDwK49u7pB7nB7JiIFdvxssr/sTPdccmr2SqZXav6I+qN92qFuVHBbEWk
         l2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729363711; x=1729968511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMSsURNUbxVpA//mVMRGTyjvnWTsEsEfnWldCuOR24k=;
        b=YWx0GJgOLU3Z+9Q/zmsDGa6CDoPH80ZwS4Spi/fKR0Wdsf0L/ZU4H3CQ+hOUHQqAO7
         gMM6430ptcLl/MzJNI64IWwIcWNqar30fJW/GM9XwadlMTnlO8sGBqbFEwVG8DYy0BB2
         7xmVSTay6AzDhCtaXEELSJX+cCBkdbr/h5c2dYZ9+3vl6xkOXd+DWHzZBRI/VRrq3Kgw
         cMzeH7jQi+8xynpiKCY1jKvWd8q9lS7cTR/4q2j7wBvI5mezuKtvRb3Q9/SqJ6olImxU
         /VXz7Zulm6r3wkmgmAI74eDQPKQAdyEd0CYA75h1I6PsULib9Dr3Ba6bvpIt+jCjFo8m
         9+Ug==
X-Gm-Message-State: AOJu0Yy9sj/hccrCDVPGRFlSTRSqgH3qcb9i/yTFs3JHqbpy31vcBSCl
	RpHl17PZIgJMVJ9zKn0oJDGGIlVkvHoC+DfTa0RBUedAYRuEPp3eoFO8FXUZ
X-Google-Smtp-Source: AGHT+IFr01BiQPUV1APlSFjcc9MQDrQHkO4o/btIiNBQc987pmXW8KOavUPDrLUbi+/jGYLMJ1LliA==
X-Received: by 2002:a05:6a00:140c:b0:71e:5150:61d6 with SMTP id d2e1a72fcca58-71ea31d290amr10004837b3a.21.1729363711494;
        Sat, 19 Oct 2024 11:48:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6310])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d73f5sm61825b3a.104.2024.10.19.11.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 11:48:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] python3-libarchive-c: Avoid using find_library python API
Date: Sat, 19 Oct 2024 11:48:24 -0700
Message-ID: <20241019184824.1338594-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241019184824.1338594-1-raj.khem@gmail.com>
References: <20241019184824.1338594-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 18:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206086

find_library API depends on platform to provide ldconfig, ld, gcc, objdump
etc, so either we add these dependencies or avoid them by computing the
libarchive library name during build, which we can be done.

This ensures that ffi module works with musl as well as glibc equally
as musl does not provide ldconfig like glibc does

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-libarchive-c_5.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 3116c6b62ec..510e2d9159c 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -16,6 +16,14 @@ inherit pypi setuptools3 ptest
 
 SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
+DEPENDS += "patchelf-native libarchive"
+# Avoid using find_library API which needs ldconfig and ld/objdump
+# https://docs.python.org/3/library/ctypes.html#ctypes-reference
+#
+do_configure:append() {
+    sed -i -e "s|find_library('archive')|'${libdir}/$(patchelf --print-soname ${STAGING_LIBDIR}/libarchive.so)'|" ${S}/libarchive/ffi.py
+}
+
 RDEPENDS:${PN} += "\
   libarchive \
   python3-ctypes \

