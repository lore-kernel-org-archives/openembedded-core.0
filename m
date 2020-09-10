Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.20662.1599740591212150452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dSGFr1dg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id c19so1778707wmd.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SgZhzhQpZrG3ugZz9eg4fLd/EBlyOoNmAh7moqpa13c=;
        b=dSGFr1dgLzmAUN+L9kxi5HBnPPvVtK7655cX12+R7HHOd7eso8FvnTO1Q5mVXRUvTC
         uvRnbYZ7pIUwFiynRLVm+pN+XrGxXcKSj2Wbu4vbiwUu02FYSMQeHbHzAH+n5BcSfttN
         GnFawyqbkiKC42BZzHkybjKWrhB9l7luGGPTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SgZhzhQpZrG3ugZz9eg4fLd/EBlyOoNmAh7moqpa13c=;
        b=Ql4IQWvCcJCmiHWNAjx1dnh0MuG4yHCExb8phcQOwmmmphosAhKTsmzJa9Qhw///UR
         kA/1ctVX7m2LaxrQWiGNQ3kd/JUBw3U7zOIBp+vTNkoGl0EeCZ24ZVvxC3vkXLrsqhJK
         hV8DvcBW0GCwzpk4XpI/zG+iT+P/NugdTpOB4odwvj4Z41Ml3C75PZnw9ed4VUG+eIr6
         MdOfSXW6G5UreTKp5obwrsz4nqzC5JmMOlqnvIWJCO1XLH0uKbpZqSxOr3KtsevDupX5
         SEQqLGAYxr2e0u6Lb+NSaYNhb3pNbAR5dVQtmgfXGWYtZiFoF/ie1ytgd3G8LXvQ5Ug/
         uAeA==
X-Gm-Message-State: AOAM5324hhDoSRIfmKfDckPlpZdIelVnAVNH8p5sGJvtae5uTN9opQht
	MleCP0y5wfkLcHnmP4JgG4zDF0+hhYvYxA==
X-Google-Smtp-Source: ABdhPJxkK820n6/ItJG9d8vtMK4QvqV134wv6lEh/NPovxpqUtAO0hMrQY/WxuAQBMABbI4GdVbVQg==
X-Received: by 2002:a05:600c:22c5:: with SMTP id 5mr6088700wmg.34.1599740589270;
        Thu, 10 Sep 2020 05:23:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 03/22] binutils: Fix relocation of ld.so.conf in nativesdk builds
Date: Thu, 10 Sep 2020 13:22:47 +0100
Message-Id: <20200910122306.2040194-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
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
index 51a9748906a..3dcc837c787 100644
--- a/meta/recipes-devtools/binutils/binutils_2.32.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.32.bb
@@ -46,4 +46,6 @@ do_install_class-native () {
 PACKAGE_BEFORE_PN += "libbfd"
 FILES_libbfd = "${libdir}/libbfd-*.so"
 
+SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

