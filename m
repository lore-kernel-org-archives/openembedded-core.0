Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3302B6E666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 11:53:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c82so5326222wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 04:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DsI3QwdrG14c6v11thrZ6V0ETljxPG0FqlMw15T0fjQ=;
	b=FmQEi02Kw6INfupY/jGq4Sxeoyk5HG62P6upPSR7oNRIXKB7CgeTMfsvlTB+grkUF9
	HlCuGDrMiHUrSGXQVtQtUTFCZTMJOLaRJFs2+C08OJFfw/309tuf/AgVrz5pg095zTWY
	WHQ/knXoojQ/+eE69sqZZ7K6s+LVicEjILBKuICjh2/gTR1UvdoshdEdKZ/kVmVZExS2
	8ElzMQBFBqNzMGv/MVpDGDRrSsh74Sk0RqgWJ8IO5jx9toA2vphU50flte6QtxfxPN6r
	WXzFKBJURFNKDEq8fRgCUqdGQ+NWusFgphPNTu6njzRDWypXyTYS9ZUO8MTO5SXRkeCC
	CiJA==
X-Gm-Message-State: ALyK8tLCjfvDxJm4T1q8HYdK84XUysGmoc8QVLfXp+kbO/0fervymI1yurkcG3YvXAgrtA==
X-Received: by 10.28.70.3 with SMTP id t3mr3091505wma.20.1467114799133;
	Tue, 28 Jun 2016 04:53:19 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id
	hf7sm4311597wjc.48.2016.06.28.04.53.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jun 2016 04:53:17 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 12:53:15 +0100
Message-Id: <1467114795-8025-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] libidn: add patch to build w/ -Wformat-security
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2016 11:53:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

While the file in question is a command line utility
only, let's be clean and still fix it.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 ...1-idn-fix-printf-format-security-warnings.patch | 181 +++++++++++++++++++++
 meta/recipes-extended/libidn/libidn_1.32.bb        |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-security-warnings.patch

diff --git a/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-security-warnings.patch b/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-security-warnings.patch
new file mode 100644
index 0000000..5adc7d9
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn/0001-idn-fix-printf-format-security-warnings.patch
@@ -0,0 +1,181 @@
+From 82f98dcbc429bbe89a9837c533cbcbc02e77c790 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Tue, 28 Jun 2016 12:43:31 +0100
+Subject: [PATCH] idn: fix printf() format security warnings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| ../../libidn-1.32/src/idn.c: In function 'main':
+| ../../libidn-1.32/src/idn.c:172:7: error: format not a string literal and no format arguments [-Werror=format-security]
+|        error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be specified"));
+|        ^~~~~
+| ../../libidn-1.32/src/idn.c:187:5: error: format not a string literal and no format arguments [-Werror=format-security]
+|      fprintf (stderr, _("Type each input string on a line by itself, "
+|      ^~~~~~~
+| ../../libidn-1.32/src/idn.c:202:4: error: format not a string literal and no format arguments [-Werror=format-security]
+|     error (EXIT_FAILURE, errno, _("input error"));
+|     ^~~~~
+| ../../libidn-1.32/src/idn.c:220:8: error: format not a string literal and no format arguments [-Werror=format-security]
+|         _("could not convert from UTF-8 to UCS-4"));
+|         ^
+| ../../libidn-1.32/src/idn.c:245:8: error: format not a string literal and no format arguments [-Werror=format-security]
+|         _("could not convert from UTF-8 to UCS-4"));
+|         ^
+| ../../libidn-1.32/src/idn.c:281:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       _("could not convert from UTF-8 to UCS-4"));
+|       ^
+| ../../libidn-1.32/src/idn.c:340:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       _("could not convert from UCS-4 to UTF-8"));
+|       ^
+| ../../libidn-1.32/src/idn.c:364:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       _("could not convert from UCS-4 to UTF-8"));
+|       ^
+| ../../libidn-1.32/src/idn.c:442:8: error: format not a string literal and no format arguments [-Werror=format-security]
+|         _("could not convert from UCS-4 to UTF-8"));
+|         ^
+| ../../libidn-1.32/src/idn.c:498:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       _("could not convert from UTF-8 to UCS-4"));
+|       ^
+| ../../libidn-1.32/src/idn.c:527:5: error: format not a string literal and no format arguments [-Werror=format-security]
+|      _("could not convert from UTF-8 to UCS-4"));
+|      ^
+| ../../libidn-1.32/src/idn.c:540:6: error: format not a string literal and no format arguments [-Werror=format-security]
+|       error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
+|       ^~~~~
+| ../../libidn-1.32/src/idn.c:551:5: error: format not a string literal and no format arguments [-Werror=format-security]
+|      _("could not convert from UTF-8 to UCS-4"));
+|      ^
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+Upstream-Status: Pending
+
+ src/idn.c | 27 ++++++++++++++-------------
+ 1 file changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/src/idn.c b/src/idn.c
+index be1c7d1..68e4291 100644
+--- a/src/idn.c
++++ b/src/idn.c
+@@ -170,7 +170,7 @@ main (int argc, char *argv[])
+       (args_info.idna_to_unicode_given ? 1 : 0) +
+       (args_info.nfkc_given ? 1 : 0) != 1)
+     {
+-      error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be specified"));
++      error (0, 0, "%s", _("only one of -s, -e, -d, -a, -u or -n can be specified"));
+       usage (EXIT_FAILURE);
+     }
+ 
+@@ -185,7 +185,7 @@ main (int argc, char *argv[])
+   if (!args_info.quiet_given
+       && args_info.inputs_num == 0
+       && isatty (fileno (stdin)))
+-    fprintf (stderr, _("Type each input string on a line by itself, "
++    fprintf (stderr, "%s", _("Type each input string on a line by itself, "
+ 		       "terminated by a newline character.\n"));
+ 
+   do
+@@ -197,7 +197,7 @@ main (int argc, char *argv[])
+ 	  if (feof (stdin))
+ 	    break;
+ 
+-	  error (EXIT_FAILURE, errno, _("input error"));
++	  error (EXIT_FAILURE, errno, "%s", _("input error"));
+ 	}
+ 
+       if (strlen (line) > 0)
+@@ -215,7 +215,7 @@ main (int argc, char *argv[])
+ 	  if (!q)
+ 	    {
+ 	      free (p);
+-	      error (EXIT_FAILURE, 0,
++	      error (EXIT_FAILURE, 0, "%s",
+ 		     _("could not convert from UTF-8 to UCS-4"));
+ 	    }
+ 
+@@ -240,7 +240,7 @@ main (int argc, char *argv[])
+ 	  if (!q)
+ 	    {
+ 	      free (r);
+-	      error (EXIT_FAILURE, 0,
++	      error (EXIT_FAILURE, 0, "%s",
+ 		     _("could not convert from UTF-8 to UCS-4"));
+ 	    }
+ 
+@@ -277,7 +277,7 @@ main (int argc, char *argv[])
+ 	  q = stringprep_utf8_to_ucs4 (p, -1, &len);
+ 	  free (p);
+ 	  if (!q)
+-	    error (EXIT_FAILURE, 0,
++	    error (EXIT_FAILURE, 0, "%s",
+ 		   _("could not convert from UTF-8 to UCS-4"));
+ 
+ 	  if (args_info.debug_given)
+@@ -336,7 +336,7 @@ main (int argc, char *argv[])
+ 	  r = stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
+ 	  free (q);
+ 	  if (!r)
+-	    error (EXIT_FAILURE, 0,
++	    error (EXIT_FAILURE, 0, "%s",
+ 		   _("could not convert from UCS-4 to UTF-8"));
+ 
+ 	  p = stringprep_utf8_to_locale (r);
+@@ -360,7 +360,7 @@ main (int argc, char *argv[])
+ 	  q = stringprep_utf8_to_ucs4 (p, -1, NULL);
+ 	  free (p);
+ 	  if (!q)
+-	    error (EXIT_FAILURE, 0,
++	    error (EXIT_FAILURE, 0, "%s",
+ 		   _("could not convert from UCS-4 to UTF-8"));
+ 
+ 	  if (args_info.debug_given)
+@@ -438,7 +438,7 @@ main (int argc, char *argv[])
+ 	  if (!q)
+ 	    {
+ 	      free (p);
+-	      error (EXIT_FAILURE, 0,
++	      error (EXIT_FAILURE, 0, "%s",
+ 		     _("could not convert from UCS-4 to UTF-8"));
+ 	    }
+ 
+@@ -494,7 +494,7 @@ main (int argc, char *argv[])
+ 	  r = stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
+ 	  free (q);
+ 	  if (!r)
+-	    error (EXIT_FAILURE, 0,
++	    error (EXIT_FAILURE, 0, "%s",
+ 		   _("could not convert from UTF-8 to UCS-4"));
+ 
+ 	  p = stringprep_utf8_to_locale (r);
+@@ -523,7 +523,7 @@ main (int argc, char *argv[])
+ 	      if (!q)
+ 		{
+ 		  free (p);
+-		  error (EXIT_FAILURE, 0,
++		  error (EXIT_FAILURE, 0, "%s",
+ 			 _("could not convert from UTF-8 to UCS-4"));
+ 		}
+ 
+@@ -537,7 +537,8 @@ main (int argc, char *argv[])
+ 	  r = stringprep_utf8_nfkc_normalize (p, -1);
+ 	  free (p);
+ 	  if (!r)
+-	    error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
++	    error (EXIT_FAILURE, 0, "%s",
++		   _("could not do NFKC normalization"));
+ 
+ 	  if (args_info.debug_given)
+ 	    {
+@@ -547,7 +548,7 @@ main (int argc, char *argv[])
+ 	      if (!q)
+ 		{
+ 		  free (r);
+-		  error (EXIT_FAILURE, 0,
++		  error (EXIT_FAILURE, 0, "%s",
+ 			 _("could not convert from UTF-8 to UCS-4"));
+ 		}
+ 
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/libidn/libidn_1.32.bb b/meta/recipes-extended/libidn/libidn_1.32.bb
index 565c75d..1337502 100644
--- a/meta/recipes-extended/libidn/libidn_1.32.bb
+++ b/meta/recipes-extended/libidn/libidn_1.32.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://libidn_fix_for_automake-1.12.patch \
            file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
            file://dont-depend-on-help2man.patch \
+           file://0001-idn-fix-printf-format-security-warnings.patch \
 "
 
 SRC_URI[md5sum] = "4dd8356ba577287ea7076bfa1554b534"
-- 
2.8.1


