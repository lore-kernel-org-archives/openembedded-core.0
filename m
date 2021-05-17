Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.433.1621270887809319025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 10:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KT41FFYF;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id lg14so10240205ejb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 10:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqORjQ/8W91NOWgBui5wvAeWKyJyauaeMoqEYWW6YUQ=;
        b=KT41FFYFqUItd1jKZsUR1zy6wzZcFRkjlzse/ZXKfvjfufxHPjCKzEKc3+PFzrkwDS
         Opx0VK6uooVK/PkyZtn9p/Mv8XfYGcpCLMDPDjExt6/3z430hurO3q0/uKgkVtCUNkUP
         V9ZmkWzVq1kbTA50BCsVN2u/vjzyKFv11cFCe+/Nq/LFEiuwDmuT2yN95svqhVOag6Bd
         N1ZYF5+ghe/wcsGd+WhzcICYLSFC02duXPSNp7VQnY4HINQ2keMnUsMwgXmBYO7dNrCW
         qWP0iRpZ50oYKk/+B9iifXOj8rsVP1uqevYLZ4i/Qasj9RRwScOxpzMOBElg5G2qKnie
         dFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqORjQ/8W91NOWgBui5wvAeWKyJyauaeMoqEYWW6YUQ=;
        b=TO28X4xL/M5rb2/8BaZ3M/8hvDTSkn+OaCdi+XQehQnFc4IBdA9JYSICxUX2SFlMbz
         9GTQ5niKsNrc3/nzd+1NF1+G3/EGjdWcmzljgBbyirktgpvfDNBNWPV4pAQ/zPoR/had
         AeVZ2d5xeMetC6D5jGfNHOYhtOr1iO4C8npLRfop/YSbIswFUB3gRpFrQTDDEZ3aZ7S3
         EYNnFkFudXd9Hxfm8NFMtNtnRlfvn+q2qRRcsEaaAb93ks/noTFsbEcExJ6k8VVWsY5t
         8gOqg+4U1q5dTQLQrodCWVT/GANcql1CHQiXRwAmg3DKpNZkVmTm8xwmK0KHc540mOZw
         ytGg==
X-Gm-Message-State: AOAM532hVGcdiIrZbyEKS0gesW/R+HDWX/46RnHHPL+loX7pZh0SZXmo
	9liDAfp0GCCpRm8W2RSLTXktN/el3XkgISQs
X-Google-Smtp-Source: ABdhPJx9eCkm0HNWcnGjLaw9WLmBeAZxXNLWl0NWB/cDsWkD78WJzaFwzb+hhGQp+/NCaf6hbGe+6w==
X-Received: by 2002:a17:906:26d4:: with SMTP id u20mr954127ejc.114.1621270886145;
        Mon, 17 May 2021 10:01:26 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id i5sm4853960edt.11.2021.05.17.10.01.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 10:01:25 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mklibs-native: Fix build with gcc 11
Date: Mon, 17 May 2021 19:01:04 +0200
Message-Id: <20210517170104.2605486-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gcc 11 the default mode for C++ is now -std=gnu++17 instead of -std=gnu++14,
in which support for dynamic exception specifications has been removed.

See http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../no-dynamic-exception-specifications.patch | 420 ++++++++++++++++++
 .../mklibs/mklibs-native_0.1.44.bb            |   1 +
 2 files changed, 421 insertions(+)
 create mode 100644 meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch

diff --git a/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
new file mode 100644
index 0000000000..5989a67c4f
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
@@ -0,0 +1,420 @@
+In gcc 11 the default mode for C++ is now -std=gnu++17 instead of -std=gnu++14,
+in which support for dynamic exception specifications has been removed.
+
+See http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+
+Index: mklibs-0.1.44/src/mklibs-readelf/elf.cpp
+===================================================================
+--- mklibs-0.1.44.orig/src/mklibs-readelf/elf.cpp
++++ mklibs-0.1.44/src/mklibs-readelf/elf.cpp
+@@ -36,7 +36,7 @@ file::~file () throw ()
+     delete *it;
+ }
+ 
+-file *file::open (const char *filename) throw (std::bad_alloc, std::runtime_error)
++file *file::open (const char *filename)
+ {
+   struct stat buf;
+   int fd;
+@@ -72,7 +72,7 @@ file *file::open (const char *filename)
+ }
+ 
+ template<typename _class>
+-file *file::open_class(uint8_t *mem, size_t len) throw (std::bad_alloc, std::runtime_error)
++file *file::open_class(uint8_t *mem, size_t len)
+ {
+   switch (mem[EI_DATA])
+   {
+@@ -86,7 +86,7 @@ file *file::open_class(uint8_t *mem, siz
+ }
+ 
+ template <typename _class, typename _data>
+-file_data<_class, _data>::file_data(uint8_t *mem, size_t len) throw (std::bad_alloc, std::runtime_error)
++file_data<_class, _data>::file_data(uint8_t *mem, size_t len)
+ : file(mem, len)
+ {
+   if (mem[EI_CLASS] != _class::id)
+@@ -190,7 +190,7 @@ section_data<_class, _data>::section_dat
+ }
+ 
+ template <typename _class, typename _data>
+-void section_data<_class, _data>::update(const file &file) throw (std::bad_alloc)
++void section_data<_class, _data>::update(const file &file)
+ {
+   const section_type<section_type_STRTAB> &section =
+     dynamic_cast<const section_type<section_type_STRTAB> &>(file.get_section(file.get_shstrndx()));
+@@ -204,7 +204,7 @@ section_type<section_type_DYNAMIC>::~sec
+ }
+ 
+ template <typename _class, typename _data>
+-section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr *header, uint8_t *mem)
+ : section_data<_class, _data>(header, mem)
+ {
+   if (this->type != SHT_DYNAMIC)
+@@ -221,7 +221,7 @@ section_real<_class, _data, section_type
+ }
+ 
+ template <typename _class, typename _data>
+-void section_real<_class, _data, section_type_DYNAMIC>::update(const file &file) throw (std::bad_alloc)
++void section_real<_class, _data, section_type_DYNAMIC>::update(const file &file)
+ {
+   section_data<_class, _data>::update(file);
+ 
+@@ -243,7 +243,7 @@ section_type<section_type_DYNSYM>::~sect
+ }
+ 
+ template <typename _class, typename _data>
+-section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr *header, uint8_t *mem)
+ : section_data<_class, _data>(header, mem)
+ {
+   if (this->type != SHT_DYNSYM)
+@@ -260,7 +260,7 @@ section_real<_class, _data, section_type
+ }
+ 
+ template <typename _class, typename _data>
+-void section_real<_class, _data, section_type_DYNSYM>::update(const file &file) throw (std::bad_alloc)
++void section_real<_class, _data, section_type_DYNSYM>::update(const file &file)
+ {
+   section_data<_class, _data>::update (file);
+ 
+@@ -285,7 +285,7 @@ const version_definition *section_type<s
+ }
+ 
+ template <typename _class, typename _data>
+-section_real<_class, _data, section_type_GNU_VERDEF>::section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real<_class, _data, section_type_GNU_VERDEF>::section_real(Shdr *header, uint8_t *mem)
+ : section_data<_class, _data>(header, mem)
+ {
+   if (this->type != SHT_GNU_verdef)
+@@ -307,7 +307,7 @@ section_real<_class, _data, section_type
+ }
+ 
+ template <typename _class, typename _data>
+-void section_real<_class, _data, section_type_GNU_VERDEF>::update(const file &file) throw (std::bad_alloc)
++void section_real<_class, _data, section_type_GNU_VERDEF>::update(const file &file)
+ {
+   section_data<_class, _data>::update(file);
+ 
+@@ -333,7 +333,7 @@ const version_requirement_entry *section
+ 
+ template <typename _class, typename _data>
+ section_real<_class, _data, section_type_GNU_VERNEED>::
+-section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real(Shdr *header, uint8_t *mem)
+ : section_data<_class, _data> (header, mem)
+ {
+   if (this->type != SHT_GNU_verneed)
+@@ -355,7 +355,7 @@ section_real(Shdr *header, uint8_t *mem)
+ }
+ 
+ template <typename _class, typename _data>
+-void section_real<_class, _data, section_type_GNU_VERNEED>::update(const file &file) throw (std::bad_alloc)
++void section_real<_class, _data, section_type_GNU_VERNEED>::update(const file &file)
+ {
+   section_data<_class, _data>::update(file);
+ 
+@@ -372,7 +372,7 @@ void section_real<_class, _data, section
+ 
+ template <typename _class, typename _data>
+ section_real<_class, _data, section_type_GNU_VERSYM>::
+-section_real (Shdr *header, uint8_t *mem) throw (std::bad_alloc)
++section_real (Shdr *header, uint8_t *mem)
+ : section_data<_class, _data> (header, mem)
+ {
+   if (this->type != SHT_GNU_versym)
+@@ -399,7 +399,7 @@ segment_data<_class, _data>::segment_dat
+ }
+ 
+ template <typename _class, typename _data>
+-segment_real<_class, _data, segment_type_INTERP>::segment_real (Phdr *header, uint8_t *mem) throw (std::bad_alloc)
++segment_real<_class, _data, segment_type_INTERP>::segment_real (Phdr *header, uint8_t *mem)
+ : segment_data<_class, _data> (header, mem)
+ {
+   if (this->type != PT_INTERP)
+@@ -429,13 +429,13 @@ dynamic_data<_class, _data>::dynamic_dat
+ }
+ 
+ template <typename _class, typename _data>
+-void dynamic_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++void dynamic_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section)
+ {
+   if (is_string)
+     val_string = section.get_string(val);
+ }
+ 
+-std::string symbol::get_version () const throw (std::bad_alloc)
++std::string symbol::get_version () const
+ {
+   if (verneed)
+     return verneed->get_name();
+@@ -445,7 +445,7 @@ std::string symbol::get_version () const
+   return "Base";
+ }
+ 
+-std::string symbol::get_version_file () const throw (std::bad_alloc)
++std::string symbol::get_version_file () const
+ {
+   if (verneed)
+     return verneed->get_file();
+@@ -453,7 +453,7 @@ std::string symbol::get_version_file ()
+   return "None";
+ }
+ 
+-std::string symbol::get_name_version () const throw (std::bad_alloc)
++std::string symbol::get_name_version () const
+ {
+   std::string ver;
+ 
+@@ -478,13 +478,13 @@ symbol_data<_class, _data>::symbol_data
+ }
+ 
+ template <typename _class, typename _data>
+-void symbol_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++void symbol_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section)
+ {
+   name_string = section.get_string(name);
+ }
+ 
+ template <typename _class, typename _data>
+-void symbol_data<_class, _data>::update_version(const file &file, uint16_t index) throw (std::bad_alloc)
++void symbol_data<_class, _data>::update_version(const file &file, uint16_t index)
+ {
+   if (!file.get_section_GNU_VERSYM())
+     return;
+@@ -531,13 +531,13 @@ version_definition_data<_class, _data>::
+ }
+ 
+ template <typename _class, typename _data>
+-void version_definition_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++void version_definition_data<_class, _data>::update_string(const section_type<section_type_STRTAB> &section)
+ {
+   for (std::vector<uint32_t>::iterator it = names.begin(); it != names.end(); ++it)
+     names_string.push_back(section.get_string(*it));
+ }
+ 
+-version_requirement::version_requirement() throw (std::bad_alloc)
++version_requirement::version_requirement()
+ : file_string("None")
+ { }
+ 
+@@ -561,7 +561,7 @@ version_requirement_data<_class, _data>:
+ 
+ template <typename _class, typename _data>
+ void version_requirement_data<_class, _data>::
+-update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++update_string(const section_type<section_type_STRTAB> &section)
+ {
+   file_string = section.get_string(file);
+ 
+@@ -596,7 +596,7 @@ version_requirement_entry_data(Vernaux *
+ 
+ template <typename _class, typename _data>
+ void version_requirement_entry_data<_class, _data>::
+-update_string(const section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
++update_string(const section_type<section_type_STRTAB> &section)
+ {
+   name_string = section.get_string(name);
+ }
+Index: mklibs-0.1.44/src/mklibs-readelf/elf.hpp
+===================================================================
+--- mklibs-0.1.44.orig/src/mklibs-readelf/elf.hpp
++++ mklibs-0.1.44/src/mklibs-readelf/elf.hpp
+@@ -49,7 +49,7 @@ namespace Elf
+       const uint16_t get_shstrndx() const throw () { return shstrndx; }
+ 
+       const std::vector<section *> get_sections() const throw () { return sections; };
+-      const section &get_section(unsigned int i) const throw (std::out_of_range) { return *sections.at(i); };
++      const section &get_section(unsigned int i) const { return *sections.at(i); };
+       const section_type<section_type_DYNAMIC> *get_section_DYNAMIC() const throw () { return section_DYNAMIC; };
+       const section_type<section_type_DYNSYM> *get_section_DYNSYM() const throw () { return section_DYNSYM; };
+       const section_type<section_type_GNU_VERDEF> *get_section_GNU_VERDEF() const throw () { return section_GNU_VERDEF; };
+@@ -59,13 +59,13 @@ namespace Elf
+       const std::vector<segment *> get_segments() const throw () { return segments; };
+       const segment_type<segment_type_INTERP> *get_segment_INTERP() const throw () { return segment_INTERP; };
+ 
+-      static file *open(const char *filename) throw (std::bad_alloc, std::runtime_error);
++      static file *open(const char *filename);
+ 
+     protected:
+-      file(uint8_t *mem, size_t len) throw (std::bad_alloc) : mem(mem), len(len) { }
++      file(uint8_t *mem, size_t len) : mem(mem), len(len) { }
+ 
+       template<typename _class>
+-        static file *open_class(uint8_t *, size_t) throw (std::bad_alloc, std::runtime_error);
++        static file *open_class(uint8_t *, size_t);
+ 
+       uint16_t type;
+       uint16_t machine;
+@@ -128,7 +128,7 @@ namespace Elf
+     class section_type<section_type_STRTAB> : public virtual section
+     {
+       public:
+-        std::string get_string(uint32_t offset) const throw (std::bad_alloc)
++        std::string get_string(uint32_t offset) const
+         {
+           return std::string(reinterpret_cast<const char *> (mem + offset));
+         }
+@@ -263,10 +263,10 @@ namespace Elf
+       uint8_t get_bind () const throw () { return bind; }
+       uint8_t get_type () const throw () { return type; }
+       const std::string &get_name_string() const throw () { return name_string; }
+-      std::string get_version() const throw (std::bad_alloc);
+-      std::string get_version_file() const throw (std::bad_alloc);
++      std::string get_version() const;
++      std::string get_version_file() const;
+       uint16_t get_version_data() const throw () { return versym; }
+-      std::string get_name_version() const throw (std::bad_alloc);
++      std::string get_name_version() const;
+ 
+     protected:
+       uint32_t name;
+@@ -305,7 +305,7 @@ namespace Elf
+   class version_requirement
+   {
+     public:
+-      version_requirement() throw (std::bad_alloc);
++      version_requirement();
+       virtual ~version_requirement () throw () { }
+ 
+       const std::string &get_file() const throw () { return file_string; }
+Index: mklibs-0.1.44/src/mklibs-readelf/elf_data.hpp
+===================================================================
+--- mklibs-0.1.44.orig/src/mklibs-readelf/elf_data.hpp
++++ mklibs-0.1.44/src/mklibs-readelf/elf_data.hpp
+@@ -94,7 +94,7 @@ namespace Elf
+     class file_data : public file
+     {
+       public:
+-        file_data(uint8_t *, size_t len) throw (std::bad_alloc, std::runtime_error);
++        file_data(uint8_t *, size_t len);
+ 
+         const uint8_t get_class() const throw () { return _class::id; }
+         const uint8_t get_data() const throw () { return _data::id; }
+@@ -109,7 +109,7 @@ namespace Elf
+       public:
+         section_data(Shdr *, uint8_t *) throw ();
+ 
+-        virtual void update(const file &) throw (std::bad_alloc);
++        virtual void update(const file &);
+     };
+ 
+   template <typename _class, typename _data, typename _type>
+@@ -133,9 +133,9 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *);
+ 
+-        void update(const file &) throw (std::bad_alloc);
++        void update(const file &);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -147,9 +147,9 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *);
+ 
+-        void update(const file &) throw (std::bad_alloc);
++        void update(const file &);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -161,9 +161,9 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *);
+ 
+-        void update(const file &) throw (std::bad_alloc);
++        void update(const file &);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -175,9 +175,9 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *);
+ 
+-        void update(const file &) throw (std::bad_alloc);
++        void update(const file &);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -189,7 +189,7 @@ namespace Elf
+         typedef typename _elfdef<_class>::Shdr Shdr;
+ 
+       public:
+-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
++        section_real(Shdr *, uint8_t *);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -220,7 +220,7 @@ namespace Elf
+         typedef typename _elfdef<_class>::Phdr Phdr;
+ 
+       public:
+-        segment_real (Phdr *, uint8_t *) throw (std::bad_alloc);
++        segment_real (Phdr *, uint8_t *);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -232,7 +232,7 @@ namespace Elf
+       public:
+         dynamic_data (Dyn *) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -244,8 +244,8 @@ namespace Elf
+       public:
+         symbol_data (Sym *) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
+-        virtual void update_version (const file &, uint16_t) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &);
++        virtual void update_version (const file &, uint16_t);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -257,7 +257,7 @@ namespace Elf
+ 
+         version_definition_data (Verdef *) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -269,7 +269,7 @@ namespace Elf
+ 
+         version_requirement_data (Verneed *) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &);
+     };
+ 
+   template <typename _class, typename _data>
+@@ -280,7 +280,7 @@ namespace Elf
+ 
+         version_requirement_entry_data (Vernaux *, const version_requirement &) throw ();
+ 
+-        void update_string(const section_type<section_type_STRTAB> &) throw (std::bad_alloc);
++        void update_string(const section_type<section_type_STRTAB> &);
+     };
+ }
+ 
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
index 1784af1f4c..8ecdb17be3 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/
 	file://avoid-failure-on-symbol-provided-by-application.patch \
 	file://show-GNU-unique-symbols-as-provided-symbols.patch \
 	file://fix_cross_compile.patch \
+	file://no-dynamic-exception-specifications.patch \
 "
 
 SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
