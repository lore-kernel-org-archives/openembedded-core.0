Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E7BC48260
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:28 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.23015.1706104886196457062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wfttIdDS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so2811539a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104885; x=1706709685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ma2g4PPhuM1ZHlg4AawBMVsj7gcTEAae55Kwp6YVXE=;
        b=wfttIdDSj0Yh5XtLP2KaKJzodIKzHUhDeD63McTuk8caDvswq0vgQqfCuAv1Lrhy5f
         n02yPOSfzfAnYdFm7y2JoqYq6CRK3nLhjR0hsEz1xz2Lul9xKwSPRS6QYDAAE1+J8LMV
         9fcNDCMluEhdFNx8d1a6mrvFKIA3n63fXgYKej5GkyNk5yBOyMSvVYoBl0/q3L5SkmAm
         QwlZueG2RdBuduFt5mpHNY/pMDzS8I5ReeNwpkRntG8XejjJHfZI58fQGRgJM0kYZ9m5
         QYtr7lKRCdQxS8J7zdT3cDZWGClfYT91CXsDKEw1S7M+17eJjh/WuhovBK9ue72hl7zO
         4twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104885; x=1706709685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ma2g4PPhuM1ZHlg4AawBMVsj7gcTEAae55Kwp6YVXE=;
        b=SsNTTztCucPT5WzekikL7nXC4vzg0ocqsMopZkCLOoHoFxXpHEerdNRi5iBKHlMyfE
         uJxoBztGeOJH27kmSfu/hGhY1IgZrtYbOEbMn7nbRSHOFQJa+Iemb/U0ln4MZpUuvIYE
         VPIFIhqJ+DFSPG7VmwrBHE+uWbzYlwKH6dEEuh9dHEab7Vk8IWbNyq22QKY6ybmNJzjF
         KUeUQzmc6zN7t1VrGrQkSOrYUvkjTckPopCfNo03tPVM1r9JnD+R8Zflv5Fk4WP4JRkk
         EvHAN3GRA7vFRanIuy8m0+M0gxzuWgqXHGrbpxs/ZH4pGurXSm7oGPSg6gNUdbBfvWH3
         mvqg==
X-Gm-Message-State: AOJu0YzvOWmenDpqD9qJ5umCOcCbyPEze91ksnSOSqPkXi0y7LNmrrK9
	gC0BfxGmq2FeSRDf9afVtY8XhHP5gH50rvxS5v82visHeaE9xkODhwPvKu0MWco8QcdjA6eJIKT
	g/jw=
X-Google-Smtp-Source: AGHT+IEdmnE2SYQ+2a+yKUwixkBjuSRhQoYRLbnG+F/vsLrLL7+yDvocIEUZSU23UJL9mrRuCFW0DQ==
X-Received: by 2002:a05:6a20:9f4f:b0:19a:602d:49ed with SMTP id ml15-20020a056a209f4f00b0019a602d49edmr826117pzb.23.1706104885055;
        Wed, 24 Jan 2024 06:01:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/12] curl: Fix CVE-2023-46219
Date: Wed, 24 Jan 2024 04:01:04 -1000
Message-Id: <ef3ade93a0cc249046503920c97813df95d53b3c.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194277

From: Lee Chee Yang <chee.yang.lee@intel.com>

Upstream docs for CVE-2023-46219:
https://curl.se/docs/CVE-2023-46219.html

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


