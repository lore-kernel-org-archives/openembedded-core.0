Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.20443.1599740683309262400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KkJDf9RS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id w2so5441944wmi.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FMh3PYXDaG1M0ki39W+ZMiTVjwaAhPIKLYdCx/2tT24=;
        b=KkJDf9RSlnQ+FPcrBdpDyFEhRopZgHfTIq7jKer3GWoP0RIJr2RsWRHyhXTOzPSsHX
         N/qjdHMkC6zL8eAyaz9iMKcGZikPEBcu8Z8vPYER8TSWO2UIzo4ZW0TRhp2wNfP/bLbK
         fVB6ha0ufao3CN0Sw8QjD+UlbDQm0cNZfDkgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FMh3PYXDaG1M0ki39W+ZMiTVjwaAhPIKLYdCx/2tT24=;
        b=b1R4wlO/l7v4K6c4VpPfh1QOyWMDduM102Olsgh419rr8ZWdmc+LeULNVrpNOxovFL
         pzfKn0XqFdVar7BDVMXhqkIMbODdFAhZWmVruhYMat4Q6748zWFDrYVDvfhuMXX33B4h
         ps1KvaCgrSGD8QJHYbe8UoH0eM8S99HXZJphDBsMmaLUwW9ReI7RCK2F49CrV6fNcRmR
         zMEtFUp6mipKCY0nv1GTXrucyO4YokAdp8nwcqNi5HKiH2wvXJt49MYyKA/Z9pVNlZG1
         k3cF/xdQA/B4OkCh2G42MhRUywam98JKSqxk+0DCfCvZr0Zn06ON/JLWCbMZHD9GzV/h
         x6pQ==
X-Gm-Message-State: AOAM532enGBbdlDongDNd5wqAMgPQWmiNOmJlKP0OLzjB5TaqU02KbG3
	IfDShxvQIhFvpfHxpIq0YQTfSK72A/x9Lw==
X-Google-Smtp-Source: ABdhPJzRrgf1YnVBgnjIoMQvmBWP3gZ5pU1NvMYGEmlY5ZeGa6w+eTArGwmmSd7qcE7jXj423DyL3g==
X-Received: by 2002:a1c:dd87:: with SMTP id u129mr8294281wmg.172.1599740681441;
        Thu, 10 Sep 2020 05:24:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 09/29] binutils: Fix relocation of ld.so.conf in nativesdk builds
Date: Thu, 10 Sep 2020 13:24:13 +0100
Message-Id: <20200910122433.2040293-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
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

(From OE-Core rev: 09a2b16ac2bd1e3e415131e46315c851373aa7e0)

(From OE-Core rev: d0b7811b0e8654cf83d1b0f8256c7941fc3d9c41)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/nativesdk-relocation.patch       | 80 +++++++++++++++++++
 .../binutils/binutils_2.31.bb                 |  2 +
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
diff --git a/meta/recipes-devtools/binutils/binutils_2.31.bb b/meta/recipes-devtools/binutils/binutils_2.31.bb
index 51a9748906a..3dcc837c787 100644
--- a/meta/recipes-devtools/binutils/binutils_2.31.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.31.bb
@@ -46,4 +46,6 @@ do_install_class-native () {
 PACKAGE_BEFORE_PN += "libbfd"
 FILES_libbfd = "${libdir}/libbfd-*.so"
 
+SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

