Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.57887.1595862637298727403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Lglk0lh6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id k4so8140280pld.12
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rvtihaHxivKE3PMHS5cxFAXJM/gySM5JXhxx+AyDQWw=;
        b=Lglk0lh60Y7d/gs8CKOwVg6UuUgn1hOG92KkFsu0MqmgeisvsFhZian5vdGXOj8dd3
         zez4OqX6uCHqEn+wZDRflancNMBDDNIQOwf3ycN3enTZj2BIiUBNgFgfN4z+GBVzSEZG
         nNVeZRiokoTVsbLseLcQnm5+taFKsZra1BmV77tLQWORDLlMOIjPtr1SLUcwhM5AflTe
         Kh1Shh2lmmWxRpRe/ZooczoGsNeJfh+aWVUQP30Xr1FSEkFEzvdXoEbRffjDzd87rH8A
         aznIoNToQ++KSJqyGLMQ4GIBabqfXk1Fxm7T72saQmH5npTPTmaPBjKL+JchwgB4i8ZS
         lLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rvtihaHxivKE3PMHS5cxFAXJM/gySM5JXhxx+AyDQWw=;
        b=UtqLPHGr1mb4dd/Xrq/pL5OehKFkIsksGkgKk5W3Ym4ilRO32bykI6XOEPymroRGgE
         5C+lueVUlmGNN1lSqzmIR87PiShzuK1G/DQz6lTuSWexZ9UKz53Iju9TFH1GHfW9pYZ2
         YJtV/cwDJu4ymcU7vV1vHlH6XKc6PpDafOogOlaG3b7qNM3xAg09DNBdoqbLFJCHK431
         y3OsKd7zhCMmHnVPGd1Rh49gFzaDDH98c7FE0uGHCbdHEhvJRRDcyr3m/YS3LtqHnSZr
         joQrdZJxxQ/Z+sFkNRIVEKZHpMJ6Nz+UtwTNMr9xewOgU58XwlRzBV3dk71Qc73AEBuz
         0Hhw==
X-Gm-Message-State: AOAM530xbnTXsIpnniVKkMDKH3CZDQdNbnanh+zEzQ2y6kHsyGc4tqIi
	/+d/K4ZWTaicYjseTP5zEOzhP3z8hAo=
X-Google-Smtp-Source: ABdhPJy6C87bhv5HD2HC9+NtOv3LCGY/s5qqRImD5o4Ba2r9yUd4qc57gS7HaAwHGbKoP0T8hPRveg==
X-Received: by 2002:a17:90a:e60b:: with SMTP id j11mr19566975pjy.189.1595862636271;
        Mon, 27 Jul 2020 08:10:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/18] classes/cmake: Fix host detection
Date: Mon, 27 Jul 2020 05:09:49 -1000
Message-Id: <59b8c49a54b8977ba2f3ed4f33f0fd3f7dd749d5.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Fixes the class to use HOST_OS and HOST_ARCH to set the cmake SYSTEM
variables. The HOST variables should be used instead of
TARGET_OS/TARGET_ARCH because we want to control how cmake compiles for
where the package is going to run (the host), not what it will be
generating output for (the target). The distinction is only really
relevant when building canadian cross recipes.

Also fix up the host OS detection to account for MinGW by setting
CMAKE_SYSTEM_NAME to "Windows". This eliminates the need for meta-mingw
to patch this in all the cmake recipes it builds.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 01245db2893e39ffb5d4a00e4689f048d0698974)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cmake.bbclass | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 94ed8061bb..8243f7ce8c 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -70,15 +70,22 @@ CMAKE_BUILD_PARALLEL_LEVEL_task-install = "${@oe.utils.parallel_make(d, True)}"
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
 
+def map_host_os_to_system_name(host_os):
+    if host_os.startswith('mingw'):
+        return 'Windows'
+    if host_os.startswith('linux'):
+        return 'Linux'
+    return host_os
+
 # CMake expects target architectures in the format of uname(2),
 # which do not always match TARGET_ARCH, so all the necessary
 # conversions should happen here.
-def map_target_arch_to_uname_arch(target_arch):
-    if target_arch == "powerpc":
+def map_host_arch_to_uname_arch(host_arch):
+    if host_arch == "powerpc":
         return "ppc"
-    if target_arch == "powerpc64":
+    if host_arch == "powerpc64":
         return "ppc64"
-    return target_arch
+    return host_arch
 
 cmake_do_generate_toolchain_file() {
 	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
@@ -88,8 +95,8 @@ cmake_do_generate_toolchain_file() {
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
 $cmake_crosscompiling
-set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
-set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
+set( CMAKE_SYSTEM_NAME ${@map_host_os_to_system_name(d.getVar('HOST_OS'))} )
+set( CMAKE_SYSTEM_PROCESSOR ${@map_host_arch_to_uname_arch(d.getVar('HOST_ARCH'))} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
 set( CMAKE_C_COMPILER_LAUNCHER ${OECMAKE_C_COMPILER_LAUNCHER} )
-- 
2.17.1

