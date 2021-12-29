Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E1BC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 16:52:52 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.53716.1640796771524870667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 08:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cs5Xu3J6;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 2so18936817pgb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 08:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3FpFqxmSUMQR0HjbK/Jz/+55UkoEn98KuV873SV//pA=;
        b=cs5Xu3J6+c4i8ILNV8uktFpZnaqeY4qEVyHMLHZC3TwdP4D7Oli+OOiu97jBfZ4BfR
         jii0JpzPKEGoFuThL9MoBhXDOWxO/xpGHyi8RmIRgiidem4d0uwCwaf+x8IRmnOQ2MOl
         Jx9sVKNoHaurOVU7mjnS1z9WGXIa8VhKn5ZYnfAaov9BGbcb6UNx3YlqAyMT8zPYLEjl
         607AqEQbKJh1J2eGF1nySEVDdN93shzCW6zNI+/IoYfyU6K66ocfeJ3Cn1fnxOlRX35d
         5PZ/sYXlGNWzrAtQM8dbUe3amJIE689QaoUeEpv5iD4v+BD3ONnSGG6x5vODCfEQUl7w
         cf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3FpFqxmSUMQR0HjbK/Jz/+55UkoEn98KuV873SV//pA=;
        b=xyZoGOpepfTafC32TmUOXgnXIyktbaYCdVGo/iof4eUMU66gjEw8S1DtCYO4tdGgE9
         xzNmnP7IZK1yd6vx5DkD5eTPE3m92AFWkIKAQF+E0nD5S37JBB3BlolTfAPtYyq3dYEn
         mkFAKvA+o7jcci8PqbINIUyohXiw/rKxVBIDn3a0b4PFnusp0B2JZeBf0ryns/kwMWjL
         8Nu/vPcy0R3EM/OEzKcvghMmQw/hh2sk9W1cK873r8vW4uviOBioKfHQJETd2gaV8F11
         i8X5ayC7fj1figTZ7LqQwVm4xPSmMDiP5n9yQvx2ZRcksU5Zz6yxGbMsQGplPsIXECUV
         oe8Q==
X-Gm-Message-State: AOAM5305vORgnp3v93VHtKKGkBCnjQBTPmzFLY1O5tQnOG6nSQ7cg0GR
	bqrtWXWcp2/Y2tB6b//plzyB3eUr/vfyog==
X-Google-Smtp-Source: 
 ABdhPJxUESl/lEdsdXYIUlBtX8qAftTEC/lAqLKk8N/jIHEg3OK8xcKU6SBol5C/3BVzgX+P77PiqQ==
X-Received: by 2002:a63:6f07:: with SMTP id k7mr17833025pgc.574.1640796770552;
        Wed, 29 Dec 2021 08:52:50 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 d1sm14986625pfu.91.2021.12.29.08.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 08:52:50 -0800 (PST)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [hardknott][PATCH] binutils: Fix CVE-2021-45078
Date: Wed, 29 Dec 2021 22:22:38 +0530
Message-Id: <20211229165238.4178486-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Dec 2021 16:52:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160051

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=161e87d12167b1e36193385485c1f6ce92f74f02]
Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 .../binutils/binutils-2.36.inc                |   1 +
 .../binutils/0001-CVE-2021-45078.patch        | 255 ++++++++++++++++++
 2 files changed, 256 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index 7d0824e060..bc729e2696 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -46,5 +46,6 @@ SRC_URI = "\
      file://0003-CVE-2021-20197.patch \
      file://0017-CVE-2021-3530.patch \
      file://0018-CVE-2021-3530.patch \
+     file://0001-CVE-2021-45078.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
new file mode 100644
index 0000000000..f118e2599b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
@@ -0,0 +1,255 @@
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
+
+CVE: CVE-2021-45078
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=161e87d12167b1e36193385485c1f6ce92f74f02]
+
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
+---
+ binutils/stabs.c | 87 ++++++++++++++++++++++++------------------------
+ 1 file changed, 43 insertions(+), 44 deletions(-)
+
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 274bfb0e7fa..83ee3ea5fa4 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -202,7 +202,7 @@ static debug_type stab_find_type (void *, struct stab_handle *, const int *);
+ static bfd_boolean stab_record_type
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
+       rettype = debug_make_int_type (dhandle, 4, FALSE);
+       break;
+-    case 2:
++    case 1:
+       name = "char";
+       rettype = debug_make_int_type (dhandle, 1, FALSE);
+       break;
+-    case 3:
++    case 2:
+       name = "short";
+       rettype = debug_make_int_type (dhandle, 2, FALSE);
+       break;
+-    case 4:
++    case 3:
+       name = "long";
+       rettype = debug_make_int_type (dhandle, 4, FALSE);
+       break;
+-    case 5:
++    case 4:
+       name = "unsigned char";
+       rettype = debug_make_int_type (dhandle, 1, TRUE);
+       break;
+-    case 6:
++    case 5:
+       name = "signed char";
+       rettype = debug_make_int_type (dhandle, 1, FALSE);
+       break;
+-    case 7:
++    case 6:
+       name = "unsigned short";
+       rettype = debug_make_int_type (dhandle, 2, TRUE);
+       break;
+-    case 8:
++    case 7:
+       name = "unsigned int";
+       rettype = debug_make_int_type (dhandle, 4, TRUE);
+       break;
+-    case 9:
++    case 8:
+       name = "unsigned";
+       rettype = debug_make_int_type (dhandle, 4, TRUE);
+       break;
+-    case 10:
++    case 9:
+       name = "unsigned long";
+       rettype = debug_make_int_type (dhandle, 4, TRUE);
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
+       rettype = debug_make_int_type (dhandle, 4, FALSE);
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
+       rettype = debug_make_int_type (dhandle, 1, TRUE);
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
+       rettype = debug_make_int_type (dhandle, 1, FALSE);
+       break;
+-    case 28:
++    case 27:
+       name = "integer*2";
+       rettype = debug_make_int_type (dhandle, 2, FALSE);
+       break;
+-    case 29:
++    case 28:
+       name = "integer*4";
+       rettype = debug_make_int_type (dhandle, 4, FALSE);
+       break;
+-    case 30:
++    case 29:
+       /* FIXME */
+       name = "wchar";
+       rettype = debug_make_int_type (dhandle, 2, FALSE);
+       break;
+-    case 31:
++    case 30:
+       name = "long long";
+       rettype = debug_make_int_type (dhandle, 8, FALSE);
+       break;
+-    case 32:
++    case 31:
+       name = "unsigned long long";
+       rettype = debug_make_int_type (dhandle, 8, TRUE);
+       break;
+-    case 33:
++    case 32:
+       name = "logical*8";
+       rettype = debug_make_bool_type (dhandle, 8);
+       break;
+-    case 34:
++    case 33:
+       name = "integer*8";
+       rettype = debug_make_int_type (dhandle, 8, FALSE);
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


