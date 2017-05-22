Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0308077F73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:02 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 9so70330632pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lKchD7I8VBbeYPpPfq/KFJbDtLgTnNYlDFCUZ4uu5ws=;
	b=J0sBPkAhhjhZt69Q1i5C7LK4LCtg15S+mYSddIOPkGIwqqOuDc/aDh0AJuJ/gWcpUK
	lVa7JOtY4I2jmnBI2d9TeHUDQLNbIODzhCJ3GMveGTulUPEtm7jemNpaw9G1yVeTicyS
	l7tz6SmwI9UkPRUWHQ2wulVm7sIS/DiiEw/2qR+FAw12Vb+g1HSBtCa99G4lPJxzRw8F
	5JU7vKazTafFEKvpxpOAos0yyj0CGeB6pFwnfezzdD0/qB7NFREq1bHlwWxay1Af2iTn
	RE7tT2KY5Az841TO/suFUVyALdIz7Y6YXZsJ9XWVTdhtF0R6m3YIMGopu3f4/xCEvIdl
	v+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lKchD7I8VBbeYPpPfq/KFJbDtLgTnNYlDFCUZ4uu5ws=;
	b=Bxii40KFJC7aWbXFMZLckLEDH6ToeV9ZZqSQ5aCaH6LcHUvzRhm2yP8ow+AQrTgUs/
	g6pp4lWHqrTaTFTaHAAbnBmyxaLBfI3z1h69ql5UhMeLPjmEmanuORkG4yDrFf87yCea
	d2gxzopVqQ9Yck1/BVVbT45r9TXtLGvwK1SAIzZRsYXdLACqlh8krJBIwp5VYEjDeqkL
	piafrQ0btTlX/qU4N+yraYncPD3l9K4A+IJYnerAku7IazWaFg7zwu5wxszIr3udzvCM
	SqgF981SIUV7N0P02vXxsB7UiZt4v4SLqvFhqILhOKr/B0mxh78JzwITfhOZzu/39/Pk
	kUIg==
X-Gm-Message-State: AODbwcDr3ZC+Ufx3UNHiPMimJGAEpvzUtsmidNGJOurUtm+3aQuZkX1l
	vH5YrUwyedAjhg9S
X-Received: by 10.99.130.73 with SMTP id w70mr23404400pgd.119.1495429263213;
	Sun, 21 May 2017 22:01:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:32 -0700
Message-Id: <20170522050042.42403-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/15] libidn: Fix hardened build with musl
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
X-List-Received-Date: Mon, 22 May 2017 05:01:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Re-introduce the patch that was deemed to be not needed
but it infact is still needed with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libidn/0001-idn-format-security-warnings.patch | 181 +++++++++++++++++++++
 meta/recipes-extended/libidn/libidn_1.33.bb        |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch

diff --git a/meta/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch b/meta/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch
new file mode 100644
index 0000000000..5adc7d9fd9
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn/0001-idn-format-security-warnings.patch
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
diff --git a/meta/recipes-extended/libidn/libidn_1.33.bb b/meta/recipes-extended/libidn/libidn_1.33.bb
index 109cc7f3f5..9e8bdbae18 100644
--- a/meta/recipes-extended/libidn/libidn_1.33.bb
+++ b/meta/recipes-extended/libidn/libidn_1.33.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            file://0001-idn-fix-printf-format-security-warnings.patch \
            file://gcc7-compatibility.patch \
+           file://0001-idn-format-security-warnings.patch \
 "
 
 SRC_URI[md5sum] = "a9aa7e003665de9c82bd3f9fc6ccf308"
-- 
2.13.0


