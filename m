Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8FBC47258
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 07:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.7926.1705391977627956449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 23:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gB7ywyX4;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705391978; x=1736927978;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=t+rWwdsy6gcN2Heh/HIhJ8JBTC1UiT/WFW94hyDheu8=;
  b=gB7ywyX4nPz62gd/eg5mxd9NV/kFupfCvT0dKN6hqXWu5jJFhT9VuAWj
   AdietITgPbX7vTKpX/jX8Xp2TqxneiL9i73D7L10TnkGe4F4LIeZoUBc7
   GBPqh1guBj9TEhLEKda713oZvhR+jgkxixLtkrgT0aJGjOcQrwg4i6EOu
   7MEYqCf4tG5pNPIUISp4jc2OIiHdWrLYy2UwG7iuslD7K9vYj5VzTFhA6
   NohrqAZHDpFr61wrH31r9dBOQ9vPpJawouXFtNVSs7Ds1+moe4FK6h+wK
   hM1Dt3r44r+cZsXHaoeNiOY7pQx3+GxueNsZsSOYRtTfx+ypqy+S4HQyl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="396943062"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="396943062"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 23:59:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="927368047"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="927368047"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2024 23:59:37 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 2/2] curl: Fix CVE-2023-46219
Date: Tue, 16 Jan 2024 15:30:56 +0800
Message-Id: <20240116073056.2506109-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240116073056.2506109-1-chee.yang.lee@intel.com>
References: <20240116073056.2506109-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 07:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193823

From: Lee Chee Yang <chee.yang.lee@intel.com>

Upstream docs for CVE-2023-46219:
https://curl.se/docs/CVE-2023-46219.html

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../curl/curl/CVE-2023-46219.patch            | 131 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.4.0.bb       |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46219.patch b/meta/recipes-support/curl/curl/CVE-2023-46219.patch
new file mode 100644
index 0000000000..d6c8925218
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46219.patch
@@ -0,0 +1,131 @@
+CVE: CVE-2023-46219
+Upstream-Status: Backport [ https://github.com/curl/curl/commit/73b65e94f3531179de45 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
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
+---
+ lib/fopen.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 60 insertions(+), 5 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index 75b8a7aa534085..a73ac068ea3016 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -39,6 +39,51 @@
+ #include "curl_memory.h"
+ #include "memdebug.h"
+ 
++/*
++  The dirslash() function breaks a null-terminated pathname string into
++  directory and filename components then returns the directory component up
++  to, *AND INCLUDING*, a final '/'.  If there is no directory in the path,
++  this instead returns a "" string.
++
++  This function returns a pointer to malloc'ed memory.
++
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
+@@ -50,25 +95,34 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
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
++  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode)) {
++    free(dir);
+     return CURLE_OK;
++  }
+   fclose(*fh);
+   *fh = NULL;
+ 
+-  result = Curl_rand_alnum(data, randsuffix, sizeof(randsuffix));
++  result = Curl_rand_alnum(data, randbuf, sizeof(randbuf));
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
+@@ -95,6 +149,7 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   if(!*fh)
+     goto fail;
+ 
++  free(dir);
+   *tempname = tempstore;
+   return CURLE_OK;
+ 
+@@ -105,7 +160,7 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   }
+ 
+   free(tempstore);
+-
++  free(dir);
+   return result;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_8.4.0.bb b/meta/recipes-support/curl/curl_8.4.0.bb
index 8f1ba52692..977404c963 100644
--- a/meta/recipes-support/curl/curl_8.4.0.bb
+++ b/meta/recipes-support/curl/curl_8.4.0.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://CVE-2023-46218.patch \
+    file://CVE-2023-46219.patch \
 "
 SRC_URI[sha256sum] = "16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d70dec63e2e6336f2a82d"
 
-- 
2.37.3


