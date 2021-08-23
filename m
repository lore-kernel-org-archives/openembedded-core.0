Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.26195.1629735040643298779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 09:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LrsgS0jY;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id k14so17100015pga.13
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=6Vxbh5UJdy55OsN84oX3Q3eb2O6xTimsUuLdJ2NU6Yo=;
        b=LrsgS0jYnYK7yDkEYyue5rTE77zzfjPlhH4fviB2d5ui9qWO+CFJ0G4MYV/2zuFMu2
         KFHkCWR/Gsjzz3mjPGPqbBe7cSQ7PE2koA3wOcFKeaWee3kmk/rn0X/n8UtkGt86proC
         HNa8otf3mTLRt6XMxAzPONCYS22C2IKZtYPYcAT+yiLQs8MiQNRXC35RAi697oda1VUb
         mwtnEn9tdvmvuGPcKNrVmktq+gB9NBZNxHUSj9UgqEi/rXPzgcHDiie7scWGwzGYpYic
         PSlQhL96r5TsQ1iAF9QXAha0/kTUMe0TDeCHWu9bfEPFiIj7FndYRTVPbU+CADPZgtma
         JqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=6Vxbh5UJdy55OsN84oX3Q3eb2O6xTimsUuLdJ2NU6Yo=;
        b=GrkouO8KgvXVZlD3C74VFZJOJGa7V/IMiYxfy9tbeSsESfknUooIchZWg97tkt5u1w
         udIYrFW5JlyHp3JLZ9D/VyD/iTFmXhbuDJxiu1LOv0Uur1DTrfEzeRx1EO4ePK85NhGc
         2nhI/fHOlIoS9BSjALPcvZq6eITKqNrlzUC0+rUuQLN5nijswu3/amBOeQftwFhWJQrJ
         nwSkmFqZgtqOuN7mqnaInaH72xQlBBLkGZ4ZSAuKWVtYTRRurTWBBd9IWK/xk+wzcLaq
         48Q9pfL4TN+u8rvd2nq1dKTlclEAOjjePYeidAnzonJkENDq1KDJRuWUwmNCLCZoztk/
         G8TA==
X-Gm-Message-State: AOAM531ISIFcVpgmUeRC9/R9SYQYeUxPtJIBtIRaggP/9OFeb70APxKg
	7zypyIFUOzKVUk56JfC2kP4=
X-Google-Smtp-Source: ABdhPJxXmC2SxKIuSdI1zjRRd++rAjKEXOuyM4IvUbFl7I1GI8p0lLwAtGo7ifT7V0JmdlduD1tnsA==
X-Received: by 2002:a63:6c5:: with SMTP id 188mr33221928pgg.39.1629735040071;
        Mon, 23 Aug 2021 09:10:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:7cf5:888d:b618:582d? ([2601:646:9200:a0f0:7cf5:888d:b618:582d])
        by smtp.gmail.com with UTF8SMTPSA id h13sm18750939pgh.93.2021.08.23.09.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:10:39 -0700 (PDT)
Message-ID: <74f0f004-bc3b-a979-a092-e937f0a375c9@gmail.com>
Date: Mon, 23 Aug 2021 09:10:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.1
Subject: Re: [OE-core][dunfell][PATCH] mklibs-native: drop deprecated cpp17 exceptions
To: Andrej Valek <andrej.valek@siemens.com>,
 openembedded-core@lists.openembedded.org
References: <20210823105648.31311-1-andrej.valek@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210823105648.31311-1-andrej.valek@siemens.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/23/21 3:56 AM, Andrej Valek wrote:
> gcc11 has -std=gnu++17 as default. Remove deprecated C++17 exceptions based
> on http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>   ...-deprecated-exception-specification-cpp17.patch | 431 +++++++++++++++++++++
>   .../mklibs/mklibs-native_0.1.44.bb                 |   1 +
>   2 files changed, 432 insertions(+)
>   create mode 100644 meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch
> 
> diff --git a/meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch b/meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch
> new file mode 100644
> index 0000000000..0c4c911976
> --- /dev/null
> +++ b/meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch
> @@ -0,0 +1,431 @@
> +From 597c7a8333df84a87cc48fb8477b603ffbf372a6 Mon Sep 17 00:00:00 2001
> +From: Andrej Valek <andrej.valek@siemens.com>
> +Date: Mon, 23 Aug 2021 12:45:11 +0200
> +Subject: [PATCH] feat(cpp17): remove deprecated exception specifications for
> + C++ 17
> +
> +Upstream-Status: Submitted

the patch is good. Can you add link to upstream submission here ?

> +
> +based on: http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
> +
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +---
> + src/mklibs-readelf/elf.cpp      | 48 ++++++++++++++++++++---------------------
> + src/mklibs-readelf/elf.hpp      | 18 ++++++++--------
> + src/mklibs-readelf/elf_data.hpp | 36 +++++++++++++++----------------
> + 3 files changed, 51 insertions(+), 51 deletions(-)
> +
> +diff --git a/src/mklibs-readelf/elf.cpp b/src/mklibs-readelf/elf.cpp
> +index 0e4c0f3..2e6d0f6 100644
> +--- a/src/mklibs-readelf/elf.cpp
> ++++ b/src/mklibs-readelf/elf.cpp
> +@@ -36,7 +36,7 @@ file::~file () throw ()
> +     delete *it;
> + }
> +
> +-file *file::open (const char *filename) throw (std::bad_alloc, std::runtime_error)
> ++file *file::open (const char *filename) throw ()
> + {
> +   struct stat buf;
> +   int fd;
> +@@ -72,7 +72,7 @@ file *file::open (const char *filename) throw (std::bad_alloc, std::runtime_erro
> + }
> +
> + template<typename _class>
> +-file *file::open_class(uint8_t *mem, size_t len) throw (std::bad_alloc, std::runtime_error)
> ++file *file::open_class(uint8_t *mem, size_t len) throw ()
> + {
> +   switch (mem[EI_DATA])
> +   {
> +@@ -86,7 +86,7 @@ file *file::open_class(uint8_t *mem, size_t len) throw (std::bad_alloc, std::run
> + }
> +
> + template <typename _class, typename _data>
> +-file_data<_class, _data>::file_data(uint8_t *mem, size_t len) throw (std::bad_alloc, std::runtime_error)
> ++file_data<_class, _data>::file_data(uint8_t *mem, size_t len) throw ()
> + : file(mem, len)
> + {
> +   if (mem[EI_CLASS] != _class::id)
> +@@ -190,7 +190,7 @@ section_data<_class, _data>::section_data(Shdr *shdr, uint8_t *mem) throw ()
> + }
> +
> + template <typename _class, typename _data>
> +-void section_data<_class, _data>::update(const file &file) throw (std::bad_alloc)
> ++void section_data<_class, _data>::update(const file &file) throw ()
> + {
> +   const section_type<section_type_STRTAB> &section =
> +     dynamic_cast<const section_type<section_type_STRTAB> &>(file.get_section(file.get_shstrndx()));
> +@@ -204,7 +204,7 @@ section_type<section_type_DYNAMIC>::~section_type() throw ()
> + }
> +
> + template <typename _class, typename _data>
> +-section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
> ++section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr *header, uint8_t *mem) throw ()
> + : section_data<_class, _data>(header, mem)
> + {
> +   if (this->type != SHT_DYNAMIC)
> +@@ -221,7 +221,7 @@ section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr *header, ui
> + }
> +
> + template <typename _class, typename _data>
> +-void section_real<_class, _data, section_type_DYNAMIC>::update(const file &file) throw (std::bad_alloc)
> ++void section_real<_class, _data, section_type_DYNAMIC>::update(const file &file) throw ()
> + {
> +   section_data<_class, _data>::update(file);
> +
> +@@ -243,7 +243,7 @@ section_type<section_type_DYNSYM>::~section_type() throw ()
> + }
> +
> + template <typename _class, typename _data>
> +-section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
> ++section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr *header, uint8_t *mem) throw ()
> + : section_data<_class, _data>(header, mem)
> + {
> +   if (this->type != SHT_DYNSYM)
> +@@ -260,7 +260,7 @@ section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr *header, uin
> + }
> +
> + template <typename _class, typename _data>
> +-void section_real<_class, _data, section_type_DYNSYM>::update(const file &file) throw (std::bad_alloc)
> ++void section_real<_class, _data, section_type_DYNSYM>::update(const file &file) throw ()
> + {
> +   section_data<_class, _data>::update (file);
> +
> +@@ -285,7 +285,7 @@ const version_definition *section_type<section_type_GNU_VERDEF>::get_version_def
> + }
> +
> + template <typename _class, typename _data>
> +-section_real<_class, _data, section_type_GNU_VERDEF>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
> ++section_real<_class, _data, section_type_GNU_VERDEF>::section_real(Shdr *header, uint8_t *mem) throw ()
> + : section_data<_class, _data>(header, mem)
> + {
> +   if (this->type != SHT_GNU_verdef)
> +@@ -307,7 +307,7 @@ section_real<_class, _data, section_type_GNU_VERDEF>::section_real(Shdr *header,
> + }
> +
> + template <typename _class, typename _data>
> +-void section_real<_class, _data, section_type_GNU_VERDEF>::update(const file &file) throw (std::bad_alloc)
> ++void section_real<_class, _data, section_type_GNU_VERDEF>::update(const file &file) throw ()
> + {
> +   section_data<_class, _data>::update(file);
> +
> +@@ -333,7 +333,7 @@ const version_requirement_entry *section_type<section_type_GNU_VERNEED>::get_ver
> +
> + template <typename _class, typename _data>
> + section_real<_class, _data, section_type_GNU_VERNEED>::
> +-section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
> ++section_real(Shdr *header, uint8_t *mem) throw ()
> + : section_data<_class, _data> (header, mem)
> + {
> +   if (this->type != SHT_GNU_verneed)
> +@@ -355,7 +355,7 @@ section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
> + }
> +
> + template <typename _class, typename _data>
> +-void section_real<_class, _data, section_type_GNU_VERNEED>::update(const file &file) throw (std::bad_alloc)
> ++void section_real<_class, _data, section_type_GNU_VERNEED>::update(const file &file) throw ()
> + {
> +   section_data<_class, _data>::update(file);
> +
> +@@ -372,7 +372,7 @@ void section_real<_class, _data, section_type_GNU_VERNEED>::update(const file &f
> +
> + template <typename _class, typename _data>
> + section_real<_class, _data, section_type_GNU_VERSYM>::
> +-section_real (Shdr *header, uint8_t *mem) throw (std::bad_alloc)
> ++section_real (Shdr *header, uint8_t *mem) throw ()
> + : section_data<_class, _data> (header, mem)
> + {
> +   if (this->type != SHT_GNU_versym)
> +@@ -399,7 +399,7 @@ segment_data<_class, _data>::segment_data (Phdr *phdr, uint8_t *mem) throw ()
> + }
> +
> + template <typename _class, typename _data>
> +-segment_real<_class, _data, segment_type_INTERP>::segment_real (Phdr *header, uint8_t *mem) throw (std::bad_alloc)
> ++segment_real<_class, _data, segment_type_INTERP>::segment_real (Phdr *header, uint8_t *mem) throw ()
> + : segment_data<_class, _data> (header, mem)
> + {
> +   if (this->type != PT_INTERP)
> +@@ -429,13 +429,13 @@ dynamic_data<_class, _data>::dynamic_data (Dyn *dyn) throw ()
> + }
> +
> + template <typename _class, typename _data>
> +-void dynamic_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
> ++void dynamic_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw ()
> + {
> +   if (is_string)
> +     val_string = section.get_string(val);
> + }
> +
> +-std::string symbol::get_version () const throw (std::bad_alloc)
> ++std::string symbol::get_version () const throw ()
> + {
> +   if (verneed)
> +     return verneed->get_name();
> +@@ -445,7 +445,7 @@ std::string symbol::get_version () const throw (std::bad_alloc)
> +   return "Base";
> + }
> +
> +-std::string symbol::get_version_file () const throw (std::bad_alloc)
> ++std::string symbol::get_version_file () const throw ()
> + {
> +   if (verneed)
> +     return verneed->get_file();
> +@@ -453,7 +453,7 @@ std::string symbol::get_version_file () const throw (std::bad_alloc)
> +   return "None";
> + }
> +
> +-std::string symbol::get_name_version () const throw (std::bad_alloc)
> ++std::string symbol::get_name_version () const throw ()
> + {
> +   std::string ver;
> +
> +@@ -478,13 +478,13 @@ symbol_data<_class, _data>::symbol_data (Sym *sym) throw ()
> + }
> +
> + template <typename _class, typename _data>
> +-void symbol_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
> ++void symbol_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw ()
> + {
> +   name_string = section.get_string(name);
> + }
> +
> + template <typename _class, typename _data>
> +-void symbol_data<_class, _data>::update_version(const file &file, uint16_t index) throw (std::bad_alloc)
> ++void symbol_data<_class, _data>::update_version(const file &file, uint16_t index) throw ()
> + {
> +   if (!file.get_section_GNU_VERSYM())
> +     return;
> +@@ -531,13 +531,13 @@ version_definition_data<_class, _data>::version_definition_data (Verdef *verdef)
> + }
> +
> + template <typename _class, typename _data>
> +-void version_definition_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
> ++void version_definition_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw ()
> + {
> +   for (std::vector<uint32_t>::iterator it = names.begin(); it != names.end(); ++it)
> +     names_string.push_back(section.get_string(*it));
> + }
> +
> +-version_requirement::version_requirement() throw (std::bad_alloc)
> ++version_requirement::version_requirement() throw ()
> + : file_string("None")
> + { }
> +
> +@@ -561,7 +561,7 @@ version_requirement_data<_class, _data>::version_requirement_data (Verneed *vern
> +
> + template <typename _class, typename _data>
> + void version_requirement_data<_class, _data>::
> +-update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
> ++update_string(const section_type<section_type_STRTAB> &section) throw ()
> + {
> +   file_string = section.get_string(file);
> +
> +@@ -596,7 +596,7 @@ version_requirement_entry_data(Vernaux *vna, const version_requirement &verneed)
> +
> + template <typename _class, typename _data>
> + void version_requirement_entry_data<_class, _data>::
> +-update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
> ++update_string(const section_type<section_type_STRTAB> &section) throw ()
> + {
> +   name_string = section.get_string(name);
> + }
> +diff --git a/src/mklibs-readelf/elf.hpp b/src/mklibs-readelf/elf.hpp
> +index 70e61cd..afb0c9e 100644
> +--- a/src/mklibs-readelf/elf.hpp
> ++++ b/src/mklibs-readelf/elf.hpp
> +@@ -49,7 +49,7 @@ namespace Elf
> +       const uint16_t get_shstrndx() const throw () { return shstrndx; }
> +
> +       const std::vector<section *> get_sections() const throw () { return sections; };
> +-      const section &get_section(unsigned int i) const throw (std::out_of_range) { return *sections.at(i); };
> ++      const section &get_section(unsigned int i) const throw () { return *sections.at(i); };
> +       const section_type<section_type_DYNAMIC> *get_section_DYNAMIC() const throw () { return section_DYNAMIC; };
> +       const section_type<section_type_DYNSYM> *get_section_DYNSYM() const throw () { return section_DYNSYM; };
> +       const section_type<section_type_GNU_VERDEF> *get_section_GNU_VERDEF() const throw () { return section_GNU_VERDEF; };
> +@@ -59,13 +59,13 @@ namespace Elf
> +       const std::vector<segment *> get_segments() const throw () { return segments; };
> +       const segment_type<segment_type_INTERP> *get_segment_INTERP() const throw () { return segment_INTERP; };
> +
> +-      static file *open(const char *filename) throw (std::bad_alloc, std::runtime_error);
> ++      static file *open(const char *filename) throw ();
> +
> +     protected:
> +-      file(uint8_t *mem, size_t len) throw (std::bad_alloc) : mem(mem), len(len) { }
> ++      file(uint8_t *mem, size_t len) throw () : mem(mem), len(len) { }
> +
> +       template<typename _class>
> +-        static file *open_class(uint8_t *, size_t) throw (std::bad_alloc, std::runtime_error);
> ++        static file *open_class(uint8_t *, size_t) throw ();
> +
> +       uint16_t type;
> +       uint16_t machine;
> +@@ -128,7 +128,7 @@ namespace Elf
> +     class section_type<section_type_STRTAB> : public virtual section
> +     {
> +       public:
> +-        std::string get_string(uint32_t offset) const throw (std::bad_alloc)
> ++        std::string get_string(uint32_t offset) const throw ()
> +         {
> +           return std::string(reinterpret_cast<const char *> (mem + offset));
> +         }
> +@@ -263,10 +263,10 @@ namespace Elf
> +       uint8_t get_bind () const throw () { return bind; }
> +       uint8_t get_type () const throw () { return type; }
> +       const std::string &get_name_string() const throw () { return name_string; }
> +-      std::string get_version() const throw (std::bad_alloc);
> +-      std::string get_version_file() const throw (std::bad_alloc);
> ++      std::string get_version() const throw ();
> ++      std::string get_version_file() const throw ();
> +       uint16_t get_version_data() const throw () { return versym; }
> +-      std::string get_name_version() const throw (std::bad_alloc);
> ++      std::string get_name_version() const throw ();
> +
> +     protected:
> +       uint32_t name;
> +@@ -305,7 +305,7 @@ namespace Elf
> +   class version_requirement
> +   {
> +     public:
> +-      version_requirement() throw (std::bad_alloc);
> ++      version_requirement() throw ();
> +       virtual ~version_requirement () throw () { }
> +
> +       const std::string &get_file() const throw () { return file_string; }
> +diff --git a/src/mklibs-readelf/elf_data.hpp b/src/mklibs-readelf/elf_data.hpp
> +index 05effee..3871982 100644
> +--- a/src/mklibs-readelf/elf_data.hpp
> ++++ b/src/mklibs-readelf/elf_data.hpp
> +@@ -94,7 +94,7 @@ namespace Elf
> +     class file_data : public file
> +     {
> +       public:
> +-        file_data(uint8_t *, size_t len) throw (std::bad_alloc, std::runtime_error);
> ++        file_data(uint8_t *, size_t len) throw ();
> +
> +         const uint8_t get_class() const throw () { return _class::id; }
> +         const uint8_t get_data() const throw () { return _data::id; }
> +@@ -109,7 +109,7 @@ namespace Elf
> +       public:
> +         section_data(Shdr *, uint8_t *) throw ();
> +
> +-        virtual void update(const file &) throw (std::bad_alloc);
> ++        virtual void update(const file &) throw ();
> +     };
> +
> +   template <typename _class, typename _data, typename _type>
> +@@ -133,9 +133,9 @@ namespace Elf
> +         typedef typename _elfdef<_class>::Shdr Shdr;
> +
> +       public:
> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> ++        section_real(Shdr *, uint8_t *) throw ();
> +
> +-        void update(const file &) throw (std::bad_alloc);
> ++        void update(const file &) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -147,9 +147,9 @@ namespace Elf
> +         typedef typename _elfdef<_class>::Shdr Shdr;
> +
> +       public:
> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> ++        section_real(Shdr *, uint8_t *) throw ();
> +
> +-        void update(const file &) throw (std::bad_alloc);
> ++        void update(const file &) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -161,9 +161,9 @@ namespace Elf
> +         typedef typename _elfdef<_class>::Shdr Shdr;
> +
> +       public:
> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> ++        section_real(Shdr *, uint8_t *) throw ();
> +
> +-        void update(const file &) throw (std::bad_alloc);
> ++        void update(const file &) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -175,9 +175,9 @@ namespace Elf
> +         typedef typename _elfdef<_class>::Shdr Shdr;
> +
> +       public:
> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> ++        section_real(Shdr *, uint8_t *) throw ();
> +
> +-        void update(const file &) throw (std::bad_alloc);
> ++        void update(const file &) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -189,7 +189,7 @@ namespace Elf
> +         typedef typename _elfdef<_class>::Shdr Shdr;
> +
> +       public:
> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> ++        section_real(Shdr *, uint8_t *) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -220,7 +220,7 @@ namespace Elf
> +         typedef typename _elfdef<_class>::Phdr Phdr;
> +
> +       public:
> +-        segment_real (Phdr *, uint8_t *) throw (std::bad_alloc);
> ++        segment_real (Phdr *, uint8_t *) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -232,7 +232,7 @@ namespace Elf
> +       public:
> +         dynamic_data (Dyn *) throw ();
> +
> +-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
> ++        void update_string(const section_type<section_type_STRTAB> &) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -244,8 +244,8 @@ namespace Elf
> +       public:
> +         symbol_data (Sym *) throw ();
> +
> +-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
> +-        virtual void update_version (const file &, uint16_t) throw (std::bad_alloc);
> ++        void update_string(const section_type<section_type_STRTAB> &) throw ();
> ++        virtual void update_version (const file &, uint16_t) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -257,7 +257,7 @@ namespace Elf
> +
> +         version_definition_data (Verdef *) throw ();
> +
> +-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
> ++        void update_string(const section_type<section_type_STRTAB> &) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -269,7 +269,7 @@ namespace Elf
> +
> +         version_requirement_data (Verneed *) throw ();
> +
> +-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
> ++        void update_string(const section_type<section_type_STRTAB> &) throw ();
> +     };
> +
> +   template <typename _class, typename _data>
> +@@ -280,7 +280,7 @@ namespace Elf
> +
> +         version_requirement_entry_data (Vernaux *, const version_requirement &) throw ();
> +
> +-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
> ++        void update_string(const section_type<section_type_STRTAB> &) throw ();
> +     };
> + }
> +
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> index 1784af1f4c..07142e57e0 100644
> --- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> +++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> @@ -12,6 +12,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/
>   	file://avoid-failure-on-symbol-provided-by-application.patch \
>   	file://show-GNU-unique-symbols-as-provided-symbols.patch \
>   	file://fix_cross_compile.patch \
> +	file://remove-deprecated-exception-specification-cpp17.patch \
>   "
>   
>   SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
> 
> 
> 
> 
> 
