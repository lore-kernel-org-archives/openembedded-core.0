Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 292937FF33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:30:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so5366291wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3VUXCqsu4rx7x13Rd9vFZY5LTq16FCc2V1MnRlmZcZU=;
	b=NfdRruom/Mrq/DhYU/E8YrZ/PAYCWVrWoGZ2x9x5Xca1f+XoLtc5VLGU1eQB2Bd/dw
	dFUkMBxD0wKeW9SchudoRp+tBUoH1p33Vt8fqL4UOIi8saxxCFI2cLFI9x5ljNxv+gNY
	8xRwdbBLQsgUfnwrRheeUcn1YP4iyea5+Bdnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3VUXCqsu4rx7x13Rd9vFZY5LTq16FCc2V1MnRlmZcZU=;
	b=QOpR1XFHhmkLfyeZmpSJT23T4cMjVLoTZxUh3gd5E/xQkV8Ia0drs4NGn+Ig13DFWO
	OwuReRbl4ljIKq2z7KSUjiudzmQNbnoqcDQ3TBvgZ8nckKNxyhuA7amvrxHHD9fwpo+S
	oJSg93XtbBPc7ZWoWf5q89ka5D6laeNwB42356JcRFHyUKWBEBkmtnRwX5B6G4eLj5nK
	EbFObhwJhhTYVU4Dg0O0xq/7HDQOds2SYHOPhxf462qM/H/VR5vxlE8g4wejFMNyLTtI
	+CF4t69E3OAphsv491AOb1bOlZp9H9+a74SiIzzjFotfVdijFqdyFKNtX7uw/DA2tQOA
	ySXg==
X-Gm-Message-State: APjAAAUhWK7r8jdcWUKzhHjT20wfCqRw3+gw5r4uao3EwR1MhoP4R2Mw
	HjAwKP+vU3W89HhmacziIzr42FpIoto=
X-Google-Smtp-Source: APXvYqyN1s2F+7OuvmO5X+/8CHYEvYA1NufFMSRWFjFb77oy9iSz5V8+Nw3L8RfythIHFo6EvELZww==
X-Received: by 2002:a1c:b456:: with SMTP id d83mr914980wmf.172.1579653049298; 
	Tue, 21 Jan 2020 16:30:49 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x10sm53211685wrv.60.2020.01.21.16.30.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:30:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 00:30:45 +0000
Message-Id: <20200122003047.9889-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] binutils: Fix relocation of ld.so.conf in nativesdk builds
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
X-List-Received-Date: Wed, 22 Jan 2020 00:30:49 -0000
Content-Transfer-Encoding: 8bit

We need binutils to look at our ld.so.conf file within the SDK to ensure
we search the SDK's libdirs as well as those from the host system.

There add a patch which passes in the directory to the code using a define,
then add it to a section we relocate in a similar way to the way we relocate
the gcc internal paths. This ensures that ld works correctly in our buildtools
tarball.

Standard sysroot relocation doesn't work since we're not in a sysroot,
we want to use both the host system and SDK libs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/nativesdk-relocation.patch       | 80 +++++++++++++++++++
 .../binutils/binutils_2.33.bb                 |  2 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/nativesdk-relocation.patch

diff --git a/meta/recipes-devtools/binutils/binutils/nativesdk-relocation.patch b/meta/recipes-devtools/binutils/binutils/nativesdk-relocation.patch
new file mode 100644
index 00000000000..408f7d18b76
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/nativesdk-relocation.patch
@@ -0,0 +1,80 @@
+We need binutils to look at our ld.so.conf file within the SDK to ensure 
+we search the SDK's libdirs as well as those from the host system.
+
+We therefore pass in the directory to the code using a define, then add
+it to a section we relocate in a similar way to the way we relocate the
+gcc internal paths. This ensures that ld works correctly in our buildtools
+tarball.
+
+Standard sysroot relocation doesn't work since we're not in a sysroot, 
+we want to use both the host system and SDK libs.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+2020/1/17
+Upstream-Status: Inappropriate [OE specific tweak]
+
+Index: git/ld/Makefile.am
+===================================================================
+--- git.orig/ld/Makefile.am
++++ git/ld/Makefile.am
+@@ -36,7 +36,8 @@ am__skipyacc =
+ 
+ ELF_CLFAGS=-DELF_LIST_OPTIONS=@elf_list_options@ \
+ 	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
+-	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@
++	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@ \
++           -DSYSCONFDIR="\"$(sysconfdir)\""
+ WARN_CFLAGS = @WARN_CFLAGS@
+ NO_WERROR = @NO_WERROR@
+ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+Index: git/ld/Makefile.in
+===================================================================
+--- git.orig/ld/Makefile.in
++++ git/ld/Makefile.in
+@@ -546,7 +546,8 @@ am__skiplex =
+ am__skipyacc = 
+ ELF_CLFAGS = -DELF_LIST_OPTIONS=@elf_list_options@ \
+ 	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
+-	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@
++	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@ \
++           -DSYSCONFDIR="\"$(sysconfdir)\""
+ 
+ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+ @ENABLE_PLUGINS_FALSE@PLUGIN_C = 
+Index: git/ld/emultempl/elf32.em
+===================================================================
+--- git.orig/ld/emultempl/elf32.em
++++ git/ld/emultempl/elf32.em
+@@ -1024,7 +1024,7 @@ gld${EMULATION_NAME}_check_ld_so_conf (c
+ 
+       info.path = NULL;
+       info.len = info.alloc = 0;
+-      tmppath = concat (ld_sysroot, "${prefix}/etc/ld.so.conf",
++      tmppath = concat (ld_sysconfdir, "/ld.so.conf",
+ 			(const char *) NULL);
+       if (!gld${EMULATION_NAME}_parse_ld_so_conf (&info, tmppath))
+ 	{
+Index: git/ld/ldmain.c
+===================================================================
+--- git.orig/ld/ldmain.c
++++ git/ld/ldmain.c
+@@ -68,6 +68,7 @@ char *program_name;
+ 
+ /* The prefix for system library directories.  */
+ const char *ld_sysroot;
++char ld_sysconfdir[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSCONFDIR;
+ 
+ /* The canonical representation of ld_sysroot.  */
+ char *ld_canon_sysroot;
+Index: git/ld/ldmain.h
+===================================================================
+--- git.orig/ld/ldmain.h
++++ git/ld/ldmain.h
+@@ -23,6 +23,7 @@
+ 
+ extern char *program_name;
+ extern const char *ld_sysroot;
++extern char ld_sysconfdir[4096];
+ extern char *ld_canon_sysroot;
+ extern int ld_canon_sysroot_len;
+ extern FILE *saved_script_handle;
diff --git a/meta/recipes-devtools/binutils/binutils_2.33.bb b/meta/recipes-devtools/binutils/binutils_2.33.bb
index 89315915c47..c2833b84473 100644
--- a/meta/recipes-devtools/binutils/binutils_2.33.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.33.bb
@@ -51,5 +51,7 @@ do_install_class-native () {
 PACKAGE_BEFORE_PN += "libbfd"
 FILES_libbfd = "${libdir}/libbfd-*.so"
 
+SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
+
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.20.1


