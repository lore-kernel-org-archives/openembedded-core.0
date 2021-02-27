Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1739.1614413894454345159
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 00:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W5Eanw3Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id u11so6536752plg.13
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 00:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P8weXiqThlq08vnrnGRajilgVBT1dh/276waCjL7p78=;
        b=W5Eanw3ZGfHL70nW2puFmEs7rPuohsFcNcY7LjGp9kE9aYtSFUtgxJ8sRg60nGwRrw
         8vG5Fa2LKZ4EOSDEgDX1ia7v4CQNmgDzetlfmajxpMq3UtNs3OmSaR9tMGfvjlDx2oBe
         X83dI3nkNGPv8FaMEgDvalngCi1P0aEXhllUlTJpA4SlGjn3WxKc+54+WLBy8Tb6gQPg
         rG0AZ6dLvLXE3kuBHQFYvGHOGP5XMOfGeig744Bgaxjcc0Hv0qABYXC1P/VhzPdapB3I
         LIra23999TSNJLp7TLLcK8G+9o7rAEV6/ijfwh6OMmILcqe8u5tDIAaatU9ZB2T6tP8/
         b+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P8weXiqThlq08vnrnGRajilgVBT1dh/276waCjL7p78=;
        b=Iocl9tZUEsc954jh8pTAy+6ZfjggtiO15Uhh9ecglx2Hy/TuBCpTWUdJKnOcZo+l0t
         NPqdqJH8jl7QZE3mYxefM/2phxLSFQ1H14U27qPdYUFYyvRgwZK7PRULhHE60ZCpTzcr
         8TYS8mdFOJ6ILGsc+ZYhxiYs8wYevhP+fFtbPm++nzRM/9zoymOVM0ql1ofAldmnxFob
         EcCjAOQa/66zE7zs45Y7aNh3doSCdSQdOkF0MJxhrQpFv19kakXeT08mQvDWF3PLoig9
         hi8UCaS5J69sr6Mem29Fo+O8qcsDFm0wc7sI4NOwQm21IStURaIVo4f/CcocUVQxGrzd
         T0SQ==
X-Gm-Message-State: AOAM531XvxHJrvDSOnv/CBX2fqWcSzx7Cmr+LQI93UIqMHOvtB2t0y2K
	t1pgXWvYSVR/zHg9q2sjJu7krTxnEQtAxg==
X-Google-Smtp-Source: ABdhPJw+7uJfVXpNLglCsir6/24WVxHqsoOkxJLO13+lARlFYSyU0uU+xLlCnXHSwSxxk8JcsHHtoA==
X-Received: by 2002:a17:902:a517:b029:de:79a7:48d9 with SMTP id s23-20020a170902a517b02900de79a748d9mr6655255plq.45.1614413893446;
        Sat, 27 Feb 2021 00:18:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id n10sm10849673pgk.91.2021.02.27.00.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 00:18:13 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] spirv-tools: Replace strncpy with memcpy
Date: Sat, 27 Feb 2021 00:18:11 -0800
Message-Id: <20210227081811.4076701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes warnings produced with gcc 11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-fix-strncpy-bound-error.patch  | 30 +++++++++++++++++++
 .../spir/spirv-tools_2020.6.bb                |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch

diff --git a/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch b/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch
new file mode 100644
index 0000000000..bc59faa37b
--- /dev/null
+++ b/meta/recipes-graphics/spir/files/0001-fix-strncpy-bound-error.patch
@@ -0,0 +1,30 @@
+From 1ba007583b83468494c4146bcb7267d863de6a7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Feb 2021 23:54:10 -0800
+Subject: [PATCH] fix strncpy bound error
+
+This patch fixes the following error while using gcc 11
+error: 'char* __builtin_strncpy(char*, const char*, long unsigned int)' specified bound depends on the length of the source argument [-Werror=stringop-overflow=]
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/SPIRV-Tools/pull/4151]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ source/diagnostic.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/diagnostic.cpp b/source/diagnostic.cpp
+index edc27c8fd..77c29d70c 100644
+--- a/source/diagnostic.cpp
++++ b/source/diagnostic.cpp
+@@ -37,7 +37,7 @@ spv_diagnostic spvDiagnosticCreate(const spv_position position,
+   diagnostic->position = *position;
+   diagnostic->isTextSource = false;
+   memset(diagnostic->error, 0, length);
+-  strncpy(diagnostic->error, message, length);
++  memcpy(diagnostic->error, message, length);
+   return diagnostic;
+ }
+ 
+-- 
+2.30.1
+
diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
index 4f45c68bbe..f57a7bd357 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
@@ -7,7 +7,9 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "b27b1afd12d05bf238ac7368bb49de73cd620a8e"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
+           file://0001-fix-strncpy-bound-error.patch \
+          "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-- 
2.30.1

