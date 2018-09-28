Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6EEC79951
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 06:19:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8S6JQPx001402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Sep 2018 23:19:26 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 27 Sep 2018 23:19:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 28 Sep 2018 14:29:27 +0800
Message-ID: <1538116167-25807-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] elfutils: fix CVE-2018-16403 & CVE-2018-16402
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
X-List-Received-Date: Fri, 28 Sep 2018 06:19:25 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.173.bb   |  2 +
 ...Check-end-of-attributes-list-consistently.patch | 84 ++++++++++++++++++++++
 ...rn-error-if-elf_compress_gnu-is-used-on-S.patch | 59 +++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-libdw-Check-end-of-attributes-list-consistently.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.173.bb b/meta/recipes-devtools/elfutils/elfutils_0.173.bb
index 2fec73d..00dab65 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.173.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.173.bb
@@ -29,6 +29,8 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/0001-fix-gcc7-ftbfs.patch \
            file://debian/0001-disable_werror.patch \
            file://CVE-2018-16062.patch \
+           file://0001-libdw-Check-end-of-attributes-list-consistently.patch \
+           file://0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-libdw-Check-end-of-attributes-list-consistently.patch b/meta/recipes-devtools/elfutils/files/0001-libdw-Check-end-of-attributes-list-consistently.patch
new file mode 100644
index 0000000..fb7f8b1
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-libdw-Check-end-of-attributes-list-consistently.patch
@@ -0,0 +1,84 @@
+From 146456c537de5ac7c80608f88babbba026cca03b Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 18 Aug 2018 19:51:27 +0200
+Subject: [PATCH 1/2] libdw: Check end of attributes list consistently.
+
+dwarf_child (__libdw_find_attr), dwarf_getabbrevattr[_data] and
+dwarf_getattrs all assume the end of the attribute list is when
+both the name (code) and form of the attribute are zero.
+
+dwarf_getabbrev (__libdw_getabbrev) and dwarf_hasattr assume the
+end of the attribute list is when either the name (code) or the
+form of the attribute is zero.
+
+The DWARF spec says: "The series of attribute specifications ends
+with an entry containing 0 for the name and 0 for the form." So
+the first check is correct.
+
+Make sure dwarf_getabbrev and dwarf_hasattr use the same check.
+This is important since all other functions expect dwarf_getabbrev
+(__libdw_getabbrev) to have done a data sanity check of the attribute.
+So if the ending condition is different it could cause a crash.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=23529
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=6983e59b727458a6c64d9659c85f08218bc4fcda]
+CVE: CVE-2018-16403
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libdw/ChangeLog         | 7 +++++++
+ libdw/dwarf_getabbrev.c | 2 +-
+ libdw/dwarf_hasattr.c   | 4 ++--
+ 3 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/libdw/ChangeLog b/libdw/ChangeLog
+index 9e43ea9..f3cf5d3 100644
+--- a/libdw/ChangeLog
++++ b/libdw/ChangeLog
+@@ -1,5 +1,12 @@
+ 2018-08-18  Mark Wielaard  <mark@klomp.org>
+ 
++	* dwarf_getabbrev.c (__libdw_getabbrev): Continue until both name
++	and form are zero.
++	* dwarf_hasattr.c (dwarf_hasattr): Stop when both name and form
++	are zero.
++
++2018-08-18  Mark Wielaard  <mark@klomp.org>
++
+ 	* dwarf_getaranges.c (dwarf_getaranges.c): Make sure there is enough
+ 	data to read the address and segment size.
+ 
+diff --git a/libdw/dwarf_getabbrev.c b/libdw/dwarf_getabbrev.c
+index 988d12c..6a7e981 100644
+--- a/libdw/dwarf_getabbrev.c
++++ b/libdw/dwarf_getabbrev.c
+@@ -140,7 +140,7 @@ __libdw_getabbrev (Dwarf *dbg, struct Dwarf_CU *cu, Dwarf_Off offset,
+ 	  get_sleb128 (formval, abbrevp, end);
+ 	}
+     }
+-  while (attrname != 0 && attrform != 0);
++  while (attrname != 0 || attrform != 0);
+ 
+   /* Return the length to the caller if she asked for it.  */
+   if (lengthp != NULL)
+diff --git a/libdw/dwarf_hasattr.c b/libdw/dwarf_hasattr.c
+index 90053b1..eca0839 100644
+--- a/libdw/dwarf_hasattr.c
++++ b/libdw/dwarf_hasattr.c
+@@ -60,8 +60,8 @@ dwarf_hasattr (Dwarf_Die *die, unsigned int search_name)
+       unsigned int attr_form;
+       get_uleb128_unchecked (attr_form, attrp);
+ 
+-      /* We can stop if we found the attribute with value zero.  */
+-      if (attr_name == 0 || attr_form == 0)
++      /* We can stop if we found the end of the attribute list.  */
++      if (attr_name == 0 && attr_form == 0)
+ 	return 0;
+ 
+       if (attr_name == search_name)
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch b/meta/recipes-devtools/elfutils/files/0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch
new file mode 100644
index 0000000..2465924
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0002-libelf-Return-error-if-elf_compress_gnu-is-used-on-S.patch
@@ -0,0 +1,59 @@
+From d08572f7c9692c335afdb6f8dde48d77731209c3 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Fri, 28 Sep 2018 10:45:56 +0800
+Subject: [PATCH 2/2] libelf: Return error if elf_compress_gnu is used on
+ SHF_COMPRESSED section.
+
+Compressing a section that is already compressed is fine, but useless.
+But it isn't possible to gnu compress (or decompress) a SHF_COMPRESSED
+section since there is no state kept that would tell if the section was
+first GNU compressed or first gabi compressed. Calling elf_compress_gnu
+on a section and then calling elf_compress on it to decompress it twice
+could cause a crash (the other way around is fine). Just disallow it.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=23528
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=56b18521fb8d46d40fc090c0de9d11a08bc982fa]
+CVE: CVE-2018-16402
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libelf/elf_compress_gnu.c | 4 +++-
+ libelf/libelf.h           | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/libelf/elf_compress_gnu.c b/libelf/elf_compress_gnu.c
+index c35dc39..dfa7c57 100644
+--- a/libelf/elf_compress_gnu.c
++++ b/libelf/elf_compress_gnu.c
+@@ -80,7 +80,9 @@ elf_compress_gnu (Elf_Scn *scn, int inflate, unsigned int flags)
+       sh_addralign = shdr->sh_addralign;
+     }
+ 
+-  if ((sh_flags & SHF_ALLOC) != 0)
++  /* Allocated sections, or sections that are already are compressed
++     cannot (also) be GNU compressed.  */
++  if ((sh_flags & SHF_ALLOC) != 0 || (sh_flags & SHF_COMPRESSED))
+     {
+       __libelf_seterrno (ELF_E_INVALID_SECTION_FLAGS);
+       return -1;
+diff --git a/libelf/libelf.h b/libelf/libelf.h
+index 547c0f5..fa568f7 100644
+--- a/libelf/libelf.h
++++ b/libelf/libelf.h
+@@ -366,6 +366,11 @@ extern Elf64_Chdr *elf64_getchdr (Elf_Scn *__scn);
+    It is an error to request compression for a section that already
+    has SHF_COMPRESSED set, or (for elf_compress) to request
+    decompression for an section that doesn't have SHF_COMPRESSED set.
++   If a section has SHF_COMPRESSED set then calling elf_compress_gnu
++   will result in an error.  The section has to be decompressed first
++   using elf_compress.  Calling elf_compress on a section compressed
++   with elf_compress_gnu is fine, but probably useless.
++
+    It is always an error to call these functions on SHT_NOBITS
+    sections or if the section has the SHF_ALLOC flag set.
+    elf_compress_gnu will not check whether the section name starts
+-- 
+2.7.4
+
-- 
2.7.4


