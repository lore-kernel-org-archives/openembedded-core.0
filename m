Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0568CC02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:25 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.42240.1737395474851321030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jLmNHsBp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso6414873a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395474; x=1738000274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbVCHgsmjCFvelc7YSw6+1i6yBvoV4kSEUvC3kJWTSI=;
        b=jLmNHsBpUyl4tWtMqjuPkLIqLr9gny2KDn4CJ5VfnMNuWzJby0Zoc/y95LMwo6QK8j
         3KsBKCCoYZx2BsUnhfZ3Dd5Ly5AdAWPPNLsz4tcNm/nvvOWmMyJzMBbpucSHJCYaVJam
         QYLk5QYWc/myTGKFqrg1yh9F5JwP+M6xXn1CkybIzrvm0A/AxhzLoQ5ZWxWTBlQAFC8i
         pBEIxOhfHUdTWzmwxTdJB1f0tX69zesQ4U134GJbIc7pD+z7r4CoPhUbvvML7GF/I7RR
         tkwuiCXM+sD4Fh8+iHKDsJQOfI2ViUpVM2h3K1Ptw3TbE3Vzp/I/LuwZLrG0cmCsxYdD
         6g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395474; x=1738000274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbVCHgsmjCFvelc7YSw6+1i6yBvoV4kSEUvC3kJWTSI=;
        b=is5gQZZiLfabjt38k+xCVfqVUDA5AH2/oZ3q607jbqZtjffm0DxYulJuKpF4dcq3yS
         bkSUfSZNof7zjoqbbVwoUDsxZ9QFhuZVx1KElOL8hgSHfcgzcvR4GHyI4A08U+3CnWfQ
         xBIpjW3A2osHaSpwIyQCu4vzBQV5o6RaPvBbg/lzTvZW71h/soKXh+M5WQFmDb8uDITe
         H5/xKY2o2khBSvX/DjJL+rAV1ffnCGEpM4kNQakZ3B4HRJemb7dfJpb3ZybQC847vEdu
         J85lyKHdJLec7hhbuqGfijX0nusLZNytVKGsT29lDn81AiXJ6By1iSfe8WEKNlZ/YTOJ
         WPig==
X-Gm-Message-State: AOJu0YxAJIylnCMN5D5SXFrKJuMMfIx+A+U4d2mjWQgm5AwusGvds6ga
	4k/Zb4flgrYs6gXjF0+0g4Eirz79VSgNt150RXomsC9IR+IVttlb3HnyhW9XO4WbcCNsZAj7k1D
	tPFQ=
X-Gm-Gg: ASbGncvVFQAyq19L2nrMtLy7Jc3XMKooQFoxw3rnYsqdhF5dNlhXWtXzqc4lMyUReUM
	ry24DglGnr8RJhqtHYFiY0MQOUVP6aPcuTc5yl6ETlhKTFDgUtSrXqRS7GJTCvpoeq63lsnQw4g
	A7lLEXFyX0xsWl6jepcM2eGN0jox46WMizDC1njJH6VwNhH5wZlZCRfTKs4y0W0IfHtG9kXLyQW
	OyG3HqCPcmfUqa2VCYdf5o52YTViS+PS+VCEdfsIPpj82a1OSDBPWJyNio=
X-Google-Smtp-Source: AGHT+IH5Qx7bfbjp8zc1aEE5Htrxp9CcynNSgDBdkxC41PMitxW6X/TMXUrdaA1aPx17UW8GUKhzhw==
X-Received: by 2002:a17:90a:c88c:b0:2ef:e0bb:1ef2 with SMTP id 98e67ed59e1d1-2f782cbdfefmr19191316a91.19.1737395473913;
        Mon, 20 Jan 2025 09:51:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/16] wget: fix CVE-2024-10524
Date: Mon, 20 Jan 2025 09:50:47 -0800
Message-ID: <eed5d59c138c210df91f31ac718383ccaf921faf.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210047

From: Divya Chellam <divya.chellam@windriver.com>

Applications that use Wget to access a remote resource using
shorthand URLs and pass arbitrary user credentials in the URL
are vulnerable. In these cases attackers can enter crafted
credentials which will cause Wget to access an arbitrary host.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-10524

Upstream-patch:
https://git.savannah.gnu.org/cgit/wget.git/commit/?id=c419542d956a2607bbce5df64b9d378a8588d778

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wget/wget/CVE-2024-10524.patch            | 197 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2024-10524.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2024-10524.patch b/meta/recipes-extended/wget/wget/CVE-2024-10524.patch
new file mode 100644
index 0000000000..21f990ee73
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2024-10524.patch
@@ -0,0 +1,197 @@
+From c419542d956a2607bbce5df64b9d378a8588d778 Mon Sep 17 00:00:00 2001
+From: Tim Rühsen <tim.ruehsen@gmx.de>
+Date: Sun, 27 Oct 2024 19:53:14 +0100
+Subject: [PATCH] Fix CVE-2024-10524 (drop support for shorthand URLs)
+
+* doc/wget.texi: Add documentation for removed support for shorthand URLs.
+* src/html-url.c (src/html-url.c): Call maybe_prepend_scheme.
+* src/main.c (main): Likewise.
+* src/retr.c (getproxy): Likewise.
+* src/url.c: Rename definition of rewrite_shorthand_url to maybe_prepend_scheme,
+  add new function is_valid_port.
+* src/url.h: Rename declaration of rewrite_shorthand_url to maybe_prepend_scheme.
+
+Reported-by: Goni Golan <gonig@jfrog.com>
+
+CVE: CVE-2024-10524
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/wget.git/commit/?id=c419542d956a2607bbce5df64b9d378a8588d778]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ doc/wget.texi  | 12 ++++-------
+ src/html-url.c |  2 +-
+ src/main.c     |  2 +-
+ src/retr.c     |  2 +-
+ src/url.c      | 57 ++++++++++++++++----------------------------------
+ src/url.h      |  2 +-
+ 6 files changed, 26 insertions(+), 51 deletions(-)
+
+diff --git a/doc/wget.texi b/doc/wget.texi
+index 3c24de2..503a03d 100644
+--- a/doc/wget.texi
++++ b/doc/wget.texi
+@@ -314,8 +314,8 @@ for text files.  Here is an example:
+ ftp://host/directory/file;type=a
+ @end example
+ 
+-Two alternative variants of @sc{url} specification are also supported,
+-because of historical (hysterical?) reasons and their widespreaded use.
++The two alternative variants of @sc{url} specifications are no longer
++supported because of security considerations:
+ 
+ @sc{ftp}-only syntax (supported by @code{NcFTP}):
+ @example
+@@ -327,12 +327,8 @@ host:/dir/file
+ host[:port]/dir/file
+ @end example
+ 
+-These two alternative forms are deprecated, and may cease being
+-supported in the future.
+-
+-If you do not understand the difference between these notations, or do
+-not know which one to use, just use the plain ordinary format you use
+-with your favorite browser, like @code{Lynx} or @code{Netscape}.
++These two alternative forms have been deprecated long time ago,
++and support is removed with version 1.22.0.
+ 
+ @c man begin OPTIONS
+ 
+diff --git a/src/html-url.c b/src/html-url.c
+index 896d6fc..3deea9c 100644
+--- a/src/html-url.c
++++ b/src/html-url.c
+@@ -931,7 +931,7 @@ get_urls_file (const char *file)
+           url_text = merged;
+         }
+ 
+-      new_url = rewrite_shorthand_url (url_text);
++      new_url = maybe_prepend_scheme (url_text);
+       if (new_url)
+         {
+           xfree (url_text);
+diff --git a/src/main.c b/src/main.c
+index d1c3c3e..f1d7792 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -2126,7 +2126,7 @@ only if outputting to a regular file.\n"));
+       struct iri *iri = iri_new ();
+       struct url *url_parsed;
+ 
+-      t = rewrite_shorthand_url (argv[optind]);
++      t = maybe_prepend_scheme (argv[optind]);
+       if (!t)
+         t = argv[optind];
+ 
+diff --git a/src/retr.c b/src/retr.c
+index 38c9fcf..a124046 100644
+--- a/src/retr.c
++++ b/src/retr.c
+@@ -1493,7 +1493,7 @@ getproxy (struct url *u)
+ 
+   /* Handle shorthands.  `rewritten_storage' is a kludge to allow
+      getproxy() to return static storage. */
+-  rewritten_url = rewrite_shorthand_url (proxy);
++  rewritten_url = maybe_prepend_scheme (proxy);
+   if (rewritten_url)
+     return rewritten_url;
+ 
+diff --git a/src/url.c b/src/url.c
+index 0acd3f3..6868825 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -594,60 +594,39 @@ parse_credentials (const char *beg, const char *end, char **user, char **passwd)
+   return true;
+ }
+ 
+-/* Used by main.c: detect URLs written using the "shorthand" URL forms
+-   originally popularized by Netscape and NcFTP.  HTTP shorthands look
+-   like this:
+-
+-   www.foo.com[:port]/dir/file   -> http://www.foo.com[:port]/dir/file
+-   www.foo.com[:port]            -> http://www.foo.com[:port]
+-
+-   FTP shorthands look like this:
+-
+-   foo.bar.com:dir/file          -> ftp://foo.bar.com/dir/file
+-   foo.bar.com:/absdir/file      -> ftp://foo.bar.com//absdir/file
++static bool is_valid_port(const char *p)
++{
++  unsigned port = (unsigned) atoi (p);
++  if (port == 0 || port > 65535)
++    return false;
+ 
+-   If the URL needs not or cannot be rewritten, return NULL.  */
++  int digits = strspn (p, "0123456789");
++  return digits && (p[digits] == '/' || p[digits] == '\0');
++}
+ 
++/* Prepend "http://" to url if scheme is missing, otherwise return NULL. */
+ char *
+-rewrite_shorthand_url (const char *url)
++maybe_prepend_scheme (const char *url)
+ {
+-  const char *p;
+-  char *ret;
+-
+   if (url_scheme (url) != SCHEME_INVALID)
+     return NULL;
+ 
+-  /* Look for a ':' or '/'.  The former signifies NcFTP syntax, the
+-     latter Netscape.  */
+-  p = strpbrk (url, ":/");
++  const char *p = strchr (url, ':');
+   if (p == url)
+     return NULL;
+ 
+   /* If we're looking at "://", it means the URL uses a scheme we
+      don't support, which may include "https" when compiled without
+-     SSL support.  Don't bogusly rewrite such URLs.  */
++     SSL support.  Don't bogusly prepend "http://" to such URLs.  */
+   if (p && p[0] == ':' && p[1] == '/' && p[2] == '/')
+     return NULL;
+ 
+-  if (p && *p == ':')
+-    {
+-      /* Colon indicates ftp, as in foo.bar.com:path.  Check for
+-         special case of http port number ("localhost:10000").  */
+-      int digits = strspn (p + 1, "0123456789");
+-      if (digits && (p[1 + digits] == '/' || p[1 + digits] == '\0'))
+-        goto http;
+-
+-      /* Turn "foo.bar.com:path" to "ftp://foo.bar.com/path". */
+-      if ((ret = aprintf ("ftp://%s", url)) != NULL)
+-        ret[6 + (p - url)] = '/';
+-    }
+-  else
+-    {
+-    http:
+-      /* Just prepend "http://" to URL. */
+-      ret = aprintf ("http://%s", url);
+-    }
+-  return ret;
++  if (p && p[0] == ':' && !is_valid_port (p + 1))
++    return NULL;
++
++
++  fprintf(stderr, "Prepended http:// to '%s'\n", url);
++  return aprintf ("http://%s", url);
+ }
+ 
+ static void split_path (const char *, char **, char **);
+diff --git a/src/url.h b/src/url.h
+index fb9da33..5f99b0a 100644
+--- a/src/url.h
++++ b/src/url.h
+@@ -128,7 +128,7 @@ char *uri_merge (const char *, const char *);
+ 
+ int mkalldirs (const char *);
+ 
+-char *rewrite_shorthand_url (const char *);
++char *maybe_prepend_scheme (const char *);
+ bool schemes_are_similar_p (enum url_scheme a, enum url_scheme b);
+ 
+ bool are_urls_equal (const char *u1, const char *u2);
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index bc65a8f7c8..b5f50f6c84 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -1,6 +1,7 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2024-38428.patch \
+           file://CVE-2024-10524.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
-- 
2.43.0


