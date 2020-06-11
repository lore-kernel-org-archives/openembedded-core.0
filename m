Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web10.6279.1591909282136744351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 14:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I7f/IeBm;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: geissonator@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id n70so5688615ota.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 14:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wfl6Ds2Gljxnz0ea7V/MCWiy/xdQRSp1suxW6NSHdrs=;
        b=I7f/IeBmf+EVAc/viOaFILnJvT1mY/DJ6xYb1Jb0BYIb4t15YekCjrcAJZypX95m28
         0B8WH+4zPS9bsaSD3HAf4TsZBxb93LUkR4ADcFmvTKgm5KLdEknjHCTojCjqH+JXpc1K
         l/TYPZ3ajto7XPGBifgdAFecj+XzijTO+sROl7PEqxWrQh0jml4vJRzEHgSg7Sfqy9VR
         3elm7BCfunX2DGcOjJawVIoBhw+3o0hExr23O2aiSvI1erSgyqhOA7kwqbsZOgVHximP
         qYKPqlbPbmxMIt1GJRBdPYe7NolOh5956PC895zDAFtwuDyUTyD8YEtjr9+k8Atm8ymZ
         3eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wfl6Ds2Gljxnz0ea7V/MCWiy/xdQRSp1suxW6NSHdrs=;
        b=m+WGxDBasPGSgJU5YaOtOQb7JwAEc94Vtjwr9L9PYB2ofR90UIejc+zu2c0x9ebfH3
         hPTMRxWK90oWOAfwRq/qTexhFH6x8uOrW2iZWyvcR7DQ6teMo2vUwK+zHZkeczSPC6BZ
         m3K+s/g+7vMV0asPf9QRKkQ3hs2T8T/xm0747xXdvS3bz7hf5KS1dS7Rp/u8DfruJbYr
         Z+bfSN3gp8ru0QCxhnpfwQz1t+LKg6U0DMtccfem3II7NIzRhI+R9Frrbqt7grK89YX/
         /9ekuw/qaPwMDc6g+uXf1pos5D6Wtdh/wjpLNgOx5R35V6ss7P/NT+U6LGuiglGmAXfb
         pKAg==
X-Gm-Message-State: AOAM531wkUCxbrU9GiewtsPouOMSUeQdMo/YTyu17jUlfDFo8PUpFjDh
	f0bCj97rIDl5mxwlfAspQ91BSq0dZNw=
X-Google-Smtp-Source: ABdhPJwuaVlgL4t+iqc/3R3FDeaQL9FdDu2tMWc5TRF8etszXH4Ru6msmXSr0OG9L8oLKQ1DMmOvSg==
X-Received: by 2002:a05:6830:22ee:: with SMTP id t14mr8444021otc.92.1591909281166;
        Thu, 11 Jun 2020 14:01:21 -0700 (PDT)
Return-Path: <geissonator@gmail.com>
Received: from Andrews-MBP-2.attlocal.net (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id e188sm1007725oib.18.2020.06.11.14.01.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 14:01:20 -0700 (PDT)
From: "Andrew Geissler" <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH] meson: backport library ordering fix
Date: Thu, 11 Jun 2020 16:01:02 -0500
Message-Id: <20200611210102.14077-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

meson had a bug where they started looking for static boost libraries
first vs. the default behavior of looking at shared libraries first.
This caused issues because some projects assume the shared libraries
first which automatically add in other shared library dependencies.
Static libraries do not have the default behavior so projects that use
boost start failing to compile with undefined references to other boost
libraries.

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...sort-shared-before-static-fixes-7171.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-boost-Always-sort-shared-before-static-fixes-7171.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 12bc08648a..a0b54f57db 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://cross-prop-default.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
+           file://0001-boost-Always-sort-shared-before-static-fixes-7171.patch \
            "
 SRC_URI[sha256sum] = "a7716eeae8f8dff002e4147642589ab6496ff839e4376a5aed761f83c1fa0455"
 
diff --git a/meta/recipes-devtools/meson/meson/0001-boost-Always-sort-shared-before-static-fixes-7171.patch b/meta/recipes-devtools/meson/meson/0001-boost-Always-sort-shared-before-static-fixes-7171.patch
new file mode 100644
index 0000000000..217218180e
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-boost-Always-sort-shared-before-static-fixes-7171.patch
@@ -0,0 +1,35 @@
+From 5862ad6965c60caa861dfdcd29e499c34c4d00da Mon Sep 17 00:00:00 2001
+From: Daniel Mensinger <daniel@mensinger-ka.de>
+Date: Thu, 21 May 2020 13:35:27 +0200
+Subject: [PATCH] boost: Always sort shared before static (fixes #7171)
+
+Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/5862ad6965c60caa861dfdcd29e499c34c4d00da]
+
+Signed-off-by: Andrew Geissler <geissonator@gmail.com>
+---
+ mesonbuild/dependencies/boost.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/dependencies/boost.py b/mesonbuild/dependencies/boost.py
+index 6e85c534..38497041 100644
+--- a/mesonbuild/dependencies/boost.py
++++ b/mesonbuild/dependencies/boost.py
+@@ -189,13 +189,13 @@ class BoostLibraryFile():
+     def __lt__(self, other: T.Any) -> bool:
+         if isinstance(other, BoostLibraryFile):
+             return (
+-                self.mod_name, self.version_lib, self.arch, self.static,
++                self.mod_name, self.static, self.version_lib, self.arch,
+                 not self.mt, not self.runtime_static,
+                 not self.debug, self.runtime_debug, self.python_debug,
+                 self.stlport, self.deprecated_iostreams,
+                 self.name,
+             ) < (
+-                other.mod_name, other.version_lib, other.arch, other.static,
++                other.mod_name, other.static, other.version_lib, other.arch,
+                 not other.mt, not other.runtime_static,
+                 not other.debug, other.runtime_debug, other.python_debug,
+                 other.stlport, other.deprecated_iostreams,
+--
+2.26.2
+
-- 
2.24.3 (Apple Git-128)

