Return-Path: <mfumita@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC82EC43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 07:04:03 +0000 (UTC)
Received: from anchovy1.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
 by mx.groups.io with SMTP id smtpd.web11.4729.1657263841002655157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 00:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: electromag.com.au,
 ip: 203.30.46.145, mailfrom: mfumita@electromag.com.au)
Received: (qmail 28897 invoked by uid 5089); 8 Jul 2022 07:03:58 -0000
Received: by simscan 1.2.0 ppid: 28796, pid: 28797, t: 0.0575s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL: $rbltext
Received: from unknown (HELO MORI-5540.localdomain)
 (mfumita@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 8 Jul 2022 07:03:57 -0000
Received: by MORI-5540.localdomain (Postfix, from userid 1000)
	id 4E738A31DC9; Fri,  8 Jul 2022 15:03:56 +0800 (AWST)
From: Morikazu Fumita <mfumita@electromag.com.au>
To: openembedded-core@lists.openembedded.org,
  richard.purdie@linuxfoundation.org, preid@electromag.com.au,
  mfumita@electromag.com.au
Subject: [PATCH 1/1] gcc: Fixed libstdc++ configure failure
Date: Fri,  8 Jul 2022 15:03:50 +0800
Message-Id: <20220708070350.23456-1-mfumita@electromag.com.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 07:04:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167815

Since commit 34b0edb0d312 ("gcc: Drop stdlib++ option patch"), configure for libstdc++ failed due to ld error of "dummylib/libstdc++.so: file is empty".
This failure caused _GLIBCXX_HAVE_S_ISREG not to get defined then make_file_type function in libstdc++-v3\src\filesystem\ops-common.h returns file_type::unknown unconditionally.
Fixed by reverting commit 34b0edb0d312 ("gcc: Drop stdlib++ option patch").

Fixes: 34b0edb0d312 ("gcc: Drop stdlib++ option patch")

Signed-off-by: Morikazu Fumita <mfumita@electromag.com.au>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   2 +
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   8 +-
 .../gcc/gcc/0005-optional-libstdc.patch       | 118 ++++++++++++++++++
 3 files changed, 122 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index acbb43a25fb1..e6464d2f5489 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -65,6 +65,8 @@ SRC_URI = "\
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
+           \
+           file://0005-optional-libstdc.patch \
 "
 SRC_URI[sha256sum] = "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index e9f2cf16e840..d2bdfa99db42 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -64,11 +64,7 @@ DEBUG_PREFIX_MAP:class-target = " \
    "
 
 do_configure () {
-	export CXX="${CXX} -nostdinc++ -L${WORKDIR}/dummylib"
-	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
-	# tests. Create a dummy empty lib for the purposes of configure.
-	mkdir -p ${WORKDIR}/dummylib
-	touch ${WORKDIR}/dummylib/libstdc++.so
+	export CXX="${CXX} -nostdinc++ -nostdlib++"
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
@@ -306,7 +302,7 @@ do_check() {
     export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
 
     # HACK: this works around the configure setting CXX with -nostd* args
-    sed -i 's#-nostdinc++ -L${WORKDIR}/dummylib##g' $(find ${B} -name testsuite_flags | head -1)
+    sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
 
     if [ "${TOOLCHAIN_TEST_TARGET}" = "user" ]; then
         # qemu user has issues allocating large amounts of memory
diff --git a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
new file mode 100644
index 000000000000..b856c5dea367
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
@@ -0,0 +1,118 @@
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Subject: [PATCH 3/5] gcc: Add --nostdlib++ option
+
+[gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
+will not run correctly since by default the linker will try to link against libstdc++
+which shouldn't exist yet. We need an option to disable -lstdc++
+option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc
+driver. This patch adds such an option which only disables the -lstdc++.]
+
+[A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to
+do this officially, the likely answer is don't build libstdc++ separately.]
+
+OpenEmbedded/Yocto Project builds libgcc and the other gcc runtime libraries
+separately from the compiler and slightly differently to the standard gcc build.
+
+In general this works well but in trying to build them separately we run into
+an issue since we're using our gcc, not xgcc and there is no way to tell configure
+to use libgcc but not look for libstdc++.
+
+This adds such an option allowing such configurations to work.
+
+2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
+
+gcc/c-family/ChangeLog:
+
+    * c.opt: Add --nostdlib++ option
+
+gcc/cp/ChangeLog:
+
+    * g++spec.c (lang_specific_driver): Add --nostdlib++ option
+
+gcc/ChangeLog:
+
+    * doc/invoke.texi: Document --nostdlib++ option
+    * gcc.c: Add --nostdlib++ option
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582724.html]
+---
+ gcc/c-family/c.opt  | 4 ++++
+ gcc/cp/g++spec.c    | 1 +
+ gcc/doc/invoke.texi | 8 +++++++-
+ gcc/gcc.c           | 1 +
+ 4 files changed, 13 insertions(+), 1 deletion(-)
+
+Index: gcc-11.2.0/gcc/c-family/c.opt
+===================================================================
+--- gcc-11.2.0.orig/gcc/c-family/c.opt
++++ gcc-11.2.0/gcc/c-family/c.opt
+@@ -2153,6 +2153,10 @@ nostdinc++
+ C++ ObjC++
+ Do not search standard system include directories for C++.
+ 
++nostdlib++
++Driver
++Do not link standard C++ runtime library
++
+ o
+ C ObjC C++ ObjC++ Joined Separate
+ ; Documented in common.opt
+Index: gcc-11.2.0/gcc/cp/g++spec.c
+===================================================================
+--- gcc-11.2.0.orig/gcc/cp/g++spec.c
++++ gcc-11.2.0/gcc/cp/g++spec.c
+@@ -159,6 +159,7 @@ lang_specific_driver (struct cl_decoded_
+       switch (decoded_options[i].opt_index)
+ 	{
+ 	case OPT_nostdlib:
++	case OPT_nostdlib__:
+ 	case OPT_nodefaultlibs:
+ 	  library = -1;
+ 	  break;
+Index: gcc-11.2.0/gcc/doc/invoke.texi
+===================================================================
+--- gcc-11.2.0.orig/gcc/doc/invoke.texi
++++ gcc-11.2.0/gcc/doc/invoke.texi
+@@ -239,6 +239,7 @@ in the following sections.
+ -fno-weak  -nostdinc++ @gol
+ -fvisibility-inlines-hidden @gol
+ -fvisibility-ms-compat @gol
++-nostdlib++ @gol
+ -fext-numeric-literals @gol
+ -flang-info-include-translate@r{[}=@var{header}@r{]} @gol
+ -flang-info-include-translate-not @gol
+@@ -632,7 +633,7 @@ Objective-C and Objective-C++ Dialects}.
+ -pie  -pthread  -r  -rdynamic @gol
+ -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
+ -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
+--shared  -shared-libgcc  -symbolic @gol
++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
+ -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
+ -u @var{symbol}  -z @var{keyword}}
+ 
+@@ -15721,6 +15722,11 @@ Specify that the program entry point is
+ interpreted by the linker; the GNU linker accepts either a symbol name
+ or an address.
+ 
++@item -nostdlib++
++@opindex nostdlib++
++Do not use the standard system C++ runtime libraries when linking.
++Only the libraries you specify will be passed to the linker.
++
+ @item -pie
+ @opindex pie
+ Produce a dynamically linked position independent executable on targets
+Index: gcc-11.2.0/gcc/gcc.c
+===================================================================
+--- gcc-11.2.0.orig/gcc/gcc.c
++++ gcc-11.2.0/gcc/gcc.c
+@@ -1162,6 +1162,7 @@ proper position among the other output f
+     %(mflib) " STACK_SPLIT_SPEC "\
+     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
+     %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}}\
++    %{!nostdlib++:}\
+     %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link) }}}}}}"
+ #endif
+ 
-- 
2.25.1


