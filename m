Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9022EC5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 20:45:02 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4955.1786567498069683825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 13:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kwVSMyuU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260812204454b4089ac2b70002071a-dfvoei@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260812204454b4089ac2b70002071a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Aug 2026 22:44:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2u1CXrGh3wIX+JIeaRb2LrEN9Wpg3zzz46jOaS7xN3E=;
 b=kwVSMyuU4fQ1rnaDESrtQqcbMAmPt2L/ctxo+bAGrR/kWcg65BcS9/X/s0ebevq+mjZAZn
 4ETMN1XEfAqCYIvtYbHD2YHVTg5ZT9LIMIBo9j4cReAxH7h9FA+dgmS5X+p5VzQ1OBv+xcDG
 cYWgkNgIc14KQYVGb6plVhOBmAS5nVTBtMwxOfC/BSVFRpoX/HuVGVrIONVqJa5StFZRn8dq
 AesOPgXk6RwxHr0fPOXh86dPao8W0Ki/EGLVS3GeuMnRItos2ZbRPBLvRlHo2NfGWjBaLTLC
 NWVWe94ZN6/uv5eugjc024shYgPOyHFB8qkHviou3QH8alZ5mjQ1+K6Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/3] cpio: patch CVE-2026-66485
Date: Wed, 12 Aug 2026 22:44:30 +0200
Message-ID: <20260812204433.855482-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 20:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243304

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE description.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb       |   1 +
 .../cpio/files/CVE-2026-66485.patch           | 210 ++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index 8c31209f77..324f5e9490 100644
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
index 0000000000..f9c0f48281
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

