Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5C428606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:15:42 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so6182483pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=iVUynH6RHEvnHW9/ctJ2CaGVZp4ufqcH0gp2KXyAisk=;
	b=TTwjZRkLvq3UPD7/eymNfzteHrwCNToZjAbKrtawULccDZ1D6XVffeLdTxYxMEc+do
	/YR9R97kf2MpWsnzHHcPojmenoKSKe+tU0URFD9It1Bai1kXx9MIRw2Gt3iJ0v0Sx2z0
	XqNQk26R6EtbVK3/DXpfZ2eNrQz4oH1TKfYuRN30HELMOqHjHn0dRVk6mvV7dKRStmOS
	YeGSaw8CCxbWvxza/FvzdHrm8jPD0oiAzwWcyr530X5jB4RVUkh0ub5TSi/B43KGNR8x
	SNcrNluLq+fzcAWt9TMES9irqvCeY/NbwkAFWdHKbwC4w17+HYK79DcEyO1QztjusX88
	TceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=iVUynH6RHEvnHW9/ctJ2CaGVZp4ufqcH0gp2KXyAisk=;
	b=SqTkFwOcSNkHXhn9bDtiAPDFtKXFFKT0rbluUWL2Y4oUjFbNQNoVAHqz6semM/LiTG
	KTibamLvnL/X7a3L+sgbL60Z3ECzEYZAglUjBHUgif52qogGl4+nkYOHsUDgQfGcHkyC
	5Ab971aoKPOI4DZC4BDEq/5uZdn7sgpCWPhphW4W0VI13JWmHP74uVcJejtcoiOhfSUl
	cOWhGkdhqM/yFg46upuVvWsWcXjgVpQhxePaUWb3Rol0idDc7EpJmAKgEbvtn2m/28GW
	a5TAKDaHtgZG1cj4RVk/gdBdyXvRC/xCScv+4DTKyIkgzWqpKbvJIH4q4q5Hgy4lT6WH
	21fA==
X-Gm-Message-State: ALyK8tIJnTxmWX450XoqGO977umDeDSNsoS4xBTjLCbveeyQw+4e9hpFOA1BdNaZ0tIbXw==
X-Received: by 10.66.47.133 with SMTP id d5mr31823768pan.48.1468592142853;
	Fri, 15 Jul 2016 07:15:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:194d:2232:d2ef:3b9c?
	([2601:202:4001:9ea0:194d:2232:d2ef:3b9c])
	by smtp.googlemail.com with ESMTPSA id
	t80sm5835917pfj.38.2016.07.15.07.15.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 07:15:41 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1468526359-16293-1-git-send-email-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5788F00C.70000@gmail.com>
Date: Fri, 15 Jul 2016 07:15:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1468526359-16293-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH][krogoth] binutils: backport fix for TLSDESC relocations with no TLS segment on arch64
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
X-List-Received-Date: Fri, 15 Jul 2016 14:15:44 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 07/14/2016 12:59 PM, Ross Burton wrote:
> As exposed by WebKit on aarch64 hosts, which causes binutils to throw an
> internal error.
> 
> [ YOCTO #9509 ]
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

thanks.

pulled into staging.

- armin
> ---
>  meta/recipes-devtools/binutils/binutils-2.26.inc   |   1 +
>  .../binutils/binutils/aarch64-tls.patch            | 177 +++++++++++++++++++++
>  2 files changed, 178 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/aarch64-tls.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
> index 6d535fc..703eac2 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.26.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
> @@ -34,6 +34,7 @@ SRC_URI = "\
>       file://0012-Add-support-for-Netlogic-XLP.patch \
>       file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
>       file://0014-Correct-nios2-_gp-address-computation.patch \
> +     file://aarch64-tls.patch \
>  "
>  S  = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch b/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch
> new file mode 100644
> index 0000000..6b123ac
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/aarch64-tls.patch
> @@ -0,0 +1,177 @@
> +Building WebKit on an aarch64 host will fail:
> +
> +gold/ld-new: internal error in relocate_tls, at ../../binutils/gold/aarch64.cc:7418
> +
> +This was a binutils bug, so backport the fix.
> +
> +https://sourceware.org/bugzilla/show_bug.cgi?id=19353
> +
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From d21f123b0ead1806416cf0dafae12bec4cca8920 Mon Sep 17 00:00:00 2001
> +From: Cary Coutant <ccoutant@gmail.com>
> +Date: Mon, 11 Jan 2016 23:57:44 -0800
> +Subject: [PATCH] Fix internal error when applying TLSDESC relocations with no TLS segment.
> +
> +gold/
> +	PR gold/19353
> +	* aarch64.cc (Target_aarch64::relocate_tls): Don't insist that
> +	we have a TLS segment for GD-to-IE optimization.
> +	* i386.cc (Target_i386::tls_gd_to_ie): Remove tls_segment parameter.
> +	Adjust all calls.
> +	(Target_i386::tls_desc_gd_to_ie): Likewise.
> +	(Target_i386::relocate_tls): Don't insist that we have a TLS segment
> +	for TLSDESC GD-to-IE optimizations.
> +	* x86_64.cc (Target_x86_64::tls_gd_to_ie): Remove tls_segment parameter.
> +	Adjust all calls.
> +	(Target_x86_64::tls_desc_gd_to_ie): Likewise.
> +	(Target_x86_64::relocate_tls): Don't insist that we have a TLS segment
> +	for TLSDESC GD-to-IE optimizations.
> +---
> + gold/ChangeLog  |   16 ++++++++++++++++
> + gold/aarch64.cc |    6 ------
> + gold/i386.cc    |   14 ++------------
> + gold/x86_64.cc  |   14 ++------------
> + 4 files changed, 20 insertions(+), 30 deletions(-)
> +
> +diff --git a/gold/aarch64.cc b/gold/aarch64.cc
> +index 20f2f4f..5ad061b 100644
> +--- a/gold/aarch64.cc
> ++++ b/gold/aarch64.cc
> +@@ -7422,12 +7422,6 @@ Target_aarch64<size, big_endian>::Relocate::relocate_tls(
> + 	      }
> + 	    if (tlsopt == tls::TLSOPT_TO_IE)
> + 	      {
> +-		if (tls_segment == NULL)
> +-		  {
> +-		    gold_assert(parameters->errors()->error_count() > 0
> +-				|| issue_undefined_symbol_error(gsym));
> +-		    return aarch64_reloc_funcs::STATUS_BAD_RELOC;
> +-		  }
> + 		return tls_desc_gd_to_ie(relinfo, target, rela, r_type,
> + 					 view, psymval, got_entry_address,
> + 					 address);
> +diff --git a/gold/i386.cc b/gold/i386.cc
> +index 82886d4..a7168a8 100644
> +--- a/gold/i386.cc
> ++++ b/gold/i386.cc
> +@@ -668,7 +668,6 @@ class Target_i386 : public Sized_target<32, false>
> +     // Do a TLS General-Dynamic to Initial-Exec transition.
> +     inline void
> +     tls_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
> +-		 Output_segment* tls_segment,
> + 		 const elfcpp::Rel<32, false>&, unsigned int r_type,
> + 		 elfcpp::Elf_types<32>::Elf_Addr value,
> + 		 unsigned char* view,
> +@@ -687,7 +686,6 @@ class Target_i386 : public Sized_target<32, false>
> +     // transition.
> +     inline void
> +     tls_desc_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
> +-		      Output_segment* tls_segment,
> + 		      const elfcpp::Rel<32, false>&, unsigned int r_type,
> + 		      elfcpp::Elf_types<32>::Elf_Addr value,
> + 		      unsigned char* view,
> +@@ -3054,7 +3052,7 @@ Target_i386::Relocate::relocate_tls(const Relocate_info<32, false>* relinfo,
> + 	    }
> + 	  if (optimized_type == tls::TLSOPT_TO_IE)
> + 	    {
> +-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment, rel, r_type,
> ++	      this->tls_gd_to_ie(relinfo, relnum, rel, r_type,
> + 				 got_offset, view, view_size);
> + 	      break;
> + 	    }
> +@@ -3116,13 +3114,7 @@ Target_i386::Relocate::relocate_tls(const Relocate_info<32, false>* relinfo,
> + 	    }
> + 	  if (optimized_type == tls::TLSOPT_TO_IE)
> + 	    {
> +-	      if (tls_segment == NULL)
> +-		{
> +-		  gold_assert(parameters->errors()->error_count() > 0
> +-			      || issue_undefined_symbol_error(gsym));
> +-		  return;
> +-		}
> +-	      this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment, rel, r_type,
> ++	      this->tls_desc_gd_to_ie(relinfo, relnum, rel, r_type,
> + 				      got_offset, view, view_size);
> + 	      break;
> + 	    }
> +@@ -3354,7 +3346,6 @@ Target_i386::Relocate::tls_gd_to_le(const Relocate_info<32, false>* relinfo,
> + inline void
> + Target_i386::Relocate::tls_gd_to_ie(const Relocate_info<32, false>* relinfo,
> + 				    size_t relnum,
> +-				    Output_segment*,
> + 				    const elfcpp::Rel<32, false>& rel,
> + 				    unsigned int,
> + 				    elfcpp::Elf_types<32>::Elf_Addr value,
> +@@ -3449,7 +3440,6 @@ inline void
> + Target_i386::Relocate::tls_desc_gd_to_ie(
> +     const Relocate_info<32, false>* relinfo,
> +     size_t relnum,
> +-    Output_segment*,
> +     const elfcpp::Rel<32, false>& rel,
> +     unsigned int r_type,
> +     elfcpp::Elf_types<32>::Elf_Addr value,
> +diff --git a/gold/x86_64.cc b/gold/x86_64.cc
> +index 3cfc064..4ad5afc 100644
> +--- a/gold/x86_64.cc
> ++++ b/gold/x86_64.cc
> +@@ -816,7 +816,6 @@ class Target_x86_64 : public Sized_target<size, false>
> +     // Do a TLS General-Dynamic to Initial-Exec transition.
> +     inline void
> +     tls_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
> +-		 Output_segment* tls_segment,
> + 		 const elfcpp::Rela<size, false>&, unsigned int r_type,
> + 		 typename elfcpp::Elf_types<size>::Elf_Addr value,
> + 		 unsigned char* view,
> +@@ -835,7 +834,6 @@ class Target_x86_64 : public Sized_target<size, false>
> +     // Do a TLSDESC-style General-Dynamic to Initial-Exec transition.
> +     inline void
> +     tls_desc_gd_to_ie(const Relocate_info<size, false>*, size_t relnum,
> +-		      Output_segment* tls_segment,
> + 		      const elfcpp::Rela<size, false>&, unsigned int r_type,
> + 		      typename elfcpp::Elf_types<size>::Elf_Addr value,
> + 		      unsigned char* view,
> +@@ -3733,7 +3731,7 @@ Target_x86_64<size>::Relocate::relocate_tls(
> + 	  if (optimized_type == tls::TLSOPT_TO_IE)
> + 	    {
> + 	      value = target->got_plt_section()->address() + got_offset;
> +-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment, rela, r_type,
> ++	      this->tls_gd_to_ie(relinfo, relnum, rela, r_type,
> + 				 value, view, address, view_size);
> + 	      break;
> + 	    }
> +@@ -3800,14 +3798,8 @@ Target_x86_64<size>::Relocate::relocate_tls(
> + 	    }
> + 	  if (optimized_type == tls::TLSOPT_TO_IE)
> + 	    {
> +-	      if (tls_segment == NULL)
> +-		{
> +-		  gold_assert(parameters->errors()->error_count() > 0
> +-			      || issue_undefined_symbol_error(gsym));
> +-		  return;
> +-		}
> + 	      value = target->got_plt_section()->address() + got_offset;
> +-	      this->tls_desc_gd_to_ie(relinfo, relnum, tls_segment,
> ++	      this->tls_desc_gd_to_ie(relinfo, relnum,
> + 				      rela, r_type, value, view, address,
> + 				      view_size);
> + 	      break;
> +@@ -3973,7 +3965,6 @@ inline void
> + Target_x86_64<size>::Relocate::tls_gd_to_ie(
> +     const Relocate_info<size, false>* relinfo,
> +     size_t relnum,
> +-    Output_segment*,
> +     const elfcpp::Rela<size, false>& rela,
> +     unsigned int,
> +     typename elfcpp::Elf_types<size>::Elf_Addr value,
> +@@ -4085,7 +4076,6 @@ inline void
> + Target_x86_64<size>::Relocate::tls_desc_gd_to_ie(
> +     const Relocate_info<size, false>* relinfo,
> +     size_t relnum,
> +-    Output_segment*,
> +     const elfcpp::Rela<size, false>& rela,
> +     unsigned int r_type,
> +     typename elfcpp::Elf_types<size>::Elf_Addr value,
> +-- 
> +1.7.1
> 

