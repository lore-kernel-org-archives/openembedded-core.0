Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36F7D78EB8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:44 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id e11-v6so1197984plb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3lK0CAQklCGhB2+nhIWHuWJJZJ/tVoaAhH92Pw037hg=;
	b=BIBmJtwsM5Ugoi+b61yAcv+AJNklNConzO7Aa/Tf1xABpwimjZqS0/gwoIXdQUqrOO
	dt1z6ZEbAFqQsR0pvGqKuK7xUHXkkXMBCrpG22h6rZ9yxbZ4CVfleYmWRypR8pf6PPX+
	GEPaDp9aIA7A4f/XF4xzFVLs+4pguJ+Rt6hFozY/SBLfuMDaNK8inB2kPwkLnpkVKSIt
	UyVvPAvYPHjAoHnPaF2WoyROZjCXag2OxDao72T7dWr2xmL/TnPBg56H368UUBqk+UQD
	Dln+xDDqMQNDwUd+9QjMGfsgxybexnSPHb+zZB0/AZvQ7rPw9jbTMnJIxzhEtYVpj37C
	CJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3lK0CAQklCGhB2+nhIWHuWJJZJ/tVoaAhH92Pw037hg=;
	b=b3Y4UtUggYb3MUMOjCNKIqAguvKTdyDcewP1n0GGZ52LvjyM/iIJrDCoBDERdneKMz
	9WBoUTO0md+sz6DeCMAcTdbGmGV0bbpqm8c1cPkSmZDN+5b84EkpSFW51nJAmHetfsJV
	+MDAjab0eJBep1Ho5wAEhM29NURQ6iybcsyfhz1l9opcRJUz60XA1RF9X9g1KlqYsr4j
	oLuBNcQ+XAICRdovaBrfvjdDtRFJJ6gzU/O12uq0lPEG3DAwMZmak4047H/MkXk8MFm5
	YNeuIDcpc+HB9FaHMsuQXHerIzHXHv+V+5iY9NonYDrCGMN1gxa8BeBBtu+VzhaENhjx
	ASgA==
X-Gm-Message-State: AOUpUlHREvuHdRERXz9Rkd1Ee1vVq8SWTcItINJQZDBRgS89C7hJFQ2m
	B3ozzFoYfkYY2fGdZfusEuN/SF/f
X-Google-Smtp-Source: AA+uWPyNSTt7jDiPgTyvV9wpYq4r30iBpYAhAGP/Xh80O/wRRl7llEBmEK3E2J51E2y4kZ0EeWfDBw==
X-Received: by 2002:a17:902:b7c6:: with SMTP id
	v6-v6mr2998286plz.49.1533742545547; 
	Wed, 08 Aug 2018 08:35:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:17 -0700
Message-Id: <1533742522-24357-22-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 22/27] binutls: Security fix for CVE-2017-16831
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:44 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-16831.patch         | 77 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-16831.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 69ad9b2..d9758c4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -58,6 +58,7 @@ SRC_URI = "\
      file://CVE-2017-16828_p2.patch \
      file://CVE-2017-16829.patch \
      file://CVE-2017-16830.patch \
+     file://CVE-2017-16831.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-16831.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-16831.patch
new file mode 100644
index 0000000..7acd5e0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-16831.patch
@@ -0,0 +1,77 @@
+From 6cee897971d4d7cd37d2a686bb6d2aa3e759c8ca Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 3 Nov 2017 11:55:21 +0000
+Subject: [PATCH] Fix excessive memory allocation attempts and possible integer
+ overfloaws when attempting to read a COFF binary with a corrupt symbol count.
+
+	PR 22385
+	* coffgen.c (_bfd_coff_get_external_symbols): Check for an
+	overlarge raw syment count.
+	(coff_get_normalized_symtab): Likewise.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE:  CVE-2017-16831
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  8 ++++++++
+ bfd/coffgen.c | 17 +++++++++++++++--
+ 2 files changed, 23 insertions(+), 2 deletions(-)
+
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,11 @@
++2017-11-03  Mingi Cho  <mgcho.minic@gmail.com>
++           Nick Clifton  <nickc@redhat.com>
++
++       PR 22385
++       * coffgen.c (_bfd_coff_get_external_symbols): Check for an
++       overlarge raw syment count.
++       (coff_get_normalized_symtab): Likewise.
++
+ 2017-10-17  Alan Modra  <amodra@gmail.com>
+  
+        PR 22307
+Index: git/bfd/coffgen.c
+===================================================================
+--- git.orig/bfd/coffgen.c
++++ git/bfd/coffgen.c
+@@ -1640,13 +1640,23 @@ _bfd_coff_get_external_symbols (bfd *abf
+   size = obj_raw_syment_count (abfd) * symesz;
+   if (size == 0)
+     return TRUE;
++   /* Check for integer overflow and for unreasonable symbol counts.  */
++   if (size < obj_raw_syment_count (abfd)
++       || (bfd_get_file_size (abfd) > 0
++          && size > bfd_get_file_size (abfd)))
++
++     {
++       _bfd_error_handler (_("%B: corrupt symbol count: %#Lx"),
++                         abfd, obj_raw_syment_count (abfd));
++       return FALSE;
++    }
+ 
+   syms = bfd_malloc (size);
+   if (syms == NULL)
+     {
+       /* PR 21013: Provide an error message when the alloc fails.  */
+-      _bfd_error_handler (_("%B: Not enough memory to allocate space for %lu symbols"),
+-			  abfd, size);
++      _bfd_error_handler (_("%B: not enough memory to allocate space for %#Lx symbols of size %#Lx"),
++                         abfd, obj_raw_syment_count (abfd), symesz);
+       return FALSE;
+     }
+ 
+@@ -1790,6 +1800,9 @@ coff_get_normalized_symtab (bfd *abfd)
+     return NULL;
+ 
+   size = obj_raw_syment_count (abfd) * sizeof (combined_entry_type);
++  /* Check for integer overflow.  */
++  if (size < obj_raw_syment_count (abfd))
++    return NULL;
+   internal = (combined_entry_type *) bfd_zalloc (abfd, size);
+   if (internal == NULL && size != 0)
+     return NULL;
-- 
2.7.4


