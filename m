Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01681C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 06:46:38 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10149.1749019593056901743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 23:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TJKSqGP0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a375888297so360221f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 23:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749019591; x=1749624391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0h8Y7TzRr3fEhrzGxbAff03xlUMW0Sq0g0heZCBUHig=;
        b=TJKSqGP0a5rwqeITT+LENq+LtqpLK3LFLPJOUfLDH3CBeidjsjlBiApcglRe3c1pVL
         ei2T0fpOhbX2rN7pBgS5OwqW0TVQXvWQrcA3TbF17XEJ4HLpZCC2KHem1xVKUFYovzDx
         jWumGH4tgS/8a2aBQOAoErChmp3cIrS0NQb0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749019591; x=1749624391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0h8Y7TzRr3fEhrzGxbAff03xlUMW0Sq0g0heZCBUHig=;
        b=T++kXrURZ/aKcG+1zf+93RUcKrVu9TUX2iY9MrMl3GOFpBUXTDwuIXqDCSgLw2nc38
         2JUH2sdmthYcfEvf3m2N40VXeCehD7cvF37jdUA509t+OJRMeEPhA9+zpCrKnqOI1BRj
         iY/TZ74j3C9HIfagaJsXsvR78SuA3Dm2A4GsUL2v5tByb5taP1I+HnRnmykkBFvHZkS5
         oN7m/U8PPhxmRaGKmLZNUKqHaCy1yO9ScBJuhHNOwekx/COPwZkhbLF3x/e0zV/Z/8fH
         hinwHSaJbA96LA8vvWhTp4Vl1/qQhMuOOF+AOYDEMfYnIDAEON8j6NczqYE34GaX7cpR
         GtEQ==
X-Gm-Message-State: AOJu0YzOg3uM2+Dqf5LrYTO+kafLOtlIaedvct1pjQQEgMEf8OdQ+kSg
	RKF3iRYdhQ7gjgH2tr5/A5QsNaL5fRBg2WVjGUQokb+n/9hTFP7NcRK/YNSME9/QCKcZspSAVD4
	ffsvKGWM=
X-Gm-Gg: ASbGncvPahHfmjT6S1ycS6Mo7bEXuoH5LNh/YFHL/U7pr76J3fIUb65wdgXIOMCL30x
	IHqKITEE1GhzPVJuFvJdOdgp3nGSOnXR6V+RcTsKDTXRT08T/AtRjD2NPON5SMYDZkgUWXmTKZ7
	vGSH4VjDCACciuVR4qAzGjA63ljlOVatE87BB0bQE/UMtzJaJeERXR+LeNzIWiS7eFJTK0BnOwm
	qViug98njnk51z1B6Lg9YXVbKaZ0kYVQ/ZE0u+yEUYZlI2JuRDQVUgEqTpIUL/n5s/lCFKwD4or
	CNhfATCa5DtSaHZCb8djZYev4y36oLjqu/hEhnOd1Yz1gwQqd7dAHcvfHX+3yHBhcj29mcpHllI
	PbR93
X-Google-Smtp-Source: AGHT+IELO+a26KHBpTwojyWkgbw8mtktZFltz3z+JyxZFcruMiQMSL/3iJ/aX+UUtOcd8zS8NaV9lg==
X-Received: by 2002:a05:6000:1448:b0:3a5:1360:6b34 with SMTP id ffacd0b85a97d-3a514169106mr3995720f8f.2.1749019590346;
        Tue, 03 Jun 2025 23:46:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:204c:fb2e:c462:29df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7414fsm21055562f8f.55.2025.06.03.23.46.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:46:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/recipes-devtools: Drop icecc from OE-Core
Date: Wed,  4 Jun 2025 07:46:27 +0100
Message-ID: <20250604064627.3766124-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 06:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217838

There are reports this class has been broken since mickledore which suggests
there are limited numbers of users. It doesn't have any automated testing
and it would be hard to setup and maintain a testing environment for it. The
original users/manintainers aren't using it now.

For those reasons, drop from OE-Core as we're not in a good position to
maintain it. I'd suggest anyone wanting to use it creates a dedicated layer
with maintainers who are in a position to test/develop it appropriately since
it is standalone code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +-
 meta/classes/icecc.bbclass                    | 443 ------------------
 meta/conf/distro/include/distro_alias.inc     |   1 -
 meta/conf/distro/include/maintainers.inc      |   2 -
 meta/conf/documentation.conf                  |   5 -
 meta/conf/layer.conf                          |   1 -
 .../icecc-create-env/icecc-create-env         | 382 ---------------
 .../icecc-create-env/icecc-create-env_0.1.bb  |  39 --
 .../icecc-toolchain/icecc-env.sh              |  49 --
 .../icecc-toolchain/icecc-setup.sh            |  38 --
 .../nativesdk-icecc-toolchain_0.1.bb          |  39 --
 11 files changed, 1 insertion(+), 1000 deletions(-)
 delete mode 100644 meta/classes/icecc.bbclass
 delete mode 100755 meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
 delete mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
 delete mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
 delete mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
 delete mode 100644 meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index de4799f013b..2d7d661d259 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -40,7 +40,7 @@ ESDK_LOCALCONF_REMOVE ?= "CONF_VERSION \
                              TMPDIR \
                              BB_SERVER_TIMEOUT \
                             "
-ESDK_CLASS_INHERIT_DISABLE ?= "buildhistory icecc"
+ESDK_CLASS_INHERIT_DISABLE ?= "buildhistory"
 SDK_UPDATE_URL ?= ""
 
 SDK_TARGETS ?= "${PN}"
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
deleted file mode 100644
index 8a48f2ad63d..00000000000
--- a/meta/classes/icecc.bbclass
+++ /dev/null
@@ -1,443 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-# Icecream distributed compiling support
-#
-# Stages directories with symlinks from gcc/g++ to icecc, for both
-# native and cross compilers. Depending on each configure or compile,
-# the directories are added at the head of the PATH list and ICECC_CXX
-# and ICECC_CC are set.
-#
-# For the cross compiler, creates a tar.gz of our toolchain and sets
-# ICECC_VERSION accordingly.
-#
-# The class now handles all 3 different compile 'stages' (i.e native ,cross-kernel and target) creating the
-# necessary environment tar.gz file to be used by the remote machines.
-# It also supports meta-toolchain generation.
-#
-# If ICECC_PATH is not set in local.conf then the class will try to locate it using 'bb.utils.which'
-# but nothing is sure. ;)
-#
-# If ICECC_ENV_EXEC is set in local.conf, then it should point to the icecc-create-env script provided by the user
-# or the default one provided by icecc-create-env_0.1.bb will be used.
-# (NOTE that this is a modified version of the needed script and *not the one that comes with icecream*).
-#
-# User can specify if specific recipes or recipes inheriting specific classes should not use icecc to distribute
-# compile jobs to remote machines, but handle them locally by defining ICECC_CLASS_DISABLE and ICECC_RECIPE_DISABLE
-# with the appropriate values in local.conf. In addition the user can force to enable icecc for recipes
-# which set an empty PARALLEL_MAKE variable by defining ICECC_RECIPE_ENABLE.
-#
-#########################################################################################
-# Error checking is kept to minimum so double check any parameters you pass to the class
-#########################################################################################
-
-BB_BASEHASH_IGNORE_VARS += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_RECIPE_DISABLE \
-    ICECC_CLASS_DISABLE ICECC_RECIPE_ENABLE ICECC_PATH ICECC_ENV_EXEC \
-    ICECC_CARET_WORKAROUND ICECC_CFLAGS ICECC_ENV_VERSION \
-    ICECC_DEBUG ICECC_LOGFILE ICECC_REPEAT_RATE ICECC_PREFERRED_HOST \
-    ICECC_CLANG_REMOTE_CPP ICECC_IGNORE_UNVERIFIED ICECC_TEST_SOCKET \
-    ICECC_ENV_DEBUG ICECC_REMOTE_CPP \
-    "
-
-ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
-
-HOSTTOOLS_NONFATAL += "icecc patchelf"
-
-# This version can be incremented when changes are made to the environment that
-# invalidate the version on the compile nodes. Changing it will cause a new
-# environment to be created.
-#
-# A useful thing to do for testing icecream changes locally is to add a
-# subversion in local.conf:
-#  ICECC_ENV_VERSION:append = "-my-ver-1"
-ICECC_ENV_VERSION = "2"
-
-# Default to disabling the caret workaround, If set to "1" in local.conf, icecc
-# will locally recompile any files that have warnings, which can adversely
-# affect performance.
-#
-# See: https://github.com/icecc/icecream/issues/190
-export ICECC_CARET_WORKAROUND ??= "0"
-
-export ICECC_REMOTE_CPP ??= "0"
-
-ICECC_CFLAGS = ""
-CFLAGS += "${ICECC_CFLAGS}"
-CXXFLAGS += "${ICECC_CFLAGS}"
-
-# Debug flags when generating environments
-ICECC_ENV_DEBUG ??= ""
-
-# Disable recipe list contains a list of recipes that can not distribute
-# compile tasks for one reason or the other. When adding a new entry, please
-# document why (how it failed) so that we can re-evaluate it later e.g. when
-# there is a new version.
-#
-# libgcc-initial - fails with CPP sanity check error if host sysroot contains
-#                  cross gcc built for another target tune/variant.
-# pixman - prng_state: TLS reference mismatches non-TLS reference, possibly due to
-#          pragma omp threadprivate(prng_state).
-# systemtap - _HelperSDT.c undefs macros and uses the identifiers in macros emitting
-#             inline assembly.
-# target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
-#                             prefix" error.
-ICECC_RECIPE_DISABLE += "\
-    libgcc-initial \
-    pixman \
-    systemtap \
-    target-sdk-provides-dummy \
-    "
-
-# Classes that should not use icecc. When adding a new entry, please
-# document why (how it failed) so that we can re-evaluate it later.
-#
-# image - images aren't compiling, but the testing framework for images captures
-#         PARALLEL_MAKE as part of the test environment. Many tests won't use
-#         icecream, but leaving the high level of parallelism can cause them to
-#         consume an unnecessary amount of resources.
-ICECC_CLASS_DISABLE += "\
-    image \
-    "
-
-def get_icecc_dep(d):
-    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command. Whether or not
-    # we need that built is the responsibility of the patch function / class, not
-    # the application.
-    if not d.getVar('INHIBIT_DEFAULT_DEPS'):
-        return "icecc-create-env-native"
-    return ""
-
-DEPENDS:prepend = "${@get_icecc_dep(d)} "
-
-get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
-def get_cross_kernel_cc(bb,d):
-    if not icecc_is_kernel(bb, d):
-        return None
-
-    # evaluate the expression by the shell if necessary
-    kernel_cc = d.getVar('KERNEL_CC')
-    if '`' in kernel_cc or '$(' in kernel_cc:
-        import subprocess
-        kernel_cc = subprocess.check_output("echo %s" % kernel_cc, shell=True).decode("utf-8")[:-1]
-
-    kernel_cc = kernel_cc.replace('ccache', '').strip()
-    kernel_cc = kernel_cc.split(' ')[0]
-    kernel_cc = kernel_cc.strip()
-    return kernel_cc
-
-def get_icecc(d):
-    return d.getVar('ICECC_PATH') or bb.utils.which(os.getenv("PATH"), "icecc")
-
-def use_icecc(bb,d):
-    if d.getVar('ICECC_DISABLED') == "1":
-        # don't even try it, when explicitly disabled
-        return "no"
-
-    # allarch recipes don't use compiler
-    if icecc_is_allarch(bb, d):
-        return "no"
-
-    if icecc_is_cross_canadian(bb, d):
-        return "no"
-
-    pn = d.getVar('PN')
-    bpn = d.getVar('BPN')
-
-    # Enable/disable checks are made against BPN, because there is a good
-    # chance that if icecc should be skipped for a recipe, it should be skipped
-    # for all the variants of that recipe. PN is still checked in case a user
-    # specified a more specific recipe.
-    check_pn = set([pn, bpn])
-
-    class_disable = (d.getVar('ICECC_CLASS_DISABLE') or "").split()
-
-    for bbclass in class_disable:
-        if bb.data.inherits_class(bbclass, d):
-            bb.debug(1, "%s: bbclass %s found in disable, disable icecc" % (pn, bbclass))
-            return "no"
-
-    disabled_recipes = (d.getVar('ICECC_RECIPE_DISABLE') or "").split()
-    enabled_recipes = (d.getVar('ICECC_RECIPE_ENABLE') or "").split()
-
-    if check_pn & set(disabled_recipes):
-        bb.debug(1, "%s: found in disable list, disable icecc" % pn)
-        return "no"
-
-    if check_pn & set(enabled_recipes):
-        bb.debug(1, "%s: found in enabled recipes list, enable icecc" % pn)
-        return "yes"
-
-    if d.getVar('PARALLEL_MAKE') == "":
-        bb.debug(1, "%s: has empty PARALLEL_MAKE, disable icecc" % pn)
-        return "no"
-
-    return "yes"
-
-def icecc_is_allarch(bb, d):
-    return d.getVar("PACKAGE_ARCH") == "all"
-
-def icecc_is_kernel(bb, d):
-    return \
-        bb.data.inherits_class("kernel", d);
-
-def icecc_is_native(bb, d):
-    return \
-        bb.data.inherits_class("cross", d) or \
-        bb.data.inherits_class("native", d);
-
-def icecc_is_cross_canadian(bb, d):
-    return bb.data.inherits_class("cross-canadian", d)
-
-def icecc_dir(bb, d):
-    return d.expand('${TMPDIR}/work-shared/ice')
-
-# Don't pollute allarch signatures with TARGET_FPU
-icecc_version[vardepsexclude] += "TARGET_FPU"
-def icecc_version(bb, d):
-    if use_icecc(bb, d) == "no":
-        return ""
-
-    parallel = d.getVar('ICECC_PARALLEL_MAKE') or ""
-    if not d.getVar('PARALLEL_MAKE') == "" and parallel:
-        d.setVar("PARALLEL_MAKE", parallel)
-
-    # Disable showing the caret in the GCC compiler output if the workaround is
-    # disabled
-    if d.getVar('ICECC_CARET_WORKAROUND') == '0':
-        d.setVar('ICECC_CFLAGS', '-fno-diagnostics-show-caret')
-
-    if icecc_is_native(bb, d):
-        archive_name = "local-host-env"
-    elif d.expand('${HOST_PREFIX}') == "":
-        bb.fatal(d.expand("${PN}"), " NULL prefix")
-    else:
-        prefix = d.expand('${HOST_PREFIX}' )
-        distro = d.expand('${DISTRO}')
-        target_sys = d.expand('${TARGET_SYS}')
-        float = d.getVar('TARGET_FPU') or "hard"
-        archive_name = prefix + distro + "-"        + target_sys + "-" + float
-        if icecc_is_kernel(bb, d):
-            archive_name += "-kernel"
-
-    import socket
-    ice_dir = icecc_dir(bb, d)
-    tar_file = os.path.join(ice_dir, "{archive}-{version}-@VERSION@-{hostname}.tar.gz".format(
-        archive=archive_name,
-        version=d.getVar('ICECC_ENV_VERSION'),
-        hostname=socket.gethostname()
-        ))
-
-    return tar_file
-
-def icecc_path(bb,d):
-    if use_icecc(bb, d) == "no":
-        # don't create unnecessary directories when icecc is disabled
-        return
-
-    staging = os.path.join(d.expand('${STAGING_BINDIR}'), "ice")
-    if icecc_is_kernel(bb, d):
-        staging += "-kernel"
-
-    return staging
-
-def icecc_get_external_tool(bb, d, tool):
-    external_toolchain_bindir = d.expand('${EXTERNAL_TOOLCHAIN}${bindir_cross}')
-    target_prefix = d.expand('${TARGET_PREFIX}')
-    return os.path.join(external_toolchain_bindir, '%s%s' % (target_prefix, tool))
-
-def icecc_get_tool_link(tool, d):
-    import subprocess
-    try:
-        return subprocess.check_output("readlink -f %s" % tool, shell=True).decode("utf-8")[:-1]
-    except subprocess.CalledProcessError as e:
-        bb.note("icecc: one of the tools probably disappeared during recipe parsing, cmd readlink -f %s returned %d:\n%s" % (tool, e.returncode, e.output.decode("utf-8")))
-        return tool
-
-def icecc_get_path_tool(tool, d):
-    # This is a little ugly, but we want to make sure we add an actual
-    # compiler to the toolchain, not ccache. Some distros (e.g. Fedora)
-    # have ccache enabled by default using symlinks in PATH, meaning ccache
-    # would be found first when looking for the compiler.
-    paths = os.getenv("PATH").split(':')
-    while True:
-        p, hist = bb.utils.which(':'.join(paths), tool, history=True)
-        if not p or os.path.basename(icecc_get_tool_link(p, d)) != 'ccache':
-            return p
-        paths = paths[len(hist):]
-
-    return ""
-
-# Don't pollute native signatures with target TUNE_PKGARCH through STAGING_BINDIR_TOOLCHAIN
-icecc_get_tool[vardepsexclude] += "STAGING_BINDIR_TOOLCHAIN"
-def icecc_get_tool(bb, d, tool):
-    if icecc_is_native(bb, d):
-        return icecc_get_path_tool(tool, d)
-    elif icecc_is_kernel(bb, d):
-        return icecc_get_path_tool(get_cross_kernel_cc(bb, d), d)
-    else:
-        ice_dir = d.expand('${STAGING_BINDIR_TOOLCHAIN}')
-        target_sys = d.expand('${TARGET_SYS}')
-        for p in ice_dir.split(':'):
-            tool_bin = os.path.join(p, "%s-%s" % (target_sys, tool))
-            if os.path.isfile(tool_bin):
-                return tool_bin
-        external_tool_bin = icecc_get_external_tool(bb, d, tool)
-        if os.path.isfile(external_tool_bin):
-            return external_tool_bin
-        return ""
-
-def icecc_get_and_check_tool(bb, d, tool):
-    # Check that g++ or gcc is not a symbolic link to icecc binary in
-    # PATH or icecc-create-env script will silently create an invalid
-    # compiler environment package.
-    t = icecc_get_tool(bb, d, tool)
-    if t:
-        link_path = icecc_get_tool_link(t, d)
-        if link_path == get_icecc(d):
-            bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, link_path))
-            return ""
-        else:
-            return t
-    else:
-        return t
-
-set_icecc_env[vardepsexclude] += "KERNEL_CC"
-python set_icecc_env() {
-    import os
-    import subprocess
-
-    if use_icecc(bb, d) == "no":
-        return
-    ICECC_VERSION = icecc_version(bb, d)
-    if not ICECC_VERSION:
-        bb.warn("Cannot use icecc: could not get ICECC_VERSION")
-        return
-
-    ICE_PATH = icecc_path(bb, d)
-    if not ICE_PATH:
-        bb.warn("Cannot use icecc: could not get ICE_PATH")
-        return
-
-    ICECC_BIN = get_icecc(d)
-    if not ICECC_BIN:
-        bb.warn("Cannot use icecc: icecc binary not found")
-        return
-
-    if (not bb.utils.which(os.getenv("PATH"), "patchelf") and
-        not bb.utils.which(os.getenv("PATH"), "patchelf-uninative")):
-        bb.warn("Cannot use icecc: patchelf not found")
-        return
-
-    ICECC_CC = icecc_get_and_check_tool(bb, d, "gcc")
-    ICECC_CXX = icecc_get_and_check_tool(bb, d, "g++")
-    # cannot use icecc_get_and_check_tool here because it assumes as without target_sys prefix
-    ICECC_WHICH_AS = bb.utils.which(os.getenv('PATH'), 'as')
-    if (not os.access(ICECC_CC, os.X_OK) or
-        not os.access(ICECC_CXX, os.X_OK)):
-        bb.note("Cannot use icecc: could not get ICECC_CC or ICECC_CXX")
-        return
-
-    cmd = []
-    try:
-        cmd = [ICECC_CC, '-dumpversion']
-        ICE_VERSION = subprocess.check_output(cmd).decode("utf-8").strip()
-    except subprocess.CalledProcessError as e:
-        bb.warn("icecc: '{}' returned {}:\n{}".format(cmd, e.returncode, e.output.decode("utf-8")))
-        return
-
-    ICECC_VERSION = ICECC_VERSION.replace("@VERSION@", ICE_VERSION)
-
-    if not os.access(d.getVar('ICECC_ENV_EXEC'), os.X_OK):
-        bb.warn("Cannot use icecc: invalid ICECC_ENV_EXEC")
-        return
-
-    # Create symlinks to icecc and wrapper-scripts in the recipe-sysroot directory
-    symlink_path = os.path.join(ICE_PATH, "symlinks")
-    bb.utils.mkdirhier(symlink_path)
-    compilers = []
-    if icecc_is_kernel(bb, d):
-        compilers.append(get_cross_kernel_cc(bb,d))
-    else:
-        host_prefix = d.getVar('HOST_PREFIX')
-        compilers.extend([host_prefix + 'gcc', host_prefix + 'g++'])
-
-    for compiler in compilers:
-        try:
-            os.symlink(ICECC_BIN, symlink_path + '/' + compiler)
-        except FileExistsError:
-            pass
-        wrapper_script = os.path.join(ICE_PATH, compiler)
-        with open(wrapper_script, 'w') as fd:
-            fd.write("#!/bin/sh -e\n")
-            fd.write("export ICECC_VERSION={}\n".format(ICECC_VERSION))
-            fd.write("export ICECC_CC={}\n".format(ICECC_CC))
-            fd.write("export ICECC_CXX={}\n".format(ICECC_CXX))
-            fd.write("{} \"$@\"\n".format(os.path.join(ICE_PATH, "symlinks", compiler)))
-        os.chmod(wrapper_script, 0o755)
-
-    try:
-        cmd = [ICECC_CC, '-print-prog-name=as']
-        ICECC_AS = subprocess.check_output(cmd).decode("utf-8").strip()
-    except subprocess.CalledProcessError as e:
-        bb.warn("icecc: '{}' returned {}:\n{}".format(cmd, e.returncode, e.output.decode("utf-8")))
-        return
-    # for target recipes should return something like:
-    # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
-    # and just "as" for native, if it returns "as" in current directory (for whatever reason) use "as" from PATH
-    if not os.path.dirname(ICECC_AS):
-        ICECC_AS = ICECC_WHICH_AS
-
-    if not os.path.isfile(ICECC_VERSION + ".done"):
-        bb.utils.mkdirhier(os.path.dirname(ICECC_VERSION))
-
-        # the ICECC_VERSION generation step must be locked by a mutex
-        # in order to prevent race conditions
-        lock = bb.utils.lockfile(ICECC_VERSION + '.lock')
-        try:
-            cmd = [d.getVar('ICECC_ENV_EXEC')]
-            if d.getVar('ICECC_ENV_DEBUG'):
-                cmd.append(d.getVar('ICECC_ENV_DEBUG'))
-            cmd.extend([ICECC_CC, ICECC_CXX, ICECC_AS, ICECC_VERSION])
-            subprocess.check_output(cmd)
-            cmd = ['touch', ICECC_VERSION + '.done']
-            subprocess.check_output(cmd)
-        except subprocess.CalledProcessError as e:
-            bb.warn("icecc: '{}' returned {}:\n{}".format(cmd, e.returncode, e.output.decode("utf-8")))
-            bb.utils.unlockfile(lock)
-            return
-        bb.utils.unlockfile(lock)
-
-    # Don't let ccache find the icecream compiler links that have been created, otherwise
-    # it can end up invoking icecream recursively.
-    d.setVar('CCACHE_PATH', d.getVar('PATH'))
-    d.setVar('CCACHE_DISABLE', '1')
-
-    d.prependVar('PATH', ICE_PATH + ':')
-
-    bb.note("Using icecc path: {}".format(ICE_PATH))
-    bb.note("Using icecc tarball: {}".format(ICECC_VERSION))
-}
-
-do_configure[prefuncs] += "set_icecc_env"
-do_compile[prefuncs] += "set_icecc_env"
-do_compile_kernelmodules[prefuncs] += "set_icecc_env"
-do_install[prefuncs] += "set_icecc_env"
-
-# Icecream is not (currently) supported in the extensible SDK
-ICECC_SDK_HOST_TASK = "nativesdk-icecc-toolchain"
-ICECC_SDK_HOST_TASK:task-populate-sdk-ext = ""
-
-# Don't include icecream in uninative tarball
-ICECC_SDK_HOST_TASK:pn-uninative-tarball = ""
-
-# Add the toolchain scripts to the SDK
-TOOLCHAIN_HOST_TASK:append = " ${ICECC_SDK_HOST_TASK}"
-
-python () {
-    if d.getVar('ICECC_DISABLED') != "1":
-        for task in ['do_configure', 'do_compile', 'do_compile_kernelmodules', 'do_install']:
-                d.setVarFlag(task, 'network', '1')
-}
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 8052464f1d9..20882523c28 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -105,7 +105,6 @@ DISTRO_PN_ALIAS:pn-gtk-icon-utils-native = "OSPDT"
 DISTRO_PN_ALIAS:pn-systemd-boot = "Ubuntu=systemd-boot Fedora=systemd-boot"
 DISTRO_PN_ALIAS:pn-hello-mod = "OE-Core"
 DISTRO_PN_ALIAS:pn-hwlatdetect = "OSPDT"
-DISTRO_PN_ALIAS:pn-icecc-create-env = "OE-Core"
 DISTRO_PN_ALIAS:pn-init-ifupdown = "Debian=ifupdown Ubuntu=ifupdown"
 DISTRO_PN_ALIAS:pn-initramfs-boot = "OE-Core"
 DISTRO_PN_ALIAS:pn-initramfs-framework = "OE-Core"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 674779fa3be..5c315d58cf5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -272,7 +272,6 @@ RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-hwdata = "Hiago De Franco <hiago.franco@toradex.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-icon-naming-utils = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-icu = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -548,7 +547,6 @@ RECIPE_MAINTAINER:pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-clang-glue = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-nativesdk-qemu-helper = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 570a6044947..2710485227f 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -201,11 +201,6 @@ HOST_VENDOR[doc] = "The name of the vendor. Normally same as the TARGET_VENDOR."
 
 #I
 
-ICECC_ENV_EXEC[doc] = "Points to the icecc-create-env script that you provide."
-ICECC_PATH[doc] = "The location of the icecc binary."
-ICECC_CLASS_DISABLE[doc] = "Identifies user classes that you do not want the Icecream distributed compile support to consider."
-ICECC_RECIPE_DISABLE[doc] = "Identifies user recipes that you do not want the Icecream distributed compile support to consider."
-ICECC_RECIPE_ENABLE[doc] = "Identifies user recipes that use an empty PARALLEL_MAKE variable that you want to force remote distributed compilation on using the Icecream distributed compile support."
 IMAGE_BASENAME[doc] = "The base name of image output files."
 IMAGE_BOOT_FILES[doc] = "Whitespace separated list of files from ${DEPLOY_DIR_IMAGE} to place in boot partition. Entries will be installed under a same name as the source file. To change the destination file name, pass a desired name after a semicolon (eg. u-boot.img;uboot)."
 IMAGE_CLASSES[doc] = "A list of classes that all images should inherit."
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index e19431e7247..44267ce8e22 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -53,7 +53,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   *->quilt-native \
   *->subversion-native \
   *->git-native \
-  *->icecc-create-env-native \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
   ppp-dialin->ppp \
   resolvconf->bash \
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
deleted file mode 100755
index 64b5e207853..00000000000
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ /dev/null
@@ -1,382 +0,0 @@
-#! /usr/bin/env bash
-# icecc -- A simple distributed compiler system
-#
-# Copyright (C) 2004 by the Icecream Authors
-# GPL
-
-target_paths=
-target_aliases=
-
-# Always prints, optionally to a log file
-print_output ()
-{
-    if test -n "$log_path"; then
-        echo "$@" | tee -a "$log_path"
-    else
-        echo "$@"
-    fi
-}
-
-# Only prints if the debug flag is specified
-print_debug ()
-{
-    if test -n "$debug"; then
-        print_output "$@"
-    fi
-}
-
-is_dynamic_elf ()
-{
-    # Is the file an dynamically linked ELF executable?
-    (file -L "$1" | grep 'ELF' > /dev/null 2>&1) && (! file -L "$1" | grep 'static' > /dev/null 2>&1)
-}
-
-fix_rpath ()
-{
-    # Patches the RPATH for a file. When the program is executed in the chroot
-    # be iceccd, /proc is not mounted. As such, $ORIGIN can't be resolved. To
-    # work around this, replace all instances of $ORIGIN in RPATH with the
-    # known chroot path to the executables directory
-    local path="$1"
-    local origin="$2"
-    if ! is_dynamic_elf "$path"; then
-        return
-    fi
-    local old_rpath="`$PATCHELF --print-rpath "$path"`"
-    local new_rpath="`echo "$old_rpath" | \
-        sed 's/.*\[\(.*\)\]/\1/g' | \
-        sed "s,\\\$ORIGIN,/$origin,g"`"
-
-    if test -n "$new_rpath"; then
-        print_debug "Converting RPATH '$old_rpath' -> '$new_rpath'"
-        $PATCHELF --set-rpath "$new_rpath" "$path"
-    fi
-}
-
-add_path ()
-{
-    case " $target_paths " in
-        *" $1 "*)
-            return 1
-            ;;
-        *)
-            target_paths="$target_paths $1"
-            return 0
-            ;;
-    esac
-}
-
-add_alias ()
-{
-    if test "$1" != "$2"; then
-        local alias="$1=$2"
-        case " $target_aliases " in
-            *" $alias "*)
-                ;;
-            *)
-                print_debug "Adding alias '$2' -> '$1'"
-                target_aliases="$target_aliases $alias"
-                ;;
-        esac
-    fi
-}
-
-normalize_path ()
-{
-    # Normalizes the path to a file or directory, removing all "." and ".."
-    # entries. Use pwd -L to explicitly prevent symlink expansion
-    local path=$1
-    if test -f "$path"; then
-        pushd $(dirname $path) > /dev/null 2>&1
-        dir_path=$(pwd -L)
-        path=$dir_path/$(basename $path)
-        popd > /dev/null 2>&1
-    elif test -d "$path"; then
-        pushd $path > /dev/null 2>&1
-        path=$(pwd -L)
-        popd > /dev/null 2>&1
-    fi
-    echo $path
-}
-
-add_file_common()
-{
-    local p="$1"
-    local path="$2"
-    local alias="$3"
-
-    add_alias "$path" "$p"
-    if test -n "$alias"; then
-        add_alias "$path" "$alias"
-    fi
-
-    add_path "$path" || return 1
-    print_debug "Adding file '$path'"
-
-    return 0
-}
-
-add_deps()
-{
-    local path="$1"
-    local interp="$2"
-
-    if test -n "$interp" && test -x "$interp"; then
-        # Use the dynamic loaders --list argument to list the
-        # dependencies. The program may have a different program
-        # interpreter (typical when using uninative tarballs), which is
-        # why we can't just call ldd.
-        deps="`$interp --list "$path"`"
-    else
-        deps="`ldd "$path"`"
-    fi
-
-    print_debug "Dependencies are:"
-    print_debug "$deps"
-    if test -n "$deps"; then
-        for lib in $deps; do
-            # ldd now outputs ld as /lib/ld-linux.so.xx on current nptl
-            # based glibc this regexp parse the outputs like:
-            # ldd /usr/bin/gcc
-            #         linux-gate.so.1 =>  (0xffffe000)
-            #         libc.so.6 => /lib/tls/libc.so.6 (0xb7e81000)
-            #         /lib/ld-linux.so.2 (0xb7fe8000)
-            # covering both situations ( with => and without )
-            lib="`echo "$lib" | sed -n 's,^[^/]*\(/[^ ]*\).*,\1,p'`"
-
-            test -f "$lib" || continue
-            # Check whether the same library also exists in the parent
-            # directory, and prefer that on the assumption that it is a
-            # more generic one.
-            local baselib=`echo "$lib" | sed 's,\(/[^/]*\)/.*\(/[^/]*\)$,\1\2,'`
-            test -f "$baselib" && lib=$baselib
-            add_dependency "$lib" "$interp"
-        done
-    fi
-}
-
-add_dependency()
-{
-    local p=`normalize_path $1`
-    # readlink is required for Yocto, so we can use it
-    local path=`readlink -f "$p"`
-    local interp="$2"
-
-    add_file_common "$p" "$path" || return
-
-    if test -x "$path" && is_dynamic_elf "$path"; then
-        add_deps "$path" "$interp"
-    fi
-}
-
-add_file ()
-{
-    local p=`normalize_path $1`
-    # readlink is required for Yocto, so we can use it
-    local path=`readlink -f "$p"`
-
-    add_file_common "$p" "$path" "$2" || return
-
-    if test -x "$path" && is_dynamic_elf "$path"; then
-        # Request the program interpeter (dynamic loader)
-        interp=`readelf -W -l "$path" | grep "Requesting program interpreter:" | sed "s/\s*\[Requesting program interpreter:\s*\(.*\)\]/\1/g"`
-        print_debug "Interpreter is '$interp'"
-
-        add_deps "$path" "$interp"
-    fi
-}
-
-while test -n "$1"; do
-    case "$1" in
-        --respect-path)
-            # Ignore for backward compatability
-            ;;
-        --debug)
-            debug=1
-            ;;
-        --log)
-            do_log=1
-            ;;
-        --extra=*)
-            extra_tools="$extra_tools ${1#--extra=}"
-            ;;
-        *)
-            break
-            ;;
-    esac
-    shift
-done
-
-added_gcc=$1
-shift
-added_gxx=$1
-shift
-added_as=$1
-shift
-archive_name=$1
-
-if test -n "$do_log"; then
-    log_path="$archive_name.log"
-    rm -f "$log_path"
-fi
-
-if test -z "$PATCHELF"; then
-    PATCHELF=`which patchelf 2> /dev/null`
-fi
-if test -z "$PATCHELF"; then
-    PATCHELF=`which patchelf-uninative 2> /dev/null`
-fi
-if test -z "$PATCHELF"; then
-    print_output "patchelf is required"
-    exit 1
-fi
-
-if test -z "$added_gcc" || test -z "$added_gxx" ; then
-    print_output "usage: $0 <gcc_path> <g++_path>"
-    exit 1
-fi
-
-if ! test -x "$added_gcc" ; then
-    print_output "'$added_gcc' is not executable."
-    exit 1
-fi
-
-if ! test -x "$added_gxx" ; then
-    print_output "'$added_gcc' is not executable."
-    exit 1
-fi
-
-
-
-add_file $added_gcc /usr/bin/gcc
-add_file $added_gxx /usr/bin/g++
-
-if test -z "$added_as" ; then
-    add_file /usr/bin/as /usr/bin/as
-else
-    if ! test -x "$added_as" ; then
-        print_output "'$added_as' is not executable."
-        exit 1
-    fi
-
-    add_file $added_as  /usr/bin/as
-fi
-
-add_file `$added_gcc -print-prog-name=cc1` /usr/bin/cc1
-add_file `$added_gxx -print-prog-name=cc1plus` /usr/bin/cc1plus
-specfile=`$added_gcc -print-file-name=specs`
-if test -n "$specfile" && test -e "$specfile"; then
-    add_file "$specfile"
-fi
-
-ltofile=`$added_gcc -print-prog-name=lto1`
-pluginfile=`normalize_path "${ltofile%lto1}liblto_plugin.so"`
-if test -r "$pluginfile"
-then
-    add_file $pluginfile  ${pluginfile#*usr}
-    add_file $pluginfile  /usr${pluginfile#*usr}
-fi
-
-# for testing the environment is usable at all
-if test -x /bin/true; then
-    add_file /bin/true
-elif test -x /usr/bin/true; then
-    add_file /usr/bin/true /bin/true
-else
-    print_output "'true' not found"
-    exit 1
-fi
-
-for extra in $extra_tools; do
-    if test -x "$extra"; then
-        add_file "$extra"
-    else
-        print_output "'$extra' not found"
-        exit 1
-    fi
-done
-
-link_rel ()
-{
-    local target="$1"
-    local name="$2"
-    local base="$3"
-
-    local prefix=`dirname $name`
-
-    prefix=`echo $prefix | sed 's,[^/]\+,..,g' | sed 's,^/*,,g'`
-
-    ln -s $prefix/$target $base/$name
-}
-
-tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
-target_files=
-for path in $target_paths; do
-    mkdir -p $tempdir/`dirname $path`
-    cp -pH $path $tempdir/$path
-
-    if test -f $tempdir/$path -a -x $tempdir/$path; then
-        strip -s $tempdir/$path 2>/dev/null
-    fi
-
-    fix_rpath $tempdir/$path `dirname $path`
-    target_files="$target_files $path"
-done
-
-for i in $target_aliases; do
-    target=`echo $i | cut -d= -f1`
-    link_name=`echo $i | cut -d= -f2`
-
-    mkdir -p $tempdir/`dirname $link_name`
-    # Relative links are used because the files are checked for being
-    # executable outside the chroot
-    link_rel $target $link_name $tempdir
-
-    link_name=`echo $link_name | cut -b2-`
-    target_files="$target_files $link_name"
-done
-
-#sort the files
-target_files=`for i in $target_files; do echo $i; done | sort`
-
-#test if an archive name was supplied
-#if not use the md5 of all files as the archive name
-if test -z "$archive_name"; then
-    md5sum=NONE
-    for file in /usr/bin/md5sum /bin/md5 /usr/bin/md5; do
-        if test -x $file; then
-            md5sum=$file
-            break
-        fi
-    done
-
-    #calculate md5 and use it as the archive name
-    archive_name=`for i in $target_files; do test -f $tempdir/$i && $md5sum $tempdir/$i; done | sed -e 's/ .*$//' | $md5sum | sed -e 's/ .*$//'`.tar.gz || {
-        print_output "Couldn't compute MD5 sum."
-        exit 2
-    }
-    mydir=`pwd`
-else
-    mydir="`dirname "$archive_name"`"
-
-    #check if we have a full path or only a filename
-    if test "$mydir" = "." ; then
-        mydir=`pwd`
-    else
-        mydir=""
-    fi
-fi
-
-print_output "creating $archive_name"
-
-cd $tempdir
-# Add everything in the temp directory. Tar doesn't like to be given files with
-# ".." in them, which frequently happens in $target_files, and will strip off
-# the path prefix past the offending "..". This makes the archive generate
-# incorrectly
-tar -czf "$mydir/$archive_name" . || {
-    print_output "Couldn't create archive"
-    exit 3
-}
-cd ..
-rm -rf $tempdir
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
deleted file mode 100644
index dd1b257b10a..00000000000
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "icecc environment setup script"
-DESCRIPTION = "This is a version of the icecc-create-env script that has \
-been modified in order to make it work with OE."
-SECTION = "base"
-# source file has just a "GPL" word, but upstream is GPL-2.0-or-later.
-# most probably just GPL would be a mistake
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
-
-
-DEPENDS = ""
-INHIBIT_DEFAULT_DEPS = "1"
-ICECC_DISABLED = "1"
-
-# This is needed, because otherwise there is dependency loop from quilt-native
-# Dependency loop #1 found:
-#  Task 10907 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_install) (dependent Tasks ['quilt-native, do_compile'])
-#  Task 10908 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_populate_sysroot) (dependent Tasks ['quilt-native, do_install'])
-#  Task 10997 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_patch) (dependent Tasks ['icecc-create-env-native, do_unpack', 'quilt-native, do_populate_sysroot'])
-#  Task 11001 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_configure) (dependent Tasks ['icecc-create-env-native, do_patch'])
-#  Task 11002 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_compile) (dependent Tasks ['icecc-create-env-native, do_configure'])
-#  Task 10998 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_install) (dependent Tasks ['icecc-create-env-native, do_compile'])
-#  Task 10999 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_populate_sysroot) (dependent Tasks ['icecc-create-env-native, do_install'])
-#  Task 10910 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_configure) (dependent Tasks ['quilt-native, do_patch', 'icecc-create-env-native, do_populate_sysroot'])
-#  Task 10911 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_compile) (dependent Tasks ['quilt-native, do_configure'])
-PATCHTOOL = "patch"
-SRC_URI = "file://icecc-create-env"
-
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${S}/icecc-create-env ${D}/${bindir}
-}
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN}:class-nativesdk = "patchelf"
diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
deleted file mode 100644
index 0dccc41c8ae..00000000000
--- a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
+++ /dev/null
@@ -1,49 +0,0 @@
-#! /bin/sh
-# Copyright (c) 2018 Joshua Watt, Garmin International,Inc.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy
-# of this software and associated documentation files (the "Software"), to deal
-# in the Software without restriction, including without limitation the rights
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-# copies of the Software, and to permit persons to whom the Software is
-# furnished to do so, subject to the following conditions:
-#
-# The above copyright notice and this permission notice shall be included in
-# all copies or substantial portions of the Software.
-#
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-# SOFTWARE.
-#
-
-if [ -z "$ICECC_PATH" ]; then
-    ICECC_PATH=$(which icecc 2> /dev/null || true)
-fi
-
-if [ -n "$ICECC_PATH" ]; then
-    # Default to disabling the caret workaround. If set to "1", icecc will
-    # locally recompile any files that have warnings, which can adversely
-    # affect performance.
-    #
-    # See: https://github.com/icecc/icecream/issues/190
-    if [ -z "$ICECC_CARET_WORKAROUND" ]; then
-        ICECC_CARET_WORKAROUND="0"
-    fi
-    if [ "$ICECC_CARET_WORKAROUND" != "1" ]; then
-        CFLAGS="$CFLAGS -fno-diagnostics-show-caret"
-        CXXFLAGS="$CXXFLAGS -fno-diagnostics-show-caret"
-    fi
-    export ICECC_PATH ICECC_CARET_WORKAROUND
-    export ICECC_VERSION="$(echo "$OECORE_NATIVE_SYSROOT/usr/share/${TARGET_PREFIX}icecream/@TOOLCHAIN_ENV@" | sed "s,@TARGET_PREFIX@,$TARGET_PREFIX,g")"
-    export ICECC="$(which ${CROSS_COMPILE}gcc)"
-    export ICECXX="$(which ${CROSS_COMPILE}g++)"
-    export ICEAS="$(which ${CROSS_COMPILE}as)"
-    export PATH="$OECORE_NATIVE_SYSROOT/usr/share/${TARGET_PREFIX}icecream/bin:$PATH"
-else
-    echo "Icecc not found. Disabling distributed compiling"
-fi
-
diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
deleted file mode 100644
index fbd9f038b88..00000000000
--- a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
+++ /dev/null
@@ -1,38 +0,0 @@
-#! /bin/sh
-# Copyright (c) 2018 Joshua Watt, Garmin International,Inc.
-#
-# Permission is hereby granted, free of charge, to any person obtaining a copy
-# of this software and associated documentation files (the "Software"), to deal
-# in the Software without restriction, including without limitation the rights
-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-# copies of the Software, and to permit persons to whom the Software is
-# furnished to do so, subject to the following conditions:
-#
-# The above copyright notice and this permission notice shall be included in
-# all copies or substantial portions of the Software.
-#
-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-# SOFTWARE.
-#
-
-# ICECC_PATH will have been found icecc-env.sh
-if [ -z "$ICECC_PATH" ]; then
-    exit 0
-fi
-
-echo "Setting up IceCream distributed compiling..."
-
-# Create the environment
-mkdir -p "`dirname $ICECC_VERSION`"
-icecc-create-env $ICECC $ICECXX $ICEAS $ICECC_VERSION || exit $?
-
-# Create symbolic links
-d="$OECORE_NATIVE_SYSROOT/usr/share/${TARGET_PREFIX}icecream/bin"
-mkdir -p "$d"
-ln -sf "$ICECC_PATH" "$d/${CROSS_COMPILE}gcc"
-ln -sf "$ICECC_PATH" "$d/${CROSS_COMPILE}g++"
diff --git a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
deleted file mode 100644
index a7f5fc4cb45..00000000000
--- a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-# Copyright (c) 2018 Joshua Watt, Garmin International,Inc.
-# Released under the MIT license (see COPYING.MIT for the terms)
-SUMMARY = "Generates Icecream toolchain for SDK"
-DESCRIPTION = "${SUMMARY}"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/icecc-env.sh;beginline=2;endline=20;md5=dd6b68c1efed8a9fb04e409b3b287d47"
-
-INHIBIT_DEFAULT_DEPS = "1"
-
-SRC_URI = "\
-    file://icecc-env.sh \
-    file://icecc-setup.sh \
-    "
-
-inherit nativesdk
-
-ENV_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-@TARGET_PREFIX@${DISTRO_VERSION}.tar.gz"
-
-do_compile() {
-}
-
-do_install() {
-    install -d ${D}${SDKPATHNATIVE}${datadir}/icecream/bin
-
-    install -d ${D}${SDKPATHNATIVE}/environment-setup.d/
-    install -m 0644 ${UNPACKDIR}/icecc-env.sh ${D}${SDKPATHNATIVE}/environment-setup.d/
-    sed -i ${D}${SDKPATHNATIVE}/environment-setup.d/icecc-env.sh \
-        -e 's,@TOOLCHAIN_ENV@,${ENV_NAME},g'
-
-    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
-    install -m 0755 ${UNPACKDIR}/icecc-setup.sh ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
-    sed -i ${D}${SDKPATHNATIVE}/post-relocate-setup.d/icecc-setup.sh \
-        -e 's,@TOOLCHAIN_ENV@,${ENV_NAME},g'
-}
-
-PACKAGES = "${PN}"
-FILES:${PN} = "${SDKPATHNATIVE}"
-RDEPENDS:${PN} += "nativesdk-icecc-create-env"
-

