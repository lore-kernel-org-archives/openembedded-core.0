Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.40064.1629210786611749390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 07:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DVhzyDbn;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id x10so22648427wrt.8
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=47Xrh+Nv3XqesW6zodqeqmlYeAC6WAvcqw1CD4T7V/4=;
        b=DVhzyDbnPBGKmQYARoy5hAaGHuFNqHraecwDodoineY6uDYg3+6nexC8Ef+C0nwck6
         NV0X5oncqVlZpynbmaOmKFMmdWHz+tURt7dx72KRhDFsLhoS+960m6XyUVIlcvy3DCRS
         0gikZa0VbFG7tDhonzorreZli2Wo06zZPLHrVoKzNR/UXjrNg2Or5u8icu9xfj1fKtPK
         6OdERhlZ/fLh4I07JxYHTp43gMOAmZc3XQpSUkVMtYssbzENm42H3zFeRDYiPSyLHV6J
         ZfI+Kr073GfWoLt3gmZJi9L1PBl9fRKTdjoCYSvlCneFLenumPaSc0tivtNIAPY58Nas
         dzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=47Xrh+Nv3XqesW6zodqeqmlYeAC6WAvcqw1CD4T7V/4=;
        b=oJiiZUQlQy/4NXk6AfV4uqZAiTR+i6+8iwaLW59v7SXO+HGlrWYESvZGDMcEW/keWe
         CTGm7sTHLGFgns0UU4cflRM01XVazfzbSZJUPJTIps7c07cGj748Zrweoh9Pkt8l1VF4
         k1khVbzZx7VfGg10GBiO6k1iFRlK6ukOZb4YAkvl9nhntyPrutFTSqYetpM0Vy8c2AXE
         2RJu3n1bfJEyRza1oEl+G0SeSLHNuDzSm/iRVa/kOfvGbF/+i9r/TXtHti8EXkN8IRtJ
         1bbddwa8q0aqMDvlbHF4kli975sixIFhpnVUyTOuXfWcexQ8TnntUEhhhM8+D6XApLia
         aPjA==
X-Gm-Message-State: AOAM531JGFtYDAZjeoWXtI7fTvrvEpA12Lird3Zj3Dr3gnaI8bzzj8pn
	90nymz8+9gbNW9LxW+MTXJo6kbpi85Y=
X-Google-Smtp-Source: ABdhPJyFQZ6StYrOzv9z9n+jOY7gFKwtJsIaVkm2Y5/0z4G3wQW+/ig2BujPxdChGeaQP+lUawKIGA==
X-Received: by 2002:adf:ab0e:: with SMTP id q14mr4605843wrc.171.1629210784740;
        Tue, 17 Aug 2021 07:33:04 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f36922767bcc991e678b398.dip0.t-ipconnect.de. [2003:f0:7f36:9227:67bc:c991:e678:b398])
        by smtp.gmail.com with ESMTPSA id l18sm2799779wmc.30.2021.08.17.07.33.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 07:33:04 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] binutils: Apply upstream patch to fix 'too many open files' on qtwebengine
Date: Tue, 17 Aug 2021 16:32:55 +0200
Message-Id: <20210817143255.2529848-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817143255.2529848-1-schnitzeltony@gmail.com>
References: <20210817143255.2529848-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since upgrade of binutils to 2.37 builds of qtwebengine failed to link even
with ulimits -n 1000000 (!!).
Fix that by applying a patch from stable 'binutils-2_37-branch'.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../binutils/binutils-2.37.inc                |   1 +
 ...le-descriptor-if-there-is-no-archive.patch | 234 ++++++++++++++++++
 2 files changed, 235 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
index 4218c0a616..6093558e4b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.37.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
+     file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch b/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
new file mode 100644
index 0000000000..9becee39a2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
@@ -0,0 +1,234 @@
+From 1c611b40e6bfc8029bff7696814330b5bc0ee5c0 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 26 Jul 2021 05:59:55 -0700
+Subject: [PATCH] bfd: Close the file descriptor if there is no archive fd
+
+Close the file descriptor if there is no archive plugin file descriptor
+to avoid running out of file descriptors on thin archives with many
+archive members.
+
+bfd/
+
+	PR ld/28138
+	* plugin.c (bfd_plugin_close_file_descriptor): Close the file
+	descriptor there is no archive plugin file descriptor.
+
+ld/
+
+	PR ld/28138
+	* testsuite/ld-plugin/lto.exp: Run tmpdir/pr28138 only for
+	native build.
+
+	PR ld/28138
+	* testsuite/ld-plugin/lto.exp: Run ld/28138 tests.
+	* testsuite/ld-plugin/pr28138.c: New file.
+	* testsuite/ld-plugin/pr28138-1.c: Likewise.
+	* testsuite/ld-plugin/pr28138-2.c: Likewise.
+	* testsuite/ld-plugin/pr28138-3.c: Likewise.
+	* testsuite/ld-plugin/pr28138-4.c: Likewise.
+	* testsuite/ld-plugin/pr28138-5.c: Likewise.
+	* testsuite/ld-plugin/pr28138-6.c: Likewise.
+	* testsuite/ld-plugin/pr28138-7.c: Likewise.
+
+(cherry picked from commit 5a98fb7513b559e20dfebdbaa2a471afda3b4742)
+(cherry picked from commit 7dc37e1e1209c80e0bab784df6b6bac335e836f2)
+
+Upstream-Status: Accepted[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1c611b40e6bfc8029bff7696814330b5bc0ee5c0]
+---
+ bfd/plugin.c                       |  8 +++++++
+ ld/testsuite/ld-plugin/lto.exp     | 34 ++++++++++++++++++++++++++++++
+ ld/testsuite/ld-plugin/pr28138-1.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-2.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-3.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-4.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-5.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-6.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138-7.c |  6 ++++++
+ ld/testsuite/ld-plugin/pr28138.c   | 20 ++++++++++++++++++
+ 10 files changed, 104 insertions(+)
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-1.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-2.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-3.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-4.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-5.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-6.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138-7.c
+ create mode 100644 ld/testsuite/ld-plugin/pr28138.c
+
+diff --git a/bfd/plugin.c b/bfd/plugin.c
+index 6cfa2b66470..3bab8febe88 100644
+--- a/bfd/plugin.c
++++ b/bfd/plugin.c
+@@ -291,6 +291,14 @@ bfd_plugin_close_file_descriptor (bfd *abfd, int fd)
+ 	     && !bfd_is_thin_archive (abfd->my_archive))
+ 	abfd = abfd->my_archive;
+ 
++      /* Close the file descriptor if there is no archive plugin file
++	 descriptor.  */
++      if (abfd->archive_plugin_fd == -1)
++	{
++	  close (fd);
++	  return;
++	}
++
+       abfd->archive_plugin_fd_open_count--;
+       /* Dup the archive plugin file descriptor for later use, which
+ 	 will be closed by _bfd_archive_close_and_cleanup.  */
+diff --git a/ld/testsuite/ld-plugin/lto.exp b/ld/testsuite/ld-plugin/lto.exp
+index def69e43ab3..999d911ce6a 100644
+--- a/ld/testsuite/ld-plugin/lto.exp
++++ b/ld/testsuite/ld-plugin/lto.exp
+@@ -687,6 +687,40 @@ if { [is_elf_format] && [check_lto_shared_available] } {
+     }
+ }
+ 
++run_cc_link_tests [list \
++    [list \
++	"Build pr28138.a" \
++	"-T" "" \
++	{pr28138-1.c pr28138-2.c pr28138-3.c pr28138-4.c pr28138-5.c \
++	 pr28138-6.c pr28138-7.c} {} "pr28138.a" \
++    ] \
++    [list \
++	"Build pr28138.o" \
++	"" "" \
++	{pr28138.c} {} \
++    ] \
++]
++
++set exec_output [run_host_cmd "sh" \
++			      "-c \"ulimit -n 20; \
++			      $CC -Btmpdir/ld -o tmpdir/pr28138 \
++			      tmpdir/pr28138.o tmpdir/pr28138.a\""]
++set exec_output [prune_warnings $exec_output]
++if [string match "" $exec_output] then {
++    if { [isnative] } {
++	set exec_output [run_host_cmd "tmpdir/pr28138" ""]
++	if [string match "PASS" $exec_output] then {
++	    pass "PR ld/28138"
++	} else {
++	    fail "PR ld/28138"
++	}
++    } else {
++	pass "PR ld/28138"
++    }
++} else {
++    fail "PR ld/28138"
++}
++
+ set testname "Build liblto-11.a"
+ remote_file host delete "tmpdir/liblto-11.a"
+ set catch_output [run_host_cmd "$ar" "rc $plug_opt tmpdir/liblto-11.a tmpdir/lto-11a.o tmpdir/lto-11b.o tmpdir/lto-11c.o"]
+diff --git a/ld/testsuite/ld-plugin/pr28138-1.c b/ld/testsuite/ld-plugin/pr28138-1.c
+new file mode 100644
+index 00000000000..51d119e1642
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-1.c
+@@ -0,0 +1,6 @@
++extern int a0(void);
++int
++a1(void)
++{
++  return 1 + a0();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-2.c b/ld/testsuite/ld-plugin/pr28138-2.c
+new file mode 100644
+index 00000000000..1120cd797e9
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-2.c
+@@ -0,0 +1,6 @@
++extern int a1(void);
++int
++a2(void)
++{
++  return 1 + a1();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-3.c b/ld/testsuite/ld-plugin/pr28138-3.c
+new file mode 100644
+index 00000000000..ec464947ee6
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-3.c
+@@ -0,0 +1,6 @@
++extern int a2(void);
++int
++a3(void)
++{
++  return 1 + a2();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-4.c b/ld/testsuite/ld-plugin/pr28138-4.c
+new file mode 100644
+index 00000000000..475701b2c5c
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-4.c
+@@ -0,0 +1,6 @@
++extern int a3(void);
++int
++a4(void)
++{
++  return 1 + a3();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-5.c b/ld/testsuite/ld-plugin/pr28138-5.c
+new file mode 100644
+index 00000000000..e24f86c363e
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-5.c
+@@ -0,0 +1,6 @@
++extern int a4(void);
++int
++a5(void)
++{
++  return 1 + a4();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-6.c b/ld/testsuite/ld-plugin/pr28138-6.c
+new file mode 100644
+index 00000000000..b5b938bdb21
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-6.c
+@@ -0,0 +1,6 @@
++extern int a5(void);
++int
++a6(void)
++{
++  return 1 + a5();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138-7.c b/ld/testsuite/ld-plugin/pr28138-7.c
+new file mode 100644
+index 00000000000..4ef75bf0f0c
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138-7.c
+@@ -0,0 +1,6 @@
++extern int a6(void);
++int
++a7(void)
++{
++  return 1 + a6();
++}
+diff --git a/ld/testsuite/ld-plugin/pr28138.c b/ld/testsuite/ld-plugin/pr28138.c
+new file mode 100644
+index 00000000000..68252c9f382
+--- /dev/null
++++ b/ld/testsuite/ld-plugin/pr28138.c
+@@ -0,0 +1,20 @@
++#include <stdio.h>
++
++extern int a7(void);
++
++int
++a0(void)
++{
++  return 0;
++}
++
++int
++main()
++{
++  if (a7() == 7)
++    {
++      printf ("PASS\n");
++      return 0;
++    }
++  return 1;
++}
+-- 
+2.31.1
+
-- 
2.31.1

