Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBD0C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.13798.1645542517881102474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=juYStugT;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542517; x=1677078517;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wufZG3+B0ZCyf2cajYIfxFubK4LfOMtj0crWiH1INEU=;
  b=juYStugTuB1ZrFOGK/cGAP4bfIp8SCn3SSAGd5PQKyt9zvQzCby96AJK
   VRmbvc4++v/Mq0F8alAChtB6g6cCX8ta0BaPWtk7HiMx0XB28e8Zm887F
   Cj6LrniKTlIdFCV0OJ/w9A3nvS3Vpez3qDkLcHRdF6EW8ppGw9QGNBp1e
   e9lS0WaeJWzxpUpcH++mY8IMYhCGwW9PYym2o4Fe1SrY2uoQc16Q3IbFL
   xBrJuOzj/Rb4+1s0J0fxB3PzRfn77rkkQS8X2dUUByxjF/m+ipUEVeRy3
   VkPP4AC7R43x9C9iu1A3gbVYQJPctyXDrtX4+gytYBHOTOXENG7q0OJHD
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305148"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305148"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258682"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 20/38] binutils: Add fix for CVE-2021-45078
Date: Tue, 22 Feb 2022 23:07:21 +0800
Message-Id: 
 <170f2d08ffeb72a92d11d888fab4542d35e2d660.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162156

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport a fix for CVE-2021-45078.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3128fd1b2e5cbf3683dc69eabc56fbc0bd0e7d5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../binutils/binutils-2.37.inc                |   1 +
 ...87d12167b1e36193385485c1f6ce92f74f02.patch | 247 ++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c1f6ce92f74f02.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
index be0a0a5539..f4427aef45 100644
--- a/meta/recipes-devtools/binutils/binutils-2.37.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
@@ -37,5 +37,6 @@ SRC_URI = "\
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch \
      file://0001-CVE-2021-42574.patch \
+     file://161e87d12167b1e36193385485c1f6ce92f74f02.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c1f6ce92f74f02.patch b/meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c1f6ce92f74f02.patch
new file mode 100644
index 0000000000..8a655af06c
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
2.35.1


