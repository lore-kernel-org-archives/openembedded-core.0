Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEF5CCA482
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.51510.1658306732609173735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GO6QnLxZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id z22so9883544edd.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nKs68WD4tuctGy8i2nOKZLpsRnHxHjKIRjdsBg1i1lg=;
        b=GO6QnLxZsS8wsxiVaW0bITQo3TPrT1kLEKwyFt7Js4z/oQ7D/L8elWOmxiA3luP1m3
         mVJAvHrlNE9ibOg6cTNkm3PelQy/o5w1Q+GLKdimVkGJhTB5YHGQ+Njx1Xy/BFEO7FAC
         S4DQerXjccl9U+/f2ePLWwH3TlaY6XxHTB5+qWCVvmXZ2cIVAbQeHwL5O59sMZA4yxeQ
         LcAWywM2ZW5IEbEZqIPl2hn+8OQdkCWGoGe8FpBaMIn50ZYqc9r1tWqFz6z+Z+W3b2hw
         ckJsntlTckAONxW5Xmuv8s+x7CF3Fv7r0RFVnlA/OBW4xqpIt2vPnuYBUUtnCOtwM19j
         //lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nKs68WD4tuctGy8i2nOKZLpsRnHxHjKIRjdsBg1i1lg=;
        b=yBz2TOPf6ueAoXnd5hRJkn8Cs1ewUZpe/NY4/FNILWGJyV9mhmmodK88AYz/bVVPYu
         DtoQXFIKQfPOIVlTcj3Otxqb+kY3JoiUo4fptZ/4Nw/gDc1Rz0CPahzChA94dahLOVEI
         H7tv70hTIhy8AZbkAXWkYmaeIJko/QIJtB+Fr/UjL94pg61bG1dlrKmDlT1kzfv7pkL8
         1ePD7Uwvn5LWpyMR0JS+DTph2g/4d2KA5Ty0AnkBJInC99+3TBL5H1Nmad5C2m/r3vJX
         FFYUopPXccxBZNj28SnIqBhyD5l1mxDU9AtvgJzugivwh1ICPu4PVsqxcWwAsZ2TdKwe
         iK+A==
X-Gm-Message-State: AJIora9YJV7v1/KGfRujytlBMKbaVbFluWmqYaunHMgxRWSyd6m/m+ZP
	c9sHkIRyvIImmSCEAwfOOraEQCWKsC4=
X-Google-Smtp-Source: 
 AGRyM1sCONbAkINXXqqD3mmCh5RtgqHy4v3mz5pw5JPgtAtGc0qxjI5rXm9BrmEWzjiCyk8k0Ac/nA==
X-Received: by 2002:a05:6402:510c:b0:43a:e041:a371 with SMTP id
 m12-20020a056402510c00b0043ae041a371mr48249358edd.424.1658306731103;
        Wed, 20 Jul 2022 01:45:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/51] python3-setuptools-rust: upgrade 1.3.0 -> 1.4.1
Date: Wed, 20 Jul 2022 10:44:33 +0200
Message-Id: <20220720084442.2940187-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168337

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...92f08b1248dc03862da86915c2745e0ff7ec.patch | 221 ++++++++++++++++++
 ....0.bb => python3-setuptools-rust_1.4.1.bb} |   5 +-
 2 files changed, 224 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools-rust/8e9892f08b1248dc03862da86915c2745e0ff7ec.patch
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.3.0.bb => python3-setuptools-rust_1.4.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust/8e9892f08b1248dc03862da86915c2745e0ff7ec.patch b/meta/recipes-devtools/python/python3-setuptools-rust/8e9892f08b1248dc03862da86915c2745e0ff7ec.patch
new file mode 100644
index 0000000000..2a531e17aa
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools-rust/8e9892f08b1248dc03862da86915c2745e0ff7ec.patch
@@ -0,0 +1,221 @@
+From 8e9892f08b1248dc03862da86915c2745e0ff7ec Mon Sep 17 00:00:00 2001
+From: "Andrew J. Hesford" <ajh@sideband.org>
+Date: Fri, 15 Jul 2022 10:33:02 -0400
+Subject: [PATCH] build_rust: remove linker handling that broke cross
+ compilation
+
+Upstream-Status: Submitted [https://github.com/PyO3/setuptools-rust/pull/269]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ setuptools_rust/build.py | 151 ++-------------------------------------
+ 1 file changed, 7 insertions(+), 144 deletions(-)
+
+diff --git a/setuptools_rust/build.py b/setuptools_rust/build.py
+index 4fe594b..e81ed8f 100644
+--- a/setuptools_rust/build.py
++++ b/setuptools_rust/build.py
+@@ -113,23 +113,10 @@ def build_extension(
+         self, ext: RustExtension, forced_target_triple: Optional[str] = None
+     ) -> List["_BuiltModule"]:
+ 
+-        target_info = self._detect_rust_target(forced_target_triple)
+-        if target_info is not None:
+-            target_triple = target_info.triple
+-            cross_lib = target_info.cross_lib
+-            linker = target_info.linker
+-            # We're ignoring target_info.linker_args for now because we're not
+-            # sure if they will always do the right thing. Might help with some
+-            # of the OS-specific logic if it does.
+-
+-        else:
+-            target_triple = None
+-            cross_lib = None
+-            linker = None
+-
++        target_triple = self._detect_rust_target(forced_target_triple)
+         rustc_cfgs = get_rustc_cfgs(target_triple)
+ 
+-        env = _prepare_build_environment(cross_lib)
++        env = _prepare_build_environment()
+ 
+         if not os.path.exists(ext.path):
+             raise DistutilsFileError(
+@@ -150,9 +137,6 @@ def build_extension(
+ 
+         rustflags = []
+ 
+-        if linker is not None:
+-            rustflags.extend(["-C", "linker=" + linker])
+-
+         if ext._uses_exec_binding():
+             command = [self.cargo, "build", "--manifest-path", ext.path, *cargo_args]
+ 
+@@ -407,45 +391,12 @@ def _py_limited_api(self) -> _PyLimitedApi:
+ 
+     def _detect_rust_target(
+         self, forced_target_triple: Optional[str] = None
+-    ) -> Optional["_TargetInfo"]:
++    ) -> Optional[str]:
+         assert self.plat_name is not None
+-        cross_compile_info = _detect_unix_cross_compile_info()
+-        if cross_compile_info is not None:
+-            cross_target_info = cross_compile_info.to_target_info()
+-            if forced_target_triple is not None:
+-                if (
+-                    cross_target_info is not None
+-                    and not cross_target_info.is_compatible_with(forced_target_triple)
+-                ):
+-                    self.warn(
+-                        f"Forced Rust target `{forced_target_triple}` is not "
+-                        f"compatible with deduced Rust target "
+-                        f"`{cross_target_info.triple}` - the built package "
+-                        f" may not import successfully once installed."
+-                    )
+-
+-                # Forcing the target in a cross-compile environment; use
+-                # the cross-compile information in combination with the
+-                # forced target
+-                return _TargetInfo(
+-                    forced_target_triple,
+-                    cross_compile_info.cross_lib,
+-                    cross_compile_info.linker,
+-                    cross_compile_info.linker_args,
+-                )
+-            elif cross_target_info is not None:
+-                return cross_target_info
+-            else:
+-                raise DistutilsPlatformError(
+-                    "Don't know the correct rust target for system type "
+-                    f"{cross_compile_info.host_type}. Please set the "
+-                    "CARGO_BUILD_TARGET environment variable."
+-                )
+-
+-        elif forced_target_triple is not None:
++        if forced_target_triple is not None:
+             # Automatic target detection can be overridden via the CARGO_BUILD_TARGET
+             # environment variable or --target command line option
+-            return _TargetInfo.for_triple(forced_target_triple)
++            return forced_target_triple
+ 
+         # Determine local rust target which needs to be "forced" if necessary
+         local_rust_target = _adjusted_local_rust_target(self.plat_name)
+@@ -457,7 +408,7 @@ def _detect_rust_target(
+             # check for None first to avoid calling to rustc if not needed
+             and local_rust_target != get_rust_host()
+         ):
+-            return _TargetInfo.for_triple(local_rust_target)
++            return local_rust_target
+ 
+         return None
+ 
+@@ -547,91 +498,6 @@ class _BuiltModule(NamedTuple):
+     path: str
+ 
+ 
+-class _TargetInfo(NamedTuple):
+-    triple: str
+-    cross_lib: Optional[str]
+-    linker: Optional[str]
+-    linker_args: Optional[str]
+-
+-    @staticmethod
+-    def for_triple(triple: str) -> "_TargetInfo":
+-        return _TargetInfo(triple, None, None, None)
+-
+-    def is_compatible_with(self, target: str) -> bool:
+-        if self.triple == target:
+-            return True
+-
+-        # the vendor field can be ignored, so x86_64-pc-linux-gnu is compatible
+-        # with x86_64-unknown-linux-gnu
+-        if _replace_vendor_with_unknown(self.triple) == target:
+-            return True
+-
+-        return False
+-
+-
+-class _CrossCompileInfo(NamedTuple):
+-    host_type: str
+-    cross_lib: Optional[str]
+-    linker: Optional[str]
+-    linker_args: Optional[str]
+-
+-    def to_target_info(self) -> Optional[_TargetInfo]:
+-        """Maps this cross compile info to target info.
+-
+-        Returns None if the corresponding target information could not be
+-        deduced.
+-        """
+-        # hopefully an exact match
+-        targets = get_rust_target_list()
+-        if self.host_type in targets:
+-            return _TargetInfo(
+-                self.host_type, self.cross_lib, self.linker, self.linker_args
+-            )
+-
+-        # the vendor field can be ignored, so x86_64-pc-linux-gnu is compatible
+-        # with x86_64-unknown-linux-gnu
+-        without_vendor = _replace_vendor_with_unknown(self.host_type)
+-        if without_vendor is not None and without_vendor in targets:
+-            return _TargetInfo(
+-                without_vendor, self.cross_lib, self.linker, self.linker_args
+-            )
+-
+-        return None
+-
+-
+-def _detect_unix_cross_compile_info() -> Optional["_CrossCompileInfo"]:
+-    # See https://github.com/PyO3/setuptools-rust/issues/138
+-    # This is to support cross compiling on *NIX, where plat_name isn't
+-    # necessarily the same as the system we are running on.  *NIX systems
+-    # have more detailed information available in sysconfig. We need that
+-    # because plat_name doesn't give us information on e.g., glibc vs musl.
+-    host_type = sysconfig.get_config_var("HOST_GNU_TYPE")
+-    build_type = sysconfig.get_config_var("BUILD_GNU_TYPE")
+-
+-    if not host_type or host_type == build_type:
+-        # not *NIX, or not cross compiling
+-        return None
+-
+-    if "apple-darwin" in host_type and (build_type and "apple-darwin" in build_type):
+-        # On macos and the build and host differ. This is probably an arm
+-        # Python which was built on x86_64. Don't try to handle this for now.
+-        # (See https://github.com/PyO3/setuptools-rust/issues/192)
+-        return None
+-
+-    stdlib = sysconfig.get_path("stdlib")
+-    assert stdlib is not None
+-    cross_lib = os.path.dirname(stdlib)
+-
+-    bldshared = sysconfig.get_config_var("BLDSHARED")
+-    if not bldshared:
+-        linker = None
+-        linker_args = None
+-    else:
+-        [linker, _, linker_args] = bldshared.partition(" ")
+-
+-    return _CrossCompileInfo(host_type, cross_lib, linker, linker_args)
+-
+-
+ def _replace_vendor_with_unknown(target: str) -> Optional[str]:
+     """Replaces vendor in the target triple with unknown.
+ 
+@@ -644,7 +510,7 @@ def _replace_vendor_with_unknown(target: str) -> Optional[str]:
+     return "-".join(components)
+ 
+ 
+-def _prepare_build_environment(cross_lib: Optional[str]) -> Dict[str, str]:
++def _prepare_build_environment() -> Dict[str, str]:
+     """Prepares environment variables to use when executing cargo build."""
+ 
+     # Make sure that if pythonXX-sys is used, it builds against the current
+@@ -665,9 +531,6 @@ def _prepare_build_environment(cross_lib: Optional[str]) -> Dict[str, str]:
+         }
+     )
+ 
+-    if cross_lib:
+-        env.setdefault("PYO3_CROSS_LIB_DIR", cross_lib)
+-
+     env.pop("CARGO", None)
+     return env
+ 
diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.4.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.4.1.bb
index 51e27b843e..c63a3f2b52 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.4.1.bb
@@ -9,8 +9,9 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz"
-SRC_URI[sha256sum] = "958c5bf4ab6483d59dab888538121871cc5006354a42fb0fbd50acf03caad1de"
+SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
+           file://8e9892f08b1248dc03862da86915c2745e0ff7ec.patch"
+SRC_URI[sha256sum] = "18ff850831f58ee21d5783825c99fad632da21e47645e9427fd7dec048029e76"
 
 inherit cargo pypi python_setuptools_build_meta
 
-- 
2.30.2


