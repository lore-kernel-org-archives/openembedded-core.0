Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E1CC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 19:08:49 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.4732.1716318521275276271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 12:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iau0NOxX;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso489007a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 12:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716318520; x=1716923320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BdjxxHBz17ayuhxCon/Wr050/QGW/aa6LH4SfV3y/yg=;
        b=Iau0NOxXYyQAzX6rGr9aAZPkItD/tQGmaqgXe5CHO3yYUJs6uap2JZQQyIzf/w41VJ
         LvNXXkF/Dm4xKIg+VzgC1IiQy2sqUNPmdCzSgBAdiilG7kU6lB+RfnQl8mXf9TVo31UM
         BWq7qcVNRAB4VDUMDrqgFPbhZxPVFJW425H/L1Jd0dpBpX29JFjD4d9XJ/XTXu+jyfTm
         rbEe+0+r/PV2bwOGEq17CSBfaP51CTVQ6zndqUheTQ3iQtX2Vw1RVMoXUq3++XC4v2pl
         TaK5me3QlJamTooeJ+IJJBrlLMoCtNuV+RrbrF512TBswLT9cB5yjc8M3Oz+Py6EFd4u
         Demw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716318520; x=1716923320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdjxxHBz17ayuhxCon/Wr050/QGW/aa6LH4SfV3y/yg=;
        b=J8hvElXbXcL1jykg2TbVy0taXrO3Ib2IQYriTYzsh4s6tuIsJJsmkoW/yLVoB6OUws
         6xtrOHPGRR8o1cQoYY62ywZtvtLh0dx8msABMXilOhaIGvtcQu+rW+teu4g63h10S1iw
         UX0WRwhH0Ya4IEtEwOL6eJ/+0By9WgGLCTR4nIGntS3ttU3wAK9ueBZyFgdnEgzWBG9+
         h/GbCZR2qstI84fi0HCrSPeT+70uGox3xfzFFElUFg9txSPgPUljgWGSt19YDuoWipVd
         /fg03VYO8vtYwVRVI0lznRJNQL1SFvIYHdbQ7VQRzhs2YF36pi2kmh/1HeFT61fX4aDE
         P3VA==
X-Gm-Message-State: AOJu0Yy8W6KWLe93E1GFRy8x36tsu6JVoTtB7gKT0HJDaTuuenxseSUr
	0k3lbwxC50pB2mSEAM1iOxMS3EuzV/p/UkXdygORB9GR+DfNiWycyBKgTg==
X-Google-Smtp-Source: AGHT+IGpajC1IMTMp7FlEwrruYVx0Xhy9YwSzEGh+aech3n3vCF22cwnZMtLcwGsmeVowQESNMUM1w==
X-Received: by 2002:a17:90b:370a:b0:2b2:ae4b:9e54 with SMTP id 98e67ed59e1d1-2bd9f45059amr38559a91.11.1716318520073;
        Tue, 21 May 2024 12:08:40 -0700 (PDT)
Received: from kamensky-p15s.cisco.com ([2601:641:8080:1a70::24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bd93ee6f92sm1555691a91.32.2024.05.21.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 12:08:39 -0700 (PDT)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH] systemtap: upgrade 5.0 -> 5.1
Date: Tue, 21 May 2024 12:08:12 -0700
Message-Id: <20240521190812.5403-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 19:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199670

removed all backported patches

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 ...ve-runtime-linux-uprobes-and-runtime.patch | 40 ---------------
 ...x-fix-build-against-upcoming-gcc-14-.patch | 40 ---------------
 ...-broken-libdebuginfod-library-auto-d.patch | 51 -------------------
 .../0001-prerelease-datestamp-fixes.patch     | 23 ---------
 ...d-against-upcoming-gcc-14-Werror-cal.patch | 36 -------------
 .../systemtap/systemtap_git.inc               |  9 +---
 6 files changed, 2 insertions(+), 197 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
deleted file mode 100644
index 2d46a3962d..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5a01e28bd806326b2143e3e6bb28d4780c5d879d Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <victor.kamensky7@gmail.com>
-Date: Sun, 3 Dec 2023 18:40:05 -0800
-Subject: [PATCH] Makefile.am: remove runtime/linux/uprobes and
- runtime/linux/uprobes2 install
-
-"PR30434 continuation:  Removed old uprobes, uprobes2 implementation,
-uprobes-inc.h & any mentions of CONFIG_UTRACE." commit removed uprobes,
-and uprobes2 sources and directories, but Makefile.am still tries to
-install them. In fact after failing to 'cd' into runtime/linux/uprobes
-directory it copies top level *.[ch] files into
-${prefix}/share/systemtap/runtime/linux/uprobes directory.
-
-The issue was caught by OpenEmbedded project do_package_qa checks.
-
-Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/systemtap/2023q4/027880.html] 
----
- Makefile.am | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 5737c6b20..2ba896088 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -277,10 +277,6 @@ endif
- 		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/softfloat/$$f; done)
- 	(cd $(srcdir)/runtime/linux; for f in *.[ch]; \
- 		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/$$f; done)
--	(cd $(srcdir)/runtime/linux/uprobes; for f in Makefile *.[ch]; \
--		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/uprobes/$$f; done)
--	(cd $(srcdir)/runtime/linux/uprobes2; for f in *.[ch]; \
--		do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/runtime/linux/uprobes2/$$f; done)
- 	(cd $(srcdir)/tapset; find . \( -name '*.stp' -o -name '*.stpm' -o -name README \) -print \
- 		| while read f; do $(INSTALL_DATA) -D $$f $(DESTDIR)$(pkgdatadir)/tapset/$$f; done)
- 	(cd $(srcdir)/testsuite/systemtap.examples; find . -type f -print \
--- 
-2.31.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch b/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
deleted file mode 100644
index e3d94d9312..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d42139cf9cd26d0c0363fcfe007716baeb8de517 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Fri, 22 Dec 2023 19:42:38 +0000
-Subject: [PATCH] bpf-translate.cxx: fix build against upcoming `gcc-14`
- (`-Werror=calloc-transposed-args`)
-
-`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
-detected minor infelicity in `calloc()` API usage in `systemtap`:
-
-    bpf-translate.cxx: In function 'bpf::BPF_Section* bpf::output_probe(BPF_Output&, program&, const std::string&, unsigned int)':
-    bpf-translate.cxx:5044:39: error: 'void* calloc(size_t, size_t)' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
-     5044 |   bpf_insn *buf = (bpf_insn*) calloc (sizeof(bpf_insn), ninsns);
-          |                                       ^~~~~~~~~~~~~~~~
-    bpf-translate.cxx:5044:39: note: earlier argument should specify number of elements, later size of each element
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=d42139cf9cd26d0c0363fcfe007716baeb8de517]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- bpf-translate.cxx | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bpf-translate.cxx b/bpf-translate.cxx
-index 1a9302463..aa8ef65ce 100644
---- a/bpf-translate.cxx
-+++ b/bpf-translate.cxx
-@@ -5041,9 +5041,9 @@ output_probe(BPF_Output &eo, program &prog,
- 	}
-     }
- 
--  bpf_insn *buf = (bpf_insn*) calloc (sizeof(bpf_insn), ninsns);
-+  bpf_insn *buf = (bpf_insn*) calloc (ninsns, sizeof(bpf_insn));
-   assert (buf);
--  Elf64_Rel *rel = (Elf64_Rel*) calloc (sizeof(Elf64_Rel), nreloc);
-+  Elf64_Rel *rel = (Elf64_Rel*) calloc (nreloc, sizeof(Elf64_Rel));
-   assert (rel);
- 
-   unsigned i = 0, r = 0;
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch b/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch
deleted file mode 100644
index 98641826f6..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 3913ad3e28a19811e1b52338112344a487057e4f Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <victor.kamensky7@gmail.com>
-Date: Mon, 18 Dec 2023 03:13:38 +0000
-Subject: [PATCH 1/2] configure.ac: fix broken libdebuginfod library auto
- detection
-
-After 2e67b053e3796ee7cf29a39f9698729b52078406 "configury: rework debuginfod searches"
-commit, libdebuginfod.so library auto detection is broken. It was reported by Martin Jansa
-on openembedded-core mailing list [1].
-
-Currently configure.ac does "AC_DEFINE([HAVE_LIBDEBUGINFOD], [1] ..." as long as
-no --without-debuginfod option is passed, regardless PKG_CHECK_MODULES check result.
-It seems to be bad copy/paste. Address the issue by moving the AC_DEFINE back to
-PKG_CHECK_MODULES action-if-found block.
-
-To reproduce the issue on FC system, one can do the following
-"sudo dnf remove elfutils-debuginfod-client-devel" and then try to build SystemTap
-util.cxx will fail to compile because of missing elfutils/debuginfod.h because
-config.h will have "#define HAVE_LIBDEBUGINFOD 1", while config.log and configure
-output indicates that check for libdebuginfod library failed.
-
-[1] https://lists.openembedded.org/g/openembedded-core/message/192109?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Csystemtap%2C20%2C2%2C0%2C102987514
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/systemtap/2023q4/027914.html]
-Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
----
- configure.ac | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d9559c5c3..18cd7f84a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -219,12 +219,11 @@ dnl take the user at his or her word
- elif test "x$with_debuginfod" != xno; then
- dnl check in the system pkgconfig
-   PKG_CHECK_MODULES([debuginfod], [libdebuginfod >= 0.179],
--    [have_debuginfod=1],
-+    [have_debuginfod=1
-+     AC_DEFINE([HAVE_LIBDEBUGINFOD], [1], [Define to 1 if debuginfod is enabled.])],
-     [if test "x$with_debuginfod" = xyes; then
-        AC_MSG_ERROR(["--with-debuginfod was given, but libdebuginfod is missing or unusable."])
-      fi])
--  AC_DEFINE([HAVE_LIBDEBUGINFOD], [1], [Define to 1 if debuginfod is enabled.])
--  AC_MSG_RESULT([yes])  
- else
-   AC_MSG_RESULT([no])
- fi
--- 
-2.31.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
deleted file mode 100644
index afdc10a3fe..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00 2001
-From: "Frank Ch. Eigler" <fche@redhat.com>
-Date: Sat, 4 Nov 2023 12:19:59 -0400
-Subject: [PATCH] prerelease datestamp fixes
-
-Upstream-Status: Backport
----
- NEWS | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/NEWS b/NEWS
-index c7f31e8b7..f0f9056c4 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,4 +1,4 @@
--* What's new in version 5.0, 2023-11-03
-+* What's new in version 5.0, 2023-11-04
- 
- - Performance improvements in uprobe registration and module startup.
- 
--- 
-2.31.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch
deleted file mode 100644
index 22578fb3f6..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 52596f023652114642faba5726c99488529029ce Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Thu, 21 Dec 2023 10:00:06 +0000
-Subject: [PATCH] staprun: fix build against upcoming `gcc-14`
- (`-Werror=calloc-transposed-args`)
-
-`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
-detected minor infelicity in `calloc()` API usage in `systemtap`:
-
-    staprun.c: In function 'main':
-    staprun.c:550:50: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
-      550 |                 char ** new_argv = calloc(sizeof(char *),argc+2);
-          |                                                  ^~~~
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=52596f023652114642faba5726c99488529029ce]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- staprun/staprun.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/staprun/staprun.c b/staprun/staprun.c
-index 8437f3af6..d1b0b221b 100644
---- a/staprun/staprun.c
-+++ b/staprun/staprun.c
-@@ -547,7 +547,7 @@ int main(int argc, char **argv)
-            us to extend argv[], with all the C fun that entails. */
- #ifdef HAVE_OPENAT
-         if (relay_basedir_fd >= 0) {
--                char ** new_argv = calloc(sizeof(char *),argc+2);
-+                char ** new_argv = calloc(argc+2, sizeof(char *));
-                 const int new_Foption_size = 10; /* -FNNNNN */
-                 char * new_Foption = malloc(new_Foption_size);
-                 int i;
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c574bcb2ba..cc9fc81430 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,17 +1,12 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "e72dc118e563c645d93a1a2d771e8d90e8fec1ae"
-PV = "5.0"
+SRCREV = "3a0c9c15163520dd0d9ab07177da62ce9cc2332f"
+PV = "5.1"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch \
-           file://0001-prerelease-datestamp-fixes.patch \
-           file://0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch \
-           file://0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch \
-           file://0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.45.1


