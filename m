Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A176C9830E
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:45 +0000 (UTC)
Received: from mail-wr2-f20.google.com (mail-wr2-f20.google.com [74.125.225.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2919.1790154697919500065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m+fVyoLr;
 spf=pass (domain: smile.fr, ip: 74.125.225.84, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f20.google.com with SMTP id ffacd0b85a97d-482f6356256so246854f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154696; x=1790759496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=53IqsA+Bt3WZtWzlmNe25467oUqJCdSmXzl2DtN5MbA=;
        b=m+fVyoLrbQ53YyzJbuhgpYyT2zp7NJUldsZzzJ1OulkeK09i4modLjO93kPUIf0zyb
         MC/qLbhJ00lc+TWcFQKrj/N1aKrJ6X4tWbsIWL0ivH20q204YmtIGRLXymHu5FslOh3c
         7zzFnx8zm85+l9h/Y2AKc1pSDLuWyGFoJ5JZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154696; x=1790759496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=53IqsA+Bt3WZtWzlmNe25467oUqJCdSmXzl2DtN5MbA=;
        b=CUjkWJd6KAeoWNxWF/yx+za9Hai81jqypc/EaZC2vGcpO2Yy299G8VPzk6o5wl8h/m
         I//AsOidqCBsPs4Y/W8oMOkTwjG9lvj41JQXflSBiUA+fOX31b3AjQztxAU2yxgpJqZm
         BQXfsc6/mlBksj7cBM0M6XaOkyqbfD2SruQkx8irr61niVJFiykPXghPSMHke9zgaVWJ
         Ft70LTEHaVQjlt1TwnBF0VQ2Wpume13idDmLqdeR/t2AttFZHvu7ubmnQ0CCvZvjJPtb
         5FWHx0EDA5JYuLXjiuD4ZtNnKaP5jlXjvLOZJgPLWTU+Sg4wxfOKxF1po74C6/GybVvm
         kPKA==
X-Gm-Message-State: AFuF++lRHfV0Pv5FrLzJPABKd5FgFBwl5YFFCZWT+drOQQ275ZaG8xO8
	IVuKLGe394C/Xgk6+ST/cg4YfkBZCGBSOqCNt2zlVarCTZMmnadYCv3pHzfkI9UEDXVFvvpTst2
	Ks5QhwNQ=
X-Gm-Gg: AYBFou1Zq/lFXSfwFZfv4r0itTKvtjS/XWaejr2bl1ieAmttuBFylPkf1BXzPah+Tiz
	xZ09Ag3uo/BROwnRAHWFJoEipuZNJtnagVwzE4vn0aZUbyVrlzx2xHiI+WdKTD5N7h2F109Ovvf
	uIlcKjT8GVdt8K/8SOWiVas7yyvVPA2RQl/SvbujU5uQnHmbuMwksogvW3it6YV/Q59MUyanwmD
	V9oxRp2lL0WaQT+VRb51RM1/550k2fcWWIb0BWon1+KN2V56OfTYjjHh2ozFCw9zBpPrkhM1rEV
	7JdM7WvI+5imMdxIyMRM04Jv+GDVP1l/HD3FNPQ5XBN6xtbzB9fQkYL4LIv20ZiTLSeGry4uBDB
	0UkMtYJgMWRTxedc6/3WPCnX5quxXZL74fDnrnPyB9clh8rsGiNyvViH1qo/b9B9D40uQqL/HDG
	g+GZO6w4sZVNqWKIJsawB2PPgpwDtzHMPPL/VL0zA+JAnGLlLlRn6WTx7kviAqj1wnBhQxjWW2f
	bdbMA0iv/D/SdGkhIhh7myLRhvb/ijpUJKgYg0J+U0uFvll3Ld3lfGtQmNWTIfBzqxyRhnw
X-Received: by 2002:a05:600c:46d5:b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49fde497533mr28139365e9.11.1790154695900;
        Wed, 23 Sep 2026 02:11:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/48] cpio: patch CVE-2026-66485
Date: Wed, 23 Sep 2026 11:10:18 +0200
Message-ID: <090d104c522f4d1c3b99ab29f8214a1e14c3e36e.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246478

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE description.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c105fbf82e2f50b05dc680e0601bf0ea3198e58c)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cpio/cpio_2.15.bb       |   1 +
 .../cpio/files/CVE-2026-66485.patch           | 210 ++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index a5c9b76da20..f4b562fdc2c 100644
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

