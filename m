Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.200.1630174468536594794
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FJ88JIHt;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.49, mailfrom: steve@sakoman.com)
Received: by mail-io1-f49.google.com with SMTP id n24so13513873ion.10
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+XbJAapAsjexINx4xEe07Sw84weRlIDJ+TB2cXyOFAw=;
        b=FJ88JIHtiS8E1BbNlSQN1tDEZiTbDWDkQk5LLOZArRf5OG0+53UczC3/WV8SbchAf3
         pSK4XRyU/woivVpa4SWztb4CM2N44+3YuuMXZ+TEr11SntVmxucuEe2GKnFBCbG6FSqp
         QeTcrRPd1HfT9y0RQaPOvRXhILP7GSYftdsbumJv1xzZRFDmUe0kqa5TxHdzkM1vYnez
         lQ0Lg9U3vVpRz5qaPR3NQP3HHzGiHoL853HznTvG7uEfMAEm7h/hl2HRyA3hYf8P6c4G
         ScwEqSgbokRjW7w61Z331xs4FG9wWD0BcLjO+6UCubUKpJdwCEVioXvFObx2ZztyZexW
         7DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+XbJAapAsjexINx4xEe07Sw84weRlIDJ+TB2cXyOFAw=;
        b=X1wqZKe0DSO6FYKZVqAdHNCqqkUwHOPCoP8S+A1OTCq6lq27sZiaq0ff0U76lV3Qxb
         b7I4EkTe88KMNLBj3Pzdr+Jr1H2tjJ8X2rjMm4+Fhsz+9vCyASdEywX3/XrADTzjSURA
         u3CQuOexA2UIfWa9ATEKJQZs9MilJ61NJUoKBSOzh+op+1hz67eJTPf/rnGKL9jmPLPk
         L2p+G6twgLb/3kn29WmO6O52cyv/sIXDtyyFVDi3XBawDht0oIrwWakq0zKn3k2krBhR
         oZZDiUaSzv2orwn1DxntuV0//IWCyWdBTebI7N0/nQgikefiv6mAPmjRHq0dqw9goNj6
         bvFg==
X-Gm-Message-State: AOAM530xfcIJdmXF3PSKXxTWWSLZfQN0SwBkCHNdsE0Hmo5GxQ1eGnMw
	TE/FxYKCKBuOOc9GjH00/sxZp5oIxfhmSbOX
X-Google-Smtp-Source: ABdhPJz+YAyy2pSNhO680Q5YUHpRKoyqJb7HjyVoU9wcyuO/w1C2hJPHw2kL3nKnkk4aiH1zjI1x8A==
X-Received: by 2002:a05:6638:328d:: with SMTP id f13mr13359857jav.105.1630174467206;
        Sat, 28 Aug 2021 11:14:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:14:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/36] mklibs-native: drop deprecated cpp17 exceptions
Date: Sat, 28 Aug 2021 08:11:18 -1000
Message-Id: <ef8b7946b4793db653ef7dd716e1d3f919a84725.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrej Valek <andrej.valek@siemens.com>

gcc11 has -std=gnu++17 as default. Remove deprecated C++17 exceptions based
on http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ecated-exception-specification-cpp17.patch | 431 ++++++++++++++++++
 .../mklibs/mklibs-native_0.1.44.bb            |   1 +
 2 files changed, 432 insertions(+)
 create mode 100644 meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch

diff --git a/meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch b/meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch
new file mode 100644
index 0000000000..f96cc7d302
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch
@@ -0,0 +1,431 @@
+From 597c7a8333df84a87cc48fb8477b603ffbf372a6 Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.valek@siemens.com>
+Date: Mon, 23 Aug 2021 12:45:11 +0200
+Subject: [PATCH] feat(cpp17): remove deprecated exception specifications for
+ C++ 17
+
+Upstream-Status: Submitted [https://salsa.debian.org/installer-team/mklibs/-/merge_requests/2]
+
+based on: http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
+
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+---
+ src/mklibs-readelf/elf.cpp      | 48 ++++++++++++++++++++---------------------
+ src/mklibs-readelf/elf.hpp      | 18 ++++++++--------
+ src/mklibs-readelf/elf_data.hpp | 36 +++++++++++++++----------------
+ 3 files changed, 51 insertions(+), 51 deletions(-)
+
+diff --git a/src/mklibs-readelf/elf.cpp b/src/mklibs-readelf/elf.cpp
+index 0e4c0f3..2e6d0f6 100644
+--- a/src/mklibs-readelf/elf.cpp
++++ b/src/mklibs-readelf/elf.cpp
+@@ -36,7 +36,7 @@ file::~file () throw ()
+     delete *it;
+ }
+ 
+-file *file::open (const char *filename) throw (std::bad_alloc, std::runtime_error)
++file *file::open (const char *filename) throw ()
+ {
+   struct stat buf;
+   int fd;
+@@ -72,7 +72,7 @@ file *file::open (const char *filename) throw (std::bad_alloc, std::runtime_erro
+ }
+ 
+ template<typename _class>
+-file *file::open_class(uint8_t *mem, size_t len) throw (std::bad_alloc, std::runtime_error)
++file *file::open_class(uint8_t *mem, size_t len) throw ()
+ {
+   switch (mem[EI_DATA])
+   {
+@@ -86,7 +86,7 @@ file *file::open_class(uint8_t *mem, size_t len) throw (std::bad_alloc, std::run
+ }
+ 
+ template <typename _class, typename _data>
+-file_data<_class, _data>::file_data(uint8_t *mem, size_t len) throw (std::bad_alloc, std::runtime_error)
++file_data<_class, _data>::file_data(uint8_t *mem, size_t len) throw ()
+ : file(mem, len)
+ {
+   if (mem[EI_CLASS] != _class::id)
+@@ -190,7 +190,7 @@ section_data<_class, _data>::section_data(Shdr *shdr, uint8_t *mem) throw ()
+ }
+ 
+ template <typename _class, typename _data>
+-void section_data<_class, _data>::update(const file &file) throw (std::bad_alloc)
++void section_data<_class, _data>::update(const file &file) throw ()
+ {
+   const section_type<section_type_STRTAB> &section =
+     dynamic_cast<const section_type<section_type_STRTAB> &>(file.get_section(file.get_shstrndx()));
+@@ -204,7 +204,7 @@ section_type<section_type_DYNAMIC>::~section_type() throw ()
+ }
+ 
+ template <typename _class, typename _data>
+-section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr *header, uint8_t *mem) throw ()
+ : section_data<_class, _data>(header, mem)
+ {
+   if (this->type != SHT_DYNAMIC)
+@@ -221,7 +221,7 @@ section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr *header, ui
+ }
+ 
+ template <typename _class, typename _data>
+-void section_real<_class, _data, section_type_DYNAMIC>::update(const file &file) throw (std::bad_alloc)
++void section_real<_class, _data, section_type_DYNAMIC>::update(const file &file) throw ()
+ {
+   section_data<_class, _data>::update(file);
+ 
+@@ -243,7 +243,7 @@ section_type<section_type_DYNSYM>::~section_type() throw ()
+ }
+ 
+ template <typename _class, typename _data>
+-section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr *header, uint8_t *mem) throw ()
+ : section_data<_class, _data>(header, mem)
+ {
+   if (this->type != SHT_DYNSYM)
+@@ -260,7 +260,7 @@ section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr *header, uin
+ }
+ 
+ template <typename _class, typename _data>
+-void section_real<_class, _data, section_type_DYNSYM>::update(const file &file) throw (std::bad_alloc)
++void section_real<_class, _data, section_type_DYNSYM>::update(const file &file) throw ()
+ {
+   section_data<_class, _data>::update (file);
+ 
+@@ -285,7 +285,7 @@ const version_definition *section_type<section_type_GNU_VERDEF>::get_version_def
+ }
+ 
+ template <typename _class, typename _data>
+-section_real<_class, _data, section_type_GNU_VERDEF>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real<_class, _data, section_type_GNU_VERDEF>::section_real(Shdr *header, uint8_t *mem) throw ()
+ : section_data<_class, _data>(header, mem)
+ {
+   if (this->type != SHT_GNU_verdef)
+@@ -307,7 +307,7 @@ section_real<_class, _data, section_type_GNU_VERDEF>::section_real(Shdr *header,
+ }
+ 
+ template <typename _class, typename _data>
+-void section_real<_class, _data, section_type_GNU_VERDEF>::update(const file &file) throw (std::bad_alloc)
++void section_real<_class, _data, section_type_GNU_VERDEF>::update(const file &file) throw ()
+ {
+   section_data<_class, _data>::update(file);
+ 
+@@ -333,7 +333,7 @@ const version_requirement_entry *section_type<section_type_GNU_VERNEED>::get_ver
+ 
+ template <typename _class, typename _data>
+ section_real<_class, _data, section_type_GNU_VERNEED>::
+-section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real(Shdr *header, uint8_t *mem) throw ()
+ : section_data<_class, _data> (header, mem)
+ {
+   if (this->type != SHT_GNU_verneed)
+@@ -355,7 +355,7 @@ section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
+ }
+ 
+ template <typename _class, typename _data>
+-void section_real<_class, _data, section_type_GNU_VERNEED>::update(const file &file) throw (std::bad_alloc)
++void section_real<_class, _data, section_type_GNU_VERNEED>::update(const file &file) throw ()
+ {
+   section_data<_class, _data>::update(file);
+ 
+@@ -372,7 +372,7 @@ void section_real<_class, _data, section_type_GNU_VERNEED>::update(const file &f
+ 
+ template <typename _class, typename _data>
+ section_real<_class, _data, section_type_GNU_VERSYM>::
+-section_real (Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real (Shdr *header, uint8_t *mem) throw ()
+ : section_data<_class, _data> (header, mem)
+ {
+   if (this->type != SHT_GNU_versym)
+@@ -399,7 +399,7 @@ segment_data<_class, _data>::segment_data (Phdr *phdr, uint8_t *mem) throw ()
+ }
+ 
+ template <typename _class, typename _data>
+-segment_real<_class, _data, segment_type_INTERP>::segment_real (Phdr *header, uint8_t *mem) throw (std::bad_alloc)
++segment_real<_class, _data, segment_type_INTERP>::segment_real (Phdr *header, uint8_t *mem) throw ()
+ : segment_data<_class, _data> (header, mem)
+ {
+   if (this->type != PT_INTERP)
+@@ -429,13 +429,13 @@ dynamic_data<_class, _data>::dynamic_data (Dyn *dyn) throw ()
+ }
+ 
+ template <typename _class, typename _data>
+-void dynamic_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++void dynamic_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw ()
+ {
+   if (is_string)
+     val_string = section.get_string(val);
+ }
+ 
+-std::string symbol::get_version () const throw (std::bad_alloc)
++std::string symbol::get_version () const throw ()
+ {
+   if (verneed)
+     return verneed->get_name();
+@@ -445,7 +445,7 @@ std::string symbol::get_version () const throw (std::bad_alloc)
+   return "Base";
+ }
+ 
+-std::string symbol::get_version_file () const throw (std::bad_alloc)
++std::string symbol::get_version_file () const throw ()
+ {
+   if (verneed)
+     return verneed->get_file();
+@@ -453,7 +453,7 @@ std::string symbol::get_version_file () const throw (std::bad_alloc)
+   return "None";
+ }
+ 
+-std::string symbol::get_name_version () const throw (std::bad_alloc)
++std::string symbol::get_name_version () const throw ()
+ {
+   std::string ver;
+ 
+@@ -478,13 +478,13 @@ symbol_data<_class, _data>::symbol_data (Sym *sym) throw ()
+ }
+ 
+ template <typename _class, typename _data>
+-void symbol_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++void symbol_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw ()
+ {
+   name_string = section.get_string(name);
+ }
+ 
+ template <typename _class, typename _data>
+-void symbol_data<_class, _data>::update_version(const file &file, uint16_t index) throw (std::bad_alloc)
++void symbol_data<_class, _data>::update_version(const file &file, uint16_t index) throw ()
+ {
+   if (!file.get_section_GNU_VERSYM())
+     return;
+@@ -531,13 +531,13 @@ version_definition_data<_class, _data>::version_definition_data (Verdef *verdef)
+ }
+ 
+ template <typename _class, typename _data>
+-void version_definition_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++void version_definition_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw ()
+ {
+   for (std::vector<uint32_t>::iterator it = names.begin(); it != names.end(); ++it)
+     names_string.push_back(section.get_string(*it));
+ }
+ 
+-version_requirement::version_requirement() throw (std::bad_alloc)
++version_requirement::version_requirement() throw ()
+ : file_string("None")
+ { }
+ 
+@@ -561,7 +561,7 @@ version_requirement_data<_class, _data>::version_requirement_data (Verneed *vern
+ 
+ template <typename _class, typename _data>
+ void version_requirement_data<_class, _data>::
+-update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++update_string(const section_type<section_type_STRTAB> &section) throw ()
+ {
+   file_string = section.get_string(file);
+ 
+@@ -596,7 +596,7 @@ version_requirement_entry_data(Vernaux *vna, const version_requirement &verneed)
+ 
+ template <typename _class, typename _data>
+ void version_requirement_entry_data<_class, _data>::
+-update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++update_string(const section_type<section_type_STRTAB> &section) throw ()
+ {
+   name_string = section.get_string(name);
+ }
+diff --git a/src/mklibs-readelf/elf.hpp b/src/mklibs-readelf/elf.hpp
+index 70e61cd..afb0c9e 100644
+--- a/src/mklibs-readelf/elf.hpp
++++ b/src/mklibs-readelf/elf.hpp
+@@ -49,7 +49,7 @@ namespace Elf
+       const uint16_t get_shstrndx() const throw () { return shstrndx; }
+ 
+       const std::vector<section *> get_sections() const throw () { return sections; };
+-      const section &get_section(unsigned int i) const throw (std::out_of_range) { return *sections.at(i); };
++      const section &get_section(unsigned int i) const throw () { return *sections.at(i); };
+       const section_type<section_type_DYNAMIC> *get_section_DYNAMIC() const throw () { return section_DYNAMIC; };
+       const section_type<section_type_DYNSYM> *get_section_DYNSYM() const throw () { return section_DYNSYM; };
+       const section_type<section_type_GNU_VERDEF> *get_section_GNU_VERDEF() const throw () { return section_GNU_VERDEF; };
+@@ -59,13 +59,13 @@ namespace Elf
+       const std::vector<segment *> get_segments() const throw () { return segments; };
+       const segment_type<segment_type_INTERP> *get_segment_INTERP() const throw () { return segment_INTERP; };
+ 
+-      static file *open(const char *filename) throw (std::bad_alloc, std::runtime_error);
++      static file *open(const char *filename) throw ();
+ 
+     protected:
+-      file(uint8_t *mem, size_t len) throw (std::bad_alloc) : mem(mem), len(len) { }
++      file(uint8_t *mem, size_t len) throw () : mem(mem), len(len) { }
+ 
+       template<typename _class>
+-        static file *open_class(uint8_t *, size_t) throw (std::bad_alloc, std::runtime_error);
++        static file *open_class(uint8_t *, size_t) throw ();
+ 
+       uint16_t type;
+       uint16_t machine;
+@@ -128,7 +128,7 @@ namespace Elf
+     class section_type<section_type_STRTAB> : public virtual section
+     {
+       public:
+-        std::string get_string(uint32_t offset) const throw (std::bad_alloc)
++        std::string get_string(uint32_t offset) const throw ()
+         {
+           return std::string(reinterpret_cast<const char *> (mem + offset));
+         }
+@@ -263,10 +263,10 @@ namespace Elf
+       uint8_t get_bind () const throw () { return bind; }
+       uint8_t get_type () const throw () { return type; }
+       const std::string &get_name_string() const throw () { return name_string; }
+-      std::string get_version() const throw (std::bad_alloc);
+-      std::string get_version_file() const throw (std::bad_alloc);
++      std::string get_version() const throw ();
++      std::string get_version_file() const throw ();
+       uint16_t get_version_data() const throw () { return versym; }
+-      std::string get_name_version() const throw (std::bad_alloc);
++      std::string get_name_version() const throw ();
+ 
+     protected:
+       uint32_t name;
+@@ -305,7 +305,7 @@ namespace Elf
+   class version_requirement
+   {
+     public:
+-      version_requirement() throw (std::bad_alloc);
++      version_requirement() throw ();
+       virtual ~version_requirement () throw () { }
+ 
+       const std::string &get_file() const throw () { return file_string; }
+diff --git a/src/mklibs-readelf/elf_data.hpp b/src/mklibs-readelf/elf_data.hpp
+index 05effee..3871982 100644
+--- a/src/mklibs-readelf/elf_data.hpp
++++ b/src/mklibs-readelf/elf_data.hpp
+@@ -94,7 +94,7 @@ namespace Elf
+     class file_data : public file
+     {
+       public:
+-        file_data(uint8_t *, size_t len) throw (std::bad_alloc, std::runtime_error);
++        file_data(uint8_t *, size_t len) throw ();
+ 
+         const uint8_t get_class() const throw () { return _class::id; }
+         const uint8_t get_data() const throw () { return _data::id; }
+@@ -109,7 +109,7 @@ namespace Elf
+       public:
+         section_data(Shdr *, uint8_t *) throw ();
+ 
+-        virtual void update(const file &) throw (std::bad_alloc);
++        virtual void update(const file &) throw ();
+     };
+ 
+   template <typename _class, typename _data, typename _type>
+@@ -133,9 +133,9 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *) throw ();
+ 
+-        void update(const file &) throw (std::bad_alloc);
++        void update(const file &) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -147,9 +147,9 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *) throw ();
+ 
+-        void update(const file &) throw (std::bad_alloc);
++        void update(const file &) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -161,9 +161,9 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *) throw ();
+ 
+-        void update(const file &) throw (std::bad_alloc);
++        void update(const file &) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -175,9 +175,9 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *) throw ();
+ 
+-        void update(const file &) throw (std::bad_alloc);
++        void update(const file &) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -189,7 +189,7 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -220,7 +220,7 @@ namespace Elf
+         typedef typename _elfdef<_class>::Phdr Phdr;
+ 
+       public:
+-        segment_real (Phdr *, uint8_t *) throw (std::bad_alloc);
++        segment_real (Phdr *, uint8_t *) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -232,7 +232,7 @@ namespace Elf
+       public:
+         dynamic_data (Dyn *) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -244,8 +244,8 @@ namespace Elf
+       public:
+         symbol_data (Sym *) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
+-        virtual void update_version (const file &, uint16_t) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &) throw ();
++        virtual void update_version (const file &, uint16_t) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -257,7 +257,7 @@ namespace Elf
+ 
+         version_definition_data (Verdef *) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -269,7 +269,7 @@ namespace Elf
+ 
+         version_requirement_data (Verneed *) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &) throw ();
+     };
+ 
+   template <typename _class, typename _data>
+@@ -280,7 +280,7 @@ namespace Elf
+ 
+         version_requirement_entry_data (Vernaux *, const version_requirement &) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &) throw ();
+     };
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
index 1784af1f4c..07142e57e0 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/
 	file://avoid-failure-on-symbol-provided-by-application.patch \
 	file://show-GNU-unique-symbols-as-provided-symbols.patch \
 	file://fix_cross_compile.patch \
+	file://remove-deprecated-exception-specification-cpp17.patch \
 "
 
 SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
-- 
2.25.1

