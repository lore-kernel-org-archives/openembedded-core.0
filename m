Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TaPff-0007aL-CJ
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 12:37:49 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Nov 2012 03:23:43 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so1075403fav.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 03:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=HWhdzulzZT8izYQrTtaMo/uCoC5Y9tQPGdzPni2cELs=;
	b=QCUIHdJj5FvK0x+18+zPqLtWgBAnjJf4skYwaX13x2w7QRahyzSUg3++MBJheJhLMM
	4t40imrGbcFMYmo20dUBJswaBO5I2i7hD7KSmLgVkhtgOA++MIGYGtntJRKshqnf67a1
	dTZhvLctKgDHRieo+8vdYVP+OoHtdTHdyjAR3sMsnNRZuh2+vPREQhHdww+ub1IDPGfq
	HsfZw9VI++iXm05xQiXJEvrHmlu8ppsXkNK9SXORxdcv1rECB7oxUuPBxrKhhk1tnS3e
	Z4jdp9WJTtYMwUJ7kYq2pLyYCctCL3Pe68inYhfeYr3qc0Z5dziRtDSSPhuNz6b0AotK
	5gDQ==
Received: by 10.180.75.135 with SMTP id c7mr8395152wiw.10.1353324218961;
	Mon, 19 Nov 2012 03:23:38 -0800 (PST)
Received: by 10.180.75.135 with SMTP id c7mr8395109wiw.10.1353324218461;
	Mon, 19 Nov 2012 03:23:38 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id en20sm14553194wid.4.2012.11.19.03.23.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 03:23:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 11:22:14 +0000
Message-Id: <1353324134-3456-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmdtvEr+rYWWKERC8XERBOd19Z+oFgZONjqG1grG9sRvlFBLqQ8lEFhEe1Mc09xWks/wOSfExi73DgrxD06wDx0W1QKfIMCmn5u5xMob/g2x2xD/VfZLyb95kd/flJWJMIrQ3F1trXOIjMp7o+AwgbCAVdQDN2P6yokwunEoxhLeRbBd2vJ2M52XRXDXmID4MiruM+V
Subject: [PATCH] flac: fix text relocations
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
X-List-Received-Date: Mon, 19 Nov 2012 11:37:49 -0000

The recent sanity checks were flagging:

 ELF binary '.../libFLAC.so.8.2.0' has relocations in .text

This is caused by hand-written assembler being invoked badly.  Apply a patch
from upstream git that uses PIC instead of relocations.

[ YOCTO: #3461 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../flac/flac-1.2.1/asm-pic.patch                  |   99 ++++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.2.1.bb         |    5 +-
 2 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch

diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch b/meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch
new file mode 100644
index 0000000..43f29cf
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch
@@ -0,0 +1,99 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 12022d90dd3adc9f37dc2b16358cbecfe3c5be1c Mon Sep 17 00:00:00 2001
+From: Samuli Suominen <drac@gentoo.org>
+Date: Sun, 15 Jul 2012 15:45:10 +1000
+Subject: [PATCH] Fix assembler code to make it PIC so the dynamic linker does
+ not have to do text relocations on-the-fly. Patch from Gentoo
+ via Jaren Stangret <sirjaren@gmail.com>
+
+Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
+---
+ src/libFLAC/ia32/bitreader_asm.nasm |   27 +++++++++++++++++++++++++++
+ 1 files changed, 27 insertions(+), 0 deletions(-)
+
+diff --git a/src/libFLAC/ia32/bitreader_asm.nasm b/src/libFLAC/ia32/bitreader_asm.nasm
+index c6bb8c2..4cd0ea2 100644
+--- a/src/libFLAC/ia32/bitreader_asm.nasm
++++ b/src/libFLAC/ia32/bitreader_asm.nasm
+@@ -140,8 +140,13 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
+ %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
+ 	mov	edi, _FLAC__crc16_table
+ %else
++%ifdef OBJ_FORMAT_elf
++	mov	edi, [esp + 16]		;		saved ebx (GOT base)
++	lea	edi, [edi + FLAC__crc16_table wrt ..gotoff]
++%else
+ 	mov	edi, FLAC__crc16_table
+ %endif
++%endif
+ 	;; eax (ax)	crc a.k.a. br->read_crc
+ 	;; ebx (bl)	intermediate result index into FLAC__crc16_table[]
+ 	;; ecx		br->crc16_align
+@@ -216,8 +221,13 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
+ %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
+ 	mov	edi, _FLAC__crc16_table
+ %else
++%ifdef OBJ_FORMAT_elf
++	mov	edi, [esp + 16]		;		saved ebx (GOT base)
++	lea	edi, [edi + FLAC__crc16_table wrt ..gotoff]
++%else
+ 	mov	edi, FLAC__crc16_table
+ %endif
++%endif
+ 	;; eax (ax)	crc a.k.a. br->read_crc
+ 	;; ebx (bl)	intermediate result index into FLAC__crc16_table[]
+ 	;; ecx		br->crc16_align
+@@ -316,8 +326,13 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
+ %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
+ 	call	_bitreader_read_from_client_
+ %else
++%ifdef OBJ_FORMAT_elf
++	mov	ebx, [esp + 20]		;		saved ebx (GOT base)
++	call	bitreader_read_from_client_ wrt ..plt
++%else
+ 	call	bitreader_read_from_client_
+ %endif
++%endif
+ 	pop	edx			;     /* discard, unused */
+ 	pop	ecx			;     /* restore */
+ 	mov	esi, [ebp + 16]		;     cwords = br->consumed_words;
+@@ -363,13 +378,20 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
+ 	mov	[ebp + 16], esi		;       br->consumed_words = cwords;
+ 	mov	[ebp + 20], ecx		;       br->consumed_bits = cbits;
+ 	push	ecx			;       /* save */
++	push	ebx			;       /* save */
+ 	push	ebp			;       /* push br argument */
+ %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
+ 	call	_bitreader_read_from_client_
+ %else
++%ifdef OBJ_FORMAT_elf
++	mov	ebx, [esp + 24]		;		saved ebx (GOT base)
++	call	bitreader_read_from_client_ wrt ..plt
++%else
+ 	call	bitreader_read_from_client_
+ %endif
++%endif
+ 	pop	edx			;       /* discard, unused */
++	pop	ebx			;       /* restore */
+ 	pop	ecx			;       /* restore */
+ 	mov	esi, [ebp + 16]		;       cwords = br->consumed_words;
+ 					;       ucbits = (br->words-cwords)*FLAC__BITS_PER_WORD + br->bytes*8 - cbits;
+@@ -438,8 +460,13 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
+ %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
+ 	mov	edi, _FLAC__crc16_table
+ %else
++%ifdef OBJ_FORMAT_elf
++	mov	edi, [esp + 24]		;		saved ebx (GOT base)
++	lea	edi, [edi + FLAC__crc16_table wrt ..gotoff]
++%else
+ 	mov	edi, FLAC__crc16_table
+ %endif
++%endif
+ 	;; eax (ax)	crc a.k.a. br->read_crc
+ 	;; ebx (bl)	intermediate result index into FLAC__crc16_table[]
+ 	;; ecx		br->crc16_align
+-- 
+1.7.2.5
+
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 6520b71..903de6d 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -14,13 +14,14 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://include/FLAC/all.h;beginline=64;endline=69;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flac/flac-${PV}.tar.gz \
            file://disable-xmms-plugin.patch \
            file://flac-gcc43-fixes.patch \
            file://xmms.m4 \
-           file://0001-No-AltiVec-on-SPE.patch"
+           file://0001-No-AltiVec-on-SPE.patch \
+           file://asm-pic.patch"
 
 SRC_URI[md5sum] = "153c8b15a54da428d1f0fadc756c22c7"
 SRC_URI[sha256sum] = "9635a44bceb478bbf2ee8a785cf6986fba525afb5fad1fd4bba73cf71f2d3edf"
-- 
1.7.10



