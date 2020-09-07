Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.6536.1599512006269773889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P5X20sGn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id k18so87143wmj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xqdXv5t4LOjfv7Frx+jjWl6QLZiptURtL8BXLfSex6U=;
        b=P5X20sGnOkhC29HBF6yjhzsqA07HzhZGIWSMe0AaofPxvHmxbj7K6HnN+zlRBIGfxU
         wVkGxH0sn206+vv7lnaeaCNy+ksisxQ+M5X7TwBYOgkE5chpU0VSNIxEMBQ2k7YnKFxd
         XuV6ZCPLSgyf/6lAqdTDmSpBbjwTWIFADfO+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xqdXv5t4LOjfv7Frx+jjWl6QLZiptURtL8BXLfSex6U=;
        b=ijdrbSKsCv5cTWp1f/09odlvcy3l8mms/Q+XCxKxFa0UAEFPCuFcS0U/fVH65Ha9F5
         jxhudo35SH4KJ2ZV6jhsBf1wN8Ywafl2Da0T7D/SxDzQkh6LtLiUk0CuDdx5EEko9kA6
         U6bMm3SbeCi0XOCwOpR5nG3gwiPgi9vIRnP9QVrkpY6nVinfJp7JTan+6EG7G4OSzpv1
         wE7y+rl2piHxQA2AieAHX2gwMrVxhUv/xX3yceAmCM27rKfq98x30HgcwyZwy27Y1Rqi
         j5n2GtWKGchOilqyYxH4VzTJLk6kaCHHJdn8G2Wzdh2e8HJfOtV7koyKqGSPdwupopI2
         G0RQ==
X-Gm-Message-State: AOAM532QkOQ3hGX+aB4VGuDIE3G+IqkJdtIaYSCwATSF6OlGbUybk/L7
	kPv/wXy5qz+wp5OPpt954NUIOjJKT0Yzxw==
X-Google-Smtp-Source: ABdhPJzc+BoUXfGSKCaDLcx9kaIzJC/MHxdaOUnm2DUy+meVxJ70Gc3dauDFPuudfDhY74s4nzgf7g==
X-Received: by 2002:a1c:2b43:: with SMTP id r64mr1004892wmr.105.1599512004360;
        Mon, 07 Sep 2020 13:53:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 03/19] binutils: Fix relocation of ld.so.conf in nativesdk builds
Date: Mon,  7 Sep 2020 21:53:05 +0100
Message-Id: <20200907205321.1941682-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need binutils to look at our ld.so.conf file within the SDK to ensure
we search the SDK's libdirs as well as those from the host system.

There add a patch which passes in the directory to the code using a define,
then add it to a section we relocate in a similar way to the way we relocate
the gcc internal paths. This ensures that ld works correctly in our buildtools
tarball.

Standard sysroot relocation doesn't work since we're not in a sysroot,
we want to use both the host system and SDK libs.

(From OE-Core rev: f6c1089642934ad93056ef19a0888965486ee030)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/nativesdk-relocation.patch       | 80 +++++++++++++++++++
 .../binutils/binutils_2.32.bb                 |  2 +
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
diff --git a/meta/recipes-devtools/binutils/binutils_2.32.bb b/meta/recipes-devtools/binutils/binutils_2.32.bb
index 89315915c47..c2833b84473 100644
--- a/meta/recipes-devtools/binutils/binutils_2.32.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.32.bb
@@ -51,5 +51,7 @@ do_install_class-native () {
 PACKAGE_BEFORE_PN += "libbfd"
 FILES_libbfd = "${libdir}/libbfd-*.so"
 
+SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
+
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1

