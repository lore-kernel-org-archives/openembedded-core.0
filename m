Return-Path: <armccurdy@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC9D6FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 20:46:32 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id s39so12191949qth.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Feb 2018 12:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DHfeJxZV074A5CIy51PCGmM+UNR9FRL1w2HiVbTvIcQ=;
	b=KTIZgTc2lEyU/WOg6JbnhfNh7VoUIrG7mUQvJLvNRh6kCnJTbav8K9MFKw6XeDNLw1
	vRugfN4DfQMJ4z7B09zoiRaTUuuE0HNBvWvVZqmbz39X6UqwnD1FReCiju3F3DieZAbL
	JzQIx7ujOzg/YvxujxYZG8lxV33cwRgaT35fh2gyzII16iTRWAh3xjSvaled76Xic/8C
	V9hjfnEJUJ1d73YQLFil362tToDjbQ3R8R9+6EW3m6mXF+7K67d0CZlPt4kAjmut1UAz
	eui7gQu6udlTvXPMukIIQYDxrAUIxLIdabi5goMdtVHovlS0fNsglOOusc5MXnQs9Yqi
	jq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DHfeJxZV074A5CIy51PCGmM+UNR9FRL1w2HiVbTvIcQ=;
	b=p0YOYwZzkGja8AwBXgwYeoxl10oVxGKkm5AU+deEzJPP34rMrYgcoyPCj+FNh6Tfal
	PaNmR8pzVewTX0kHNo+jYSsPTEHQTDn036rJTinj4W4FiRTKWLiZsdQ+7WqcT7zcwnVX
	0TP/zGTid7Xpc8SvXaSKnTnyeSNHBYL6OSYPykmec0D05bbMutemd6aSt7uXYt+gqLYk
	kWoEDcmd8+P/G6k6V29g/mld2DdeogxWYgI5UKHoAa0vhefHN/l+Rw9Hgq4VOz2FntnW
	WUnTIlK/GFvdyAI2XAw00OtTHSa/FirwDIBD9BQZacPLAa8O148e5LibSyxtp6S1LHOl
	l8zg==
X-Gm-Message-State: APf1xPCZPbgO+hrLcJpNsuDKVoH5E1THsA4zLopNh88qrDc39krg1aKW
	QB7RGZFr+a0w+jlwLLccKI+P3A==
X-Google-Smtp-Source: AH8x226xyhUt+NDSAUgmXuzZ9viXVY3VRxrUzWdbyOAkDeQEsbDJ2XYqLKjzpyymFCvU4Q4LWj5ekg==
X-Received: by 10.200.22.170 with SMTP id r39mr6143692qtj.190.1518209193370;
	Fri, 09 Feb 2018 12:46:33 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id f2sm2325615qkb.19.2018.02.09.12.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Feb 2018 12:46:32 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 12:46:14 -0800
Message-Id: <1518209174-18280-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH] binutils: Fix relocation overflow errors with gold
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
X-List-Received-Date: Fri, 09 Feb 2018 20:46:33 -0000

From: Khem Raj <raj.khem@gmail.com>

WPE Webkit fails to link with gold from binutils 2.27 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   2 +
 .../binutils/binutils/PR21152.patch                | 480 +++++++++++++++++++++
 .../improve-relocation-overflow-errors.patch       |  74 ++++
 3 files changed, 556 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/PR21152.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/improve-relocation-overflow-errors.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index 1311b65..e631cc1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -39,6 +39,8 @@ SRC_URI = "\
      file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
      file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch \
      file://0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch \
+     file://PR21152.patch \
+     file://improve-relocation-overflow-errors.patch \
      file://CVE-2017-6965.patch \
      file://CVE-2017-6966.patch \
      file://CVE-2017-6969.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/PR21152.patch b/meta/recipes-devtools/binutils/binutils/PR21152.patch
new file mode 100644
index 0000000..9bd6dbd
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/PR21152.patch
@@ -0,0 +1,480 @@
+This patch adds support for more relocations in relocatable link.  It also
+introduces get_lo16_rel_addend method for finding partnering LO16 relocation
+because there is a problem with current implementation when using --threads
+option.
+
+Regards,
+Vladimir
+
+ChangeLog -
+
+	PR gold/21152
+	* target.h (Sized_target::relocate_special_relocatable): Add
+	reloc_count parameter.
+	* arm.cc (Target_arm::relocate_special_relocatable): Likewise.
+	* target-reloc.h (relocate_relocs): Pass reloc_count to
+	relocate_special_relocatable.
+	* mips.cc (Mips_scan_relocatable_relocs::local_section_strategy):
+	Return RELOC_SPECIAL for more relocations.
+	(Symbol_visitor_check_symbols::operator()): Check for is_output_pic
+	rather then checking output_is_position_independent option.
+	(Target_mips::is_output_pic): New method.
+	(Mips_relocate_functions::get_lo16_rel_addend): Likewise.
+	(Target_mips::set_gp): Add case for relocatable link.
+	(Target_mips::relocate_special_relocatable): Add reloc_count
+	parameter.  Add support for RELA type of relocation sections.
+	Add support for more relocations.  Remove unused code.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/gold/arm.cc b/gold/arm.cc
+index ff472ea..c675065 100644
+--- a/gold/arm.cc
++++ b/gold/arm.cc
+@@ -2341,6 +2341,7 @@ class Target_arm : public Sized_target<32, big_endian>
+ 			       unsigned int sh_type,
+ 			       const unsigned char* preloc_in,
+ 			       size_t relnum,
++			       size_t reloc_count,
+ 			       Output_section* output_section,
+ 			       typename elfcpp::Elf_types<32>::Elf_Off
+                                  offset_in_output_section,
+@@ -10428,6 +10429,7 @@ Target_arm<big_endian>::relocate_special_relocatable(
+     unsigned int sh_type,
+     const unsigned char* preloc_in,
+     size_t relnum,
++    size_t,
+     Output_section* output_section,
+     typename elfcpp::Elf_types<32>::Elf_Off offset_in_output_section,
+     unsigned char* view,
+diff --git a/gold/mips.cc b/gold/mips.cc
+index 95bf6db..52edeac 100644
+--- a/gold/mips.cc
++++ b/gold/mips.cc
+@@ -2858,12 +2858,45 @@ class Mips_scan_relocatable_relocs :
+   local_section_strategy(unsigned int r_type, Relobj* object)
+   {
+     if (Classify_reloc::sh_type == elfcpp::SHT_RELA)
+-      return Relocatable_relocs::RELOC_ADJUST_FOR_SECTION_RELA;
++      {
++        switch (r_type)
++          {
++          case elfcpp::R_MIPS_GPREL32:
++          case elfcpp::R_MIPS_GPREL16:
++          case elfcpp::R_MIPS_LITERAL:
++          case elfcpp::R_MICROMIPS_GPREL16:
++          case elfcpp::R_MICROMIPS_GPREL7_S2:
++          case elfcpp::R_MICROMIPS_LITERAL:
++          case elfcpp::R_MIPS16_GPREL:
++            return Relocatable_relocs::RELOC_SPECIAL;
++
++          default:
++            return Relocatable_relocs::RELOC_ADJUST_FOR_SECTION_RELA;
++          }
++      }
+     else
+       {
+         switch (r_type)
+           {
+           case elfcpp::R_MIPS_26:
++          case elfcpp::R_MIPS_HI16:
++          case elfcpp::R_MIPS_LO16:
++          case elfcpp::R_MIPS_GOT16:
++          case elfcpp::R_MIPS_GPREL32:
++          case elfcpp::R_MIPS_GPREL16:
++          case elfcpp::R_MIPS_LITERAL:
++          case elfcpp::R_MICROMIPS_26_S1:
++          case elfcpp::R_MICROMIPS_HI16:
++          case elfcpp::R_MICROMIPS_LO16:
++          case elfcpp::R_MICROMIPS_GOT16:
++          case elfcpp::R_MICROMIPS_GPREL16:
++          case elfcpp::R_MICROMIPS_GPREL7_S2:
++          case elfcpp::R_MICROMIPS_LITERAL:
++          case elfcpp::R_MIPS16_26:
++          case elfcpp::R_MIPS16_HI16:
++          case elfcpp::R_MIPS16_LO16:
++          case elfcpp::R_MIPS16_GOT16:
++          case elfcpp::R_MIPS16_GPREL:
+             return Relocatable_relocs::RELOC_SPECIAL;
+ 
+           default:
+@@ -3048,7 +3081,7 @@ class Symbol_visitor_check_symbols
+         // stub.
+         if (parameters->options().relocatable())
+           {
+-            if (!parameters->options().output_is_position_independent())
++            if (!this->target_->is_output_pic())
+               mips_sym->set_pic();
+           }
+         else if (mips_sym->has_nonpic_branches())
+@@ -3411,6 +3444,7 @@ class Target_mips : public Sized_target<size, big_endian>
+                                unsigned int sh_type,
+                                const unsigned char* preloc_in,
+                                size_t relnum,
++                               size_t reloc_count,
+                                Output_section* output_section,
+                                typename elfcpp::Elf_types<size>::Elf_Off
+                                  offset_in_output_section,
+@@ -3596,6 +3630,11 @@ class Target_mips : public Sized_target<size, big_endian>
+   is_output_n64() const
+   { return size == 64; }
+ 
++  // Whether the output contains position independent code.
++  bool
++  is_output_pic() const
++  { return (this->processor_specific_flags() & elfcpp::EF_MIPS_PIC) != 0; }
++
+   // Whether the output uses NEWABI.  This is valid only after
+   // merge_obj_e_flags() is called.
+   bool
+@@ -4294,6 +4333,52 @@ class Mips_relocate_functions : public Relocate_functions<size, big_endian>
+   }
+ 
+  public:
++  // Find partnering LO16 relocation and extract addend from the instruction.
++  // Return true on success or false if the LO16 could not be found.
++
++  static bool
++  get_lo16_rel_addend(unsigned int sh_type, const unsigned char* prelocs,
++                      size_t relnum, size_t reloc_count,
++                      unsigned int hi16_r_type, unsigned int hi16_r_sym,
++                      unsigned char* view, Mips_address* addend)
++  {
++    gold_assert(sh_type == elfcpp::SHT_REL);
++
++    typedef typename Mips_reloc_types<elfcpp::SHT_REL, size, big_endian>::Reloc
++        Reltype;
++    const int reloc_size =
++        Mips_classify_reloc<elfcpp::SHT_REL, size, big_endian>::reloc_size;
++
++    // Start finding lo16 part from the next relocation.
++    prelocs += reloc_size;
++    for (size_t i = relnum + 1; i < reloc_count; ++i, prelocs += reloc_size)
++      {
++        Reltype reloc(prelocs);
++        unsigned int r_sym = Mips_classify_reloc<elfcpp::SHT_REL, size,
++                                                 big_endian>::get_r_sym(&reloc);
++        unsigned int r_type = Mips_classify_reloc<elfcpp::SHT_REL, size,
++                                                  big_endian>::
++                                                  get_r_type(&reloc);
++
++        if (hi16_r_sym == r_sym
++            && is_matching_lo16_reloc(hi16_r_type, r_type))
++          {
++            Mips_address offset = reloc.get_r_offset();
++            view += offset;
++
++            mips_reloc_unshuffle(view, r_type, false);
++            Valtype32* wv = reinterpret_cast<Valtype32*>(view);
++            Valtype32 val = elfcpp::Swap<32, big_endian>::readval(wv);
++            mips_reloc_shuffle(view, r_type, false);
++
++            *addend = Bits<16>::sign_extend32(val & 0xffff);
++            return true;
++          }
++      }
++
++    return false;
++  }
++
+   //   R_MIPS16_26 is used for the mips16 jal and jalx instructions.
+   //   Most mips16 instructions are 16 bits, but these instructions
+   //   are 32 bits.
+@@ -8438,6 +8523,23 @@ Target_mips<size, big_endian>::set_gp(Layout* layout, Symbol_table* symtab)
+                                       0, false, false));
+       this->gp_ = gp;
+     }
++
++  if (parameters->options().relocatable())
++    {
++      // If gp is NULL, set it to the default value.
++      if (gp == NULL)
++        gp = static_cast<Sized_symbol<size>*>(symtab->define_as_constant(
++                                      "_gp", NULL, Symbol_table::PREDEFINED,
++                                      MIPS_GP_OFFSET, 0,
++                                      elfcpp::STT_OBJECT,
++                                      elfcpp::STB_GLOBAL,
++                                      elfcpp::STV_DEFAULT,
++                                      0, false, false));
++      // Don't add _gp to the final symtab, because the value of the _gp symbol
++      // will be stored into .reginfo/.MIPS.options section.
++      gp->set_symtab_index(-1U);
++      this->gp_ = gp;
++    }
+ }
+ 
+ // Set the dynamic symbol indexes.  INDEX is the index of the first
+@@ -8576,7 +8678,6 @@ Target_mips<size, big_endian>::make_plt_entry(Symbol_table* symtab,
+   this->plt_->add_entry(gsym, r_type);
+ }
+ 
+-
+ // Get the .MIPS.stubs section, creating it if necessary.
+ 
+ template<int size, bool big_endian>
+@@ -10221,35 +10322,48 @@ Target_mips<size, big_endian>::relocate_special_relocatable(
+     unsigned int sh_type,
+     const unsigned char* preloc_in,
+     size_t relnum,
++    size_t reloc_count,
+     Output_section* output_section,
+     typename elfcpp::Elf_types<size>::Elf_Off offset_in_output_section,
+     unsigned char* view,
+-    Mips_address view_address,
++    Mips_address,
+     section_size_type,
+     unsigned char* preloc_out)
+ {
+-  // We can only handle REL type relocation sections.
+-  gold_assert(sh_type == elfcpp::SHT_REL);
+-
+-  typedef typename Reloc_types<elfcpp::SHT_REL, size, big_endian>::Reloc
+-    Reltype;
+-  typedef typename Reloc_types<elfcpp::SHT_REL, size, big_endian>::Reloc_write
+-    Reltype_write;
+-
+   typedef Mips_relocate_functions<size, big_endian> Reloc_funcs;
+-
+   const Mips_address invalid_address = static_cast<Mips_address>(0) - 1;
+ 
+   Mips_relobj<size, big_endian>* object =
+     Mips_relobj<size, big_endian>::as_mips_relobj(relinfo->object);
+   const unsigned int local_count = object->local_symbol_count();
+ 
+-  Reltype reloc(preloc_in);
+-  Reltype_write reloc_write(preloc_out);
++  unsigned int r_sym;
++  unsigned int r_type;
++  Mips_address r_addend;
++  Mips_address offset;
+ 
+-  elfcpp::Elf_types<32>::Elf_WXword r_info = reloc.get_r_info();
+-  const unsigned int r_sym = elfcpp::elf_r_sym<size>(r_info);
+-  const unsigned int r_type = elfcpp::elf_r_type<size>(r_info);
++  if (sh_type == elfcpp::SHT_RELA)
++    {
++      const Relatype rela(preloc_in);
++      offset = rela.get_r_offset();
++      r_sym = Mips_classify_reloc<elfcpp::SHT_RELA, size, big_endian>::
++          get_r_sym(&rela);
++      r_type = Mips_classify_reloc<elfcpp::SHT_RELA, size, big_endian>::
++          get_r_type(&rela);
++      r_addend = rela.get_r_addend();
++    }
++  else if (sh_type == elfcpp::SHT_REL)
++    {
++      const Reltype rel(preloc_in);
++      offset = rel.get_r_offset();
++      r_sym = Mips_classify_reloc<elfcpp::SHT_REL, size, big_endian>::
++          get_r_sym(&rel);
++      r_type = Mips_classify_reloc<elfcpp::SHT_REL, size, big_endian>::
++          get_r_type(&rel);
++      r_addend = 0;
++    }
++  else
++    gold_unreachable();
+ 
+   // Get the new symbol index.
+   // We only use RELOC_SPECIAL strategy in local relocations.
+@@ -10270,7 +10384,6 @@ Target_mips<size, big_endian>::relocate_special_relocatable(
+   // Get the new offset--the location in the output section where
+   // this relocation should be applied.
+ 
+-  Mips_address offset = reloc.get_r_offset();
+   Mips_address new_offset;
+   if (offset_in_output_section != invalid_address)
+     new_offset = offset + offset_in_output_section;
+@@ -10285,19 +10398,6 @@ Target_mips<size, big_endian>::relocate_special_relocatable(
+       new_offset = new_sot_offset;
+     }
+ 
+-  // In an object file, r_offset is an offset within the section.
+-  // In an executable or dynamic object, generated by
+-  // --emit-relocs, r_offset is an absolute address.
+-  if (!parameters->options().relocatable())
+-    {
+-      new_offset += view_address;
+-      if (offset_in_output_section != invalid_address)
+-        new_offset -= offset_in_output_section;
+-    }
+-
+-  reloc_write.put_r_offset(new_offset);
+-  reloc_write.put_r_info(elfcpp::elf_r_info<32>(new_symndx, r_type));
+-
+   // Handle the reloc addend.
+   // The relocation uses a section symbol in the input file.
+   // We are adjusting it to use a section symbol in the output
+@@ -10306,23 +10406,127 @@ Target_mips<size, big_endian>::relocate_special_relocatable(
+   // file to refer to that same address.  This adjustment to
+   // the addend is the same calculation we use for a simple
+   // absolute relocation for the input section symbol.
+-  Valtype calculated_value = 0;
++  Valtype x = 0;
+   const Symbol_value<size>* psymval = object->local_symbol(r_sym);
+-
++  bool extract_addend = sh_type == elfcpp::SHT_REL;
+   unsigned char* paddend = view + offset;
+   typename Reloc_funcs::Status reloc_status = Reloc_funcs::STATUS_OKAY;
++
++  Reloc_funcs::mips_reloc_unshuffle(paddend, r_type, false);
+   switch (r_type)
+     {
+     case elfcpp::R_MIPS_26:
+-      reloc_status = Reloc_funcs::rel26(paddend, object, psymval,
+-          offset_in_output_section, true, 0, sh_type == elfcpp::SHT_REL, NULL,
+-          false /*TODO(sasa): cross mode jump*/, r_type, this->jal_to_bal(),
+-          false, &calculated_value);
++    case elfcpp::R_MICROMIPS_26_S1:
++    case elfcpp::R_MIPS16_26:
++      gold_assert(extract_addend);
++      reloc_status = Reloc_funcs::rel26(paddend, object, psymval, new_offset,
++                                        true, 0, true, NULL, false, r_type,
++                                        false, false, &x);
++      break;
++
++    case elfcpp::R_MIPS_HI16:
++    case elfcpp::R_MIPS_GOT16:
++    case elfcpp::R_MICROMIPS_HI16:
++    case elfcpp::R_MICROMIPS_GOT16:
++    case elfcpp::R_MIPS16_HI16:
++    case elfcpp::R_MIPS16_GOT16:
++      {
++        gold_assert(extract_addend);
++        Valtype32* wv = reinterpret_cast<Valtype32*>(paddend);
++        Valtype32 val = elfcpp::Swap<32, big_endian>::readval(wv);
++        Valtype addend_lo;
++
++        bool found = Reloc_funcs::get_lo16_rel_addend(sh_type, preloc_in,
++                                                      relnum, reloc_count,
++                                                      r_type, r_sym, view,
++                                                      &addend_lo);
++        if (!found)
++          {
++            gold_error(_("%s: Can't find matching LO16 reloc for relocation %u "
++                         "against local symbol %u at 0x%lx in section %s"),
++                       object->name().c_str(), r_type, r_sym,
++                       (unsigned long) offset,
++                       object->section_name(relinfo->data_shndx).c_str());
++            return;
++          }
++
++        Valtype addend = ((val & 0xffff) << 16) + addend_lo;
++        Valtype value = psymval->value(object, addend);
++        x = ((value + 0x8000) >> 16) & 0xffff;
++        val = Bits<32>::bit_select32(val, x, 0xffff);
++
++        elfcpp::Swap<32, big_endian>::writeval(wv, val);
++        reloc_status = Reloc_funcs::STATUS_OKAY;
++        break;
++      }
++
++    case elfcpp::R_MIPS_LO16:
++    case elfcpp::R_MICROMIPS_LO16:
++    case elfcpp::R_MIPS16_LO16:
++      {
++        gold_assert(extract_addend);
++        Valtype32* wv = reinterpret_cast<Valtype32*>(paddend);
++        Valtype32 val = elfcpp::Swap<32, big_endian>::readval(wv);
++        Valtype addend = Bits<16>::sign_extend32(val & 0xffff);
++
++        x = psymval->value(object, addend);
++        val = Bits<32>::bit_select32(val, x, 0xffff);
++
++        elfcpp::Swap<32, big_endian>::writeval(wv, val);
++        reloc_status = Reloc_funcs::STATUS_OKAY;
++        break;
++      }
++
++    case elfcpp::R_MIPS_GPREL16:
++    case elfcpp::R_MIPS_LITERAL:
++    case elfcpp::R_MICROMIPS_GPREL16:
++    case elfcpp::R_MICROMIPS_GPREL7_S2:
++    case elfcpp::R_MICROMIPS_LITERAL:
++    case elfcpp::R_MIPS16_GPREL:
++      reloc_status = Reloc_funcs::relgprel(paddend, object, psymval,
++                                           this->gp_value(), r_addend,
++                                           extract_addend, true, r_type,
++                                           !extract_addend, &x);
++      break;
++
++    case elfcpp::R_MIPS_GPREL32:
++      reloc_status = Reloc_funcs::relgprel32(paddend, object, psymval,
++                                             this->gp_value(), r_addend,
++                                             extract_addend, !extract_addend,
++                                             &x);
+       break;
+ 
+     default:
+       gold_unreachable();
+     }
++  Reloc_funcs::mips_reloc_shuffle(paddend, r_type, false);
++
++  if (sh_type == elfcpp::SHT_RELA)
++    {
++      typedef typename Mips_reloc_types<elfcpp::SHT_RELA, size,
++                                        big_endian>::Reloc_write Relatype_write;
++      Relatype rela(preloc_in);
++      Relatype_write rela_write(preloc_out);
++
++      rela_write.put_r_offset(new_offset);
++      Mips_classify_reloc<elfcpp::SHT_RELA, size, big_endian>::
++          put_r_info(&rela_write, &rela, new_symndx);
++      Mips_classify_reloc<elfcpp::SHT_RELA, size, big_endian>::
++          put_r_addend(&rela_write, x);
++    }
++  else if (sh_type == elfcpp::SHT_REL)
++    {
++      typedef typename Mips_reloc_types<elfcpp::SHT_REL, size,
++                                        big_endian>::Reloc_write Reltype_write;
++      Reltype rel(preloc_in);
++      Reltype_write rel_write(preloc_out);
++
++      rel_write.put_r_offset(new_offset);
++      Mips_classify_reloc<elfcpp::SHT_REL, size, big_endian>::
++          put_r_info(&rel_write, &rel, new_symndx);
++    }
++  else
++    gold_unreachable();
+ 
+   // Report any errors.
+   switch (reloc_status)
+@@ -10330,11 +10534,11 @@ Target_mips<size, big_endian>::relocate_special_relocatable(
+     case Reloc_funcs::STATUS_OKAY:
+       break;
+     case Reloc_funcs::STATUS_OVERFLOW:
+-      gold_error_at_location(relinfo, relnum, reloc.get_r_offset(),
++      gold_error_at_location(relinfo, relnum, offset,
+                              _("relocation overflow"));
+       break;
+     case Reloc_funcs::STATUS_BAD_RELOC:
+-      gold_error_at_location(relinfo, relnum, reloc.get_r_offset(),
++      gold_error_at_location(relinfo, relnum, offset,
+         _("unexpected opcode while processing relocation"));
+       break;
+     default:
+diff --git a/gold/target-reloc.h b/gold/target-reloc.h
+index c8b86c6..536118e 100644
+--- a/gold/target-reloc.h
++++ b/gold/target-reloc.h
+@@ -767,7 +767,8 @@ relocate_relocs(
+ 	  Sized_target<size, big_endian>* target =
+ 	    parameters->sized_target<size, big_endian>();
+ 	  target->relocate_special_relocatable(relinfo, Classify_reloc::sh_type,
+-					       prelocs, i, output_section,
++					       prelocs, i, reloc_count,
++					       output_section,
+ 					       offset_in_output_section,
+ 					       view, view_address,
+ 					       view_size, pwrite);
+diff --git a/gold/target.h b/gold/target.h
+index 5ca8435..e43623a 100644
+--- a/gold/target.h
++++ b/gold/target.h
+@@ -993,6 +993,7 @@ class Sized_target : public Target
+ 			       unsigned int /* sh_type */,
+ 			       const unsigned char* /* preloc_in */,
+ 			       size_t /* relnum */,
++			       size_t /* reloc_count */,
+ 			       Output_section* /* output_section */,
+ 			       typename elfcpp::Elf_types<size>::Elf_Off
diff --git a/meta/recipes-devtools/binutils/binutils/improve-relocation-overflow-errors.patch b/meta/recipes-devtools/binutils/binutils/improve-relocation-overflow-errors.patch
new file mode 100644
index 0000000..dd08d73
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/improve-relocation-overflow-errors.patch
@@ -0,0 +1,74 @@
+This patch improves relocation overflow errors.
+Depends on https://sourceware.org/ml/binutils/2017-03/msg00146.html.
+
+Regards,
+Vladimir
+
+ChangeLog -
+
+	* mips.cc (Target_mips::Relocate::relocate): Improve relocation
+	overflow error message.
+	(Target_mips::relocate_special_relocatable): Likewise.
+	(Mips_relocate_functions::rel26): Don't print relocation overflow
+	error message.
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/gold/mips.cc b/gold/mips.cc
+index 10dea9e7..bd9bac0 100644
+--- a/gold/mips.cc
++++ b/gold/mips.cc
+@@ -4676,15 +4676,9 @@ class Mips_relocate_functions : public Relocate_functions<size, big_endian>
+       }
+     x = psymval->value(object, x) >> shift;
+ 
+-    if (!calculate_only && !local && !gsym->is_weak_undefined())
+-      {
+-        if ((x >> 26) != ((address + 4) >> (26 + shift)))
+-          {
+-            gold_error(_("relocation truncated to fit: %u against '%s'"),
+-                       r_type, gsym->name());
+-            return This::STATUS_OVERFLOW;
+-          }
+-      }
++    if (!calculate_only && !local && !gsym->is_weak_undefined()
++        && ((x >> 26) != ((address + 4) >> (26 + shift))))
++      return This::STATUS_OVERFLOW;
+ 
+     val = Bits<32>::bit_select32(val, x, 0x03ffffff);
+ 
+@@ -10510,7 +10504,9 @@ Target_mips<size, big_endian>::relocate_special_relocatable(
+       break;
+     case Reloc_funcs::STATUS_OVERFLOW:
+       gold_error_at_location(relinfo, relnum, offset,
+-                             _("relocation overflow"));
++                             _("relocation overflow: "
++                               "%u against local symbol %u in %s"),
++                             r_type, r_sym, object->name().c_str());
+       break;
+     case Reloc_funcs::STATUS_BAD_RELOC:
+       gold_error_at_location(relinfo, relnum, offset,
+@@ -12391,8 +12387,21 @@ Target_mips<size, big_endian>::Relocate::relocate(
+     case Reloc_funcs::STATUS_OKAY:
+       break;
+     case Reloc_funcs::STATUS_OVERFLOW:
+-      gold_error_at_location(relinfo, relnum, r_offset,
+-                             _("relocation overflow"));
++      if (gsym == NULL)
++        gold_error_at_location(relinfo, relnum, r_offset,
++                               _("relocation overflow: "
++                                 "%u against local symbol %u in %s"),
++                               r_type, r_sym, object->name().c_str());
++      else if (gsym->is_defined() && gsym->source() == Symbol::FROM_OBJECT)
++        gold_error_at_location(relinfo, relnum, r_offset,
++                               _("relocation overflow: "
++                                 "%u against '%s' defined in %s"),
++                               r_type, gsym->demangled_name().c_str(),
++                               gsym->object()->name().c_str());
++      else
++        gold_error_at_location(relinfo, relnum, r_offset,
++                               _("relocation overflow: %u against '%s'"),
++                               r_type, gsym->demangled_name().c_str());
+       break;
+     case Reloc_funcs::STATUS_BAD_RELOC:
+       gold_error_at_location(relinfo, relnum, r_offset,
-- 
1.9.1


