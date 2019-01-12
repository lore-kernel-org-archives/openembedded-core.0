Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5B47BE41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 10:12:00 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id a8so12541236lfk.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 02:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0+p9qT2wLU63GRM+CzhrAGZnUfe3mk4s/RFM2RTzJ0k=;
	b=C3hMdWpZqLcUpN+SCWnCKuQs1Ne/ph5URNDGz7jhHEuidxyfWpmasONKlzOMNfbU6V
	nkeaJmAZXweIg2+dgZkKJEVqg1v3y+aZZsHMu/pjX8HyF9EDbT+4oOgfYXQRAfgx1TvT
	gX2N2G7Wv0zBosSmS//hf5P1mKPfmuEOBUepuIqxXbMzjV0giyX+HfeeVtqhCszbPoqp
	Nd2iUzkeS1mSNFoPOwkORXikeslE/nvwx2WqnXNwrGFYTYNP6xAA8Jt+yB45AP2lPNyu
	yhcdOVGPVK/Dbde1fZdB+fwnkDswqnCH55lF5B9s9X9i6G+IoQN8oja4I/EN9yA2gJot
	CicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0+p9qT2wLU63GRM+CzhrAGZnUfe3mk4s/RFM2RTzJ0k=;
	b=iIsnAiYRpntq0fD2xNJlKiFV/5BbQLMGGnlWWkTVNi9hJJhinBIeEP63hmHkU/8gLR
	3lyj1ZHvU2lOSvo3FA2AI8ITMC5lN14AK3hO2aZL+4/kuRHJBZ0kLB9VW0/7a2PfjJre
	FRGWjEAw90tfuAecrHVVrcsrZL+IHCpUNx2N/Ozaa1vRwqRMxbaio9nzDhWQQP1FNlZM
	6XQVooK5p3xVdz7mdyBNgkWLw3ncU2rC8YBUIKvJzaM2B8eCCe6WVSkLiT9sYN74wbO0
	dfcsUC8Z+gT9xWIufJ+kqGdWu4MhcYl/FZNYNvpNurQ5J1p4V3YNHokR1hE27WaDIJik
	JXgg==
X-Gm-Message-State: AJcUukc1pb+gtwU8ut4btyzi+ac4/iNpUR3/tC3iMhJRW1Jco6wISGdJ
	p6u7V4PuFUi6OkfnJy03JfY+Td8G
X-Google-Smtp-Source: ALg8bN5cKlPQdhIWnToeLGL6bxYFyrzlqvTqnJ9RxVJ0vffRVlpzSxld8Wq6oRGoTmFoVjW0+JaBsA==
X-Received: by 2002:a19:5a05:: with SMTP id o5mr10476967lfb.140.1547287920532; 
	Sat, 12 Jan 2019 02:12:00 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r7-v6sm16282314ljc.10.2019.01.12.02.11.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Jan 2019 02:12:00 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 12:11:53 +0200
Message-Id: <1547287913-25526-3-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 2/2] binutils: Speed up and fix native builds
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
X-List-Received-Date: Sat, 12 Jan 2019 10:12:00 -0000

We need only libbfd, libiberty and libopcodes from binutils native.
To get them we build entire binutils with --enable-targets=all to
include all possible output targets support and then remove all but
these three libs.

This has two side effects:

  1) it wastes build time
  2) may cause errors caused by --enable-targets=all on some exotics
     build hosts like PowerPC 32bit

To address both of these effects we can configure binutils in general
and only required libs and their dependencies (zlib and intl at the
time). Then build only build these libs and their dependencies.

Regarding to PowerPC 32-bit build host issues we get following errors
when building on Ubuntu 16.04 LTS for PowerPC with command:

  MACHINE=qemuppc setarch ppc bitbake binutils-native

<output omitted>
| /usr/lib/gcc/powerpc-linux-gnu/5/../../../powerpc-linux-gnu/crti.o: In function `_init':
| (.init+0x22): relocation truncated to fit: R_PPC_GOT16 against undefined symbol `__gmon_start__'
| dwarf.o: In function `parse_gnu_debuglink':
| dwarf.c:(.text+0x482): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
| dwarf.o: In function `fetch_indexed_string':
| dwarf.c:(.text+0x8fa): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
| dwarf.o: In function `read_debug_line_header':
| dwarf.c:(.text+0x114a): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
| dwarf.c:(.text+0x12c6): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
| dwarf.o: In function `display_debug_ranges_list':
| dwarf.c:(.text+0x187e): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
| dwarf.c:(.text+0x18a2): relocation truncated to fit: R_PPC_GOT16 against symbol `stdout@@GLIBC_2.0' defined in .sdata section in /lib/powerpc-linux-gnu/libc.so.6
| dwarf.o: In function `display_debug_rnglists_list':
| dwarf.c:(.text+0x1bf2): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
| dwarf.c:(.text+0x1c06): relocation truncated to fit: R_PPC_GOT16 against symbol `stdout@@GLIBC_2.0' defined in .sdata section in /lib/powerpc-linux-gnu/libc.so.6
| dwarf.o: In function `display_block':
| dwarf.c:(.text+0x2486): relocation truncated to fit: R_PPC_GOT16 against symbol `byte_get' defined in .sbss section in elfcomm.o
| dwarf.o: In function `introduce.isra.2':
| dwarf.c:(.text+0x2556): additional relocation overflows omitted from the output
| collect2: error: ld returned 1 exit status
| Makefile:909: recipe for target 'objdump' failed
| make[4]: *** [objdump] Error 1
| make[4]: *** Waiting for unfinished jobs....
<output omitted>

While 'byte_get' is defined in small bss section in elfcomm.o and
generally can be fixed, symbol from host glibc 'stdout@@GLIBC_2.0' in
small data section can't be moved without recompile of Ubuntu 16.04 LTS
glibc.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.31.bb | 33 ++++++++++++++-----------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.31.bb b/meta/recipes-devtools/binutils/binutils_2.31.bb
index 51a9748..6796749 100644
--- a/meta/recipes-devtools/binutils/binutils_2.31.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.31.bb
@@ -20,26 +20,31 @@ EXTRA_OECONF_class-native = "--enable-targets=all \
                              --enable-install-libbfd \
                              --disable-werror"
 
+do_configure_append_class-native () {
+	for l in zlib intl bfd libiberty opcodes; do
+		oe_runmake configure-${l}
+	done
+}
+
+do_compile_class-native () {
+	for l in zlib intl bfd libiberty opcodes; do
+		cd "${l}"
+		autotools_do_compile
+		cd - >/dev/null
+	done
+}
+
 do_install_class-native () {
-	autotools_do_install
+	for l in bfd libiberty opcodes; do
+		cd "${l}"
+		autotools_do_install
+		cd - >/dev/null
+	done
 
 	# Install the libiberty header
 	install -d ${D}${includedir}
 	install -m 644 ${S}/include/ansidecl.h ${D}${includedir}
 	install -m 644 ${S}/include/libiberty.h ${D}${includedir}
-
-	# We only want libiberty, libbfd and libopcodes
-	rm -rf ${D}${bindir}
-	rm -rf ${D}${prefix}/${TARGET_SYS}
-	rm -rf ${D}${prefix}/lib/ldscripts
-	rm -rf ${D}${prefix}/share/info
-	rm -rf ${D}${prefix}/share/locale
-	rm -rf ${D}${prefix}/share/man
-	rmdir ${D}${prefix}/share || :
-	rmdir ${D}/${libdir}/gcc-lib || :
-	rmdir ${D}/${libdir}64/gcc-lib || :
-	rmdir ${D}/${libdir} || :
-	rmdir ${D}/${libdir}64 || :
 }
 
 # Split out libbfd-*.so so including perf doesn't include extra stuff
-- 
2.7.4


