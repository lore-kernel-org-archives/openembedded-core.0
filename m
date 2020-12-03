Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.9897.1607002658871231064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ieOgKpgE;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n26so3496140eju.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zh46PgBlRUN1YdtAb2XurHsm80t/aVLd6U7mWYeWkC4=;
        b=ieOgKpgEimf5cfompCC7NZ0APf79L7vc5w0SZyS9+B4YiKpX9lHZcA7ZPMxydsSdnI
         JjJWxils8G0iKkJ5qCQNVseAPQKyfLdwCpXTWtxcKd2qF4S50KTPcG+GVWoLM0Oj5e0r
         vjhn2Dn+mrmmD7QLA5IOx23j2HlNvC6poN9OOfsjyAbT/OuSUV8nmuD6vXPCvFSO3Vth
         cglhZpBzFlhskFkLl/EAdBB5Nx1s6KUGB0ptZ/++AblFSentIBP8cXEA4cvfDVjpH7zx
         MHPfe0eQ0xu1ssxjG9zMy2+LE7xH0fu8l7ueq7JQcPYYJbwlrL2HHuMH9tqaWNC7/HKT
         UjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zh46PgBlRUN1YdtAb2XurHsm80t/aVLd6U7mWYeWkC4=;
        b=QbbsnoyIDWmNHyk8UgXn8F+A4Znp+Z4yFcYHWHSMGdVasxV1ooacK2yeeVkxq2Ca2V
         Y8u9FqlqgeY2fQDPBw+ZJLmBhHRlXJL3ra1UoyTlw/FfDQeapQb7G3wuLqu2HGGHA80x
         4+2Obmo0f3a2PyR+FoDMe+3lhpCFB9dMg/tgC9MLTqu+xQMxW67IuV6skAN47+Q9CECP
         vEnJtdt0sNLuneA2WlgF3m60Cqz/8tlwMMjVm+4SN+gpkeIAkZ6EZOOY89lsi8VNU3xq
         ev/XVSS7IfhmoubqhwLXxftLAzVqM5X0kM7HAWiofjcm9o89HWqHTTvD8wYQdkFREwNW
         kmOw==
X-Gm-Message-State: AOAM533mYnenga8X3cRZlt1Azqgz+0DdO98HWIPQnxLuVg0TkXlyuSie
	HoZimGly96Z4KDoDfEwIFu0kw24z3qm9RQ==
X-Google-Smtp-Source: ABdhPJyADua/rXov9zMoLvm2R8qhOiHoAuLx3lQsAz8j7XSCa8PEDGeKit9Mxnr5SqhQ4cn0YHbpmg==
X-Received: by 2002:a17:906:1405:: with SMTP id p5mr2480775ejc.282.1607002657181;
        Thu, 03 Dec 2020 05:37:37 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:36 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/11] llvm: fix reproducibility
Date: Thu,  3 Dec 2020 14:37:19 +0100
Message-Id: <20201203133727.12936-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 4c2d490315..b146d0e6e3 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -99,6 +99,11 @@ do_configure_prepend() {
 	sed -ri "s#lib/${LLVM_DIR}#${baselib}/${LLVM_DIR}#g" ${S}/tools/llvm-config/llvm-config.cpp
 }
 
+# patch out build host paths for reproducibility
+do_compile_prepend_class-target() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
+}
+
 do_compile() {
 	ninja -v ${PARALLEL_MAKE}
 }
-- 
2.29.2

