Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4718.1594242489657366362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=msPX+nZc;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjL6kWCzYw
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242487;
	bh=HjsbWUaBTJMmG7a4KRmaoE+B6k2vRXYY7T+LkdwoHww=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=msPX+nZcWCiyHjQcnJ9CP8y6o7scu7Kt2wtzJN1siJwYWop5mchiOXWMC8R74A6fo
	 t308KHhGUWrCKnD6VwtvsXFkVVs+/9IoNlxSDamk4Pt3rmin2kfQHvA83IRkRtMf+I
	 PQDYMlf22nNrHoHwbmZsEb0eX4hBUqkmeJmiVBCxEYp63SHGlbPHNB8eqWn9IZoDQS
	 Ox6qB/bYXHQaLiS+KKUeVjmAlezSNMVIlUUCTjH45N5d8gD2+UMSBC1qhU2oFChLGi
	 unPRoFhvObJWUMncncmGsCNT1LOA6W48kmnBW94fySkbYo73tApGStDO2HhsVNnNTp
	 5q1KqcsmIcDmXQpgQ5bO+bM3cMno+Y6odoriWrAItbdrnBWrlIX6nn0hCBkHmzT+Ae
	 /hn0T4Y0B34G3NKDstFuBQvibctGq1Wsvr4YSaa7xNrr1OFXZB95yNpfxLV74pN9S9
	 NJPBplMzq1bJeFjX9BekYgBPHmX1uqnzJkCRT+/y00GtreMrdhHw20/cySpmz6myC4
	 Q78LFErnMLOTMMv7p8ea2YCXQQvlbOTpeAURGyE7ROjqavJwgCBW2SiFgCSjaqDwAj
	 7f/j5CCIwz1DJyofX1KBEUYPMKVrSDJ/TacS8Smj68kZH5nnA1nAVNmtA5vBTySLXt
	 JfNI9aSrP+cVsTkwMYsEBEJU=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 09/19] patchelf: Add patch to address corrupt shared library issue
Date: Thu,  9 Jul 2020 00:07:51 +0300
Message-Id: <20200708210801.5553-9-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

patchelf can corrupt shared libraries if the program headers don't
immediately follow the elf header. Add a patch submitted upstream
to address this.

(From OE-Core rev: faaf5f34332290708f3720a5488b3d1549d9e95a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e7811c787bbe2f5d49b3506309499acc27189988)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../patchelf/patchelf/fix-phdrs.patch         | 37 +++++++++++++++++++
 .../patchelf/patchelf_0.10.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch b/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
new file mode 100644
index 0000000000..d087bd7855
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
@@ -0,0 +1,37 @@
+When running patchelf on some existing patchelf'd binaries to change to longer 
+RPATHS, ldd would report the binaries as invalid. The output of objdump -x on 
+those libraryies should show the top of the .dynamic section is getting trashed,
+something like:
+
+0x600000001 0x0000000000429000
+0x335000 0x0000000000335000
+0xc740 0x000000000000c740
+0x1000 0x0000000000009098
+SONAME libglib-2.0.so.0
+
+(which should be RPATH and DT_NEEDED entries)
+
+This was tracked down to the code which injects the PT_LOAD section.
+
+The issue is that if the program headers were previously relocated to the end 
+of the file which was how patchelf operated previously, the relocation code 
+wouldn't work properly on a second run as it now assumes they're located after 
+the elf header. This change forces them back to immediately follow the elf
+header which is where the code has made space for them.
+
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/202]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+RP 2020/6/2
+
+Index: git/src/patchelf.cc
+===================================================================
+--- git.orig/src/patchelf.cc
++++ git/src/patchelf.cc
+@@ -762,6 +762,7 @@ void ElfFile<ElfFileParamNames>::rewrite
+     }
+ 
+     /* Add a segment that maps the replaced sections into memory. */
++    wri(hdr->e_phoff, sizeof(Elf_Ehdr));
+     phdrs.resize(rdi(hdr->e_phnum) + 1);
+     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
+     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.10.bb b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
index cc983e033a..e4a604ec70 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -1,6 +1,7 @@
 SRC_URI = "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
+           file://fix-phdrs.patch \
            "
 
 LICENSE = "GPLv3"
-- 
2.17.1

