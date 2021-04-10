Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web09.2841.1618048227846639711
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Apr 2021 02:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hCtoBw6F;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id s19so1461187uaq.4
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Apr 2021 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HL3ug8/AdOaBn/eBv1YaAGJCuHaJ/7Hx725rGYNPMII=;
        b=hCtoBw6F1z7brqYijjodtbmcg1XkpS215usIx1W0g007+27PvazuIIxthRBLPogg2B
         rqE89dhGZz6M8b2HY4P518UyQI/B4KK6B2517F+gdUEwEGtKAOnM1/fdsBD8vgtq7R/H
         zFes1jp+oEEVgnqGGZHHNgoF9ZHmEERRz7QGzJJPrzK7lsGc9JgPIVHFgUUV4AKTS0sc
         NbYfMDdEStmvq9Bx9mZsFOMpv112mJTuXmSce3tqPuSAJ8LgLcpcD3sgua2nYBksu/gK
         eohZlBX1mL4ylV8hZbXHecIcRHwoADupjRo4kJrhsI+1UE+r2Q6WXnTjX8NyM/vW5nKg
         aYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HL3ug8/AdOaBn/eBv1YaAGJCuHaJ/7Hx725rGYNPMII=;
        b=ZlGioD6QeX/aXIwc0HxJ5Y58BBt6eZrgfhScxqnlqYiuqEXAd2vsB1k+83Ds+twbjD
         R0ax6ZgvBttZtWlXZWhv/CM18EowN8dZAAKxDJIgHFyIThY8NoIUxuC95bwkpelX6UXP
         m/YtnTDrdX0fqhS8K04maiPvNq14tG481VKX6diTZEQlmChf2WsnLPREPG2TrnSAGRQv
         WcpaAnrAwIKMMUKJhTBqwYq90MeD+NqMR994HlOfqcXqQLwibY+InLx4SqeF/yHkbSwl
         sJ6WABG+PgmumGxIxwSlIqD+kcKuB8Zp0gGqXwcAtEIlPjnF3zcX6J7fsStEYpJI9+T+
         fQ/g==
X-Gm-Message-State: AOAM532Nnrjg0R4w3zkusjBZrAoYZ8Gs8APAOfMigwXcyNTNPD/jWzfa
	Vzg/CLYyj6YzIYlBsL3iWAzbe2ETPRCUvGayVy8=
X-Google-Smtp-Source: ABdhPJwhonfy0pCnpnzqTh9FP/FeFeehq0ko1JjEqjiYLm2iaK6yWrKPbCQRDJKKXrV4QwaYTXqUZw5LLbtzrs0BfYg=
X-Received: by 2002:a9f:36a3:: with SMTP id p32mr14649895uap.22.1618048226834;
 Sat, 10 Apr 2021 02:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210409115932.72453-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210409115932.72453-1-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 10 Apr 2021 11:50:15 +0200
Message-ID: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Rust cross testing integration with oe-selftest.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca3c4605bf9b356a"

--000000000000ca3c4605bf9b356a
Content-Type: text/plain; charset="UTF-8"

There are a few unrelated changes all bundled together - please split it
into several commits and properly describe each. Particularly rust-test.inc
is huge, and does need a proper explanation of what is happening and why,
in both the commit message and inline comments. Do keep in mind: making the
code work is only half the job, the other half is explaining what happens
to other humans.

Alex

On Fri, 9 Apr 2021 at 13:59, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/classes/rust-common.bbclass              |   5 +-
>  meta/conf/bitbake.conf                        |   2 +-
>  meta/lib/oeqa/selftest/cases/rust.py          |  41 ++
>  meta/lib/oeqa/utils/qemurunner.py             |   8 +-
>  meta/recipes-devtools/rust/rust-test.inc      | 504 ++++++++++++++++++
>  .../recipes-devtools/rust/rust-test_1.46.0.bb |  12 +
>  scripts/runqemu                               |  15 +-
>  7 files changed, 583 insertions(+), 4 deletions(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>  create mode 100644 meta/recipes-devtools/rust/rust-test.inc
>  create mode 100644 meta/recipes-devtools/rust/rust-test_1.46.0.bb
>
> diff --git a/meta/classes/rust-common.bbclass
> b/meta/classes/rust-common.bbclass
> index ff7b9da8f3..fb75b07ba3 100644
> --- a/meta/classes/rust-common.bbclass
> +++ b/meta/classes/rust-common.bbclass
> @@ -84,7 +84,10 @@ def rust_base_triple(d, thing):
>      # This catches ARM targets and appends the necessary hard float bits
>      if os == "linux-gnueabi" or os == "linux-musleabi":
>          libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard',
> 'hf', '', d)
> -    return arch + vendor + '-' + os + libc
> +    if d.getVar('TARGET_ARCH') == 'mips64':
> +       return arch + vendor + '-' + os + libc + 'abi64'
> +    else:
> +       return arch + vendor + '-' + os + libc
>
>  # Naming explanation
>  # Yocto
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3438be92b7..83e1b68071 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -483,7 +483,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
>  HOSTTOOLS += " \
>      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp
> comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr
> false \
> -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip
> gzip \
> +    fgrep file find flock g++ gawk gcc cc getconf getopt git grep gunzip
> gzip \
>      head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo
> mknod \
>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>      python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py
> b/meta/lib/oeqa/selftest/cases/rust.py
> new file mode 100644
> index 0000000000..69a1a285a9
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars,
> runqemu, Command
> +
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +       def run_check(self, *suites, ssh = None):
> +               # configure ssh target
> +               features = []
> +               if ssh is not None:
> +                       features.append('TOOLCHAIN_TEST_TARGET = "ssh"')
> +                       features.append('TOOLCHAIN_TEST_HOST =
> "{0}"'.format(ssh))
> +                       features.append('TOOLCHAIN_TEST_HOST_USER =
> "root"')
> +                       features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
> +               self.write_config("\n".join(features))
> +
> +               recipe = "rust-test"
> +               bitbake("{} -c check".format(recipe))
> +
> +       def run_check_emulated(self, *args, **kwargs):
> +               # build remote-test-server before image build
> +               recipe = "rust-test"
> +               bitbake("{} -c compile".format(recipe))
> +               # build core-image-minimal with required packages
> +               default_installed_packages = ["libgcc", "libstdc++",
> "libatomic", "libgomp"]
> +               features = []
> +               features.append('IMAGE_FEATURES += "ssh-server-openssh"')
> +               features.append('CORE_IMAGE_EXTRA_INSTALL +=
> "{0}"'.format(" ".join(default_installed_packages)))
> +               self.write_config("\n".join(features))
> +               bitbake("core-image-minimal")
> +               # wrap the execution with a qemu instance
> +               with runqemu("core-image-minimal", runqemuparams =
> "nographic slirp") as qemu:
> +                       return self.run_check(*args, ssh=qemu.ip, **kwargs)
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +       def test_rust(self):
> +               self.run_check_emulated("rust")
> diff --git a/meta/lib/oeqa/utils/qemurunner.py
> b/meta/lib/oeqa/utils/qemurunner.py
> index 77ec939ad7..aea7c624ec 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -184,7 +184,13 @@ class QemuRunner:
>          # and analyze descendents in order to determine it.
>          if os.path.exists(self.qemu_pidfile):
>              os.remove(self.qemu_pidfile)
> -        self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile
> {1}"'.format(bootparams, self.qemu_pidfile)
> +
> +        if "slirp" in launch_cmd:
> +            self.use_slirp = True
> +            self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}
> -monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial
> null"'.format(bootparams, self.qemu_pidfile)
> +        else:
> +            self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile
> {1}"'.format(bootparams, self.qemu_pidfile)
> +
>          if qemuparams:
>              self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + "
> " + '\"'
>
> diff --git a/meta/recipes-devtools/rust/rust-test.inc
> b/meta/recipes-devtools/rust/rust-test.inc
> new file mode 100644
> index 0000000000..0a13b3e0d8
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-test.inc
> @@ -0,0 +1,504 @@
> +HOMEPAGE = "http://www.rust-lang.org"
> +SECTION = "devel"
> +LICENSE = "MIT | Apache-2.0"
> +
> +inherit rust
> +inherit cargo_common
> +
> +DEPENDS += "file-native python3-native"
> +DEPENDS_append_class-native = " rust-llvm-native"
> +
> +# In case of x86_64 target we setting this path to location of
> "x86_64-poky-linux.json".
> +# This is to differentiate cross target and build in config.toml file.
> +export RUST_TARGET_PATH = "${STAGING_LIBDIR_NATIVE}/rustlib"
> +
> +export FORCE_CRATE_HASH="${BB_TASKHASH}"
> +
> +#export YOCTO_ALTERNATE_EXE_PATH =
> "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
> +export YOCTO_ALTERNATE_MULTILIB_NAME = "/${BASELIB}"
> +
> +# We don't want to use bitbakes vendoring because the rust sources do
> their
> +# own vendoring.
> +CARGO_DISABLE_BITBAKE_VENDORING = "1"
> +
> +# We can't use RUST_BUILD_SYS here because that may be "musl" if
> +# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
> +SNAPSHOT_BUILD_SYS = "${BUILD_ARCH}-unknown-linux-gnu"
> +setup_cargo_environment () {
> +    # The first step is to build bootstrap and some early stage tools,
> +    # these are build for the same target as the snapshot, e.g.
> +    # x86_64-unknown-linux-gnu.
> +    # Later stages are build for the native target (i.e.
> target.x86_64-linux)
> +    cargo_common_do_configure
> +
> +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
> +    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
> +}
> +
> +# Right now this is focused on arm-specific tune features.
> +# We get away with this for now as one can only use x86-64 as the build
> host
> +# (not arm).
> +# Note that TUNE_FEATURES is _always_ refering to the target, so we really
> +# don't want to use this for the host/build.
> +def llvm_features_from_tune(d):
> +    f = []
> +    feat = d.getVar('TUNE_FEATURES')
> +    if not feat:
> +        return []
> +    feat = frozenset(feat.split())
> +
> +    mach_overrides = d.getVar('MACHINEOVERRIDES')
> +    mach_overrides = frozenset(mach_overrides.split(':'))
> +
> +    if 'vfpv4' in feat:
> +        f.append("+vfp4")
> +    if 'vfpv3' in feat:
> +        f.append("+vfp3")
> +    if 'vfpv3d16' in feat:
> +        f.append("+d16")
> +
> +    if 'vfpv2' in feat or 'vfp' in feat:
> +        f.append("+vfp2")
> +
> +    if 'neon' in feat:
> +        f.append("+neon")
> +
> +    if 'aarch64' in feat:
> +        f.append("+v8")
> +
> +    if 'mips32' in feat:
> +        f.append("+mips32")
> +
> +    if 'mips32r2' in feat:
> +        f.append("+mips32r2")
> +
> +    v7=frozenset(['armv7a', 'armv7r', 'armv7m', 'armv7ve'])
> +    if (not mach_overrides.isdisjoint(v7)) or (not feat.isdisjoint(v7)):
> +        f.append("+v7")
> +    if ('armv6' in mach_overrides) or ('armv6' in feat):
> +        f.append("+v6")
> +
> +    if 'dsp' in feat:
> +        f.append("+dsp")
> +
> +    if 'thumb' in feat:
> +        if d.getVar('ARM_THUMB_OPT') is "thumb":
> +            if (not mach_overrides.isdisjoint(v7)) or (not
> feat.isdisjoint(v7)):
> +                f.append("+thumb2")
> +            f.append("+thumb-mode")
> +
> +    if 'cortexa5' in feat:
> +        f.append("+a5")
> +    if 'cortexa7' in feat:
> +        f.append("+a7")
> +    if 'cortexa9' in feat:
> +        f.append("+a9")
> +    if 'cortexa15' in feat:
> +        f.append("+a15")
> +    if 'cortexa17' in feat:
> +        f.append("+a17")
> +
> +    return f
> +
> +# TARGET_CC_ARCH changes from build/cross/target so it'll do the right
> thing
> +# this should go away when https://github.com/rust-lang/rust/pull/31709
> is
> +# stable (1.9.0?)
> +def llvm_features_from_cc_arch(d):
> +    f = []
> +    feat = d.getVar('TARGET_CC_ARCH')
> +    if not feat:
> +        return []
> +    feat = frozenset(feat.split())
> +
> +    if '-mmmx' in feat:
> +        f.append("+mmx")
> +    if '-msse' in feat:
> +        f.append("+sse")
> +    if '-msse2' in feat:
> +        f.append("+sse2")
> +    if '-msse3' in feat:
> +        f.append("+sse3")
> +    if '-mssse3' in feat:
> +        f.append("+ssse3")
> +    if '-msse4.1' in feat:
> +        f.append("+sse4.1")
> +    if '-msse4.2' in feat:
> +        f.append("+sse4.2")
> +    if '-msse4a' in feat:
> +        f.append("+sse4a")
> +    if '-mavx' in feat:
> +        f.append("+avx")
> +    if '-mavx2' in feat:
> +        f.append("+avx2")
> +
> +    return f
> +
> +def llvm_features_from_target_fpu(d):
> +    # TARGET_FPU can be hard or soft. +soft-float tell llvm to use soft
> float
> +    # ABI. There is no option for hard.
> +
> +    fpu = d.getVar('TARGET_FPU', True)
> +    return ["+soft-float"] if fpu == "soft" else []
> +
> +def llvm_features(d):
> +    return ','.join(llvm_features_from_tune(d) +
> +                    llvm_features_from_cc_arch(d) +
> +                    llvm_features_from_target_fpu(d))
> +
> +## arm-unknown-linux-gnueabihf
> +DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> +LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[arm] = "little"
> +TARGET_POINTER_WIDTH[arm] = "32"
> +TARGET_C_INT_WIDTH[arm] = "32"
> +MAX_ATOMIC_WIDTH[arm] = "64"
> +FEATURES[arm] = "+v6,+vfp2"
> +
> +## aarch64-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[aarch64] =
> "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
> +LLVM_TARGET[aarch64] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[aarch64] = "little"
> +TARGET_POINTER_WIDTH[aarch64] = "64"
> +TARGET_C_INT_WIDTH[aarch64] = "32"
> +MAX_ATOMIC_WIDTH[aarch64] = "128"
> +
> +## x86_64-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[x86_64] = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
> +LLVM_TARGET[x86_64] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[x86_64] = "little"
> +TARGET_POINTER_WIDTH[x86_64] = "64"
> +TARGET_C_INT_WIDTH[x86_64] = "32"
> +MAX_ATOMIC_WIDTH[x86_64] = "64"
> +
> +## i686-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
> +LLVM_TARGET[i686] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[i686] = "little"
> +TARGET_POINTER_WIDTH[i686] = "32"
> +TARGET_C_INT_WIDTH[i686] = "32"
> +MAX_ATOMIC_WIDTH[i686] = "64"
> +
> +## XXX: a bit of a hack so qemux86 builds, clone of
> i686-unknown-linux-{gnu, musl} above
> +DATA_LAYOUT[i586] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
> +LLVM_TARGET[i586] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[i586] = "little"
> +TARGET_POINTER_WIDTH[i586] = "32"
> +TARGET_C_INT_WIDTH[i586] = "32"
> +MAX_ATOMIC_WIDTH[i586] = "64"
> +
> +## mips-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[mips] = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
> +LLVM_TARGET[mips] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[mips] = "big"
> +TARGET_POINTER_WIDTH[mips] = "32"
> +TARGET_C_INT_WIDTH[mips] = "32"
> +MAX_ATOMIC_WIDTH[mips] = "32"
> +
> +## mipsel-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[mipsel] = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
> +LLVM_TARGET[mipsel] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[mipsel] = "little"
> +TARGET_POINTER_WIDTH[mipsel] = "32"
> +TARGET_C_INT_WIDTH[mipsel] = "32"
> +MAX_ATOMIC_WIDTH[mipsel] = "32"
> +
> +## mips64-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[mips64] = "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
> +LLVM_TARGET[mips64] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[mips64] = "big"
> +TARGET_POINTER_WIDTH[mips64] = "64"
> +TARGET_C_INT_WIDTH[mips64] = "64"
> +MAX_ATOMIC_WIDTH[mips64] = "64"
> +
> +## mips64el-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
> +LLVM_TARGET[mips64el] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[mips64el] = "little"
> +TARGET_POINTER_WIDTH[mips64el] = "64"
> +TARGET_C_INT_WIDTH[mips64el] = "64"
> +MAX_ATOMIC_WIDTH[mips64el] = "64"
> +
> +## powerpc-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
> +LLVM_TARGET[powerpc] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[powerpc] = "big"
> +TARGET_POINTER_WIDTH[powerpc] = "32"
> +TARGET_C_INT_WIDTH[powerpc] = "32"
> +MAX_ATOMIC_WIDTH[powerpc] = "32"
> +
> +## riscv32-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[riscv32] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
> +LLVM_TARGET[riscv32] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[riscv32] = "little"
> +TARGET_POINTER_WIDTH[riscv32] = "32"
> +TARGET_C_INT_WIDTH[riscv32] = "32"
> +MAX_ATOMIC_WIDTH[riscv32] = "32"
> +
> +## riscv64-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[riscv64] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
> +LLVM_TARGET[riscv64] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[riscv64] = "little"
> +TARGET_POINTER_WIDTH[riscv64] = "64"
> +TARGET_C_INT_WIDTH[riscv64] = "64"
> +MAX_ATOMIC_WIDTH[riscv64] = "64"
> +
> +def arch_for(d, thing):
> +    return d.getVar('{}_ARCH'.format(thing))
> +
> +def sys_for(d, thing):
> +    return d.getVar('{}_SYS'.format(thing))
> +
> +def prefix_for(d, thing):
> +    return d.getVar('{}_PREFIX'.format(thing))
> +
> +# Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to
> something
> +# rust's internals won't choke on.
> +def arch_to_rust_target_arch(arch):
> +    if arch == "i586" or arch == "i686":
> +        return "x86"
> +    elif arch == "mipsel":
> +        return "mips"
> +    elif arch == "mip64sel":
> +        return "mips64"
> +    else:
> +        return arch
> +
> +# generates our target CPU value
> +def llvm_cpu(d):
> +    cpu = d.getVar('PACKAGE_ARCH')
> +    target = d.getVar('TRANSLATED_TARGET_ARCH')
> +
> +    trans = {}
> +    trans['corei7-64'] = "corei7"
> +    trans['core2-32'] = "core2"
> +    trans['x86-64'] = "x86-64"
> +    trans['i686'] = "i686"
> +    trans['i586'] = "i586"
> +    trans['powerpc'] = "powerpc"
> +    trans['mips64'] = "mips64"
> +    trans['mips64el'] = "mips64"
> +
> +    if target in ["mips", "mipsel"]:
> +        feat = frozenset(d.getVar('TUNE_FEATURES').split())
> +        if "mips32r2" in feat:
> +            trans['mipsel'] = "mips32r2"
> +            trans['mips'] = "mips32r2"
> +        elif "mips32" in feat:
> +            trans['mipsel'] = "mips32"
> +            trans['mips'] = "mips32"
> +
> +    try:
> +        return trans[cpu]
> +    except:
> +        return trans.get(target, "generic")
> +
> +TARGET_LLVM_CPU="${@llvm_cpu(d)}"
> +TARGET_LLVM_FEATURES = "${@llvm_features(d)}"
> +
> +# class-native implies TARGET=HOST, and TUNE_FEATURES only describes the
> real
> +# (original) target.
> +TARGET_LLVM_FEATURES_class-native =
> "${@','.join(llvm_features_from_cc_arch(d))}"
> +
> +def rust_gen_target(d, thing, wd, features, cpu):
> +    import json
> +    from distutils.version import LooseVersion
> +    arch = arch_for(d, thing)
> +    sys = sys_for(d, thing)
> +    prefix = prefix_for(d, thing)
> +
> +    features = features or d.getVarFlag('FEATURES', arch) or ""
> +    features = features.strip()
> +
> +    # build tspec
> +    tspec = {}
> +    tspec['llvm-target'] = d.getVarFlag('LLVM_TARGET', arch)
> +    tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch)
> +    tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH',
> arch))
> +    tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH',
> arch)
> +    tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch)
> +    tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch)
> +    tspec['arch'] = arch_to_rust_target_arch(arch)
> +    tspec['os'] = "linux"
> +    if "musl" in tspec['llvm-target']:
> +        tspec['env'] = "musl"
> +    else:
> +        tspec['env'] = "gnu"
> +    tspec['vendor'] = "unknown"
> +    tspec['target-family'] = "unix"
> +    tspec['linker'] = "{}{}gcc".format(d.getVar('CCACHE'), prefix)
> +    tspec['ar'] = "{}ar".format(prefix)
> +    tspec['cpu'] = cpu
> +    if features is not "":
> +        tspec['features'] = features
> +    tspec['dynamic-linking'] = True
> +    tspec['executables'] = True
> +    tspec['linker-is-gnu'] = True
> +    tspec['linker-flavor'] = "gcc"
> +    tspec['has-rpath'] = True
> +    tspec['has-elf-tls'] = True
> +    tspec['position-independent-executables'] = True
> +    tspec['panic-strategy'] = d.getVar("RUST_PANIC_STRATEGY")
> +
> +    # Don't use jemalloc as it doesn't work for many targets.
> +    # https://github.com/rust-lang/rust/pull/37392
> +    # From 1.20.0 and forward, system allocator is the default.
> +    if LooseVersion(d.getVar("PV")) < LooseVersion("1.20.0"):
> +        tspec['exe-allocation-crate'] = "alloc_system"
> +        tspec['lib-allocation-crate'] = "alloc_system"
> +
> +    # write out the target spec json file
> +    with open(wd + sys + '.json', 'w') as f:
> +        json.dump(tspec, f, indent=4)
> +
> +python do_rust_gen_targets () {
> +    wd = d.getVar('WORKDIR') + '/targets/'
> +    rust_gen_target(d, 'BUILD', wd, "", "generic")
> +}
> +
> +addtask rust_gen_targets after do_patch before do_compile
> +do_rust_gen_targets[dirs] += "${WORKDIR}/targets"
> +
> +do_rust_setup_snapshot () {
> +    for installer in
> "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
> +        "${installer}" --prefix="${WORKDIR}/rust-snapshot"
> --disable-ldconfig
> +    done
> +
> +    # Some versions of rust (e.g. 1.18.0) tries to find cargo in
> stage0/bin/cargo
> +    # and fail without it there.
> +    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
> +    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
> +}
> +addtask rust_setup_snapshot after do_unpack before do_configure
> +do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
> +
> +
> +python do_configure() {
> +    import json
> +    from distutils.version import LooseVersion
> +    try:
> +        import configparser
> +    except ImportError:
> +        import ConfigParser as configparser
> +
> +    # toml is rather similar to standard ini like format except it likes
> values
> +    # that look more JSON like. So for our purposes simply escaping all
> values
> +    # as JSON seem to work fine.
> +
> +    e = lambda s: json.dumps(s)
> +
> +    config = configparser.RawConfigParser()
> +
> +    # [target.ARCH-unknown-linux-gnu]
> +    if( d.getVar('RUST_TARGET_SYS', True) !=
> d.getVar('SNAPSHOT_BUILD_SYS', True)):
> +       target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS',
> True))
> +    else :
> +       target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
> +
> +    config.add_section(target_section)
> +
> +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> +    config.set(target_section, "linker",
> e(d.expand("${RUST_TARGET_CCLD}")))
> +
> +    # If we don't do this rust-native will compile it's own llvm for
> BUILD.
> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> +    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS',
> True))
> +    config.add_section(target_section)
> +
> +    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> +
> +    # [rust]
> +    config.add_section("rust")
> +    config.set("rust", "rpath", e(True))
> +    config.set("rust", "channel", e("stable"))
> +
> +    if LooseVersion(d.getVar("PV")) < LooseVersion("1.32.0"):
> +        config.set("rust", "use-jemalloc", e(False))
> +
> +    # Whether or not to optimize the compiler and standard library
> +    config.set("rust", "optimize", e(True))
> +
> +    # Emits extraneous output from tests to ensure that failures of the
> test
> +    # harness are debuggable just from logfiles
> +    config.set("rust", "verbose-tests", e(True))
> +
> +    # [build]
> +    config.add_section("build")
> +    config.set("build", "submodules", e(False))
> +    config.set("build", "docs", e(False))
> +
> +    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
> +    config.set("build", "rustc", e(rustc))
> +
> +    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
> +    config.set("build", "cargo", e(cargo))
> +
> +    config.set("build", "vendor", e(True))
> +
> +    if( d.getVar('RUST_TARGET_SYS', True) !=
> d.getVar('SNAPSHOT_BUILD_SYS', True)):
> +        targets = [d.getVar("RUST_TARGET_SYS", True)]
> +    else:
> +        targets = [d.getVar("TARGET_SYS", True)]
> +
> +    config.set("build", "target", e(targets))
> +
> +    hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
> +    config.set("build", "host", e(hosts))
> +
> +    # We can't use BUILD_SYS since that is something the rust snapshot
> knows
> +    # nothing about when trying to build some stage0 tools (like
> fabricate)
> +    config.set("build", "build", e(d.getVar("SNAPSHOT_BUILD_SYS", True)))
> +
> +    with open("config.toml", "w") as f:
> +        config.write(f)
> +
> +    # set up ${WORKDIR}/cargo_home
> +    bb.build.exec_func("setup_cargo_environment", d)
> +}
> +
> +
> +rust_runx () {
> +    echo "COMPILE ${PN}" "$@"
> +
> +    # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust's build for a
> +    # wide range of targets (not just TARGET). Yocto's settings for them
> will
> +    # be inappropriate, avoid using.
> +    unset CFLAGS
> +    unset LDFLAGS
> +    unset CXXFLAGS
> +    unset CPPFLAGS
> +
> +    oe_cargo_fix_env
> +
> +    nativepython3 src/bootstrap/bootstrap.py
> ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@"
> +}
> +rust_runx[vardepsexclude] += "PARALLEL_MAKE"
> +
> +do_compile () {
> +    if [  "${SNAPSHOT_BUILD_SYS}" = "${RUST_TARGET_SYS}" ]
> +    then
> +       rust_runx build src/tools/remote-test-server --target
> "${TARGET_SYS}"
> +    else
> +       rust_runx build src/tools/remote-test-server --target
> "${RUST_TARGET_SYS}"
> +    fi
> +}
> +
> +do_check[dirs] += "${B}"
> +do_check[nostamp] = "1"
> +do_check () {
> +    scp -P 2222 -o StrictHostKeyChecking=no
> build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server
> root@127.0.0.1:~/
> +    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1
> "~/remote-test-server -v remote"
> +
> +
> +    export TEST_DEVICE_ADDR="127.0.0.1:12345"
> +    if [  "${SNAPSHOT_BUILD_SYS}" = "${RUST_TARGET_SYS}" ]
> +    then
> +       rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" >
> summary.txt 2> /dev/null
> +    else
> +       rust_runx test --no-fail-fast --target "${RUST_TARGET_SYS}" >
> summary.txt 2> /dev/null
> +    fi
> +
> +}
> +addtask do_check after do_compile
> +
> diff --git a/meta/recipes-devtools/rust/rust-test_1.46.0.bb
> b/meta/recipes-devtools/rust/rust-test_1.46.0.bb
> new file mode 100644
> index 0000000000..b724ea5eb0
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-test_1.46.0.bb
> @@ -0,0 +1,12 @@
> +require rust-test.inc
> +require rust-source-${PV}.inc
> +require rust-snapshot-${PV}.inc
> +
> +DEPENDS += "rust-llvm (=${PV})"
> +
> +# Otherwise we'll depend on what we provide
> +INHIBIT_DEFAULT_RUST_DEPS_class-native = "1"
> +# We don't need to depend on gcc-native because yocto assumes it exists
> +PROVIDES_class-native = "virtual/${TARGET_PREFIX}rust"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index dd92a64553..1a21a90add 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1055,7 +1055,7 @@ class BaseConfig(object):
>          logger.info("Network configuration:%s", netconf)
>          self.kernel_cmdline_script += netconf
>          # Port mapping
> -        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
> +        hostfwd =
> ",hostfwd=tcp::12345-:12345,hostfwd=tcp::2323-:23,hostfwd=tcp::2222-:22"
>          qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" %
> (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
>          qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
>          # Figure out the port
> @@ -1084,6 +1084,19 @@ class BaseConfig(object):
>                          mac += 1
>              if p != p_new:
>                  ports.append(p_new)
> +                temp=__file__.split(os.path.basename(__file__))[0]
> +                with
> open(temp+"../meta/recipes-devtools/rust/rust-test.inc", 'r+') as f:
> +                    text = f.readlines()
> +                    temp1=[]
> +                    for i in text:
> +                        temp = re.sub(r'(\S+\s)(-.)(\s\d+)( -o
> StrictHostKeyChecking=no .*)', r'\1\2 '+str(p_new)+'\\4', i)
> +                        temp1.append(temp)
> +                    temp2=''
> +                    for i in temp1:
> +                        temp2=temp2+i
> +                    f.seek(0)
> +                    f.write(temp2)
> +                    f.truncate()
>                  qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new,
> qb_slirp_opt)
>                  logger.info("Port forward changed: %s -> %s" % (p,
> p_new))
>          mac = "%s%02x" % (self.mac_slirp, mac)
> --
> 2.17.1
>
>
> 
>
>

--000000000000ca3c4605bf9b356a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There are a few unrelated changes all bundled togethe=
r - please split it into several commits and properly describe each. Partic=
ularly rust-test.inc is huge, and does need a proper explanation of what is=
 happening and why, in both the commit message and inline comments. Do keep=
 in mind: making the code work is only half the job, the other half is expl=
aining what happens to other humans.</div><div><br></div><div>Alex<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, 9 Apr 2021 at 13:59, Vinay Kumar &lt;<a href=3D"mailto:vinay.m.eng=
g@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Signed-off-by: Vinay Kumar &lt;<a href=
=3D"mailto:vinay.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.co=
m</a>&gt;<br>
---<br>
=C2=A0meta/classes/rust-common.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 41 ++<br>
=C2=A0meta/lib/oeqa/utils/qemurunner.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0meta/recipes-devtools/rust/rust-test.inc=C2=A0 =C2=A0 =C2=A0 | 504 +=
+++++++++++++++++<br>
=C2=A0.../recipes-devtools/rust/<a href=3D"http://rust-test_1.46.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">rust-test_1.46.0.bb</a> |=C2=A0 12 +<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +-<b=
r>
=C2=A07 files changed, 583 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/rust.py<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/rust-test.inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/<a href=3D"http://rust=
-test_1.46.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-test_1.46.0.bb</=
a><br>
<br>
diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.b=
bclass<br>
index ff7b9da8f3..fb75b07ba3 100644<br>
--- a/meta/classes/rust-common.bbclass<br>
+++ b/meta/classes/rust-common.bbclass<br>
@@ -84,7 +84,10 @@ def rust_base_triple(d, thing):<br>
=C2=A0 =C2=A0 =C2=A0# This catches ARM targets and appends the necessary h=
ard float bits<br>
=C2=A0 =C2=A0 =C2=A0if os =3D=3D &quot;linux-gnueabi&quot; or os =3D=3D &q=
uot;linux-musleabi&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc =3D bb.utils.contains(&#39;TUNE_FEA=
TURES&#39;, &#39;callconvention-hard&#39;, &#39;hf&#39;, &#39;&#39;, d)<br>
-=C2=A0 =C2=A0 return arch + vendor + &#39;-&#39; + os + libc<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;TARGET_ARCH&#39;) =3D=3D &#39;mips64&#39;:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return arch + vendor + &#39;-&#39; + os + libc=
 + &#39;abi64&#39;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return arch + vendor + &#39;-&#39; + os + libc=
<br>
<br>
=C2=A0# Naming explanation<br>
=C2=A0# Yocto<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 3438be92b7..83e1b68071 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -483,7 +483,7 @@ HOSTTOOLS_DIR =3D &quot;${TMPDIR}/hosttools&quot;<br>
=C2=A0HOSTTOOLS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0[ ar as awk basename bash bzip2 cat chgrp chmod chown =
chrpath cmp comm cp cpio \<br>
=C2=A0 =C2=A0 =C2=A0cpp cut date dd diff diffstat dirname du echo egrep en=
v expand expr false \<br>
-=C2=A0 =C2=A0 fgrep file find flock g++ gawk gcc getconf getopt git grep =
gunzip gzip \<br>
+=C2=A0 =C2=A0 fgrep file find flock g++ gawk gcc cc getconf getopt git gr=
ep gunzip gzip \<br>
=C2=A0 =C2=A0 =C2=A0head hostname iconv id install ld ldd ln ls make md5su=
m mkdir mkfifo mknod \<br>
=C2=A0 =C2=A0 =C2=A0mktemp mv nm objcopy objdump od patch perl pr printf p=
wd \<br>
=C2=A0 =C2=A0 =C2=A0python3 ranlib readelf readlink realpath rm rmdir rpcg=
en sed seq sh \<br>
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest=
/cases/rust.py<br>
new file mode 100644<br>
index 0000000000..69a1a285a9<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/rust.py<br>
@@ -0,0 +1,41 @@<br>
+# SPDX-License-Identifier: MIT<br>
+import os<br>
+from oeqa.core.decorator import OETestTag<br>
+from oeqa.core.case import OEPTestResultTestCase<br>
+from oeqa.selftest.case import OESelftestTestCase<br>
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu=
, Command<br>
+<br>
+class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def run_check(self, *suites, ssh =3D None):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# configure ssh ta=
rget<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D []<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ssh is not None=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0features.append(&#39;TOOLCHAIN_TEST_TARGET =3D &quot;ssh&quot;&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0features.append(&#39;TOOLCHAIN_TEST_HOST =3D &quot;{0}&quot;&#39=
;.format(ssh))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0features.append(&#39;TOOLCHAIN_TEST_HOST_USER =3D &quot;root&quo=
t;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0features.append(&#39;TOOLCHAIN_TEST_HOST_PORT =3D &quot;22&quot;=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(=
&quot;\n&quot;.join(features))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipe =3D &quot;r=
ust-test&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;{} -=
c check&quot;.format(recipe))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def run_check_emulated(self, *args, **kwargs):=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build remote-tes=
t-server before image build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipe =3D &quot;r=
ust-test&quot;=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;{} -=
c compile&quot;.format(recipe))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build core-image=
-minimal with required packages<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_installed_=
packages =3D [&quot;libgcc&quot;, &quot;libstdc++&quot;, &quot;libatomic&qu=
ot;, &quot;libgomp&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D []<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features.append(&#=
39;IMAGE_FEATURES +=3D &quot;ssh-server-openssh&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features.append(&#=
39;CORE_IMAGE_EXTRA_INSTALL +=3D &quot;{0}&quot;&#39;.format(&quot; &quot;.=
join(default_installed_packages)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(=
&quot;\n&quot;.join(features))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;core=
-image-minimal&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# wrap the executi=
on with a qemu instance<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with runqemu(&quot=
;core-image-minimal&quot;, runqemuparams =3D &quot;nographic slirp&quot;) a=
s qemu:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0return self.run_check(*args, ssh=3Dqemu.ip, **kwargs)<br>
+<br>
+@OETestTag(&quot;toolchain-system&quot;)<br>
+class RustSelfTestSystemEmulated(RustSelfTestBase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0def test_rust(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.run_check_emu=
lated(&quot;rust&quot;)<br>
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemur=
unner.py<br>
index 77ec939ad7..aea7c624ec 100644<br>
--- a/meta/lib/oeqa/utils/qemurunner.py<br>
+++ b/meta/lib/oeqa/utils/qemurunner.py<br>
@@ -184,7 +184,13 @@ class QemuRunner:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# and analyze descendents in order to de=
termine it.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(self.qemu_pidfile):<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(self.qemu_pidfil=
e)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemuparams =3D &#39;bootparams=3D&quot;{=
0}&quot; qemuparams=3D&quot;-pidfile {1}&quot;&#39;.format(bootparams, self=
.qemu_pidfile)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;slirp&quot; in launch_cmd:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.use_slirp =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemuparams =3D &#39;bootpa=
rams=3D&quot;{0}&quot; qemuparams=3D&quot;-pidfile {1} -monitor telnet:<a h=
ref=3D"http://127.0.0.1:1234" rel=3D"noreferrer" target=3D"_blank">127.0.0.=
1:1234</a>,server,nowait -serial mon:stdio -serial null&quot;&#39;.format(b=
ootparams, self.qemu_pidfile)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemuparams =3D &#39;bootpa=
rams=3D&quot;{0}&quot; qemuparams=3D&quot;-pidfile {1}&quot;&#39;.format(bo=
otparams, self.qemu_pidfile)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if qemuparams:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemuparams =3D self.q=
emuparams[:-1] + &quot; &quot; + qemuparams + &quot; &quot; + &#39;\&quot;&=
#39;<br>
<br>
diff --git a/meta/recipes-devtools/rust/rust-test.inc b/meta/recipes-devto=
ols/rust/rust-test.inc<br>
new file mode 100644<br>
index 0000000000..0a13b3e0d8<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rust/rust-test.inc<br>
@@ -0,0 +1,504 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.rust-lang.org" rel=3D"noreferrer=
" target=3D"_blank">http://www.rust-lang.org</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+LICENSE =3D &quot;MIT | Apache-2.0&quot;<br>
+<br>
+inherit rust<br>
+inherit cargo_common<br>
+<br>
+DEPENDS +=3D &quot;file-native python3-native&quot;<br>
+DEPENDS_append_class-native =3D &quot; rust-llvm-native&quot;<br>
+<br>
+# In case of x86_64 target we setting this path to location of &quot;x86_=
64-poky-linux.json&quot;. <br>
+# This is to differentiate cross target and build in config.toml file.<br=
>
+export RUST_TARGET_PATH =3D &quot;${STAGING_LIBDIR_NATIVE}/rustlib&quot;<=
br>
+<br>
+export FORCE_CRATE_HASH=3D&quot;${BB_TASKHASH}&quot;<br>
+<br>
+#export YOCTO_ALTERNATE_EXE_PATH =3D &quot;${STAGING_LIBDIR}/llvm-rust/bi=
n/llvm-config&quot;<br>
+export YOCTO_ALTERNATE_MULTILIB_NAME =3D &quot;/${BASELIB}&quot;<br>
+<br>
+# We don&#39;t want to use bitbakes vendoring because the rust sources do=
 their<br>
+# own vendoring.<br>
+CARGO_DISABLE_BITBAKE_VENDORING =3D &quot;1&quot;<br>
+<br>
+# We can&#39;t use RUST_BUILD_SYS here because that may be &quot;musl&quo=
t; if<br>
+# TCLIBC=3D&quot;musl&quot;. Snapshots are always -unknown-linux-gnu<br>
+SNAPSHOT_BUILD_SYS =3D &quot;${BUILD_ARCH}-unknown-linux-gnu&quot;<br>
+setup_cargo_environment () {<br>
+=C2=A0 =C2=A0 # The first step is to build bootstrap and some early stage=
 tools,<br>
+=C2=A0 =C2=A0 # these are build for the same target as the snapshot, e.g.=
<br>
+=C2=A0 =C2=A0 # x86_64-unknown-linux-gnu.<br>
+=C2=A0 =C2=A0 # Later stages are build for the native target (i.e. target=
.x86_64-linux)<br>
+=C2=A0 =C2=A0 cargo_common_do_configure<br>
+<br>
+=C2=A0 =C2=A0 printf &#39;[target.%s]\n&#39; &quot;${SNAPSHOT_BUILD_SYS}&=
quot; &gt;&gt; ${CARGO_HOME}/config<br>
+=C2=A0 =C2=A0 printf &quot;linker =3D &#39;%s&#39;\n&quot; &quot;${RUST_B=
UILD_CCLD}&quot; &gt;&gt; ${CARGO_HOME}/config<br>
+}<br>
+<br>
+# Right now this is focused on arm-specific tune features.<br>
+# We get away with this for now as one can only use x86-64 as the build h=
ost<br>
+# (not arm).<br>
+# Note that TUNE_FEATURES is _always_ refering to the target, so we reall=
y<br>
+# don&#39;t want to use this for the host/build.<br>
+def llvm_features_from_tune(d):<br>
+=C2=A0 =C2=A0 f =3D []<br>
+=C2=A0 =C2=A0 feat =3D d.getVar(&#39;TUNE_FEATURES&#39;)<br>
+=C2=A0 =C2=A0 if not feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
+=C2=A0 =C2=A0 feat =3D frozenset(feat.split())<br>
+<br>
+=C2=A0 =C2=A0 mach_overrides =3D d.getVar(&#39;MACHINEOVERRIDES&#39;)<br>
+=C2=A0 =C2=A0 mach_overrides =3D frozenset(mach_overrides.split(&#39;:&#3=
9;))<br>
+<br>
+=C2=A0 =C2=A0 if &#39;vfpv4&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+vfp4&quot;)<br>
+=C2=A0 =C2=A0 if &#39;vfpv3&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+vfp3&quot;)<br>
+=C2=A0 =C2=A0 if &#39;vfpv3d16&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+d16&quot;)<br>
+<br>
+=C2=A0 =C2=A0 if &#39;vfpv2&#39; in feat or &#39;vfp&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+vfp2&quot;)<br>
+<br>
+=C2=A0 =C2=A0 if &#39;neon&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+neon&quot;)<br>
+<br>
+=C2=A0 =C2=A0 if &#39;aarch64&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+v8&quot;)<br>
+<br>
+=C2=A0 =C2=A0 if &#39;mips32&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+mips32&quot;)<br>
+<br>
+=C2=A0 =C2=A0 if &#39;mips32r2&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+mips32r2&quot;)<br>
+<br>
+=C2=A0 =C2=A0 v7=3Dfrozenset([&#39;armv7a&#39;, &#39;armv7r&#39;, &#39;ar=
mv7m&#39;, &#39;armv7ve&#39;])<br>
+=C2=A0 =C2=A0 if (not mach_overrides.isdisjoint(v7)) or (not feat.isdisjo=
int(v7)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+v7&quot;)<br>
+=C2=A0 =C2=A0 if (&#39;armv6&#39; in mach_overrides) or (&#39;armv6&#39; =
in feat):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+v6&quot;)<br>
+<br>
+=C2=A0 =C2=A0 if &#39;dsp&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+dsp&quot;)<br>
+<br>
+=C2=A0 =C2=A0 if &#39;thumb&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;ARM_THUMB_OPT&#39;) is &quot=
;thumb&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (not mach_overrides.isdisjoi=
nt(v7)) or (not feat.isdisjoint(v7)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+t=
humb2&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+thumb-mode&quot=
;)<br>
+<br>
+=C2=A0 =C2=A0 if &#39;cortexa5&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+a5&quot;)<br>
+=C2=A0 =C2=A0 if &#39;cortexa7&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+a7&quot;)<br>
+=C2=A0 =C2=A0 if &#39;cortexa9&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+a9&quot;)<br>
+=C2=A0 =C2=A0 if &#39;cortexa15&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+a15&quot;)<br>
+=C2=A0 =C2=A0 if &#39;cortexa17&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+a17&quot;)<br>
+<br>
+=C2=A0 =C2=A0 return f<br>
+<br>
+# TARGET_CC_ARCH changes from build/cross/target so it&#39;ll do the righ=
t thing<br>
+# this should go away when <a href=3D"https://github.com/rust-lang/rust/p=
ull/31709" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lan=
g/rust/pull/31709</a> is<br>
+# stable (1.9.0?)<br>
+def llvm_features_from_cc_arch(d):<br>
+=C2=A0 =C2=A0 f =3D []<br>
+=C2=A0 =C2=A0 feat =3D d.getVar(&#39;TARGET_CC_ARCH&#39;)<br>
+=C2=A0 =C2=A0 if not feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
+=C2=A0 =C2=A0 feat =3D frozenset(feat.split())<br>
+<br>
+=C2=A0 =C2=A0 if &#39;-mmmx&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+mmx&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-msse&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+sse&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-msse2&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+sse2&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-msse3&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+sse3&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-mssse3&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+ssse3&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-msse4.1&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+sse4.1&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-msse4.2&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+sse4.2&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-msse4a&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+sse4a&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-mavx&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+avx&quot;)<br>
+=C2=A0 =C2=A0 if &#39;-mavx2&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+avx2&quot;)<br>
+<br>
+=C2=A0 =C2=A0 return f<br>
+<br>
+def llvm_features_from_target_fpu(d):<br>
+=C2=A0 =C2=A0 # TARGET_FPU can be hard or soft. +soft-float tell llvm to =
use soft float<br>
+=C2=A0 =C2=A0 # ABI. There is no option for hard.<br>
+<br>
+=C2=A0 =C2=A0 fpu =3D d.getVar(&#39;TARGET_FPU&#39;, True)<br>
+=C2=A0 =C2=A0 return [&quot;+soft-float&quot;] if fpu =3D=3D &quot;soft&q=
uot; else []<br>
+<br>
+def llvm_features(d):<br>
+=C2=A0 =C2=A0 return &#39;,&#39;.join(llvm_features_from_tune(d) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 llv=
m_features_from_cc_arch(d) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 llv=
m_features_from_target_fpu(d))<br>
+<br>
+## arm-unknown-linux-gnueabihf<br>
+DATA_LAYOUT[arm] =3D &quot;e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S6=
4&quot;<br>
+LLVM_TARGET[arm] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[arm] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[arm] =3D &quot;32&quot;<br>
+TARGET_C_INT_WIDTH[arm] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[arm] =3D &quot;64&quot;<br>
+FEATURES[arm] =3D &quot;+v6,+vfp2&quot;<br>
+<br>
+## aarch64-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[aarch64] =3D &quot;e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n3=
2:64-S128&quot;<br>
+LLVM_TARGET[aarch64] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[aarch64] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[aarch64] =3D &quot;64&quot;<br>
+TARGET_C_INT_WIDTH[aarch64] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[aarch64] =3D &quot;128&quot;<br>
+<br>
+## x86_64-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[x86_64] =3D &quot;e-m:e-i64:64-f80:128-n8:16:32:64-S128&quot;=
<br>
+LLVM_TARGET[x86_64] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[x86_64] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[x86_64] =3D &quot;64&quot;<br>
+TARGET_C_INT_WIDTH[x86_64] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[x86_64] =3D &quot;64&quot;<br>
+<br>
+## i686-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[i686] =3D &quot;e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128&=
quot;<br>
+LLVM_TARGET[i686] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[i686] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[i686] =3D &quot;32&quot;<br>
+TARGET_C_INT_WIDTH[i686] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[i686] =3D &quot;64&quot;<br>
+<br>
+## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{g=
nu, musl} above<br>
+DATA_LAYOUT[i586] =3D &quot;e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128&=
quot;<br>
+LLVM_TARGET[i586] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[i586] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[i586] =3D &quot;32&quot;<br>
+TARGET_C_INT_WIDTH[i586] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[i586] =3D &quot;64&quot;<br>
+<br>
+## mips-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[mips] =3D &quot;E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S6=
4&quot;<br>
+LLVM_TARGET[mips] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[mips] =3D &quot;big&quot;<br>
+TARGET_POINTER_WIDTH[mips] =3D &quot;32&quot;<br>
+TARGET_C_INT_WIDTH[mips] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[mips] =3D &quot;32&quot;<br>
+<br>
+## mipsel-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[mipsel] =3D &quot;e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-=
S64&quot;<br>
+LLVM_TARGET[mipsel] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[mipsel] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[mipsel] =3D &quot;32&quot;<br>
+TARGET_C_INT_WIDTH[mipsel] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[mipsel] =3D &quot;32&quot;<br>
+<br>
+## mips64-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[mips64] =3D &quot;E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128&=
quot;<br>
+LLVM_TARGET[mips64] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[mips64] =3D &quot;big&quot;<br>
+TARGET_POINTER_WIDTH[mips64] =3D &quot;64&quot;<br>
+TARGET_C_INT_WIDTH[mips64] =3D &quot;64&quot;<br>
+MAX_ATOMIC_WIDTH[mips64] =3D &quot;64&quot;<br>
+<br>
+## mips64el-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[mips64el] =3D &quot;e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S12=
8&quot;<br>
+LLVM_TARGET[mips64el] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[mips64el] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[mips64el] =3D &quot;64&quot;<br>
+TARGET_C_INT_WIDTH[mips64el] =3D &quot;64&quot;<br>
+MAX_ATOMIC_WIDTH[mips64el] =3D &quot;64&quot;<br>
+<br>
+## powerpc-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[powerpc] =3D &quot;E-m:e-p:32:32-i64:64-n32&quot;<br>
+LLVM_TARGET[powerpc] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[powerpc] =3D &quot;big&quot;<br>
+TARGET_POINTER_WIDTH[powerpc] =3D &quot;32&quot;<br>
+TARGET_C_INT_WIDTH[powerpc] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[powerpc] =3D &quot;32&quot;<br>
+<br>
+## riscv32-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[riscv32] =3D &quot;e-m:e-p:64:64-i64:64-i128:128-n64-S128&quo=
t;<br>
+LLVM_TARGET[riscv32] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[riscv32] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[riscv32] =3D &quot;32&quot;<br>
+TARGET_C_INT_WIDTH[riscv32] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[riscv32] =3D &quot;32&quot;<br>
+<br>
+## riscv64-unknown-linux-{gnu, musl}<br>
+DATA_LAYOUT[riscv64] =3D &quot;e-m:e-p:64:64-i64:64-i128:128-n64-S128&quo=
t;<br>
+LLVM_TARGET[riscv64] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[riscv64] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[riscv64] =3D &quot;64&quot;<br>
+TARGET_C_INT_WIDTH[riscv64] =3D &quot;64&quot;<br>
+MAX_ATOMIC_WIDTH[riscv64] =3D &quot;64&quot;<br>
+<br>
+def arch_for(d, thing):<br>
+=C2=A0 =C2=A0 return d.getVar(&#39;{}_ARCH&#39;.format(thing))<br>
+<br>
+def sys_for(d, thing):<br>
+=C2=A0 =C2=A0 return d.getVar(&#39;{}_SYS&#39;.format(thing))<br>
+<br>
+def prefix_for(d, thing):<br>
+=C2=A0 =C2=A0 return d.getVar(&#39;{}_PREFIX&#39;.format(thing))<br>
+<br>
+# Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to some=
thing<br>
+# rust&#39;s internals won&#39;t choke on.<br>
+def arch_to_rust_target_arch(arch):<br>
+=C2=A0 =C2=A0 if arch =3D=3D &quot;i586&quot; or arch =3D=3D &quot;i686&q=
uot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;x86&quot;<br>
+=C2=A0 =C2=A0 elif arch =3D=3D &quot;mipsel&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;mips&quot;<br>
+=C2=A0 =C2=A0 elif arch =3D=3D &quot;mip64sel&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;mips64&quot;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return arch<br>
+<br>
+# generates our target CPU value<br>
+def llvm_cpu(d):<br>
+=C2=A0 =C2=A0 cpu =3D d.getVar(&#39;PACKAGE_ARCH&#39;)<br>
+=C2=A0 =C2=A0 target =3D d.getVar(&#39;TRANSLATED_TARGET_ARCH&#39;)<br>
+<br>
+=C2=A0 =C2=A0 trans =3D {}<br>
+=C2=A0 =C2=A0 trans[&#39;corei7-64&#39;] =3D &quot;corei7&quot;<br>
+=C2=A0 =C2=A0 trans[&#39;core2-32&#39;] =3D &quot;core2&quot;<br>
+=C2=A0 =C2=A0 trans[&#39;x86-64&#39;] =3D &quot;x86-64&quot;<br>
+=C2=A0 =C2=A0 trans[&#39;i686&#39;] =3D &quot;i686&quot;<br>
+=C2=A0 =C2=A0 trans[&#39;i586&#39;] =3D &quot;i586&quot;<br>
+=C2=A0 =C2=A0 trans[&#39;powerpc&#39;] =3D &quot;powerpc&quot;<br>
+=C2=A0 =C2=A0 trans[&#39;mips64&#39;] =3D &quot;mips64&quot;<br>
+=C2=A0 =C2=A0 trans[&#39;mips64el&#39;] =3D &quot;mips64&quot;<br>
+<br>
+=C2=A0 =C2=A0 if target in [&quot;mips&quot;, &quot;mipsel&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 feat =3D frozenset(d.getVar(&#39;TUNE_FEATURE=
S&#39;).split())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;mips32r2&quot; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trans[&#39;mipsel&#39;] =3D &qu=
ot;mips32r2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trans[&#39;mips&#39;] =3D &quot=
;mips32r2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;mips32&quot; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trans[&#39;mipsel&#39;] =3D &qu=
ot;mips32&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trans[&#39;mips&#39;] =3D &quot=
;mips32&quot;<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return trans[cpu]<br>
+=C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return trans.get(target, &quot;generic&quot;)=
<br>
+<br>
+TARGET_LLVM_CPU=3D&quot;${@llvm_cpu(d)}&quot;<br>
+TARGET_LLVM_FEATURES =3D &quot;${@llvm_features(d)}&quot;<br>
+<br>
+# class-native implies TARGET=3DHOST, and TUNE_FEATURES only describes th=
e real<br>
+# (original) target.<br>
+TARGET_LLVM_FEATURES_class-native =3D &quot;${@&#39;,&#39;.join(llvm_feat=
ures_from_cc_arch(d))}&quot;<br>
+<br>
+def rust_gen_target(d, thing, wd, features, cpu):<br>
+=C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
+=C2=A0 =C2=A0 arch =3D arch_for(d, thing)<br>
+=C2=A0 =C2=A0 sys =3D sys_for(d, thing)<br>
+=C2=A0 =C2=A0 prefix =3D prefix_for(d, thing)<br>
+<br>
+=C2=A0 =C2=A0 features =3D features or d.getVarFlag(&#39;FEATURES&#39;, a=
rch) or &quot;&quot;<br>
+=C2=A0 =C2=A0 features =3D features.strip()<br>
+<br>
+=C2=A0 =C2=A0 # build tspec<br>
+=C2=A0 =C2=A0 tspec =3D {}<br>
+=C2=A0 =C2=A0 tspec[&#39;llvm-target&#39;] =3D d.getVarFlag(&#39;LLVM_TAR=
GET&#39;, arch)<br>
+=C2=A0 =C2=A0 tspec[&#39;data-layout&#39;] =3D d.getVarFlag(&#39;DATA_LAY=
OUT&#39;, arch)<br>
+=C2=A0 =C2=A0 tspec[&#39;max-atomic-width&#39;] =3D int(d.getVarFlag(&#39=
;MAX_ATOMIC_WIDTH&#39;, arch))<br>
+=C2=A0 =C2=A0 tspec[&#39;target-pointer-width&#39;] =3D d.getVarFlag(&#39=
;TARGET_POINTER_WIDTH&#39;, arch)<br>
+=C2=A0 =C2=A0 tspec[&#39;target-c-int-width&#39;] =3D d.getVarFlag(&#39;T=
ARGET_C_INT_WIDTH&#39;, arch)<br>
+=C2=A0 =C2=A0 tspec[&#39;target-endian&#39;] =3D d.getVarFlag(&#39;TARGET=
_ENDIAN&#39;, arch)<br>
+=C2=A0 =C2=A0 tspec[&#39;arch&#39;] =3D arch_to_rust_target_arch(arch)<br=
>
+=C2=A0 =C2=A0 tspec[&#39;os&#39;] =3D &quot;linux&quot;<br>
+=C2=A0 =C2=A0 if &quot;musl&quot; in tspec[&#39;llvm-target&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tspec[&#39;env&#39;] =3D &quot;musl&quot;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tspec[&#39;env&#39;] =3D &quot;gnu&quot;<br>
+=C2=A0 =C2=A0 tspec[&#39;vendor&#39;] =3D &quot;unknown&quot;<br>
+=C2=A0 =C2=A0 tspec[&#39;target-family&#39;] =3D &quot;unix&quot;<br>
+=C2=A0 =C2=A0 tspec[&#39;linker&#39;] =3D &quot;{}{}gcc&quot;.format(d.ge=
tVar(&#39;CCACHE&#39;), prefix)<br>
+=C2=A0 =C2=A0 tspec[&#39;ar&#39;] =3D &quot;{}ar&quot;.format(prefix)<br>
+=C2=A0 =C2=A0 tspec[&#39;cpu&#39;] =3D cpu<br>
+=C2=A0 =C2=A0 if features is not &quot;&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tspec[&#39;features&#39;] =3D features<br>
+=C2=A0 =C2=A0 tspec[&#39;dynamic-linking&#39;] =3D True<br>
+=C2=A0 =C2=A0 tspec[&#39;executables&#39;] =3D True<br>
+=C2=A0 =C2=A0 tspec[&#39;linker-is-gnu&#39;] =3D True<br>
+=C2=A0 =C2=A0 tspec[&#39;linker-flavor&#39;] =3D &quot;gcc&quot;<br>
+=C2=A0 =C2=A0 tspec[&#39;has-rpath&#39;] =3D True<br>
+=C2=A0 =C2=A0 tspec[&#39;has-elf-tls&#39;] =3D True<br>
+=C2=A0 =C2=A0 tspec[&#39;position-independent-executables&#39;] =3D True<=
br>
+=C2=A0 =C2=A0 tspec[&#39;panic-strategy&#39;] =3D d.getVar(&quot;RUST_PAN=
IC_STRATEGY&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # Don&#39;t use jemalloc as it doesn&#39;t work for many ta=
rgets.<br>
+=C2=A0 =C2=A0 # <a href=3D"https://github.com/rust-lang/rust/pull/37392" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/rust/pull=
/37392</a><br>
+=C2=A0 =C2=A0 # From 1.20.0 and forward, system allocator is the default.=
<br>
+=C2=A0 =C2=A0 if LooseVersion(d.getVar(&quot;PV&quot;)) &lt; LooseVersion=
(&quot;1.20.0&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tspec[&#39;exe-allocation-crate&#39;] =3D &qu=
ot;alloc_system&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tspec[&#39;lib-allocation-crate&#39;] =3D &qu=
ot;alloc_system&quot;<br>
+<br>
+=C2=A0 =C2=A0 # write out the target spec json file<br>
+=C2=A0 =C2=A0 with open(wd + sys + &#39;.json&#39;, &#39;w&#39;) as f:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(tspec, f, indent=3D4)<br>
+<br>
+python do_rust_gen_targets () {<br>
+=C2=A0 =C2=A0 wd =3D d.getVar(&#39;WORKDIR&#39;) + &#39;/targets/&#39;<br=
>
+=C2=A0 =C2=A0 rust_gen_target(d, &#39;BUILD&#39;, wd, &quot;&quot;, &quot=
;generic&quot;)<br>
+}<br>
+<br>
+addtask rust_gen_targets after do_patch before do_compile<br>
+do_rust_gen_targets[dirs] +=3D &quot;${WORKDIR}/targets&quot;<br>
+<br>
+do_rust_setup_snapshot () {<br>
+=C2=A0 =C2=A0 for installer in &quot;${WORKDIR}/rust-snapshot-components/=
&quot;*&quot;/install.sh&quot;; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${installer}&quot; --prefix=3D&quot;${W=
ORKDIR}/rust-snapshot&quot; --disable-ldconfig<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 # Some versions of rust (e.g. 1.18.0) tries to find cargo i=
n stage0/bin/cargo<br>
+=C2=A0 =C2=A0 # and fail without it there.<br>
+=C2=A0 =C2=A0 mkdir -p ${RUSTSRC}/build/${BUILD_SYS}<br>
+=C2=A0 =C2=A0 ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_S=
YS}/stage0<br>
+}<br>
+addtask rust_setup_snapshot after do_unpack before do_configure<br>
+do_rust_setup_snapshot[dirs] +=3D &quot;${WORKDIR}/rust-snapshot&quot;<br=
>
+<br>
+<br>
+python do_configure() {<br>
+=C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import configparser<br>
+=C2=A0 =C2=A0 except ImportError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import ConfigParser as configparser<br>
+<br>
+=C2=A0 =C2=A0 # toml is rather similar to standard ini like format except=
 it likes values<br>
+=C2=A0 =C2=A0 # that look more JSON like. So for our purposes simply esca=
ping all values<br>
+=C2=A0 =C2=A0 # as JSON seem to work fine.<br>
+<br>
+=C2=A0 =C2=A0 e =3D lambda s: json.dumps(s)<br>
+<br>
+=C2=A0 =C2=A0 config =3D configparser.RawConfigParser()<br>
+<br>
+=C2=A0 =C2=A0 # [target.ARCH-unknown-linux-gnu]<br>
+=C2=A0 =C2=A0 if( d.getVar(&#39;RUST_TARGET_SYS&#39;, True) !=3D d.getVar=
(&#39;SNAPSHOT_BUILD_SYS&#39;, True)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0target_section =3D &quot;target.{}&quot;.forma=
t(d.getVar(&#39;RUST_TARGET_SYS&#39;, True))<br>
+=C2=A0 =C2=A0 else :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0target_section =3D &quot;target.{}&quot;.forma=
t(d.getVar(&#39;TARGET_SYS&#39;, True))<br>
+<br>
+=C2=A0 =C2=A0 config.add_section(target_section)<br>
+<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;cxx&quot;, e(d.expand(&quo=
t;${RUST_TARGET_CXX}&quot;)))<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;cc&quot;, e(d.expand(&quot=
;${RUST_TARGET_CC}&quot;)))<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;linker&quot;, e(d.expand(&=
quot;${RUST_TARGET_CCLD}&quot;)))<br>
+<br>
+=C2=A0 =C2=A0 # If we don&#39;t do this rust-native will compile it&#39;s=
 own llvm for BUILD.<br>
+=C2=A0 =C2=A0 # [target.${BUILD_ARCH}-unknown-linux-gnu]<br>
+=C2=A0 =C2=A0 target_section =3D &quot;target.{}&quot;.format(d.getVar(&#=
39;SNAPSHOT_BUILD_SYS&#39;, True))<br>
+=C2=A0 =C2=A0 config.add_section(target_section)<br>
+<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;cxx&quot;, e(d.expand(&quo=
t;${RUST_BUILD_CXX}&quot;)))<br>
+=C2=A0 =C2=A0 config.set(target_section, &quot;cc&quot;, e(d.expand(&quot=
;${RUST_BUILD_CC}&quot;)))<br>
+<br>
+=C2=A0 =C2=A0 # [rust]<br>
+=C2=A0 =C2=A0 config.add_section(&quot;rust&quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;rpath&quot;, e(True))<br=
>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;channel&quot;, e(&quot;s=
table&quot;))<br>
+<br>
+=C2=A0 =C2=A0 if LooseVersion(d.getVar(&quot;PV&quot;)) &lt; LooseVersion=
(&quot;1.32.0&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;use-jemall=
oc&quot;, e(False))<br>
+<br>
+=C2=A0 =C2=A0 # Whether or not to optimize the compiler and standard libr=
ary<br>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;optimize&quot;, e(True))=
<br>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 # Emits extraneous output from tests to ensure that failure=
s of the test<br>
+=C2=A0 =C2=A0 # harness are debuggable just from logfiles <br>
+=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;verbose-tests&quot;, e(T=
rue))<br>
+<br>
+=C2=A0 =C2=A0 # [build]<br>
+=C2=A0 =C2=A0 config.add_section(&quot;build&quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;submodules&quot;, e(Fal=
se))<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;docs&quot;, e(False))<b=
r>
+<br>
+=C2=A0 =C2=A0 rustc =3D d.expand(&quot;${WORKDIR}/rust-snapshot/bin/rustc=
&quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;rustc&quot;, e(rustc))<=
br>
+<br>
+=C2=A0 =C2=A0 cargo =3D d.expand(&quot;${WORKDIR}/rust-snapshot/bin/cargo=
&quot;)<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;cargo&quot;, e(cargo))<=
br>
+<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;vendor&quot;, e(True))<=
br>
+<br>
+=C2=A0 =C2=A0 if( d.getVar(&#39;RUST_TARGET_SYS&#39;, True) !=3D d.getVar=
(&#39;SNAPSHOT_BUILD_SYS&#39;, True)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 targets =3D [d.getVar(&quot;RUST_TARGET_SYS&q=
uot;, True)]<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 targets =3D [d.getVar(&quot;TARGET_SYS&quot;,=
 True)]<br>
+<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;target&quot;, e(targets=
))<br>
+<br>
+=C2=A0 =C2=A0 hosts =3D [d.getVar(&quot;SNAPSHOT_BUILD_SYS&quot;, True)]<=
br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;host&quot;, e(hosts))<b=
r>
+<br>
+=C2=A0 =C2=A0 # We can&#39;t use BUILD_SYS since that is something the ru=
st snapshot knows<br>
+=C2=A0 =C2=A0 # nothing about when trying to build some stage0 tools (lik=
e fabricate)<br>
+=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;build&quot;, e(d.getVar=
(&quot;SNAPSHOT_BUILD_SYS&quot;, True)))<br>
+<br>
+=C2=A0 =C2=A0 with open(&quot;config.toml&quot;, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config.write(f)<br>
+<br>
+=C2=A0 =C2=A0 # set up ${WORKDIR}/cargo_home<br>
+=C2=A0 =C2=A0 bb.build.exec_func(&quot;setup_cargo_environment&quot;, d)<=
br>
+}<br>
+<br>
+<br>
+rust_runx () {<br>
+=C2=A0 =C2=A0 echo &quot;COMPILE ${PN}&quot; &quot;$@&quot;<br>
+<br>
+=C2=A0 =C2=A0 # CFLAGS, LDFLAGS, CXXFLAGS, CPPFLAGS are used by rust&#39;=
s build for a<br>
+=C2=A0 =C2=A0 # wide range of targets (not just TARGET). Yocto&#39;s sett=
ings for them will<br>
+=C2=A0 =C2=A0 # be inappropriate, avoid using.<br>
+=C2=A0 =C2=A0 unset CFLAGS<br>
+=C2=A0 =C2=A0 unset LDFLAGS<br>
+=C2=A0 =C2=A0 unset CXXFLAGS<br>
+=C2=A0 =C2=A0 unset CPPFLAGS<br>
+<br>
+=C2=A0 =C2=A0 oe_cargo_fix_env<br>
+<br>
+=C2=A0 =C2=A0 nativepython3 src/bootstrap/bootstrap.py ${@oe.utils.parall=
el_make_argument(d, &#39;-j %d&#39;)} &quot;$@&quot; <br>
+}<br>
+rust_runx[vardepsexclude] +=3D &quot;PARALLEL_MAKE&quot;<br>
+<br>
+do_compile () {=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 if [=C2=A0 &quot;${SNAPSHOT_BUILD_SYS}&quot; =3D &quot;${RU=
ST_TARGET_SYS}&quot; ]<br>
+=C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rust_runx build src/tools/remote-test-server -=
-target &quot;${TARGET_SYS}&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rust_runx build src/tools/remote-test-server -=
-target &quot;${RUST_TARGET_SYS}&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+do_check[dirs] +=3D &quot;${B}&quot;<br>
+do_check[nostamp] =3D &quot;1&quot;<br>
+do_check () {<br>
+=C2=A0 =C2=A0 scp -P 2222 -o StrictHostKeyChecking=3Dno build/${SNAPSHOT_=
BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/<br>
+=C2=A0 =C2=A0 ssh -p 2222 -o StrictHostKeyChecking=3Dno -f <a href=3D"mai=
lto:root@127.0.0.1" target=3D"_blank">root@127.0.0.1</a> &quot;~/remote-tes=
t-server -v remote&quot;<br>
+<br>
+<br>
+=C2=A0 =C2=A0 export TEST_DEVICE_ADDR=3D&quot;<a href=3D"http://127.0.0.1=
:12345" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:12345</a>&quot;<br>
+=C2=A0 =C2=A0 if [=C2=A0 &quot;${SNAPSHOT_BUILD_SYS}&quot; =3D &quot;${RU=
ST_TARGET_SYS}&quot; ]<br>
+=C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rust_runx test --no-fail-fast --bless --target=
 &quot;${TARGET_SYS}&quot; &gt; summary.txt 2&gt; /dev/null<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rust_runx test --no-fail-fast --target &quot;$=
{RUST_TARGET_SYS}&quot; &gt; summary.txt 2&gt; /dev/null<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+}<br>
+addtask do_check after do_compile<br>
+<br>
diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust-test_1.46.0=
.bb" rel=3D"noreferrer" target=3D"_blank">rust-test_1.46.0.bb</a> b/meta/re=
cipes-devtools/rust/<a href=3D"http://rust-test_1.46.0.bb" rel=3D"noreferre=
r" target=3D"_blank">rust-test_1.46.0.bb</a><br>
new file mode 100644<br>
index 0000000000..b724ea5eb0<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rust/<a href=3D"http://rust-test_1.46.0.bb" re=
l=3D"noreferrer" target=3D"_blank">rust-test_1.46.0.bb</a><br>
@@ -0,0 +1,12 @@<br>
+require rust-test.inc<br>
+require rust-source-${PV}.inc<br>
+require rust-snapshot-${PV}.inc<br>
+<br>
+DEPENDS +=3D &quot;rust-llvm (=3D${PV})&quot;<br>
+<br>
+# Otherwise we&#39;ll depend on what we provide<br>
+INHIBIT_DEFAULT_RUST_DEPS_class-native =3D &quot;1&quot;<br>
+# We don&#39;t need to depend on gcc-native because yocto assumes it exis=
ts<br>
+PROVIDES_class-native =3D &quot;virtual/${TARGET_PREFIX}rust&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index dd92a64553..1a21a90add 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -1055,7 +1055,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.info" rel=3D"no=
referrer" target=3D"_blank">logger.info</a>(&quot;Network configuration:%s&=
quot;, netconf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_cmdline_script +=3D netconf<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Port mapping<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostfwd =3D &quot;,hostfwd=3Dtcp::2222-:22,ho=
stfwd=3Dtcp::2323-:23&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostfwd =3D &quot;,hostfwd=3Dtcp::12345-:1234=
5,hostfwd=3Dtcp::2323-:23,hostfwd=3Dtcp::2222-:22&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qb_slirp_opt_default =3D &quot;-netdev u=
ser,id=3Dnet0%s,tftp=3D%s&quot; % (hostfwd, self.get(&#39;DEPLOY_DIR_IMAGE&=
#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qb_slirp_opt =3D self.get(&#39;QB_SLIRP_=
OPT&#39;) or qb_slirp_opt_default<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Figure out the port<br>
@@ -1084,6 +1084,19 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mac +=3D 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if p !=3D p_new:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ports.append=
(p_new)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 temp=3D__file__.s=
plit(os.path.basename(__file__))[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(temp+&q=
uot;../meta/recipes-devtools/rust/rust-test.inc&quot;, &#39;r+&#39;) as f:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tex=
t =3D f.readlines()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tem=
p1=3D[]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for=
 i in text:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 temp =3D re.sub(r&#39;(\S+\s)(-.)(\s\d+)( -o StrictHostKeyCheck=
ing=3Dno .*)&#39;, r&#39;\1\2 &#39;+str(p_new)+&#39;\\4&#39;, i)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 temp1.append(temp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tem=
p2=3D&#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for=
 i in temp1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 temp2=3Dtemp2+i<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.s=
eek(0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.w=
rite(temp2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.t=
runcate()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qb_slirp_opt=
 =3D re.sub(&#39;:%s-&#39; % p, &#39;:%s-&#39; % p_new, qb_slirp_opt)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"h=
ttp://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&qu=
ot;Port forward changed: %s -&gt; %s&quot; % (p, p_new))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac =3D &quot;%s%02x&quot; % (self.mac_s=
lirp, mac)<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ca3c4605bf9b356a--
