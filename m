Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCFDC5CFC1
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 19:08:37 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14254.1786820913004701320
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 12:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=FkD1pIgX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026081519083090923335c10002076b-19hg2a@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026081519083090923335c10002076b
        for <openembedded-core@lists.openembedded.org>;
        Sat, 15 Aug 2026 21:08:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jDloaR1qOFb+PB+DbskXuih3R2EE7VM9HZkxPhnNp4U=;
 b=FkD1pIgXgufL9H4CFllHPqabc32x9n5ERbbz7dewm3GmdwWcPRJfKk0KpG/sYtF+GfnakS
 7g7cxJr0/GIuCesYISg00m/kX3aJs5GBl66/n77BOUHHHgaWHFq/07STerl6s9AgVAYAerk4
 4OLeq9xqDz7TqZRrDfhjwRisuXsS9Ru8F6ci7O3kdWl7qJBF4j8+fbqLnUrc/fIK9IWJ6m8I
 j0L514g1vGju8+H9Nkt6+CGJm0JijjkpE6+/GeUJd4HCdmbNgZLuw4iSbFI877ird3cINwW4
 AQmpb0ipkIbGZOyKRC4aIDeItLtuHfu8V0Oc9HhhzbUN3ualDma4iNww==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/3] cpio: patch CVE-2026-66485
Date: Sat, 15 Aug 2026 21:08:22 +0200
Message-ID: <20260815190824.2980891-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 19:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243499

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE description.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c105fbf82e2f50b05dc680e0601bf0ea3198e58c)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

