Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7DACA7D537
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:57:29 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y72so3565405pfb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=SVO+LkpLW8witpNbXQJvHd0RryZdGBGLE83jA+teS/Q=;
	b=fCb9FZhzXm/G3bvSGfMdwQOschIL49wZt01oMOTJdIXdBEq3ic+Ep4TZUmNV37TruD
	I0Rbl059I5/dfZjC5MSsmaZS7qRDVLYl1TISr4Qloo5JfYrjyQlJ0OQLE35I+4t9Kx1I
	KVi4AuBWN9C5an2jtVn8JKSxRjU7fPnAguRwPHS7BB+lkSLGN+2A8VCfdoPP2Pxt70S+
	fo2mMCeJzuVn+qMM6VlTm50kPSLgie2TE0HjkcUtWrtZ69E1EEUM0TLjiuWvnP33RwjM
	BU/ZIKWfae3P6Dz9tQ6/+lvB7uZBeCs/Yt1Sr8q2C2ndh69vv3lz72fngtDvLP4UAfDM
	+LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=SVO+LkpLW8witpNbXQJvHd0RryZdGBGLE83jA+teS/Q=;
	b=h1WVriQnzCoh5HROmV8zc3ii5caZn7N0npHWFGe9WTXwBrmc72yHO1hgtMIFnw8eqc
	olgHCrrcgXvZ+Bm3r4WQl2mm/qFbH9JFBRwmMEukPsvlP2rAa+yJcnkFgvwB9mESg1mx
	9/VJWLHoVL4toGiOZ+GHORqsgiZYn8e2qP2j7EowOu0X2nCLGn5tvlfgo2vvu/9pTdbF
	G7H6un649OdZ/CoPgO6DfDhS1YFQIc4AXXploMBQ5pT/UaeG50FI7O6FigsjvF5+O8Kv
	5hVl7/odlBYy/IC8j2M5VuR4gL1rAjq51kRfFQXrJlfoD+Ik4mc69gDGfg/iZ/2TZW30
	qsaw==
X-Gm-Message-State: APjAAAULeaBJH9vlsIQyk7M5VchwllzxWbNaC00UNIa5r6MQDazJciwz
	D5LNuz3IUw5R5toJ1c+K67bwOH0U0rHBdw==
X-Google-Smtp-Source: APXvYqznhrwOyBB1EYrCKJlC+rVa0qkZZjGuOFxQsIOLG/d6G9lNQTxZsTzIN5GxLe0CGKDEkJBeuA==
X-Received: by 2002:a63:b102:: with SMTP id r2mr30623273pgf.370.1567529850180; 
	Tue, 03 Sep 2019 09:57:30 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	s76sm18055923pgc.92.2019.09.03.09.57.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:57:29 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-3-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 03/12] gcc-runtime: Add do_check task for executing gcc test suites
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
X-List-Received-Date: Tue, 03 Sep 2019 16:57:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add a do_check task to implement execution of the gcc component test
suites. The component test suites require execution of compiled programs
on the target.

The implementation provided allows for execution testing against a host
via SSH or within the local build environment using qemu linux-user
execution. The selection of execution is done via the
TOOLCHAIN_TEST_TARGET variable, and configuration of the remote host is
done with the TOOLCHAIN_TEST_HOST, TOOLCHAIN_TEST_HOST_USER and
TOOLCHAIN_TEST_HOST_PORT variables.

By default the do_check task will execute all check targets, this can be
changed by setting MAKE_CHECK_TARGETS to the desired test suite target
(e.g. check-gcc or check-target-libatomic).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Dropped gcc-cross changes, all execution from gcc-runtime. Resolves
  potential issues with -cross depending on target libraries/etc.
- Due to merge, running gcc and g++ test suites separately is no longer
  supported through MAKE_CHECK_TARGETS.
- Changed BUILD_TEST_ to TOOLCHAIN_TEST_
- Added workaround for issue with configargs.h being modified by
  builddir extraction which causes issues with plugins.
---
 meta/recipes-devtools/gcc/gcc-runtime.inc   |  42 +++++++++++
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 106 ++++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-testsuite.inc

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 22c1d78dd1..2da3c02ef0 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -277,3 +277,45 @@ FILES_libitm-dev = "\
 SUMMARY_libitm-dev = "GNU transactional memory support library - development files"
 FILES_libitm-staticdev = "${libdir}/libitm.a"
 SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
+
+require gcc-testsuite.inc
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+
+MAKE_CHECK_TARGETS ??= "check-gcc ${@" ".join("check-target-" + i for i in d.getVar("RUNTIMETARGET").split())}"
+# prettyprinters and xmethods require gdb tooling
+MAKE_CHECK_IGNORE ??= "prettyprinters.exp xmethods.exp"
+MAKE_CHECK_RUNTESTFLAGS ??= "${MAKE_CHECK_BOARDARGS} --ignore '${MAKE_CHECK_IGNORE}'"
+
+# specific host and target dependencies required for test suite running
+do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
+do_check[depends] += "virtual/libc:do_populate_sysroot"
+# only depend on qemu if targeting linux user execution
+do_check[depends] += "${@'qemu-native:do_populate_sysroot' if "user" in d.getVar('TOOLCHAIN_TEST_TARGET') else ''}"
+# extend the recipe sysroot to include the built libraries (for qemu usermode)
+do_check[prefuncs] += "extend_recipe_sysroot"
+do_check[prefuncs] += "check_prepare"
+do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
+do_check[nostamp] = "1"
+do_check() {
+    export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
+
+    # HACK: this works around the configure setting CXX with -nostd* args
+    sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
+    # HACK: this works around the de-stashing changes to configargs.h, as well as recipe-sysroot changing the content
+    sed -i '/static const char configuration_arguments/d' ${B}/gcc/configargs.h
+    ${CC} -v 2>&1 | grep "^Configured with:" | \
+        sed 's/Configured with: \(.*\)/static const char configuration_arguments[] = "\1";/g' >> ${B}/gcc/configargs.h
+
+    if [ "${TOOLCHAIN_TEST_TARGET}" = "user" ]; then
+        # qemu user has issues allocating large amounts of memory
+        export G_SLICE=always-malloc
+        # no test should need more that 10G of memory, this prevents tests like pthread7-rope from leaking memory
+        ulimit -m 4194304
+        ulimit -v 10485760
+    fi
+
+    oe_runmake -i ${MAKE_CHECK_TARGETS} RUNTESTFLAGS="${MAKE_CHECK_RUNTESTFLAGS}"
+}
+addtask check after do_compile do_populate_sysroot
+
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
new file mode 100644
index 0000000000..b383a358d8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -0,0 +1,106 @@
+inherit qemu
+
+TOOLCHAIN_TEST_TARGET ??= "user"
+TOOLCHAIN_TEST_HOST ??= "localhost"
+TOOLCHAIN_TEST_HOST_USER ??= "root"
+TOOLCHAIN_TEST_HOST_PORT ??= "2222"
+
+MAKE_CHECK_BOARDFLAGS ??= ""
+MAKE_CHECK_BOARDARGS ??= "--target_board=${TOOLCHAIN_TEST_TARGET}${MAKE_CHECK_BOARDFLAGS}"
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
+        content.append("set_board_info hostname {0}".format(d.getVar("TOOLCHAIN_TEST_HOST")))
+        content.append("set_board_info username {0}".format(d.getVar("TOOLCHAIN_TEST_HOST_USER")))
+
+        port = d.getVar("TOOLCHAIN_TEST_HOST_PORT")
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

