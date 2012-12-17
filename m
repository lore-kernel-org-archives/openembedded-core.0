Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TkVJK-0001qE-C6
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 08:40:28 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so2355330bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2012 23:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rUs1mB5TXT1XE/kij6uCFsLp1AirMSlM7uxsHdaTmuo=;
	b=BVfq0mBxxnze25k5ElVk63E/kLLFxkynnjMmd9Z+UOvTDMSKC6oiUoG5tqqoUOCOu8
	DJzup4y8DdhMBkLsMOPI8v3HRsFPcUssMRMaR6WiQFWyLz1ATbCI5nHwfM945ZT4gRlD
	1LS5DtLMoFU7qrtuMh6VazGNVFwfkuphmuzlKm671kEtJA2Mllz/1bZJkwJdy0Wty+Vl
	LWkmthgEyTbP9tmUqzF+McdbIJxKfjradjUwN4FjVfeT/yv1VpraJeneaDMU3Ql1Sgwp
	IJMB7AG4dWYQfdu1xM9kLwgGTOSQLdDZpR4HOqsrm0ToyUI8uA+lY7HM2n3Ht6dj+Rvd
	rkJA==
Received: by 10.204.130.210 with SMTP id u18mr5350131bks.129.1355729146031;
	Sun, 16 Dec 2012 23:25:46 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id e22sm8389570bke.14.2012.12.16.23.25.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 23:25:45 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TkV54-000468-QR; Mon, 17 Dec 2012 09:25:42 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 09:25:40 +0200
Message-Id: <1355729141-15722-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] patch: drop global-reject-file patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 07:40:28 -0000

global-reject-file.diff was patch ported from Debian that Debian
itself has dropped as upstream now has equivalent functionality.
To update users of this functionality, replace
"--global-reject-file=file" with simple "--reject-file=file" which
no longer overwrites reject hunks from different files.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../patch/patch-2.6.1/global-reject-file.diff      |  188 --------------------
 meta/recipes-devtools/patch/patch_2.6.1.bb         |    5 +-
 2 files changed, 1 insertion(+), 192 deletions(-)
 delete mode 100644 meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff

diff --git a/meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff b/meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff
deleted file mode 100644
index 2eaee8a..0000000
--- a/meta/recipes-devtools/patch/patch-2.6.1/global-reject-file.diff
+++ /dev/null
@@ -1,188 +0,0 @@
-Upstream-Status: Inappropriate [debian patch]
-
-Index: patch-2.6.1/patch.man
-===================================================================
---- patch-2.6.1.orig/patch.man
-+++ patch-2.6.1/patch.man
-@@ -557,6 +557,15 @@ instead of the default
- .B \&.rej
- file.  When \fIrejectfile\fP is \fB\-\fP, discard rejects.
- .TP
-+.BI \*=global\-reject\-file= rejectfile
-+Put all rejects into
-+.I rejectfile
-+instead of creating separate reject files for all files that have rejects. The
-+.I rejectfile
-+will contain headers that identify which file each reject refers to. Note that
-+the global reject file is created even if \-\-dry\-run is specified (while
-+non-global reject files will only be created without \-\-dry\-run).
-+.TP
- \fB\-R\fP  or  \fB\*=reverse\fP
- Assume that this patch was created with the old and new files swapped.
- (Yes, I'm afraid that does happen occasionally, human nature being what it
-Index: patch-2.6.1/src/patch.c
-===================================================================
---- patch-2.6.1.orig/src/patch.c
-+++ patch-2.6.1/src/patch.c
-@@ -52,6 +52,7 @@ static void reinitialize_almost_everythi
- static void remove_if_needed (char const *, int volatile *);
- static void usage (FILE *, int) __attribute__((noreturn));
- 
-+static void reject_header (const char *filename);
- static void abort_hunk (bool, bool);
- static void abort_hunk_context (bool, bool);
- static void abort_hunk_unified (bool, bool);
-@@ -83,6 +84,7 @@ static int Argc;
- static char * const *Argv;
- 
- static FILE *rejfp;  /* reject file pointer */
-+static char *global_reject;
- 
- static char const *patchname;
- static char *rejname;
-@@ -159,6 +161,10 @@ main (int argc, char **argv)
-     /* Make sure we clean up in case of disaster.  */
-     set_signals (false);
- 
-+    /* initialize global reject file */
-+    if (global_reject)
-+      init_reject ();
-+
-     if (inname && outfile)
-       {
- 	apply_empty_patch = true;
-@@ -205,8 +211,9 @@ main (int argc, char **argv)
- 	    init_output (TMPOUTNAME, exclusive, &outstate);
- 	  }
- 
--	/* initialize reject file */
--	init_reject ();
-+	/* initialize per-patch reject file */
-+	if (!global_reject)
-+	  init_reject ();
- 
- 	/* find out where all the lines are */
- 	if (!skip_rest_of_patch)
-@@ -295,6 +302,8 @@ main (int argc, char **argv)
- 			|| ! where
- 			|| ! apply_hunk (&outstate, where))))
- 	      {
-+		if (!failed)
-+		  reject_header(outname);
- 		abort_hunk (! failed, reverse);
- 		failed++;
- 		if (verbosity == VERBOSE ||
-@@ -331,7 +340,8 @@ main (int argc, char **argv)
- 		    fclose (outstate.ofp);
- 		    outstate.ofp = 0;
- 		  }
--		fclose (rejfp);
-+		if (!global_reject)
-+		  fclose (rejfp);
- 		continue;
- 	      }
- 
-@@ -430,13 +440,13 @@ main (int argc, char **argv)
- 	struct stat rejst;
- 
- 	if ((failed && fstat (fileno (rejfp), &rejst) != 0)
--	    || fclose (rejfp) != 0)
-+	    || (( !global_reject && fclose (rejfp) != 0)))
- 	    write_fatal ();
- 	if (failed) {
- 	    somefailed = true;
- 	    say ("%d out of %d hunk%s %s", failed, hunk, "s" + (hunk == 1),
- 		 skip_rest_of_patch ? "ignored" : "FAILED");
--	    if (outname && (! rejname || strcmp (rejname, "-") != 0)) {
-+	    if (!global_reject && outname && (! rejname || strcmp (rejname, "-") != 0)) {
- 		char *rej = rejname;
- 		if (!rejname) {
- 		    /* FIXME: This should really be done differnely!  */
-@@ -485,6 +495,23 @@ main (int argc, char **argv)
-       }
-       set_signals (true);
-     }
-+    if (global_reject)
-+      {
-+	struct stat rejst;
-+
-+	if ((somefailed && fstat (fileno (rejfp), &rejst) != 0)
-+	    || fclose (rejfp) != 0)
-+	  write_fatal ();
-+	if (somefailed)
-+	  {
-+	  say (" -- saving rejects to file %s\n", quotearg (global_reject));
-+	  /*if (! dry_run)
-+	    {*/
-+	      move_file (TMPREJNAME, &TMPREJNAME_needs_removal,
-+			 &rejst, global_reject, 0644, false);
-+	    /*}*/
-+	  }
-+      }
-     if (outstate.ofp && (ferror (outstate.ofp) || fclose (outstate.ofp) != 0))
-       write_fatal ();
-     cleanup ();
-@@ -572,6 +599,7 @@ static struct option const longopts[] =
-   {"posix", no_argument, NULL, CHAR_MAX + 7},
-   {"quoting-style", required_argument, NULL, CHAR_MAX + 8},
-   {"reject-format", required_argument, NULL, CHAR_MAX + 9},
-+  {"global-reject-file", required_argument, NULL, CHAR_MAX + 10},
-   {NULL, no_argument, NULL, 0}
- };
- 
-@@ -636,6 +664,7 @@ static char const *const option_help[] =
- "",
- "  -d DIR  --directory=DIR  Change the working directory to DIR first.",
- "  --reject-format=FORMAT  Create 'context' or 'unified' rejects.",
-+"  --global-reject-file=file  Put all rejects into one file.",
- "  --binary  Read and write data in binary mode.",
- "",
- "  -v  --version  Output version info.",
-@@ -852,6 +881,9 @@ get_some_switches (void)
- 		else
- 		  usage (stderr, 2);
- 		break;
-+	    case CHAR_MAX + 10:
-+		global_reject = savestr (optarg);
-+		break;
- 	    default:
- 		usage (stderr, 2);
- 	}
-@@ -1512,6 +1544,37 @@ similar (register char const *a, registe
-     }
- }
- 
-+ static char *
-+format_timestamp (char timebuf[37], bool which)
-+{
-+  time_t ts = pch_timestamp(which);
-+  if (ts != -1)
-+    {
-+      struct tm *tm = localtime(&ts);
-+      strftime(timebuf, 37, "\t%Y-%m-%d %H:%M:%S.000000000 %z", tm);
-+    }
-+  else
-+    timebuf[0] = 0;
-+  return timebuf;
-+}
-+
-+/* Write a header in a reject file that combines multiple hunks. */
-+static void
-+reject_header (const char *outname)
-+{
-+    char timebuf0[37], timebuf1[37];
-+    if (!global_reject)
-+      return;
-+    if (diff_type == UNI_DIFF)
-+	fprintf(rejfp, "--- %s.orig%s\n+++ %s%s\n",
-+		outname, format_timestamp(timebuf0, reverse),
-+		outname, format_timestamp(timebuf1, !reverse));
-+    else
-+	fprintf(rejfp, "*** %s.orig%s\n--- %s%s\n",
-+		outname, format_timestamp(timebuf0, reverse),
-+		outname, format_timestamp(timebuf1, !reverse));
-+}
-+
- /* Make a temporary file.  */
- 
- #if HAVE_MKTEMP && ! HAVE_DECL_MKTEMP && ! defined mktemp
diff --git a/meta/recipes-devtools/patch/patch_2.6.1.bb b/meta/recipes-devtools/patch/patch_2.6.1.bb
index 5055747..2733854 100644
--- a/meta/recipes-devtools/patch/patch_2.6.1.bb
+++ b/meta/recipes-devtools/patch/patch_2.6.1.bb
@@ -1,9 +1,7 @@
 require patch.inc
 LICENSE = "GPLv3"
 
-PR = "r1"
-
-SRC_URI += " file://global-reject-file.diff "
+PR = "r2"
 
 SRC_URI[md5sum] = "d758eb96d3f75047efc004a720d33daf"
 SRC_URI[sha256sum] = "d1563731e9cffed11cc5f011b2b8e074c325e86a383a91889b5c5b80b09781b9"
@@ -11,4 +9,3 @@ SRC_URI[sha256sum] = "d1563731e9cffed11cc5f011b2b8e074c325e86a383a91889b5c5b80b0
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 acpaths = "-I ${S}/gl/m4 -I ${S}/m4 "
-
-- 
1.7.10.4



