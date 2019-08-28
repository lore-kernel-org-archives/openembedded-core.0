Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 64CD87ED3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:06:51 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id i18so727376pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=9FMwt6gg0quj+vnAN9lGdglhBObkXHAwUIaYNtoeALM=;
	b=fClXnVkyuvFc9j6JqdI09EpNgsVbNW3MFojDO2lGxCjAjVeXSkTmftKv3Ll7eyKu/v
	JglnLWgYjcOuZiHk+kMFDvND3lBjtKpysFdDfBgnNZHD3QllRGPv28bGYUk2XVywVIJR
	4vBz92PFzSGDlmJvb8+VJaharhPyht15a4zS0oor+ZI9vy1qCMjSQw2KlxhdeYvpM3tK
	t1TWKfV89TUn+JdEnxYJ+hpvKU41EiTszZLCTU94PJaqrJwmut38uRw9g1qZ3sC31ssF
	8HM8oUBvDofA3xhPZxQjkPUxjjRibvBACd8Y0Of2Udasq1ok1Io3NQWxk2WmAR76jcBt
	iJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=9FMwt6gg0quj+vnAN9lGdglhBObkXHAwUIaYNtoeALM=;
	b=IxT4AgwEVoQ6DJyQoArprvHFhEeGO1HWAht2TgYogVte5jkJK3JWCdn60r20DNwpwL
	PRIimn616GfcxHoo5hOflM2xqhfdMesUaovL0hlkYyfstp8mj/OlG61gZsJjPShK7hAv
	2SnOggpG2A7dwftuDV2HMbtgQvEX7450cAIfBS70t2c9WNCZ83tK5zn0OPhEgd374HzD
	VeRm68SouER1ZmyhqE7sA3OmxLujykz80Smw3XiBJM5SkdrjzdrsHlh88SGTEMXBlZmN
	RrnKGr/M19f73TXqIUmdJITvG60cQX7aJLHf/FYrYGXLC23RXJivtuTplqe0NTG/r+7G
	Y4NA==
X-Gm-Message-State: APjAAAVGvPFbEa+ArQm4F7JgEQjpWNkbFQHtCpj9jW/BwCVXGSG0lcTi
	Dytp8C6uq1Z5TXCUHT9XlnxfDg==
X-Google-Smtp-Source: APXvYqxbmUe0AAgqb4ukDB711hblxMErTkI0cZ7oEUSSQGVlg3PM9rL9j2qUh1DPTHmprB5OAjilIQ==
X-Received: by 2002:a17:90a:a40f:: with SMTP id
	y15mr2282147pjp.69.1566968812390; 
	Tue, 27 Aug 2019 22:06:52 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	x10sm833972pjo.4.2019.08.27.22.06.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:06:51 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-2-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/11] gcc-cross: Add do_check task for executing gcc test suite
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
X-List-Received-Date: Wed, 28 Aug 2019 05:06:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add a do_check task and supporting configuration to implement execution
of the gcc compiler test suite. The test suite requires execution of
compiled programs.

The implementation provided allows for execution testing against a host
via SSH or within the local build environment using qemu linux-user
execution. The selection of execution is done via the BUILD_TEST_TARGET
variable, and configuration of the remote host is done with the
BUILD_TEST_HOST, BUILD_TEST_HOST_USER and BUILD_TEST_HOST_PORT
variables.

By default the do_check task will execute all check targets, this can be
changed by setting MAKE_CHECK_TARGETS to the desired test suite target
(e.g. check-gcc or check-g++).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc     |  41 +++++++++++
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 106 ++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-testsuite.inc

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 6222c2e8c9..f9534340d2 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -221,3 +221,44 @@ python do_gcc_stash_builddir_setscene () {
     sstate_setscene(d)
 }
 addtask do_gcc_stash_builddir_setscene
+
+require gcc-testsuite.inc
+
+check_prepare_sysroot () {
+    if [ ! -s ${RECIPE_SYSROOT}${target_includedir}/limits.h ]; then
+        # this file was created by the configure task, but is replaced by the
+        # libc version when populating the sysroot for the do_check task
+        rm ${RECIPE_SYSROOT}${target_includedir}/limits.h
+    fi
+}
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+
+MAKE_CHECK_TARGETS ??= "check-gcc check-g++ check-lto"
+
+python () {
+    # crosssdk deps have different virtual targets
+    if bb.data.inherits_class('crosssdk', d):
+        d.appendVarFlag("do_check", "depends", " virtual/nativesdk-${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
+    else:
+        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
+}
+
+# specific host and target dependencies required for test suite running
+do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
+do_check[depends] += "virtual/libc:do_populate_sysroot"
+# only depend on qemu if targeting linux user execution
+do_check[depends] += "${@'qemu-native:do_populate_sysroot' if "user" in d.getVar('BUILD_TEST_TARGET') else ''}"
+# check_prepare_sysroot is before extend in order to perform the limits.h removal
+do_check[prefuncs] += "check_prepare_sysroot"
+do_check[prefuncs] += "extend_recipe_sysroot"
+do_check[prefuncs] += "check_prepare"
+do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
+do_check[nostamp] = "1"
+do_check() {
+    export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
+
+    oe_runmake -i -C ${B}/gcc ${MAKE_CHECK_TARGETS} RUNTESTFLAGS="${MAKE_CHECK_BOARDARGS}"
+}
+addtask check after do_compile do_populate_sysroot
+
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
new file mode 100644
index 0000000000..f9924f2d86
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -0,0 +1,106 @@
+inherit qemu
+
+BUILD_TEST_TARGET ??= "user"
+BUILD_TEST_HOST ??= "localhost"
+BUILD_TEST_HOST_USER ??= "root"
+BUILD_TEST_HOST_PORT ??= "2222"
+
+MAKE_CHECK_BOARDFLAGS ??= ""
+MAKE_CHECK_BOARDARGS ??= "--target_board=${BUILD_TEST_TARGET}${MAKE_CHECK_BOARDFLAGS}"
+
+python () {
+    # Provide the targets compiler args via targets options. This allows dejagnu to
+    # correctly mark incompatible tests as UNSUPPORTED (e.g. needs soft-float
+    # but running on hard-float target).
+    #
+    # These options are called "multilib_flags" within the gcc test suite. Most
+    # architectures handle these options in a sensible way such that tests that
+    # are incompatible with the provided multilib are marked as UNSUPPORTED.
+    #
+    # Note: multilib flags are added to the compile command after the args
+    # provided by any test (through dg-options), CFLAGS_FOR_TARGET is always
+    # added to the compile command before any other args but is not interpted
+    # as options like multilib flags.
+    #
+    # i686, x86-64 and aarch64 are special, since most toolchains built for
+    # these targets don't do multilib the tests do not get correctly marked as
+    # UNSUPPORTED. More importantly the test suite itself does not handle
+    # overriding the multilib flags where it could (like other archs do). As
+    # such do not pass the target compiler args for these targets.
+    args = d.getVar("TUNE_CCARGS").split()
+    if d.getVar("TUNE_ARCH") in ["i686", "x86_64", "aarch64"]:
+        args = []
+    d.setVar("MAKE_CHECK_BOARDFLAGS", ("/" + "/".join(args)) if len(args) != 0 else "")
+}
+
+python check_prepare() {
+    def generate_qemu_linux_user_config(d):
+        content = []
+        content.append('load_generic_config "sim"')
+        content.append('load_base_board_description "basic-sim"')
+        content.append('process_multilib_options ""')
+
+        # qemu args
+        qemu_binary = qemu_target_binary(d)
+        if not qemu_binary:
+            bb.fatal("Missing target qemu linux-user binary")
+
+        args = []
+        # QEMU_OPTIONS is not always valid due to -cross recipe
+        args += ["-r", d.getVar("OLDEST_KERNEL")]
+        # enable all valid instructions, since the test suite itself does not
+        # limit itself to the target cpu options.
+        #   - valid for x86*, powerpc, arm, arm64
+        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "ppc", "arm", "aarch64"]:
+            args += ["-cpu", "max"]
+
+        sysroot = d.getVar("RECIPE_SYSROOT")
+        args += ["-L", sysroot]
+        # lib paths are static here instead of using $libdir since this is used by a -cross recipe
+        libpaths = [sysroot + "/usr/lib", sysroot + "/lib"]
+        args += ["-E", "LD_LIBRARY_PATH={0}".format(":".join(libpaths))]
+
+        content.append('set_board_info is_simulator 1')
+        content.append('set_board_info sim "{0}"'.format(qemu_binary))
+        content.append('set_board_info sim,options "{0}"'.format(" ".join(args)))
+
+        # target build/test config
+        content.append('set_board_info target_install {%s}' % d.getVar("TARGET_SYS"))
+        content.append('set_board_info ldscript ""')
+        #content.append('set_board_info needs_status_wrapper 1') # qemu-linux-user return codes work, and abort works fine
+        content.append('set_board_info gcc,stack_size 16834')
+        content.append('set_board_info gdb,nosignals 1')
+        content.append('set_board_info gcc,timeout 60')
+
+        return "\n".join(content)
+
+    def generate_remote_ssh_linux_config(d):
+        content = []
+        content.append('load_generic_config "unix"')
+        content.append("set_board_info hostname {0}".format(d.getVar("BUILD_TEST_HOST")))
+        content.append("set_board_info username {0}".format(d.getVar("BUILD_TEST_HOST_USER")))
+
+        port = d.getVar("BUILD_TEST_HOST_PORT")
+        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
+        content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
+
+        return "\n".join(content)
+
+    dejagnudir = d.expand("${WORKDIR}/dejagnu")
+    if not os.path.isdir(dejagnudir):
+        os.makedirs(dejagnudir)
+
+    # write out target qemu board config
+    with open(os.path.join(dejagnudir, "user.exp"), "w") as f:
+        f.write(generate_qemu_linux_user_config(d))
+
+    # write out target ssh board config
+    with open(os.path.join(dejagnudir, "ssh.exp"), "w") as f:
+        f.write(generate_remote_ssh_linux_config(d))
+
+    # generate site.exp to provide boards
+    with open(os.path.join(dejagnudir, "site.exp"), "w") as f:
+        f.write("lappend boards_dir {0}\n".format(dejagnudir))
+        f.write("set CFLAGS_FOR_TARGET \"{0}\"\n".format(d.getVar("TOOLCHAIN_OPTIONS")))
+}
+
---
2.23.0.rc1

