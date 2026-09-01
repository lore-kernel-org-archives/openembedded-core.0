Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB6AC61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:46:06 +0000 (UTC)
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3232.1788252361470115257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AfL6YfeO;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10077; q=dns/txt;
  s=iport01; t=1788252361; x=1789461961;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dxdPKczrY3YwxAYcCfTVYjqK5iIFXK6zKmSb7eHPKyw=;
  b=AfL6YfeOQ7Hh1xh7DYcnk6rlUIzVRGQXoNhotGzu5pT+HikxvuqN2hmV
   BcsDUrMycZ09NjdpP7ZNBqlXVIpKWkZ8Mkd01VuarK8k3qXesQ8gPDRLQ
   AqQX+gZtmvBw0PKb0IdpjLFzjqUpL8hepk7BhCCgz/7LzFM8bZgbOK7y4
   hAPYnhwblZqx6pjz0RweoK5/LxhY4JM+g1He5yGmgYMpAZyTKkH8D9JsP
   BtZc0wyuiOcPKVDbAnMlaTqEO0Dw5GdFlOCapvGCWYFRtbuJYU0lUhj42
   o8+qw2/x5+d6AJxcyfLRiUZvQ78kdhcxOR4ptPF39k/CJ3CsUisfa2zqf
   w==;
X-CSE-ConnectionGUID: V8TZaXcPRqevX45YaFT6jw==
X-CSE-MsgGUID: +aGUFHCxT3aCJW2X5hFgAg==
X-IPAS-Result: =?us-ascii?q?A0BkAwDmj5Zq/9BK/pBaHgEBCxIMggULg0tfQkkDlCaCI?=
 =?us-ascii?q?QOBE4pRkjeBfg8BAQEPRA0EAQGFBQKNdwImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLAVYcAwECLyALIwgRCIMCAYI6A?=
 =?us-ascii?q?zcDEQa8DIF5M4EBg1oFCQJDUNhLDYJZBQYUAYE4hT+Cf4UjXRgBhHwnGxuBc?=
 =?us-ascii?q?oEUAYE7gTh2gQWBGkIBAgEYfm6GHwSCIoEMgVoekWtIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEog0QjGTZ6gQlegSspYRIXgQmCCAKCV?=
 =?us-ascii?q?4IDAgFJQw4HR1MJKgIJCxgNSBEsNxUZBD5uB45fH4FgcgEsYQEpAiCBXRIdk?=
 =?us-ascii?q?z+QFoIeoCFxCiiDdowijz6FfBozhASUF5JRmQiOCoQJkkeEaYFoPIFHCwdwF?=
 =?us-ascii?q?YMiUxkPji0LC4NggX+DFMcOPDUCCQMvAQEHAgcOAwuBaJARgW0BAQ?=
IronPort-Data: A9a23:oMdhiK6Y6/blIENrsobmvwxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 jAeDGqPPfeLNGvzL41yaIqz/B4AsZLTyNM3HQo/qy42Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajNMsvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eA90kyO9HCll07
 PEGGGxQXxmtu7y03+fuIgVsrpxLwMjDNY4F/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO00n1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYuFJoHXGZo9ckCw5
 WvpwkrZKQEmb9W06wXfwi+sqODmknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:YI6yBaB8yl10xH7lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3AKaaWrWn0uaRgKSmHNxqTACgpy5zXOUON8EXZE0S?=
 =?us-ascii?q?AM39kVo3JFG6Z1p86kdU7zg=3D=3D?=
X-Talos-MUID: 9a23:t4hcWQT/FHf6OEFMRXSvjR5fGudD85j1AWsvrs825smqOgV/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="59845547"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Sep 2026 08:45:59 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 196AE18000231
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 08:45:59 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id A74FACC037D; Tue,  1 Sep 2026 14:15:57 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v3 2/2] binutils: fix CVE-2026-4647
Date: Tue,  1 Sep 2026 14:15:37 +0530
Message-Id: <20260901084537.377060-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260901084537.377060-1-deeratho@cisco.com>
References: <20260901084537.377060-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 08:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244810

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix [1], which addresses an out-of-bounds
read issue in XCOFF relocation processing, as described in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9e99dbc1f19ffaf18d0250788951706066ebe7f2
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=33919

Reference:
https://bugzilla.suse.com/show_bug.cgi?id=1260338
https://www.suse.com/security/cve/CVE-2026-4647.html
https://nvd.nist.gov/vuln/detail/CVE-2026-4647

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v2 to v3: Refreshed the patches on top of latest scarthgap commits.
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2026-4647.patch     | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 8665a2549a..37dce2cb3e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -83,5 +83,6 @@ SRC_URI = "\
      file://CVE-2026-15003.patch \
      file://CVE-2026-18220.patch \
      file://CVE-2026-3441_CVE-2026-3442.patch \
+     file://CVE-2026-4647.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
new file mode 100644
index 0000000000..2152903d34
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
@@ -0,0 +1,228 @@
+From 3f02998235538f179d7884a76bd4d91e86a533b0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 13 Mar 2026 17:28:28 +1030
+Subject: [PATCH 2/2] PR33919 Out-of-bounds read in XCOFF relocation processing
+
+	PR 33919
+	* coff-rs6000.c (xcoff_calculate_relocation): Don't use explicit
+	array size.
+	(xcoff_complain_overflow): Likewise.
+	(xcoff_rtype2howto): Return a NULL howto rather than aborting.
+	(_bfd_xcoff_reloc_name_lookup): Use ARRAY_SIZE.
+	(xcoff_ppc_relocate_section): Sanity check reloc r_type before
+	accessing xcoff_howto_table.  Print r_type using %#x.  Remove
+	now redundant later reloc r_type sanity check.
+	* coff64-rs6000.c: Similarly.
+	* libxcoff.h (XCOFF_MAX_CALCULATE_RELOCATION): Don't define.
+	(XCOFF_MAX_COMPLAIN_OVERFLOW): Don't define.
+
+CVE: CVE-2026-4647
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9e99dbc1f19ffaf18d0250788951706066ebe7f2]
+
+(cherry picked from commit 9e99dbc1f19ffaf18d0250788951706066ebe7f2)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ bfd/coff-rs6000.c   | 36 +++++++++++++++++++++---------------
+ bfd/coff64-rs6000.c | 33 ++++++++++++++++++++-------------
+ bfd/libxcoff.h      |  3 ---
+ 3 files changed, 41 insertions(+), 31 deletions(-)
+
+diff --git a/bfd/coff-rs6000.c b/bfd/coff-rs6000.c
+index 87feb672bf1..0f2cc496b63 100644
+--- a/bfd/coff-rs6000.c
++++ b/bfd/coff-rs6000.c
+@@ -155,8 +155,7 @@ static xcoff_complain_function xcoff_complain_overflow_bitfield_func;
+ static xcoff_complain_function xcoff_complain_overflow_signed_func;
+ static xcoff_complain_function xcoff_complain_overflow_unsigned_func;
+ 
+-xcoff_reloc_function *const
+-xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
++xcoff_reloc_function *const xcoff_calculate_relocation[] =
+ {
+   xcoff_reloc_type_pos,  /* R_POS   (0x00) */
+   xcoff_reloc_type_neg,  /* R_NEG   (0x01) */
+@@ -210,8 +209,7 @@ xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
+   xcoff_reloc_type_toc,  /* R_TOCL    (0x31) */
+ };
+ 
+-xcoff_complain_function *const
+-xcoff_complain_overflow[XCOFF_MAX_COMPLAIN_OVERFLOW] =
++xcoff_complain_function *const xcoff_complain_overflow[] =
+ {
+   xcoff_complain_overflow_dont_func,
+   xcoff_complain_overflow_bitfield_func,
+@@ -1158,8 +1156,11 @@ reloc_howto_type xcoff_howto_table[] =
+ void
+ xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
+ {
+-  if (internal->r_type > R_TOCL)
+-    abort ();
++  if (internal->r_type >= ARRAY_SIZE (xcoff_howto_table))
++    {
++      relent->howto = NULL;
++      return;
++    }
+ 
+   /* Default howto layout works most of the time */
+   relent->howto = &xcoff_howto_table[internal->r_type];
+@@ -1183,7 +1184,7 @@ xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
+   if (relent->howto->dst_mask != 0
+       && (relent->howto->bitsize
+ 	  != ((unsigned int) internal->r_size & 0x1f) + 1))
+-    abort ();
++    relent->howto = NULL;
+ }
+ 
+ reloc_howto_type *
+@@ -1236,9 +1237,7 @@ _bfd_xcoff_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNUSED,
+ {
+   unsigned int i;
+ 
+-  for (i = 0;
+-       i < sizeof (xcoff_howto_table) / sizeof (xcoff_howto_table[0]);
+-       i++)
++  for (i = 0; i < ARRAY_SIZE (xcoff_howto_table); i++)
+     if (xcoff_howto_table[i].name != NULL
+ 	&& strcasecmp (xcoff_howto_table[i].name, r_name) == 0)
+       return &xcoff_howto_table[i];
+@@ -3776,6 +3775,14 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 	 the csect including the symbol which it references.  */
+       if (rel->r_type == R_REF)
+ 	continue;
++      if (rel->r_type >= ARRAY_SIZE (xcoff_howto_table))
++	{
++	  /* xgettext:c-format */
++	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
++			      input_bfd, rel->r_type);
++	  bfd_set_error (bfd_error_bad_value);
++	  return false;
++	}
+ 
+       /* Retrieve default value in HOWTO table and fix up according
+ 	 to r_size field, if it can be different.
+@@ -3795,7 +3802,7 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 
+ 	    default:
+ 	      _bfd_error_handler
+-		(_("%pB: relocation (%d) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
++		(_("%pB: relocation (%#x) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
+ 		 input_bfd, rel->r_type, (uint64_t) rel->r_vaddr, rel->r_size);
+ 	      return false;
+ 	    }
+@@ -3871,10 +3878,9 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 	    }
+ 	}
+ 
+-      if (rel->r_type >= XCOFF_MAX_CALCULATE_RELOCATION
+-	  || !((*xcoff_calculate_relocation[rel->r_type])
+-	       (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
+-		addend, &relocation, contents, info)))
++      if (!((*xcoff_calculate_relocation[rel->r_type])
++	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
++	     addend, &relocation, contents, info)))
+ 	return false;
+ 
+       /* address */
+diff --git a/bfd/coff64-rs6000.c b/bfd/coff64-rs6000.c
+index 0f8d9e08783..c74698070d5 100644
+--- a/bfd/coff64-rs6000.c
++++ b/bfd/coff64-rs6000.c
+@@ -177,8 +177,7 @@ static bool xcoff64_bad_format_hook
+ /* Relocation functions */
+ static xcoff_reloc_function xcoff64_reloc_type_br;
+ 
+-xcoff_reloc_function *const
+-xcoff64_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
++xcoff_reloc_function *const xcoff64_calculate_relocation[] =
+ {
+   xcoff_reloc_type_pos,  /* R_POS     (0x00) */
+   xcoff_reloc_type_neg,  /* R_NEG     (0x01) */
+@@ -1439,8 +1438,11 @@ reloc_howto_type xcoff64_howto_table[] =
+ void
+ xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
+ {
+-  if (internal->r_type > R_TOCL)
+-    abort ();
++  if (internal->r_type >= ARRAY_SIZE (xcoff64_howto_table))
++    {
++      relent->howto = NULL;
++      return;
++    }
+ 
+   /* Default howto layout works most of the time */
+   relent->howto = &xcoff64_howto_table[internal->r_type];
+@@ -1473,7 +1475,7 @@ xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
+   if (relent->howto->dst_mask != 0
+       && (relent->howto->bitsize
+ 	  != ((unsigned int) internal->r_size & 0x3f) + 1))
+-    abort ();
++    relent->howto = NULL;
+ }
+ 
+ reloc_howto_type *
+@@ -1528,9 +1530,7 @@ xcoff64_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNUSED,
+ {
+   unsigned int i;
+ 
+-  for (i = 0;
+-       i < sizeof (xcoff64_howto_table) / sizeof (xcoff64_howto_table[0]);
+-       i++)
++  for (i = 0; i < ARRAY_SIZE (xcoff64_howto_table); i++)
+     if (xcoff64_howto_table[i].name != NULL
+ 	&& strcasecmp (xcoff64_howto_table[i].name, r_name) == 0)
+       return &xcoff64_howto_table[i];
+@@ -1574,6 +1574,14 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 	 the csect including the symbol which it references.  */
+       if (rel->r_type == R_REF)
+ 	continue;
++      if (rel->r_type >= ARRAY_SIZE (xcoff64_howto_table))
++	{
++	  /* xgettext:c-format */
++	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
++			      input_bfd, rel->r_type);
++	  bfd_set_error (bfd_error_bad_value);
++	  return false;
++	}
+ 
+       /* Retrieve default value in HOWTO table and fix up according
+ 	 to r_size field, if it can be different.
+@@ -1595,7 +1603,7 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 
+ 	    default:
+ 	      _bfd_error_handler
+-		(_("%pB: relocation (%d) at (0x%" PRIx64 ") has wrong"
++		(_("%pB: relocation (%#x) at (0x%" PRIx64 ") has wrong"
+ 		   " r_rsize (0x%x)\n"),
+ 		 input_bfd, rel->r_type, rel->r_vaddr, rel->r_size);
+ 	      return false;
+@@ -1668,10 +1676,9 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 	    }
+ 	}
+ 
+-      if (rel->r_type >= XCOFF_MAX_CALCULATE_RELOCATION
+-	  || !((*xcoff64_calculate_relocation[rel->r_type])
+-	      (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
+-	       addend, &relocation, contents, info)))
++      if (!((*xcoff64_calculate_relocation[rel->r_type])
++	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
++	     addend, &relocation, contents, info)))
+ 	return false;
+ 
+       /* address */
+diff --git a/bfd/libxcoff.h b/bfd/libxcoff.h
+index 81c4e205e06..ca716a9ef3a 100644
+--- a/bfd/libxcoff.h
++++ b/bfd/libxcoff.h
+@@ -215,9 +215,6 @@ struct xcoff_backend_data_rec
+ #define bfd_xcoff_text_align_power(a) ((xcoff_data (a)->text_align_power))
+ #define bfd_xcoff_data_align_power(a) ((xcoff_data (a)->data_align_power))
+ 
+-/* xcoff*_ppc_relocate_section macros  */
+-#define XCOFF_MAX_CALCULATE_RELOCATION (0x32)
+-#define XCOFF_MAX_COMPLAIN_OVERFLOW (4)
+ /* N_ONES produces N one bits, without overflowing machine arithmetic.  */
+ #ifdef N_ONES
+ #undef N_ONES
+-- 
+2.44.4
+
-- 
2.35.6


