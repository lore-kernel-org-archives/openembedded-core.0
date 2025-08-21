Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7E2CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.696.1755790804775131433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l8bGEd1d;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-245fb4c8738so14098015ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790804; x=1756395604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBwCFQIYfRRKUiLTWCmC+g4UDOOxVDoVEpQ8P01YFCk=;
        b=l8bGEd1dRqT+CXL2iL0JFu7eXYYA9FasYKepwawTw7xqhqnOXswyLvDWhAbeTCbrcB
         uEKVDrbmgKdGIq//n7ma33RaY0a59CODirAqd0sfEduMdJUM5wVqxkqV/H0uYgwPGob9
         Qce445IhUbl0LwnO4vgZsLvS03vtyFcC5tGTODJ/lzfs+ncJgCR0gz/NY8wPfYPO+F2A
         ULuPyDFlO9VSuKhLx3FbLA7d7pYCj0OX/GDDx3HheV8krfcw+ma01xOXtJC/l8IB1h/r
         NHJfDpmsGxp9sDOjPALtsr8neW5D7GjZ9lyuIajptB2/RMN0LXSr0WtD8PC9Cw75lHQV
         zPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790804; x=1756395604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBwCFQIYfRRKUiLTWCmC+g4UDOOxVDoVEpQ8P01YFCk=;
        b=Tpn4bGbT8+HABrLLAs4BowMyzcj4Ebkg/kzdctd8TsilkLxn96tZIFahcv8mlzfGZQ
         q3ZGOBMnAGlfn2C32LGm+X0HOCkbXSk0I64dtcR9nn8KX6k2CE5Mehu004ytrt0Tidg+
         CgGD5Ka/DWQ5p8vx1ifoYK3MBjAvJLWa6LsndK0mK/EFdERNMaMROBsckQGORZXy1HyJ
         JLE6hc+TKRGaF9+SNm53h6tIUUAHXqBYjCPb2yNcv1aTDYBjbXgLVbPB9cxnzuCpOVUV
         Bbq0q+CN7pZEzEqFtsBOOZwmFFzkwWJcLdk8tVRD1PHcS1ncl7tjDE12XbrKwwWgI9Vr
         In0g==
X-Gm-Message-State: AOJu0Yxef5B9vw9giGrzDdgCgH4hy832vF6RdekiWtsTzd8jruQGckGV
	vm+x0mlE2k9HRdMG81efGsgcWotijBwC7Z+E6LywUojGkX4fxmCgVUhFjEOH82TLV1PTUTk7bJU
	tZdAU
X-Gm-Gg: ASbGncsRn/NlulMv2nGx6Sy3hYIEm+86U8i+u36uacFpK9GsnABp4vyx8zVNP7zfQ6U
	ia+YHrapHtafjl2JnTTHEAqux+3XJ17r655yRg8TAmHJY2mmX6WfH4Y7EZM72GJVGgdwaBzuUXF
	+Xh3+6AwamsB3179Fyy7PEVfk0Mob00deIp1R4zrn4uz6ByeoGUXJiX/sYQ/0eJeT4sUtDb5R01
	6JbUEyOZBvkGYURN00luEnSA6TxDQ1LGF3UZCEFCUwmmlKAIvsw5vOI20fEaKuoQWhkvlQPOD+z
	M3IvJ1QR+UFvXjsjdeRX5a0pAWP6CmXO2MQq+REUKnL0nx9SiLryqV44UHDRrDRXBDNeY29W9nI
	WNvAco8xgWahPJw==
X-Google-Smtp-Source: AGHT+IFBsAtYjqKgMJW7ZH2o2zS38eoO/O1UVqwIvMkoMuWZUdi0vlxMA1QDKCbZic8IE0WOHQq+VQ==
X-Received: by 2002:a17:903:4b07:b0:243:fd16:181f with SMTP id d9443c01a7336-245fed7e48fmr43190565ad.36.1755790803803;
        Thu, 21 Aug 2025 08:40:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/15] elfutils: Fix CVE-2025-1352
Date: Thu, 21 Aug 2025 08:39:42 -0700
Message-ID: <9f104c2005975c1dce6e67b23e34ab5a2e8f85ab.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222250

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability has been found in GNU elfutils 0.192 and classified as critical.
This vulnerability affects the function __libdw_thread_tail in the library
libdw_alloc.c of the component eu-readelf. The manipulation of the argument w
leads to memory corruption. The attack can be initiated remotely. The complexity
of an attack is rather high. The exploitation appears to be difficult. The exploit
has been disclosed to the public and may be used. The name of the patch is
2636426a091bd6c6f7f02e49ab20d4cdc6bfc753. It is recommended to apply a patch to
fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1352
https://ubuntu.com/security/CVE-2025-1352

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.192.bb                |   1 +
 .../elfutils/files/CVE-2025-1352.patch        | 154 ++++++++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 7bf9865555..829d9bf94f 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
            file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch \
+           file://CVE-2025-1352.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
new file mode 100644
index 0000000000..b5e8dff980
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
@@ -0,0 +1,154 @@
+From 2636426a091bd6c6f7f02e49ab20d4cdc6bfc753 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 8 Feb 2025 20:00:12 +0100
+Subject: [PATCH] libdw: Simplify __libdw_getabbrev and fix dwarf_offabbrev
+ issue
+
+__libdw_getabbrev could crash on reading a bad abbrev by trying to
+deallocate memory it didn't allocate itself. This could happen because
+dwarf_offabbrev would supply its own memory when calling
+__libdw_getabbrev. No other caller did this.
+
+Simplify the __libdw_getabbrev common code by not taking external
+memory to put the abbrev result in (this would also not work correctly
+if the abbrev was already cached). And make dwarf_offabbrev explicitly
+copy the result (if there was no error or end of abbrev).
+
+     * libdw/dwarf_getabbrev.c (__libdw_getabbrev): Don't take
+     Dwarf_Abbrev result argument. Always just allocate abb when
+     abbrev not found in cache.
+     (dwarf_getabbrev): Don't pass NULL as last argument to
+     __libdw_getabbrev.
+    * libdw/dwarf_tag.c (__libdw_findabbrev): Likewise.
+    * libdw/dwarf_offabbrev.c (dwarf_offabbrev): Likewise. And copy
+    abbrev into abbrevp on success.
+    * libdw/libdw.h (dwarf_offabbrev): Document return values.
+    * libdw/libdwP.h (__libdw_getabbrev): Don't take Dwarf_Abbrev
+    result argument.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32650
+
+CVE: CVE-2025-1352
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ libdw/dwarf_getabbrev.c | 12 ++++--------
+ libdw/dwarf_offabbrev.c | 10 +++++++---
+ libdw/dwarf_tag.c       |  3 +--
+ libdw/libdw.h           |  4 +++-
+ libdw/libdwP.h          |  3 +--
+ 5 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/libdw/dwarf_getabbrev.c b/libdw/dwarf_getabbrev.c
+index 5b02333..d9a6c02 100644
+--- a/libdw/dwarf_getabbrev.c
++++ b/libdw/dwarf_getabbrev.c
+@@ -1,5 +1,6 @@
+ /* Get abbreviation at given offset.
+    Copyright (C) 2003, 2004, 2005, 2006, 2014, 2017 Red Hat, Inc.
++   Copyright (C) 2025 Mark J. Wielaard <mark@klomp.org>
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2003.
+ 
+@@ -38,7 +39,7 @@
+ Dwarf_Abbrev *
+ internal_function
+ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
+-		   size_t *lengthp, Dwarf_Abbrev *result)
++		   size_t *lengthp)
+ {
+   /* Don't fail if there is not .debug_abbrev section.  */
+   if (dbg->sectiondata[IDX_debug_abbrev] == NULL)
+@@ -85,12 +86,7 @@ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
+   Dwarf_Abbrev *abb = NULL;
+   if (cu == NULL
+       || (abb = Dwarf_Abbrev_Hash_find (&cu->abbrev_hash, code)) == NULL)
+-    {
+-      if (result == NULL)
+-	abb = libdw_typed_alloc (dbg, Dwarf_Abbrev);
+-      else
+-	abb = result;
+-    }
++    abb = libdw_typed_alloc (dbg, Dwarf_Abbrev);
+   else
+     {
+       foundit = true;
+@@ -183,5 +179,5 @@ dwarf_getabbrev (Dwarf_Die *die, Dwarf_Off offset, size_t *lengthp)
+       return NULL;
+     }
+ 
+-  return __libdw_getabbrev (dbg, cu, abbrev_offset + offset, lengthp, NULL);
++  return __libdw_getabbrev (dbg, cu, abbrev_offset + offset, lengthp);
+ }
+diff --git a/libdw/dwarf_offabbrev.c b/libdw/dwarf_offabbrev.c
+index 27cdad6..41df69b 100644
+--- a/libdw/dwarf_offabbrev.c
++++ b/libdw/dwarf_offabbrev.c
+@@ -41,11 +41,15 @@ dwarf_offabbrev (Dwarf *dbg, Dwarf_Off offset, size_t *lengthp,
+   if (dbg == NULL)
+     return -1;
+ 
+-  Dwarf_Abbrev *abbrev = __libdw_getabbrev (dbg, NULL, offset, lengthp,
+-					    abbrevp);
++  Dwarf_Abbrev *abbrev = __libdw_getabbrev (dbg, NULL, offset, lengthp);
+ 
+   if (abbrev == NULL)
+     return -1;
+ 
+-  return abbrev == DWARF_END_ABBREV ? 1 : 0;
++  if (abbrev == DWARF_END_ABBREV)
++    return 1;
++
++  *abbrevp = *abbrev;
++
++  return 0;
+ }
+diff --git a/libdw/dwarf_tag.c b/libdw/dwarf_tag.c
+index d784970..218382a 100644
+--- a/libdw/dwarf_tag.c
++++ b/libdw/dwarf_tag.c
+@@ -53,8 +53,7 @@ __libdw_findabbrev (struct Dwarf_CU *cu, unsigned int code)
+ 
+ 	/* Find the next entry.  It gets automatically added to the
+ 	   hash table.  */
+-	abb = __libdw_getabbrev (cu->dbg, cu, cu->last_abbrev_offset, &length,
+-				 NULL);
++	abb = __libdw_getabbrev (cu->dbg, cu, cu->last_abbrev_offset, &length);
+ 	if (abb == NULL || abb == DWARF_END_ABBREV)
+ 	  {
+ 	    /* Make sure we do not try to search for it again.  */
+diff --git a/libdw/libdw.h b/libdw/libdw.h
+index d53dc78..ec4713a 100644
+--- a/libdw/libdw.h
++++ b/libdw/libdw.h
+@@ -587,7 +587,9 @@ extern int dwarf_srclang (Dwarf_Die *die);
+ extern Dwarf_Abbrev *dwarf_getabbrev (Dwarf_Die *die, Dwarf_Off offset,
+ 				      size_t *lengthp);
+ 
+-/* Get abbreviation at given offset in .debug_abbrev section.  */
++/* Get abbreviation at given offset in .debug_abbrev section.  On
++   success return zero and fills in ABBREVP.  When there is no (more)
++   abbrev at offset returns one.  On error returns a negative value.  */
+ extern int dwarf_offabbrev (Dwarf *dbg, Dwarf_Off offset, size_t *lengthp,
+ 			    Dwarf_Abbrev *abbrevp)
+      __nonnull_attribute__ (4);
+diff --git a/libdw/libdwP.h b/libdw/libdwP.h
+index d6bab60..0cff5c2 100644
+--- a/libdw/libdwP.h
++++ b/libdw/libdwP.h
+@@ -795,8 +795,7 @@ extern Dwarf_Abbrev *__libdw_findabbrev (struct Dwarf_CU *cu,
+ 
+ /* Get abbreviation at given offset.  */
+ extern Dwarf_Abbrev *__libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu,
+-					Dwarf_Off offset, size_t *lengthp,
+-					Dwarf_Abbrev *result)
++					Dwarf_Off offset, size_t *lengthp)
+      __nonnull_attribute__ (1) internal_function;
+ 
+ /* Get abbreviation of given DIE, and optionally set *READP to the DIE memory
+-- 
+2.43.2
+
-- 
2.43.0


