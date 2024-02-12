Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42035C4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:54:49 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.6809.1707746087167295839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MoVhE0+r;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6dbcebaf9a9so2291749a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746086; x=1708350886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=679vEnyEKusdWQ89LU1siVl2KFLwRkbQfeUmOYuyhok=;
        b=MoVhE0+rHwQHEUjGGnYtZoy2V8ISEktR+NBFpkkC5J479e42fpvABprQBnMQaJfhzL
         qe9Xgpr17QXnyZRRjdAGV7AecRvkuIjVPqYsZlQw1bZX7fGLGE92tWa1glrCcJ7vqjUo
         18npyyqkFis2FpBo0BeEBlyQvJ3tMvqRbubxKJWyzeMo6CGBy5+tWLrzum6ub53e0IpI
         I2QcpXR+GfEFbdI0gm8ausOyrWxjl1h/uNIpesZjpc93RFIcBpqqrKfcilqrVxWTQ2bp
         Prwpm4g+Er7oUBF0ILkNXZtvikk3XinpdWvKdOWCpZ2cDYQjegr+Zqulz3hy9axO5182
         TXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746086; x=1708350886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=679vEnyEKusdWQ89LU1siVl2KFLwRkbQfeUmOYuyhok=;
        b=MIMQVZeuRNFIH5djcWyzKuR+Pbo7LMvq0Gx+aIRKHqTVSHTNb4V4ArszW3GaBCuFgx
         V17kDX77WCzBUTKilGRn8ggx9UCRjDFTfe5EKFydzpzOIdv6Xb71zWUaukds7JYaOoZx
         3QlRhnPWYK/Q0WLQrdlga3cV2cOnPpnayLhIbiR2IN+2C1olwSbz3MU/Yfq6iNvHaIbd
         lFm0GKz11Eq5jN9SRTCMQ9HgW5j5nx7tRCAKb/d1WJTHTjioIRyJYw55K/TmdHkq1/e0
         XJrdZiD8lN72qtXtXmGiovVECMUNdhA8HGamwwzy32zgRBKbkG0TYJCn3JOH5RsGcyDH
         Pjjw==
X-Gm-Message-State: AOJu0YxAr9P6DbIl9+vqmBeaf88QA5EetbspV+Bg5SR2P3oAcxfdiQDt
	rMM6BEqDoBzm4c25giik3WcdpYMnS8dEpRohays16EbU8YU5Zr+jWPA8AhjNCXX177jG46BSZep
	SY5g=
X-Google-Smtp-Source: AGHT+IHoM0DjGOxTiEf0f0tUhHiwzfgnNGmKH4CTsPPBHytID7ocFMUQb4pIelQY0uN+5lCw05qtKA==
X-Received: by 2002:a05:6358:d392:b0:176:5a5e:4bfc with SMTP id mp18-20020a056358d39200b001765a5e4bfcmr9047604rwb.3.1707746085975;
        Mon, 12 Feb 2024 05:54:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k69-20020a638448000000b005dc421f8889sm439889pgd.26.2024.02.12.05.54.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:54:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] curl: Fix CVE-2023-46219
Date: Mon, 12 Feb 2024 03:54:14 -1000
Message-Id: <e0f503594e7bc0da9771b69ca7243a34dcadbdde.1707745886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707745886.git.steve@sakoman.com>
References: <cover.1707745886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195324

From: Archana Polampalli <archana.polampalli@windriver.com>

When saving HSTS data to an excessively long file name, curl could end up
removing all contents, making subsequent requests using that file unaware
of the HSTS status they should otherwise use.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-46219-0001.patch       |  42 ++++++
 .../curl/curl/CVE-2023-46219-0002.patch       | 133 ++++++++++++++++++
 .../curl/curl/CVE-2023-46219-0003.patch       |  81 +++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 4 files changed, 259 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch b/meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch
new file mode 100644
index 0000000000..55e8f6fac9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46219-0001.patch
@@ -0,0 +1,42 @@
+From 0c667188e0c6cda615a036b8a2b4125f2c404dde Mon Sep 17 00:00:00 2001
+From: SaltyMilk <soufiane.elmelcaoui@gmail.com>
+Date: Mon, 10 Jul 2023 21:43:28 +0200
+Subject: [PATCH] fopen: optimize
+
+Closes #11419
+
+CVE: CVE-2023-46219
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0c667188e0c6]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/fopen.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index ad3691b..92f39cf 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -56,13 +56,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   int fd = -1;
+   *tempname = NULL;
+
+-  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
+-    /* a non-regular file, fallback to direct fopen() */
+-    *fh = fopen(filename, FOPEN_WRITETEXT);
+-    if(*fh)
+-      return CURLE_OK;
++  *fh = fopen(filename, FOPEN_WRITETEXT);
++  if(!*fh)
+     goto fail;
+-  }
++  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
++    return CURLE_OK;
++  fclose(*fh);
++  *fh = NULL;
+
+   result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
+   if(result)
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch b/meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch
new file mode 100644
index 0000000000..f432fabbb1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46219-0002.patch
@@ -0,0 +1,133 @@
+From 73b65e94f3531179de45c6f3c836a610e3d0a846 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 23 Nov 2023 08:23:17 +0100
+Subject: [PATCH] fopen: create short(er) temporary file name
+
+Only using random letters in the name plus a ".tmp" extension. Not by
+appending characters to the final file name.
+
+Reported-by: Maksymilian Arciemowicz
+
+Closes #12388
+
+CVE: CVE-2023-46219
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/73b65e94f3531179]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/fopen.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 59 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index 92f39cf..1670e32 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -39,6 +39,50 @@
+ #include "curl_memory.h"
+ #include "memdebug.h"
+
++
++/*
++  The dirslash() function breaks a null-terminated pathname string into
++  directory and filename components then returns the directory component up
++  to, *AND INCLUDING*, a final '/'.  If there is no directory in the path,
++  this instead returns a "" string.
++  This function returns a pointer to malloc'ed memory.
++  The input path to this function is expected to have a file name part.
++*/
++
++#ifdef _WIN32
++#define PATHSEP "\\"
++#define IS_SEP(x) (((x) == '/') || ((x) == '\\'))
++#elif defined(MSDOS) || defined(__EMX__) || defined(OS2)
++#define PATHSEP "\\"
++#define IS_SEP(x) ((x) == '\\')
++#else
++#define PATHSEP "/"
++#define IS_SEP(x) ((x) == '/')
++#endif
++
++static char *dirslash(const char *path)
++{
++  size_t n;
++  struct dynbuf out;
++  DEBUGASSERT(path);
++  Curl_dyn_init(&out, CURL_MAX_INPUT_LENGTH);
++  n = strlen(path);
++  if(n) {
++    /* find the rightmost path separator, if any */
++    while(n && !IS_SEP(path[n-1]))
++      --n;
++    /* skip over all the path separators, if any */
++    while(n && IS_SEP(path[n-1]))
++      --n;
++  }
++  if(Curl_dyn_addn(&out, path, n))
++    return NULL;
++  /* if there was a directory, append a single trailing slash */
++  if(n && Curl_dyn_addn(&out, PATHSEP, 1))
++    return NULL;
++  return Curl_dyn_ptr(&out);
++}
++
+ /*
+  * Curl_fopen() opens a file for writing with a temp name, to be renamed
+  * to the final name when completed. If there is an existing file using this
+@@ -50,25 +94,34 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+                     FILE **fh, char **tempname)
+ {
+   CURLcode result = CURLE_WRITE_ERROR;
+-  unsigned char randsuffix[9];
++  unsigned char randbuf[41];
+   char *tempstore = NULL;
+   struct_stat sb;
+   int fd = -1;
++  char *dir;
+   *tempname = NULL;
+
++  dir = dirslash(filename);
++  if(!dir)
++    goto fail;
++
+   *fh = fopen(filename, FOPEN_WRITETEXT);
+   if(!*fh)
+     goto fail;
+-  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
++  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode)){
++    free(dir);
+     return CURLE_OK;
++  }
+   fclose(*fh);
+   *fh = NULL;
+
+-  result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
++  result = Curl_rand_hex(data, randbuf, sizeof(randbuf));
+   if(result)
+     goto fail;
+
+-  tempstore = aprintf("%s.%s.tmp", filename, randsuffix);
++  /* The temp file name should not end up too long for the target file
++     system */
++  tempstore = aprintf("%s%s.tmp", dir, randbuf);
+   if(!tempstore) {
+     result = CURLE_OUT_OF_MEMORY;
+     goto fail;
+@@ -95,6 +148,7 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   if(!*fh)
+     goto fail;
+
++  free(dir);
+   *tempname = tempstore;
+   return CURLE_OK;
+
+@@ -107,6 +161,7 @@ fail:
+   free(tempstore);
+
+   *tempname = NULL;
++  free(dir);
+   return result;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch b/meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch
new file mode 100644
index 0000000000..3b6f756549
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46219-0003.patch
@@ -0,0 +1,81 @@
+From f27b8dba73295cb5296a50f2c19c0739b502eb94 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 24 Nov 2023 09:46:32 +0100
+Subject: [PATCH] fopen: allocate the dir after fopen
+
+Move the allocation of the directory name down to after the fopen() call
+to allow that shortcut code path to avoid a superfluous malloc+free
+cycle.
+
+Follow-up to 73b65e94f35311
+
+Closes #12398
+
+CVE: CVE-2023-46219
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/f27b8dba73295cb529]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/fopen.c | 19 ++++++++-----------
+ 1 file changed, 8 insertions(+), 11 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index 1670e32..b663f8b 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -98,18 +98,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   char *tempstore = NULL;
+   struct_stat sb;
+   int fd = -1;
+-  char *dir;
++  char *dir = NULL;
+   *tempname = NULL;
+
+-  dir = dirslash(filename);
+-  if(!dir)
+-    goto fail;
+-
+   *fh = fopen(filename, FOPEN_WRITETEXT);
+   if(!*fh)
+     goto fail;
+   if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode)){
+-    free(dir);
+     return CURLE_OK;
+   }
+   fclose(*fh);
+@@ -119,9 +114,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   if(result)
+     goto fail;
+
+-  /* The temp file name should not end up too long for the target file
+-     system */
+-  tempstore = aprintf("%s%s.tmp", dir, randbuf);
++  dir = dirslash(filename);
++  if(dir) {
++    /* The temp file name should not end up too long for the target file
++       system */
++    tempstore = aprintf("%s%s.tmp", dir, randbuf);
++    free(dir);
++  }
+   if(!tempstore) {
+     result = CURLE_OUT_OF_MEMORY;
+     goto fail;
+@@ -148,7 +147,6 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   if(!*fh)
+     goto fail;
+
+-  free(dir);
+   *tempname = tempstore;
+   return CURLE_OK;
+
+@@ -161,7 +159,6 @@ fail:
+   free(tempstore);
+
+   *tempname = NULL;
+-  free(dir);
+   return result;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 965f05bc98..de69d3d53b 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -54,6 +54,9 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-38545.patch \
            file://CVE-2023-38546.patch \
            file://CVE-2023-46218.patch \
+           file://CVE-2023-46219-0001.patch \
+           file://CVE-2023-46219-0002.patch \
+           file://CVE-2023-46219-0003.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


