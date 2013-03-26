Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UKKvp-0001Wq-82
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 04:52:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2Q3ZE7X025916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 20:35:14 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Mar 2013 20:35:14 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 22:35:13 -0500
Message-ID: <1364268913-23029-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] rpm: Fix debugedit buildid processing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 03:52:19 -0000
Content-Type: text/plain

[ YOCTO #4089 ]

When constructing a new buildid, the items being hashed need to be
returned to their native endian.  In the process we were munging
the sh_type field that we relied on to determine if a section was
loadable or not.  The patch avoids this behavior by only modifying
a copy of the local endian data.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch | 92 ++++++++++++++++++----
 1 file changed, 78 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
index bd91693..2d620a5 100644
--- a/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
+++ b/meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
@@ -1,19 +1,15 @@
-There are cases, especially on PPC and MIPS, where the data address
-returned is 0, but the size is not 0.
+During the recalculation of the buildid, it's necessary to change the word
+back to the original endian.  However, if we do this in-place, we've also
+affected the headers that we're also working on.  The side effect of this is
+we can no longer rely on 'sh_type' as it may have been changed.
 
-It appears to happen when the sections headers are similar to:
+This patch ensures that any time we translate the loaded data to the machine
+format, we only do it in a backup copy and never the original copy.
 
-  [21] .data             PROGBITS        000239c0 0139c0 000010 00  WA  0   0  8
-  [22] .got              PROGBITS        000239d0 0139d0 000014 04 WAX  0   0  4
-  [23] .plt              NOBITS          000239e4 0139e4 000234 00 WAX  0   0  4
-  [24] .bss              NOBITS          00023c18 0139e4 0001c8 00  WA  0   0  8
-  [25] .comment          PROGBITS        00000000 0139e4 000011 01  MS  0   0  1
-  [26] .debug_aranges    PROGBITS        00000000 0139f8 000d68 00      0   0  8
+Note: in all other places a backup copy was used, just not buildid processing.
 
-Sections 23 and 24 (.plt and .bss) which are NOBITS have a loaded data address
-of 0, but a size != 0.
-
-This could be a bug in libelf...
+Also the process (...) function was modified to verify the data is not
+NULL as well.  This is an extra check and is not strictly necessary.
 
 Upstream-status: Pending
 
@@ -23,7 +19,7 @@ Index: rpm-5.4.9/tools/debugedit.c
 ===================================================================
 --- rpm-5.4.9.orig/tools/debugedit.c
 +++ rpm-5.4.9/tools/debugedit.c
-@@ -1434,7 +1434,8 @@ handle_build_id (DSO *dso, Elf_Data *bui
+@@ -1432,21 +1432,24 @@ handle_build_id (DSO *dso, Elf_Data *bui
      auto inline void process (const void *data, size_t size)
      {
        memchunk chunk = { .data = (void *) data, .size = size };
@@ -33,3 +29,71 @@ Index: rpm-5.4.9/tools/debugedit.c
      }
      union
      {
+       GElf_Ehdr ehdr;
+       GElf_Phdr phdr;
+       GElf_Shdr shdr;
+-    } u;
+-    Elf_Data x = { .d_version = EV_CURRENT, .d_buf = &u };
+-
+-    x.d_type = ELF_T_EHDR;
+-    x.d_size = sizeof u.ehdr;
+-    u.ehdr = dso->ehdr;
+-    u.ehdr.e_phoff = u.ehdr.e_shoff = 0;
+-    if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
++    } u1, u2;
++    Elf_Data src  = { .d_version = EV_CURRENT, .d_buf = &u1 };
++    Elf_Data dest = { .d_version = EV_CURRENT, .d_buf = &u2 };
++
++    src.d_type = ELF_T_EHDR;
++    src.d_size = sizeof u1.ehdr;
++    dest.d_size = sizeof u2.ehdr;
++    u1.ehdr = dso->ehdr;
++    u1.ehdr.e_phoff = u1.ehdr.e_shoff = 0;
++    if (elf64_xlatetom (&dest, &src, dso->ehdr.e_ident[EI_DATA]) == NULL)
+       {
+       bad:
+ 	fprintf (stderr, "Failed to compute header checksum: %s\n",
+@@ -1454,29 +1457,31 @@ handle_build_id (DSO *dso, Elf_Data *bui
+ 	exit (1);
+       }
+ 
+-    x.d_type = ELF_T_PHDR;
+-    x.d_size = sizeof u.phdr;
++    src.d_type = ELF_T_PHDR;
++    src.d_size = sizeof u1.phdr;
++    dest.d_size = sizeof u2.phdr;
+     for (i = 0; i < dso->ehdr.e_phnum; ++i)
+       {
+-	if (gelf_getphdr (dso->elf, i, &u.phdr) == NULL)
++	if (gelf_getphdr (dso->elf, i, &u1.phdr) == NULL)
+ 	  goto bad;
+-	if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
++	if (elf64_xlatetom (&dest, &src, dso->ehdr.e_ident[EI_DATA]) == NULL)
+ 	  goto bad;
+-	process (x.d_buf, x.d_size);
++	process (dest.d_buf, dest.d_size);
+       }
+ 
+-    x.d_type = ELF_T_SHDR;
+-    x.d_size = sizeof u.shdr;
++    src.d_type = ELF_T_SHDR;
++    src.d_size = sizeof u1.shdr;
++    dest.d_size = sizeof u2.shdr;
+     for (i = 0; i < dso->ehdr.e_shnum; ++i)
+       if (dso->scn[i] != NULL)
+ 	{
+-	  u.shdr = dso->shdr[i];
+-	  u.shdr.sh_offset = 0;
+-	  if (elf64_xlatetom (&x, &x, dso->ehdr.e_ident[EI_DATA]) == NULL)
++	  u1.shdr = dso->shdr[i];
++	  u1.shdr.sh_offset = 0;
++	  if (elf64_xlatetom (&dest, &src, dso->ehdr.e_ident[EI_DATA]) == NULL)
+ 	    goto bad;
+-	  process (x.d_buf, x.d_size);
++	  process (dest.d_buf, dest.d_size);
+ 
+-	  if (u.shdr.sh_type != SHT_NOBITS)
++	  if (u1.shdr.sh_type != SHT_NOBITS)
+ 	    {
+ 	      Elf_Data *d = elf_rawdata (dso->scn[i], NULL);
+ 	      if (d == NULL)
-- 
1.8.1.2.545.g2f19ada



