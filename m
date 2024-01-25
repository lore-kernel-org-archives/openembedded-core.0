Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268C9C46CD2
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 00:05:31 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.3994.1706141127843626943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 16:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LSEfwzUv;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6dd85328325so1953042b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706141127; x=1706745927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3IRDjjtB3EMfRUBDCTzr3s5b/6DSRX6iF0VYuU0i0Ec=;
        b=LSEfwzUvW7qyhHx4Hd+QrGarQ1BBeZRHabmXMy3O4MeSuRyqOnjhcHGdgEnvnOZWKe
         PlXe2vE0OshUaOJ/CDjUvYt9K/nK+7YRti25pi3Vg/vSVgtKHTjwbfdYwgk1qYfOTIrf
         e548gt5kgz7r2NnegCCOevyDg7VBrEJ7FNNa6m8718mGq3sxVOZIe8cRkxXhXiOvXEt7
         oGh3wNJBsk1kcT4/eSsOZM2CLFwlAgORW/TgiybO1tQmsHGdsgWwye3gZN3Rt7Z08XIA
         8k3NPGBeGmD1dIRhykx3zpC3gIhQurHjtkCoOyekyF4oWAVvLSbnj8oAJ7OLKcRg/yJR
         b6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706141127; x=1706745927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IRDjjtB3EMfRUBDCTzr3s5b/6DSRX6iF0VYuU0i0Ec=;
        b=AzOocWGz4ETm38zwDi0jf8fehJdleHSV7j5FHJfZIO/8267ztZZqY7Lw+SJWHDQBkd
         xhsQyhYctqhKgXsv1cT1zJX03ZAAwko6atgzwZFlmPOCDijDNSKnn9aB/vZByZYY2ddZ
         dr5Uv/2yqeAU5RPMkAvK7n321h83sOm58DTkKVDzvN4iiHojuzM16LGvo1EJQ7UvRmak
         0Hd+nR7y/yIeHD+hhxsclkhPg6U+YemMnM0D6YHiEmLRPabqBs3E8TAJuXLnobb22ThN
         6pEAQX3O0H/YNrPU0HRIiOkMs50LqVeBmgr4tpGVe/kJl3Lsku42Ff3/FjcokCLhIOQd
         4cpQ==
X-Gm-Message-State: AOJu0Yx2WD4LRjYIzpKID2X6ydzVaEvNizjdLlTuMxcU1giY1NWYRonO
	EG7ZDuA/1DEslx+xXg2bNp4pMNNXm6iha2VgJTyto1p3/koiRYuqgE6AebuPgPs=
X-Google-Smtp-Source: AGHT+IGzfx3dXf6J5hM+CSfEXxtpcrX57FqZbv+TPA0D8kQxLnNBDEVDD3j6CJVYqs9PmRta4Z7kHg==
X-Received: by 2002:a05:6a00:1da1:b0:6d9:a32b:a27f with SMTP id z33-20020a056a001da100b006d9a32ba27fmr10585pfw.45.1706141126975;
        Wed, 24 Jan 2024 16:05:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::907b])
        by smtp.gmail.com with ESMTPSA id h20-20020a056a00231400b006dacfab07b6sm14351666pfh.121.2024.01.24.16.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 16:05:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3: Initialize struct termios before calling tcgetattr()
Date: Wed, 24 Jan 2024 16:05:24 -0800
Message-ID: <20240125000524.2245253-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 00:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194300

Fixes ptest failures on python 3.12

    Failed ptests:
    {'python3': ['test_tcgetattr',
                 'test_cfmakeraw',
                 'test_setcbreak',
                 'test_setraw',
                 'python3']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lize-struct-termios-before-calling-t.patch | 42 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.1.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch b/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
new file mode 100644
index 00000000000..141b708a678
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
@@ -0,0 +1,42 @@
+From bd0e1bf1504a5cba12133548bc49f1fcaf7b4da2 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 23 Jan 2024 23:02:02 +0100
+Subject: [PATCH] gh-114492: Initialize struct termios before calling tcgetattr() (GH-114495) (GH-114502)
+
+On Alpine Linux it could leave some field non-initialized.
+(cherry picked from commit d22c066b802592932f9eb18434782299e80ca42e)
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/386c72d9928c51aa2c855ce592bd8022da3b407f]
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst | 2 ++
+ Modules/termios.c                                               | 2 ++
+ 2 files changed, 4 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
+
+diff --git a/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst b/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
+new file mode 100644
+index 0000000..8df8299
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
+@@ -0,0 +1,2 @@
++Make the result of :func:`termios.tcgetattr` reproducible on Alpine Linux.
++Previously it could leave a random garbage in some fields.
+diff --git a/Modules/termios.c b/Modules/termios.c
+index c3d96cc..402e6ac 100644
+--- a/Modules/termios.c
++++ b/Modules/termios.c
+@@ -84,6 +84,8 @@ termios_tcgetattr_impl(PyObject *module, int fd)
+     struct termios mode;
+     int r;
+ 
++    /* Alpine Linux can leave some fields uninitialized. */
++    memset(&mode, 0, sizeof(mode));
+     Py_BEGIN_ALLOW_THREADS
+     r = tcgetattr(fd, &mode);
+     Py_END_ALLOW_THREADS
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3_3.12.1.bb b/meta/recipes-devtools/python/python3_3.12.1.bb
index ece7539c51d..1d3a4221c32 100644
--- a/meta/recipes-devtools/python/python3_3.12.1.bb
+++ b/meta/recipes-devtools/python/python3_3.12.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
+           file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.43.0


