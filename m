Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FE1C3ABCB
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:20:06 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.128390.1726453201327007112
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b5fIIjvP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2057835395aso45815195ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453200; x=1727058000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlqwSO7uCwZMMmcTUTVBO9dcClPXuCUTT/i3fK89G28=;
        b=b5fIIjvPE7itjUa+BSb7je82hn1Wre+KYatLigKnlpvGj+KbtjTs29MciEdnkR9jQA
         rtGv+E5PSSRHwL0FU5tw7HtWkGFpuIVPQZrtoD9Eh7XALnR4/ae0FC8MYsy++qai0Rwd
         kzmCXCpBUW3R+4FlBCYXLJTXYZbVIabZMicbW9EvVjrilHwLZRNukVwqQxfaLzXSkUMH
         ORqYZLQGBnAPRcFaYjY4KAl7Y0URUofcfdPxZEkkITEqUNzGbQ+tWUQVcDFgRllTI+LN
         xmroNIVhrhJ4GaazAaUmCivqFlOHHcYfMi7kuI08g49bFKjjMEfxohd226JpKsPvgEEI
         jB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453200; x=1727058000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlqwSO7uCwZMMmcTUTVBO9dcClPXuCUTT/i3fK89G28=;
        b=R0PLl2h/RevRZ1YTLtpDx5BY8kV/Xmvx+DalmZn3K6+a0OsyQLxZjrgBmEtMVj1D1Q
         hgyPTxDHdfLF48si6LpkkXeVFzBUXVd1uQRN98vao5u+offgI1TTAwXOVI47vgXeoUai
         9OAfSkCYcVyHJyJo8JedO3SwxIXeVBDE683NZW3cMsUcaDkKWx/IADhhTjdkdXgbSoYm
         6XxRysE6EywdH2jpRmBDpmU/6RaQHy1KZ+Hg5QZe90w9EVhLEbo6pLI8friHosP05sRa
         evcB9ukApbhlDLSStqsivYlqLeauDYzly4EB+w3Fuo6L+CkF6hkjCLf8JB82/75urzwO
         zmwA==
X-Gm-Message-State: AOJu0Yza17kOrXI5ODNl/G0wyaH3vaLUGp4c2ZVAvSCnFm0sAptZ+uIY
	0qhyj+CEOfO9i4nPZsmya++U++iXtSDuuIWubmmR6Toc70hqHLj0yhxg/UawPN9DdHhJtdWyJtE
	rw5Y=
X-Google-Smtp-Source: AGHT+IHiWXF2AS4uHTKjJXqLBZgxbo8TEoqtLDAla+CV1ZazWlC8wUj3WG64BWcKA+ZMYihqCoeHqg==
X-Received: by 2002:a17:903:1c1:b0:207:1848:394e with SMTP id d9443c01a7336-2076e305b0cmr242869085ad.8.1726453200343;
        Sun, 15 Sep 2024 19:20:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:20:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/11] python3-maturin: Fix cross compilation issue for armv7l, mips64, ppc
Date: Sun, 15 Sep 2024 19:19:35 -0700
Message-Id: <d2f73e3840c21997b918d1f1cfae965c618c1076.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204599

From: Niko Mauno <niko.mauno@vaisala.com>

When bitbaking python3-rpds-py it built extension module as:

  site-packages/rpds/rpds.cpython-312-armv7l-linux-gnueabihf.so

Which caused error on target:

  root@qemuarm:~# python3 -c "from rpds import HashTrieMap, HashTrieSet, List"
  Traceback (most recent call last):
    File "<string>", line 1, in <module>
    File "/usr/lib/python3.12/site-packages/rpds/__init__.py", line 1, in <module>
      from .rpds import *
  ModuleNotFoundError: No module named 'rpds.rpds'

Where as it should have been:

  site-packages/rpds/rpds.cpython-312-arm-linux-gnueabihf.so

Associated upstream bug report:
https://github.com/PyO3/maturin/issues/2203

Associated upstream pull request:
https://github.com/PyO3/maturin/pull/2204

Note - mitigation has not been tested with musl:
https://github.com/PyO3/maturin/pull/2204#issuecomment-2323952320

(From OE-Core rev: 32a8a7379008cc6e367b7664c5b10b29f0bb8136)

Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...n-architecture-name-resolvation-code.patch | 107 ++++++++++++++++++
 ...ation-issue-with-linux-armv7l-archit.patch |  76 +++++++++++++
 ...n-ABI-name-resolvation-code-as-helpe.patch |  98 ++++++++++++++++
 ...ation-issue-with-linux-ppc-architect.patch |  68 +++++++++++
 ...ation-issue-with-linux-mips64-archit.patch |  82 ++++++++++++++
 .../python/python3-maturin_1.4.0.bb           |   7 ++
 6 files changed, 438 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch

diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch b/meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch
new file mode 100644
index 0000000000..f75d5a1ba8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch
@@ -0,0 +1,107 @@
+From 42a97ee7100ad158d4b1ba6133ea13cc864a567f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 09:23:10 +0300
+Subject: [PATCH 1/5] Extract extension architecture name resolvation code as
+ helper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit introduces helper InterpreterConfig.get_python_ext_arch() that
+can be used to determine the extension architecture name python uses in
+`ext_suffix` for this architecture.
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/42a97ee7100ad158d4b1ba6133ea13cc864a567f]
+
+Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
+---
+ src/python_interpreter/config.rs | 18 ++++++------------
+ src/target.rs                    | 16 ++++++++++++++++
+ 2 files changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
+index 912f9218..d76606f2 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -47,15 +47,7 @@ impl InterpreterConfig {
+             // Python 2 is not supported
+             return None;
+         }
+-        let python_arch = if matches!(target.target_arch(), Arch::Armv6L | Arch::Armv7L) {
+-            "arm"
+-        } else if matches!(target.target_arch(), Arch::Powerpc64Le) && python_impl == PyPy {
+-            "ppc_64"
+-        } else if matches!(target.target_arch(), Arch::X86) && python_impl == PyPy {
+-            "x86"
+-        } else {
+-            target.get_python_arch()
+-        };
++        let python_ext_arch = target.get_python_ext_arch(python_impl);
+         // See https://github.com/pypa/auditwheel/issues/349
+         let target_env = match python_impl {
+             CPython => {
+@@ -77,7 +69,7 @@ impl InterpreterConfig {
+                 let ldversion = format!("{}{}{}", major, minor, abiflags);
+                 let ext_suffix = format!(
+                     ".cpython-{}-{}-linux-{}.so",
+-                    ldversion, python_arch, target_env
++                    ldversion, python_ext_arch, target_env
+                 );
+                 Some(Self {
+                     major,
+@@ -90,7 +82,8 @@ impl InterpreterConfig {
+             }
+             (Os::Linux, PyPy) => {
+                 let abi_tag = format!("pypy{}{}-{}", major, minor, PYPY_ABI_TAG);
+-                let ext_suffix = format!(".{}-{}-linux-{}.so", abi_tag, python_arch, target_env);
++                let ext_suffix =
++                    format!(".{}-{}-linux-{}.so", abi_tag, python_ext_arch, target_env);
+                 Some(Self {
+                     major,
+                     minor,
+@@ -204,7 +197,8 @@ impl InterpreterConfig {
+             }
+             (Os::Emscripten, CPython) => {
+                 let ldversion = format!("{}{}", major, minor);
+-                let ext_suffix = format!(".cpython-{}-{}-emscripten.so", ldversion, python_arch);
++                let ext_suffix =
++                    format!(".cpython-{}-{}-emscripten.so", ldversion, python_ext_arch);
+                 Some(Self {
+                     major,
+                     minor,
+diff --git a/src/target.rs b/src/target.rs
+index dc7df0cf..84bae559 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -1,4 +1,5 @@
+ use crate::cross_compile::is_cross_compiling;
++use crate::python_interpreter::InterpreterKind;
+ use crate::PlatformTag;
+ use anyhow::{anyhow, bail, format_err, Result};
+ use platform_info::*;
+@@ -368,6 +369,21 @@ impl Target {
+         }
+     }
+ 
++    /// Returns the extension architecture name python uses in `ext_suffix` for this architecture.
++    pub fn get_python_ext_arch(&self, python_impl: InterpreterKind) -> &str {
++        if matches!(self.target_arch(), Arch::Armv6L | Arch::Armv7L) {
++            "arm"
++        } else if matches!(self.target_arch(), Arch::Powerpc64Le)
++            && python_impl == InterpreterKind::PyPy
++        {
++            "ppc_64"
++        } else if matches!(self.target_arch(), Arch::X86) && python_impl == InterpreterKind::PyPy {
++            "x86"
++        } else {
++            self.get_python_arch()
++        }
++    }
++
+     /// Returns the name python uses in `sys.platform` for this os
+     pub fn get_python_os(&self) -> &str {
+         match self.os {
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch b/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch
new file mode 100644
index 0000000000..4366dde111
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch
@@ -0,0 +1,76 @@
+From 0c6b8cc84eff72ed21098029aaba079b899dbee2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 09:23:40 +0300
+Subject: [PATCH 2/5] Fix cross compilation issue with linux-armv7l
+ architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-armv7l target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-armv7l-linux-gnueabihf.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-armv7l'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-arm-linux-gnueabihf.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-arm-linux-gnueabihf.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/0c6b8cc84eff72ed21098029aaba079b899dbee2]
+
+Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
+---
+ src/python_interpreter/config.rs | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
+index d76606f2..5736aedc 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -306,7 +306,7 @@ impl InterpreterConfig {
+                     format!(
+                         ".cpython-{}-{}-{}-{}.{}",
+                         abi_tag,
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         target_env,
+                         file_ext,
+@@ -319,7 +319,7 @@ impl InterpreterConfig {
+                         major,
+                         minor,
+                         abi_tag,
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         target_env,
+                         file_ext,
+@@ -330,7 +330,7 @@ impl InterpreterConfig {
+                     format!(
+                         ".{}-{}-{}.{}",
+                         abi_tag.replace('_', "-"),
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         file_ext,
+                     )
+@@ -341,7 +341,7 @@ impl InterpreterConfig {
+                 format!(
+                     ".cpython-{}-{}-{}.{}",
+                     abi_tag,
+-                    target.get_python_arch(),
++                    target.get_python_ext_arch(interpreter_kind),
+                     target.get_python_os(),
+                     file_ext
+                 )
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch b/meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch
new file mode 100644
index 0000000000..b4a7f69492
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch
@@ -0,0 +1,98 @@
+From fa64426f3a98a0455721c23ec86bd2240708b45e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:07 +0300
+Subject: [PATCH 3/5] Extract extension ABI name resolvation code as helper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit introduces helper InterpreterConfig.get_python_target_env()
+that can be used to determine the extension ABI python uses in
+`ext_suffix` for this architecture.
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/fa64426f3a98a0455721c23ec86bd2240708b45e]
+
+Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
+---
+ src/python_interpreter/config.rs | 19 ++-----------------
+ src/target.rs                    | 20 ++++++++++++++++++++
+ 2 files changed, 22 insertions(+), 17 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
+index 5736aedc..938e9955 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -48,17 +48,7 @@ impl InterpreterConfig {
+             return None;
+         }
+         let python_ext_arch = target.get_python_ext_arch(python_impl);
+-        // See https://github.com/pypa/auditwheel/issues/349
+-        let target_env = match python_impl {
+-            CPython => {
+-                if python_version >= (3, 11) {
+-                    target.target_env().to_string()
+-                } else {
+-                    target.target_env().to_string().replace("musl", "gnu")
+-                }
+-            }
+-            PyPy | GraalPy => "gnu".to_string(),
+-        };
++        let target_env = target.get_python_target_env(python_impl, python_version);
+         match (target.target_os(), python_impl) {
+             (Os::Linux, CPython) => {
+                 let abiflags = if python_version < (3, 8) {
+@@ -294,12 +284,7 @@ impl InterpreterConfig {
+         };
+         let file_ext = if target.is_windows() { "pyd" } else { "so" };
+         let ext_suffix = if target.is_linux() || target.is_macos() {
+-            // See https://github.com/pypa/auditwheel/issues/349
+-            let target_env = if (major, minor) >= (3, 11) {
+-                target.target_env().to_string()
+-            } else {
+-                target.target_env().to_string().replace("musl", "gnu")
+-            };
++            let target_env = target.get_python_target_env(interpreter_kind, (major, minor));
+             match interpreter_kind {
+                 InterpreterKind::CPython => ext_suffix.unwrap_or_else(|| {
+                     // Eg: .cpython-38-x86_64-linux-gnu.so
+diff --git a/src/target.rs b/src/target.rs
+index 84bae559..ad8ebaba 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -1,5 +1,6 @@
+ use crate::cross_compile::is_cross_compiling;
+ use crate::python_interpreter::InterpreterKind;
++use crate::python_interpreter::InterpreterKind::{CPython, GraalPy, PyPy};
+ use crate::PlatformTag;
+ use anyhow::{anyhow, bail, format_err, Result};
+ use platform_info::*;
+@@ -384,6 +385,25 @@ impl Target {
+         }
+     }
+ 
++    /// Returns the environment python uses in `ext_suffix` for this architecture.
++    pub fn get_python_target_env(
++        &self,
++        python_impl: InterpreterKind,
++        python_version: (usize, usize),
++    ) -> String {
++        match python_impl {
++            CPython => {
++                // For musl handling see https://github.com/pypa/auditwheel/issues/349
++                if python_version >= (3, 11) {
++                    self.target_env().to_string()
++                } else {
++                    self.target_env().to_string().replace("musl", "gnu")
++                }
++            }
++            PyPy | GraalPy => "gnu".to_string(),
++        }
++    }
++
+     /// Returns the name python uses in `sys.platform` for this os
+     pub fn get_python_os(&self) -> &str {
+         match self.os {
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch b/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch
new file mode 100644
index 0000000000..bda5dca8f6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch
@@ -0,0 +1,68 @@
+From f2c892109a05db144e8b18bcbcf9c24fe8d977c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:16 +0300
+Subject: [PATCH 4/5] Fix cross compilation issue with linux-ppc architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-ppc target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-ppc-linux-gnu.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-ppc'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-powerpc-linux-gnu.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-powerpc-linux-gnu.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/f2c892109a05db144e8b18bcbcf9c24fe8d977c4]
+
+Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
+---
+ src/python_interpreter/config.rs | 8 ++++++++
+ src/target.rs                    | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
+index 938e9955..8f883887 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -424,6 +424,14 @@ mod test {
+             ".cpython-310-powerpc64le-linux-gnu.so"
+         );
+ 
++        let sysconfig = InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("powerpc-unknown-linux-gnu".to_string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(sysconfig.ext_suffix, ".cpython-310-powerpc-linux-gnu.so");
++
+         let sysconfig = InterpreterConfig::lookup_one(
+             &Target::from_target_triple(Some("s390x-unknown-linux-gnu".to_string())).unwrap(),
+             InterpreterKind::CPython,
+diff --git a/src/target.rs b/src/target.rs
+index ad8ebaba..93afd9bb 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -380,6 +380,8 @@ impl Target {
+             "ppc_64"
+         } else if matches!(self.target_arch(), Arch::X86) && python_impl == InterpreterKind::PyPy {
+             "x86"
++        } else if matches!(self.target_arch(), Arch::Powerpc) {
++            "powerpc"
+         } else {
+             self.get_python_arch()
+         }
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch b/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch
new file mode 100644
index 0000000000..b24196d5dd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch
@@ -0,0 +1,82 @@
+From 5fe643579bcc63d824f6a0f0936fff451c622903 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?=
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:54 +0300
+Subject: [PATCH 5/5] Fix cross compilation issue with linux-mips64
+ architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-mips64 target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-mips64-linux-gnu.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-mips64'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-mips64-linux-gnuabi64.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-mips64-linux-gnuabi64.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/5fe643579bcc63d824f6a0f0936fff451c622903]
+
+Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
+---
+ src/python_interpreter/config.rs | 19 +++++++++++++++++++
+ src/target.rs                    |  4 +++-
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/config.rs
+index 8f883887..ef656010 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -432,6 +432,25 @@ mod test {
+         .unwrap();
+         assert_eq!(sysconfig.ext_suffix, ".cpython-310-powerpc-linux-gnu.so");
+ 
++        let sysconfig = InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("mips64-unknown-linux-gnu".to_string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(
++            sysconfig.ext_suffix,
++            ".cpython-310-mips64-linux-gnuabi64.so"
++        );
++
++        let sysconfig = InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("mips-unknown-linux-gnu".to_string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(sysconfig.ext_suffix, ".cpython-310-mips-linux-gnu.so");
++
+         let sysconfig = InterpreterConfig::lookup_one(
+             &Target::from_target_triple(Some("s390x-unknown-linux-gnu".to_string())).unwrap(),
+             InterpreterKind::CPython,
+diff --git a/src/target.rs b/src/target.rs
+index 93afd9bb..25fc6c07 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -396,7 +396,9 @@ impl Target {
+         match python_impl {
+             CPython => {
+                 // For musl handling see https://github.com/pypa/auditwheel/issues/349
+-                if python_version >= (3, 11) {
++                if matches!(self.target_arch(), Arch::Mips64 | Arch::Mips64el) && self.is_linux() {
++                    "gnuabi64".to_string()
++                } else if python_version >= (3, 11) {
+                     self.target_env().to_string()
+                 } else {
+                     self.target_env().to_string().replace("musl", "gnu")
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
index ed19ee647a..7322de0d08 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
@@ -7,6 +7,13 @@ LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
 
 SRC_URI += "file://0001-Add-32-bit-RISC-V-support.patch"
 SRC_URI[sha256sum] = "ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378bf93790"
+SRC_URI:append = "\
+    file://0001-Extract-extension-architecture-name-resolvation-code.patch \
+    file://0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch \
+    file://0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch \
+    file://0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch \
+    file://0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch \
+"
 
 S = "${WORKDIR}/maturin-${PV}"
 
-- 
2.34.1


