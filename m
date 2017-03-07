Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 047687306B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 18:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v27IApcb003410; Tue, 7 Mar 2017 18:10:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6z6qFKoEU8mm; Tue,  7 Mar 2017 18:10:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v27IAoRW003395
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Mar 2017 18:10:51 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1clJZS-0007lZ-3X; Tue, 07 Mar 2017 18:10:50 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 18:10:48 +0000
Message-Id: <1488910248-29815-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] patchelf: Fix issues with the 'hole' in binaries approach
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
X-List-Received-Date: Tue, 07 Mar 2017 18:10:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're seeing two issues with patchelf, one where it inflates binaries to MBs in
size, the other where stripping the resulting binary fails:

$ strip fixincl
Not enough room for program headers, try linking with -N
[.note.ABI-tag]: Bad value

The patch header describes more about what the problem is and how the patch
fixes it.

[YOCTO #11123]
[YOCTO #11009]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/patchelf/avoidholes.patch             | 161 +++++++++++++++++++++
 meta/recipes-devtools/patchelf/patchelf_0.9.bb     |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/avoidholes.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch b/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch
new file mode 100644
index 0000000..ebcd0ff
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch
@@ -0,0 +1,161 @@
+Different types of binaries create challenges for patchelf. In order to extend 
+sections they need to be moved within the binary. The current approach to 
+handling ET_DYN binaries is to move the INTERP section to the end of the file.
+This means changing PT_PHDR to add an extra PT_LOAD section so that the new section
+is mmaped into memory by the elf loader in the kernel. In order to extend PHDR,
+this means moving it to the end of the file.
+
+Its documented in patchelf there is a kernel 'bug' which means that if you have holes
+in memory between the base load address and the PT_LOAD segment that contains PHDR,
+it will pass an incorrect PHDR address to ld.so and fail to load the binary, segfaulting.
+
+To avoid this, the code currently inserts space into the binary to ensure that when 
+loaded into memory there are no holes between the PT_LOAD sections. This inflates the 
+binaries by many MBs in some cases. Whilst we could make them sparse, there is a second
+issue which is that strip can fail to process these binaries:
+
+$ strip fixincl
+Not enough room for program headers, try linking with -N
+[.note.ABI-tag]: Bad value
+
+This turns out to be due to libbfd not liking the relocated PHDR section either 
+(https://github.com/NixOS/patchelf/issues/10).
+
+Instead this patch implements a different approach, leaving PHDR where it is but extending
+it in place to allow addition of a new PT_LOAD section. This overwrites sections in the 
+binary but those get moved to the end of the file in the new PT_LOAD section.
+
+This is based on patches linked from the above github issue, however whilst the idea
+was good, the implementation wasn't correct and they've been rewritten here.
+
+RP
+2017/3/7
+
+Index: patchelf-0.9/src/patchelf.cc
+===================================================================
+--- patchelf-0.9.orig/src/patchelf.cc
++++ patchelf-0.9/src/patchelf.cc
+@@ -146,6 +146,8 @@ private:
+     string & replaceSection(const SectionName & sectionName,
+         unsigned int size);
+ 
++    bool haveReplacedSection(const SectionName & sectionName);
++
+     void writeReplacedSections(Elf_Off & curOff,
+         Elf_Addr startAddr, Elf_Off startOffset);
+ 
+@@ -497,6 +499,16 @@ unsigned int ElfFile<ElfFileParamNames>:
+     return 0;
+ }
+ 
++template<ElfFileParams>
++bool ElfFile<ElfFileParamNames>::haveReplacedSection(const SectionName & sectionName)
++{
++    ReplacedSections::iterator i = replacedSections.find(sectionName);
++
++    if (i != replacedSections.end())
++        return true;
++    return false;
++}
++
+ 
+ template<ElfFileParams>
+ string & ElfFile<ElfFileParamNames>::replaceSection(const SectionName & sectionName,
+@@ -595,52 +607,52 @@ void ElfFile<ElfFileParamNames>::rewrite
+ 
+     debug("last page is 0x%llx\n", (unsigned long long) startPage);
+ 
++    /* Because we're adding a new section header, we're necessarily increasing
++       the size of the program header table.  This can cause the first section
++       to overlap the program header table in memory; we need to shift the first
++       few segments to someplace else. */
++    /* Some sections may already be replaced so account for that */
++    unsigned int i = 1;
++    Elf_Addr pht_size = sizeof(Elf_Ehdr) + (phdrs.size() + 1)*sizeof(Elf_Phdr);
++    while( shdrs[i].sh_addr <= pht_size && i < rdi(hdr->e_shnum) ) {
++        if (not haveReplacedSection(getSectionName(shdrs[i])))
++            replaceSection(getSectionName(shdrs[i]), shdrs[i].sh_size);
++        i++;
++    }
+ 
+-    /* Compute the total space needed for the replaced sections and
+-       the program headers. */
+-    off_t neededSpace = (phdrs.size() + 1) * sizeof(Elf_Phdr);
++    /* Compute the total space needed for the replaced sections */
++    off_t neededSpace = 0;
+     for (ReplacedSections::iterator i = replacedSections.begin();
+          i != replacedSections.end(); ++i)
+         neededSpace += roundUp(i->second.size(), sectionAlignment);
+     debug("needed space is %d\n", neededSpace);
+ 
+-
+     size_t startOffset = roundUp(fileSize, getPageSize());
+ 
+     growFile(startOffset + neededSpace);
+ 
+-
+     /* Even though this file is of type ET_DYN, it could actually be
+        an executable.  For instance, Gold produces executables marked
+-       ET_DYN.  In that case we can still hit the kernel bug that
+-       necessitated rewriteSectionsExecutable().  However, such
+-       executables also tend to start at virtual address 0, so
++       ET_DYN as does LD when linking with pie. If we move PT_PHDR, it
++       has to stay in the first PT_LOAD segment or any subsequent ones
++       if they're continuous in memory due to linux kernel constraints
++       (see BUGS). Since the end of the file would be after bss, we can't 
++       move PHDR there, we therefore choose to leave PT_PHDR where it is but
++       move enough following sections such that we can add the extra PT_LOAD
++       section to it. This PT_LOAD segment ensures the sections at the end of
++       the file are mapped into memory for ld.so to process.
++       We can't use the approach in rewriteSectionsExecutable()
++       since DYN executables tend to start at virtual address 0, so
+        rewriteSectionsExecutable() won't work because it doesn't have
+-       any virtual address space to grow downwards into.  As a
+-       workaround, make sure that the virtual address of our new
+-       PT_LOAD segment relative to the first PT_LOAD segment is equal
+-       to its offset; otherwise we hit the kernel bug.  This may
+-       require creating a hole in the executable.  The bigger the size
+-       of the uninitialised data segment, the bigger the hole. */
++       any virtual address space to grow downwards into. */
+     if (isExecutable) {
+         if (startOffset >= startPage) {
+             debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
+-        } else {
+-            size_t hole = startPage - startOffset;
+-            /* Print a warning, because the hole could be very big. */
+-            fprintf(stderr, "warning: working around a Linux kernel bug by creating a hole of %zu bytes in ‘%s’\n", hole, fileName.c_str());
+-            assert(hole % getPageSize() == 0);
+-            /* !!! We could create an actual hole in the file here,
+-               but it's probably not worth the effort. */
+-            growFile(fileSize + hole);
+-            startOffset += hole;
+         }
+         startPage = startOffset;
+     }
+ 
+-
+-    /* Add a segment that maps the replaced sections and program
+-       headers into memory. */
++    /* Add a segment that maps the replaced sections into memory. */
+     phdrs.resize(rdi(hdr->e_phnum) + 1);
+     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
+     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
+@@ -653,15 +665,12 @@ void ElfFile<ElfFileParamNames>::rewrite
+ 
+ 
+     /* Write out the replaced sections. */
+-    Elf_Off curOff = startOffset + phdrs.size() * sizeof(Elf_Phdr);
++    Elf_Off curOff = startOffset;
+     writeReplacedSections(curOff, startPage, startOffset);
+     assert(curOff == startOffset + neededSpace);
+ 
+-
+-    /* Move the program header to the start of the new area. */
+-    wri(hdr->e_phoff, startOffset);
+-
+-    rewriteHeaders(startPage);
++    /* Write out the updated program and section headers */
++    rewriteHeaders(hdr->e_phoff);
+ }
+ 
+ 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.9.bb b/meta/recipes-devtools/patchelf/patchelf_0.9.bb
index 54e654b..01f0e62 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.9.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.9.bb
@@ -2,6 +2,7 @@ SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
            file://Skip-empty-section-fixes-66.patch \
            file://handle-read-only-files.patch \
            file://Increase-maxSize-to-64MB.patch \
+           file://avoidholes.patch \
 "
 
 LICENSE = "GPLv3"
-- 
2.7.4


