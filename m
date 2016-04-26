Return-Path: <tristan.vanberkom@codethink.co.uk>
Received: from ducie-dc1.codethink.co.uk (ducie-dc1.codethink.co.uk
	[185.25.241.215])
	by mail.openembedded.org (Postfix) with ESMTP id D6A0E601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTP id C8DF5460541;
	Tue, 26 Apr 2016 17:31:27 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at ducie-dc1.codethink.co.uk
Received: from ducie-dc1.codethink.co.uk ([127.0.0.1])
	by localhost (ducie-dc1.codethink.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id x+xDnW-JNiKY; Tue, 26 Apr 2016 17:31:25 +0100 (BST)
Received: from think.local (modemcable077.52-176-173.mc.videotron.ca
	[173.176.52.77])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTPSA id AB86746218B;
	Tue, 26 Apr 2016 17:31:24 +0100 (BST)
Message-ID: <1461688282.4356.31.camel@codethink.co.uk>
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Apr 2016 12:31:22 -0400
In-Reply-To: <C2525670-C153-4CFC-B911-0567821B899B@gmail.com>
References: <1461617044-25526-1-git-send-email-tristan.vanberkom@codethink.co.uk>
	<1461617044-25526-3-git-send-email-tristan.vanberkom@codethink.co.uk>
	<C2525670-C153-4CFC-B911-0567821B899B@gmail.com>
Organization: Codethink LTD
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] Backporting binutils bug fix to the 2.25 branch
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
X-List-Received-Date: Tue, 26 Apr 2016 16:31:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-04-25 at 13:55 -0700, Khem Raj wrote:
> > On Apr 25, 2016, at 1:44 PM, Tristan Van Berkom <tristan.vanberkom@
> > codethink.co.uk> wrote:
> > 
> > We fail to build webkit on aarch64 due to this binutils bug:
> > 
> >   https://sourceware.org/bugzilla/show_bug.cgi?id=19353
> > 
> > Applying patch which fixes this, stripped out changelog entry
> > from patch to make it apply without error.
> 
> 
> which branch are you proposing this for?
> we use 2.26 on master

We are using the jethro branch, sorry for leaving out that detail.

Cheers,
    -Tristan

> 
> > ---
> > meta/recipes-devtools/binutils/binutils-2.25.1.inc |   1 +
> > ...plying-TLSDESC-relocs-without-TLS-segment.patch | 166
> > +++++++++++++++++++++
> > 2 files changed, 167 insertions(+)
> > create mode 100644 meta/recipes-devtools/binutils/binutils/fix-
> > internal-error-when-applying-TLSDESC-relocs-without-TLS-
> > segment.patch
> > 
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> > b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> > index f3817fa..c7db9e0 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
> > @@ -35,6 +35,7 @@ SRC_URI = "\
> >      file://0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-
> > are.patch \
> >      file://binutils-octeon3.patch \
> >      file://add-thunderx-support-for-gas.patch \
> > +     file://fix-internal-error-when-applying-TLSDESC-relocs-
> > without-TLS-segment.patch \
> >      "
> > S  = "${WORKDIR}/git"
> > 
> > diff --git a/meta/recipes-devtools/binutils/binutils/fix-internal-
> > error-when-applying-TLSDESC-relocs-without-TLS-segment.patch
> > b/meta/recipes-devtools/binutils/binutils/fix-internal-error-when-
> > applying-TLSDESC-relocs-without-TLS-segment.patch
> > new file mode 100644
> > index 0000000..df9d54c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/binutils/binutils/fix-internal-error-
> > when-applying-TLSDESC-relocs-without-TLS-segment.patch
> > @@ -0,0 +1,166 @@
> > +From d21f123b0ead1806416cf0dafae12bec4cca8920 Mon Sep 17 00:00:00
> > 2001
> > +From: Cary Coutant <ccoutant@gmail.com>
> > +Date: Mon, 11 Jan 2016 23:57:44 -0800
> > +Subject: [PATCH] Fix internal error when applying TLSDESC
> > relocations with no TLS segment.
> > +
> > +gold/
> > +	PR gold/19353
> > +	* aarch64.cc (Target_aarch64::relocate_tls): Don't insist
> > that
> > +	we have a TLS segment for GD-to-IE optimization.
> > +	* i386.cc (Target_i386::tls_gd_to_ie): Remove tls_segment
> > parameter.
> > +	Adjust all calls.
> > +	(Target_i386::tls_desc_gd_to_ie): Likewise.
> > +	(Target_i386::relocate_tls): Don't insist that we have a
> > TLS segment
> > +	for TLSDESC GD-to-IE optimizations.
> > +	* x86_64.cc (Target_x86_64::tls_gd_to_ie): Remove
> > tls_segment parameter.
> > +	Adjust all calls.
> > +	(Target_x86_64::tls_desc_gd_to_ie): Likewise.
> > +	(Target_x86_64::relocate_tls): Don't insist that we have a
> > TLS segment
> > +	for TLSDESC GD-to-IE optimizations.
> > +---
> > + gold/aarch64.cc |    6 ------
> > + gold/i386.cc    |   14 ++------------
> > + gold/x86_64.cc  |   14 ++------------
> > + 4 files changed, 20 insertions(+), 30 deletions(-)
> > +
> > +diff --git a/gold/aarch64.cc b/gold/aarch64.cc
> > +index 20f2f4f..5ad061b 100644
> > +--- a/gold/aarch64.cc
> > ++++ b/gold/aarch64.cc
> > +@@ -7422,12 +7422,6 @@ Target_aarch64<size,
> > big_endian>::Relocate::relocate_tls(
> > + 	      }
> > + 	    if (tlsopt == tls::TLSOPT_TO_IE)
> > + 	      {
> > +-		if (tls_segment == NULL)
> > +-		  {
> > +-		    gold_assert(parameters->errors()-
> > >error_count() > 0
> > +-				||
> > issue_undefined_symbol_error(gsym));
> > +-		    return aarch64_reloc_funcs::STATUS_BAD_RELOC;
> > +-		  }
> > + 		return tls_desc_gd_to_ie(relinfo, target, rela,
> > r_type,
> > + 					 view, psymval,
> > got_entry_address,
> > + 					 address);
> > +diff --git a/gold/i386.cc b/gold/i386.cc
> > +index 82886d4..a7168a8 100644
> > +--- a/gold/i386.cc
> > ++++ b/gold/i386.cc
> > +@@ -668,7 +668,6 @@ class Target_i386 : public Sized_target<32,
> > false>
> > +     // Do a TLS General-Dynamic to Initial-Exec transition.
> > +     inline void
> > +     tls_gd_to_ie(const Relocate_info<32, false>*, size_t relnum,
> > +-		 Output_segment* tls_segment,
> > + 		 const elfcpp::Rel<32, false>&, unsigned int
> > r_type,
> > + 		 elfcpp::Elf_types<32>::Elf_Addr value,
> > + 		 unsigned char* view,
> > +@@ -687,7 +686,6 @@ class Target_i386 : public Sized_target<32,
> > false>
> > +     // transition.
> > +     inline void
> > +     tls_desc_gd_to_ie(const Relocate_info<32, false>*, size_t
> > relnum,
> > +-		      Output_segment* tls_segment,
> > + 		      const elfcpp::Rel<32, false>&, unsigned int
> > r_type,
> > + 		      elfcpp::Elf_types<32>::Elf_Addr value,
> > + 		      unsigned char* view,
> > +@@ -3054,7 +3052,7 @@ Target_i386::Relocate::relocate_tls(const
> > Relocate_info<32, false>* relinfo,
> > + 	    }
> > + 	  if (optimized_type == tls::TLSOPT_TO_IE)
> > + 	    {
> > +-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment,
> > rel, r_type,
> > ++	      this->tls_gd_to_ie(relinfo, relnum, rel, r_type,
> > + 				 got_offset, view, view_size);
> > + 	      break;
> > + 	    }
> > +@@ -3116,13 +3114,7 @@ Target_i386::Relocate::relocate_tls(const
> > Relocate_info<32, false>* relinfo,
> > + 	    }
> > + 	  if (optimized_type == tls::TLSOPT_TO_IE)
> > + 	    {
> > +-	      if (tls_segment == NULL)
> > +-		{
> > +-		  gold_assert(parameters->errors()->error_count() 
> > > 0
> > +-			      ||
> > issue_undefined_symbol_error(gsym));
> > +-		  return;
> > +-		}
> > +-	      this->tls_desc_gd_to_ie(relinfo, relnum,
> > tls_segment, rel, r_type,
> > ++	      this->tls_desc_gd_to_ie(relinfo, relnum, rel,
> > r_type,
> > + 				      got_offset, view,
> > view_size);
> > + 	      break;
> > + 	    }
> > +@@ -3354,7 +3346,6 @@ Target_i386::Relocate::tls_gd_to_le(const
> > Relocate_info<32, false>* relinfo,
> > + inline void
> > + Target_i386::Relocate::tls_gd_to_ie(const Relocate_info<32,
> > false>* relinfo,
> > + 				    size_t relnum,
> > +-				    Output_segment*,
> > + 				    const elfcpp::Rel<32, false>&
> > rel,
> > + 				    unsigned int,
> > + 				    elfcpp::Elf_types<32>::Elf_Ad
> > dr value,
> > +@@ -3449,7 +3440,6 @@ inline void
> > + Target_i386::Relocate::tls_desc_gd_to_ie(
> > +     const Relocate_info<32, false>* relinfo,
> > +     size_t relnum,
> > +-    Output_segment*,
> > +     const elfcpp::Rel<32, false>& rel,
> > +     unsigned int r_type,
> > +     elfcpp::Elf_types<32>::Elf_Addr value,
> > +diff --git a/gold/x86_64.cc b/gold/x86_64.cc
> > +index 3cfc064..4ad5afc 100644
> > +--- a/gold/x86_64.cc
> > ++++ b/gold/x86_64.cc
> > +@@ -816,7 +816,6 @@ class Target_x86_64 : public
> > Sized_target<size, false>
> > +     // Do a TLS General-Dynamic to Initial-Exec transition.
> > +     inline void
> > +     tls_gd_to_ie(const Relocate_info<size, false>*, size_t
> > relnum,
> > +-		 Output_segment* tls_segment,
> > + 		 const elfcpp::Rela<size, false>&, unsigned int
> > r_type,
> > + 		 typename elfcpp::Elf_types<size>::Elf_Addr
> > value,
> > + 		 unsigned char* view,
> > +@@ -835,7 +834,6 @@ class Target_x86_64 : public
> > Sized_target<size, false>
> > +     // Do a TLSDESC-style General-Dynamic to Initial-Exec
> > transition.
> > +     inline void
> > +     tls_desc_gd_to_ie(const Relocate_info<size, false>*, size_t
> > relnum,
> > +-		      Output_segment* tls_segment,
> > + 		      const elfcpp::Rela<size, false>&, unsigned
> > int r_type,
> > + 		      typename elfcpp::Elf_types<size>::Elf_Addr
> > value,
> > + 		      unsigned char* view,
> > +@@ -3733,7 +3731,7 @@ Target_x86_64<size>::Relocate::relocate_tls(
> > + 	  if (optimized_type == tls::TLSOPT_TO_IE)
> > + 	    {
> > + 	      value = target->got_plt_section()->address() +
> > got_offset;
> > +-	      this->tls_gd_to_ie(relinfo, relnum, tls_segment,
> > rela, r_type,
> > ++	      this->tls_gd_to_ie(relinfo, relnum, rela, r_type,
> > + 				 value, view, address,
> > view_size);
> > + 	      break;
> > + 	    }
> > +@@ -3800,14 +3798,8 @@
> > Target_x86_64<size>::Relocate::relocate_tls(
> > + 	    }
> > + 	  if (optimized_type == tls::TLSOPT_TO_IE)
> > + 	    {
> > +-	      if (tls_segment == NULL)
> > +-		{
> > +-		  gold_assert(parameters->errors()->error_count() 
> > > 0
> > +-			      ||
> > issue_undefined_symbol_error(gsym));
> > +-		  return;
> > +-		}
> > + 	      value = target->got_plt_section()->address() +
> > got_offset;
> > +-	      this->tls_desc_gd_to_ie(relinfo, relnum,
> > tls_segment,
> > ++	      this->tls_desc_gd_to_ie(relinfo, relnum,
> > + 				      rela, r_type, value, view,
> > address,
> > + 				      view_size);
> > + 	      break;
> > +@@ -3973,7 +3965,6 @@ inline void
> > + Target_x86_64<size>::Relocate::tls_gd_to_ie(
> > +     const Relocate_info<size, false>* relinfo,
> > +     size_t relnum,
> > +-    Output_segment*,
> > +     const elfcpp::Rela<size, false>& rela,
> > +     unsigned int,
> > +     typename elfcpp::Elf_types<size>::Elf_Addr value,
> > +@@ -4085,7 +4076,6 @@ inline void
> > + Target_x86_64<size>::Relocate::tls_desc_gd_to_ie(
> > +     const Relocate_info<size, false>* relinfo,
> > +     size_t relnum,
> > +-    Output_segment*,
> > +     const elfcpp::Rela<size, false>& rela,
> > +     unsigned int r_type,
> > +     typename elfcpp::Elf_types<size>::Elf_Addr value,
> > +--
> > +1.7.1
> > +
> > --
> > 2.8.0.rc3
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


