Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2242.1795642820380865347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 13:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jELHqMtz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202611252140180bf16093c800020787-ypsyjf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202611252140180bf16093c800020787
        for <openembedded-core@lists.openembedded.org>;
        Wed, 25 Nov 2026 22:40:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5F9hzjf/uSjksO7Ol9CFsuwZ0MtmUyGfprvRsZt9+h4=;
 b=jELHqMtzo/86hPK0YQ4VAa4pebPy9dEFZUdRDwyYKEfFi9+ymsAcBKwSA6gMbyESS9TnY6
 Bgk5X88R4m7v2OUtgIlGU53v9aDxjiSJlgqHP8jATrGqCgRkd99f5TnnM1aLwcm559a0lf88
 jWqNwViMSa/87+2Y09CURwEqcQFvpKbmV4h5MW38/ozZLb4WQe8kG5Sx/vJqBzO3P0KsU9ku
 QyLC3UVF76BiO3iuGmCOLTmg73aT+9/SL1A00cUz98kTYb2g/Fnxqr01b9Zm60LU56SvGcyV
 vBr++iVp8pJwiNdsyHME2MEZ9DHCjOCe3OHjvWADVs9MfRdlA7zop5cA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 3/3] zip: patch CVE-2026-130335
Date: Wed, 25 Nov 2026 22:39:56 +0100
Message-ID: <20261125213956.3585234-3-peter.marko@siemens.com>
In-Reply-To: <20261125213956.3585234-1-peter.marko@siemens.com>
References: <20261125213956.3585234-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251268
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1].
It references Debian bug 1143866 which is referenced in NVD CVE links.
Zip is not maintained anymore, so there is no upstream

[1] https://salsa.debian.org/lts-team/packages/zip/-/blob/debian/3.0-12+deb11u1/debian/patches/fix-command-injection.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../zip/zip-3.0/CVE-2026-130335.patch         | 235 ++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |   1 +
 2 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/CVE-2026-130335.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/CVE-2026-130335.patch b/meta/recipes-extended/zip/zip-3.0/CVE-2026-130335.patch
new file mode 100644
index 00000000000..dc33f3c2b05
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/CVE-2026-130335.patch
@@ -0,0 +1,235 @@
+From: Paul Marquess <pmqs@outlook.com>
+Subject: Fix command injection issue
+Bug-Debian: https://bugs.debian.org/1143866
+X-Debian-version: 3.0-16
+
+CVE: CVE-2026-130335
+Upstream-Status: Inactive-Upstream [lastrelease: 2008]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/zip.c
++++ b/zip.c
+@@ -122,6 +122,7 @@
+ 
+ local void freeup  OF((void));
+ local int  finish  OF((int));
++local char *quote_arg(char *instring);
+ #if (!defined(MACOS) && !defined(WINDLL))
+ local void handler OF((int));
+ local void license OF((void));
+@@ -1323,6 +1324,134 @@
+   return 1;
+ }
+ 
++
++/* quote_arg()
++ *
++ * Add quotation and/or escapes to a shell (VMS: DCL) argument string
++ * appropriate to the local operating system or shell  (Unix, Windows,
++ * etc.).  This is mainly used to build the command line to pass to
++ * UnZip (or other application when -TT used) to test an archive.
++ * Return malloc()'d result.
++ *
++ *    All:     Add " at beginning and end.
++ *    MSDOS:   % -> "^%"
++ *             " -> \""
++ *    Unix:    ! -> "'!'"
++ *             $ -> \$
++ *             \ -> \\
++ *             ` -> \`
++ *    Non-VMS: " -> \"
++ *    VMS:     " -> """
++ *
++ * On VMS, quoted double apostrophes are also special.  Currently not
++ * handled.  (How?  Quotation marks are needed for (upper-)case
++ * preservation.  Double apostrophes in quotation marks are interpreted
++ * (symbol evaluation).  SMS sees no way to handle "fr''ed".  "fr'""'ed"
++ * becomes >fr'"'ed<, for example.)  Not a problem for file specs, but
++ * imposes a restriction on passwords.
++ */
++#ifndef NO_PROTO
++local char *quote_arg(char *instring)
++#else
++local char *quote_arg(instring)
++  char *instring;
++#endif
++{
++  int i;
++  int j;
++  char *tempstring;
++  char *outstring;
++  char c;
++
++  if (instring == NULL)
++    return NULL;
++
++# ifdef MSDOS
++#  define QA_FACTOR 4            /* Worst case (MSDOS): % -> "^%"  */
++
++# else /* not MSDOS */
++#  ifdef VMS
++#   define QA_FACTOR 3           /* Worst case (VMS): " -> """  */
++
++#  else /* not MSDOS or VMS */
++#   define QA_FACTOR 5           /* Worst case (Unix): ! -> "'!'"  */
++#  endif /* VMS [else] */
++# endif /* MSDOS [else] */
++
++# define QA_INCR 2               /* Surrounding quotation marks. */
++
++  i = QA_FACTOR * (int)strlen(instring) + QA_INCR + 1;
++  if ((tempstring = (char *)malloc(i)) == NULL) {
++    ZIPERR(ZE_MEM, "quote_arg");
++  }
++
++  j = 0;
++
++  tempstring[j++] = '\"';       /* Surrounding quotation mark (start). */
++
++  for (i = 0; instring[i]; i++) {
++    c = instring[i];
++
++# ifdef MSDOS /* or Windows */
++    if (c == '%')               /* Percent. */
++    {
++      tempstring[j++] = '"';    /* Add (closing) quotation mark. */
++      tempstring[j++] = '^';    /* Add caret escape. */
++      tempstring[j++] = '%';    /* Original character (%). */
++      c = '"';                  /* Prepare (re-opening) quotation mark. */
++    }
++    else if (c == '"')          /* Quotation mark. */
++    {
++      tempstring[j++] = '\\';   /* Add backslash (escape). */
++      tempstring[j++] = '"';    /* Add quote (acts as closing and literal). */
++    }
++# else /* not def MSDOS */
++
++#  ifdef VMS
++    if (c == '"')               /* Quotation mark. */
++    {
++      tempstring[j++] = '"';    /* Add two quotation marks. */
++      tempstring[j++] = '"';
++    }
++#  else /* not def VMS */
++
++    /* UNIX is default for others */
++
++    if (c == '"')               /* Quotation mark. */
++    {
++      tempstring[j++] = '\\';   /* Add backslash (escape). */
++    }
++    else if (c == '!')          /* Exclamation.  (Inefficient.) */
++    {
++      tempstring[j++] = '"';    /* Add (closing) quotation mark. */
++      tempstring[j++] = '\'';   /* Add (opening) apostrophe. */
++      tempstring[j++] = '!';    /* Original character (!). */
++      tempstring[j++] = '\'';   /* Add (closing) apostrophe. */
++      c = '"';                  /* Prepare (re-opening) quotation mark. */
++    }
++    else if ((c == '$') ||      /* Dollar sign. */
++             (c == '`') ||      /* Grave accent (backtick). */
++             (c == '\\'))       /* Backslash. */
++    {
++      tempstring[j++] = '\\';   /* Add backslash (escape). */
++    }
++
++#  endif /* def VMS [else] */
++# endif /* def MSDOS [else] */
++
++    tempstring[j++] = c;        /* Original (or other last) character. */
++  }
++
++  tempstring[j++] = '\"';       /* Surrounding quotation mark (end). */
++
++  tempstring[j] = '\0';
++  /* outstring = string_dup(tempstring, "quote_arg", NO_FLUFF); */
++  outstring = strdup(tempstring);
++  free(tempstring);
++
++  return outstring;
++}
++
+ local void check_zipfile(zipname, zippath)
+   char *zipname;
+   char *zippath;
+@@ -1424,11 +1553,15 @@
+ 
+ #else /* (MSDOS && !__GO32__) || __human68k__ */
+   char *cmd;
++  char *qzipname;
+   int result;
+ 
+   /* Tell picky compilers to shut up about unused variables */
+   zippath = zippath;
+ 
++  /* Quote each arg (and add appropriate escapes). */
++  qzipname = quote_arg(zipname);
++
+   if (unzip_path) {
+     /* user gave us a path to some unzip (may not be UnZip) */
+     char *here;
+@@ -1437,7 +1570,7 @@
+     /* Replace first {} with archive name.  If no {} append name to string. */
+     here = strstr(unzip_path, "{}");
+ 
+-    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 4)) == NULL) {
++    if ((cmd = malloc(strlen(unzip_path) + strlen(qzipname) + 4)) == NULL) {
+       ziperr(ZE_MEM, "building command string for testing archive");
+     }
+ 
+@@ -1447,32 +1580,20 @@
+       strcpy(cmd, unzip_path);
+       cmd[len] = '\0';
+       strcat(cmd, " ");
+-# ifdef UNIX
+-      strcat(cmd, "'");    /* accept space or $ in name */
+-      strcat(cmd, zipname);
+-      strcat(cmd, "'");
+-# else
+-      strcat(cmd, zipname);
+-# endif
++      strcat(cmd, qzipname);
+       strcat(cmd, " ");
+       strcat(cmd, here + 2);
+     } else {
+       /* No {} so append temp name to end */
+       strcpy(cmd, unzip_path);
+       strcat(cmd, " ");
+-# ifdef UNIX
+-      strcat(cmd, "'");    /* accept space or $ in name */
+-      strcat(cmd, zipname);
+-      strcat(cmd, "'");
+-# else
+-      strcat(cmd, zipname);
+-# endif
++      strcat(cmd, qzipname);
+     }
+     free(unzip_path);
+     unzip_path = NULL;
+ 
+   } else {
+-    if ((cmd = malloc(20 + strlen(zipname))) == NULL) {
++    if ((cmd = malloc(20 + strlen(qzipname))) == NULL) {
+       ziperr(ZE_MEM, "building command string for testing archive");
+     }
+ 
+@@ -1484,15 +1605,12 @@
+     if (check_unzip_version("unzip") == 0)
+       ZIPERR(ZE_TEST, zipfile);
+ 
+-# ifdef UNIX
+-    strcat(cmd, "'");    /* accept space or $ in name */
+-    strcat(cmd, zipname);
+-    strcat(cmd, "'");
+-# else
+-    strcat(cmd, zipname);
+-# endif
++    strcat(cmd, qzipname);
+   }
+ 
++  if (qzipname)
++    free(qzipname);
++
+   result = system(cmd);
+ # ifdef VMS
+   /* Convert success severity to 0, others to non-zero. */
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 04ad5f87eba..178b5e5558e 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch \
            file://0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch \
            file://CVE-2018-13410.patch \
+           file://CVE-2026-130335.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
