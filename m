Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419A2C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 09:52:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.8555.1645264335436355522
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 01:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Foh066XO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so10269820wme.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 01:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uMe25ng/bi5Jo/F72an+cDKey02nY7N4e5v2/1hc8Ck=;
        b=Foh066XOVzZ4cvqp5MP59IxzVWIJcHGkr+VYzqQBowHHaxIhKW1ujYwm9Sx+mEFCdl
         UIPHCRV2eM0xUSHShPwujEUI51wKqPXEA1udf/5T+ahWIcvzNDpR6UenO1UOdm/K4pic
         At53VagPChSslYTTbWp5U4N8oh+ZyGlQlOFOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uMe25ng/bi5Jo/F72an+cDKey02nY7N4e5v2/1hc8Ck=;
        b=pytGm41zqk25O+kGKMyGodDkP5XXw+wI6U9STjwFxfCvF7CFgCfisggn0C7ruhjyAu
         CRkAIUzX/5suh3VHnnsw/0zxKG/2Ta7iyhz/thSLvEnXyNLj9PsXJaFtFwOrgiofXDM/
         8aJGD5r07gs0SlotYLOuc6DYEbak3Sciy7RDCj+c7zL7BEypvpCS/+eckVQs9xY0wL/E
         w+aKTOGA44yvLZYP9zaK1HkmXTzAAy65C2Rnlx5AR7TDjoJYrMqth5xcOoBafx2ZxGwI
         0umY8HArpZniDu3MiM5kdVW0v87FnX5oIa2Xz1oA1QFKXCwTp9ODHI7Ni/LQ6b6+vtL7
         Lu/w==
X-Gm-Message-State: AOAM532eBCDv0iJ/hP0zx6+HLYfa5f9yXY+4XAjJdFxEJPLSX2Rk1rBa
	ZmoMC9MfgopJqrlsOKDbpNm5HA==
X-Google-Smtp-Source: 
 ABdhPJyp19AXD7pcUIzr32eA10R7w/o4TYUWvGn9IFufYDfQ5XGSfd/M03qKVMWYiS17OxTdv5srgA==
X-Received: by 2002:a05:600c:4783:b0:37f:1546:40d3 with SMTP id
 k3-20020a05600c478300b0037f154640d3mr1457857wmo.75.1645264333379;
        Sat, 19 Feb 2022 01:52:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bf04:d486:cfa0:deab?
 ([2001:8b0:aba:5f3c:bf04:d486:cfa0:deab])
        by smtp.gmail.com with ESMTPSA id
 v9sm1976081wrx.27.2022.02.19.01.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 01:52:12 -0800 (PST)
Message-ID: 
 <704c8ad858ef74120a2223744141ef697132616d.camel@linuxfoundation.org>
Subject: Re: [honister][PATCH V3] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, vinay.m.engg@gmail.com, alex.kanavin@gmail.com
Date: Sat, 19 Feb 2022 09:52:09 +0000
In-Reply-To: <20220219080636.119901-1-pgowda.cve@gmail.com>
References: <20220219080636.119901-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 09:52:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161961

Hi,

On Sat, 2022-02-19 at 00:06 -0800, pgowda wrote:
> The patch implements Oe-selftest framework for Rust test.
> Some of the functions are as follows:-
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemutarget image.
> 
> The python file builds remote-test-server and executes rust testing
> remotely using background ssh. It adds the necessary test environment
> and variables to run the rust oe-selftest.
> Print the results in case of failure of runCmd().
> 
> The patch has been run and tested on X86 and X86_64 targets on
> Ubuntu-18 successfully.
> 
> There is an issue of loading libserde for master branch rust-1.58.1
> sources as follows:-
> "command did not execute successfully: oe-selftest/build-st/tmp/work
> /core2-64-poky-linux/rust-testsuite/1.58.1-r0/rustc-1.58.1-src/build/
> x86_64-unknown-linux-gnu/stage0-tools-bin/remote-test-client" "push"
> "oe-selftest/build-st/tmp/work/core2-64-poky-linux/rust-testsuite/
> 1.58.1-r0/rustc-1.58.1-src/build/x86_64-unknown-linux-gnu/stage1/lib/
> rustlib/x86_64-unknown-linux-gnu/lib/libserde_derive-804e1d2731595192.so"
> 
> thread 'main' panicked at 'io::copy(&mut file, dst) failed with
> Connection reset by peer (os error 104)',
> src/tools/remote-test-client/src/main.rs:353:5
> 
> The patch will be posted for master branch after fixing the issue.
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>

This looks interesting and is improving, thanks. I haven't done a full review on
it but as I glanced through it, I had some questions. See inline below.

> ---
>  meta/lib/oeqa/selftest/cases/rust.py          |  53 ++
>  meta/recipes-devtools/rust/rust-testsuite.inc | 170 ++++
>  .../rust-testsuite/rust-oe-selftest.patch     | 872 ++++++++++++++++++
>  .../rust/rust-testsuite_1.54.0.bb             |   3 +
>  4 files changed, 1098 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
> 
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
> new file mode 100644
> index 0000000000..ad28f7ab26
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +import subprocess
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, Command
> +from oeqa.utils.sshcontrol import SSHControl
> +
> +# Total time taken for testing is of about 2hr 20min, with PARALLEL_MAKE set to 40 number of jobs.
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +	def run_check_emulated(self, *args, **kwargs):
> +		# build remote-test-server before image build
> +		recipe = "rust-testsuite"
> +		bitbake("{} -c compile".format(recipe))
> +		builddir = get_bb_var("B", "rust-testsuite")
> +		# build core-image-minimal with required packages
> +		default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
> +		features = []
> +		features.append('IMAGE_FEATURES += "ssh-server-openssh"')
> +		features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
> +		self.write_config("\n".join(features))
> +		bitbake("core-image-minimal")
> +		# wrap the execution with a qemu instance
> +		with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 512") as qemu:
> +			# Copy remote-test-server to image through scp
> +			ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user="root")
> +			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-server","~/")
> +			# Execute remote-test-server on image through background ssh
> +			command = '~/remote-test-server -v remote'
> +			sshrun=subprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=/dev/null', '-o',  'StrictHostKeyChecking=no', '-f', "root@%s" % qemu.ip, command),
> +                                shell=False,
> +                                stdout=subprocess.PIPE,
> +                                stderr=subprocess.PIPE)
> +			# Get the values of variables.
> +			targetsys = get_bb_var("TARGET_SYS", "rust-testsuite")
> +			rustlibpath = get_bb_var("STAGING_LIBDIR_NATIVE", "rust-testsuite")
> +			tmpdir = get_bb_var("TMPDIR", "rust-testsuite")
> +			testargs = "--exclude compiler/rustc --exclude compiler/rustc_apfloat --exclude compiler/rustc_serialize --exclude src/tools/tidy --exclude src/tools/compiletest --no-fail-fast --bless"

Why do we patch some tests out but exclude others here? What is the difference?

> +			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
> +			cmd = " export PATH=%s/../bin:$PATH;" % rustlibpath
> +			cmd = cmd + " export PATH=%s/../bin/%s:%s/hosttools:$PATH;" % (rustlibpath, targetsys, tmpdir)
> +			cmd = cmd + " export RUST_TARGET_PATH=%s/rustlib;" % rustlibpath
> +			# Trigger testing.
> +			cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
> +			cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py -j 40 test %s --target %s ;" % (builddir, testargs, targetsys)

What does 40 mean here?

> +			result = runCmd(cmd)
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +	def test_rust(self):
> +		self.run_check_emulated("rust")
> diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
> new file mode 100644
> index 0000000000..8a6698a8e2
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite.inc
> @@ -0,0 +1,170 @@
> +SUMMARY = "Rust testing"
> +HOMEPAGE = "https://rustc-dev-guide.rust-lang.org/tests/intro.html"
> +SECTION = "test"
> +LICENSE = "MIT | Apache-2.0"
> +
> +SRC_URI += "file://rust-oe-selftest.patch;striplevel=1"
> +
> +inherit rust
> +inherit cargo_common
> +
> +DEPENDS += "file-native python3-native"

python3-native is normally through an inherit python3native so this could mean
you're not using it?

> +EXCLUDE_FROM_WORLD = "1"
> +
> +S = "${RUSTSRC}"
> +
> +# Path of target specification file "target-poky-linux.json"
> +export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
> +
> +export FORCE_CRATE_HASH="${BB_TASKHASH}"
> +
> +# We don't want to use bitbakes vendoring because the rust sources do their
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
> +    # Later stages are build for the native target (i.e. target.x86_64-linux)
> +    cargo_common_do_configure
> +
> +    printf '[target.%s]\n' "${SNAPSHOT_BUILD_SYS}" >> ${CARGO_HOME}/config
> +    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
> +}
> +
> +include rust-common.inc
> +
> +do_rust_setup_snapshot () {
> +    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
> +        "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
> +    done
> +
> +    # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
> +    # and fail without it there.
> +    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
> +    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0

We're quite past 1.18.0 now so is that still needed?

> +
> +    # Need to use uninative's loader if enabled/present since the library paths
> +    # are used internally by rust and result in symbol mismatches if we don't
> +    if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
> +        for bin in cargo rustc rustdoc; do
> +            patchelf-uninative ${WORKDIR}/rust-snapshot/bin/$bin --set-interpreter ${UNINATIVE_LOADER}
> +        done
> +    fi
> +}
> +addtask rust_setup_snapshot after do_unpack before do_configure
> +do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
> +
> +python do_configure() {
> +    import json
> +    from distutils.version import LooseVersion

We've just removed most LooseVersion references from OE-Core since disutils is
deprecated. You can use bb.utils functions instead, like here:

https://git.yoctoproject.org/poky/commit/?id=f0627490711f29f0e308a0afc4fc4f8e54f58dec


> +    try:
> +        import configparser
> +    except ImportError:
> +        import ConfigParser as configparser

We don't need/want python 2 support here?

> +
> +    # toml is rather similar to standard ini like format except it likes values
> +    # that look more JSON like. So for our purposes simply escaping all values
> +    # as JSON seem to work fine.
> +
> +    e = lambda s: json.dumps(s)
> +
> +    config = configparser.RawConfigParser()
> +
> +    # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.ARCH-poky-linux]
> +    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
> +    config.add_section(target_section)
> +
> +    # Points to wrapper files which contain target specific compiler and linker commands.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> +    config.set(target_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")))
> +
> +    # If we don't do this rust-native will compile it's own llvm for BUILD.
> +    # [target.${BUILD_ARCH}-unknown-linux-gnu]
> +    target_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
> +    config.add_section(target_section)
> +
> +    # Wrapper scripts of build system.
> +    config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
> +    config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> +
> +    # [llvm]
> +    config.add_section("llvm")
> +    config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
> +    config.set("llvm", "ninja", e(False))
> +
> +    # [rust]
> +    config.add_section("rust")
> +    config.set("rust", "rpath", e(True))
> +    config.set("rust", "channel", e("stable"))
> +
> +    if LooseVersion(d.getVar("PV")) < LooseVersion("1.32.0"):
> +        config.set("rust", "use-jemalloc", e(False))

We're now a much later version of rust so do we need to support 1.32? That could
solve the LooseVersion problem too!

> +
> +    # Whether or not to optimize the compiler and standard library
> +    config.set("rust", "optimize", e(True))
> +
> +    # Emits extraneous output from tests to ensure that failures of the test
> +    # harness are debuggable just from logfiles
> +    config.set("rust", "verbose-tests", e(True))
> +
> +    # Override default linker cc.
> +    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))
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
> +    targets = [d.getVar("TARGET_SYS", True)]
> +    config.set("build", "target", e(targets))
> +
> +    hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
> +    config.set("build", "host", e(hosts))
> +
> +    # We can't use BUILD_SYS since that is something the rust snapshot knows
> +    # nothing about when trying to build some stage0 tools (like fabricate)
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
> +    # wide range of targets (not just TARGET). Yocto's settings for them will

s/Yocto/OE/

> +    # be inappropriate, avoid using.
> +    unset CFLAGS
> +    unset LDFLAGS
> +    unset CXXFLAGS
> +    unset CPPFLAGS
> +
> +    oe_cargo_fix_env
> +
> +    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
> +}
> +rust_runx[vardepsexclude] += "PARALLEL_MAKE"

PARALLEL_MAKE isn't used above so I doubt this is needed now? (I realise the
oe.utils function uses it)

> +
> +do_compile () {
> +
> +    rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
> +}



