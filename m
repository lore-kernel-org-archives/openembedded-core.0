Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.909.1618943322783603437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 11:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E70Z3OPo;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id y62so2330986pfg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 11:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rypD/rT05dCXrWTQmo+QdNKWYMUTJ/H2hYWNTXO1TZY=;
        b=E70Z3OPogdvpIdqMMQQVOIw9vY1cSxd55joZeFO7Hpbg78rIpejIlQhS5g0qJ2whBj
         e+0A7iimD+7xNEn9SSeQATFsLYZs3TqJm+Rk5FSqQDAUsxhjIWx31VAFjajmQoDBTRux
         hg1+OiyuMGHUYUKHNO+T8+mrDostLf+8T3wvib8lEkLs1+01o/df3tKKjDEKewnNc/mW
         b5Et9JVeV9g+vyAskwVVDg6ktHBKHyydCnDuLOUMHu2Mst2N9RqAyjqdGZqIRrMnCcqx
         joAJgKufseo2StLzqaW7ADRB8vDq5rAjwG0mIzTMeNE6K+kfk9D8CwZWrVGTB+DdfpFL
         gKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rypD/rT05dCXrWTQmo+QdNKWYMUTJ/H2hYWNTXO1TZY=;
        b=h+jfrf+Tp/L0ztjB0NjigTd2ia0tkZ+S51eUcKVl1rqjKTCdgaIWxZ/btGBN51QEOQ
         SfH5vHfIXne3quW/5//+WxVLBBxm28Bb0Dp7IS/TxVYi9xSyEzmMTOVCyUdLRK1I0bGl
         xUkQ8bmmGUFWiH9pwn/k3/YDZT6lFKJBMsVleKdkk+Crn/LHauMGCwBVs8GSvRV1gDJ9
         bAso7kA5kriyZ4/efeXDJ6yQiI1+6L49H6J5/4ib7943Qa45TeUx+N2x7LccYvA4x41v
         3irz0ONEsdgHXINu8FZAG2wlvtAL50J7M3TsRB+pkeWgXWWCh4Yx19wNfcu+0NYm1f4y
         wYYw==
X-Gm-Message-State: AOAM532J22eQIecttizAByrpGqsJFgWdwhEvO2SoDBmRFHufe6aLzWjD
	Q/zkl8V+xalPs59Gj5VIQLBMHGBi53UptQ==
X-Google-Smtp-Source: ABdhPJzBS3bMNS3ab8Pdd+aCyZ9bO7dkMWv0c87f2fm4rm1pSKrynsg6ZIjq+NYlfNERDy515Pv6jg==
X-Received: by 2002:a65:4889:: with SMTP id n9mr18059636pgs.91.1618943321908;
        Tue, 20 Apr 2021 11:28:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id z12sm6950954pfn.195.2021.04.20.11.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 11:28:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] binutils: Fix linking failures when using dwarf-5
Date: Tue, 20 Apr 2021 11:28:37 -0700
Message-Id: <20210420182838.958151-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since GCC 11 will switch to dwarf-5 as default, this patch will be
required soon

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.36.inc                |   1 +
 ...the-DW_FORM_strx-forms-to-the-BFD-li.patch | 183 ++++++++++++++++++
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index d2ededb728..beddf601fd 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
+     file://0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch b/meta/recipes-devtools/binutils/binutils/0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch
new file mode 100644
index 0000000000..b4880e0d14
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch
@@ -0,0 +1,183 @@
+From a50c11a7a47b26e6a3e095dfb72aa2e465919fb6 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 5 Mar 2021 17:06:59 +0000
+Subject: [PATCH] Add support for the DW_FORM_strx* forms to the BFD library.
+
+	PR 27521
+	* dwarf2.c (is_str_attr): Add DW_FORM_strx* forms.
+	(read_indexed_string): Placeholder function.
+	(read_attribute_value): Handle DW_FORM_strx* and DW_FORM_addrx*
+	forms.
+
+Upstream-Status: Backport [https://sourceware.org/bugzilla/show_bug.cgi?id=27521]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ bfd/dwarf2.c | 105 ++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 67 insertions(+), 38 deletions(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 5651696c0f7..5ffcd93f54c 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -1160,8 +1160,23 @@ read_abbrevs (bfd *abfd, bfd_uint64_t offset, struct dwarf2_debug *stash,
+ static inline bfd_boolean
+ is_str_attr (enum dwarf_form form)
+ {
+-  return (form == DW_FORM_string || form == DW_FORM_strp
+-	  || form == DW_FORM_line_strp || form == DW_FORM_GNU_strp_alt);
++  return (form == DW_FORM_string
++	  || form == DW_FORM_strp
++	  || form == DW_FORM_strx
++	  || form == DW_FORM_strx1
++	  || form == DW_FORM_strx2
++	  || form == DW_FORM_strx3
++	  || form == DW_FORM_strx4
++	  || form == DW_FORM_line_strp
++	  || form == DW_FORM_GNU_strp_alt);
++}
++
++static const char *
++read_indexed_string (bfd_uint64_t index ATTRIBUTE_UNUSED,
++		     struct comp_unit * unit ATTRIBUTE_UNUSED)
++{
++  /* FIXME: Add support for indexed strings.  */
++  return "<indexed strings not yet supported>";
+ }
+ 
+ /* Read and fill in the value of attribute ATTR as described by FORM.
+@@ -1192,6 +1207,9 @@ read_attribute_value (struct attribute *  attr,
+ 
+   switch (form)
+     {
++    case DW_FORM_flag_present:
++      attr->u.val = 1;
++      break;
+     case DW_FORM_ref_addr:
+       /* DW_FORM_ref_addr is an address in DWARF2, and an offset in
+ 	 DWARF3.  */
+@@ -1237,15 +1255,32 @@ read_attribute_value (struct attribute *  attr,
+       info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
++    case DW_FORM_ref1:
++    case DW_FORM_flag:
++    case DW_FORM_data1:
++    case DW_FORM_addrx1:
++      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
++      info_ptr += 1;
++      break;
+     case DW_FORM_data2:
++    case DW_FORM_ref2:
+       attr->u.val = read_2_bytes (abfd, info_ptr, info_ptr_end);
+       info_ptr += 2;
+       break;
++    case DW_FORM_addrx3:
++      attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
++      attr->u.val &= 0xffffff;
++      info_ptr += 3;
++      break;
++    case DW_FORM_ref4:
+     case DW_FORM_data4:
++    case DW_FORM_addrx4:
+       attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
+       info_ptr += 4;
+       break;
+     case DW_FORM_data8:
++    case DW_FORM_ref8:
++    case DW_FORM_ref_sig8:
+       attr->u.val = read_8_bytes (abfd, info_ptr, info_ptr_end);
+       info_ptr += 8;
+       break;
+@@ -1265,6 +1300,33 @@ read_attribute_value (struct attribute *  attr,
+       attr->u.str = read_alt_indirect_string (unit, info_ptr, info_ptr_end, &bytes_read);
+       info_ptr += bytes_read;
+       break;
++    case DW_FORM_strx1:
++      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
++      info_ptr += 1;
++      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
++      break;
++    case DW_FORM_strx2:
++      attr->u.val = read_2_bytes (abfd, info_ptr, info_ptr_end);
++      info_ptr += 2;
++      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
++      break;
++    case DW_FORM_strx3:
++      attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
++      info_ptr += 3;
++      attr->u.val &= 0xffffff;
++      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
++      break;
++    case DW_FORM_strx4:
++      attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
++      info_ptr += 4;
++      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
++      break;
++    case DW_FORM_strx:
++      attr->u.val = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
++					 FALSE, info_ptr_end);
++      info_ptr += bytes_read;
++      attr->u.str = (char *) read_indexed_string (attr->u.val, unit);
++      break;
+     case DW_FORM_exprloc:
+     case DW_FORM_block:
+       amt = sizeof (struct dwarf_block);
+@@ -1287,48 +1349,14 @@ read_attribute_value (struct attribute *  attr,
+       info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
+-    case DW_FORM_data1:
+-      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
+-      info_ptr += 1;
+-      break;
+-    case DW_FORM_flag:
+-      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
+-      info_ptr += 1;
+-      break;
+-    case DW_FORM_flag_present:
+-      attr->u.val = 1;
+-      break;
+     case DW_FORM_sdata:
+       attr->u.sval = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
+ 					    TRUE, info_ptr_end);
+       info_ptr += bytes_read;
+       break;
+-    case DW_FORM_udata:
+-      attr->u.val = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
+-					   FALSE, info_ptr_end);
+-      info_ptr += bytes_read;
+-      break;
+-    case DW_FORM_ref1:
+-      attr->u.val = read_1_byte (abfd, info_ptr, info_ptr_end);
+-      info_ptr += 1;
+-      break;
+-    case DW_FORM_ref2:
+-      attr->u.val = read_2_bytes (abfd, info_ptr, info_ptr_end);
+-      info_ptr += 2;
+-      break;
+-    case DW_FORM_ref4:
+-      attr->u.val = read_4_bytes (abfd, info_ptr, info_ptr_end);
+-      info_ptr += 4;
+-      break;
+-    case DW_FORM_ref8:
+-      attr->u.val = read_8_bytes (abfd, info_ptr, info_ptr_end);
+-      info_ptr += 8;
+-      break;
+-    case DW_FORM_ref_sig8:
+-      attr->u.val = read_8_bytes (abfd, info_ptr, info_ptr_end);
+-      info_ptr += 8;
+-      break;
+     case DW_FORM_ref_udata:
++    case DW_FORM_udata:
++    case DW_FORM_addrx:
+       attr->u.val = _bfd_safe_read_leb128 (abfd, info_ptr, &bytes_read,
+ 					   FALSE, info_ptr_end);
+       info_ptr += bytes_read;
+@@ -1361,6 +1389,7 @@ read_attribute_value (struct attribute *  attr,
+       info_ptr = read_n_bytes (info_ptr, info_ptr_end, blk);
+       attr->u.blk = blk;
+       break;
++
+     default:
+       _bfd_error_handler (_("DWARF error: invalid or unhandled FORM value: %#x"),
+ 			  form);
-- 
2.31.1

