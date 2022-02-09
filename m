Return-Path: <purushottamchoudhary29@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A98C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 13:39:13 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.26464.1644413952220010285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oeksVd4X;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 c8-20020a17090a674800b001b91184b732so2651500pjm.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=04KepIbJHKxkUkvoqxVSKsWQi9zXBq1AxqHr8itaNkY=;
        b=oeksVd4XEE3LUCmrpiL51iZQjpJxAw7d7MmxfdrdNn1B11tZPVQ6UtgRPyu7YlxDD5
         JA+r7ATZpB7rXIBvdo6B/3xQ+X5VaEa+FsLClQzYgLqDzI5y62Sfi3XfDZUq4cb0gWWH
         gkzluakDe7vhM3aNdiyxo+gAEzB55JVC2lIbFN62xyJklcEqpAjUAEKxtMkIs2PJ8/6x
         pwxGYGREUFrP3CtRmyFEwXRCuIps5rsL5Zu5ND5XwYPY3pRINc8extv+ak3JtVh5mw7A
         Z19OpHodIbnqGh3b4Arz7gXvJjxzCS6kUV00+BSNWN8hNcy++09lPj9cpc6mOplnxtMo
         npuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=04KepIbJHKxkUkvoqxVSKsWQi9zXBq1AxqHr8itaNkY=;
        b=Vnk135sz30TfJUac/EMm1qJ9l7Q5GjIFIg5Gsvc861CqgvUGufzZe7Paxm7CnUuJsJ
         P2oTioDAQzL4ow//pK9v9uuQME4/GGxlF+MKfx8dkawcRDi2H7cxo1eDmq8TQsZewCFX
         PwaNfenlBqsFVxhIfnNwQzvkR2QBPMZUP8Yh1v3PJCFzPrHmFDuOb7KuelO6BIeMHj/4
         P7BAU3NXgVlPHGJZg/KZeze3J8IstKQOufWD0RGLoxCC40RiK0LdXgY/ukHDqepwi5mD
         NCbe9qaavWRxBCa6hRh3CpvmJJCeQ4Gnz7dCk5IDeSwx4PlX20ySxa4R521uZH44Kw5/
         UaWA==
X-Gm-Message-State: AOAM530G51UZQjnjmtQtBj7+GvMQbnDaTRoncWWpyOdJ23PInJej1LLK
	pd98voR+6p86WnECHwza1TIAavRJlW7UE1ds
X-Google-Smtp-Source: 
 ABdhPJxa/+fKjOmUE1ZSAIeGzLncgq0oMAStlj+rMALiGi9QaHgGAcOKozLYPozlx30zvcytDmp9dA==
X-Received: by 2002:a17:903:2486:: with SMTP id
 p6mr2227442plw.1.1644413950785;
        Wed, 09 Feb 2022 05:39:10 -0800 (PST)
Received: from localhost.localdomain
 ([2405:201:a410:a06c:6022:4998:4b07:5aa1])
        by smtp.gmail.com with ESMTPSA id
 123sm1817642pgd.19.2022.02.09.05.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 05:39:09 -0800 (PST)
From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Purushottam Choudhary <purushottam.choudhary@kpit.com>
Subject: [OE-core][dunfell][PATCH] binutils: Fix CVE-2021-45078
Date: Wed,  9 Feb 2022 19:08:41 +0530
Message-Id: <20220209133841.24751-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 13:39:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161558

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=161e87d12167b1e36193385485c1f6ce92f74f02]
(From OE-Core rev: be665a2279795c522cb3e3e700ea747efd885f95)

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 823d25f5218836fb4298482366fbc5d05d822907)
Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/0001-CVE-2021-45078.patch        | 257 ++++++++++++++++++
 2 files changed, 258 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 6104bec591..d3936a5da2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -50,5 +50,6 @@ SRC_URI = "\
      file://CVE-2021-3487.patch \
      file://CVE-2021-3549.patch \
      file://CVE-2020-16593.patch \
+     file://0001-CVE-2021-45078.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
new file mode 100644
index 0000000000..2af82477ac
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
@@ -0,0 +1,257 @@
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
+Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
+Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
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
2.17.1


