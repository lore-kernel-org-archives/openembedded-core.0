Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1432273D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 03:31:48 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so766310pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 20:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QgYFnQSCDPaI75Id65ZCC5JPSfHXDrCk5nhGqbZ7D3A=;
	b=Yp5/D51SDKcqjkWhKugBFE62+hdAPidN2gtrWGJ+5sX57bedjy/kCD0w1VMK8bTypB
	AzuKmkvmWEQdQNxsnzgW1Pd7YmB0D6cKGPSQIwMCxjC/KmFiEwT2LOv9xTQViYF9ZyWF
	1m+t7kQWylcgkWIYaAdcIIya5rLu2p2o+ywW5NroH4fHvCcqgBCzIifHhzEsKJLdBwYf
	bIoY3Vw0CIcTXG5/4M+0vYSjNeVBug8nocvz9JHOXX0cp9MpoDTuaECOjnTtqFqzijJY
	X2fMZ9QP0R7Ag3eV/J+/YyzaRn7b9w/pbIG3lhXervts2y9W3Qq/Gg2GQqUOlDbzM4m+
	vucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QgYFnQSCDPaI75Id65ZCC5JPSfHXDrCk5nhGqbZ7D3A=;
	b=IGXYm87F0AlAVb4rUVuy9GVYApq5vBO86TbEz6QIMD9n2VKJRYe6tpCfOdu/0ys+f5
	uRG6HY+Wdhzyt3UkWboRP56qQBs3DJdiXkl72oc+TTX8r+p4fUETF0hrBAFsHA3W3ulk
	/LcSsJ7/QRlUS1z+VuciQoD9rfwj5SYaF4YmkqbY3RXke7lrUeWx1UPH0roEk8acrgbr
	r5jvB7YcweSieD95/6VOx4sHb0ZNAMIDghxhrZx8EMnpy82M+dEn1Silys/yOc8M1Lse
	Jt8Qi73fRpqG+znLEKpoOUwxSFTFCy6I0OfMeFIf/2/FETohmu4kMsOCdFqWoDhflLrX
	gPpw==
X-Gm-Message-State: AEkoouuCXU1YTb/nh95MT6l3Z13GrPAzdMO66ZWuJzZ0r4lWrfHUmoyPNxRpRxqohg/GPg==
X-Received: by 10.98.147.14 with SMTP id b14mr23065233pfe.103.1470972709298;
	Thu, 11 Aug 2016 20:31:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id o2sm8464184pfg.10.2016.08.11.20.31.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 20:31:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 20:31:15 -0700
Message-Id: <20160812033115.2546-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160812033115.2546-1-raj.khem@gmail.com>
References: <20160812033115.2546-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] libtasn1: Backport compiler warning fixes
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
X-List-Received-Date: Fri, 12 Aug 2016 03:31:49 -0000

These patches are backported from master to fix issues raised by clang
compiler.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...configure-don-t-add-Werror-to-build-flags.patch | 28 +++++++++
 .../0002-ASN.y-corrected-compiler-warning.patch    | 28 +++++++++
 ...corrected-potential-null-pointer-derefere.patch | 73 ++++++++++++++++++++++
 .../0004-tools-eliminated-compiler-warnings.patch  | 56 +++++++++++++++++
 meta/recipes-support/gnutls/libtasn1_4.9.bb        |  4 ++
 5 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch b/meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
new file mode 100644
index 0000000..ae64394
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
@@ -0,0 +1,28 @@
+From 908e9fa4c1172f09e0e45420a403dc25ed0a466c Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Tue, 26 Jul 2016 08:45:33 +0200
+Subject: [PATCH 1/4] configure: don't add -Werror to build flags
+
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7a14e04..066f5fe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,8 +70,6 @@ AC_ARG_ENABLE([gcc-warnings],
+ )
+ 
+ if test "$gl_gcc_warnings" = yes; then
+-  gl_WARN_ADD([-Werror], [WERROR_CFLAGS])
+-
+   nw="$nw -Wsystem-headers"         # Don't let system headers trigger warnings
+   nw="$nw -Wc++-compat"             # We don't care strongly about C++ compilers
+   nw="$nw -Wtraditional"            # Warns on #elif which we use often
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch b/meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch
new file mode 100644
index 0000000..dd36422
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch
@@ -0,0 +1,28 @@
+From 3542c01618fcde83b29640ea2c60bfd2629ae0b7 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Tue, 26 Jul 2016 08:47:49 +0200
+Subject: [PATCH 2/4] ASN.y: corrected compiler warning
+
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ lib/ASN1.y | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ASN1.y b/lib/ASN1.y
+index 731415d..6db638f 100644
+--- a/lib/ASN1.y
++++ b/lib/ASN1.y
+@@ -621,7 +621,7 @@ _asn1_create_errorDescription (int error, char *error_desc)
+     case ASN1_NAME_TOO_LONG:
+       snprintf (error_desc, ASN1_MAX_ERROR_DESCRIPTION_SIZE,
+                 "%s:%u: name too long (more than %u characters)", file_name,
+-                line_number, ASN1_MAX_NAME_SIZE);
++                line_number, (unsigned)ASN1_MAX_NAME_SIZE);
+       break;
+     case ASN1_IDENTIFIER_NOT_FOUND:
+       snprintf (error_desc, ASN1_MAX_ERROR_DESCRIPTION_SIZE,
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch b/meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch
new file mode 100644
index 0000000..2420143
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch
@@ -0,0 +1,73 @@
+From c8903aa27dc9de1d9efeed9d1f7894f1019548f7 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Tue, 26 Jul 2016 08:49:15 +0200
+Subject: [PATCH 3/4] parser_aux: corrected potential null pointer dereferences
+
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ lib/parser_aux.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/parser_aux.c b/lib/parser_aux.c
+index 2285b20..12ee16f 100644
+--- a/lib/parser_aux.c
++++ b/lib/parser_aux.c
+@@ -637,7 +637,7 @@ _asn1_change_integer_value (asn1_node node)
+ 		      p = NULL;
+ 		      break;
+ 		    }
+-		  if (p->right)
++		  if (p && p->right)
+ 		    {
+ 		      p = p->right;
+ 		      break;
+@@ -753,7 +753,7 @@ _asn1_expand_object_id (asn1_node node)
+ 
+       if (move == RIGHT)
+ 	{
+-	  if (p->right)
++	  if (p && p->right)
+ 	    p = p->right;
+ 	  else
+ 	    move = UP;
+@@ -828,7 +828,7 @@ _asn1_expand_object_id (asn1_node node)
+ 
+       if (move == RIGHT)
+ 	{
+-	  if (p->right)
++	  if (p && p->right)
+ 	    p = p->right;
+ 	  else
+ 	    move = UP;
+@@ -898,7 +898,7 @@ _asn1_type_set_config (asn1_node node)
+ 
+       if (move == RIGHT)
+ 	{
+-	  if (p->right)
++	  if (p && p->right)
+ 	    p = p->right;
+ 	  else
+ 	    move = UP;
+@@ -1007,7 +1007,7 @@ _asn1_check_identifier (asn1_node node)
+ 		  p = NULL;
+ 		  break;
+ 		}
+-	      if (p->right)
++	      if (p && p->right)
+ 		{
+ 		  p = p->right;
+ 		  break;
+@@ -1067,7 +1067,7 @@ _asn1_set_default_tag (asn1_node node)
+ 		  p = NULL;
+ 		  break;
+ 		}
+-	      if (p->right)
++	      if (p && p->right)
+ 		{
+ 		  p = p->right;
+ 		  break;
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch b/meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch
new file mode 100644
index 0000000..7bda0e6
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch
@@ -0,0 +1,56 @@
+From d647bb2fa1bd288a6ac02c18318f3cba2a34c3a0 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Tue, 26 Jul 2016 08:50:24 +0200
+Subject: [PATCH 4/4] tools: eliminated compiler warnings
+
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ src/asn1Coding.c   | 2 +-
+ src/asn1Decoding.c | 2 +-
+ src/asn1Parser.c   | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/asn1Coding.c b/src/asn1Coding.c
+index d4df593..b516bfe 100644
+--- a/src/asn1Coding.c
++++ b/src/asn1Coding.c
+@@ -188,7 +188,7 @@ main (int argc, char *argv[])
+ 	default:
+ 	  fprintf (stderr,
+ 		   "asn1Coding: ?? getopt returned character code Ox%x ??\n",
+-		   option_result);
++		   (unsigned)option_result);
+ 	}
+     }
+ 
+diff --git a/src/asn1Decoding.c b/src/asn1Decoding.c
+index 078963e..20f91ac 100644
+--- a/src/asn1Decoding.c
++++ b/src/asn1Decoding.c
+@@ -131,7 +131,7 @@ main (int argc, char *argv[])
+ 	default:
+ 	  fprintf (stderr,
+ 		   "asn1Decoding: ?? getopt returned character code Ox%x ??\n",
+-		   option_result);
++		   (unsigned)option_result);
+ 	}
+     }
+ 
+diff --git a/src/asn1Parser.c b/src/asn1Parser.c
+index 7a3ae67..475bfc9 100644
+--- a/src/asn1Parser.c
++++ b/src/asn1Parser.c
+@@ -139,7 +139,7 @@ main (int argc, char *argv[])
+ 	default:
+ 	  fprintf (stderr,
+ 		   "asn1Parser: ?? getopt returned character code Ox%x ??\n",
+-		   option_result);
++		   (unsigned)option_result);
+ 	}
+ 
+     }
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.9.bb b/meta/recipes-support/gnutls/libtasn1_4.9.bb
index 5ce06d8..9a5c557 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.9.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.9.bb
@@ -10,6 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://0001-configure-don-t-add-Werror-to-build-flags.patch \
+           file://0002-ASN.y-corrected-compiler-warning.patch \
+           file://0003-parser_aux-corrected-potential-null-pointer-derefere.patch \
+           file://0004-tools-eliminated-compiler-warnings.patch \
            "
 
 SRC_URI[md5sum] = "3018d0f466a32b66dde41bb122e6cab6"
-- 
2.9.2


