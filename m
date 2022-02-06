Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D348C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:19:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.13810.1644182396623820437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TJpts9B8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id s18so21500044wrv.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8BhhZERJRkbKY+rpkcwLe0zdkFvRmI68wKQbT61rFuU=;
        b=TJpts9B81FPQ0S0+ENe5JW26VHinuq9FNTh/oGzcYA4C/m0RxwxdkQxjlWFptECVHR
         6BmqV/XCiePyzlpYCqiy3510om0oSudZtjvvF7DS9eDpfXOaeiwTtRjKN05YqUua4Y0Z
         NCVR8FLh4kPb2E6FLUI9gpTBDf1uwNRSLQq9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8BhhZERJRkbKY+rpkcwLe0zdkFvRmI68wKQbT61rFuU=;
        b=NmiJxzLp5zH1hjnHa1nSzbyYOInzsL2364yDxUAlX+PTRFvTyRHotgJDPTVDEMd5Cg
         pOaKuWQfgro1uXawQcnxH6iq2oK1fdm+ySykUWYjy9PgTou2LMGlxXdmCWx97uVw87MZ
         Hh2wBtTa/brXP2z0/wDeTroFmQLUvntH7umphC+OPXYVdVq6VoHIZL7wG6A6HWI+lTqs
         JGz/M6drKtGqpwKNp02zfBf1tdwz8Mmvy8JC93aoVSIJzLRYZQXlJqL7WqHpyCNK2kn6
         dTzCR21jI/OyYKtPS2ZftO5/SLzUIRPaNLIQ6HgMY7zkFibCK54xu+Z+f1mDkrKVPUQ1
         2pbg==
X-Gm-Message-State: AOAM532xG0Ui+2DCgTtVwizy7XCBUgnqcKWTdOtYYizNOS6t5Vk+JNNa
	ZT15qC3No9V8BjSraaLpG7jeZ7cYaoGI0A==
X-Google-Smtp-Source: 
 ABdhPJyEFop7ce4LmKzc5P0OA7BBhXyXimlwU0p9n1ONkIvFT8ECsEC/nOHIBcb56afW3sy18DLnuQ==
X-Received: by 2002:a05:6000:16cb:: with SMTP id
 h11mr7373165wrf.594.1644182394848;
        Sun, 06 Feb 2022 13:19:54 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa])
        by smtp.gmail.com with ESMTPSA id
 u17sm16594281wmq.41.2022.02.06.13.19.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:19:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] binutils: Add fix for CVE-2021-45078
Date: Sun,  6 Feb 2022 21:19:52 +0000
Message-Id: <20220206211952.2523894-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206211952.2523894-1-richard.purdie@linuxfoundation.org>
References: <20220206211952.2523894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:19:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161412

Backport a fix for CVE-2021-45078.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/binutils-2.37.inc                |   1 +
 ...87d12167b1e36193385485c1f6ce92f74f02.patch | 247 ++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c1f6ce92f74f02.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
index 043f7f8235a..bc6eef0fbb4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.37.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
@@ -34,5 +34,6 @@ SRC_URI = "\
      file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch \
      file://0001-elf-Discard-input-.note.gnu.build-id-sections.patch \
      file://0001-CVE-2021-42574.patch \
+     file://161e87d12167b1e36193385485c1f6ce92f74f02.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c1f6ce92f74f02.patch b/meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c1f6ce92f74f02.patch
new file mode 100644
index 00000000000..8a655af06c7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c1f6ce92f74f02.patch
@@ -0,0 +1,247 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 15 Dec 2021 01:18:42 +0000 (+1030)
+Subject: PR28694, Out-of-bounds write in stab_xcoff_builtin_type
+CVE: CVE-2021-45078
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=161e87d12167b1e36193385485c1f6ce92f74f02]
+
+PR28694, Out-of-bounds write in stab_xcoff_builtin_type
+
+	PR 28694
+	* stabs.c (stab_xcoff_builtin_type): Make typenum unsigned.
+	Negate typenum earlier, simplifying bounds checking.  Correct
+	off-by-one indexing.  Adjust switch cases.
+---
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
-- 
2.32.0


