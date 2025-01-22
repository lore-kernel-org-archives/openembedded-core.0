Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0F7C0218D
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:37 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.34427.1737515010406886165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JWHacZXu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21619108a6bso109778765ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515010; x=1738119810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbVCHgsmjCFvelc7YSw6+1i6yBvoV4kSEUvC3kJWTSI=;
        b=JWHacZXuNqK/MXURW53dfiABxUFV/R++WCYB4B7iLfbi3/79MMdMkvldkuXTw6go+W
         quheOTzrXk/Df+CAt1Df/wRiFdz0qdT3RgNuJfJarlXPFO3IJDxenHye0FhkJLXloaJj
         tPPd4uNVKpkibDGi6K9cmnE8VgOABFchoPywmru7m+5xHp5Q6Oncv+VcSROED5EMg1k5
         bnVcnboMFmlQbn6zZ/aqShPKH9EYoz7Lone7LxxNzePFPr6etEFh8R2igBUjHHq8lo+G
         lISokO95L2MMKqe6JtXvE4r05xdn9Hk908Iz8PKxvSCu6DOSTI5Q4ejYxZKHKduc3mYN
         Cnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515010; x=1738119810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbVCHgsmjCFvelc7YSw6+1i6yBvoV4kSEUvC3kJWTSI=;
        b=eatO9vgWKOBFR1WBHVRBGJVEpfpx1eo8qK6LhexcNhmzKDxl6YzI1CGjMgJw/sJIlj
         DIqto/CSwbFJyp1ixPfZioKAR4GqTlmTHG86m4MxBc15FG/vsTQxTQH9YonYvXIR1LU0
         JWpactU/6aI9o2zN7UP+sPKSgMoP0gEhXqBJJCa7l201e5VEdF4pgZN6HVghgn+X7H6t
         tBQzVkE7Jv9FyAsVM37THcEZvEr8/nWQWnBSTOmP48mIRqCKhE/A9Hfh5XSn5d/XWLHu
         ObXQr2YFgSi1VyAijS+xaIqd1xq5W0q8dalZPID0P744aEDba9tzf90USUGTzI/0G0uU
         QHXw==
X-Gm-Message-State: AOJu0YzvJai/cxHrwVG6knDCCAnJlfyAb9XkUiHxXh9uC75+YdkqlCg1
	lu3uLJX28ZT1wqktZUaS8Ecjl9BH2VY1E5ilfXzVfVizwAlwWJg9p3IyuFbiIJVLSbT5ANM+udh
	0NMc=
X-Gm-Gg: ASbGncuqOpRMFOwOdL2gGhVkBuE5cw3AhLVuw/QCrPgZJKQoMLNiwCq8CMNSlgytOao
	RgmWsvZQXwC9pSI+QRClL/XTthAvrnfyYoJn1qZJ3hMWDGrF/uI4xZ8+oJobGUYABRZ0qNakfSi
	LEAZThGmtaJmp/ZaWx/gEx/8NCWD3yGucXA2f1/fiRgsQZHDjPmVPqPQO2GORsUMt814LkQ9l1V
	OwGBXmd1tYCpddPI2GrvZo9q7LOVOCLXouZJnLYujy7DMdtQzYh5rFA05c=
X-Google-Smtp-Source: AGHT+IGGidVYGBUEZj4KD3v3yGML2KKCy1UBQDVLSDG8Z7OxkuS7C2MtmQa8HWvc7YzyfoZSgdD3UA==
X-Received: by 2002:a05:6a21:788f:b0:1d4:fc66:30e8 with SMTP id adf61e73a8af0-1eb21493cc1mr27021624637.10.1737515009191;
        Tue, 21 Jan 2025 19:03:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/14] wget: fix CVE-2024-10524
Date: Tue, 21 Jan 2025 19:02:57 -0800
Message-ID: <425c3f55bd316a563597ff6ff95f8104848e2f10.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210115

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


