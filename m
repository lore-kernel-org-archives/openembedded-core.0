Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id E6C7D71B2B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:44 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 128so397604486oig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=irN2gJmnQgSsl4QkOojFjky5Fuyq91ePpJrpCFooWeo=;
	b=OXkl8tN/engYp0iRH2FmfgmSZxCfN9ti/Sjrt+NQ+3x92acIQUSHMhNuLb9hCzaqKS
	9sWl8r6HveJInBHI+EChRXxkLwl82tSaPSCGpNk1sVHMX9MQVfQryzz1op52y3wH3hEj
	Os13Dz0TNzlckAtP+TUb1UJK2AgdgfbNF6UQrOiVEw2QBpTzxaIvhljgstOv+Jd2XM0p
	UIMdQP34/C39qVpXRaCTqG3IOZlhcazpFpvH66p3aZRKJKxq1EUgLgUOAvLjqULRxuYz
	l0DvmgkChG2cDpreV9rUDg5fTt/03ClGySEQWJYYLa9py/tDekO09QRqAfLCHtJXkpWe
	uQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=irN2gJmnQgSsl4QkOojFjky5Fuyq91ePpJrpCFooWeo=;
	b=IX/Am3G12oeFguqa/2GnHspsSU+hDX3X0KQiPT07VLFqKw9EshWU3ghPmzTV4Co+4n
	03zV5+YWOvRRJjQ3LXCmtRfWnQw8mxN/N2Z7Y5zVYeQCFkqkEjZmV292HkyTfqiu/M3L
	aKpubxvFVmu9elsrXqMbpAztq+uKiCC81p4gUZO9rUk+OvdPjXLqdNhgyrza+eKwjiaz
	9Ua7pTqAq6SOyeYWEgcU7wlaVhW7jS0s8vqPC+cEgPWdJjA0ifXkEnDY/24bKy6LvVW4
	+vSs2ZprC/0NlpRgGVHCBpyVrs/Q0kD9o7tItmKbyz+YQwWVk5SK3x5UMjk7MHknznsw
	caPw==
X-Gm-Message-State: AIkVDXJAcyvIEGXkaVcoNuKD+7kjJlooKfOWN0oTr3piwPGZOMjfyoReW4147LZZ9+TLtg==
X-Received: by 10.202.173.1 with SMTP id w1mr32663132oie.164.1483645604635;
	Thu, 05 Jan 2017 11:46:44 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:43 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:21 -0700
Message-Id: <719dfc6d6e21c3493d0d67deab963e06f1897d6f.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 09/16] boost: drop flags bits, fix for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:45 -0000

From: Christopher Larson <chris_larson@mentor.com>

boost was adding -march/-mcpu itself, and adding -m32/-m64 itself as well.
Patch that behavior out, apply another similar patch from elsewhere, and
adjust BJAM_OPTS to fix the x32 build.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/boost/boost.inc               |   3 +
 ...-Apply-boost-1.62.0-no-forced-flags.patch.patch | 101 +++++++++++++++
 ...Don-t-set-up-m32-m64-we-do-that-ourselves.patch |  98 ++++++++++++++
 ...p-arch-instruction-set-flags-we-do-that-o.patch | 144 +++++++++++++++++++++
 meta/recipes-support/boost/boost_1.62.0.bb         |   3 +
 5 files changed, 349 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
 create mode 100644 meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
 create mode 100644 meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index a1a6a90..0b2b17d 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -177,6 +177,9 @@ BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 # Native compilation of bzip2 isn't working
 BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
 
+# Adjust the build for x32
+BJAM_OPTS_append_linux-gnux32 = " abi=x32 address-model=64"
+
 do_configure() {
 	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
 
diff --git a/meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch b/meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
new file mode 100644
index 0000000..8cd6ceb
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
@@ -0,0 +1,101 @@
+From 8845a786598f1d9e83aa1b7d2966b0d1eb765ba0 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 10:14:31 -0700
+Subject: [PATCH 1/3] Apply boost-1.62.0-no-forced-flags.patch
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ libs/log/build/Jamfile.v2           |  4 ++--
+ libs/log/config/x86-ext/Jamfile.jam | 16 ++++++++--------
+ libs/log/src/dump_avx2.cpp          |  4 ++++
+ libs/log/src/dump_ssse3.cpp         |  4 ++++
+ 4 files changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/libs/log/build/Jamfile.v2 b/libs/log/build/Jamfile.v2
+index 4abbdbc..b3016fc 100644
+--- a/libs/log/build/Jamfile.v2
++++ b/libs/log/build/Jamfile.v2
+@@ -373,7 +373,7 @@ rule avx2-targets-cond ( properties * )
+             }
+             else if <toolset>clang in $(properties)
+             {
+-                result = <cxxflags>"-mavx -mavx2" ;
++                result = <cxxflags> ;
+             }
+             else if <toolset>intel in $(properties)
+             {
+@@ -383,7 +383,7 @@ rule avx2-targets-cond ( properties * )
+                 }
+                 else
+                 {
+-                    result = <cxxflags>"-xCORE-AVX2 -fabi-version=0" ;
++                    result = <cxxflags>"-fabi-version=0" ;
+                 }
+             }
+             else if <toolset>msvc in $(properties)
+diff --git a/libs/log/config/x86-ext/Jamfile.jam b/libs/log/config/x86-ext/Jamfile.jam
+index 0e9695a..dcc394d 100644
+--- a/libs/log/config/x86-ext/Jamfile.jam
++++ b/libs/log/config/x86-ext/Jamfile.jam
+@@ -15,19 +15,19 @@ project /boost/log/x86-extensions
+ 
+ obj ssse3 : ssse3.cpp
+     :
+-        <toolset>gcc:<cxxflags>"-msse -msse2 -msse3 -mssse3"
+-        <toolset>clang:<cxxflags>"-msse -msse2 -msse3 -mssse3"
+-        <toolset>intel-linux:<cxxflags>"-xSSSE3"
+-        <toolset>intel-darwin:<cxxflags>"-xSSSE3"
++        <toolset>gcc:<cxxflags>
++        <toolset>clang:<cxxflags>
++        <toolset>intel-linux:<cxxflags>
++        <toolset>intel-darwin:<cxxflags>
+         <toolset>intel-win:<cxxflags>"/QxSSSE3"
+     ;
+ 
+ obj avx2 : avx2.cpp
+     :
+-        <toolset>gcc:<cxxflags>"-mavx -mavx2 -fabi-version=0"
+-        <toolset>clang:<cxxflags>"-mavx -mavx2"
+-        <toolset>intel-linux:<cxxflags>"-xCORE-AVX2 -fabi-version=0"
+-        <toolset>intel-darwin:<cxxflags>"-xCORE-AVX2 -fabi-version=0"
++        <toolset>gcc:<cxxflags>"-fabi-version=0"
++        <toolset>clang:<cxxflags>
++        <toolset>intel-linux:<cxxflags>"-fabi-version=0"
++        <toolset>intel-darwin:<cxxflags>"-fabi-version=0"
+         <toolset>intel-win:<cxxflags>"/arch:CORE-AVX2"
+         <toolset>msvc:<cxxflags>"/arch:AVX"
+     ;
+diff --git a/libs/log/src/dump_avx2.cpp b/libs/log/src/dump_avx2.cpp
+index 4ab1250..610fc6d 100644
+--- a/libs/log/src/dump_avx2.cpp
++++ b/libs/log/src/dump_avx2.cpp
+@@ -22,6 +22,10 @@
+ #include <boost/cstdint.hpp>
+ #include <boost/log/detail/header.hpp>
+ 
++#if !defined(__AVX2__)
++#error "AVX2 Unsupported!"
++#endif
++
+ #if defined(__x86_64) || defined(__x86_64__) || \
+     defined(__amd64__) || defined(__amd64) || \
+     defined(_M_X64)
+diff --git a/libs/log/src/dump_ssse3.cpp b/libs/log/src/dump_ssse3.cpp
+index 1325b49..60d4112 100644
+--- a/libs/log/src/dump_ssse3.cpp
++++ b/libs/log/src/dump_ssse3.cpp
+@@ -22,6 +22,10 @@
+ #include <boost/cstdint.hpp>
+ #include <boost/log/detail/header.hpp>
+ 
++#if !defined(__SSSE3__)
++#error "SSSE3 Unsupported!"
++#endif
++
+ #if defined(__x86_64) || defined(__x86_64__) || \
+     defined(__amd64__) || defined(__amd64) || \
+     defined(_M_X64)
+-- 
+2.8.0
+
diff --git a/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch b/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
new file mode 100644
index 0000000..ef9ec55
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch
@@ -0,0 +1,98 @@
+From c0e785f8da2caa6617052b1c7b347e0dffb1520d Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 10:29:17 -0700
+Subject: [PATCH 2/3] Don't set up -m32/-m64, we do that ourselves
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ tools/build/src/tools/gcc.jam | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
+index 0f346a5..942f141 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -509,7 +509,6 @@ rule compile.c++.pch ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+     setup-fpic $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+ }
+ 
+ actions compile.c++.pch
+@@ -521,7 +520,6 @@ rule compile.c.pch ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+     setup-fpic $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+ }
+ 
+ actions compile.c.pch
+@@ -533,7 +531,6 @@ rule compile.c++.preprocess ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+     setup-fpic $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+ 
+     # Some extensions are compiled as C++ by default. For others, we need to
+     # pass -x c++. We could always pass -x c++ but distcc does not work with it.
+@@ -548,7 +545,6 @@ rule compile.c.preprocess ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+     setup-fpic $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+ 
+     # If we use the name g++ then default file suffix -> language mapping does
+     # not work. So have to pass -x option. Maybe, we can work around this by
+@@ -564,7 +560,6 @@ rule compile.c++ ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+     setup-fpic $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+ 
+     # Some extensions are compiled as C++ by default. For others, we need to
+     # pass -x c++. We could always pass -x c++ but distcc does not work with it.
+@@ -594,7 +589,6 @@ rule compile.c ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+     setup-fpic $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+ 
+     # If we use the name g++ then default file suffix -> language mapping does
+     # not work. So have to pass -x option. Maybe, we can work around this by
+@@ -610,7 +604,6 @@ rule compile.fortran ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+     setup-fpic $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+ }
+ 
+ actions compile.c++ bind PCH_FILE
+@@ -641,7 +634,6 @@ actions compile.fortran
+ rule compile.asm ( targets * : sources * : properties * )
+ {
+     setup-fpic $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+     LANG on $(<) = "-x assembler-with-cpp" ;
+ }
+ 
+@@ -950,7 +942,6 @@ rule quote-rpath ( targets * )
+ rule link ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+     SPACE on $(targets) = " " ;
+     # Serialize execution of the 'link' action, since running N links in
+     # parallel is just slower. For now, serialize only gcc links, it might be a
+@@ -1018,7 +1009,6 @@ actions piecemeal archive
+ rule link.dll ( targets * : sources * : properties * )
+ {
+     setup-threading $(targets) : $(sources) : $(properties) ;
+-    setup-address-model $(targets) : $(sources) : $(properties) ;
+     SPACE on $(targets) = " " ;
+     JAM_SEMAPHORE on $(targets) = <s>gcc-link-semaphore ;
+     quote-rpath $(targets) ;
+-- 
+2.8.0
+
diff --git a/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
new file mode 100644
index 0000000..548e051
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -0,0 +1,144 @@
+From 7c49525812567f1219706c4ed330b3bd2cc8e94a Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 10:29:32 -0700
+Subject: [PATCH 3/3] Don't set up arch/instruction-set flags, we do that
+ ourselves
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ tools/build/src/tools/gcc.jam | 121 ------------------------------------------
+ 1 file changed, 121 deletions(-)
+
+diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
+index 942f141..d062c20 100644
+--- a/tools/build/src/tools/gcc.jam
++++ b/tools/build/src/tools/gcc.jam
+@@ -1068,124 +1068,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+         <architecture>$(architecture)/<instruction-set>$(instruction-set)
+         : $(values) ;
+ }
+-
+-
+-# Set architecture/instruction-set options.
+-#
+-# x86 and compatible
+-# The 'native' option appeared in gcc 4.2 so we cannot safely use it as default.
+-# Use i686 instead for 32-bit.
+-toolset.flags gcc OPTIONS <architecture>x86/<address-model>32/<instruction-set> : -march=i686 ;
+-cpu-flags gcc OPTIONS : x86 : native : -march=native ;
+-cpu-flags gcc OPTIONS : x86 : i486 : -march=i486 ;
+-cpu-flags gcc OPTIONS : x86 : i586 : -march=i586 ;
+-cpu-flags gcc OPTIONS : x86 : i686 : -march=i686 ;
+-cpu-flags gcc OPTIONS : x86 : pentium : -march=pentium ;
+-cpu-flags gcc OPTIONS : x86 : pentium-mmx : -march=pentium-mmx ;
+-cpu-flags gcc OPTIONS : x86 : pentiumpro : -march=pentiumpro ;
+-cpu-flags gcc OPTIONS : x86 : pentium2 : -march=pentium2 ;
+-cpu-flags gcc OPTIONS : x86 : pentium3 : -march=pentium3 ;
+-cpu-flags gcc OPTIONS : x86 : pentium3m : -march=pentium3m ;
+-cpu-flags gcc OPTIONS : x86 : pentium-m : -march=pentium-m ;
+-cpu-flags gcc OPTIONS : x86 : pentium4 : -march=pentium4 ;
+-cpu-flags gcc OPTIONS : x86 : pentium4m : -march=pentium4m ;
+-cpu-flags gcc OPTIONS : x86 : prescott : -march=prescott ;
+-cpu-flags gcc OPTIONS : x86 : nocona : -march=nocona ;
+-cpu-flags gcc OPTIONS : x86 : core2 : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : conroe : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : conroe-xe : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : conroe-l : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : allendale : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : wolfdale : -march=core2 -msse4.1 ;
+-cpu-flags gcc OPTIONS : x86 : merom : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : merom-xe : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : kentsfield : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : kentsfield-xe : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : yorksfield : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : penryn : -march=core2 ;
+-cpu-flags gcc OPTIONS : x86 : corei7 : -march=corei7 ;
+-cpu-flags gcc OPTIONS : x86 : nehalem : -march=corei7 ;
+-cpu-flags gcc OPTIONS : x86 : corei7-avx : -march=corei7-avx ;
+-cpu-flags gcc OPTIONS : x86 : sandy-bridge : -march=corei7-avx ;
+-cpu-flags gcc OPTIONS : x86 : core-avx-i : -march=core-avx-i ;
+-cpu-flags gcc OPTIONS : x86 : ivy-bridge : -march=core-avx-i ;
+-cpu-flags gcc OPTIONS : x86 : haswell : -march=core-avx-i -mavx2 -mfma -mbmi -mbmi2 -mlzcnt ;
+-cpu-flags gcc OPTIONS : x86 : k6 : -march=k6 ;
+-cpu-flags gcc OPTIONS : x86 : k6-2 : -march=k6-2 ;
+-cpu-flags gcc OPTIONS : x86 : k6-3 : -march=k6-3 ;
+-cpu-flags gcc OPTIONS : x86 : athlon : -march=athlon ;
+-cpu-flags gcc OPTIONS : x86 : athlon-tbird : -march=athlon-tbird ;
+-cpu-flags gcc OPTIONS : x86 : athlon-4 : -march=athlon-4 ;
+-cpu-flags gcc OPTIONS : x86 : athlon-xp : -march=athlon-xp ;
+-cpu-flags gcc OPTIONS : x86 : athlon-mp : -march=athlon-mp ;
+-##
+-cpu-flags gcc OPTIONS : x86 : k8 : -march=k8 ;
+-cpu-flags gcc OPTIONS : x86 : opteron : -march=opteron ;
+-cpu-flags gcc OPTIONS : x86 : athlon64 : -march=athlon64 ;
+-cpu-flags gcc OPTIONS : x86 : athlon-fx : -march=athlon-fx ;
+-cpu-flags gcc OPTIONS : x86 : k8-sse3 : -march=k8-sse3 ;
+-cpu-flags gcc OPTIONS : x86 : opteron-sse3 : -march=opteron-sse3 ;
+-cpu-flags gcc OPTIONS : x86 : athlon64-sse3 : -march=athlon64-sse3 ;
+-cpu-flags gcc OPTIONS : x86 : amdfam10 : -march=amdfam10 ;
+-cpu-flags gcc OPTIONS : x86 : barcelona : -march=barcelona ;
+-cpu-flags gcc OPTIONS : x86 : bdver1 : -march=bdver1 ;
+-cpu-flags gcc OPTIONS : x86 : bdver2 : -march=bdver2 ;
+-cpu-flags gcc OPTIONS : x86 : bdver3 : -march=bdver3 ;
+-cpu-flags gcc OPTIONS : x86 : btver1 : -march=btver1 ;
+-cpu-flags gcc OPTIONS : x86 : btver2 : -march=btver2 ;
+-cpu-flags gcc OPTIONS : x86 : winchip-c6 : -march=winchip-c6 ;
+-cpu-flags gcc OPTIONS : x86 : winchip2 : -march=winchip2 ;
+-cpu-flags gcc OPTIONS : x86 : c3 : -march=c3 ;
+-cpu-flags gcc OPTIONS : x86 : c3-2 : -march=c3-2 ;
+-##
+-cpu-flags gcc OPTIONS : x86 : atom : -march=atom ;
+-# Sparc
+-cpu-flags gcc OPTIONS : sparc : v7 : -mcpu=v7 : default ;
+-cpu-flags gcc OPTIONS : sparc : cypress : -mcpu=cypress ;
+-cpu-flags gcc OPTIONS : sparc : v8 : -mcpu=v8 ;
+-cpu-flags gcc OPTIONS : sparc : supersparc : -mcpu=supersparc ;
+-cpu-flags gcc OPTIONS : sparc : sparclite : -mcpu=sparclite ;
+-cpu-flags gcc OPTIONS : sparc : hypersparc : -mcpu=hypersparc ;
+-cpu-flags gcc OPTIONS : sparc : sparclite86x : -mcpu=sparclite86x ;
+-cpu-flags gcc OPTIONS : sparc : f930 : -mcpu=f930 ;
+-cpu-flags gcc OPTIONS : sparc : f934 : -mcpu=f934 ;
+-cpu-flags gcc OPTIONS : sparc : sparclet : -mcpu=sparclet ;
+-cpu-flags gcc OPTIONS : sparc : tsc701 : -mcpu=tsc701 ;
+-cpu-flags gcc OPTIONS : sparc : v9 : -mcpu=v9 ;
+-cpu-flags gcc OPTIONS : sparc : ultrasparc : -mcpu=ultrasparc ;
+-cpu-flags gcc OPTIONS : sparc : ultrasparc3 : -mcpu=ultrasparc3 ;
+-# RS/6000 & PowerPC
+-cpu-flags gcc OPTIONS : power : 403 : -mcpu=403 ;
+-cpu-flags gcc OPTIONS : power : 505 : -mcpu=505 ;
+-cpu-flags gcc OPTIONS : power : 601 : -mcpu=601 ;
+-cpu-flags gcc OPTIONS : power : 602 : -mcpu=602 ;
+-cpu-flags gcc OPTIONS : power : 603 : -mcpu=603 ;
+-cpu-flags gcc OPTIONS : power : 603e : -mcpu=603e ;
+-cpu-flags gcc OPTIONS : power : 604 : -mcpu=604 ;
+-cpu-flags gcc OPTIONS : power : 604e : -mcpu=604e ;
+-cpu-flags gcc OPTIONS : power : 620 : -mcpu=620 ;
+-cpu-flags gcc OPTIONS : power : 630 : -mcpu=630 ;
+-cpu-flags gcc OPTIONS : power : 740 : -mcpu=740 ;
+-cpu-flags gcc OPTIONS : power : 7400 : -mcpu=7400 ;
+-cpu-flags gcc OPTIONS : power : 7450 : -mcpu=7450 ;
+-cpu-flags gcc OPTIONS : power : 750 : -mcpu=750 ;
+-cpu-flags gcc OPTIONS : power : 801 : -mcpu=801 ;
+-cpu-flags gcc OPTIONS : power : 821 : -mcpu=821 ;
+-cpu-flags gcc OPTIONS : power : 823 : -mcpu=823 ;
+-cpu-flags gcc OPTIONS : power : 860 : -mcpu=860 ;
+-cpu-flags gcc OPTIONS : power : 970 : -mcpu=970 ;
+-cpu-flags gcc OPTIONS : power : 8540 : -mcpu=8540 ;
+-cpu-flags gcc OPTIONS : power : power : -mcpu=power ;
+-cpu-flags gcc OPTIONS : power : power2 : -mcpu=power2 ;
+-cpu-flags gcc OPTIONS : power : power3 : -mcpu=power3 ;
+-cpu-flags gcc OPTIONS : power : power4 : -mcpu=power4 ;
+-cpu-flags gcc OPTIONS : power : power5 : -mcpu=power5 ;
+-cpu-flags gcc OPTIONS : power : powerpc : -mcpu=powerpc ;
+-cpu-flags gcc OPTIONS : power : powerpc64 : -mcpu=powerpc64 ;
+-cpu-flags gcc OPTIONS : power : rios : -mcpu=rios ;
+-cpu-flags gcc OPTIONS : power : rios1 : -mcpu=rios1 ;
+-cpu-flags gcc OPTIONS : power : rios2 : -mcpu=rios2 ;
+-cpu-flags gcc OPTIONS : power : rsc : -mcpu=rsc ;
+-cpu-flags gcc OPTIONS : power : rs64a : -mcpu=rs64 ;
+-# AIX variant of RS/6000 & PowerPC
+-toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
+-- 
+2.8.0
+
diff --git a/meta/recipes-support/boost/boost_1.62.0.bb b/meta/recipes-support/boost/boost_1.62.0.bb
index 120d129..96f9241 100644
--- a/meta/recipes-support/boost/boost_1.62.0.bb
+++ b/meta/recipes-support/boost/boost_1.62.0.bb
@@ -9,4 +9,7 @@ SRC_URI += "\
     file://0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch \
     file://0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch \
     file://boost-math-disable-pch-for-gcc.patch \
+    file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
+    file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+    file://0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch \
 "
-- 
2.8.0


