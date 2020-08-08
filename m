Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.4030.1596888530148134543
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 05:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=LzsXpOAY;
 spf=pass (domain: nathanrossi.com, ip: 209.85.216.65, mailfrom: nathan@nathanrossi.com)
Received: by mail-pj1-f65.google.com with SMTP id f9so2351062pju.4
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=bFByEP+PbOZTC9h7uYIlWBdvS8Yx/Z1sOYF+IwJ3PFs=;
        b=LzsXpOAYwAEvfV7cs2sXgfA6UOsBYJUX5d4AQaq70gzUyKra4sM8wyIqInU2nDr4Du
         FSKw10gD/wiWQw5GYDRvshQ0W6bqfmA58N6aGw5ufKpxh2cj2DzFWmZ2W/9tA7wr7wmC
         p7QIuQzy9p38A4yMVipsKu9AJNK8aVN9KYmLgwe1tM9qf5mk8p7HozMNAvcMc4LYCxER
         zIV1Jr0Sjzlr5oxo1eGPkFX7btz6YTcEWt6K4+nNXMq5hDx0tLTFrq0tiUhMZbcaX1xK
         o8VTU6cVqKo7CBZ+ce9Dc/EvvxH6+xpyX4sbnuhn/yvdwP5jA1r2rRE/8gWKX+xydNty
         P5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=bFByEP+PbOZTC9h7uYIlWBdvS8Yx/Z1sOYF+IwJ3PFs=;
        b=ETWoad/D5OKDnknzEYrx1VVSTMn/wHtLU5FOqFoSn6Z9+oD/q8Ibw9XLE12L4cDQ6D
         wfaXDIEZGse/FCDjit7t0yUi2irg4yfDqQU6oMBaxzrgv6g9NpAXd+rWsgzbaPr4b+F2
         4201dnbwuWma3qbrQOmuu/PAzShyko+pNfiCMAtXZWweMphbSZxvuSP5bZsDOyZeiY2R
         jYRoZTQJSR/aFBD3SlMPKVxhPT7gsXNUwJ3b2o63DPbNkIJ2NeFjMOsxCTbpVwj1+gEM
         LTJuZrLomdLUIaKHGcDqZXsfX1is9gNkK/suzAXSbxcQdnQvFnTT6qS3db5WIe7R6LOq
         9JeQ==
X-Gm-Message-State: AOAM530ybV0JXWVdmkgiHYf3iKP/LxNHt+hzo+fHZa0kZE6OnP1nboa/
	rMvjCTykXGYn7aWJDlTxOcBlihVxUjl/yg==
X-Google-Smtp-Source: ABdhPJxYpIjOdtkIYFu4+4nhMp/+xnhAXwqE8fOp2UtwfMJ/uzz4Qry71+bh6vqMnzYulAuVi0GyDQ==
X-Received: by 2002:a17:90a:cc14:: with SMTP id b20mr17485237pju.1.1596888529308;
        Sat, 08 Aug 2020 05:08:49 -0700 (PDT)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-68-14.751444.bne.nbn.aussiebb.net. [117.20.68.14])
        by smtp.gmail.com with UTF8SMTPSA id u15sm13679047pgm.10.2020.08.08.05.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 05:08:48 -0700 (PDT)
Date: Sat, 08 Aug 2020 12:08:43 +0000
Message-Id: <20200808120843.299177-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] cmake.bbclass: Rework compiler program variables for allarch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

CMake projects can specify the NONE project type. Projects that do this
do not use any C or C++ compiler, this currently works fine with caveat
that when changing the machine/arch the compiler is different causing
signature hash differences.

To avoid the signature hash differences clear the associated C/CXX
compiler variables. In order to achieve this with overrides, simplify
the existing construction of the values using a python function and
variable setting and remove the anonymous variable setup.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/cmake.bbclass | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8243f7ce8c..7c055e8a3d 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -21,23 +21,6 @@ python() {
         d.setVarFlag("do_compile", "progress", r"outof:^\[(\d+)/(\d+)\]\s+")
     else:
         bb.fatal("Unknown CMake Generator %s" % generator)
-
-    # C/C++ Compiler (without cpu arch/tune arguments)
-    if not d.getVar('OECMAKE_C_COMPILER'):
-        cc_list = d.getVar('CC').split()
-        if cc_list[0] == 'ccache':
-            d.setVar('OECMAKE_C_COMPILER_LAUNCHER', cc_list[0])
-            d.setVar('OECMAKE_C_COMPILER', cc_list[1])
-        else:
-            d.setVar('OECMAKE_C_COMPILER', cc_list[0])
-
-    if not d.getVar('OECMAKE_CXX_COMPILER'):
-        cxx_list = d.getVar('CXX').split()
-        if cxx_list[0] == 'ccache':
-            d.setVar('OECMAKE_CXX_COMPILER_LAUNCHER', cxx_list[0])
-            d.setVar('OECMAKE_CXX_COMPILER', cxx_list[1])
-        else:
-            d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
 }
 OECMAKE_AR ?= "${AR}"
 
@@ -51,8 +34,23 @@ OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LD
 CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
 CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
 
-OECMAKE_C_COMPILER_LAUNCHER ?= ""
-OECMAKE_CXX_COMPILER_LAUNCHER ?= ""
+def oecmake_map_compiler(compiler, d):
+    args = d.getVar(compiler).split()
+    if args[0] == "ccache":
+        return args[1], args[0]
+    return args[0], ""
+
+# C/C++ Compiler (without cpu arch/tune arguments)
+OECMAKE_C_COMPILER ?= "${@oecmake_map_compiler('CC', d)[0]}"
+OECMAKE_C_COMPILER_LAUNCHER ?= "${@oecmake_map_compiler('CC', d)[1]}"
+OECMAKE_CXX_COMPILER ?= "${@oecmake_map_compiler('CXX', d)[0]}"
+OECMAKE_CXX_COMPILER_LAUNCHER ?= "${@oecmake_map_compiler('CXX', d)[1]}"
+
+# clear compiler vars for allarch to avoid sig hash difference
+OECMAKE_C_COMPILER_allarch = ""
+OECMAKE_C_COMPILER_LAUNCHER_allarch = ""
+OECMAKE_CXX_COMPILER_allarch = ""
+OECMAKE_CXX_COMPILER_LAUNCHER_allarch = ""
 
 OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
---
2.28.0
