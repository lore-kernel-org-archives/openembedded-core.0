Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6587F281
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 15:35:45 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t12so24846135qtp.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3yIxrYwl2x3u6qLue6B1ly+zwLLij9k1YXqteWNkNSU=;
	b=lbVhF9FGlVuTjbiOq/x0F1BmsNP39tG9UE+xWRO2ycp/I8RZQI76cpWFRyU17pQPX9
	AGt7tCJlLGT2aRshjEsifznQrHm6txg18tW7J2yrCO789C1yqVTz54DCoyS7boDSdud8
	YML04c5RzlQ6FLuQLccEREa/GCfgiR0FmRmxlyxLX3hIavnWokVS5Zyjne32CfuTaTXA
	rCMeaTy/qXhItjRa4gxoyJIS+pO7l++2sUMiB2okllNTJC1vaLZhmfGIqzAbVdRwF5Xg
	Ts6sYq4pWAcce30a7dCYXyWqP5FZ37vxlx4feELyZ8o0Lu1fDUP2YIMcCnyVBlcwh+QB
	NBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3yIxrYwl2x3u6qLue6B1ly+zwLLij9k1YXqteWNkNSU=;
	b=TvOPsYfP90y7DTqeHJZZ2DGh4sqe+t3rNFtLj6pTUPpBLZkWXOaj1PUJY2SgQFqTsZ
	8SbnhW0Uis/VmR8+5o6DD/BAvos8mXhqRfncza5vlW5rXcNyli2mlpHcfg0wK3wgpxUy
	HXbILlE9zIDBf9OHQykayw/JQfSYYytoj4AjJDa/fCnez/j+b3Kz98uJ6ab4lbjNAaYu
	fSwGmBjI+Sdh1iKZ7B5W4zvFNljMFQtMm+7L7x76BNVYkbe+c25ZNIwUnupy4gc48LDm
	9bBa7u9oKzOMtLA+XlZA2uy9SAgyvO5AFKLlH7jMcmdmD2ba42WpbbgsEfWRxsJM9gSt
	mOOg==
X-Gm-Message-State: APjAAAU3gOtlyvfSnFbFeadnczjbQa1SLGXz1qQDLhXVR4T9J+y/9qif
	TpnOOEzp40Ma7g7l8UJqbaDiQiLumd1ft8x/DoM=
X-Google-Smtp-Source: APXvYqyH1TTG/ssGTPnsSTsX8fb9R+j7lzCl06YskbLSuBD76ld4cCzuapBeM2OWp5pzdIYejbzjqiqdLXUISUw/158=
X-Received: by 2002:ac8:460d:: with SMTP id p13mr31534591qtn.378.1567611345719;
	Wed, 04 Sep 2019 08:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190903165641.16597-0-nathan@nathanrossi.com>
	<20190903165641.16597-5-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-5-nathan@nathanrossi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Sep 2019 08:35:19 -0700
Message-ID: <CAMKF1sqXzdqonKURbZh9Xkw_f+V1Do_CmzXEatYRY9CLD7TgFA@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 05/12] glibc-testsuite: Create a recipe to implement glibc test suite
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Sep 2019 15:35:45 -0000
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/268225/

so  I guess we need TOOLCHAIN = "gcc" set for this

On Tue, Sep 3, 2019 at 9:57 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> A recipe needs to be created for the test suite due to the dependency
> chain between libgcc -> glibc -> libgcc-initial, and the requirements of
> the test suite to have libgcc for compilation and execution.
>
> The glibc test suite does not use dejagnu like the gcc test suites do.
> Instead a test wrapper script is used along with the assumed dependency
> of having the same filesystem available on build host and target. For
> qemu linux-user the same filesystem is inherently available, for remote
> targets NFS is used. Separate test wrapper scripts are created for qemu
> linux-user or ssh targets, with the same TOOLCHAIN_TEST_* variables used for
> configuration.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
> Changes in v2:
> - Renamed BUILD_TEST_* to TOOLCHAIN_TEST_*
> ---
>  meta/recipes-core/glibc/glibc-testsuite_2.30.bb  | 51 +++++++++++++++++
>  meta/recipes-core/glibc/glibc/check-test-wrapper | 71 ++++++++++++++++++++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc-testsuite_2.30.bb
>  create mode 100644 meta/recipes-core/glibc/glibc/check-test-wrapper
>
> diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
> new file mode 100644
> index 0000000000..88764d9e2b
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
> @@ -0,0 +1,51 @@
> +require glibc_${PV}.bb
> +
> +# handle PN differences
> +FILESEXTRAPATHS_prepend := "${THISDIR}/glibc:"
> +
> +# strip provides
> +PROVIDES = ""
> +# setup depends
> +INHIBIT_DEFAULT_DEPS = ""
> +
> +DEPENDS += "glibc-locale libgcc gcc-runtime"
> +
> +# remove the initial depends
> +DEPENDS_remove = "libgcc-initial"
> +
> +inherit qemu
> +
> +SRC_URI += "file://check-test-wrapper"
> +
> +DEPENDS += "${@'qemu-native' if d.getVar('TOOLCHAIN_TEST_TARGET') == 'user' else ''}"
> +
> +TOOLCHAIN_TEST_TARGET ??= "user"
> +TOOLCHAIN_TEST_HOST ??= "localhost"
> +TOOLCHAIN_TEST_HOST_USER ??= "root"
> +TOOLCHAIN_TEST_HOST_PORT ??= "2222"
> +
> +do_check[dirs] += "${B}"
> +do_check[nostamp] = "1"
> +do_check () {
> +    chmod 0755 ${WORKDIR}/check-test-wrapper
> +
> +    # clean out previous test results
> +    oe_runmake tests-clean
> +    # makefiles don't clean entirely (and also sometimes fails due to too many args)
> +    find ${B} -type f -name "*.out" -delete
> +    find ${B} -type f -name "*.test-result" -delete
> +    find ${B}/catgets -name "*.cat" -delete
> +    find ${B}/conform -name "symlist-*" -delete
> +    [ ! -e ${B}/timezone/testdata ] || rm -rf ${B}/timezone/testdata
> +
> +    oe_runmake -i \
> +        QEMU_SYSROOT="${RECIPE_SYSROOT}" \
> +        QEMU_OPTIONS="${@qemu_target_binary(d)} ${QEMU_OPTIONS}" \
> +        SSH_HOST="${TOOLCHAIN_TEST_HOST}" \
> +        SSH_HOST_USER="${TOOLCHAIN_TEST_HOST_USER}" \
> +        SSH_HOST_PORT="${TOOLCHAIN_TEST_HOST_PORT}" \
> +        test-wrapper="${WORKDIR}/check-test-wrapper ${TOOLCHAIN_TEST_TARGET}" \
> +        check
> +}
> +addtask do_check after do_compile
> +
> diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
> new file mode 100644
> index 0000000000..f8e04e02d2
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
> @@ -0,0 +1,71 @@
> +#!/usr/bin/env python3
> +import sys
> +import os
> +import subprocess
> +
> +env = os.environ.copy()
> +args = sys.argv[1:]
> +targettype = args.pop(0)
> +
> +if targettype == "user":
> +    qemuargs = os.environ.get("QEMU_OPTIONS", "").split()
> +    if not os.path.exists(qemuargs[0]):
> +        # ensure qemu args has a valid absolute path
> +        for i in os.environ.get("PATH", "").split(":"):
> +            if os.path.exists(os.path.join(i, qemuargs[0])):
> +                qemuargs[0] = os.path.join(i, qemuargs[0])
> +                break
> +    sysroot = os.environ.get("QEMU_SYSROOT", None)
> +    if not sysroot:
> +        sys.exit(-1)
> +    libpaths = [sysroot + "/usr/lib", sysroot + "/lib"]
> +
> +    if args[0] == "env":
> +        args.pop(0)
> +        if len(args) == 0:
> +            args = ["env"]
> +        else:
> +            # process options
> +            while args[0].startswith("-"):
> +                opt = args.pop(0).lstrip("-")
> +                if "i" in opt:
> +                    env.clear()
> +            # process environment vars
> +            while "=" in args[0]:
> +                key, val = args.pop(0).split("=", 1)
> +                if key == "LD_LIBRARY_PATH":
> +                    libpaths += val.split(":")
> +                else:
> +                    env[key] = val
> +    if args[0] == "cp":
> +        # ignore copies, the filesystem is the same
> +        sys.exit(0)
> +
> +    qemuargs += ["-L", sysroot]
> +    qemuargs += ["-E", "LD_LIBRARY_PATH={}".format(":".join(libpaths))]
> +    command = qemuargs + args
> +elif targettype == "ssh":
> +    host = os.environ.get("SSH_HOST", None)
> +    user = os.environ.get("SSH_HOST_USER", None)
> +    port = os.environ.get("SSH_HOST_PORT", None)
> +
> +    command = ["ssh", "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no"]
> +    if port:
> +        command += ["-p", str(port)]
> +    if not host:
> +        sys.exit(-1)
> +    command += ["{}@{}".format(user, host) if user else host]
> +
> +    # wrap and replace quotes for correct transformation on ssh
> +    wrapped = " ".join(["'{0}'".format(i.replace("'", r"'\''")) for i in ["cd", os.getcwd()]]) + "; "
> +    wrapped += " ".join(["'{0}'".format(i.replace("'", r"'\''")) for i in args])
> +    command += ["sh", "-c", "\"{}\"".format(wrapped)]
> +else:
> +    sys.exit(-1)
> +
> +try:
> +    r = subprocess.run(command, timeout = 1800, env = env)
> +    sys.exit(r.returncode)
> +except subprocess.TimeoutExpired:
> +    sys.exit(-1)
> +
> ---
> 2.23.0.rc1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

