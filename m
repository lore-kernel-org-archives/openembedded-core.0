Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5651C36012
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.44222.1742834037625599883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8LVl220;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227a8cdd241so11234525ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834037; x=1743438837; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYs+GrdW/Y9xuY9Oss3Jt2uAFgYMknmTeYer9LmFfWc=;
        b=B8LVl220CRXHOG11Y/DOa5wGXPR+9F6m0md81AHqBhJNHdZu7bvaZP2egAxf5iG/bS
         SlTMZy9RsC0lP7KWkCdaMrT6jXu0VdNpvID5jWMf1VrVvwM5Vw0Vna9ompLFA60xPG+Y
         7x8PwzsOLrH3aiVfGbN8etjIOTOtcaqEpfkVGAw6EvM0WNwMWOdNy+VvkaclalsvCQTz
         fqifbimeo2g/GaCPfrcG+3cJFiQf7mxOo2oWlJrzDjLgeg9teiVZ3eyl4EMsdCdlx85f
         S5VuHRn9Ko+IjBvHePCJxVLskh8Sln5Nj59ZIyQhR1+rFeUYS8e8rbqXrjELdHFUlAaf
         /D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834037; x=1743438837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYs+GrdW/Y9xuY9Oss3Jt2uAFgYMknmTeYer9LmFfWc=;
        b=p9bjivFj3go4rggKSccjnokK4B9DeHQzm33OQ5ARWBa1PMi2iFDyM66JaaB5GXveGE
         seJmGM2E5me+RWcFL4Qvsk3jK8CXgBtny7yN7+Ue5hlByptdaJYTdPqGyqvuFyzCFuB0
         p911JZYKuMbbktrwqK6p1V1OcQn7MRZd1/hRT812YcQgel4xcbkP2RrFuwuPoMeux0hn
         hGUJz9E5fjizxO6vzAKaBqIK6U09GeX6vwOcshp9VxmTK2Xt6RoEUlIYsJhgJ5FOou0o
         aZR2KgHAr398OeJFWY7n9+lanwyYWoazFB4/CXbHuWTZks9droSiyXIiy5JJcbiPxtbh
         B/PA==
X-Gm-Message-State: AOJu0Yw16M/as8dg7gpIOQ7PgJYkvMZQKHhLhd9lr7SsRP4/UI8pNxle
	HhmARftusaJ1n1hMeXlhacKwegnHs+aZhIguFeXK9TTC5HNJCnGodXR/rTBB
X-Gm-Gg: ASbGnctJx/8oFqmxtJdPPnWlosq7N8uAZfwZwidCZlpJaRn7BhWccehoMCy4bB0JqbZ
	c91AGhj9HKTNJMdnw0PQMDBcOVB0ADk7PHPOghEtrfYQNd18FZL6oI5yBcTIDD2C91n9RxzYkiW
	ZQv3uQE+vq7gWYeB2LTk8vmk78cSU94bDfDZkkb68cO2pJT9aUvv5V+Ew5B9NSYWU+kuPwKReSt
	vMXrAKthj5iWxEN8WsRsJkd1CVcB5XkirfpH1LCWvUpiIdHbKQFoXIy8H+Id+sReC1KaY2EDISH
	kf7tvM84xtY/kV2P3W3WcC7C3AzGQdM++ppB
X-Google-Smtp-Source: AGHT+IGTfXh3p4ONgV96XQiuY6LdnlUpD0oY4cSMCJb/Dm0L+bp2LGemk4vLBVQmAohDqWva4x/vsQ==
X-Received: by 2002:a05:6a00:1956:b0:736:457b:9858 with SMTP id d2e1a72fcca58-739059a559amr19986835b3a.10.1742834036782;
        Mon, 24 Mar 2025 09:33:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:36 -0700
Subject: [PATCH 15/21] lrzsz: Fix build with gcc-15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-15-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213547

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lrzsz-0.12.20/0001-Fix-build-with-GCC-15.patch | 186 +++++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |   1 +
 2 files changed, 187 insertions(+)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-build-with-GCC-15.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-build-with-GCC-15.patch
new file mode 100644
index 0000000000000000000000000000000000000000..e5e9125eea71de703c6f925c51358d8ffffcb9ab
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-build-with-GCC-15.patch
@@ -0,0 +1,186 @@
+From 3739faa41f60841d5277344b17ddc69e78ed8996 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 22:58:33 -0700
+Subject: [PATCH] Fix build with GCC 15
+
+This is collection of changes needed to get compiling with gcc-15
+which switched to use C23 as default std.
+
+Upstream-Status: Submitted [https://github.com/UweOhse/lrzsz/pull/8]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/error.c        | 2 +-
+ lib/getopt.h       | 2 +-
+ lib/long-options.c | 4 ++--
+ lib/long-options.h | 2 +-
+ lib/xstrtol.c      | 2 --
+ src/lrz.c          | 8 +-------
+ src/lsz.c          | 8 +-------
+ src/tcp.c          | 2 +-
+ src/zglobal.h      | 2 +-
+ src/zreadline.c    | 2 +-
+ 10 files changed, 10 insertions(+), 24 deletions(-)
+
+diff --git a/lib/error.c b/lib/error.c
+index 8f679c7..4632c9c 100644
+--- a/lib/error.c
++++ b/lib/error.c
+@@ -73,7 +73,7 @@ extern char *program_name;
+ 
+ # if HAVE_STRERROR
+ #  ifndef strerror		/* On some systems, strerror is a macro */
+-char *strerror ();
++char *strerror (int);
+ #  endif
+ # else
+ static char *
+diff --git a/lib/getopt.h b/lib/getopt.h
+index 4ac33b7..46971cb 100644
+--- a/lib/getopt.h
++++ b/lib/getopt.h
+@@ -101,7 +101,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int, char * const [], const char *);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
+diff --git a/lib/long-options.c b/lib/long-options.c
+index 9ee8f66..2c8d267 100644
+--- a/lib/long-options.c
++++ b/lib/long-options.c
+@@ -40,7 +40,7 @@ parse_long_options (argc, argv,version, usage)
+      int argc;
+      char **argv;
+      void (*version)();
+-     void (*usage)();
++     void (*usage)(int);
+ {
+   int c;
+   int saved_opterr;
+@@ -61,7 +61,7 @@ parse_long_options (argc, argv,version, usage)
+ 	  (*usage) (0);
+ 
+ 	case 'v':
+-	  (*version) (0);
++	  (*version) ();
+ 	  /* printf ("%s (%s) %s\n", command_name, package, version_string); */
+ 	  exit (0);
+ 
+diff --git a/lib/long-options.h b/lib/long-options.h
+index 14459cd..3fb8fa6 100644
+--- a/lib/long-options.h
++++ b/lib/long-options.h
+@@ -6,5 +6,5 @@
+ #endif
+ 
+ void parse_long_options __P ((int _argc, char **_argv, 
+-							  void (*_version) (void), 
++							  void (*_version) (), 
+ 							  void (*_usage) (int)));
+diff --git a/lib/xstrtol.c b/lib/xstrtol.c
+index 8755cf4..0ab337d 100644
+--- a/lib/xstrtol.c
++++ b/lib/xstrtol.c
+@@ -65,8 +65,6 @@ extern int errno;
+ 	}								\
+       while (0)
+ 
+-__unsigned long int __strtol ();
+-
+ /* FIXME: comment.  */
+ 
+ strtol_error
+diff --git a/src/lrz.c b/src/lrz.c
+index b3cf1d5..ae3c62d 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -41,12 +41,6 @@
+ #include "xstrtoul.h"
+ #include "error.h"
+ 
+-#ifndef STRICT_PROTOTYPES
+-extern time_t time();
+-extern char *strerror();
+-extern char *strstr();
+-#endif
+-
+ #ifndef HAVE_ERRNO_DECLARATION
+ extern int errno;
+ #endif
+@@ -191,7 +185,7 @@ int enable_syslog=FALSE;
+ 
+ 
+ /* called by signal interrupt or terminate to clean things up */
+-RETSIGTYPE
++void
+ bibi(int n)
+ {
+ 	if (zmodem_requested)
+diff --git a/src/lsz.c b/src/lsz.c
+index e9e4660..69f4fb8 100644
+--- a/src/lsz.c
++++ b/src/lsz.c
+@@ -50,12 +50,6 @@ void *mm_addr=NULL;
+ #include "xstrtoul.h"
+ #include "error.h"
+ 
+-#ifndef STRICT_PROTOTYPES
+-extern time_t time();
+-extern char *strerror();
+-extern char *strstr();
+-#endif
+-
+ #ifndef HAVE_ERRNO_DECLARATION
+ extern int errno;
+ #endif
+@@ -218,7 +212,7 @@ static int zrqinits_sent=0;
+ static int play_with_sigint=0;
+ 
+ /* called by signal interrupt or terminate to clean things up */
+-RETSIGTYPE
++void
+ bibi (int n)
+ {
+ 	canit(STDOUT_FILENO);
+diff --git a/src/tcp.c b/src/tcp.c
+index 137f94c..a885d5b 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -38,7 +38,7 @@
+ #include <stdlib.h>
+ #include "error.h"
+ 
+-static RETSIGTYPE
++static void
+ tcp_alarm_handler(int dummy LRZSZ_ATTRIB_UNUSED)
+ {
+     /* doesn't need to do anything */
+diff --git a/src/zglobal.h b/src/zglobal.h
+index 573b461..55bd58f 100644
+--- a/src/zglobal.h
++++ b/src/zglobal.h
+@@ -357,7 +357,7 @@ extern int no_timeout;
+ extern int Zctlesc;    /* Encode control characters */
+ extern int under_rsh;
+ 
+-RETSIGTYPE bibi __P ((int n));
++void bibi __P ((int n));
+ 
+ #define sendline(c) putchar((c) & 0377)
+ #define xsendline(c) putchar(c)
+diff --git a/src/zreadline.c b/src/zreadline.c
+index aeda95c..c8f8263 100644
+--- a/src/zreadline.c
++++ b/src/zreadline.c
+@@ -43,7 +43,7 @@ static char *readline_buffer;
+ int readline_left=0;
+ char *readline_ptr;
+ 
+-static RETSIGTYPE
++static void
+ zreadline_alarm_handler(int dummy LRZSZ_ATTRIB_UNUSED)
+ {
+ 	/* doesn't need to do anything */
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index f21b9360206faaaa46d31531ba77fc6d79f2ff91..7825932674f0efda76c9cb895eb82f73e37d0647 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://cve-2018-10195.patch \
            file://include.patch \
            file://0001-Fix-cross-compilation-using-autoconf-detected-AR.patch \
+           file://0001-Fix-build-with-GCC-15.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"

-- 
2.49.0


