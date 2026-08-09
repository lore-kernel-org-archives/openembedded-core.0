Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3D9C5AD7B
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 20:29:53 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16064.1786307383559757093
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 13:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SCtN9hF7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso986442f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786307382; x=1786912182; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9kSoczfkfY0WDaaqlgvqz4S7l+WoI/K7sDhwlCUjqU=;
        b=SCtN9hF70p/YJovxVAGqXbju9oSGGzq5ICWmnKrl5hs56z12AtJ5WbHbyNlPzDamn5
         Thb/e126I1+rzaCMBwgmHifgaxJlixfAIHt2gU9vWVSTTaoLnrCt3XOchZDQ8I6feCBk
         DJtbW0AbsFRBHUhKNkZeku/jJhg/NIWtYoEwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307382; x=1786912182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9kSoczfkfY0WDaaqlgvqz4S7l+WoI/K7sDhwlCUjqU=;
        b=IzQPhCdFj16yA7qn1aZCykfMblsa0PN92NrP+gVP5MwLbC/IAPLqmKgfK8o2b9qqC0
         AEr7603QrY99YSa4Y/YQRtuU6679j+G8c17xEoJ0H0v6FiLP2AXSjpz0UVdr2yqdYGYV
         hOfLt50OMH5DsKbh3GeK2w1bVHdLM7lIgC6VjJE7lIIjBTnRQ69AaCuzW6U0/mBesHBA
         Rkh3FLMogdIHGlEkt8HHvGt5DkFDBsl51CX0+SuY3BX4LMYyPFxv0sgiUH6wXwdN2I+W
         rcHm82I16loFQKNJdlTnrQjfghumGzCXtMJ0bnpStWwFKfN3TZZyfKEknESoR2VisoP+
         o8lQ==
X-Gm-Message-State: AOJu0YxmpmpiKUEmFmk7KIW0TUBvn5HMMzOWJuI8GJPNEIw7SGSi9hf+
	EmyKOOdkt8ATwzhv7GpJrjhIno3WECT7Eg8pej+tEcspy0f1ndMTdd77/RiUJN8piphhSm92qj3
	8u/x679g=
X-Gm-Gg: AR+sD12/FnO6krQ62AnCuqiuFCW1RU4lTnU5lp/y2y/yXopuu3egYOYqEvG9jUWKHw6
	LDXF7kYMEsIrda6lPbUdQ0rh7T+6ingtNbFpjwgGtJnO4idB843J88hD2YZP/HK5cqk+rCVL+6i
	rlY/bQtsYQq5SukF7kZffu7kmqmX4+FvcpXQHd/HKG256jNxXBFqwxIqX0jH+peFtskwoCiPpoa
	r0s9X8Yxls37OrJN603ydtR9MTnyWudTTQ6cSymUSAmT/GZvCXG9oq0a2DXjgCtFisl1qOb+u92
	zZDHP0qQ2Trh9Y1fFOPzMXXM1D4/sEx/EyDDFVRY1kYwmOx+QuB+tPj5dJBWmlz5lLiUUEW8loV
	S79GdgQYtEwPBl6JnQqjzGb4qUCNWV9jQVYfH9pZwfnKjCBWopue34phcJeYILMYNkmOUlkmA/l
	7Ch9+pOnxi9yb0GaklQUtscDU9bB/XZsHVstFX/VsDKtlURcz2g0woofjRKOP2oK30kj6qvkjnm
	Z790zxyst7O2JOv9w==
X-Received: by 2002:a05:6000:46d4:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-47fec4ea601mr40700536f8f.8.1786307381680;
        Sun, 09 Aug 2026 13:29:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50cd:e139:7482:bd41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8b9bsm31267873f8f.25.2026.08.09.13.29.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:29:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-setuptools: upgrade 83.0.0 -> 84.0.0
Date: Sun,  9 Aug 2026 21:29:34 +0100
Message-ID: <20260809202935.1904858-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809202935.1904858-1-richard.purdie@linuxfoundation.org>
References: <20260809202935.1904858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 20:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243077

https://setuptools.pypa.io/en/latest/history.html

v84.0.0
=======

Features

    Newline-separated keywords and platforms, which are invalid and corrupt the generated metadata
    (pypa/setuptools#4887), are now handled forgivingly: each line is treated as a separate item and
    a deprecation warning is emitted. Newlines were never a valid separator for these fields – the
    old specification separated items with spaces and the current one uses commas. (#4887)

    Extension is now a dataclass, exposing type annotations for its constructor arguments so subclasses
    (e.g. in Setuptools) can inherit them without redeclaring each parameter. Passing unknown keyword
    arguments is now deprecated. (pypa/distutils#373) (#5022)

    The C compiler modules now emit log messages through their own compilers.C.* loggers instead of the
    distutils root logger, part of decoupling the compilers package from distutils. The logger names are
    normalized to a stable compilers.C.* prefix so they remain constant as the package migrates toward a
    standalone compilers.C distribution. (#5266)

    The C compilers gained a Compiler.call method – a thin wrapper over subprocess.check_call (with macOS
    deployment-target env injection) that is the modern replacement for Compiler.spawn. The compilers no
    longer depend on distutils.spawn, distutils.dir_util, distutils.file_util, distutils._modified, or
    distutils.util.execute/split_quoted: the generic newer/newer_group and split_quoted helpers are
    vendored into the compilers package, and Compiler.mkpath/move_file/execute are implemented directly
    on the standard library (os.makedirs/shutil.move). The methods are retained for backward
    compatibility. (#5267)

    The compilers no longer depend on distutils.util, distutils.version, distutils.compat, or
    distutils._macos_compat. The platform-identification helpers (get_platform/get_host_platform/is_mingw)
    now live in distutils.compilers.platform.detect and the macOS deployment-target logic and compiler_fixup
    in distutils.compilers.platform.macos; CygwinCCompiler.gcc_version returns a packaging.version.Version.
    distutils.util re-exports the platform/macOS helpers from their new homes for backward compatibility
    rather than keeping duplicate copies. (sysconfig lookups still route through distutils pending its
    own decoupling.) (#5268)

    The compilers now read their build configuration from the standard library’s sysconfig instead of
    distutils.sysconfig. Per-compiler customization – previously distutils.sysconfig.customize_compiler
    – has moved into Compiler.configure_system(): a no-op on the base class, with UnixCCompiler
    applying the compiler/flag/archiver settings CPython recorded in sysconfig (and the usual
    CC/CFLAGS/LDSHARED/… environment overrides). distutils.sysconfig.customize_compiler is retained
    as a thin wrapper that calls compiler.configure_system(). (#5269)

Bugfixes

    The MSVC linker now passes its arguments through a response file when the command line would exceed
    the Windows maximum length, fixing failures when linking a large number of objects. (#4177)

    The Cygwin and MinGW compilers now pass -O1 instead of a bare -O. The two are equivalent to GCC,
    but cc1 rejected the bare form when building 32-bit extensions with -m32. – by @dchaudhari7177 (#4873)

    copy_file now preserves the full precision of the source’s modification time, so a copy is no longer
    considered older than its source on filesystems with sub-second timestamp resolution.
    (pypa/distutils#379) (#5079)

    Setuptools wheels no longer bundled the project’s own test modules. – by @itscloud0 (#5212)

    build_ext no longer fails when cross-compiling with a compiler other than MSVC (such as MinGW). Compiler now
    provides a no-op initialize() that non-MSVC compilers inherit. (pypa/distutils#399)

Improved Documentation

    Clarified what “correspond exactly to the directory structure” means in the packages section of the
    Package Discovery user guide. (#4109)

    Documented how bdist_wheel’s py_limited_api option controls abi3 wheel tagging for extension modules –
    by @Himanshuagrawal4 (#4741)

Deprecations and Removals

    Compiler.spawn is deprecated in favor of the new Compiler.call. call raises native subprocess exceptions;
    spawn remains as a shim that emits a DeprecationWarning and translates them to DistutilsExecError. The
    MSVC spawn compatibility shim for third-party monkeypatches predating the env argument (numpy.distutils
    before 1.19, per pypa/distutils#15) has been removed. distutils.spawn.spawn is likewise reduced to a thin
    wrapper around subprocess.check_call: it no longer resolves cmd[0] via shutil.which (subprocess searches
    PATH itself) nor injects MACOSX_DEPLOYMENT_TARGET (that now lives with the compilers, the only callers
    to which it applied). (#5267)

    Building an extension with a MACOSX_DEPLOYMENT_TARGET lower than the interpreter’s configured value now
    raises compilers.errors.PlatformError instead of distutils.errors.DistutilsPlatformError (the macOS
    dep loyment-target check moved into the compilers package). CygwinCCompiler.gcc_version returns a
    packaging.version.Version rather than the removed distutils.version.LooseVersion. Completing the
    transition begun in pypa/distutils#246, UnixCCompiler.runtime_library_dir_option now returns the
    ["-Wl,--enable-new-dtags", "-Wl,-rpath,<dir>"] list directly for GNU ld rather than collapsing it
    into a single string, and the temporary distutils.compat.consolidate_linker_args shim has been removed. (#5268)

    The compilers now define their own exception vocabulary instead of borrowing distutils’ framework errors.
    Language-agnostic exceptions (Error, UnknownFileType, and a new PlatformError) live at
    distutils.compilers.errors, leaving room for future compilers.<language> siblings; the
    C/C++-specific CompileError/LinkError/LibError/PreprocessError remain in distutils.compilers.C.errors.
    The compilers now raise compilers.errors.PlatformError where they previously raised
    distutils.errors.DistutilsPlatformError/DistutilsModuleError, and compilers._modified.newer raises the stdlib
    FileNotFoundError. distutils.errors keeps its own framework exceptions and re-exports the compiler ones
    (CCompilerError, CompileError, etc.) for backward compatibility; because CCompilerError is compilers.errors.Error,
    code catching it (as distutils’ top-level handlers do) still catches the new PlatformError. (#5270)

    customize_compiler now asserts that the compiler-related config variables (CC, CXX, CFLAGS, etc.) resolve
    to strings, raising AssertionError if any are unexpectedly None rather than failing later with a less
    clear error. (pypa/distutils#363)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-_distutils-sysconfig.py-make-it-possible-to-substite.patch | 2 +-
 ...ython3-setuptools_83.0.0.bb => python3-setuptools_84.0.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_83.0.0.bb => python3-setuptools_84.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 6e240c47d20..f6313fb1a98 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From 015ff68e79298c5148350cf3bf0b72d1d409ba4b Mon Sep 17 00:00:00 2001
+From fe651521b9d970a84432b37d2731932a4862deb2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
diff --git a/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_83.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
index e5593c9f73d..648b084a27c 100644
--- a/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "025bccbbf0fa05b6192bc64ae1e7b16e001fd6d6d4d5de03c97b1c1ade523bef"
+SRC_URI[sha256sum] = "f4695c21257f0d9b537ec2692c941d02ee143b7cc1276941349a546573b2ef73"
 
 do_install:append() {
 	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).

