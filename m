Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.79.1595088191823600931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2020 09:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@globallogic.com header.s=google header.b=kC41EWle;
 spf=pass (domain: globallogic.com, ip: 209.85.167.42, mailfrom: oleksandr.s.popovych@globallogic.com)
Received: by mail-lf1-f42.google.com with SMTP id b30so5352800lfj.12
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2020 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=SuthXTY6kg9BEB7lWQLYnSuJUoIHqNevMH1LXemfcss=;
        b=kC41EWleMx4iURj79b/6ym6W19+NdBVvp/JGNKsbu1F1TIXSJ6N8LEa02gTe3KyP27
         v3xm2JofhIytdMCBB52Eb3FTsEFZQD62YEfNLkLPhhEfgZCVjemTavl4BRjhytthWHA5
         ho78CzocGTIZS3j0rGEgji5iDQg8pahJmZaakxF8oj3co1djhnJA3sIr3u0ppeB7cDMA
         9dmH//CWImLZqxs1v3cndPVdS0oqsLF6GD3t2fmxWhSDKPLr6fH5PdX1bHFz52/pAd8K
         WEjxmDczqU6dsYOPBLej1CxGJ/c0RSYoNJjc28oRzqrgXutYuA+36CZrh4AVg6WH9ryI
         QABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SuthXTY6kg9BEB7lWQLYnSuJUoIHqNevMH1LXemfcss=;
        b=UENa/lG+pwUG5VFVvGPJYy7Ml0bG5E6fwC1DCYSlBNsLv73xwBiWfYK/vxeQCaIwq0
         ilSQHgy1WHa7A8tVTc5oulTaK3s/KgnyOlbS5qu4k5S1zzf5rkHIdgW4q/QO4qSNUrWz
         wyKLOE7jUsv2U72qeY+8P5qVI1XO7TaswHotYZEIhBQe3VBEj3EF14Q7caBkXX1Bim1+
         iPyrjhIbJTNbl1uGz+k2+J11qkuZRPKbOBQAOhARR7jiFS8PEEstxDyId5phO8rKA05F
         XVhwsilEceGv7r87TKcTVy9QHJ1PCQNF1N3Tb2tfUT88JmKbCt3kRav9GqfOEbsE3L7Y
         uX0Q==
X-Gm-Message-State: AOAM53366WAA9Xd8NGlCc1K6i5FssnvVlrUVZsPFGnxEoFEy1LbwO7lY
	YO0+bbkQAapB3LOfF4ksFOmVkTcKny0=
X-Google-Smtp-Source: ABdhPJw0yLLwAZZHBGOi6nOkI6KiRFe8yr14jOZCgcPZLe/tWiao/pbwDY2GoRJw7Gz1cHI6zUcRhw==
X-Received: by 2002:a19:8c09:: with SMTP id o9mr7104038lfd.160.1595088189489;
        Sat, 18 Jul 2020 09:03:09 -0700 (PDT)
Return-Path: <oleksandr.s.popovych@globallogic.com>
Received: from localhost.localdomain ([92.60.178.172])
        by smtp.gmail.com with ESMTPSA id 202sm1094485lfg.24.2020.07.18.09.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2020 09:03:08 -0700 (PDT)
From: "Oleksandr" <oleksandr.s.popovych@globallogic.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Subject: [OE-core][PATCH v9] expat: Added ptest
Date: Sat, 18 Jul 2020 19:02:09 +0300
Message-Id: <20200718160209.18117-1-oleksandr.s.popovych@globallogic.com>
X-Mailer: git-send-email 2.17.1

For ptest support of expat package:

 - expat_2.2.9.bb recipe was switched on cmake-based building system to
avoid cahnges in autotools build system which considered in upstream as
potentially deprecated (https://github.com/libexpat/libexpat/issues/330).

 - cmake-native_3.17.3.bb recipe was forced to use bundled version of
expat from CMake source tree. Therefore expat-native package has been removed
from DEPENDS variable for cmake-native recipe. Without
these changes, next dependency loop appears:

Dependency loop #1 found:
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_compile (dependent Tasks ['cmake-native_3.17.3.bb:do_configure'])
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_install (dependent Tasks ['cmake-native_3.17.3.bb:do_compile'])
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_populate_sysroot (dependent Tasks ['cmake-native_3.17.3.bb:do_install'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_prepare_recipe_sysroot (dependent Tasks ['cmake-native_3.17.3.bb:do_populate_sysroot', 'ninja_1.10.0.bb:do_populate_sysroot', 'expat_2.2.9.bb:do_fetch'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_configure (dependent Tasks ['expat_2.2.9.bb:do_patch', 'expat_2.2.9.bb:do_prepare_recipe_sysroot', 'expat_2.2.9.bb:do_generate_toolchain_file', 'expat_2.2.9.bb:do_deploy_source_date_epoch'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_compile (dependent Tasks ['expat_2.2.9.bb:do_configure'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_install (dependent Tasks ['expat_2.2.9.bb:do_compile'])
  Task virtual:native:/home/opopovych/repos/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot (dependent Tasks ['expat_2.2.9.bb:do_install'])
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_prepare_recipe_sysroot (dependent Tasks ['expat_2.2.9.bb:do_populate_sysroot', 'xz_5.2.5.bb:do_populate_sysroot', 'bzip2_1.0.8.bb:do_populate_sysroot', 'ncurses_6.2.bb:do_populate_sysroot', 'zlib_1.2.11.bb:do_populate_sysroot', 'cmake-native_3.17.3.bb:do_fetch', 'curl_7.71.1.bb:do_populate_sysroot'])
  Task /home/opopovych/repos/poky/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb:do_configure (dependent Tasks ['cmake-native_3.17.3.bb:do_deploy_source_date_epoch', 'cmake-native_3.17.3.bb:do_patch', 'cmake-native_3.17.3.bb:do_prepare_recipe_sysroot'])

 - run-ptest script that initalizes testing, copies testing
executables' output to log file and measures execution time of each testing
executable was added.

 - patch that implements output of each testcase result in testing exectutable
was added.

Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
---
 meta/recipes-core/expat/expat_2.2.9.bb             | 14 ++++++++++----
 meta/recipes-devtools/cmake/cmake-native_3.17.3.bb |  3 ++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 8f3db41352..61bbca1709 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -8,15 +8,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://libtool-tag.patch \
+	   file://run-ptest \
+	   file://0001-Add-output-of-tests-result.patch \
 	  "
 
 SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
 SRC_URI[sha256sum] = "f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"
 
-inherit autotools lib_package
+EXTRA_OECMAKE += "-DEXPAT_BUILD_DOCS=OFF"
 
-do_configure_prepend () {
-	rm -f ${S}/conftools/libtool.m4
+RDEPENDS_${PN}-ptest += "bash"
+
+inherit cmake lib_package ptest
+
+do_install_ptest_class-target() {
+	install -m 755 ${B}/tests/* ${D}${PTEST_PATH}
 }
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND += "native nativesdk"
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
index b2952ee5f5..d91e42ef9a 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
@@ -1,7 +1,7 @@
 require cmake.inc
 inherit native
 
-DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native"
+DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native"
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
@@ -21,6 +21,7 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "
-- 
2.17.1

