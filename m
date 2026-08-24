Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9C7C61DB4
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15955.1787576451029370820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Vtyi1azY;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso29204155e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576449; x=1788181249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GFtmF3/Vf6hS61P8VzDdWnF9ZNwo35/dfFC5rCL6fJY=;
        b=Vtyi1azY3Gn7rXQ/nS5KlowwEvOQjc09D8PB68tOeRCsRqgaXXBH2eig5EQVjBPjG1
         OKEjHHB2czUuUTjYDOiDzSSYMtX8Qzktm7ereT6v18Wsu6oW1Hb5Oqpu13Vr7NhzNnt3
         ayJNuUNJKK313pNAYAmkMRVXOgnfMnmCBH/0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576449; x=1788181249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GFtmF3/Vf6hS61P8VzDdWnF9ZNwo35/dfFC5rCL6fJY=;
        b=ZUMOtXcoHRmkkhwaqgUCnkS0ZGbcjQIZtPE+ARHaJHppZnxTlYT5UyuljEQcz7745s
         s/YaYj2W/QMus3qAmaGKfhemfS8YUWKcEmoBWKd8egtVZvj8/KnhzCmW8UwlRB2Mru7G
         gkz3AqjsQIXDcB6fUL1h21j+fSHbhRoNdVeStQV5Vp2iHc+zQCBnrR3r+X8aqT/bwL0W
         aEPwb5DxJ1JOPGTUNKibeLnxshGtNAr+cuoA9s2OhkztraZIZPQUxgJdvlEcqaDC9CsJ
         xbW8mRBsDIBNTNyrFscUnjkAlfRUUuWGVEn04Sey6kZKyBbhKoEJ4ntLFKNcESF3NBrS
         ZziA==
X-Gm-Message-State: AFuF++l9zibE/jBud8ieqT7DHGI2FdTwZfQN9ukG9Y4RgT6RQA/YHRfn
	60q8FzsOjVuNTAqRihuW4EMCWv0j2q6BKN0mBtejmyKRYZLL9rU/laE64FPhznchVxuopdprXac
	hBNAMrj4=
X-Gm-Gg: AR+sD10f0cuymZZqW8RQY6yvKYrJX+eCvUTuRcoorptfwadWFcHBleBLSWFW+l7Wfp7
	icfxhy5+1XaA7V+HrVmg2RTIw32+DHS53kVG+gRKLfw27hjygNDoL8y28J7RMSiUTQvEEW87pV6
	fhUxqCkMq8YHx/JLC6702HV8a4eRapDOLicP2+V+oqxqqPdK3+phYsG8USWt5rQ9BSMQ2ActSMo
	3U/VAOFs96hKO+pDbH3f/M/ZrV4+KUnjMhMCeSevIFXF6wr2xtZjCjve3eyAeGaud5hhUCP2+rg
	00GYXjoCjD1p1QFGN48jlYZYpESVUga3x20STgBZe4OUT8yHBUDpM2ci24KruQzSNjAd25XcRyF
	7cbnrWhng7qkQPoFp++6gxl1wLnwqzhQOHpb17arwstGH6wD3DHymCzG23KTCaaTBkEcsHtpH3i
	ATmUycFhPO9Lk2Lib7k+yQEPeTl0mS+Q3KcE8csra1azXwFYRKJXrCYfq6xjeR9Rh2477qDiAXo
	e4OLCEPIDBI0cd5BWfF17Z0b4Xop2li/TWaDWw8zLJfev4AIZThaRlNA4khZ4EP5FxBrL4q3vpf
	zrGcqOubC6bq7fz2/w==
X-Received: by 2002:a05:600c:4e94:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499b9198005mr220445305e9.6.1787576448844;
        Mon, 24 Aug 2026 06:00:48 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/19] cpio: patch CVE-2026-66485
Date: Mon, 24 Aug 2026 14:59:55 +0200
Message-ID: <d3f3e250e83c2353b2cfa1ecd327262df76f69d2.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244106

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE description.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c105fbf82e2f50b05dc680e0601bf0ea3198e58c)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-extended/cpio/cpio_2.15.bb       |   1 +
 .../cpio/files/CVE-2026-66485.patch           | 210 ++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index fa011251e27..808a1222102 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://run-ptest \
            file://test.sh \
+           file://CVE-2026-66485.patch \
            "
 
 SRC_URI[sha256sum] = "efa50ef983137eefc0a02fdb51509d624b5e3295c980aa127ceee4183455499e"
diff --git a/meta/recipes-extended/cpio/files/CVE-2026-66485.patch b/meta/recipes-extended/cpio/files/CVE-2026-66485.patch
new file mode 100644
index 00000000000..f9c0f48281f
--- /dev/null
+++ b/meta/recipes-extended/cpio/files/CVE-2026-66485.patch
@@ -0,0 +1,210 @@
+From 3cd514031371d8aeeaf2048aa10103e02831aaa9 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Fri, 1 May 2026 08:19:41 +0300
+Subject: [PATCH] Minor fixes
+
+* src/makepath.c: Don't use alloca.
+* src/userspec.c: Likewise.
+
+CVE: CVE-2026-66485
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=3cd514031371d8aeeaf2048aa10103e02831aaa9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/makepath.c | 31 ++++++++++++++---------
+ src/userspec.c | 67 +++++++++++++++++++++++++-------------------------
+ 2 files changed, 53 insertions(+), 45 deletions(-)
+
+diff --git a/src/makepath.c b/src/makepath.c
+index 35dbc73..c6329bf 100644
+--- a/src/makepath.c
++++ b/src/makepath.c
+@@ -47,24 +47,19 @@
+    Return 0 if ARGPATH exists as a directory with the proper
+    ownership and permissions when done, otherwise 1.  */
+ 
+-int
+-make_path (char const *argpath,
+-	   uid_t owner,
+-	   gid_t group,
+-	   const char *verbose_fmt_string)
++static int
++make_path0 (char *dirpath,
++	    uid_t owner,
++	    gid_t group,
++	    const char *verbose_fmt_string)
+ {
+-  char *dirpath;		/* A copy we can scribble NULs on.  */
+   struct stat stats;
+-  int retval = 0;
+   mode_t tmpmode;
+   mode_t invert_permissions;
+   int we_are_root = getuid () == 0;
+-  dirpath = alloca (strlen (argpath) + 1);
+-
+-  strcpy (dirpath, argpath);
+ 
+   if (stat (dirpath, &stats))
+-    {
++  {
+       tmpmode = MODE_RWX & ~ newdir_umask;
+       invert_permissions = we_are_root ? 0 : MODE_WXUSR & ~ tmpmode;
+ 
+@@ -157,5 +152,19 @@ make_path (char const *argpath,
+ 
+     }
+ 
++  return 0;
++}
++
++int
++make_path (char const *argpath,
++	   uid_t owner,
++	   gid_t group,
++	   const char *verbose_fmt_string)
++{
++  char *dirpath = xstrdup (argpath);
++  int retval = make_path0 (dirpath, owner, group, verbose_fmt_string);
++  free (dirpath);
+   return retval;
+ }
++
++
+diff --git a/src/userspec.c b/src/userspec.c
+index 2a2b324..1a2bfa0 100644
+--- a/src/userspec.c
++++ b/src/userspec.c
+@@ -19,7 +19,6 @@
+ /* Written by David MacKenzie <djm@gnu.ai.mit.edu>.  */
+ 
+ #include <system.h>
+-#include <alloca.h>
+ #include <stdio.h>
+ #include <ctype.h>
+ #include <sys/types.h>
+@@ -33,18 +32,6 @@
+ # define endgrent()
+ #endif
+ 
+-/* Perform the equivalent of the statement `dest = strdup (src);',
+-   but obtaining storage via alloca instead of from the heap.  */
+-
+-#define V_STRDUP(dest, src)						\
+-  do									\
+-    {									\
+-      int _len = strlen ((src));					\
+-      (dest) = (char *) alloca (_len + 1);				\
+-      strcpy (dest, src);						\
+-    }									\
+-  while (0)
+-
+ /* Return nonzero if STR represents an unsigned decimal integer,
+    otherwise return 0. */
+ 
+@@ -57,6 +44,18 @@ isnumber_p (const char *str)
+   return 1;
+ }
+ 
++static void
++store_string (char **bufptr, size_t *buflen, char *str)
++{
++  size_t len = strlen (str) + 1;
++  if (len > *buflen)
++    {
++      *bufptr = xrealloc (*bufptr, len);
++      *buflen = len;
++    }
++  strcpy (*bufptr, str);
++}
++
+ /* Extract from NAME, which has the form "[user][:.][group]",
+    a USERNAME, UID U, GROUPNAME, and GID G.
+    Either user or group, or both, must be present.
+@@ -70,23 +69,21 @@ isnumber_p (const char *str)
+    Return NULL if successful, a static error message string if not.  */
+ 
+ const char *
+-parse_user_spec (const char *spec_arg, uid_t *uid, gid_t *gid,
+-		 char **username_arg, char **groupname_arg)
++parse_user_spec0 (char *spec, uid_t *uid, gid_t *gid,
++		  char **username_arg, char **groupname_arg)
+ {
+   static const char *tired = "virtual memory exhausted";
+   const char *error_msg;
+-  char *spec;			/* A copy we can write on.  */
+   struct passwd *pwd;
+   struct group *grp;
+   char *g, *u, *separator;
+-  char *groupname;
++  char *groupname = NULL;
++  size_t grouplen = 0;
+ 
+   error_msg = NULL;
+   *username_arg = *groupname_arg = NULL;
+   groupname = NULL;
+ 
+-  V_STRDUP (spec, spec_arg);
+-
+   /* Find the separator if there is one.  */
+   separator = strchr (spec, ':');
+   if (separator == NULL)
+@@ -143,11 +140,12 @@ parse_user_spec (const char *spec_arg, uid_t *uid, gid_t *gid,
+ 	      if (grp == NULL)
+ 		{
+ 		  char nbuf[UINTMAX_STRSIZE_BOUND];
+-		  V_STRDUP (groupname, umaxtostr (pwd->pw_gid, nbuf));
++		  store_string (&groupname, &grouplen,
++				umaxtostr (pwd->pw_gid, nbuf));
+ 		}
+ 	      else
+ 		{
+-		  V_STRDUP (groupname, grp->gr_name);
++		  store_string (&groupname, &grouplen, grp->gr_name);
+ 		}
+ 	      endgrent ();
+ 	    }
+@@ -178,7 +176,7 @@ parse_user_spec (const char *spec_arg, uid_t *uid, gid_t *gid,
+       endgrent ();		/* Save a file descriptor.  */
+ 
+       if (error_msg == NULL)
+-	V_STRDUP (groupname, g);
++	store_string (&groupname, &grouplen, g);
+     }
+ 
+   if (error_msg == NULL)
+@@ -191,23 +189,24 @@ parse_user_spec (const char *spec_arg, uid_t *uid, gid_t *gid,
+ 	}
+ 
+       if (groupname != NULL && error_msg == NULL)
+-	{
+-	  *groupname_arg = strdup (groupname);
+-	  if (*groupname_arg == NULL)
+-	    {
+-	      if (*username_arg != NULL)
+-		{
+-		  free (*username_arg);
+-		  *username_arg = NULL;
+-		}
+-	      error_msg = tired;
+-	    }
+-	}
++	*groupname_arg = groupname;
+     }
++  else
++    free (groupname);
+ 
+   return error_msg;
+ }
+ 
++const char *
++parse_user_spec (const char *spec_arg, uid_t *uid, gid_t *gid,
++		 char **username, char **groupname)
++{
++  char *spec = xstrdup (spec_arg);
++  const char *retval = parse_user_spec0 (spec, uid, gid, username, groupname);
++  free (spec);
++  return retval;
++}
++
+ #ifdef TEST
+ 
+ #define NULL_CHECK(s) ((s) == NULL ? "(null)" : (s))

