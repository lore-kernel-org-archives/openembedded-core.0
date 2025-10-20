Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E4CCCD19F
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 22:09:44 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.4817.1760998178190960188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 15:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IUyvh2EU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251020220936e59e038779000207ee-ie4qtw@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251020220936e59e038779000207ee
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Oct 2025 00:09:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=q0knAXxqWx7L8HwLLiZtrWZ/VoDG/1cnzCykKDn5Nq8=;
 b=IUyvh2EUVLwFo4JoUiClqtnK2fTMm1/vd7r0lqA2Y+LVcuJJNHOx6tDOANwjhTQeaeYKpb
 yjNU5d1rzpbQpTSecBAVbwfD8fp3H0M7OG5NdYqcSLbVIboWzhjwlP+iaHckLoSqFn4iAZmP
 BJpK5bzPbTABjdZ+8aINanROfbCfIbfosk/2lO5y+hhqhzKkHRBarDby9GE6t8wzm5ML6qT7
 XMiz0mfTVhbRarYRP1Cj38HtcoCIotDBl8pqTTTbeoimQSV7KqOWy93vMH7QnaWdWv2KIqcR
 3FJ9Al4ZisPfoZc/Jz4GL/n6WSbfb3xe4HIsl7MQqixyNDz014s3WnGw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 4/5] binutils: patch CVE-2025-11495
Date: Tue, 21 Oct 2025 00:09:11 +0200
Message-Id: <20251020220912.483748-4-peter.marko@siemens.com>
In-Reply-To: <20251020220912.483748-1-peter.marko@siemens.com>
References: <20251020220912.483748-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 22:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225138

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../binutils/binutils-2.45.inc                |   1 +
 .../binutils/binutils/CVE-2025-11495.patch    | 153 ++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11495.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 62b5bf6c264..288475ac390 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -42,4 +42,5 @@ SRC_URI = "\
      file://CVE-2025-11414.patch \
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
+     file://CVE-2025-11495.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11495.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11495.patch
new file mode 100644
index 00000000000..6e5e68fe275
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11495.patch
@@ -0,0 +1,153 @@
+From 6b21c8b2ecfef5c95142cbc2c32f185cb1c26ab0 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:18:29 +0800
+Subject: [PATCH] x86: Disallow TLS relocation in non executable section
+
+Since TLS relocations are applied to executable machine instructions,
+disallow TLS relocation in non-SHT_PROGBITS, non-SHF_EXECINSTR section.
+
+	PR ld/33451
+	PR ld/33502
+	* elf32-i386.c (elf_i386_tls_transition): Disallow TLS relocation
+	in non-SHT_PROGBITS, non-SHF_EXECINSTR section.
+	(elf_i386_scan_relocs): Likewise.
+	* elf64-x86-64.c (elf_x86_64_tls_transition): Likewise.
+	(elf_x86_64_scan_relocs): Likewise.
+	* elfxx-x86.c (_bfd_x86_elf_link_report_tls_invalid_section_error):
+	New.
+	* elfxx-x86.h (_bfd_x86_elf_link_report_tls_invalid_section_error):
+	Likewise.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11495
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=6b21c8b2ecfef5c95142cbc2c32f185cb1c26ab0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elf32-i386.c   | 19 +++++++++++++++++++
+ bfd/elf64-x86-64.c | 20 ++++++++++++++++++++
+ bfd/elfxx-x86.c    | 20 ++++++++++++++++++++
+ bfd/elfxx-x86.h    |  4 ++++
+ 4 files changed, 63 insertions(+)
+
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index 507a0762aff..0d60eded701 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -1166,6 +1166,15 @@ elf_i386_tls_transition (struct bfd_link_info *info, bfd *abfd,
+       return true;
+     }
+ 
++  if ((elf_section_type (sec) != SHT_PROGBITS
++       || (sec->flags & SEC_CODE) == 0))
++    {
++      reloc_howto_type *howto = elf_i386_rtype_to_howto (from_type);
++      _bfd_x86_elf_link_report_tls_invalid_section_error
++	(abfd, sec, symtab_hdr, h, sym, howto);
++      return false;
++    }
++
+   /* Return TRUE if there is no transition.  */
+   if (from_type == to_type)
+     return true;
+@@ -1727,6 +1736,16 @@ elf_i386_scan_relocs (bfd *abfd,
+ 		tls_type = GOT_TLS_IE_POS; break;
+ 	      }
+ 
++	    if (tls_type >= GOT_TLS_GD
++		&& tls_type <= GOT_TLS_GDESC
++		&& (elf_section_type (sec) != SHT_PROGBITS
++		    || (sec->flags & SEC_CODE) == 0))
++	      {
++		_bfd_x86_elf_link_report_tls_invalid_section_error
++		  (abfd, sec, symtab_hdr, h, isym, howto);
++		goto error_return;
++	      }
++
+ 	    if (h != NULL)
+ 	      {
+ 		h->got.refcount = 1;
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 620b6a380cd..59b43149897 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -1626,6 +1626,16 @@ elf_x86_64_tls_transition (struct bfd_link_info *info, bfd *abfd,
+       return true;
+     }
+ 
++  if ((elf_section_type (sec) != SHT_PROGBITS
++       || (sec->flags & SEC_CODE) == 0))
++    {
++      reloc_howto_type *howto = elf_x86_64_rtype_to_howto (abfd,
++							   from_type);
++      _bfd_x86_elf_link_report_tls_invalid_section_error
++	(abfd, sec, symtab_hdr, h, sym, howto);
++      return false;
++    }
++
+   /* Return TRUE if there is no transition.  */
+   if (from_type == to_type
+       || (from_type == R_X86_64_CODE_4_GOTTPOFF
+@@ -2748,6 +2758,16 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link_info *info,
+ 		break;
+ 	      }
+ 
++	    if (tls_type >= GOT_TLS_GD
++		&& tls_type <= GOT_TLS_GDESC
++		&& (elf_section_type (sec) != SHT_PROGBITS
++		    || (sec->flags & SEC_CODE) == 0))
++	      {
++		_bfd_x86_elf_link_report_tls_invalid_section_error
++		  (abfd, sec, symtab_hdr, h, isym, howto);
++		goto error_return;
++	      }
++
+ 	    if (h != NULL)
+ 	      {
+ 		h->got.refcount = 1;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 0d389968c91..d8c653a9ad2 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -3348,6 +3348,26 @@ _bfd_x86_elf_link_report_tls_transition_error
+   bfd_set_error (bfd_error_bad_value);
+ }
+ 
++/* Report TLS invalid section error.  */
++
++void
++_bfd_x86_elf_link_report_tls_invalid_section_error
++  (bfd *abfd, asection *sec, Elf_Internal_Shdr *symtab_hdr,
++   struct elf_link_hash_entry *h, Elf_Internal_Sym *sym,
++   reloc_howto_type *howto)
++{
++  const char *name;
++  if (h)
++    name = h->root.root.string;
++  else
++    name = bfd_elf_sym_name (abfd, symtab_hdr, sym, NULL);
++  _bfd_error_handler
++    /* xgettext:c-format */
++    (_("%pB: relocation %s against thread local symbol `%s' in "
++       "invalid section `%pA'"), abfd, howto->name, name, sec);
++  bfd_set_error (bfd_error_bad_value);
++}
++
+ /* Return TRUE if symbol should be hashed in the `.gnu.hash' section.  */
+ 
+ bool
+diff --git a/bfd/elfxx-x86.h b/bfd/elfxx-x86.h
+index 1ebc9d2f2e5..f8a24a77577 100644
+--- a/bfd/elfxx-x86.h
++++ b/bfd/elfxx-x86.h
+@@ -939,6 +939,10 @@ extern void _bfd_x86_elf_link_report_tls_transition_error
+    const Elf_Internal_Rela *, const char *, const char *,
+    enum elf_x86_tls_error_type);
+ 
++extern void _bfd_x86_elf_link_report_tls_invalid_section_error
++  (bfd *, asection *, Elf_Internal_Shdr *, struct elf_link_hash_entry *,
++   Elf_Internal_Sym *, reloc_howto_type *);
++
+ #define bfd_elf64_mkobject \
+   _bfd_x86_elf_mkobject
+ #define bfd_elf32_mkobject \

