Return-Path: <valery.chernous@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B92C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 17:53:51 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.10794.1639158829904793616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJNdQhju;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: valery.chernous@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id t5so32005214edd.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OCxGf3Wg0JITLTBYdx86OPRG5beYpsVeRuzc3rlPCVA=;
        b=gJNdQhjuxz0tYmD+2Q93ZSh/mo+MuEm9bFjfOP8ImLAuX42zSlw8duA9+9CcbFhmmv
         67BnCiRnqVSQhciKXqn0tXdUHhK/LA49GjbXup78XbNT2uEqzhIuTdtTMk1sm2WeuY1N
         MtJ0OXJTtg2RSM1oy4AyuWE6RvbecxOJ0ODDznp/5GU4iuz27IDxXQ6j0epvDNacnYJv
         jEyCpZem6T+9xFMPazKXUyfae9B0YoB8robSnhYJE3vlkwziiow0HyPHITMyoYfHTYok
         80dvcncu9b+wZHupd1qKPKPTiik/dYDTPYGuAXpm25mr6AIt+Lp02FCy/+PotWQxaLYg
         HmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OCxGf3Wg0JITLTBYdx86OPRG5beYpsVeRuzc3rlPCVA=;
        b=uMRJiTz9Fy5zDNZkzTX5QNeZ35/2iV84CYdVfURhUVwzQpeR4vLe6WigCSwMXM/bHw
         MYODSOvVH7MHVFZz+qO7bs/eo+aTb1IN1AQ+EQwMLRDZjP4Gt/TD5etM8KLPKhVS/vze
         clEt5QIMn8RZt5Y1Hr/iaGTTjcF5YQY/P03fh8VS/ztdbQm9JEHp00XOob8bAoVd1Bq/
         nsk0NkAYwWfWOsmMN9uEXtUSCk4sNFBzh8S/D8nVISpFOlakAVsbB+JdPOAQ274zAq9D
         Ag6i55DT+JO6Tx5gGV9GYNztnVJSnm+DXpwAHEhH1HdZ8loFQtHVs9q4bb6903/W7+qo
         2clw==
X-Gm-Message-State: AOAM532S7YAKY574tfgshh2PwyjX1Ydi7l9nKhO9SDZtM4pgvlrfokZa
	s+PdPXznTYyspuHv2pVhgxlznVOOAXxzSwYTe5g=
X-Google-Smtp-Source: 
 ABdhPJwZRaAX+ipl8jvLzxzueIozWRSJFJAMTVhamUfSonw+/UuKCDfWvSOr4g072vGBy2Gl6ulmQw==
X-Received: by 2002:a05:6402:1e93:: with SMTP id
 f19mr41274202edf.60.1639158827870;
        Fri, 10 Dec 2021 09:53:47 -0800 (PST)
Received: from localhost.localdomain (93-136-22-150.adsl.net.t-com.hr.
 [93.136.22.150])
        by smtp.gmail.com with ESMTPSA id
 y15sm1873112edr.35.2021.12.10.09.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 09:53:47 -0800 (PST)
From: Valery Chernous <valery.chernous@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Valerii Chernous <vchernou@cisco.com>,
	Valery Chernous <valery.chernous@gmail.com>
Subject: [PATCH] elf: Discard input .note.gnu.build-id sections
Date: Fri, 10 Dec 2021 19:53:37 +0200
Message-Id: <20211210175337.1574349-1-valery.chernous@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 17:53:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159556

From: Valerii Chernous <vchernou@cisco.com>

Originally issue:
building of glibc 2.32 or 2.34 with option "-Wl,--build-id"
produce libc.so.6 with section ".note.gnu.build-id" that have
invalid(double, 0x48) section size. It happens because glibc
use sublibraries for linking libc.so.6
ld produce this sublibraries with build-id section and on last
linking stage loads this sections as input for linking.
ld should create new(valid) ".note.gnu.build-id" into function
ldelf_setup_build_id on last linking stage but it skip creating because
build-id section already exists.
As result libc.so.6 contain ".note.gnu.build-id" with build-ids from
sublibraries and without valid build-id

Howto solved:
1. Discard input .note.gnu.build-id sections.
2. Clear the build ID field before writing.
3. Use bfd_make_section_anyway_with_flags to create the output
   .note.gnu.build-id section.

Upstream-Status: Backport

Reference to upstream patch:
[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1f1d0f8888a6c944e612b416a2a6e11abcf5199f]

Signed-off-by: Valerii Chernous <vchernou@cisco.com>
Signed-off-by: Valery Chernous <valery.chernous@gmail.com>
---
 .../binutils/binutils-2.37.inc                |   1 +
 ...rd-input-.note.gnu.build-id-sections.patch | 215 ++++++++++++++++++
 2 files changed, 216 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-elf-Discard-input-.note.gnu.build-id-sections.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
index 8f91c6460d..c565adc4b7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.37.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch \
+     file://0001-elf-Discard-input-.note.gnu.build-id-sections.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-elf-Discard-input-.note.gnu.build-id-sections.patch b/meta/recipes-devtools/binutils/binutils/0001-elf-Discard-input-.note.gnu.build-id-sections.patch
new file mode 100644
index 0000000000..c93af4e46f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-elf-Discard-input-.note.gnu.build-id-sections.patch
@@ -0,0 +1,215 @@
+From b2e18d3ea300f7491705b6e86a7cc3d6366e3b1f Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Nov 2021 20:40:38 -0800
+Subject: [PATCH] elf: Discard input .note.gnu.build-id sections
+
+1. Discard input .note.gnu.build-id sections.
+2. Clear the build ID field before writing.
+3. Use bfd_make_section_anyway_with_flags to create the output
+.note.gnu.build-id section.
+
+	PR ld/28639
+	* ldelf.c (ldelf_after_open): Discard input .note.gnu.build-id
+	sections, excluding the first one.
+	(write_build_id): Clear the build ID field before writing.
+	(ldelf_setup_build_id): Use bfd_make_section_anyway_with_flags
+	to create the output .note.gnu.build-id section.
+	* testsuite/ld-elf/build-id.exp: New file.
+	* testsuite/ld-elf/pr28639a.rd: Likewise.
+	* testsuite/ld-elf/pr28639b.rd: Likewise.
+	* testsuite/ld-elf/pr28639c.rd: Likewise.
+	* testsuite/ld-elf/pr28639d.rd: Likewise.
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1f1d0f8888a6c944e612b416a2a6e11abcf5199f]
+---
+ ld/ldelf.c                       | 15 ++++++-
+ ld/testsuite/ld-elf/build-id.exp | 77 ++++++++++++++++++++++++++++++++
+ ld/testsuite/ld-elf/pr28639a.rd  |  6 +++
+ ld/testsuite/ld-elf/pr28639b.rd  |  6 +++
+ ld/testsuite/ld-elf/pr28639c.rd  | 10 +++++
+ ld/testsuite/ld-elf/pr28639d.rd  |  4 ++
+ 6 files changed, 117 insertions(+), 1 deletion(-)
+ create mode 100644 ld/testsuite/ld-elf/build-id.exp
+ create mode 100644 ld/testsuite/ld-elf/pr28639a.rd
+ create mode 100644 ld/testsuite/ld-elf/pr28639b.rd
+ create mode 100644 ld/testsuite/ld-elf/pr28639c.rd
+ create mode 100644 ld/testsuite/ld-elf/pr28639d.rd
+
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index 21e655bb55c..8501d98b48f 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -1043,6 +1043,15 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+   /* Do not allow executable files to be used as inputs to the link.  */
+   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
+     {
++      /* Discard input .note.gnu.build-id sections.  */
++      s = bfd_get_section_by_name (abfd, ".note.gnu.build-id");
++      while (s != NULL)
++	{
++	  if (s != elf_tdata (link_info.output_bfd)->o->build_id.sec)
++	    s->flags |= SEC_EXCLUDE;
++	  s = bfd_get_next_section_by_name (NULL, s);
++	}
++
+       if (abfd->xvec->flavour == bfd_target_elf_flavour
+ 	  && !bfd_input_just_syms (abfd)
+ 	  && elf_tdata (abfd) != NULL
+@@ -1387,6 +1396,9 @@ write_build_id (bfd *abfd)
+   id_bits = contents + size;
+   size = asec->size - size;
+ 
++  /* Clear the build ID field.  */
++  memset (id_bits, 0, size);
++
+   bfd_h_put_32 (abfd, sizeof "GNU", &e_note->namesz);
+   bfd_h_put_32 (abfd, size, &e_note->descsz);
+   bfd_h_put_32 (abfd, NT_GNU_BUILD_ID, &e_note->type);
+@@ -1418,7 +1430,8 @@ ldelf_setup_build_id (bfd *ibfd)
+ 
+   flags = (SEC_ALLOC | SEC_LOAD | SEC_IN_MEMORY
+ 	   | SEC_LINKER_CREATED | SEC_READONLY | SEC_DATA);
+-  s = bfd_make_section_with_flags (ibfd, ".note.gnu.build-id", flags);
++  s = bfd_make_section_anyway_with_flags (ibfd, ".note.gnu.build-id",
++					  flags);
+   if (s != NULL && bfd_set_section_alignment (s, 2))
+     {
+       struct elf_obj_tdata *t = elf_tdata (link_info.output_bfd);
+diff --git a/ld/testsuite/ld-elf/build-id.exp b/ld/testsuite/ld-elf/build-id.exp
+new file mode 100644
+index 00000000000..19c22a75c4d
+--- /dev/null
++++ b/ld/testsuite/ld-elf/build-id.exp
+@@ -0,0 +1,77 @@
++# Expect script for --build-id tests.
++#   Copyright (C) 2021 Free Software Foundation, Inc.
++#
++# This file is part of the GNU Binutils.
++#
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
++# MA 02110-1301, USA.
++#
++
++# Exclude non-ELF targets.
++
++if ![is_elf_format] {
++    return
++}
++
++if { [istarget frv-*-*] || [istarget lm32-*-*] } {
++    return
++}
++
++if { !([istarget *-*-linux*]
++       || [istarget arm*-*-uclinuxfdpiceabi]
++       || [istarget *-*-nacl*]
++       || [istarget *-*-gnu*]) } then {
++    return
++}
++
++run_ld_link_tests [list \
++    [list \
++	"pr28639a.o" \
++	"-r --build-id=md5" \
++	"" \
++	"" \
++	{start.s} \
++	{{readelf {--notes} pr28639a.rd}} \
++	"pr28639a.o" \
++    ] \
++    [list \
++	"pr28639a.o" \
++	"-r --build-id" \
++	"" \
++	"" \
++	{dummy.s} \
++	{{readelf {--notes} pr28639b.rd}} \
++	"pr28639b.o" \
++    ] \
++    [list \
++	"pr28639a" \
++	"--build-id tmpdir/pr28639a.o tmpdir/pr28639b.o" \
++	"" \
++	"" \
++	{dummy.s} \
++	{{readelf {--notes} pr28639b.rd}  \
++	 {readelf {--notes} pr28639c.rd}} \
++	"pr28639a" \
++    ] \
++    [list \
++	"pr28639b" \
++	"--build-id=none tmpdir/pr28639a.o tmpdir/pr28639b.o" \
++	"" \
++	"" \
++	{dummy.s} \
++	{{readelf {--notes} pr28639d.rd}} \
++	"pr28639b" \
++    ] \
++]
+diff --git a/ld/testsuite/ld-elf/pr28639a.rd b/ld/testsuite/ld-elf/pr28639a.rd
+new file mode 100644
+index 00000000000..e85087064d0
+--- /dev/null
++++ b/ld/testsuite/ld-elf/pr28639a.rd
+@@ -0,0 +1,6 @@
++#...
++Displaying notes found in: \.note\.gnu\.build-id
++  Owner                Data size 	Description
++  GNU                  0x00000010	NT_GNU_BUILD_ID \(unique build ID bitstring\)
++    Build ID: [0-9a-f]+
++#pass
+diff --git a/ld/testsuite/ld-elf/pr28639b.rd b/ld/testsuite/ld-elf/pr28639b.rd
+new file mode 100644
+index 00000000000..04dcb04bec2
+--- /dev/null
++++ b/ld/testsuite/ld-elf/pr28639b.rd
+@@ -0,0 +1,6 @@
++#...
++Displaying notes found in: \.note\.gnu\.build-id
++  Owner                Data size 	Description
++  GNU                  0x00000014	NT_GNU_BUILD_ID \(unique build ID bitstring\)
++    Build ID: [0-9a-f]+
++#pass
+diff --git a/ld/testsuite/ld-elf/pr28639c.rd b/ld/testsuite/ld-elf/pr28639c.rd
+new file mode 100644
+index 00000000000..64221e5fa51
+--- /dev/null
++++ b/ld/testsuite/ld-elf/pr28639c.rd
+@@ -0,0 +1,10 @@
++#failif
++#...
++Displaying notes found in: \.note\.gnu\.build-id
++  Owner                Data size 	Description
++  GNU                  0x[0-9a-f]+	NT_GNU_BUILD_ID \(unique build ID bitstring\)
++    Build ID: [0-9a-f]+
++  Owner                Data size 	Description
++  GNU                  0x[0-9a-f]+	NT_GNU_BUILD_ID \(unique build ID bitstring\)
++    Build ID: [0-9a-f]+
++#...
+diff --git a/ld/testsuite/ld-elf/pr28639d.rd b/ld/testsuite/ld-elf/pr28639d.rd
+new file mode 100644
+index 00000000000..897c8493efa
+--- /dev/null
++++ b/ld/testsuite/ld-elf/pr28639d.rd
+@@ -0,0 +1,4 @@
++#failif
++#...
++Displaying notes found in: \.note\.gnu\.build-id
++#...
+-- 
+
-- 
2.25.1


