Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web10.6805.1620825726669619581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 06:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HngTmeh4;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id j19so4754650vkj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LDbNbUW0efREeXh5BPy1SoZhM80QJ8T8ECgNGDk56F8=;
        b=HngTmeh4o0OoBhtayemfgJeGVMcHgZAKmv94pt2UxoYfOuuj6t/ci+2oAiR1X6a6hg
         qERqPYgFezyDqHc/lWcLE90RkeeV9/+ESQJZTOvXvwzXbKQtZ4++FmcEhFIwwvu/uYMs
         joG/Sc3nueVqkFyPQvzuctChvdGIMpKOWw/QE/IdKKByqDNtNQ8Bj36sNcSUGHUB8Jg5
         v8/JP8LdmA/LhqKEukSkFCWNnaB6PT3kB/GIZJvbmGtjb7CdYVM1EWXPgktKbLp8ZeWn
         2cQHkGIhsYC5mIcL1JDBmqRtgPE+WpTSPwNz2XupOK6mPhhipTQ+/EuntErLH2wvcqR7
         0YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LDbNbUW0efREeXh5BPy1SoZhM80QJ8T8ECgNGDk56F8=;
        b=MA48wp4AUfQDffw2zrWI/CmjmLbtCPq49wJoCeCxBphTTpcyi+pdAeEVj+h8gnZ6M7
         zj7xmUlqWvm9/Z71X2xKIrmNxZ/61gKQbE9toXsPatrzjt93O/FjEjITEJpyIO19wszC
         VqMYWCC/yBzW5yfY8GzYtfehxWRCwDxYI1ERf/rgxTz73OTBo40AoN1/am6G8p7Vh4ty
         oEqWG3PfCsv9uIuiCjtVY7jWr0nckdfX0OYI69ng33wNicMoB+oWW7BNNJyXcTB+PZca
         lRupR2Tv+DEUdrszA80ff99C/kqC1GDg+hhrS7hLOVBWJwOZO7z2oHu0doyipwe2Z3xP
         K6eg==
X-Gm-Message-State: AOAM531vqf+ZVeXmpLmxJFJRRAN4y94KXaIQ9hqGzRjLSJUkdQqbzwyS
	3CDyEgNwT5LwkNgqMChWNK3flirKOUG3LSecxTA=
X-Google-Smtp-Source: ABdhPJxXaOmpO+fzlS95psWxp5DvoS46GXNvEfWSH8DkLGPTvfRU6d/M9wHuWwhrCWBDnQsMEMFE+6Zpb3pauGmrD08=
X-Received: by 2002:a1f:9d46:: with SMTP id g67mr28404877vke.10.1620825725625;
 Wed, 12 May 2021 06:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210512124221.61985-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210512124221.61985-1-Martin.Jansa@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 12 May 2021 15:21:53 +0200
Message-ID: <CANNYZj-wzHbziSLMPVh40qpnHntcRyqxpTa+g+p9JtqSeZv42g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: backport DWARF-5 support
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009e6abd05c221e590"

--0000000000009e6abd05c221e590
Content-Type: text/plain; charset="UTF-8"

The patch backports dwarf-5 support to gold linker (presumably from an
upcoming version of binutils?), which does not quite match the title or
description?

Alex

On Wed, 12 May 2021 at 14:42, Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * DWARF-5 is now used by default with gcc-11, causing
>   11.1.0/ld: internal error in format_file_lineno, at
> ../../gold/dwarf_reader.cc:2278
>   collect2: error: ld returned 1 exit status
>   in various projects (runc-opencontainers, libhybris, collada-dom)
>
> * https://gcc.gnu.org/gcc-11/changes.html
>
>   For targets that produce DWARF debugging information GCC now defaults to
> DWARF version 5
>   (with the exception of VxWorks and Darwin/Mac OS X which default to
> version 2 and
>   AIX which defaults to version 4). This can produce up to 25% more
> compact debug
>   information compared to earlier versions.
>
>   To take full advantage of DWARF version 5 GCC needs to be build against
> binutils version 2.35.2 or higher.
>   When GCC is build against earlier versions of binutils GCC will still
> emit DWARF version 5 for
>   most debuginfo data, but will generate version 4 debug line tables (even
> when explicitly given -gdwarf-5).
>
>   The following debug information consumers can process DWARF version 5:
>
>   GDB 8.0, or higher
>   valgrind 3.17.0
>   elfutils 0.172, or higher (for use with systemtap, dwarves/pahole, perf
> and libabigail)
>   dwz 0.14
>   Programs embedding libbacktrace are urged to upgrade to the version
> shipping with GCC 11.
>
>   To make GCC 11 generate an older DWARF version use -g together with
> -gdwarf-2, -gdwarf-3 or -gdwarf-4.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../binutils/binutils-2.36.inc                |    1 +
>  .../0018-Add-DWARF-5-support-in-gold.patch    | 1374 +++++++++++++++++
>  2 files changed, 1375 insertions(+)
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-gold.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc
> b/meta/recipes-devtools/binutils/binutils-2.36.inc
> index 66080dfcee..d54e2a3457 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.36.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
> @@ -36,6 +36,7 @@ SRC_URI = "\
>       file://0015-sync-with-OE-libtool-changes.patch \
>       file://0016-Check-for-clang-before-checking-gcc-version.patch \
>
> file://0017-Add-support-for-the-DW_FORM_strx-forms-to-the-BFD-li.patch \
> +     file://0018-Add-DWARF-5-support-in-gold.patch \
>       file://CVE-2021-20197.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-gold.patch
> b/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-gold.patch
> new file mode 100644
> index 0000000000..353b680857
> --- /dev/null
> +++
> b/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-gold.patch
> @@ -0,0 +1,1374 @@
> +From 29dab7648672342418a9d32767e3b3182d9e6a30 Mon Sep 17 00:00:00 2001
> +From: Cary Coutant <ccoutant@gmail.com>
> +Date: Wed, 17 Mar 2021 21:31:15 -0700
> +Subject: [PATCH] Add DWARF 5 support in gold.
> +
> +elfcpp/
> +       PR gold/27246
> +       * dwarf.h (enum DW_LNCT): Add line number table content type codes.
> +       (enum DW_LINE_OPS): Reformat.
> +       (enum DW_LINE_EXTENDED_OPS): Reformat.
> +       (enum DW_CHILDREN): Reformat.
> +       (enum DW_RLE): Add range list entry types.
> +       (enum DW_SECT): Update values for DWARF 5.
> +
> +gold/
> +       PR gold/27246
> +       * dwarf_reader.cc (Dwarf_abbrev_table::do_get_abbrev): Handle
> +       DW_FORM_implicit_const.
> +       (Dwarf_ranges_table::read_ranges_table): Add version parameter;
> +       Adjust all callers.  Look for .debug_rnglists section if DWARF 5.
> +       (Dwarf_ranges_table::read_range_list_v5): New method.
> +       (Dwarf_die::read_attributes): Handle new DWARF 5 DW_FORM codes.
> +       (Dwarf_die::skip_attributes): Likewise.
> +       (Dwarf_info_reader::do_parse): Support DWARF 5 unit header format.
> +       (Dwarf_info_reader::read_3bytes_from_pointer): New method.
> +       (Sized_dwarf_line_info::Sized_dwarf_line_info): Initialize
> +       str_buffer_, str_buffer_start, reloc_map_, line_number_map_.
> +       Look for .debug_line_str section.
> +       (Sized_dwarf_line_info::read_header_prolog): Support DWARF 5
> prolog.
> +       (Sized_dwarf_line_info::read_header_tables): Rename to...
> +       (Sized_dwarf_line_info::read_header_tables_v2): ... this.
> +       (Sized_dwarf_line_info::read_header_tables_v5): New method.
> +       (Sized_dwarf_line_info::process_one_opcode): Insert missing
> "this->".
> +       Change advance_line to signed int64_t.
> +       (Sized_dwarf_line_info::read_lines): Add endptr parameter; adjust
> +       callers.  Insert missing "this->".
> +       (Sized_dwarf_line_info::read_line_mappings): Support DWARF 5.
> +       (Sized_dwarf_line_info::do_addr2line): Add debug code.
> +       * dwarf_reader.h (Dwarf_abbrev_table::Attribute): Add
> implicit_const
> +       field. Adjust constructor.
> +       (Dwarf_abbrev_table::add_sttribute): Add implicit_const parameter.
> +       (Dwarf_ranges_table::read_ranges_table): Add version parameter.
> +       (Dwarf_ranges_table::read_range_list_v5): New method.
> +       (Dwarf_die): Remove unused attr_off field.
> +       (Dwarf_info_reader::Dwarf_info_reader): Initialize unit_type_
> field.
> +       (Dwarf_info_reader::is_type_unit): New method.
> +       (Dwarf_info_reader::read_3bytes_from_pointer): New method.
> +       (Dwarf_info_reader::read_range_list): Call read_range_list_v5 for
> +       DWARF 5 range lists.
> +       (Dwarf_info_reader::is_type_unit_): Remove.
> +       (Dwarf_info_reader::unit_type_): New field.
> +       (Sized_dwarf_line_info::~Sized_dwarf_line_info): Delete
> +       str_buffer_start_.
> +       (Sized_dwarf_line_info::read_header_tables): Rename to...
> +       (Sized_dwarf_line_info::read_header_tables_v2): ... this.
> +       (Sized_dwarf_line_info::read_header_tables_v5): New method.
> +       (Sized_dwarf_line_info::read_lines): Add endptr parameter.
> +       (Sized_dwarf_line_info::Dwarf_line_infoHeader): Add address_size
> field.
> +       (Sized_dwarf_line_info::str_buffer_): New field.
> +       (Sized_dwarf_line_info::str_buffer_end_): New field.
> +       (Sized_dwarf_line_info::str_buffer_start_): New field.
> +       (Sized_dwarf_line_info::end_of_header_length_): New field.
> +       (Sized_dwarf_line_info::end_of_unit_): New field.
> +
> +Upstream-Status: Backport [5cde809b7b9 Add DWARF 5 support in gold.]
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + elfcpp/dwarf.h       |  89 +++++--
> + gold/dwarf_reader.cc | 591 +++++++++++++++++++++++++++++++++++++------
> + gold/dwarf_reader.h  | 103 ++++++--
> + 3 files changed, 654 insertions(+), 129 deletions(-)
> +
> +diff --git a/elfcpp/dwarf.h b/elfcpp/dwarf.h
> +index e24347f8481..c9a9e02369c 100644
> +--- a/elfcpp/dwarf.h
> ++++ b/elfcpp/dwarf.h
> +@@ -152,35 +152,48 @@ enum DW_EH_PE
> +   DW_EH_PE_indirect = 0x80
> + };
> +
> ++// Line number table content type codes.
> ++
> ++enum DW_LNCT
> ++{
> ++  DW_LNCT_path            = 0x1,
> ++  DW_LNCT_directory_index = 0x2,
> ++  DW_LNCT_timestamp       = 0x3,
> ++  DW_LNCT_size            = 0x4,
> ++  DW_LNCT_MD5             = 0x5,
> ++  DW_LNCT_lo_user         = 0x2000,
> ++  DW_LNCT_hi_user         = 0x3fff
> ++};
> ++
> + // Line number opcodes.
> +
> + enum DW_LINE_OPS
> + {
> +-  DW_LNS_extended_op = 0,
> +-  DW_LNS_copy = 1,
> +-  DW_LNS_advance_pc = 2,
> +-  DW_LNS_advance_line = 3,
> +-  DW_LNS_set_file = 4,
> +-  DW_LNS_set_column = 5,
> +-  DW_LNS_negate_stmt = 6,
> +-  DW_LNS_set_basic_block = 7,
> +-  DW_LNS_const_add_pc = 8,
> +-  DW_LNS_fixed_advance_pc = 9,
> ++  DW_LNS_extended_op        = 0x00,
> ++  DW_LNS_copy               = 0x01,
> ++  DW_LNS_advance_pc         = 0x02,
> ++  DW_LNS_advance_line       = 0x03,
> ++  DW_LNS_set_file           = 0x04,
> ++  DW_LNS_set_column         = 0x05,
> ++  DW_LNS_negate_stmt        = 0x06,
> ++  DW_LNS_set_basic_block    = 0x07,
> ++  DW_LNS_const_add_pc       = 0x08,
> ++  DW_LNS_fixed_advance_pc   = 0x09,
> +   // DWARF 3.
> +-  DW_LNS_set_prologue_end = 10,
> +-  DW_LNS_set_epilogue_begin = 11,
> +-  DW_LNS_set_isa = 12
> ++  DW_LNS_set_prologue_end   = 0x0a,
> ++  DW_LNS_set_epilogue_begin = 0x0b,
> ++  DW_LNS_set_isa            = 0x0c
> + };
> +
> + // Line number extended opcodes.
> +
> + enum DW_LINE_EXTENDED_OPS
> + {
> +-  DW_LNE_end_sequence = 1,
> +-  DW_LNE_set_address = 2,
> +-  DW_LNE_define_file = 3,
> ++  DW_LNE_end_sequence                = 0x01,
> ++  DW_LNE_set_address                 = 0x02,
> ++  DW_LNE_define_file                 = 0x03,
> +   // DWARF4.
> +-  DW_LNE_set_discriminator = 4,
> ++  DW_LNE_set_discriminator           = 0x04,
> +   // HP extensions.
> +   DW_LNE_HP_negate_is_UV_update      = 0x11,
> +   DW_LNE_HP_push_context             = 0x12,
> +@@ -191,13 +204,15 @@ enum DW_LINE_EXTENDED_OPS
> +   DW_LNE_HP_negate_post_semantics    = 0x17,
> +   DW_LNE_HP_negate_function_exit     = 0x18,
> +   DW_LNE_HP_negate_front_end_logical = 0x19,
> +-  DW_LNE_HP_define_proc              = 0x20
> ++  DW_LNE_HP_define_proc              = 0x20,
> ++  DW_LNE_lo_user                     = 0x80,
> ++  DW_LNE_hi_user                     = 0xff
> + };
> +
> + enum DW_CHILDREN
> + {
> +-  DW_CHILDREN_no                   =0x00,
> +-  DW_CHILDREN_yes                  =0x01
> ++  DW_CHILDREN_no  = 0,
> ++  DW_CHILDREN_yes = 1
> + };
> +
> + // Source language names and codes.
> +@@ -247,20 +262,38 @@ enum DW_LANG
> +   DW_LANG_HP_Assembler = 0x8007
> + };
> +
> ++// Range list entry kinds in .debug_rnglists* section.
> ++
> ++enum DW_RLE
> ++{
> ++  DW_RLE_end_of_list   = 0x00,
> ++  DW_RLE_base_addressx = 0x01,
> ++  DW_RLE_startx_endx   = 0x02,
> ++  DW_RLE_startx_length = 0x03,
> ++  DW_RLE_offset_pair   = 0x04,
> ++  DW_RLE_base_address  = 0x05,
> ++  DW_RLE_start_end     = 0x06,
> ++  DW_RLE_start_length  = 0x07
> ++};
> ++
> + // DWARF section identifiers used in the package format.
> + // Extensions for Fission.  See http://gcc.gnu.org/wiki/DebugFissionDWP.
> ++// Added (with changes) in DWARF 5.
> +
> + enum DW_SECT
> + {
> +-  DW_SECT_INFO = 1,
> +-  DW_SECT_TYPES = 2,
> +-  DW_SECT_ABBREV = 3,
> +-  DW_SECT_LINE = 4,
> +-  DW_SECT_LOC = 5,
> ++  DW_SECT_INFO        = 1,
> ++  DW_SECT_ABBREV      = 3,
> ++  DW_SECT_LINE        = 4,
> ++  DW_SECT_LOCLISTS    = 5,
> +   DW_SECT_STR_OFFSETS = 6,
> +-  DW_SECT_MACINFO = 7,
> +-  DW_SECT_MACRO = 8,
> +-  DW_SECT_MAX = DW_SECT_MACRO,
> ++  DW_SECT_MACINFO     = 7,
> ++  DW_SECT_RNGLISTS    = 8,
> ++  DW_SECT_MAX = DW_SECT_RNGLISTS,
> ++  // These were used only for the experimental Fission support in DWARF
> 4.
> ++  DW_SECT_TYPES       = 2,
> ++  DW_SECT_LOC         = 5,
> ++  DW_SECT_MACRO       = 8
> + };
> +
> + } // End namespace elfcpp.
> +diff --git a/gold/dwarf_reader.cc b/gold/dwarf_reader.cc
> +index f0e6b89bde2..83a0114ed39 100644
> +--- a/gold/dwarf_reader.cc
> ++++ b/gold/dwarf_reader.cc
> +@@ -26,6 +26,7 @@
> + #include <utility>
> + #include <vector>
> +
> ++#include "debug.h"
> + #include "elfcpp_swap.h"
> + #include "dwarf.h"
> + #include "object.h"
> +@@ -275,6 +276,14 @@ Dwarf_abbrev_table::do_get_abbrev(unsigned int code)
> +         uint64_t form = read_unsigned_LEB_128(this->buffer_pos_, &len);
> +         this->buffer_pos_ += len;
> +
> ++        // For DW_FORM_implicit_const, read the constant.
> ++        int64_t implicit_const = 0;
> ++        if (form == elfcpp::DW_FORM_implicit_const)
> ++          {
> ++            implicit_const = read_signed_LEB_128(this->buffer_pos_,
> &len);
> ++            this->buffer_pos_ += len;
> ++          }
> ++
> +         // A (0,0) pair terminates the list.
> +         if (attr == 0 && form == 0)
> +           break;
> +@@ -282,7 +291,7 @@ Dwarf_abbrev_table::do_get_abbrev(unsigned int code)
> +         if (attr == elfcpp::DW_AT_sibling)
> +           entry->has_sibling_attribute = true;
> +
> +-        entry->add_attribute(attr, form);
> ++        entry->add_attribute(attr, form, implicit_const);
> +       }
> +
> +       this->store_abbrev(nextcode, entry);
> +@@ -302,8 +311,16 @@ Dwarf_ranges_table::read_ranges_table(
> +     Relobj* object,
> +     const unsigned char* symtab,
> +     off_t symtab_size,
> +-    unsigned int ranges_shndx)
> ++    unsigned int ranges_shndx,
> ++    unsigned int version)
> + {
> ++  const std::string section_name(version < 5
> ++                               ? ".debug_ranges"
> ++                               : ".debug_rnglists");
> ++  const std::string compressed_section_name(version < 5
> ++                                          ? ".zdebug_ranges"
> ++                                          : ".zdebug_rnglists");
> ++
> +   // If we've already read this abbrev table, return immediately.
> +   if (this->ranges_shndx_ > 0
> +       && this->ranges_shndx_ == ranges_shndx)
> +@@ -318,7 +335,7 @@ Dwarf_ranges_table::read_ranges_table(
> +       for (unsigned int i = 1; i < object->shnum(); ++i)
> +       {
> +         std::string name = object->section_name(i);
> +-        if (name == ".debug_ranges" || name == ".zdebug_ranges")
> ++        if (name == section_name || name == compressed_section_name)
> +           {
> +             ranges_shndx = i;
> +             this->output_section_offset_ =
> object->output_section_offset(i);
> +@@ -393,7 +410,7 @@ Dwarf_ranges_table::read_range_list(
> + {
> +   Dwarf_range_list* ranges;
> +
> +-  if (!this->read_ranges_table(object, symtab, symtab_size,
> ranges_shndx))
> ++  if (!this->read_ranges_table(object, symtab, symtab_size,
> ranges_shndx, 4))
> +     return NULL;
> +
> +   // Correct the offset.  For incremental update links, we have a
> +@@ -459,6 +476,125 @@ Dwarf_ranges_table::read_range_list(
> +   return ranges;
> + }
> +
> ++// Read a DWARF 5 range list from section RANGES_SHNDX at offset
> RANGES_OFFSET.
> ++
> ++Dwarf_range_list*
> ++Dwarf_ranges_table::read_range_list_v5(
> ++    Relobj* object,
> ++    const unsigned char* symtab,
> ++    off_t symtab_size,
> ++    unsigned int addr_size,
> ++    unsigned int ranges_shndx,
> ++    off_t offset)
> ++{
> ++  Dwarf_range_list* ranges;
> ++
> ++  if (!this->read_ranges_table(object, symtab, symtab_size,
> ranges_shndx, 5))
> ++    return NULL;
> ++
> ++  ranges = new Dwarf_range_list();
> ++  off_t base = 0;
> ++  unsigned int shndx0 = 0;
> ++
> ++  // Correct the offset.  For incremental update links, we have a
> ++  // relocated offset that is relative to the output section, but
> ++  // here we need an offset relative to the input section.
> ++  offset -= this->output_section_offset_;
> ++
> ++  // Read the range list at OFFSET.
> ++  const unsigned char* prle = this->ranges_buffer_ + offset;
> ++  while (prle < this->ranges_buffer_end_)
> ++    {
> ++      off_t start;
> ++      off_t end;
> ++      unsigned int shndx1 = 0;
> ++      unsigned int shndx2 = 0;
> ++      size_t len;
> ++
> ++      // Read the entry type.
> ++      unsigned int rle_type = *prle++;
> ++      offset += 1;
> ++
> ++      if (rle_type == elfcpp::DW_RLE_end_of_list)
> ++      break;
> ++
> ++      switch (rle_type)
> ++      {
> ++        case elfcpp::DW_RLE_base_address:
> ++          if (addr_size == 4)
> ++            base = this->dwinfo_->read_from_pointer<32>(prle);
> ++          else
> ++            base = this->dwinfo_->read_from_pointer<64>(prle);
> ++          if (this->ranges_reloc_mapper_ != NULL)
> ++              shndx0 = this->lookup_reloc(offset, &base);
> ++          prle += addr_size;
> ++          offset += addr_size;
> ++          break;
> ++
> ++        case elfcpp::DW_RLE_offset_pair:
> ++          start = read_unsigned_LEB_128(prle, &len);
> ++          prle += len;
> ++          offset += len;
> ++          end = read_unsigned_LEB_128(prle, &len);
> ++          prle += len;
> ++          offset += len;
> ++          if (shndx0 == 0 || object->is_section_included(shndx0))
> ++            ranges->add(shndx0, base + start, base + end);
> ++          break;
> ++
> ++        case elfcpp::DW_RLE_start_end:
> ++          if (addr_size == 4)
> ++            {
> ++              start = this->dwinfo_->read_from_pointer<32>(prle);
> ++              end = this->dwinfo_->read_from_pointer<32>(prle + 4);
> ++            }
> ++          else
> ++            {
> ++              start = this->dwinfo_->read_from_pointer<64>(prle);
> ++              end = this->dwinfo_->read_from_pointer<64>(prle + 8);
> ++            }
> ++          if (this->ranges_reloc_mapper_ != NULL)
> ++            {
> ++              shndx1 = this->lookup_reloc(offset, &start);
> ++              shndx2 = this->lookup_reloc(offset + addr_size, &end);
> ++              if (shndx1 != shndx2)
> ++                gold_warning(_("%s: DWARF info may be corrupt; offsets
> in a "
> ++                               "range list entry are in different
> sections"),
> ++                             object->name().c_str());
> ++            }
> ++          prle += addr_size * 2;
> ++          offset += addr_size * 2;
> ++          if (shndx1 == 0 || object->is_section_included(shndx1))
> ++            ranges->add(shndx1, start, end);
> ++          break;
> ++
> ++        case elfcpp::DW_RLE_start_length:
> ++          if (addr_size == 4)
> ++            start = this->dwinfo_->read_from_pointer<32>(prle);
> ++          else
> ++            start = this->dwinfo_->read_from_pointer<64>(prle);
> ++          if (this->ranges_reloc_mapper_ != NULL)
> ++            shndx1 = this->lookup_reloc(offset, &start);
> ++          prle += addr_size;
> ++          offset += addr_size;
> ++          end = start + read_unsigned_LEB_128(prle, &len);
> ++          prle += len;
> ++          offset += len;
> ++          if (shndx1 == 0 || object->is_section_included(shndx1))
> ++            ranges->add(shndx1, start, end);
> ++          break;
> ++
> ++        default:
> ++          gold_warning(_("%s: DWARF range list contains "
> ++                         "unsupported entry type (%d)"),
> ++                       object->name().c_str(), rle_type);
> ++          break;
> ++      }
> ++    }
> ++
> ++  return ranges;
> ++}
> ++
> + // Look for a relocation at offset OFF in the range table,
> + // and return the section index and offset of the target.
> +
> +@@ -709,7 +845,13 @@ Dwarf_die::read_attributes()
> +         case elfcpp::DW_FORM_flag_present:
> +           attr_value.val.intval = 1;
> +           break;
> ++        case elfcpp::DW_FORM_implicit_const:
> ++          attr_value.val.intval =
> ++              this->abbrev_code_->attributes[i].implicit_const;
> ++          break;
> +         case elfcpp::DW_FORM_strp:
> ++        case elfcpp::DW_FORM_strp_sup:
> ++        case elfcpp::DW_FORM_line_strp:
> +           {
> +             off_t str_off;
> +             if (this->dwinfo_->offset_size() == 4)
> +@@ -722,6 +864,26 @@ Dwarf_die::read_attributes()
> +             attr_value.val.refval = str_off;
> +             break;
> +           }
> ++        case elfcpp::DW_FORM_strx:
> ++        case elfcpp::DW_FORM_GNU_str_index:
> ++          attr_value.val.uintval = read_unsigned_LEB_128(pattr, &len);
> ++          pattr += len;
> ++          break;
> ++        case elfcpp::DW_FORM_strx1:
> ++          attr_value.val.uintval = *pattr++;
> ++          break;
> ++        case elfcpp::DW_FORM_strx2:
> ++          attr_value.val.uintval =
> ++              this->dwinfo_->read_from_pointer<16>(&pattr);
> ++          break;
> ++        case elfcpp::DW_FORM_strx3:
> ++          attr_value.val.uintval =
> ++              this->dwinfo_->read_3bytes_from_pointer(&pattr);
> ++          break;
> ++        case elfcpp::DW_FORM_strx4:
> ++          attr_value.val.uintval =
> ++              this->dwinfo_->read_from_pointer<32>(&pattr);
> ++          break;
> +         case elfcpp::DW_FORM_sec_offset:
> +           {
> +             off_t sec_off;
> +@@ -747,7 +909,6 @@ Dwarf_die::read_attributes()
> +                 this->dwinfo_->lookup_reloc(attr_off, &sec_off);
> +             attr_value.aux.shndx = shndx;
> +             attr_value.val.refval = sec_off;
> +-            ref_form = true;
> +             break;
> +           }
> +         case elfcpp::DW_FORM_ref_addr:
> +@@ -815,6 +976,7 @@ Dwarf_die::read_attributes()
> +             break;
> +           }
> +         case elfcpp::DW_FORM_ref4:
> ++        case elfcpp::DW_FORM_ref_sup4:
> +           {
> +             off_t sec_off;
> +             sec_off = this->dwinfo_->read_from_pointer<32>(&pattr);
> +@@ -835,11 +997,20 @@ Dwarf_die::read_attributes()
> +             attr_value.val.intval = sec_off;
> +             break;
> +           }
> ++        case elfcpp::DW_FORM_data16:
> ++          {
> ++            // For now, treat this as a 16-byte block.
> ++            attr_value.val.blockval = pattr;
> ++            attr_value.aux.blocklen = 16;
> ++            pattr += 16;
> ++            break;
> ++          }
> +         case elfcpp::DW_FORM_ref_sig8:
> +           attr_value.val.uintval =
> +               this->dwinfo_->read_from_pointer<64>(&pattr);
> +           break;
> +         case elfcpp::DW_FORM_ref8:
> ++        case elfcpp::DW_FORM_ref_sup8:
> +           {
> +             off_t sec_off;
> +             sec_off = this->dwinfo_->read_from_pointer<64>(&pattr);
> +@@ -856,11 +1027,29 @@ Dwarf_die::read_attributes()
> +           pattr += len;
> +           break;
> +         case elfcpp::DW_FORM_udata:
> ++          attr_value.val.uintval = read_unsigned_LEB_128(pattr, &len);
> ++          pattr += len;
> ++          break;
> ++        case elfcpp::DW_FORM_addrx:
> +         case elfcpp::DW_FORM_GNU_addr_index:
> +-        case elfcpp::DW_FORM_GNU_str_index:
> +           attr_value.val.uintval = read_unsigned_LEB_128(pattr, &len);
> +           pattr += len;
> +           break;
> ++        case elfcpp::DW_FORM_addrx1:
> ++          attr_value.val.uintval = *pattr++;
> ++          break;
> ++        case elfcpp::DW_FORM_addrx2:
> ++          attr_value.val.uintval =
> ++              this->dwinfo_->read_from_pointer<16>(&pattr);
> ++          break;
> ++        case elfcpp::DW_FORM_addrx3:
> ++          attr_value.val.uintval =
> ++              this->dwinfo_->read_3bytes_from_pointer(&pattr);
> ++          break;
> ++        case elfcpp::DW_FORM_addrx4:
> ++          attr_value.val.uintval =
> ++              this->dwinfo_->read_from_pointer<32>(&pattr);
> ++          break;
> +         case elfcpp::DW_FORM_sdata:
> +           attr_value.val.intval = read_signed_LEB_128(pattr, &len);
> +           pattr += len;
> +@@ -870,6 +1059,11 @@ Dwarf_die::read_attributes()
> +           len = strlen(attr_value.val.stringval);
> +           pattr += len + 1;
> +           break;
> ++        case elfcpp::DW_FORM_loclistx:
> ++        case elfcpp::DW_FORM_rnglistx:
> ++          attr_value.val.uintval = read_unsigned_LEB_128(pattr, &len);
> ++          pattr += len;
> ++          break;
> +         default:
> +           return false;
> +       }
> +@@ -954,9 +1148,12 @@ Dwarf_die::skip_attributes()
> +       switch(form)
> +       {
> +         case elfcpp::DW_FORM_flag_present:
> ++        case elfcpp::DW_FORM_implicit_const:
> +           break;
> +         case elfcpp::DW_FORM_strp:
> +         case elfcpp::DW_FORM_sec_offset:
> ++        case elfcpp::DW_FORM_strp_sup:
> ++        case elfcpp::DW_FORM_line_strp:
> +           pattr += this->dwinfo_->offset_size();
> +           break;
> +         case elfcpp::DW_FORM_addr:
> +@@ -993,23 +1190,42 @@ Dwarf_die::skip_attributes()
> +         case elfcpp::DW_FORM_data1:
> +         case elfcpp::DW_FORM_ref1:
> +         case elfcpp::DW_FORM_flag:
> ++        case elfcpp::DW_FORM_strx1:
> ++        case elfcpp::DW_FORM_addrx1:
> +           pattr += 1;
> +           break;
> +         case elfcpp::DW_FORM_data2:
> +         case elfcpp::DW_FORM_ref2:
> ++        case elfcpp::DW_FORM_strx2:
> ++        case elfcpp::DW_FORM_addrx2:
> +           pattr += 2;
> +           break;
> ++        case elfcpp::DW_FORM_strx3:
> ++        case elfcpp::DW_FORM_addrx3:
> ++          pattr += 3;
> ++          break;
> +         case elfcpp::DW_FORM_data4:
> +         case elfcpp::DW_FORM_ref4:
> ++        case elfcpp::DW_FORM_ref_sup4:
> ++        case elfcpp::DW_FORM_strx4:
> ++        case elfcpp::DW_FORM_addrx4:
> +           pattr += 4;
> +           break;
> +         case elfcpp::DW_FORM_data8:
> +         case elfcpp::DW_FORM_ref8:
> +         case elfcpp::DW_FORM_ref_sig8:
> ++        case elfcpp::DW_FORM_ref_sup8:
> +           pattr += 8;
> +           break;
> ++        case elfcpp::DW_FORM_data16:
> ++          pattr += 16;
> ++          break;
> +         case elfcpp::DW_FORM_ref_udata:
> +         case elfcpp::DW_FORM_udata:
> ++        case elfcpp::DW_FORM_addrx:
> ++        case elfcpp::DW_FORM_strx:
> ++        case elfcpp::DW_FORM_loclistx:
> ++        case elfcpp::DW_FORM_rnglistx:
> +         case elfcpp::DW_FORM_GNU_addr_index:
> +         case elfcpp::DW_FORM_GNU_str_index:
> +           read_unsigned_LEB_128(pattr, &len);
> +@@ -1313,6 +1529,13 @@ Dwarf_info_reader::do_parse()
> +         elfcpp::Swap_unaligned<16, big_endian>::readval(pinfo);
> +       pinfo += 2;
> +
> ++      // DWARF 5: Read the unit type (1 byte) and address size (1 byte).
> ++      if (this->cu_version_ >= 5)
> ++      {
> ++        this->unit_type_ = *pinfo++;
> ++        this->address_size_ = *pinfo++;
> ++      }
> ++
> +       // Read debug_abbrev_offset (4 or 8 bytes).
> +       if (this->offset_size_ == 4)
> +       abbrev_offset = elfcpp::Swap_unaligned<32,
> big_endian>::readval(pinfo);
> +@@ -1333,13 +1556,14 @@ Dwarf_info_reader::do_parse()
> +       }
> +       pinfo += this->offset_size_;
> +
> +-      // Read address_size (1 byte).
> +-      this->address_size_ = *pinfo++;
> ++      // DWARF 2-4: Read address_size (1 byte).
> ++      if (this->cu_version_ < 5)
> ++      this->address_size_ = *pinfo++;
> +
> +       // For type units, read the two extra fields.
> +       uint64_t signature = 0;
> +       off_t type_offset = 0;
> +-      if (this->is_type_unit_)
> ++      if (this->is_type_unit())
> +         {
> +         if (!this->check_buffer(pinfo + 8 + this->offset_size_))
> +           break;
> +@@ -1369,7 +1593,7 @@ Dwarf_info_reader::do_parse()
> +       if (root_die.tag() != 0)
> +       {
> +         // Visit the CU or TU.
> +-        if (this->is_type_unit_)
> ++        if (this->is_type_unit())
> +           this->visit_type_unit(section_offset + this->cu_offset_,
> +                                 cu_end - cu_start, type_offset,
> signature,
> +                                 &root_die);
> +@@ -1460,6 +1684,19 @@ Dwarf_info_reader::read_from_pointer(const
> unsigned char** source)
> +   return return_value;
> + }
> +
> ++// Read a 3-byte integer.  Update SOURCE after read.
> ++inline typename elfcpp::Valtype_base<32>::Valtype
> ++Dwarf_info_reader::read_3bytes_from_pointer(const unsigned char** source)
> ++{
> ++  typename elfcpp::Valtype_base<32>::Valtype return_value;
> ++  if (this->object_->is_big_endian())
> ++    return_value = ((*source)[0] << 16) | ((*source)[1] << 8) |
> (*source)[2];
> ++  else
> ++    return_value = ((*source)[2] << 16) | ((*source)[1] << 8) |
> (*source)[0];
> ++  *source += 3;
> ++  return return_value;
> ++}
> ++
> + // Look for a relocation at offset ATTR_OFF in the dwarf info,
> + // and return the section index and offset of the target.
> +
> +@@ -1561,27 +1798,40 @@ Sized_dwarf_line_info<size,
> big_endian>::Sized_dwarf_line_info(
> +     Object* object,
> +     unsigned int read_shndx)
> +   : data_valid_(false), buffer_(NULL), buffer_start_(NULL),
> ++    str_buffer_(NULL), str_buffer_start_(NULL),
> +     reloc_mapper_(NULL), symtab_buffer_(NULL), directories_(), files_(),
> +-    current_header_index_(-1)
> ++    current_header_index_(-1), reloc_map_(), line_number_map_()
> + {
> +-  unsigned int debug_shndx;
> ++  unsigned int debug_line_shndx = 0;
> ++  unsigned int debug_line_str_shndx = 0;
> +
> +-  for (debug_shndx = 1; debug_shndx < object->shnum(); ++debug_shndx)
> ++  for (unsigned int i = 1; i < object->shnum(); ++i)
> +     {
> ++      section_size_type buffer_size;
> ++      bool is_new = false;
> ++
> +       // FIXME: do this more efficiently: section_name() isn't super-fast
> +-      std::string name = object->section_name(debug_shndx);
> ++      std::string name = object->section_name(i);
> +       if (name == ".debug_line" || name == ".zdebug_line")
> +       {
> +-        section_size_type buffer_size;
> +-        bool is_new = false;
> +-        this->buffer_ =
> object->decompressed_section_contents(debug_shndx,
> +-
> &buffer_size,
> +-                                                              &is_new);
> ++        this->buffer_ =
> ++            object->decompressed_section_contents(i, &buffer_size,
> &is_new);
> +         if (is_new)
> +           this->buffer_start_ = this->buffer_;
> +         this->buffer_end_ = this->buffer_ + buffer_size;
> +-        break;
> ++        debug_line_shndx = i;
> ++      }
> ++      else if (name == ".debug_line_str" || name == ".zdebug_line_str")
> ++      {
> ++        this->str_buffer_ =
> ++            object->decompressed_section_contents(i, &buffer_size,
> &is_new);
> ++        if (is_new)
> ++          this->str_buffer_start_ = this->str_buffer_;
> ++        this->str_buffer_end_ = this->str_buffer_ + buffer_size;
> ++        debug_line_str_shndx = i;
> +       }
> ++      if (debug_line_shndx > 0 && debug_line_str_shndx > 0)
> ++        break;
> +     }
> +   if (this->buffer_ == NULL)
> +     return;
> +@@ -1594,7 +1844,7 @@ Sized_dwarf_line_info<size,
> big_endian>::Sized_dwarf_line_info(
> +       unsigned int reloc_sh_type = object->section_type(i);
> +       if ((reloc_sh_type == elfcpp::SHT_REL
> +          || reloc_sh_type == elfcpp::SHT_RELA)
> +-        && object->section_info(i) == debug_shndx)
> ++        && object->section_info(i) == debug_line_shndx)
> +       {
> +         reloc_shndx = i;
> +         this->track_relocs_type_ = reloc_sh_type;
> +@@ -1640,65 +1890,80 @@ Sized_dwarf_line_info<size,
> big_endian>::read_header_prolog(
> +   uint32_t initial_length = elfcpp::Swap_unaligned<32,
> big_endian>::readval(lineptr);
> +   lineptr += 4;
> +
> +-  // In DWARF2/3, if the initial length is all 1 bits, then the offset
> ++  // In DWARF, if the initial length is all 1 bits, then the offset
> +   // size is 8 and we need to read the next 8 bytes for the real length.
> +   if (initial_length == 0xffffffff)
> +     {
> +-      header_.offset_size = 8;
> ++      this->header_.offset_size = 8;
> +       initial_length = elfcpp::Swap_unaligned<64,
> big_endian>::readval(lineptr);
> +       lineptr += 8;
> +     }
> +   else
> +-    header_.offset_size = 4;
> ++    this->header_.offset_size = 4;
> +
> +-  header_.total_length = initial_length;
> ++  this->header_.total_length = initial_length;
> +
> +-  gold_assert(lineptr + header_.total_length <= buffer_end_);
> ++  this->end_of_unit_ = lineptr + initial_length;
> ++  gold_assert(this->end_of_unit_ <= buffer_end_);
> +
> +-  header_.version = elfcpp::Swap_unaligned<16,
> big_endian>::readval(lineptr);
> ++  this->header_.version =
> ++      elfcpp::Swap_unaligned<16, big_endian>::readval(lineptr);
> +   lineptr += 2;
> +
> +-  // Skip address size and segment selector for DWARF5.
> +-  if (header_.version >= 5)
> +-    lineptr += 2;
> ++  // We can only read versions 2-5 of the DWARF line number table.
> ++  // For other versions, just skip the entire line number table.
> ++  if (this->header_.version < 2 || this->header_.version > 5)
> ++    return this->end_of_unit_;
> +
> +-  if (header_.offset_size == 4)
> +-    header_.prologue_length = elfcpp::Swap_unaligned<32,
> big_endian>::readval(lineptr);
> ++  // DWARF 5 only: address size and segment selector.
> ++  if (this->header_.version >= 5)
> ++    {
> ++      this->header_.address_size = *lineptr;
> ++      // We ignore the segment selector.
> ++      lineptr += 2;
> ++    }
> ++
> ++  if (this->header_.offset_size == 4)
> ++    this->header_.prologue_length =
> ++      elfcpp::Swap_unaligned<32, big_endian>::readval(lineptr);
> +   else
> +-    header_.prologue_length = elfcpp::Swap_unaligned<64,
> big_endian>::readval(lineptr);
> +-  lineptr += header_.offset_size;
> ++    this->header_.prologue_length =
> ++      elfcpp::Swap_unaligned<64, big_endian>::readval(lineptr);
> ++  lineptr += this->header_.offset_size;
> +
> +-  header_.min_insn_length = *lineptr;
> ++  this->end_of_header_length_ = lineptr;
> ++
> ++  this->header_.min_insn_length = *lineptr;
> +   lineptr += 1;
> +
> +-  if (header_.version < 4)
> +-    header_.max_ops_per_insn = 1;
> ++  if (this->header_.version < 4)
> ++    this->header_.max_ops_per_insn = 1;
> +   else
> +     {
> +       // DWARF 4 added the maximum_operations_per_instruction field.
> +-      header_.max_ops_per_insn = *lineptr;
> ++      this->header_.max_ops_per_insn = *lineptr;
> +       lineptr += 1;
> +       // TODO: Add support for values other than 1.
> +-      gold_assert(header_.max_ops_per_insn == 1);
> ++      gold_assert(this->header_.max_ops_per_insn == 1);
> +     }
> +
> +-  header_.default_is_stmt = *lineptr;
> ++  this->header_.default_is_stmt = *lineptr;
> +   lineptr += 1;
> +
> +-  header_.line_base = *reinterpret_cast<const signed char*>(lineptr);
> ++  this->header_.line_base = *reinterpret_cast<const signed
> char*>(lineptr);
> +   lineptr += 1;
> +
> +-  header_.line_range = *lineptr;
> ++  this->header_.line_range = *lineptr;
> +   lineptr += 1;
> +
> +-  header_.opcode_base = *lineptr;
> ++  this->header_.opcode_base = *lineptr;
> +   lineptr += 1;
> +
> +-  header_.std_opcode_lengths.resize(header_.opcode_base + 1);
> +-  header_.std_opcode_lengths[0] = 0;
> +-  for (int i = 1; i < header_.opcode_base; i++)
> ++  this->header_.std_opcode_lengths.resize(this->header_.opcode_base + 1);
> ++  this->header_.std_opcode_lengths[0] = 0;
> ++  for (int i = 1; i < this->header_.opcode_base; i++)
> +     {
> +-      header_.std_opcode_lengths[i] = *lineptr;
> ++      this->header_.std_opcode_lengths[i] = *lineptr;
> +       lineptr += 1;
> +     }
> +
> +@@ -1707,10 +1972,11 @@ Sized_dwarf_line_info<size,
> big_endian>::read_header_prolog(
> +
> + // The header for a debug_line section is mildly complicated, because
> + // the line info is very tightly encoded.
> ++// This routine is for DWARF versions 2, 3, and 4.
> +
> + template<int size, bool big_endian>
> + const unsigned char*
> +-Sized_dwarf_line_info<size, big_endian>::read_header_tables(
> ++Sized_dwarf_line_info<size, big_endian>::read_header_tables_v2(
> +     const unsigned char* lineptr)
> + {
> +   ++this->current_header_index_;
> +@@ -1775,6 +2041,169 @@ Sized_dwarf_line_info<size,
> big_endian>::read_header_tables(
> +   return lineptr;
> + }
> +
> ++// This routine is for DWARF version 5.
> ++
> ++template<int size, bool big_endian>
> ++const unsigned char*
> ++Sized_dwarf_line_info<size, big_endian>::read_header_tables_v5(
> ++    const unsigned char* lineptr)
> ++{
> ++  size_t len;
> ++
> ++  ++this->current_header_index_;
> ++
> ++  gold_assert(static_cast<int>(this->directories_.size())
> ++            == this->current_header_index_);
> ++  gold_assert(static_cast<int>(this->files_.size())
> ++            == this->current_header_index_);
> ++
> ++  // Read the directory list.
> ++  unsigned int format_count = *lineptr;
> ++  lineptr += 1;
> ++
> ++  unsigned int *types = new unsigned int[format_count];
> ++  unsigned int *forms = new unsigned int[format_count];
> ++
> ++  for (unsigned int i = 0; i < format_count; i++)
> ++    {
> ++      types[i] = read_unsigned_LEB_128(lineptr, &len);
> ++      lineptr += len;
> ++      forms[i] = read_unsigned_LEB_128(lineptr, &len);
> ++      lineptr += len;
> ++    }
> ++
> ++  uint64_t entry_count = read_unsigned_LEB_128(lineptr, &len);
> ++  lineptr += len;
> ++  this->directories_.push_back(std::vector<std::string>(0));
> ++  std::vector<std::string>& dir_list = this->directories_.back();
> ++
> ++  for (unsigned int j = 0; j < entry_count; j++)
> ++    {
> ++      std::string dirname;
> ++
> ++      for (unsigned int i = 0; i < format_count; i++)
> ++       {
> ++       if (types[i] == elfcpp::DW_LNCT_path)
> ++         {
> ++           if (forms[i] == elfcpp::DW_FORM_string)
> ++             {
> ++               dirname = reinterpret_cast<const char*>(lineptr);
> ++               lineptr += dirname.size() + 1;
> ++             }
> ++           else if (forms[i] == elfcpp::DW_FORM_line_strp)
> ++             {
> ++               uint64_t offset;
> ++               if (this->header_.offset_size == 4)
> ++                 offset =
> ++                     elfcpp::Swap_unaligned<32,
> big_endian>::readval(lineptr);
> ++               else
> ++                 offset =
> ++                     elfcpp::Swap_unaligned<64,
> big_endian>::readval(lineptr);
> ++               typename Reloc_map::const_iterator it
> ++                   = this->reloc_map_.find(lineptr - this->buffer_);
> ++               if (it != reloc_map_.end())
> ++                 {
> ++                   if (this->track_relocs_type_ == elfcpp::SHT_RELA)
> ++                     offset = 0;
> ++                   offset += it->second.second;
> ++                 }
> ++               lineptr += this->header_.offset_size;
> ++               dirname = reinterpret_cast<const char*>(this->str_buffer_
> ++                                                       + offset);
> ++             }
> ++           else
> ++             return lineptr;
> ++         }
> ++       else
> ++         return lineptr;
> ++       }
> ++      dir_list.push_back(dirname);
> ++    }
> ++
> ++  delete[] types;
> ++  delete[] forms;
> ++
> ++  // Read the filenames list.
> ++  format_count = *lineptr;
> ++  lineptr += 1;
> ++
> ++  types = new unsigned int[format_count];
> ++  forms = new unsigned int[format_count];
> ++
> ++  for (unsigned int i = 0; i < format_count; i++)
> ++    {
> ++      types[i] = read_unsigned_LEB_128(lineptr, &len);
> ++      lineptr += len;
> ++      forms[i] = read_unsigned_LEB_128(lineptr, &len);
> ++      lineptr += len;
> ++    }
> ++
> ++  entry_count = read_unsigned_LEB_128(lineptr, &len);
> ++  lineptr += len;
> ++  this->files_.push_back(
> ++      std::vector<std::pair<int, std::string> >(0));
> ++  std::vector<std::pair<int, std::string> >& file_list =
> this->files_.back();
> ++
> ++  for (unsigned int j = 0; j < entry_count; j++)
> ++    {
> ++      const char* path = NULL;
> ++      int dirindex = 0;
> ++
> ++      for (unsigned int i = 0; i < format_count; i++)
> ++       {
> ++       if (types[i] == elfcpp::DW_LNCT_path)
> ++         {
> ++           if (forms[i] == elfcpp::DW_FORM_string)
> ++             {
> ++               path = reinterpret_cast<const char*>(lineptr);
> ++               lineptr += strlen(path) + 1;
> ++             }
> ++           else if (forms[i] == elfcpp::DW_FORM_line_strp)
> ++             {
> ++               uint64_t offset;
> ++               if (this->header_.offset_size == 4)
> ++                 offset = elfcpp::Swap_unaligned<32,
> big_endian>::readval(lineptr);
> ++               else
> ++                 offset = elfcpp::Swap_unaligned<64,
> big_endian>::readval(lineptr);
> ++               typename Reloc_map::const_iterator it
> ++                   = this->reloc_map_.find(lineptr - this->buffer_);
> ++               if (it != reloc_map_.end())
> ++                 {
> ++                   if (this->track_relocs_type_ == elfcpp::SHT_RELA)
> ++                     offset = 0;
> ++                   offset += it->second.second;
> ++                 }
> ++               lineptr += this->header_.offset_size;
> ++               path = reinterpret_cast<const char*>(this->str_buffer_
> ++                                                    + offset);
> ++             }
> ++           else
> ++             return lineptr;
> ++         }
> ++       else if (types[i] == elfcpp::DW_LNCT_directory_index)
> ++         {
> ++           if (forms[i] == elfcpp::DW_FORM_udata)
> ++             {
> ++               dirindex = read_unsigned_LEB_128(lineptr, &len);
> ++               lineptr += len;
> ++             }
> ++           else
> ++             return lineptr;
> ++         }
> ++       else
> ++         return lineptr;
> ++       }
> ++      gold_debug(DEBUG_LOCATION, "File %3d: %s",
> ++               static_cast<int>(file_list.size()), path);
> ++      file_list.push_back(std::make_pair(dirindex, path));
> ++    }
> ++
> ++  delete[] types;
> ++  delete[] forms;
> ++
> ++  return lineptr;
> ++}
> ++
> + // Process a single opcode in the .debug.line structure.
> +
> + template<int size, bool big_endian>
> +@@ -1790,15 +2219,15 @@ Sized_dwarf_line_info<size,
> big_endian>::process_one_opcode(
> +
> +   // If the opcode is great than the opcode_base, it is a special
> +   // opcode. Most line programs consist mainly of special opcodes.
> +-  if (opcode >= header_.opcode_base)
> ++  if (opcode >= this->header_.opcode_base)
> +     {
> +-      opcode -= header_.opcode_base;
> +-      const int advance_address = ((opcode / header_.line_range)
> +-                                   * header_.min_insn_length);
> ++      opcode -= this->header_.opcode_base;
> ++      const int advance_address = ((opcode / this->header_.line_range)
> ++                                   * this->header_.min_insn_length);
> +       lsm->address += advance_address;
> +
> +-      const int advance_line = ((opcode % header_.line_range)
> +-                                + header_.line_base);
> ++      const int advance_line = ((opcode % this->header_.line_range)
> ++                                + this->header_.line_base);
> +       lsm->line_num += advance_line;
> +       lsm->basic_block = true;
> +       *len = oplen;
> +@@ -1818,13 +2247,13 @@ Sized_dwarf_line_info<size,
> big_endian>::process_one_opcode(
> +         const uint64_t advance_address
> +             = read_unsigned_LEB_128(start, &templen);
> +         oplen += templen;
> +-        lsm->address += header_.min_insn_length * advance_address;
> ++        lsm->address += this->header_.min_insn_length * advance_address;
> +       }
> +       break;
> +
> +     case elfcpp::DW_LNS_advance_line:
> +       {
> +-        const uint64_t advance_line = read_signed_LEB_128(start,
> &templen);
> ++        const int64_t advance_line = read_signed_LEB_128(start,
> &templen);
> +         oplen += templen;
> +         lsm->line_num += advance_line;
> +       }
> +@@ -1865,9 +2294,9 @@ Sized_dwarf_line_info<size,
> big_endian>::process_one_opcode(
> +
> +     case elfcpp::DW_LNS_const_add_pc:
> +       {
> +-        const int advance_address = (header_.min_insn_length
> +-                                     * ((255 - header_.opcode_base)
> +-                                        / header_.line_range));
> ++        const int advance_address = (this->header_.min_insn_length
> ++                                     * ((255 - this->header_.opcode_base)
> ++                                        / this->header_.line_range));
> +         lsm->address += advance_address;
> +       }
> +       break;
> +@@ -1950,7 +2379,7 @@ Sized_dwarf_line_info<size,
> big_endian>::process_one_opcode(
> +     default:
> +       {
> +         // Ignore unknown opcode  silently
> +-        for (int i = 0; i < header_.std_opcode_lengths[opcode]; i++)
> ++        for (int i = 0; i < this->header_.std_opcode_lengths[opcode];
> i++)
> +           {
> +             size_t templen;
> +             read_unsigned_LEB_128(start, &templen);
> +@@ -1970,28 +2399,24 @@ Sized_dwarf_line_info<size,
> big_endian>::process_one_opcode(
> + template<int size, bool big_endian>
> + unsigned const char*
> + Sized_dwarf_line_info<size, big_endian>::read_lines(unsigned const char*
> lineptr,
> ++                                                    unsigned const char*
> endptr,
> +                                                     unsigned int shndx)
> + {
> +   struct LineStateMachine lsm;
> +
> +-  // LENGTHSTART is the place the length field is based on.  It is the
> +-  // point in the header after the initial length field.
> +-  const unsigned char* lengthstart = buffer_;
> +-
> +-  // In 64 bit dwarf, the initial length is 12 bytes, because of the
> +-  // 0xffffffff at the start.
> +-  if (header_.offset_size == 8)
> +-    lengthstart += 12;
> +-  else
> +-    lengthstart += 4;
> +-
> +-  while (lineptr < lengthstart + header_.total_length)
> ++  while (lineptr < endptr)
> +     {
> +-      ResetLineStateMachine(&lsm, header_.default_is_stmt);
> ++      ResetLineStateMachine(&lsm, this->header_.default_is_stmt);
> +       while (!lsm.end_sequence)
> +         {
> +           size_t oplength;
> ++
> ++        if (lineptr >= endptr)
> ++          break;
> ++
> +           bool add_line = this->process_one_opcode(lineptr, &lsm,
> &oplength);
> ++          lineptr += oplength;
> ++
> +           if (add_line
> +               && (shndx == -1U || lsm.shndx == -1U || shndx ==
> lsm.shndx))
> +             {
> +@@ -2012,11 +2437,10 @@ Sized_dwarf_line_info<size,
> big_endian>::read_lines(unsigned const char* lineptr
> +               map.back().last_line_for_offset = false;
> +             map.push_back(entry);
> +             }
> +-          lineptr += oplength;
> +         }
> +     }
> +
> +-  return lengthstart + header_.total_length;
> ++  return endptr;
> + }
> +
> + // Read the relocations into a Reloc_map.
> +@@ -2057,9 +2481,17 @@ Sized_dwarf_line_info<size,
> big_endian>::read_line_mappings(unsigned int shndx)
> +     {
> +       const unsigned char* lineptr = this->buffer_;
> +       lineptr = this->read_header_prolog(lineptr);
> +-      lineptr = this->read_header_tables(lineptr);
> +-      lineptr = this->read_lines(lineptr, shndx);
> +-      this->buffer_ = lineptr;
> ++      if (this->header_.version >= 2 && this->header_.version <= 4)
> ++      {
> ++        lineptr = this->read_header_tables_v2(lineptr);
> ++        lineptr = this->read_lines(lineptr, this->end_of_unit_, shndx);
> ++      }
> ++      else if (this->header_.version == 5)
> ++      {
> ++        lineptr = this->read_header_tables_v5(lineptr);
> ++        lineptr = this->read_lines(lineptr, this->end_of_unit_, shndx);
> ++      }
> ++      this->buffer_ = this->end_of_unit_;
> +     }
> +
> +   // Sort the lines numbers, so addr2line can use binary search.
> +@@ -2215,6 +2647,9 @@ Sized_dwarf_line_info<size,
> big_endian>::do_addr2line(
> +     off_t offset,
> +     std::vector<std::string>* other_lines)
> + {
> ++  gold_debug(DEBUG_LOCATION, "do_addr2line: shndx %u offset %08x",
> ++           shndx, static_cast<int>(offset));
> ++
> +   if (this->data_valid_ == false)
> +     return "";
> +
> +diff --git a/gold/dwarf_reader.h b/gold/dwarf_reader.h
> +index 80b2231327c..921a1f7c876 100644
> +--- a/gold/dwarf_reader.h
> ++++ b/gold/dwarf_reader.h
> +@@ -173,11 +173,12 @@ class Dwarf_abbrev_table
> +   // An attribute list entry.
> +   struct Attribute
> +   {
> +-    Attribute(unsigned int a, unsigned int f)
> +-      : attr(a), form(f)
> ++    Attribute(unsigned int a, unsigned int f, int c)
> ++      : attr(a), form(f), implicit_const(c)
> +     { }
> +     unsigned int attr;
> +     unsigned int form;
> ++    int implicit_const;
> +   };
> +
> +   // An abbrev code entry.
> +@@ -190,9 +191,9 @@ class Dwarf_abbrev_table
> +     }
> +
> +     void
> +-    add_attribute(unsigned int attr, unsigned int form)
> ++    add_attribute(unsigned int attr, unsigned int form, int
> implicit_const)
> +     {
> +-      this->attributes.push_back(Attribute(attr, form));
> ++      this->attributes.push_back(Attribute(attr, form, implicit_const));
> +     }
> +
> +     // The DWARF tag.
> +@@ -349,14 +350,15 @@ class Dwarf_ranges_table
> +       delete this->ranges_reloc_mapper_;
> +   }
> +
> +-  // Read the ranges table from an object file.
> ++  // Fetch the contents of the ranges table from an object file.
> +   bool
> +   read_ranges_table(Relobj* object,
> +                   const unsigned char* symtab,
> +                   off_t symtab_size,
> +-                  unsigned int ranges_shndx);
> ++                  unsigned int ranges_shndx,
> ++                  unsigned int version);
> +
> +-  // Read the range table from an object file.
> ++  // Read the DWARF 2/3/4 range table.
> +   Dwarf_range_list*
> +   read_range_list(Relobj* object,
> +                 const unsigned char* symtab,
> +@@ -365,6 +367,15 @@ class Dwarf_ranges_table
> +                 unsigned int ranges_shndx,
> +                 off_t ranges_offset);
> +
> ++  // Read the DWARF 5 rnglists table.
> ++  Dwarf_range_list*
> ++  read_range_list_v5(Relobj* object,
> ++                   const unsigned char* symtab,
> ++                   off_t symtab_size,
> ++                   unsigned int address_size,
> ++                   unsigned int ranges_shndx,
> ++                   off_t ranges_offset);
> ++
> +   // Look for a relocation at offset OFF in the range table,
> +   // and return the section index and offset of the target.
> +   unsigned int
> +@@ -490,8 +501,6 @@ class Dwarf_die
> +       unsigned int shndx;
> +       // Block length for block forms.
> +       unsigned int blocklen;
> +-      // Attribute offset for DW_FORM_strp.
> +-      unsigned int attr_off;
> +     } aux;
> +   };
> +
> +@@ -684,6 +693,10 @@ class Dwarf_die
> + // calls the various visit_xxx() methods for each header.  Clients
> + // should derive a new class from this one and implement the
> + // visit_compilation_unit() and visit_type_unit() functions.
> ++// IS_TYPE_UNIT is true if we are reading from a .debug_types section,
> ++// which is used only in DWARF 4. For DWARF 5, it will be false,
> ++// and we will determine whether it's a type init when we parse the
> ++// header.
> +
> + class Dwarf_info_reader
> + {
> +@@ -695,7 +708,7 @@ class Dwarf_info_reader
> +                   unsigned int shndx,
> +                   unsigned int reloc_shndx,
> +                   unsigned int reloc_type)
> +-    : is_type_unit_(is_type_unit), object_(object), symtab_(symtab),
> ++    : object_(object), symtab_(symtab),
> +       symtab_size_(symtab_size), shndx_(shndx),
> reloc_shndx_(reloc_shndx),
> +       reloc_type_(reloc_type), abbrev_shndx_(0), string_shndx_(0),
> +       buffer_(NULL), buffer_end_(NULL), cu_offset_(0), cu_length_(0),
> +@@ -703,7 +716,12 @@ class Dwarf_info_reader
> +       abbrev_table_(), ranges_table_(this),
> +       reloc_mapper_(NULL), string_buffer_(NULL),
> string_buffer_end_(NULL),
> +       owns_string_buffer_(false), string_output_section_offset_(0)
> +-  { }
> ++  {
> ++    // For DWARF 4, we infer the unit type from the section name.
> ++    // For DWARF 5, we will read this from the unit header.
> ++    this->unit_type_ =
> ++      (is_type_unit ? elfcpp::DW_UT_type : elfcpp::DW_UT_compile);
> ++  }
> +
> +   virtual
> +   ~Dwarf_info_reader()
> +@@ -714,6 +732,13 @@ class Dwarf_info_reader
> +       delete[] this->string_buffer_;
> +   }
> +
> ++  bool
> ++  is_type_unit() const
> ++  {
> ++    return (this->unit_type_ == elfcpp::DW_UT_type
> ++          || this->unit_type_ == elfcpp::DW_UT_split_type);
> ++  }
> ++
> +   // Begin parsing the debug info.  This calls visit_compilation_unit()
> +   // or visit_type_unit() for each compilation or type unit found in the
> +   // section, and visit_die() for each top-level DIE.
> +@@ -745,6 +770,9 @@ class Dwarf_info_reader
> +   inline typename elfcpp::Valtype_base<valsize>::Valtype
> +   read_from_pointer(const unsigned char** source);
> +
> ++  inline typename elfcpp::Valtype_base<32>::Valtype
> ++  read_3bytes_from_pointer(const unsigned char** source);
> ++
> +   // Look for a relocation at offset ATTR_OFF in the dwarf info,
> +   // and return the section index and offset of the target.
> +   unsigned int
> +@@ -818,12 +846,20 @@ class Dwarf_info_reader
> +   Dwarf_range_list*
> +   read_range_list(unsigned int ranges_shndx, off_t ranges_offset)
> +   {
> +-    return this->ranges_table_.read_range_list(this->object_,
> +-                                             this->symtab_,
> +-                                             this->symtab_size_,
> +-                                             this->address_size_,
> +-                                             ranges_shndx,
> +-                                             ranges_offset);
> ++    if (this->cu_version_ < 5)
> ++      return this->ranges_table_.read_range_list(this->object_,
> ++                                               this->symtab_,
> ++                                               this->symtab_size_,
> ++                                               this->address_size_,
> ++                                               ranges_shndx,
> ++                                               ranges_offset);
> ++    else
> ++      return this->ranges_table_.read_range_list_v5(this->object_,
> ++                                                  this->symtab_,
> ++                                                  this->symtab_size_,
> ++                                                  this->address_size_,
> ++                                                  ranges_shndx,
> ++                                                  ranges_offset);
> +   }
> +
> +   // Return the object.
> +@@ -873,8 +909,8 @@ class Dwarf_info_reader
> +   bool
> +   do_read_string_table(unsigned int string_shndx);
> +
> +-  // True if this is a type unit; false for a compilation unit.
> +-  bool is_type_unit_;
> ++  // The unit type (DW_UT_xxx).
> ++  unsigned int unit_type_;
> +   // The object containing the .debug_info or .debug_types input section.
> +   Relobj* object_;
> +   // The ELF symbol table.
> +@@ -1008,6 +1044,8 @@ class Sized_dwarf_line_info : public Dwarf_line_info
> +   {
> +     if (this->buffer_start_ != NULL)
> +       delete[] this->buffer_start_;
> ++    if (this->str_buffer_start_ != NULL)
> ++      delete[] this->str_buffer_start_;
> +   }
> +
> +  private:
> +@@ -1030,19 +1068,23 @@ class Sized_dwarf_line_info : public
> Dwarf_line_info
> +   void
> +   read_relocs();
> +
> +-  // Reads the DWARF2/3 header for this line info.  Each takes as input
> ++  // Reads the DWARF header for this line info.  Each takes as input
> +   // a starting buffer position, and returns the ending position.
> +   const unsigned char*
> +   read_header_prolog(const unsigned char* lineptr);
> +
> +   const unsigned char*
> +-  read_header_tables(const unsigned char* lineptr);
> ++  read_header_tables_v2(const unsigned char* lineptr);
> ++
> ++  const unsigned char*
> ++  read_header_tables_v5(const unsigned char* lineptr);
> +
> +-  // Reads the DWARF2/3 line information.  If shndx is non-negative,
> ++  // Reads the DWARF line information.  If shndx is non-negative,
> +   // discard all line information that doesn't pertain to the given
> +   // section.
> +   const unsigned char*
> +-  read_lines(const unsigned char* lineptr, unsigned int shndx);
> ++  read_lines(const unsigned char* lineptr, const unsigned char* endptr,
> ++           unsigned int shndx);
> +
> +   // Process a single line info opcode at START using the state
> +   // machine at LSM.  Return true if we should define a line using the
> +@@ -1069,6 +1111,7 @@ class Sized_dwarf_line_info : public Dwarf_line_info
> +   {
> +     off_t total_length;
> +     int version;
> ++    int address_size;
> +     off_t prologue_length;
> +     int min_insn_length; // insn stands for instruction
> +     int max_ops_per_insn; // Added in DWARF-4.
> +@@ -1089,6 +1132,20 @@ class Sized_dwarf_line_info : public
> Dwarf_line_info
> +   // of the buffer.
> +   const unsigned char* buffer_start_;
> +
> ++  // str_buffer is the buffer for the line table strings.
> ++  const unsigned char* str_buffer_;
> ++  const unsigned char* str_buffer_end_;
> ++  // If the buffer was allocated temporarily, and therefore must be
> ++  // deallocated in the dtor, this contains a pointer to the start
> ++  // of the buffer.
> ++  const unsigned char* str_buffer_start_;
> ++
> ++  // Pointer to the end of the header_length field (aka prologue_length).
> ++  const unsigned char* end_of_header_length_;
> ++
> ++  // Pointer to the end of the current compilation unit.
> ++  const unsigned char* end_of_unit_;
> ++
> +   // This has relocations that point into buffer.
> +   Sized_elf_reloc_mapper<size, big_endian>* reloc_mapper_;
> +   // The type of the reloc section in track_relocs_--SHT_REL or SHT_RELA.
> --
> 2.30.2
>
>
> 
>
>

--0000000000009e6abd05c221e590
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patch backports dwarf-5 support to gold linker (p=
resumably from an upcoming version of binutils?), which does not quite matc=
h the title or description?</div><div><br></div><div>Alex<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
12 May 2021 at 14:42, Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail=
.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">* DWARF-5 is now used by default with gcc-11, c=
ausing<br>
=C2=A0 11.1.0/ld: internal error in format_file_lineno, at ../../gold/dwar=
f_reader.cc:2278<br>
=C2=A0 collect2: error: ld returned 1 exit status<br>
=C2=A0 in various projects (runc-opencontainers, libhybris, collada-dom)<b=
r>
<br>
* <a href=3D"https://gcc.gnu.org/gcc-11/changes.html" rel=3D"noreferrer" t=
arget=3D"_blank">https://gcc.gnu.org/gcc-11/changes.html</a><br>
<br>
=C2=A0 For targets that produce DWARF debugging information GCC now defaul=
ts to DWARF version 5<br>
=C2=A0 (with the exception of VxWorks and Darwin/Mac OS X which default to=
 version 2 and<br>
=C2=A0 AIX which defaults to version 4). This can produce up to 25% more c=
ompact debug<br>
=C2=A0 information compared to earlier versions.<br>
<br>
=C2=A0 To take full advantage of DWARF version 5 GCC needs to be build aga=
inst binutils version 2.35.2 or higher.<br>
=C2=A0 When GCC is build against earlier versions of binutils GCC will sti=
ll emit DWARF version 5 for<br>
=C2=A0 most debuginfo data, but will generate version 4 debug line tables =
(even when explicitly given -gdwarf-5).<br>
<br>
=C2=A0 The following debug information consumers can process DWARF version=
 5:<br>
<br>
=C2=A0 GDB 8.0, or higher<br>
=C2=A0 valgrind 3.17.0<br>
=C2=A0 elfutils 0.172, or higher (for use with systemtap, dwarves/pahole, =
perf and libabigail)<br>
=C2=A0 dwz 0.14<br>
=C2=A0 Programs embedding libbacktrace are urged to upgrade to the version=
 shipping with GCC 11.<br>
<br>
=C2=A0 To make GCC 11 generate an older DWARF version use -g together with=
 -gdwarf-2, -gdwarf-3 or -gdwarf-4.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../binutils/binutils-2.36.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../0018-Add-DWARF-5-support-in-gold.patch=C2=A0 =C2=A0 | 1374 +++++=
++++++++++++<br>
=C2=A02 files changed, 1375 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Add-=
DWARF-5-support-in-gold.patch<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recip=
es-devtools/binutils/binutils-2.36.inc<br>
index 66080dfcee..d54e2a3457 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc<br>
@@ -36,6 +36,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 file://0015-sync-with-OE-libtool-changes.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0016-Check-for-clang-before-checking-gcc-versi=
on.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://0017-Add-support-for-the-DW_FORM_strx-forms-to=
-the-BFD-li.patch \<br>
+=C2=A0 =C2=A0 =C2=A0file://0018-Add-DWARF-5-support-in-gold.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://CVE-2021-20197.patch \<br>
=C2=A0&quot;<br>
=C2=A0S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-supp=
ort-in-gold.patch b/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-=
5-support-in-gold.patch<br>
new file mode 100644<br>
index 0000000000..353b680857<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/binutils/binutils/0018-Add-DWARF-5-support-in-=
gold.patch<br>
@@ -0,0 +1,1374 @@<br>
+From 29dab7648672342418a9d32767e3b3182d9e6a30 Mon Sep 17 00:00:00 2001<br=
>
+From: Cary Coutant &lt;<a href=3D"mailto:ccoutant@gmail.com" target=3D"_b=
lank">ccoutant@gmail.com</a>&gt;<br>
+Date: Wed, 17 Mar 2021 21:31:15 -0700<br>
+Subject: [PATCH] Add DWARF 5 support in gold.<br>
+<br>
+elfcpp/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR gold/27246<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* dwarf.h (enum DW_LNCT): Add line number tabl=
e content type codes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(enum DW_LINE_OPS): Reformat.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(enum DW_LINE_EXTENDED_OPS): Reformat.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(enum DW_CHILDREN): Reformat.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(enum DW_RLE): Add range list entry types.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(enum DW_SECT): Update values for DWARF 5.<br>
+<br>
+gold/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR gold/27246<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* dwarf_reader.cc (Dwarf_abbrev_table::do_get_=
abbrev): Handle<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DW_FORM_implicit_const.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_ranges_table::read_ranges_table): Add v=
ersion parameter;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Adjust all callers.=C2=A0 Look for .debug_rngl=
ists section if DWARF 5.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_ranges_table::read_range_list_v5): New =
method.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_die::read_attributes): Handle new DWARF=
 5 DW_FORM codes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_die::skip_attributes): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_info_reader::do_parse): Support DWARF 5=
 unit header format.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_info_reader::read_3bytes_from_pointer):=
 New method.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::Sized_dwarf_line_info)=
: Initialize<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0str_buffer_, str_buffer_start, reloc_map_, lin=
e_number_map_.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Look for .debug_line_str section.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_header_prolog): S=
upport DWARF 5 prolog.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_header_tables): R=
ename to...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_header_tables_v2)=
: ... this.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_header_tables_v5)=
: New method.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::process_one_opcode): I=
nsert missing &quot;this-&gt;&quot;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Change advance_line to signed int64_t.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_lines): Add endpt=
r parameter; adjust<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0callers.=C2=A0 Insert missing &quot;this-&gt;&=
quot;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_line_mappings): S=
upport DWARF 5.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::do_addr2line): Add deb=
ug code.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* dwarf_reader.h (Dwarf_abbrev_table::Attribut=
e): Add implicit_const<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0field. Adjust constructor.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_abbrev_table::add_sttribute): Add impli=
cit_const parameter.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_ranges_table::read_ranges_table): Add v=
ersion parameter.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_ranges_table::read_range_list_v5): New =
method.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_die): Remove unused attr_off field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_info_reader::Dwarf_info_reader): Initia=
lize unit_type_ field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_info_reader::is_type_unit): New method.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_info_reader::read_3bytes_from_pointer):=
 New method.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_info_reader::read_range_list): Call rea=
d_range_list_v5 for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DWARF 5 range lists.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_info_reader::is_type_unit_): Remove.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Dwarf_info_reader::unit_type_): New field.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::~Sized_dwarf_line_info=
): Delete<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0str_buffer_start_.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_header_tables): R=
ename to...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_header_tables_v2)=
: ... this.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_header_tables_v5)=
: New method.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::read_lines): Add endpt=
r parameter.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::Dwarf_line_infoHeader)=
: Add address_size field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::str_buffer_): New fiel=
d.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::str_buffer_end_): New =
field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::str_buffer_start_): Ne=
w field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::end_of_header_length_)=
: New field.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Sized_dwarf_line_info::end_of_unit_): New fie=
ld.<br>
+<br>
+Upstream-Status: Backport [5cde809b7b9 Add DWARF 5 support in gold.]<br>
+<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com"=
 target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+---<br>
+ elfcpp/dwarf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 89 +++++--<br>
+ gold/dwarf_reader.cc | 591 +++++++++++++++++++++++++++++++++++++------<b=
r>
+ gold/dwarf_reader.h=C2=A0 | 103 ++++++--<br>
+ 3 files changed, 654 insertions(+), 129 deletions(-)<br>
+<br>
+diff --git a/elfcpp/dwarf.h b/elfcpp/dwarf.h<br>
+index e24347f8481..c9a9e02369c 100644<br>
+--- a/elfcpp/dwarf.h<br>
++++ b/elfcpp/dwarf.h<br>
+@@ -152,35 +152,48 @@ enum DW_EH_PE<br>
+=C2=A0 =C2=A0DW_EH_PE_indirect =3D 0x80<br>
+ };<br>
+ <br>
++// Line number table content type codes.<br>
++<br>
++enum DW_LNCT<br>
++{<br>
++=C2=A0 DW_LNCT_path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x1,<br=
>
++=C2=A0 DW_LNCT_directory_index =3D 0x2,<br>
++=C2=A0 DW_LNCT_timestamp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x3,<br>
++=C2=A0 DW_LNCT_size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x4,<br=
>
++=C2=A0 DW_LNCT_MD5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x=
5,<br>
++=C2=A0 DW_LNCT_lo_user=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x2000,<br>
++=C2=A0 DW_LNCT_hi_user=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x3fff<br>
++};<br>
++<br>
+ // Line number opcodes.<br>
+ <br>
+ enum DW_LINE_OPS<br>
+ {<br>
+-=C2=A0 DW_LNS_extended_op =3D 0,<br>
+-=C2=A0 DW_LNS_copy =3D 1,<br>
+-=C2=A0 DW_LNS_advance_pc =3D 2,<br>
+-=C2=A0 DW_LNS_advance_line =3D 3,<br>
+-=C2=A0 DW_LNS_set_file =3D 4,<br>
+-=C2=A0 DW_LNS_set_column =3D 5,<br>
+-=C2=A0 DW_LNS_negate_stmt =3D 6,<br>
+-=C2=A0 DW_LNS_set_basic_block =3D 7,<br>
+-=C2=A0 DW_LNS_const_add_pc =3D 8,<br>
+-=C2=A0 DW_LNS_fixed_advance_pc =3D 9,<br>
++=C2=A0 DW_LNS_extended_op=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00,<br>
++=C2=A0 DW_LNS_copy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 0x01,<br>
++=C2=A0 DW_LNS_advance_pc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x02,<br>
++=C2=A0 DW_LNS_advance_line=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x03,<br>
++=C2=A0 DW_LNS_set_file=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x04,=
<br>
++=C2=A0 DW_LNS_set_column=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x05,<br>
++=C2=A0 DW_LNS_negate_stmt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x06,<br>
++=C2=A0 DW_LNS_set_basic_block=C2=A0 =C2=A0 =3D 0x07,<br>
++=C2=A0 DW_LNS_const_add_pc=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x08,<br>
++=C2=A0 DW_LNS_fixed_advance_pc=C2=A0 =C2=A0=3D 0x09,<br>
+=C2=A0 =C2=A0// DWARF 3.<br>
+-=C2=A0 DW_LNS_set_prologue_end =3D 10,<br>
+-=C2=A0 DW_LNS_set_epilogue_begin =3D 11,<br>
+-=C2=A0 DW_LNS_set_isa =3D 12<br>
++=C2=A0 DW_LNS_set_prologue_end=C2=A0 =C2=A0=3D 0x0a,<br>
++=C2=A0 DW_LNS_set_epilogue_begin =3D 0x0b,<br>
++=C2=A0 DW_LNS_set_isa=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x0c<=
br>
+ };<br>
+ <br>
+ // Line number extended opcodes.<br>
+ <br>
+ enum DW_LINE_EXTENDED_OPS<br>
+ {<br>
+-=C2=A0 DW_LNE_end_sequence =3D 1,<br>
+-=C2=A0 DW_LNE_set_address =3D 2,<br>
+-=C2=A0 DW_LNE_define_file =3D 3,<br>
++=C2=A0 DW_LNE_end_sequence=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D 0x01,<br>
++=C2=A0 DW_LNE_set_address=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0x02,<br>
++=C2=A0 DW_LNE_define_file=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0x03,<br>
+=C2=A0 =C2=A0// DWARF4.<br>
+-=C2=A0 DW_LNE_set_discriminator =3D 4,<br>
++=C2=A0 DW_LNE_set_discriminator=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=
=3D 0x04,<br>
+=C2=A0 =C2=A0// HP extensions.<br>
+=C2=A0 =C2=A0DW_LNE_HP_negate_is_UV_update=C2=A0 =C2=A0 =C2=A0 =3D 0x11,<=
br>
+=C2=A0 =C2=A0DW_LNE_HP_push_context=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D 0x12,<br>
+@@ -191,13 +204,15 @@ enum DW_LINE_EXTENDED_OPS<br>
+=C2=A0 =C2=A0DW_LNE_HP_negate_post_semantics=C2=A0 =C2=A0 =3D 0x17,<br>
+=C2=A0 =C2=A0DW_LNE_HP_negate_function_exit=C2=A0 =C2=A0 =C2=A0=3D 0x18,<=
br>
+=C2=A0 =C2=A0DW_LNE_HP_negate_front_end_logical =3D 0x19,<br>
+-=C2=A0 DW_LNE_HP_define_proc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 0x20<br>
++=C2=A0 DW_LNE_HP_define_proc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 0x20,<br>
++=C2=A0 DW_LNE_lo_user=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80,<br>
++=C2=A0 DW_LNE_hi_user=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xff<br>
+ };<br>
+ <br>
+ enum DW_CHILDREN<br>
+ {<br>
+-=C2=A0 DW_CHILDREN_no=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D0x00,<br>
+-=C2=A0 DW_CHILDREN_yes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D0x01<br>
++=C2=A0 DW_CHILDREN_no=C2=A0 =3D 0,<br>
++=C2=A0 DW_CHILDREN_yes =3D 1<br>
+ };<br>
+ <br>
+ // Source language names and codes.<br>
+@@ -247,20 +262,38 @@ enum DW_LANG<br>
+=C2=A0 =C2=A0DW_LANG_HP_Assembler =3D 0x8007<br>
+ };<br>
+ <br>
++// Range list entry kinds in .debug_rnglists* section.<br>
++<br>
++enum DW_RLE<br>
++{<br>
++=C2=A0 DW_RLE_end_of_list=C2=A0 =C2=A0=3D 0x00,<br>
++=C2=A0 DW_RLE_base_addressx =3D 0x01,<br>
++=C2=A0 DW_RLE_startx_endx=C2=A0 =C2=A0=3D 0x02,<br>
++=C2=A0 DW_RLE_startx_length =3D 0x03,<br>
++=C2=A0 DW_RLE_offset_pair=C2=A0 =C2=A0=3D 0x04,<br>
++=C2=A0 DW_RLE_base_address=C2=A0 =3D 0x05,<br>
++=C2=A0 DW_RLE_start_end=C2=A0 =C2=A0 =C2=A0=3D 0x06,<br>
++=C2=A0 DW_RLE_start_length=C2=A0 =3D 0x07<br>
++};<br>
++<br>
+ // DWARF section identifiers used in the package format.<br>
+ // Extensions for Fission.=C2=A0 See <a href=3D"http://gcc.gnu.org/wiki/=
DebugFissionDWP" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/wi=
ki/DebugFissionDWP</a>.<br>
++// Added (with changes) in DWARF 5.<br>
+ <br>
+ enum DW_SECT<br>
+ {<br>
+-=C2=A0 DW_SECT_INFO =3D 1,<br>
+-=C2=A0 DW_SECT_TYPES =3D 2,<br>
+-=C2=A0 DW_SECT_ABBREV =3D 3,<br>
+-=C2=A0 DW_SECT_LINE =3D 4,<br>
+-=C2=A0 DW_SECT_LOC =3D 5,<br>
++=C2=A0 DW_SECT_INFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 1,<br>
++=C2=A0 DW_SECT_ABBREV=C2=A0 =C2=A0 =C2=A0 =3D 3,<br>
++=C2=A0 DW_SECT_LINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 4,<br>
++=C2=A0 DW_SECT_LOCLISTS=C2=A0 =C2=A0 =3D 5,<br>
+=C2=A0 =C2=A0DW_SECT_STR_OFFSETS =3D 6,<br>
+-=C2=A0 DW_SECT_MACINFO =3D 7,<br>
+-=C2=A0 DW_SECT_MACRO =3D 8,<br>
+-=C2=A0 DW_SECT_MAX =3D DW_SECT_MACRO,<br>
++=C2=A0 DW_SECT_MACINFO=C2=A0 =C2=A0 =C2=A0=3D 7,<br>
++=C2=A0 DW_SECT_RNGLISTS=C2=A0 =C2=A0 =3D 8,<br>
++=C2=A0 DW_SECT_MAX =3D DW_SECT_RNGLISTS,<br>
++=C2=A0 // These were used only for the experimental Fission support in D=
WARF 4.<br>
++=C2=A0 DW_SECT_TYPES=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 2,<br>
++=C2=A0 DW_SECT_LOC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 5,<br>
++=C2=A0 DW_SECT_MACRO=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 8<br>
+ };<br>
+ <br>
+ } // End namespace elfcpp.<br>
+diff --git a/gold/dwarf_reader.cc b/gold/dwarf_reader.cc<br>
+index f0e6b89bde2..83a0114ed39 100644<br>
+--- a/gold/dwarf_reader.cc<br>
++++ b/gold/dwarf_reader.cc<br>
+@@ -26,6 +26,7 @@<br>
+ #include &lt;utility&gt;<br>
+ #include &lt;vector&gt;<br>
+ <br>
++#include &quot;debug.h&quot;<br>
+ #include &quot;elfcpp_swap.h&quot;<br>
+ #include &quot;dwarf.h&quot;<br>
+ #include &quot;object.h&quot;<br>
+@@ -275,6 +276,14 @@ Dwarf_abbrev_table::do_get_abbrev(unsigned int code)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t form =3D read_unsigned_LEB_128=
(this-&gt;buffer_pos_, &amp;len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;buffer_pos_ +=3D len;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // For DW_FORM_implicit_const, read the cons=
tant.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t implicit_const =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (form =3D=3D elfcpp::DW_FORM_implicit_con=
st)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 implicit_const =3D read_signed=
_LEB_128(this-&gt;buffer_pos_, &amp;len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;buffer_pos_ +=3D len;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A (0,0) pair terminates the list.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (attr =3D=3D 0 &amp;&amp; form =3D=
=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -282,7 +291,7 @@ Dwarf_abbrev_table::do_get_abbrev(unsigned int code)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (attr =3D=3D elfcpp::DW_AT_sibling)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;has_sibling_attribute =
=
=3D true;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;add_attribute(attr, form);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;add_attribute(attr, form, implicit=
_const);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;store_abbrev(nextcode, entry);<br>
+@@ -302,8 +311,16 @@ Dwarf_ranges_table::read_ranges_table(<br>
+=C2=A0 =C2=A0 =C2=A0Relobj* object,<br>
+=C2=A0 =C2=A0 =C2=A0const unsigned char* symtab,<br>
+=C2=A0 =C2=A0 =C2=A0off_t symtab_size,<br>
+-=C2=A0 =C2=A0 unsigned int ranges_shndx)<br>
++=C2=A0 =C2=A0 unsigned int ranges_shndx,<br>
++=C2=A0 =C2=A0 unsigned int version)<br>
+ {<br>
++=C2=A0 const std::string section_name(version &lt; 5<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? &quot;.debug_ranges&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;.debug_rnglists&quot;);<b=
r>
++=C2=A0 const std::string compressed_section_name(version &lt; 5<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ? &quot;.zdebug_ranges&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 : &quot;.zdebug_rnglists&quot;);<br>
++<br>
+=C2=A0 =C2=A0// If we&#39;ve already read this abbrev table, return immed=
iately.<br>
+=C2=A0 =C2=A0if (this-&gt;ranges_shndx_ &gt; 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; this-&gt;ranges_shndx_ =3D=3D range=
s_shndx)<br>
+@@ -318,7 +335,7 @@ Dwarf_ranges_table::read_ranges_table(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (unsigned int i =3D 1; i &lt; object-&gt;s=
hnum(); ++i)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::string name =3D object-&gt;section=
_name(i);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name =3D=3D &quot;.debug_ranges&quot; ||=
 name =3D=3D &quot;.zdebug_ranges&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name =3D=3D section_name || name =3D=3D =
compressed_section_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges_shndx =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;output_section_o=
ffset_ =3D object-&gt;output_section_offset(i);<br>
+@@ -393,7 +410,7 @@ Dwarf_ranges_table::read_range_list(<br>
+ {<br>
+=C2=A0 =C2=A0Dwarf_range_list* ranges;<br>
+ <br>
+-=C2=A0 if (!this-&gt;read_ranges_table(object, symtab, symtab_size, rang=
es_shndx))<br>
++=C2=A0 if (!this-&gt;read_ranges_table(object, symtab, symtab_size, rang=
es_shndx, 4))<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+ <br>
+=C2=A0 =C2=A0// Correct the offset.=C2=A0 For incremental update links, w=
e have a<br>
+@@ -459,6 +476,125 @@ Dwarf_ranges_table::read_range_list(<br>
+=C2=A0 =C2=A0return ranges;<br>
+ }<br>
+ <br>
++// Read a DWARF 5 range list from section RANGES_SHNDX at offset RANGES_=
OFFSET.<br>
++<br>
++Dwarf_range_list*<br>
++Dwarf_ranges_table::read_range_list_v5(<br>
++=C2=A0 =C2=A0 Relobj* object,<br>
++=C2=A0 =C2=A0 const unsigned char* symtab,<br>
++=C2=A0 =C2=A0 off_t symtab_size,<br>
++=C2=A0 =C2=A0 unsigned int addr_size,<br>
++=C2=A0 =C2=A0 unsigned int ranges_shndx,<br>
++=C2=A0 =C2=A0 off_t offset)<br>
++{<br>
++=C2=A0 Dwarf_range_list* ranges;<br>
++<br>
++=C2=A0 if (!this-&gt;read_ranges_table(object, symtab, symtab_size, rang=
es_shndx, 5))<br>
++=C2=A0 =C2=A0 return NULL;<br>
++<br>
++=C2=A0 ranges =3D new Dwarf_range_list();<br>
++=C2=A0 off_t base =3D 0;<br>
++=C2=A0 unsigned int shndx0 =3D 0;<br>
++<br>
++=C2=A0 // Correct the offset.=C2=A0 For incremental update links, we hav=
e a<br>
++=C2=A0 // relocated offset that is relative to the output section, but<b=
r>
++=C2=A0 // here we need an offset relative to the input section.<br>
++=C2=A0 offset -=3D this-&gt;output_section_offset_;<br>
++<br>
++=C2=A0 // Read the range list at OFFSET.<br>
++=C2=A0 const unsigned char* prle =3D this-&gt;ranges_buffer_ + offset;<b=
r>
++=C2=A0 while (prle &lt; this-&gt;ranges_buffer_end_)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 off_t start;<br>
++=C2=A0 =C2=A0 =C2=A0 off_t end;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int shndx1 =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int shndx2 =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t len;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Read the entry type.<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int rle_type =3D *prle++;<br>
++=C2=A0 =C2=A0 =C2=A0 offset +=3D 1;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (rle_type =3D=3D elfcpp::DW_RLE_end_of_list)<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 switch (rle_type)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_RLE_base_address:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr_size =3D=3D 4)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D this-&gt;dwinfo_-&gt;=
read_from_pointer&lt;32&gt;(prle);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D this-&gt;dwinfo_-&gt;=
read_from_pointer&lt;64&gt;(prle);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (this-&gt;ranges_reloc_mapper_ !=
=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shndx0 =3D this-&gt;loo=
kup_reloc(offset, &amp;base);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prle +=3D addr_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D addr_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_RLE_offset_pair:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D read_unsigned_LEB_128(prle,=
 &amp;len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prle +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end =3D read_unsigned_LEB_128(prle, &=
amp;len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prle +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shndx0 =3D=3D 0 || object-&gt;is_=
section_included(shndx0))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges-&gt;add(shndx0, base + =
start, base + end);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_RLE_start_end:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr_size =3D=3D 4)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D this-&gt;dwin=
fo_-&gt;read_from_pointer&lt;32&gt;(prle);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end =3D this-&gt;dwinfo=
_-&gt;read_from_pointer&lt;32&gt;(prle + 4);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D this-&gt;dwin=
fo_-&gt;read_from_pointer&lt;64&gt;(prle);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end =3D this-&gt;dwinfo=
_-&gt;read_from_pointer&lt;64&gt;(prle + 8);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (this-&gt;ranges_reloc_mapper_ !=
=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shndx1 =3D this-&gt;loo=
kup_reloc(offset, &amp;start);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shndx2 =3D this-&gt;loo=
kup_reloc(offset + addr_size, &amp;end);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shndx1 !=3D shndx2)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gold_warning(_(&=
quot;%s: DWARF info may be corrupt; offsets in a &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;range list entry are in dif=
ferent sections&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object-&gt;name().c_str());<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prle +=3D addr_size * 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D addr_size * 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shndx1 =3D=3D 0 || object-&gt;is_=
section_included(shndx1))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges-&gt;add(shndx1, start, =
end);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_RLE_start_length:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr_size =3D=3D 4)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D this-&gt;dwinfo_-&gt=
;read_from_pointer&lt;32&gt;(prle);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D this-&gt;dwinfo_-&gt=
;read_from_pointer&lt;64&gt;(prle);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (this-&gt;ranges_reloc_mapper_ !=
=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shndx1 =3D this-&gt;lookup_rel=
oc(offset, &amp;start);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prle +=3D addr_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D addr_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end =3D start + read_unsigned_LEB_128=
(prle, &amp;len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prle +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shndx1 =3D=3D 0 || object-&gt;is_=
section_included(shndx1))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges-&gt;add(shndx1, start, =
end);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gold_warning(_(&quot;%s: DWARF range =
list contains &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;unsupported entry type (%d)&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0object-&gt;name().c_str(), rle_type);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 return ranges;<br>
++}<br>
++<br>
+ // Look for a relocation at offset OFF in the range table,<br>
+ // and return the section index and offset of the target.<br>
+ <br>
+@@ -709,7 +845,13 @@ Dwarf_die::read_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_flag_present:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr_value.val.intval =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_implicit_const:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.intval =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;abbrev_code_-&=
gt;attributes[i].implicit_const;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_strp:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strp_sup:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_line_strp:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_t str_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (this-&gt;dwinfo_-&gt;=
offset_size() =3D=3D 4)<br>
+@@ -722,6 +864,26 @@ Dwarf_die::read_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr_value.val.refval =3D=
 str_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_GNU_str_index:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D read_unsig=
ned_LEB_128(pattr, &amp;len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattr +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx1:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D *pattr++;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx2:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;dwinfo_-&gt;re=
ad_from_pointer&lt;16&gt;(&amp;pattr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;dwinfo_-&gt;re=
ad_3bytes_from_pointer(&amp;pattr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx4:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;dwinfo_-&gt;re=
ad_from_pointer&lt;32&gt;(&amp;pattr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_sec_offset:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_t sec_off;<br>
+@@ -747,7 +909,6 @@ Dwarf_die::read_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;dw=
info_-&gt;lookup_reloc(attr_off, &amp;sec_off);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr_value.aux.shndx =3D =
shndx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr_value.val.refval =3D=
 sec_off;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ref_form =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref_addr:<br>
+@@ -815,6 +976,7 @@ Dwarf_die::read_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref4:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_ref_sup4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_t sec_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sec_off =3D this-&gt;dwin=
fo_-&gt;read_from_pointer&lt;32&gt;(&amp;pattr);<br>
+@@ -835,11 +997,20 @@ Dwarf_die::read_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr_value.val.intval =3D=
 sec_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_data16:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // For now, treat this as a 16=
-byte block.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.blockval =3D pa=
ttr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.aux.blocklen =3D 16=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattr +=3D 16;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref_sig8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr_value.val.uintval =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;dwinfo_-&=
gt;read_from_pointer&lt;64&gt;(&amp;pattr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref8:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_ref_sup8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_t sec_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sec_off =3D this-&gt;dwin=
fo_-&gt;read_from_pointer&lt;64&gt;(&amp;pattr);<br>
+@@ -856,11 +1027,29 @@ Dwarf_die::read_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_udata:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D read_unsig=
ned_LEB_128(pattr, &amp;len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattr +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_GNU_addr_index:<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_GNU_str_index:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr_value.val.uintval =3D read_=
unsigned_LEB_128(pattr, &amp;len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx1:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D *pattr++;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx2:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;dwinfo_-&gt;re=
ad_from_pointer&lt;16&gt;(&amp;pattr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;dwinfo_-&gt;re=
ad_3bytes_from_pointer(&amp;pattr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx4:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;dwinfo_-&gt;re=
ad_from_pointer&lt;32&gt;(&amp;pattr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_sdata:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr_value.val.intval =3D read_s=
igned_LEB_128(pattr, &amp;len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D len;<br>
+@@ -870,6 +1059,11 @@ Dwarf_die::read_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D strlen(attr_value.val.st=
ringval);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D len + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_loclistx:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_rnglistx:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr_value.val.uintval =3D read_unsig=
ned_LEB_128(pattr, &amp;len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattr +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -954,9 +1148,12 @@ Dwarf_die::skip_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch(form)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_flag_present:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_implicit_const:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_strp:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_sec_offset:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strp_sup:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_line_strp:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D this-&gt;dwinfo_-&gt;=
offset_size();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_addr:<br>
+@@ -993,23 +1190,42 @@ Dwarf_die::skip_attributes()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_data1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_flag:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx1:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_data2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref2:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx2:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattr +=3D 3;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_data4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref4:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_ref_sup4:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx4:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_data8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref_sig8:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_ref_sup8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattr +=3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_data16:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattr +=3D 16;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_ref_udata:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_udata:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_addrx:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_strx:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_loclistx:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case elfcpp::DW_FORM_rnglistx:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_GNU_addr_index:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case elfcpp::DW_FORM_GNU_str_index:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_unsigned_LEB_128(pattr, &am=
p;len);<br>
+@@ -1313,6 +1529,13 @@ Dwarf_info_reader::do_parse()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elfcpp::Swap_unaligned&lt;16, big_endia=
n&gt;::readval(pinfo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinfo +=3D 2;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 // DWARF 5: Read the unit type (1 byte) and address=
 size (1 byte).<br>
++=C2=A0 =C2=A0 =C2=A0 if (this-&gt;cu_version_ &gt;=3D 5)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;unit_type_ =3D *pinfo++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;address_size_ =3D *pinfo++;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Read debug_abbrev_offset (4 or 8 bytes).<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (this-&gt;offset_size_ =3D=3D 4)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0abbrev_offset =3D elfcpp::Swap_unaligned&lt;32=
, big_endian&gt;::readval(pinfo);<br>
+@@ -1333,13 +1556,14 @@ Dwarf_info_reader::do_parse()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinfo +=3D this-&gt;offset_size_;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 // Read address_size (1 byte).<br>
+-=C2=A0 =C2=A0 =C2=A0 this-&gt;address_size_ =3D *pinfo++;<br>
++=C2=A0 =C2=A0 =C2=A0 // DWARF 2-4: Read address_size (1 byte).<br>
++=C2=A0 =C2=A0 =C2=A0 if (this-&gt;cu_version_ &lt; 5)<br>
++=C2=A0 =C2=A0 =C2=A0 this-&gt;address_size_ =3D *pinfo++;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// For type units, read the two extra fields.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t signature =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0off_t type_offset =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (this-&gt;is_type_unit_)<br>
++=C2=A0 =C2=A0 =C2=A0 if (this-&gt;is_type_unit())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!this-&gt;check_buffer(pinfo + 8 + =
this-&gt;offset_size_))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -1369,7 +1593,7 @@ Dwarf_info_reader::do_parse()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (root_die.tag() !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Visit the CU or TU.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (this-&gt;is_type_unit_)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (this-&gt;is_type_unit())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;visit_type_unit(section=
_offset + this-&gt;cu_offset_,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cu_end - cu_start, type_offse=
t, signature,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;root_die);<br>
+@@ -1460,6 +1684,19 @@ Dwarf_info_reader::read_from_pointer(const unsigne=
d char** source)<br>
+=C2=A0 =C2=A0return return_value;<br>
+ }<br>
+ <br>
++// Read a 3-byte integer.=C2=A0 Update SOURCE after read.<br>
++inline typename elfcpp::Valtype_base&lt;32&gt;::Valtype<br>
++Dwarf_info_reader::read_3bytes_from_pointer(const unsigned char** source=
)<br>
++{<br>
++=C2=A0 typename elfcpp::Valtype_base&lt;32&gt;::Valtype return_value;<br=
>
++=C2=A0 if (this-&gt;object_-&gt;is_big_endian())<br>
++=C2=A0 =C2=A0 return_value =3D ((*source)[0] &lt;&lt; 16) | ((*source)[1=
] &lt;&lt; 8) | (*source)[2];<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 return_value =3D ((*source)[2] &lt;&lt; 16) | ((*source)[1=
] &lt;&lt; 8) | (*source)[0];<br>
++=C2=A0 *source +=3D 3;<br>
++=C2=A0 return return_value;<br>
++}<br>
++<br>
+ // Look for a relocation at offset ATTR_OFF in the dwarf info,<br>
+ // and return the section index and offset of the target.<br>
+ <br>
+@@ -1561,27 +1798,40 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::Si=
zed_dwarf_line_info(<br>
+=C2=A0 =C2=A0 =C2=A0Object* object,<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int read_shndx)<br>
+=C2=A0 =C2=A0: data_valid_(false), buffer_(NULL), buffer_start_(NULL),<br=
>
++=C2=A0 =C2=A0 str_buffer_(NULL), str_buffer_start_(NULL),<br>
+=C2=A0 =C2=A0 =C2=A0reloc_mapper_(NULL), symtab_buffer_(NULL), directorie=
s_(), files_(),<br>
+-=C2=A0 =C2=A0 current_header_index_(-1)<br>
++=C2=A0 =C2=A0 current_header_index_(-1), reloc_map_(), line_number_map_(=
)<br>
+ {<br>
+-=C2=A0 unsigned int debug_shndx;<br>
++=C2=A0 unsigned int debug_line_shndx =3D 0;<br>
++=C2=A0 unsigned int debug_line_str_shndx =3D 0;<br>
+ <br>
+-=C2=A0 for (debug_shndx =3D 1; debug_shndx &lt; object-&gt;shnum(); ++de=
bug_shndx)<br>
++=C2=A0 for (unsigned int i =3D 1; i &lt; object-&gt;shnum(); ++i)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 section_size_type buffer_size;<br>
++=C2=A0 =C2=A0 =C2=A0 bool is_new =3D false;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// FIXME: do this more efficiently: section_na=
me() isn&#39;t super-fast<br>
+-=C2=A0 =C2=A0 =C2=A0 std::string name =3D object-&gt;section_name(debug_=
shndx);<br>
++=C2=A0 =C2=A0 =C2=A0 std::string name =3D object-&gt;section_name(i);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (name =3D=3D &quot;.debug_line&quot; || nam=
e =3D=3D &quot;.zdebug_line&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_size_type buffer_size;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_new =3D false;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;buffer_ =3D object-&gt;decompressed=
_section_contents(debug_shndx,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&amp;buffer_size,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&amp;is_new);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;buffer_ =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object-&gt;decompressed_sectio=
n_contents(i, &amp;buffer_size, &amp;is_new);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_new)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;buffer_start_ =3D this-=
&gt;buffer_;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;buffer_end_ =3D this-&gt;buffe=
r_ + buffer_size;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_line_shndx =3D i;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else if (name =3D=3D &quot;.debug_line_str&quot; ||=
 name =3D=3D &quot;.zdebug_line_str&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;str_buffer_ =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object-&gt;decompressed_sectio=
n_contents(i, &amp;buffer_size, &amp;is_new);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_new)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;str_buffer_start_ =3D this-&=
gt;str_buffer_;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;str_buffer_end_ =3D this-&gt;str_bu=
ffer_ + buffer_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_line_str_shndx =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 if (debug_line_shndx &gt; 0 &amp;&amp; debug_line_s=
tr_shndx &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0if (this-&gt;buffer_ =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0return;<br>
+@@ -1594,7 +1844,7 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::Size=
d_dwarf_line_info(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int reloc_sh_type =3D object-&gt;sect=
ion_type(i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((reloc_sh_type =3D=3D elfcpp::SHT_REL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || reloc_sh_type =3D=3D elfcpp::SHT_RE=
LA)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; object-&gt;section_info(i) =3D=3D=
 debug_shndx)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; object-&gt;section_info(i) =3D=3D=
 debug_line_shndx)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reloc_shndx =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;track_relocs_type_ =3D reloc_s=
h_type;<br>
+@@ -1640,65 +1890,80 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::re=
ad_header_prolog(<br>
+=C2=A0 =C2=A0uint32_t initial_length =3D elfcpp::Swap_unaligned&lt;32, bi=
g_endian&gt;::readval(lineptr);<br>
+=C2=A0 =C2=A0lineptr +=3D 4;<br>
+ <br>
+-=C2=A0 // In DWARF2/3, if the initial length is all 1 bits, then the off=
set<br>
++=C2=A0 // In DWARF, if the initial length is all 1 bits, then the offset=
<br>
+=C2=A0 =C2=A0// size is 8 and we need to read the next 8 bytes for the re=
al length.<br>
+=C2=A0 =C2=A0if (initial_length =3D=3D 0xffffffff)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 header_.offset_size =3D 8;<br>
++=C2=A0 =C2=A0 =C2=A0 this-&gt;header_.offset_size =3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0initial_length =3D elfcpp::Swap_unaligned&lt;6=
4, big_endian&gt;::readval(lineptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr +=3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 header_.offset_size =3D 4;<br>
++=C2=A0 =C2=A0 this-&gt;header_.offset_size =3D 4;<br>
+ <br>
+-=C2=A0 header_.total_length =3D initial_length;<br>
++=C2=A0 this-&gt;header_.total_length =3D initial_length;<br>
+ <br>
+-=C2=A0 gold_assert(lineptr + header_.total_length &lt;=3D buffer_end_);<=
br>
++=C2=A0 this-&gt;end_of_unit_ =3D lineptr + initial_length;<br>
++=C2=A0 gold_assert(this-&gt;end_of_unit_ &lt;=3D buffer_end_);<br>
+ <br>
+-=C2=A0 header_.version =3D elfcpp::Swap_unaligned&lt;16, big_endian&gt;:=
:readval(lineptr);<br>
++=C2=A0 this-&gt;header_.version =3D<br>
++=C2=A0 =C2=A0 =C2=A0 elfcpp::Swap_unaligned&lt;16, big_endian&gt;::readv=
al(lineptr);<br>
+=C2=A0 =C2=A0lineptr +=3D 2;<br>
+ <br>
+-=C2=A0 // Skip address size and segment selector for DWARF5.<br>
+-=C2=A0 if (header_.version &gt;=3D 5)<br>
+-=C2=A0 =C2=A0 lineptr +=3D 2;<br>
++=C2=A0 // We can only read versions 2-5 of the DWARF line number table.<=
br>
++=C2=A0 // For other versions, just skip the entire line number table.<br=
>
++=C2=A0 if (this-&gt;header_.version &lt; 2 || this-&gt;header_.version &=
gt; 5)<br>
++=C2=A0 =C2=A0 return this-&gt;end_of_unit_;<br>
+ <br>
+-=C2=A0 if (header_.offset_size =3D=3D 4)<br>
+-=C2=A0 =C2=A0 header_.prologue_length =3D elfcpp::Swap_unaligned&lt;32, =
big_endian&gt;::readval(lineptr);<br>
++=C2=A0 // DWARF 5 only: address size and segment selector.<br>
++=C2=A0 if (this-&gt;header_.version &gt;=3D 5)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 this-&gt;header_.address_size =3D *lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 // We ignore the segment selector.<br>
++=C2=A0 =C2=A0 =C2=A0 lineptr +=3D 2;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (this-&gt;header_.offset_size =3D=3D 4)<br>
++=C2=A0 =C2=A0 this-&gt;header_.prologue_length =3D<br>
++=C2=A0 =C2=A0 =C2=A0 elfcpp::Swap_unaligned&lt;32, big_endian&gt;::readv=
al(lineptr);<br>
+=C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 header_.prologue_length =3D elfcpp::Swap_unaligned&lt;64, =
big_endian&gt;::readval(lineptr);<br>
+-=C2=A0 lineptr +=3D header_.offset_size;<br>
++=C2=A0 =C2=A0 this-&gt;header_.prologue_length =3D<br>
++=C2=A0 =C2=A0 =C2=A0 elfcpp::Swap_unaligned&lt;64, big_endian&gt;::readv=
al(lineptr);<br>
++=C2=A0 lineptr +=3D this-&gt;header_.offset_size;<br>
+ <br>
+-=C2=A0 header_.min_insn_length =3D *lineptr;<br>
++=C2=A0 this-&gt;end_of_header_length_ =3D lineptr;<br>
++<br>
++=C2=A0 this-&gt;header_.min_insn_length =3D *lineptr;<br>
+=C2=A0 =C2=A0lineptr +=3D 1;<br>
+ <br>
+-=C2=A0 if (header_.version &lt; 4)<br>
+-=C2=A0 =C2=A0 header_.max_ops_per_insn =3D 1;<br>
++=C2=A0 if (this-&gt;header_.version &lt; 4)<br>
++=C2=A0 =C2=A0 this-&gt;header_.max_ops_per_insn =3D 1;<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// DWARF 4 added the maximum_operations_per_in=
struction field.<br>
+-=C2=A0 =C2=A0 =C2=A0 header_.max_ops_per_insn =3D *lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 this-&gt;header_.max_ops_per_insn =3D *lineptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr +=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO: Add support for values other than 1.<=
br>
+-=C2=A0 =C2=A0 =C2=A0 gold_assert(header_.max_ops_per_insn =3D=3D 1);<br>
++=C2=A0 =C2=A0 =C2=A0 gold_assert(this-&gt;header_.max_ops_per_insn =3D=
=3D 1);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 header_.default_is_stmt =3D *lineptr;<br>
++=C2=A0 this-&gt;header_.default_is_stmt =3D *lineptr;<br>
+=C2=A0 =C2=A0lineptr +=3D 1;<br>
+ <br>
+-=C2=A0 header_.line_base =3D *reinterpret_cast&lt;const signed char*&gt;=
(lineptr);<br>
++=C2=A0 this-&gt;header_.line_base =3D *reinterpret_cast&lt;const signed =
char*&gt;(lineptr);<br>
+=C2=A0 =C2=A0lineptr +=3D 1;<br>
+ <br>
+-=C2=A0 header_.line_range =3D *lineptr;<br>
++=C2=A0 this-&gt;header_.line_range =3D *lineptr;<br>
+=C2=A0 =C2=A0lineptr +=3D 1;<br>
+ <br>
+-=C2=A0 header_.opcode_base =3D *lineptr;<br>
++=C2=A0 this-&gt;header_.opcode_base =3D *lineptr;<br>
+=C2=A0 =C2=A0lineptr +=3D 1;<br>
+ <br>
+-=C2=A0 header_.std_opcode_lengths.resize(header_.opcode_base + 1);<br>
+-=C2=A0 header_.std_opcode_lengths[0] =3D 0;<br>
+-=C2=A0 for (int i =3D 1; i &lt; header_.opcode_base; i++)<br>
++=C2=A0 this-&gt;header_.std_opcode_lengths.resize(this-&gt;header_.opcod=
e_base + 1);<br>
++=C2=A0 this-&gt;header_.std_opcode_lengths[0] =3D 0;<br>
++=C2=A0 for (int i =3D 1; i &lt; this-&gt;header_.opcode_base; i++)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 header_.std_opcode_lengths[i] =3D *lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 this-&gt;header_.std_opcode_lengths[i] =3D *lineptr=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr +=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -1707,10 +1972,11 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::re=
ad_header_prolog(<br>
+ <br>
+ // The header for a debug_line section is mildly complicated, because<br=
>
+ // the line info is very tightly encoded.<br>
++// This routine is for DWARF versions 2, 3, and 4.<br>
+ <br>
+ template&lt;int size, bool big_endian&gt;<br>
+ const unsigned char*<br>
+-Sized_dwarf_line_info&lt;size, big_endian&gt;::read_header_tables(<br>
++Sized_dwarf_line_info&lt;size, big_endian&gt;::read_header_tables_v2(<br=
>
+=C2=A0 =C2=A0 =C2=A0const unsigned char* lineptr)<br>
+ {<br>
+=C2=A0 =C2=A0++this-&gt;current_header_index_;<br>
+@@ -1775,6 +2041,169 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::re=
ad_header_tables(<br>
+=C2=A0 =C2=A0return lineptr;<br>
+ }<br>
+ <br>
++// This routine is for DWARF version 5.<br>
++<br>
++template&lt;int size, bool big_endian&gt;<br>
++const unsigned char*<br>
++Sized_dwarf_line_info&lt;size, big_endian&gt;::read_header_tables_v5(<br=
>
++=C2=A0 =C2=A0 const unsigned char* lineptr)<br>
++{<br>
++=C2=A0 size_t len;<br>
++<br>
++=C2=A0 ++this-&gt;current_header_index_;<br>
++<br>
++=C2=A0 gold_assert(static_cast&lt;int&gt;(this-&gt;directories_.size())<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D this-&gt;current_header=
_index_);<br>
++=C2=A0 gold_assert(static_cast&lt;int&gt;(this-&gt;files_.size())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D this-&gt;current_header=
_index_);<br>
++<br>
++=C2=A0 // Read the directory list.<br>
++=C2=A0 unsigned int format_count =3D *lineptr;<br>
++=C2=A0 lineptr +=3D 1;<br>
++<br>
++=C2=A0 unsigned int *types =3D new unsigned int[format_count];<br>
++=C2=A0 unsigned int *forms =3D new unsigned int[format_count];<br>
++<br>
++=C2=A0 for (unsigned int i =3D 0; i &lt; format_count; i++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 types[i] =3D read_unsigned_LEB_128(lineptr, &amp;le=
n);<br>
++=C2=A0 =C2=A0 =C2=A0 lineptr +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 forms[i] =3D read_unsigned_LEB_128(lineptr, &amp;le=
n);<br>
++=C2=A0 =C2=A0 =C2=A0 lineptr +=3D len;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 uint64_t entry_count =3D read_unsigned_LEB_128(lineptr, &amp;len)=
;<br>
++=C2=A0 lineptr +=3D len;<br>
++=C2=A0 this-&gt;directories_.push_back(std::vector&lt;std::string&gt;(0)=
);<br>
++=C2=A0 std::vector&lt;std::string&gt;&amp; dir_list =3D this-&gt;directo=
ries_.back();<br>
++<br>
++=C2=A0 for (unsigned int j =3D 0; j &lt; entry_count; j++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 std::string dirname;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (unsigned int i =3D 0; i &lt; format_count; i++=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0if (types[i] =3D=3D elfcpp::DW_LNCT_path)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (forms[i] =3D=3D elfcpp::DW_=
FORM_string)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirname =3D reint=
erpret_cast&lt;const char*&gt;(lineptr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr +=3D dirn=
ame.size() + 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (forms[i] =3D=3D elfcpp=
::DW_FORM_line_strp)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t offset;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (this-&gt;head=
er_.offset_size =3D=3D 4)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0elfcpp::Swap_unaligned&lt;32, big_endian&gt;::readval(lineptr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0elfcpp::Swap_unaligned&lt;64, big_endian&gt;::readval(lineptr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typename Reloc_ma=
p::const_iterator it<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 this-&gt;reloc_map_.find(lineptr - this-&gt;buffer_);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (it !=3D reloc=
_map_.end())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
(this-&gt;track_relocs_type_ =3D=3D elfcpp::SHT_RELA)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0offset =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off=
set +=3D it-&gt;second.second;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr +=3D this=
-&gt;header_.offset_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirname =3D reint=
erpret_cast&lt;const char*&gt;(this-&gt;str_buffer_<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 dir_list.push_back(dirname);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 delete[] types;<br>
++=C2=A0 delete[] forms;<br>
++<br>
++=C2=A0 // Read the filenames list.<br>
++=C2=A0 format_count =3D *lineptr;<br>
++=C2=A0 lineptr +=3D 1;<br>
++<br>
++=C2=A0 types =3D new unsigned int[format_count];<br>
++=C2=A0 forms =3D new unsigned int[format_count];<br>
++<br>
++=C2=A0 for (unsigned int i =3D 0; i &lt; format_count; i++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 types[i] =3D read_unsigned_LEB_128(lineptr, &amp;le=
n);<br>
++=C2=A0 =C2=A0 =C2=A0 lineptr +=3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 forms[i] =3D read_unsigned_LEB_128(lineptr, &amp;le=
n);<br>
++=C2=A0 =C2=A0 =C2=A0 lineptr +=3D len;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 entry_count =3D read_unsigned_LEB_128(lineptr, &amp;len);<br>
++=C2=A0 lineptr +=3D len;<br>
++=C2=A0 this-&gt;files_.push_back(<br>
++=C2=A0 =C2=A0 =C2=A0 std::vector&lt;std::pair&lt;int, std::string&gt; &g=
t;(0));<br>
++=C2=A0 std::vector&lt;std::pair&lt;int, std::string&gt; &gt;&amp; file_l=
ist =3D this-&gt;files_.back();<br>
++<br>
++=C2=A0 for (unsigned int j =3D 0; j &lt; entry_count; j++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 const char* path =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 int dirindex =3D 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (unsigned int i =3D 0; i &lt; format_count; i++=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0if (types[i] =3D=3D elfcpp::DW_LNCT_path)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (forms[i] =3D=3D elfcpp::DW_=
FORM_string)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D reinterp=
ret_cast&lt;const char*&gt;(lineptr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr +=3D strl=
en(path) + 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (forms[i] =3D=3D elfcpp=
::DW_FORM_line_strp)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t offset;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (this-&gt;head=
er_.offset_size =3D=3D 4)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D=
 elfcpp::Swap_unaligned&lt;32, big_endian&gt;::readval(lineptr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D=
 elfcpp::Swap_unaligned&lt;64, big_endian&gt;::readval(lineptr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typename Reloc_ma=
p::const_iterator it<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 this-&gt;reloc_map_.find(lineptr - this-&gt;buffer_);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (it !=3D reloc=
_map_.end())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
(this-&gt;track_relocs_type_ =3D=3D elfcpp::SHT_RELA)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0offset =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off=
set +=3D it-&gt;second.second;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr +=3D this=
-&gt;header_.offset_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D reinterp=
ret_cast&lt;const char*&gt;(this-&gt;str_buffer_<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (types[i] =3D=3D elfcpp::DW_LNCT_dire=
ctory_index)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (forms[i] =3D=3D elfcpp::DW_=
FORM_udata)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirindex =3D read=
_unsigned_LEB_128(lineptr, &amp;len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr +=3D len;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 gold_debug(DEBUG_LOCATION, &quot;File %3d: %s&quot;=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static_cast&lt;in=
t&gt;(file_list.size()), path);<br>
++=C2=A0 =C2=A0 =C2=A0 file_list.push_back(std::make_pair(dirindex, path))=
;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 delete[] types;<br>
++=C2=A0 delete[] forms;<br>
++<br>
++=C2=A0 return lineptr;<br>
++}<br>
++<br>
+ // Process a single opcode in the .debug.line structure.<br>
+ <br>
+ template&lt;int size, bool big_endian&gt;<br>
+@@ -1790,15 +2219,15 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::pr=
ocess_one_opcode(<br>
+ <br>
+=C2=A0 =C2=A0// If the opcode is great than the opcode_base, it is a spec=
ial<br>
+=C2=A0 =C2=A0// opcode. Most line programs consist mainly of special opco=
des.<br>
+-=C2=A0 if (opcode &gt;=3D header_.opcode_base)<br>
++=C2=A0 if (opcode &gt;=3D this-&gt;header_.opcode_base)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 opcode -=3D header_.opcode_base;<br>
+-=C2=A0 =C2=A0 =C2=A0 const int advance_address =3D ((opcode / header_.li=
ne_range)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* header_.min_insn_=
length);<br>
++=C2=A0 =C2=A0 =C2=A0 opcode -=3D this-&gt;header_.opcode_base;<br>
++=C2=A0 =C2=A0 =C2=A0 const int advance_address =3D ((opcode / this-&gt;h=
eader_.line_range)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this-&gt;header_.=
min_insn_length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lsm-&gt;address +=3D advance_address;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 const int advance_line =3D ((opcode % header_.line_=
range)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + header_.line_base);<br>
++=C2=A0 =C2=A0 =C2=A0 const int advance_line =3D ((opcode % this-&gt;head=
er_.line_range)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + this-&gt;header_.line_base);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lsm-&gt;line_num +=3D advance_line;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lsm-&gt;basic_block =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*len =3D oplen;<br>
+@@ -1818,13 +2247,13 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::pr=
ocess_one_opcode(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint64_t advance_address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D read_unsigned_LEB_128=
(start, &amp;templen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oplen +=3D templen;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm-&gt;address +=3D header_.min_insn_length=
 * advance_address;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsm-&gt;address +=3D this-&gt;header_.min_in=
sn_length * advance_address;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0case elfcpp::DW_LNS_advance_line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint64_t advance_line =3D read_signed_=
LEB_128(start, &amp;templen);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const int64_t advance_line =3D read_signed_L=
EB_128(start, &amp;templen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oplen +=3D templen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsm-&gt;line_num +=3D advance_line;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1865,9 +2294,9 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::proc=
ess_one_opcode(<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0case elfcpp::DW_LNS_const_add_pc:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const int advance_address =3D (header_.min_i=
nsn_length<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ((255 - he=
ader_.opcode_base)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 / he=
ader_.line_range));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const int advance_address =3D (this-&gt;head=
er_.min_insn_length<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ((255 - th=
is-&gt;header_.opcode_base)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 / th=
is-&gt;header_.line_range));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsm-&gt;address +=3D advance_address;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -1950,7 +2379,7 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::proc=
ess_one_opcode(<br>
+=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Ignore unknown opcode=C2=A0 silently=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; header_.std_opcode_=
lengths[opcode]; i++)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; this-&gt;header_.st=
d_opcode_lengths[opcode]; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t templen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_unsigned_LEB_128(sta=
rt, &amp;templen);<br>
+@@ -1970,28 +2399,24 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::pr=
ocess_one_opcode(<br>
+ template&lt;int size, bool big_endian&gt;<br>
+ unsigned const char*<br>
+ Sized_dwarf_line_info&lt;size, big_endian&gt;::read_lines(unsigned const=
 char* lineptr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned const char* endptr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int shndx)<br>
+ {<br>
+=C2=A0 =C2=A0struct LineStateMachine lsm;<br>
+ <br>
+-=C2=A0 // LENGTHSTART is the place the length field is based on.=C2=A0 I=
t is the<br>
+-=C2=A0 // point in the header after the initial length field.<br>
+-=C2=A0 const unsigned char* lengthstart =3D buffer_;<br>
+-<br>
+-=C2=A0 // In 64 bit dwarf, the initial length is 12 bytes, because of th=
e<br>
+-=C2=A0 // 0xffffffff at the start.<br>
+-=C2=A0 if (header_.offset_size =3D=3D 8)<br>
+-=C2=A0 =C2=A0 lengthstart +=3D 12;<br>
+-=C2=A0 else<br>
+-=C2=A0 =C2=A0 lengthstart +=3D 4;<br>
+-<br>
+-=C2=A0 while (lineptr &lt; lengthstart + header_.total_length)<br>
++=C2=A0 while (lineptr &lt; endptr)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 ResetLineStateMachine(&amp;lsm, header_.default_is_=
stmt);<br>
++=C2=A0 =C2=A0 =C2=A0 ResetLineStateMachine(&amp;lsm, this-&gt;header_.de=
fault_is_stmt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!lsm.end_sequence)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t oplength;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lineptr &gt;=3D endptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool add_line =3D this-&gt;proce=
ss_one_opcode(lineptr, &amp;lsm, &amp;oplength);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lineptr +=3D oplength;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (add_line<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (shndx =
=
=3D=3D -1U || lsm.shndx =3D=3D -1U || shndx =3D=3D lsm.shndx))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -2012,11 +2437,10 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::re=
ad_lines(unsigned const char* lineptr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map.back().last_li=
ne_for_offset =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map.push_back(entry);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lineptr +=3D oplength;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 return lengthstart + header_.total_length;<br>
++=C2=A0 return endptr;<br>
+ }<br>
+ <br>
+ // Read the relocations into a Reloc_map.<br>
+@@ -2057,9 +2481,17 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::rea=
d_line_mappings(unsigned int shndx)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const unsigned char* lineptr =3D this-&gt;buff=
er_;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lineptr =3D this-&gt;read_header_prolog(linept=
r);<br>
+-=C2=A0 =C2=A0 =C2=A0 lineptr =3D this-&gt;read_header_tables(lineptr);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 lineptr =3D this-&gt;read_lines(lineptr, shndx);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 this-&gt;buffer_ =3D lineptr;<br>
++=C2=A0 =C2=A0 =C2=A0 if (this-&gt;header_.version &gt;=3D 2 &amp;&amp; t=
his-&gt;header_.version &lt;=3D 4)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 lineptr =3D this-&gt;read_header_tables_v2(l=
ineptr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 lineptr =3D this-&gt;read_lines(lineptr, thi=
s-&gt;end_of_unit_, shndx);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else if (this-&gt;header_.version =3D=3D 5)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 lineptr =3D this-&gt;read_header_tables_v5(l=
ineptr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 lineptr =3D this-&gt;read_lines(lineptr, thi=
s-&gt;end_of_unit_, shndx);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 this-&gt;buffer_ =3D this-&gt;end_of_unit_;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0// Sort the lines numbers, so addr2line can use binary searc=
h.<br>
+@@ -2215,6 +2647,9 @@ Sized_dwarf_line_info&lt;size, big_endian&gt;::do_a=
ddr2line(<br>
+=C2=A0 =C2=A0 =C2=A0off_t offset,<br>
+=C2=A0 =C2=A0 =C2=A0std::vector&lt;std::string&gt;* other_lines)<br>
+ {<br>
++=C2=A0 gold_debug(DEBUG_LOCATION, &quot;do_addr2line: shndx %u offset %0=
8x&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shndx, static_cast&lt;int&gt;(o=
ffset));<br>
++<br>
+=C2=A0 =C2=A0if (this-&gt;data_valid_ =3D=3D false)<br>
+=C2=A0 =C2=A0 =C2=A0return &quot;&quot;;<br>
+ <br>
+diff --git a/gold/dwarf_reader.h b/gold/dwarf_reader.h<br>
+index 80b2231327c..921a1f7c876 100644<br>
+--- a/gold/dwarf_reader.h<br>
++++ b/gold/dwarf_reader.h<br>
+@@ -173,11 +173,12 @@ class Dwarf_abbrev_table<br>
+=C2=A0 =C2=A0// An attribute list entry.<br>
+=C2=A0 =C2=A0struct Attribute<br>
+=C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 Attribute(unsigned int a, unsigned int f)<br>
+-=C2=A0 =C2=A0 =C2=A0 : attr(a), form(f)<br>
++=C2=A0 =C2=A0 Attribute(unsigned int a, unsigned int f, int c)<br>
++=C2=A0 =C2=A0 =C2=A0 : attr(a), form(f), implicit_const(c)<br>
+=C2=A0 =C2=A0 =C2=A0{ }<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int attr;<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int form;<br>
++=C2=A0 =C2=A0 int implicit_const;<br>
+=C2=A0 =C2=A0};<br>
+ <br>
+=C2=A0 =C2=A0// An abbrev code entry.<br>
+@@ -190,9 +191,9 @@ class Dwarf_abbrev_table<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0void<br>
+-=C2=A0 =C2=A0 add_attribute(unsigned int attr, unsigned int form)<br>
++=C2=A0 =C2=A0 add_attribute(unsigned int attr, unsigned int form, int im=
plicit_const)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 this-&gt;attributes.push_back(Attribute(attr, form)=
);<br>
++=C2=A0 =C2=A0 =C2=A0 this-&gt;attributes.push_back(Attribute(attr, form,=
 implicit_const));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0// The DWARF tag.<br>
+@@ -349,14 +350,15 @@ class Dwarf_ranges_table<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0delete this-&gt;ranges_reloc_mapper_;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 // Read the ranges table from an object file.<br>
++=C2=A0 // Fetch the contents of the ranges table from an object file.<br=
>
+=C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0read_ranges_table(Relobj* object,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cons=
t unsigned char* symtab,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_=
t symtab_size,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned =
int ranges_shndx);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned =
int ranges_shndx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned =
int version);<br>
+ <br>
+-=C2=A0 // Read the range table from an object file.<br>
++=C2=A0 // Read the DWARF 2/3/4 range table.<br>
+=C2=A0 =C2=A0Dwarf_range_list*<br>
+=C2=A0 =C2=A0read_range_list(Relobj* object,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const unsig=
ned char* symtab,<br>
+@@ -365,6 +367,15 @@ class Dwarf_ranges_table<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned in=
t ranges_shndx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_t range=
s_offset);<br>
+ <br>
++=C2=A0 // Read the DWARF 5 rnglists table.<br>
++=C2=A0 Dwarf_range_list*<br>
++=C2=A0 read_range_list_v5(Relobj* object,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con=
st unsigned char* symtab,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off=
_t symtab_size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uns=
igned int address_size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uns=
igned int ranges_shndx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off=
_t ranges_offset);<br>
++<br>
+=C2=A0 =C2=A0// Look for a relocation at offset OFF in the range table,<b=
r>
+=C2=A0 =C2=A0// and return the section index and offset of the target.<br=
>
+=C2=A0 =C2=A0unsigned int<br>
+@@ -490,8 +501,6 @@ class Dwarf_die<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int shndx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Block length for block forms.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int blocklen;<br>
+-=C2=A0 =C2=A0 =C2=A0 // Attribute offset for DW_FORM_strp.<br>
+-=C2=A0 =C2=A0 =C2=A0 unsigned int attr_off;<br>
+=C2=A0 =C2=A0 =C2=A0} aux;<br>
+=C2=A0 =C2=A0};<br>
+ <br>
+@@ -684,6 +693,10 @@ class Dwarf_die<br>
+ // calls the various visit_xxx() methods for each header.=C2=A0 Clients<=
br>
+ // should derive a new class from this one and implement the<br>
+ // visit_compilation_unit() and visit_type_unit() functions.<br>
++// IS_TYPE_UNIT is true if we are reading from a .debug_types section,<b=
r>
++// which is used only in DWARF 4. For DWARF 5, it will be false,<br>
++// and we will determine whether it&#39;s a type init when we parse the<=
br>
++// header.<br>
+ <br>
+ class Dwarf_info_reader<br>
+ {<br>
+@@ -695,7 +708,7 @@ class Dwarf_info_reader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsi=
gned int shndx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsi=
gned int reloc_shndx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsi=
gned int reloc_type)<br>
+-=C2=A0 =C2=A0 : is_type_unit_(is_type_unit), object_(object), symtab_(sy=
mtab),<br>
++=C2=A0 =C2=A0 : object_(object), symtab_(symtab),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0symtab_size_(symtab_size), shndx_(shndx), relo=
c_shndx_(reloc_shndx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reloc_type_(reloc_type), abbrev_shndx_(0), str=
ing_shndx_(0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer_(NULL), buffer_end_(NULL), cu_offset_(0=
), cu_length_(0),<br>
+@@ -703,7 +716,12 @@ class Dwarf_info_reader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0abbrev_table_(), ranges_table_(this),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reloc_mapper_(NULL), string_buffer_(NULL), str=
ing_buffer_end_(NULL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0owns_string_buffer_(false), string_output_sect=
ion_offset_(0)<br>
+-=C2=A0 { }<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 // For DWARF 4, we infer the unit type from the section na=
me.<br>
++=C2=A0 =C2=A0 // For DWARF 5, we will read this from the unit header.<br=
>
++=C2=A0 =C2=A0 this-&gt;unit_type_ =3D<br>
++=C2=A0 =C2=A0 =C2=A0 (is_type_unit ? elfcpp::DW_UT_type : elfcpp::DW_UT_=
compile);<br>
++=C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0virtual<br>
+=C2=A0 =C2=A0~Dwarf_info_reader()<br>
+@@ -714,6 +732,13 @@ class Dwarf_info_reader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0delete[] this-&gt;string_buffer_;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 bool<br>
++=C2=A0 is_type_unit() const<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 return (this-&gt;unit_type_ =3D=3D elfcpp::DW_UT_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || this-&gt;unit_type_ =3D=3D elfcpp:=
:DW_UT_split_type);<br>
++=C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0// Begin parsing the debug info.=C2=A0 This calls visit_comp=
ilation_unit()<br>
+=C2=A0 =C2=A0// or visit_type_unit() for each compilation or type unit fo=
und in the<br>
+=C2=A0 =C2=A0// section, and visit_die() for each top-level DIE.<br>
+@@ -745,6 +770,9 @@ class Dwarf_info_reader<br>
+=C2=A0 =C2=A0inline typename elfcpp::Valtype_base&lt;valsize&gt;::Valtype=
<br>
+=C2=A0 =C2=A0read_from_pointer(const unsigned char** source);<br>
+ <br>
++=C2=A0 inline typename elfcpp::Valtype_base&lt;32&gt;::Valtype<br>
++=C2=A0 read_3bytes_from_pointer(const unsigned char** source);<br>
++<br>
+=C2=A0 =C2=A0// Look for a relocation at offset ATTR_OFF in the dwarf inf=
o,<br>
+=C2=A0 =C2=A0// and return the section index and offset of the target.<br=
>
+=C2=A0 =C2=A0unsigned int<br>
+@@ -818,12 +846,20 @@ class Dwarf_info_reader<br>
+=C2=A0 =C2=A0Dwarf_range_list*<br>
+=C2=A0 =C2=A0read_range_list(unsigned int ranges_shndx, off_t ranges_offs=
et)<br>
+=C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 return this-&gt;ranges_table_.read_range_list(this-&gt;obj=
ect_,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0this-&gt;symtab_,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0this-&gt;symtab_size_,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0this-&gt;address_size_,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ranges_shndx,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ranges_offset);<br>
++=C2=A0 =C2=A0 if (this-&gt;cu_version_ &lt; 5)<br>
++=C2=A0 =C2=A0 =C2=A0 return this-&gt;ranges_table_.read_range_list(this-=
&gt;object_,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;symtab_,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;symtab_size_,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;address_size_,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ranges_shndx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ranges_offset);<br>
++=C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 return this-&gt;ranges_table_.read_range_list_v5(th=
is-&gt;object_,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;symtab_,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;symtab_size_,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;address_size_,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges_shndx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges_offset);<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0// Return the object.<br>
+@@ -873,8 +909,8 @@ class Dwarf_info_reader<br>
+=C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0do_read_string_table(unsigned int string_shndx);<br>
+ <br>
+-=C2=A0 // True if this is a type unit; false for a compilation unit.<br>
+-=C2=A0 bool is_type_unit_;<br>
++=C2=A0 // The unit type (DW_UT_xxx).<br>
++=C2=A0 unsigned int unit_type_;<br>
+=C2=A0 =C2=A0// The object containing the .debug_info or .debug_types inp=
ut section.<br>
+=C2=A0 =C2=A0Relobj* object_;<br>
+=C2=A0 =C2=A0// The ELF symbol table.<br>
+@@ -1008,6 +1044,8 @@ class Sized_dwarf_line_info : public Dwarf_line_inf=
o<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0if (this-&gt;buffer_start_ !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0delete[] this-&gt;buffer_start_;<br>
++=C2=A0 =C2=A0 if (this-&gt;str_buffer_start_ !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 delete[] this-&gt;str_buffer_start_;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 private:<br>
+@@ -1030,19 +1068,23 @@ class Sized_dwarf_line_info : public Dwarf_line_i=
nfo<br>
+=C2=A0 =C2=A0void<br>
+=C2=A0 =C2=A0read_relocs();<br>
+ <br>
+-=C2=A0 // Reads the DWARF2/3 header for this line info.=C2=A0 Each takes=
 as input<br>
++=C2=A0 // Reads the DWARF header for this line info.=C2=A0 Each takes as=
 input<br>
+=C2=A0 =C2=A0// a starting buffer position, and returns the ending positi=
on.<br>
+=C2=A0 =C2=A0const unsigned char*<br>
+=C2=A0 =C2=A0read_header_prolog(const unsigned char* lineptr);<br>
+ <br>
+=C2=A0 =C2=A0const unsigned char*<br>
+-=C2=A0 read_header_tables(const unsigned char* lineptr);<br>
++=C2=A0 read_header_tables_v2(const unsigned char* lineptr);<br>
++<br>
++=C2=A0 const unsigned char*<br>
++=C2=A0 read_header_tables_v5(const unsigned char* lineptr);<br>
+ <br>
+-=C2=A0 // Reads the DWARF2/3 line information.=C2=A0 If shndx is non-neg=
ative,<br>
++=C2=A0 // Reads the DWARF line information.=C2=A0 If shndx is non-negati=
ve,<br>
+=C2=A0 =C2=A0// discard all line information that doesn&#39;t pertain to =
the given<br>
+=C2=A0 =C2=A0// section.<br>
+=C2=A0 =C2=A0const unsigned char*<br>
+-=C2=A0 read_lines(const unsigned char* lineptr, unsigned int shndx);<br>
++=C2=A0 read_lines(const unsigned char* lineptr, const unsigned char* end=
ptr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int shndx);<br>
+ <br>
+=C2=A0 =C2=A0// Process a single line info opcode at START using the stat=
e<br>
+=C2=A0 =C2=A0// machine at LSM.=C2=A0 Return true if we should define a l=
ine using the<br>
+@@ -1069,6 +1111,7 @@ class Sized_dwarf_line_info : public Dwarf_line_inf=
o<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0off_t total_length;<br>
+=C2=A0 =C2=A0 =C2=A0int version;<br>
++=C2=A0 =C2=A0 int address_size;<br>
+=C2=A0 =C2=A0 =C2=A0off_t prologue_length;<br>
+=C2=A0 =C2=A0 =C2=A0int min_insn_length; // insn stands for instruction<b=
r>
+=C2=A0 =C2=A0 =C2=A0int max_ops_per_insn; // Added in DWARF-4.<br>
+@@ -1089,6 +1132,20 @@ class Sized_dwarf_line_info : public Dwarf_line_in=
fo<br>
+=C2=A0 =C2=A0// of the buffer.<br>
+=C2=A0 =C2=A0const unsigned char* buffer_start_;<br>
+ <br>
++=C2=A0 // str_buffer is the buffer for the line table strings.<br>
++=C2=A0 const unsigned char* str_buffer_;<br>
++=C2=A0 const unsigned char* str_buffer_end_;<br>
++=C2=A0 // If the buffer was allocated temporarily, and therefore must be=
<br>
++=C2=A0 // deallocated in the dtor, this contains a pointer to the start<=
br>
++=C2=A0 // of the buffer.<br>
++=C2=A0 const unsigned char* str_buffer_start_;<br>
++<br>
++=C2=A0 // Pointer to the end of the header_length field (aka prologue_le=
ngth).<br>
++=C2=A0 const unsigned char* end_of_header_length_;<br>
++<br>
++=C2=A0 // Pointer to the end of the current compilation unit.<br>
++=C2=A0 const unsigned char* end_of_unit_;<br>
++<br>
+=C2=A0 =C2=A0// This has relocations that point into buffer.<br>
+=C2=A0 =C2=A0Sized_elf_reloc_mapper&lt;size, big_endian&gt;* reloc_mapper=
_;<br>
+=C2=A0 =C2=A0// The type of the reloc section in track_relocs_--SHT_REL o=
r SHT_RELA.<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009e6abd05c221e590--
