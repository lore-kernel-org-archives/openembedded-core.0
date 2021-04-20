Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.9605.1618920364704268929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 05:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sSzfoHi5;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id v6so56599191ejo.6
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VwehTW44/FYJZtO7Mrmv+p4+FWQf1QcNzah0fOdfUTo=;
        b=sSzfoHi5P/MIS98MpR88YevCyNnuj6jkEUf8MhmArxQqGdcBSRgm7R4mCVbp8ZwLJ8
         F/W2igVBjYf+Bf/ekBNjERPUw/mWBG+aX0kn7ZnSRAfwog+9skFIC9T89aH/pCysr4P/
         vcC6U5CKtbT//8iGpbNZ57J92wWzGPMuOFlHfC6oSq671bFtHOpKIZZH4SrvyFC32KoQ
         T8d0X6+ZMBXr6WXJo3z5N6DvZUnQTgKtXO9edWI7Cl9F5IXSr3sgTW3ad9zONA6WO4Hb
         QnkhxlNBa2nMwbR68Auh5HwlEpULPycD5Rc385kX4JMGlE0nhZe3lHHPAvi5pdY/Ucvc
         688g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VwehTW44/FYJZtO7Mrmv+p4+FWQf1QcNzah0fOdfUTo=;
        b=MYx65sr3LCjIwD2Zf7AYZmhJuesa26xI3bqZOg14Pzac5g6Ur5hE97VY4z1CET/VpL
         U5A7QgNOhER34IjN9jUz1CJWqintbBamFfMwLDUq6WbpXrmoH2XksnonwpLgtCD0giHw
         rteYUbVXZHPcGx6jA3Up0hUxPtnvg4N+TqH4HwwGFcT27QEBmbgJDjPLFaRaJCpQAR3v
         46MvqzW2jG02GKJWJK8D3f0w0Ta2sbBZsqWAmUBf8qUs5NJEhPw4yoTsbV0l4CpvoAjg
         OJB2C4/geq2WWm6Ssjch9NqDsjLlZleTkcrIQQMJ9V0gnyhfjEzWf0EP2ZgMXTbLES9P
         +OSw==
X-Gm-Message-State: AOAM5306RiTz3ybUZIbpIy3XdewzFtexezWrddxnlVVqA5bfENGVVgaB
	TioIHCrIhZI6X+DAYI9xsvKSIhGx8QJ9ow==
X-Google-Smtp-Source: ABdhPJySZ1qC00DWbo9DveIBxtirD/uCdDCyJMlgyLVxXQaldYIjEe+9zjIbc7dTNQNWfUdtlQITVw==
X-Received: by 2002:a17:906:415b:: with SMTP id l27mr27244957ejk.19.1618920363161;
        Tue, 20 Apr 2021 05:06:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n12sm9316216edw.95.2021.04.20.05.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 05:06:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] elfutils: correct debuginfod builds on x32
Date: Tue, 20 Apr 2021 14:05:48 +0200
Message-Id: <20210420120549.608450-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../elfutils/elfutils_0.183.bb                |  3 +
 ...infod-client.c-correct-string-format.patch | 60 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
index 8b1dece200..a4ea8da32e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
@@ -29,6 +29,9 @@ SRC_URI_append_libc-musl = " \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
+SRC_URI_append_x86-x32 = " \
+           file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
+           "
 SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
 
 inherit autotools gettext ptest pkgconfig
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
new file mode 100644
index 0000000000..a2737b9fe6
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
@@ -0,0 +1,60 @@
+From f4231bfbb61cd4962638766a7072f4295ed39150 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 19 Apr 2021 23:29:10 +0200
+Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on x32
+
+Upstream-Status: Inappropriate [x32-specific; few, if any people care about it anymore]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ debuginfod/debuginfod-client.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
+index de26af5..a840f23 100644
+--- a/debuginfod/debuginfod-client.c
++++ b/debuginfod/debuginfod-client.c
+@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+   if (fd < 0)
+     return -errno;
+ 
+-  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
++  if (dprintf(fd, "%lld", cache_clean_default_interval_s) < 0)
+     return -errno;
+ 
+   /* init max age config file.  */
+@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+       && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
+     return -errno;
+ 
+-  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
++  if (dprintf(fd, "%lld", cache_default_max_unused_age_s) < 0)
+     return -errno;
+ 
+   return 0;
+@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
+       if (interval_file == NULL)
+         return -errno;
+ 
+-      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
++      int rc = fprintf(interval_file, "%lld", cache_clean_default_interval_s);
+       fclose(interval_file);
+ 
+       if (rc < 0)
+@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
+   interval_file = fopen(interval_path, "r");
+   if (interval_file)
+     {
+-      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
++      if (fscanf(interval_file, "%lld", &clean_interval) != 1)
+         clean_interval = cache_clean_default_interval_s;
+       fclose(interval_file);
+     }
+@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
+   max_unused_file = fopen(max_unused_path, "r");
+   if (max_unused_file)
+     {
+-      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
++      if (fscanf(max_unused_file, "%lld", &max_unused_age) != 1)
+         max_unused_age = cache_default_max_unused_age_s;
+       fclose(max_unused_file);
+     }
-- 
2.30.2

