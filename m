Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.1934.1619033300593068356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 12:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lK8u9/pj;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id w6so15284568pfc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXmTNnZpySSjUQhxF61t2c68VBmYI3G1N+E9FLLy5EE=;
        b=lK8u9/pjcCaG2X9WjkoyvkuMRfAIArkDp7Lyb5GTGCEVYpi8NiHmiSHZN/bNFvamUH
         2MB9m6cucvVr3nYw6pm+Rkru4uY9E4KfraBR16Wk6LVI65ckKkJ1xr9LgoS1JvBlHf9G
         SSRK3NV+UJMiD9HfDPih18o5TBNAKobW+ClYoPPHgxp32RCmE8en2DjQ4cgmkMK2/tA2
         mI8/jJCd9KX1TMGtBIDvBeoXerA6dnceWYm85XZcxDDiA0lARJ4Vajw63uF1vUm6cm6Q
         QhNK6WzrziCAFe760102BYg/l0GnILynH7lVrrOVVJ2knGqNvGAEenLIT/oL/AeL4WT3
         +btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXmTNnZpySSjUQhxF61t2c68VBmYI3G1N+E9FLLy5EE=;
        b=DVAwKb4mJobUMqs6wZKJbV9IVS3DjFtP9aB95+esKxOtDUQ1sveph8eR8/ZV12UGP/
         /AHsCWPd6PBk5HjoUAN7YNP4PcmHy5Ro6fEHE6iAXXyR26yEK/52hdsvrxV9Dqzif95E
         2+QgY+1003t/SFH6Xtdn799EsSabHAkKmgLFgIQChls8no+z8nsYI8Ti/O0mMjqoo48A
         vm5pPRGfZdzogC7aF6G6ooI6rmeX30lv5Div7zsxbfH8+w3sgub8P7MDLVdorNoHZ88F
         21ADsJ0x+ydcyfoqTYedc9d3UjXZPSsKCbZ7ixtlpbLmGwC0+7318S2S71IGDG+hu53H
         CVHg==
X-Gm-Message-State: AOAM532ivR64atl3lMOafbNtY5o5KPpGarp0BZ6DJyCsbP/R2uvuKgwm
	I/2EvudsrSobDNJLnPivB+tlJsehYEl3tQ==
X-Google-Smtp-Source: ABdhPJyiVyW6kfLG3s36LBamUFsO6eXTpN75o6sAcbdUwxiYKglo0Y2rQlzfSss/gSmDN72yKZX1yg==
X-Received: by 2002:a63:5b26:: with SMTP id p38mr23644348pgb.141.1619033299708;
        Wed, 21 Apr 2021 12:28:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id k69sm186163pga.45.2021.04.21.12.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 12:28:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] elfutils: Make 64bit time_t fix generic
Date: Wed, 21 Apr 2021 12:28:17 -0700
Message-Id: <20210421192817.1718155-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply it always since more than x32 needs it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils_0.183.bb                |  4 +--
 ...infod-client.c-correct-string-format.patch | 32 +++++++++++++------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
index dfc3a3fa5b..7aebaf1b6d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
+           file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0002-musl-libs.patch \
@@ -29,9 +30,6 @@ SRC_URI_append_libc-musl = " \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI_append_x86-x32 = " \
-           file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
-           "
 SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
 
 inherit autotools gettext ptest pkgconfig
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
index a2737b9fe6..5bd6ba961c 100644
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
@@ -1,16 +1,27 @@
-From f4231bfbb61cd4962638766a7072f4295ed39150 Mon Sep 17 00:00:00 2001
+From 14dfe84943b8f9e6f504536d8735ef6356210b40 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Apr 2021 23:29:10 +0200
-Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on x32
+Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
+ 32bit arches with 64bit time_t
+
+Use intmax_t to print time_t
+
+time_t is platform dependent and some of architectures e.g.
+x32, riscv32, arc use 64bit time_t even while they are 32bit
+architectures, therefore directly using integer printf formats will not
+work portably, use intmax_t to typecast time_t into printf family of
+functions
+
+Upstream-Status: Pending
 
-Upstream-Status: Inappropriate [x32-specific; few, if any people care about it anymore]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  debuginfod/debuginfod-client.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index de26af5..a840f23 100644
+index de26af5..39e28f2 100644
 --- a/debuginfod/debuginfod-client.c
 +++ b/debuginfod/debuginfod-client.c
 @@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
@@ -18,7 +29,7 @@ index de26af5..a840f23 100644
      return -errno;
  
 -  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
-+  if (dprintf(fd, "%lld", cache_clean_default_interval_s) < 0)
++  if (dprintf(fd, "%jd", (intmax_t)cache_clean_default_interval_s) < 0)
      return -errno;
  
    /* init max age config file.  */
@@ -27,7 +38,7 @@ index de26af5..a840f23 100644
      return -errno;
  
 -  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
-+  if (dprintf(fd, "%lld", cache_default_max_unused_age_s) < 0)
++  if (dprintf(fd, "%jd", (intmax_t)cache_default_max_unused_age_s) < 0)
      return -errno;
  
    return 0;
@@ -36,7 +47,7 @@ index de26af5..a840f23 100644
          return -errno;
  
 -      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
-+      int rc = fprintf(interval_file, "%lld", cache_clean_default_interval_s);
++      int rc = fprintf(interval_file, "%jd", (intmax_t)cache_clean_default_interval_s);
        fclose(interval_file);
  
        if (rc < 0)
@@ -45,7 +56,7 @@ index de26af5..a840f23 100644
    if (interval_file)
      {
 -      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
-+      if (fscanf(interval_file, "%lld", &clean_interval) != 1)
++      if (fscanf(interval_file, "%jd", (intmax_t*)(&clean_interval)) != 1)
          clean_interval = cache_clean_default_interval_s;
        fclose(interval_file);
      }
@@ -54,7 +65,10 @@ index de26af5..a840f23 100644
    if (max_unused_file)
      {
 -      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
-+      if (fscanf(max_unused_file, "%lld", &max_unused_age) != 1)
++      if (fscanf(max_unused_file, "%jd", (intmax_t*)(&max_unused_age)) != 1)
          max_unused_age = cache_default_max_unused_age_s;
        fclose(max_unused_file);
      }
+-- 
+2.31.1
+
-- 
2.31.1

