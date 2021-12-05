Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69701C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 23:45:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.44641.1638747937468878058
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 15:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VxlBmX3h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6422180wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 15:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p4MlnpFpTtIiK9Hu01v8DxsOBhVjLOa2YLkX2iAVR2A=;
        b=VxlBmX3hrUvQAWq6RGSTT6uZuXKzWw6p9I+mhn74ZNLJQsrWDUCwW5iEHL8YbPSscv
         6Llx/bIqTSkp9yFwk/hPxFrVxeNXc8rqqx9a+UzEv7bKrXAeIyQVhbeEWogsC9nEGhjW
         l3h2ZHETs9DM6uePD8y5qkSfN2dTlH8o4hdH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p4MlnpFpTtIiK9Hu01v8DxsOBhVjLOa2YLkX2iAVR2A=;
        b=iStgvOI//w8AGo+PVA5qdcDpp7iUQAlcxZy81zYsq6hULycJK8xk0EcPE4vYxvWHZy
         xizrD6/bbOptv+TA8ydUE2ycYfeegzkyTJzvzvA/okUMdRxzzTfhppEKL8B1IPmEa3b2
         ohbuEydfI4J/XU4estY8qy20EL6y6HGvkm3DMSps+K3HRkZ7vWfIJDrxlji0/N3EzXIy
         5ND1JzXeHIQKogRkINb/t+Q5G0atLerUGhQh6D1p1MCp5uYvM/8xdnvpqMmoRdzD5Gia
         8ALRBYh0/BkesP9x9t5sBdCe1zPjokNdwOD20pxO9Lm51E8Zviww7GKluUc9KSmErSQQ
         y5Sw==
X-Gm-Message-State: AOAM533IbdLOhB/g4CIxf7Twa9hHV+LgFTOUyBhJu6ZRIj76CQr4fDIW
	JirIUdF3AlDJOSu18pdSNzAGXOqBom+iwA==
X-Google-Smtp-Source: 
 ABdhPJxdzYJMphqpMZTH0pkMNHTyjKxZpYqwjqrKqQgSzhJYg+oEZG4hAtzYl2KxHpRKfIu34d0GIg==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr34126988wmq.109.1638747935452;
        Sun, 05 Dec 2021 15:45:35 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 b15sm11984071wri.62.2021.12.05.15.45.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 15:45:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] gcc: Drop stdlib++ option patch
Date: Sun,  5 Dec 2021 23:45:31 +0000
Message-Id: <20211205234534.480206-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 23:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159201

The patch to gcc to disable use of libstdc++ when configuring the library
during gcc-runtime is old and there are perhaps better ways to do this now.

If removed, most builds still "work" but incorrect values for things like
atomic ops are found during configure. mips64 and ppc fail with on target
simple tests of g++ in testimage.

Instead we can create a dummy libstdc++ which allows the correct configure
test results to be obtained.

Discussed with upstream about the patch are ongoing, if accepted, we can
switch back to the commandline option if it is added in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |   1 -
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   8 +-
 .../gcc/gcc/0005-optional-libstdc.patch       | 118 ------------------
 3 files changed, 6 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 4c18396a15f..29007d1f19e 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -33,7 +33,6 @@ SRC_URI = "\
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
            file://0002-gcc-poison-system-directories.patch \
            file://0004-64-bit-multilib-hack.patch \
-           file://0005-optional-libstdc.patch \
            file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
            file://0009-cpp-honor-sysroot.patch \
            file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 4839a6687af..c39a0caf8a7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -64,7 +64,11 @@ DEBUG_PREFIX_MAP:class-target = " \
    "
 
 do_configure () {
-	export CXX="${CXX} -nostdinc++ -nostdlib++"
+	export CXX="${CXX} -nostdinc++ -L${WORKDIR}/dummylib"
+	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
+	# tests. Create a dummy empty lib for the purposes of configure.
+	mkdir -p ${WORKDIR}/dummylib
+	touch ${WORKDIR}/dummylib/libstdc++.so
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
@@ -302,7 +306,7 @@ do_check() {
     export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
 
     # HACK: this works around the configure setting CXX with -nostd* args
-    sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
+    sed -i 's#-nostdinc++ -L${WORKDIR}/dummylib##g' $(find ${B} -name testsuite_flags | head -1)
 
     if [ "${TOOLCHAIN_TEST_TARGET}" = "user" ]; then
         # qemu user has issues allocating large amounts of memory
diff --git a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
deleted file mode 100644
index b856c5dea36..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 3/5] gcc: Add --nostdlib++ option
-
-[gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
-will not run correctly since by default the linker will try to link against libstdc++
-which shouldn't exist yet. We need an option to disable -lstdc++
-option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc
-driver. This patch adds such an option which only disables the -lstdc++.]
-
-[A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to
-do this officially, the likely answer is don't build libstdc++ separately.]
-
-OpenEmbedded/Yocto Project builds libgcc and the other gcc runtime libraries
-separately from the compiler and slightly differently to the standard gcc build.
-
-In general this works well but in trying to build them separately we run into
-an issue since we're using our gcc, not xgcc and there is no way to tell configure
-to use libgcc but not look for libstdc++.
-
-This adds such an option allowing such configurations to work.
-
-2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
-
-gcc/c-family/ChangeLog:
-
-    * c.opt: Add --nostdlib++ option
-
-gcc/cp/ChangeLog:
-
-    * g++spec.c (lang_specific_driver): Add --nostdlib++ option
-
-gcc/ChangeLog:
-
-    * doc/invoke.texi: Document --nostdlib++ option
-    * gcc.c: Add --nostdlib++ option
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582724.html]
----
- gcc/c-family/c.opt  | 4 ++++
- gcc/cp/g++spec.c    | 1 +
- gcc/doc/invoke.texi | 8 +++++++-
- gcc/gcc.c           | 1 +
- 4 files changed, 13 insertions(+), 1 deletion(-)
-
-Index: gcc-11.2.0/gcc/c-family/c.opt
-===================================================================
---- gcc-11.2.0.orig/gcc/c-family/c.opt
-+++ gcc-11.2.0/gcc/c-family/c.opt
-@@ -2153,6 +2153,10 @@ nostdinc++
- C++ ObjC++
- Do not search standard system include directories for C++.
- 
-+nostdlib++
-+Driver
-+Do not link standard C++ runtime library
-+
- o
- C ObjC C++ ObjC++ Joined Separate
- ; Documented in common.opt
-Index: gcc-11.2.0/gcc/cp/g++spec.c
-===================================================================
---- gcc-11.2.0.orig/gcc/cp/g++spec.c
-+++ gcc-11.2.0/gcc/cp/g++spec.c
-@@ -159,6 +159,7 @@ lang_specific_driver (struct cl_decoded_
-       switch (decoded_options[i].opt_index)
- 	{
- 	case OPT_nostdlib:
-+	case OPT_nostdlib__:
- 	case OPT_nodefaultlibs:
- 	  library = -1;
- 	  break;
-Index: gcc-11.2.0/gcc/doc/invoke.texi
-===================================================================
---- gcc-11.2.0.orig/gcc/doc/invoke.texi
-+++ gcc-11.2.0/gcc/doc/invoke.texi
-@@ -239,6 +239,7 @@ in the following sections.
- -fno-weak  -nostdinc++ @gol
- -fvisibility-inlines-hidden @gol
- -fvisibility-ms-compat @gol
-+-nostdlib++ @gol
- -fext-numeric-literals @gol
- -flang-info-include-translate@r{[}=@var{header}@r{]} @gol
- -flang-info-include-translate-not @gol
-@@ -632,7 +633,7 @@ Objective-C and Objective-C++ Dialects}.
- -pie  -pthread  -r  -rdynamic @gol
- -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
- -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
---shared  -shared-libgcc  -symbolic @gol
-+-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
- -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
- -u @var{symbol}  -z @var{keyword}}
- 
-@@ -15721,6 +15722,11 @@ Specify that the program entry point is
- interpreted by the linker; the GNU linker accepts either a symbol name
- or an address.
- 
-+@item -nostdlib++
-+@opindex nostdlib++
-+Do not use the standard system C++ runtime libraries when linking.
-+Only the libraries you specify will be passed to the linker.
-+
- @item -pie
- @opindex pie
- Produce a dynamically linked position independent executable on targets
-Index: gcc-11.2.0/gcc/gcc.c
-===================================================================
---- gcc-11.2.0.orig/gcc/gcc.c
-+++ gcc-11.2.0/gcc/gcc.c
-@@ -1162,6 +1162,7 @@ proper position among the other output f
-     %(mflib) " STACK_SPLIT_SPEC "\
-     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
-     %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}}\
-+    %{!nostdlib++:}\
-     %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link) }}}}}}"
- #endif
- 
-- 
2.32.0


