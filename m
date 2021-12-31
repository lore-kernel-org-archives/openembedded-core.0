Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641A8C433F5
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 06:05:10 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.8993.1640930709430852103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 22:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WrAQZ1D/;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id i8so14592769pgt.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 22:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LpRZmdTV9soZxG73gV4nUv9JCD/giBOfkpIQ8HG23oc=;
        b=WrAQZ1D/ogVU7eJOVH/LYGje0Ef/LH8bKH4IOXMJ54FSFNjOKa5MQu193Pjc6qnLN/
         JWe6GrIE75jz7iQTdAPcH5LQU9ovfwJr64A9XZ127DOhaBs0i09Q0Ii38NY/p5BZrzuF
         J95stqGDZWQvKjGtFLF6wnU0syt65H/gUL/l2HlcJh7DNmUBhky1jJ3s2D+jJb+AqNXp
         xZC76yn6z2LuNQvVbot0/3ylmeDDq2x/SdyD/np7m13bnRn+W+Z4ainbbvwT0udz1epJ
         HpIDJORcIM1RO+9IFiE8P7OAtqswmiTtfP4iq22euhkgTnxBfGyr+k0f8M6KNcopzBJb
         hmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LpRZmdTV9soZxG73gV4nUv9JCD/giBOfkpIQ8HG23oc=;
        b=QCPn/+syGf+irvtl+qDllsZO1bBgTHqPk3SQTMZ0lrrEygnf5EvQ6HMh0lIdLFwCsg
         jHzeW2Wk4ARAobGOyHjKQpP/xKdxlcmqFqyGkmZ1f3/bU69xbT3kXFbOCwFdg1Vj3GMK
         UvCAoh2TqVIBnqbORPPivYpejTUAr1IRBv89/Zdk+6KAEO3yQN2HlyNdPnq5sB8nCjsp
         1lWhch1ipNVpia5gf8MbMVhdvY+RaN27Mp/KRKKm1mJcEd3doXeMgtznUfaxa+a1JomF
         eRIxhN0ke0cgirpdwafw/KGOZVnA6fJyBWleT3G/nBJfC7FqR7eoU/YmJeHaexyn9qZN
         /VQQ==
X-Gm-Message-State: AOAM5336gXN/DE2oVa890+h5IyKTcjUxm6Pwh4iwTK2Rt2R6Zm+HpPlR
	1fB1VcTfY+JS4mTzYUuVQBEmzvctvTRuGiKkWbk=
X-Google-Smtp-Source: 
 ABdhPJxleLJhNIicorB1uru1fp9x/K4TC6lYddqyNk5zCXLFX0ogh+zkQdyeq3wPZa/B4eiNk0jFSw==
X-Received: by 2002:a63:340c:: with SMTP id
 b12mr25034815pga.360.1640930708529;
        Thu, 30 Dec 2021 22:05:08 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 b18sm29178865pfl.121.2021.12.30.22.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 22:05:08 -0800 (PST)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [hardknott][PATCH] binutils: Fix CVE-2021-45078
Date: Fri, 31 Dec 2021 11:34:46 +0530
Message-Id: <20211231060446.78187-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 06:05:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160086

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=161e87d12167b1e36193385485c1f6ce92f74f02]
Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 .../binutils/binutils-2.37.inc                |   1 +
 .../binutils/0001-CVE-2021-45078.patch        | 253 ++++++++++++++++++
 2 files changed, 254 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
index 043f7f8235..62e2e31e3c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.37.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
@@ -34,5 +34,6 @@ SRC_URI = "\
      file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch \
      file://0001-elf-Discard-input-.note.gnu.build-id-sections.patch \
      file://0001-CVE-2021-42574.patch \
+     file://0001-CVE-2021-45078.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
new file mode 100644
index 0000000000..907543fce0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
@@ -0,0 +1,253 @@
+From 161e87d12167b1e36193385485c1f6ce92f74f02 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 15 Dec 2021 11:48:42 +1030
+Subject: [PATCH] PR28694, Out-of-bounds write in stab_xcoff_builtin_type
+
+	PR 28694
+	* stabs.c (stab_xcoff_builtin_type): Make typenum unsigned.
+	Negate typenum earlier, simplifying bounds checking.  Correct
+	off-by-one indexing.  Adjust switch cases.
+
+CVE: CVE-2021-45078
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=161e87d12167b1e36193385485c1f6ce92f74f02]
+
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
+---
+ binutils/stabs.c | 87 ++++++++++++++++++++++++------------------------
+ 1 file changed, 43 insertions(+), 44 deletions(-)
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 274bfb0e7fa..83ee3ea5fa4 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -202,7 +202,7 @@ static debug_type stab_find_type (void *, struct stab_handle *, const int *);
+ static bool stab_record_type
+   (void *, struct stab_handle *, const int *, debug_type);
+ static debug_type stab_xcoff_builtin_type
+-  (void *, struct stab_handle *, int);
++  (void *, struct stab_handle *, unsigned int);
+ static debug_type stab_find_tagged_type
+   (void *, struct stab_handle *, const char *, int, enum debug_type_kind);
+ static debug_type *stab_demangle_argtypes
+@@ -3496,166 +3496,167 @@ stab_record_type (void *dhandle ATTRIBUTE_UNUSED, struct stab_handle *info,
+ 
+ static debug_type
+ stab_xcoff_builtin_type (void *dhandle, struct stab_handle *info,
+-			 int typenum)
++			 unsigned int typenum)
+ {
+   debug_type rettype;
+   const char *name;
+ 
+-  if (typenum >= 0 || typenum < -XCOFF_TYPE_COUNT)
++  typenum = -typenum - 1;
++  if (typenum >= XCOFF_TYPE_COUNT)
+     {
+-      fprintf (stderr, _("Unrecognized XCOFF type %d\n"), typenum);
++      fprintf (stderr, _("Unrecognized XCOFF type %d\n"), -typenum - 1);
+       return DEBUG_TYPE_NULL;
+     }
+-  if (info->xcoff_types[-typenum] != NULL)
+-    return info->xcoff_types[-typenum];
++  if (info->xcoff_types[typenum] != NULL)
++    return info->xcoff_types[typenum];
+ 
+-  switch (-typenum)
++  switch (typenum)
+     {
+-    case 1:
++    case 0:
+       /* The size of this and all the other types are fixed, defined
+ 	 by the debugging format.  */
+       name = "int";
+       rettype = debug_make_int_type (dhandle, 4, false);
+       break;
+-    case 2:
++    case 1:
+       name = "char";
+       rettype = debug_make_int_type (dhandle, 1, false);
+       break;
+-    case 3:
++    case 2:
+       name = "short";
+       rettype = debug_make_int_type (dhandle, 2, false);
+       break;
+-    case 4:
++    case 3:
+       name = "long";
+       rettype = debug_make_int_type (dhandle, 4, false);
+       break;
+-    case 5:
++    case 4:
+       name = "unsigned char";
+       rettype = debug_make_int_type (dhandle, 1, true);
+       break;
+-    case 6:
++    case 5:
+       name = "signed char";
+       rettype = debug_make_int_type (dhandle, 1, false);
+       break;
+-    case 7:
++    case 6:
+       name = "unsigned short";
+       rettype = debug_make_int_type (dhandle, 2, true);
+       break;
+-    case 8:
++    case 7:
+       name = "unsigned int";
+       rettype = debug_make_int_type (dhandle, 4, true);
+       break;
+-    case 9:
++    case 8:
+       name = "unsigned";
+       rettype = debug_make_int_type (dhandle, 4, true);
+       break;
+-    case 10:
++    case 9:
+       name = "unsigned long";
+       rettype = debug_make_int_type (dhandle, 4, true);
+       break;
+-    case 11:
++    case 10:
+       name = "void";
+       rettype = debug_make_void_type (dhandle);
+       break;
+-    case 12:
++    case 11:
+       /* IEEE single precision (32 bit).  */
+       name = "float";
+       rettype = debug_make_float_type (dhandle, 4);
+       break;
+-    case 13:
++    case 12:
+       /* IEEE double precision (64 bit).  */
+       name = "double";
+       rettype = debug_make_float_type (dhandle, 8);
+       break;
+-    case 14:
++    case 13:
+       /* This is an IEEE double on the RS/6000, and different machines
+ 	 with different sizes for "long double" should use different
+ 	 negative type numbers.  See stabs.texinfo.  */
+       name = "long double";
+       rettype = debug_make_float_type (dhandle, 8);
+       break;
+-    case 15:
++    case 14:
+       name = "integer";
+       rettype = debug_make_int_type (dhandle, 4, false);
+       break;
+-    case 16:
++    case 15:
+       name = "boolean";
+       rettype = debug_make_bool_type (dhandle, 4);
+       break;
+-    case 17:
++    case 16:
+       name = "short real";
+       rettype = debug_make_float_type (dhandle, 4);
+       break;
+-    case 18:
++    case 17:
+       name = "real";
+       rettype = debug_make_float_type (dhandle, 8);
+       break;
+-    case 19:
++    case 18:
+       /* FIXME */
+       name = "stringptr";
+       rettype = NULL;
+       break;
+-    case 20:
++    case 19:
+       /* FIXME */
+       name = "character";
+       rettype = debug_make_int_type (dhandle, 1, true);
+       break;
+-    case 21:
++    case 20:
+       name = "logical*1";
+       rettype = debug_make_bool_type (dhandle, 1);
+       break;
+-    case 22:
++    case 21:
+       name = "logical*2";
+       rettype = debug_make_bool_type (dhandle, 2);
+       break;
+-    case 23:
++    case 22:
+       name = "logical*4";
+       rettype = debug_make_bool_type (dhandle, 4);
+       break;
+-    case 24:
++    case 23:
+       name = "logical";
+       rettype = debug_make_bool_type (dhandle, 4);
+       break;
+-    case 25:
++    case 24:
+       /* Complex type consisting of two IEEE single precision values.  */
+       name = "complex";
+       rettype = debug_make_complex_type (dhandle, 8);
+       break;
+-    case 26:
++    case 25:
+       /* Complex type consisting of two IEEE double precision values.  */
+       name = "double complex";
+       rettype = debug_make_complex_type (dhandle, 16);
+       break;
+-    case 27:
++    case 26:
+       name = "integer*1";
+       rettype = debug_make_int_type (dhandle, 1, false);
+       break;
+-    case 28:
++    case 27:
+       name = "integer*2";
+       rettype = debug_make_int_type (dhandle, 2, false);
+       break;
+-    case 29:
++    case 28:
+       name = "integer*4";
+       rettype = debug_make_int_type (dhandle, 4, false);
+       break;
+-    case 30:
++    case 29:
+       /* FIXME */
+       name = "wchar";
+       rettype = debug_make_int_type (dhandle, 2, false);
+       break;
+-    case 31:
++    case 30:
+       name = "long long";
+       rettype = debug_make_int_type (dhandle, 8, false);
+       break;
+-    case 32:
++    case 31:
+       name = "unsigned long long";
+       rettype = debug_make_int_type (dhandle, 8, true);
+       break;
+-    case 33:
++    case 32:
+       name = "logical*8";
+       rettype = debug_make_bool_type (dhandle, 8);
+       break;
+-    case 34:
++    case 33:
+       name = "integer*8";
+       rettype = debug_make_int_type (dhandle, 8, false);
+       break;
+@@ -3664,9 +3665,7 @@ stab_xcoff_builtin_type (void *dhandle, struct stab_handle *info,
+     }
+ 
+   rettype = debug_name_type (dhandle, name, rettype);
+-
+-  info->xcoff_types[-typenum] = rettype;
+-
++  info->xcoff_types[typenum] = rettype;
+   return rettype;
+ }
+ 
+-- 
+2.27.0
+
-- 
2.25.1


