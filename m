Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CBA3E6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 19:59:41 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f126so1955243wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=anW5RUAccXzIKnJiBb1CFCAif3dCYwp5IfJo27VyCuA=;
	b=bNldJuMV7OtBoLY2N7dqdiZOzTHZAXXFVW/mMpXiLhthHOE7VKpIjKhy2a2SDny6jy
	FKiyz3bEWqrE6KCRJ75odS1/dHnA8Q12GcJa4/igQrUa8/6xo3oN/u5ppGFiH+XG5CT1
	hWmC/5GslwMeFBrFrbraO55N2ntGbCareRkWiyGIlw4P69cbUbXoUypQot+pNair7k9J
	W8gTuUnfF16ZvGdcglbFR8KNrf/SAGKwHoXoMWyPI0f48FkYMrrGbXZK0/4w0Xpzknc1
	tSp+yBxEocQq/UwN2+wwb9QVUoQ0ztqUZW6U4mCdEwFxU49z9LEEp26yHXPvRnjp2iJT
	0yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=anW5RUAccXzIKnJiBb1CFCAif3dCYwp5IfJo27VyCuA=;
	b=PR1kaU2LYCJMQslItBDwyhJUE4ZT1GnovkthwDlk1SHpaFMdqPxTNUUW6PBi+2mtWY
	ZLKwOIagEa+lYMO3dd5zGlawwYCI3+cauJqiTY9aM8exM2JQxYQMK9Qk7qkYWLxwuzZF
	VFV4hylBWcAGyh6Gtwq66gjSiCyZBG1t5jCHOFJS04TGwaDBgyvdHfpCJ+mRI+8ba7m+
	vpT2A+/q5sCDfCwP2In4i4FopZ5MsrzIR6dMN4Xl3aiYxZ/SQvipQK7ok2J91PsOkXEb
	TCJP3CB+hOcTZhZ3yMPDnMOZyqjE766SHetrSuIXsKGBN3O0oL51SyN6kPZwjGQGCH/m
	7o0Q==
X-Gm-Message-State: ALyK8tIE0QiYnMyphTi3eUdEpEXsScnfyUecW3G0ptLFOfv1sYKfUN0SSqSpxTDYOnwNvC+8
X-Received: by 10.28.30.1 with SMTP id e1mr6942966wme.77.1468526381524;
	Thu, 14 Jul 2016 12:59:41 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x62sm9206437wmf.13.2016.07.14.12.59.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 12:59:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 20:59:37 +0100
Message-Id: <1468526377-32121-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] binutils: backport fix for TLSDESC relocations with no TLS segment on arch64
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
X-List-Received-Date: Thu, 14 Jul 2016 19:59:42 -0000

As exposed by WebKit on aarch64 hosts, which causes binutils to throw an
internal error.

[ YOCTO #9509 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   1 +
 .../binutils/binutils/aarch64-tls.patch            | 177 +++++++++++++++++++++
 2 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/aarch64-tls.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
index 82cb7f5..1f7bee2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.26.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -35,6 +35,7 @@ SRC_URI = "\
      file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
      file://0014-Correct-nios2-_gp-address-computation.patch \
      file://0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
+     file://aarch64-tls.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch b/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch
new file mode 100644
index 0000000..6b123ac
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch
@@ -0,0 +1,177 @@
+Building WebKit on an aarch64 host will fail:
+
+gold/ld-new: internal error in relocate_tls, at ../../binutils/gold/aarch64.cc:7418
+
+This was a binutils bug, so backport the fix.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=19353
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From d21f123b0ead1806416cf0dafae12bec4cca8920 Mon Sep 17 00:00:00 2001
+From: Cary Coutant <ccoutant@gmail.com>
+Date: Mon, 11 Jan 2016 23:57:44 -0800
+Subject: [PATCH] Fix internal error when applying TLSDESC relocations with no TLS segment.
+
+gold/
+	PR gold/19353
+	* aarch64.cc (Target_aarch64::relocate_tls): Don't insist that
+	we have a TLS segment for GD-to-IE optimization.
+	* i386.cc (Target_i386::tls_gd_to_ie): Remove tls_segment parameter.
+	Adjust all calls.
+	(Target_i386::tls_desc_gd_to_ie): Likewise.
+	(Target_i386::relocate_tls): Don't insist that we have a TLS segment
+	for TLSDESC GD-to-IE optimizations.
+	* x86_64.cc (Target_x86_64::tls_gd_to_ie): Remove tls_segment parameter.
+	Adjust all calls.
+	(Target_x86_64::tls_desc_gd_to_ie): Likewise.
+	(Target_x86_64::relocate_tls): Don't insist that we have a TLS segment
+	for TLSDESC GD-to-IE optimizations.
+---
+ gold/ChangeLog  |   16 ++++++++++++++++
+ gold/aarch64.cc |    6 ------
+ gold/i386.cc    |   14 ++------------
+ gold/x86_64.cc  |   14 ++------------
+ 4 files changed, 20 insertions(+), 30 deletions(-)
+
+diff --git a/gold/aarch64.cc b/gold/aarch64.cc
+index 20f2f4f..5ad061b 100644
+--- a/gold/aarch64.cc
++++ b/gold/aarch64.cc
+@@ -7422,12 +7422,6 @@ Target_aarch64<size, big_endian>::Relocate::relocate_tls(
+ 	      }
+ 	    if (tlsopt == tls::TLSOPT_TO_IE)
+ 	      {
+-		if (tls_segment == NULL)
+-		  {
+-		    gold_assert(parameters->errors()->error_count() > 0
+-				|| issue_undefined_symbol_error(gsym));
+-		    return aarch64_reloc_funcs::STATUS_BAD_RELOC;
+-		  }
+ 		return tls_desc_gd_to_ie(relinfo, target, rela, r_type,
+ 					 view, psymval, got_entry_address,
+ 					 address);
+diff --git a/gold/i386.cc b/gold/i386.cc
+index 82886d4..a7168a8 100644
+--- a/gold/i386.cc
++++ b/gold/i386.cc
+@@ -668,7 +668,6 @@ class Target_i386 : public Sized_target<32, false>
+     // Do a TLS General-Dynamic to Initial-Exec transition.
+     inline void
+     tls_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
+-		 Output_segment* tls_segment,
+ 		 const elfcpp::Rel<32, false>&, unsigned int r_type,
+ 		 elfcpp::Elf_types<32>::Elf_Addr value,
+ 		 unsigned char* view,
+@@ -687,7 +686,6 @@ class Target_i386 : public Sized_target<32, false>
+     // transition.
+     inline void
+     tls_desc_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
+-		      Output_segment* tls_segment,
+ 		      const elfcpp::Rel<32, false>&, unsigned int r_type,
+ 		      elfcpp::Elf_types<32>::Elf_Addr value,
+ 		      unsigned char* view,
+@@ -3054,7 +3052,7 @@ Target_i386::Relocate::relocate_tls(const Relocate_info<32, false>* relinfo,
+ 	    }
+ 	  if (optimized_type == tls::TLSOPT_TO_IE)
+ 	    {
+-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment, rel, r_type,
++	      this->tls_gd_to_ie(relinfo, relnum, rel, r_type,
+ 				 got_offset, view, view_size);
+ 	      break;
+ 	    }
+@@ -3116,13 +3114,7 @@ Target_i386::Relocate::relocate_tls(const Relocate_info<32, false>* relinfo,
+ 	    }
+ 	  if (optimized_type == tls::TLSOPT_TO_IE)
+ 	    {
+-	      if (tls_segment == NULL)
+-		{
+-		  gold_assert(parameters->errors()->error_count() > 0
+-			      || issue_undefined_symbol_error(gsym));
+-		  return;
+-		}
+-	      this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment, rel, r_type,
++	      this->tls_desc_gd_to_ie(relinfo, relnum, rel, r_type,
+ 				      got_offset, view, view_size);
+ 	      break;
+ 	    }
+@@ -3354,7 +3346,6 @@ Target_i386::Relocate::tls_gd_to_le(const Relocate_info<32, false>* relinfo,
+ inline void
+ Target_i386::Relocate::tls_gd_to_ie(const Relocate_info<32, false>* relinfo,
+ 				    size_t relnum,
+-				    Output_segment*,
+ 				    const elfcpp::Rel<32, false>& rel,
+ 				    unsigned int,
+ 				    elfcpp::Elf_types<32>::Elf_Addr value,
+@@ -3449,7 +3440,6 @@ inline void
+ Target_i386::Relocate::tls_desc_gd_to_ie(
+     const Relocate_info<32, false>* relinfo,
+     size_t relnum,
+-    Output_segment*,
+     const elfcpp::Rel<32, false>& rel,
+     unsigned int r_type,
+     elfcpp::Elf_types<32>::Elf_Addr value,
+diff --git a/gold/x86_64.cc b/gold/x86_64.cc
+index 3cfc064..4ad5afc 100644
+--- a/gold/x86_64.cc
++++ b/gold/x86_64.cc
+@@ -816,7 +816,6 @@ class Target_x86_64 : public Sized_target<size, false>
+     // Do a TLS General-Dynamic to Initial-Exec transition.
+     inline void
+     tls_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
+-		 Output_segment* tls_segment,
+ 		 const elfcpp::Rela<size, false>&, unsigned int r_type,
+ 		 typename elfcpp::Elf_types<size>::Elf_Addr value,
+ 		 unsigned char* view,
+@@ -835,7 +834,6 @@ class Target_x86_64 : public Sized_target<size, false>
+     // Do a TLSDESC-style General-Dynamic to Initial-Exec transition.
+     inline void
+     tls_desc_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
+-		      Output_segment* tls_segment,
+ 		      const elfcpp::Rela<size, false>&, unsigned int r_type,
+ 		      typename elfcpp::Elf_types<size>::Elf_Addr value,
+ 		      unsigned char* view,
+@@ -3733,7 +3731,7 @@ Target_x86_64<size>::Relocate::relocate_tls(
+ 	  if (optimized_type == tls::TLSOPT_TO_IE)
+ 	    {
+ 	      value = target->got_plt_section()->address() + got_offset;
+-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment, rela, r_type,
++	      this->tls_gd_to_ie(relinfo, relnum, rela, r_type,
+ 				 value, view, address, view_size);
+ 	      break;
+ 	    }
+@@ -3800,14 +3798,8 @@ Target_x86_64<size>::Relocate::relocate_tls(
+ 	    }
+ 	  if (optimized_type == tls::TLSOPT_TO_IE)
+ 	    {
+-	      if (tls_segment == NULL)
+-		{
+-		  gold_assert(parameters->errors()->error_count() > 0
+-			      || issue_undefined_symbol_error(gsym));
+-		  return;
+-		}
+ 	      value = target->got_plt_section()->address() + got_offset;
+-	      this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment,
++	      this->tls_desc_gd_to_ie(relinfo, relnum,
+ 				      rela, r_type, value, view, address,
+ 				      view_size);
+ 	      break;
+@@ -3973,7 +3965,6 @@ inline void
+ Target_x86_64<size>::Relocate::tls_gd_to_ie(
+     const Relocate_info<size, false>* relinfo,
+     size_t relnum,
+-    Output_segment*,
+     const elfcpp::Rela<size, false>& rela,
+     unsigned int,
+     typename elfcpp::Elf_types<size>::Elf_Addr value,
+@@ -4085,7 +4076,6 @@ inline void
+ Target_x86_64<size>::Relocate::tls_desc_gd_to_ie(
+     const Relocate_info<size, false>* relinfo,
+     size_t relnum,
+-    Output_segment*,
+     const elfcpp::Rela<size, false>& rela,
+     unsigned int r_type,
+     typename elfcpp::Elf_types<size>::Elf_Addr value,
+-- 
+1.7.1
-- 
2.8.1


