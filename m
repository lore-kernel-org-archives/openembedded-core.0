Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C04CD7F2D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:57:18 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y9so11153450pfl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=x7/+LFmKnNBMDFPiqKD/xj/385RP+HuBsFzlB7glQjk=;
	b=F/d1Qp8VHUDqX48kTcD7o+cX5HPt7vD5v1XEmeB4LdGXtZWoOMK8QhpoTes7XxA+u1
	1MuD6pNJu0WzO9q39TJa0cBZMmeEuQEunsb0dqIfQfrthAoMbWIGlN90ahv4+meNn1xv
	zLXmPgVFCoPf/36czW5IRlDcTwDg3v4WsEBzG1gvxVXtg0z76ITrbBt44gHfviAqpJNd
	F7dlHO2Hi4hWZreucSVzcQmPuvYc5oks0/Ew6o+n25Xxsmc9NlYg5tVJGNW9sq8WIBu9
	dWweXlgOkEb7Ne9Af9ihXbQyM8StwHYju60v0Q68i/1uJ3yhVdmOGKY0HzDsE1q6H0dE
	BYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=x7/+LFmKnNBMDFPiqKD/xj/385RP+HuBsFzlB7glQjk=;
	b=m2nTOXnbnHFDG+pNkZSLfHnj9E6DQgQv36WE0tHyy+RUvA1NQWXS/Z/QWrZcFqMx5k
	iC3TN5Z079kh7iyj3vRA52bpaUpwXhpqmXT6amKWZEIe58EpgJmpqNCyjuYg6prMX2rK
	MWvPqty6rK2Qqy/at9geqSG//ssLmKxN7GGBIAwxJR1yxmHh6/MCDGZKkUkx9U7c6r/2
	spuUTtRq9WRHGxrY5GsycRAxbz1m5shC4vkVgt6nTiXgXuMAEIgB8cGOMf9bZKwTbDiC
	s4xnpMW96zBQ/aCmR5JRGcWx+PFtncTQd4F1hBsJTFF2Xf2z6qop/kM0dt4C3zu+ukzB
	miNA==
X-Gm-Message-State: APjAAAXZMLPpGl1kJzPWqoOl+Ym7d636HOnbs9xS5sjQ3QwmadKzwGaL
	5//rv5xqQWR8RoqNqsUpFh4OmQjeZIKF1g==
X-Google-Smtp-Source: APXvYqzlU5/hjhuYYArOrO61k4hFuGBTk2uPVeXyVkLwg7OLxHyIn13zc42ww5AtcUKzhtY0LzpjgA==
X-Received: by 2002:a62:2c54:: with SMTP id s81mr31029967pfs.179.1567529839341;
	Tue, 03 Sep 2019 09:57:19 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	r187sm11486921pfc.105.2019.09.03.09.57.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:57:18 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-2-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 02/12] binutils-cross-testsuite: Create recipe for test suite execution
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
X-List-Received-Date: Tue, 03 Sep 2019 16:57:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Create the do_check task in a new recipe 'binutils-cross-testsuite'.
This recipe is built within a target recipe (not -cross) to ensure
correct testing against target specific libraries/etc. The do_check task
is used to execute the binutils test suite for the cross target
binutils. By default this executes tests for binutils, gas and ld. This
can however be changed by setting CHECK_TARGETS to the desired test
suite target (e.g. 'gas').

The binutils test suites do not require any target execution, as such
the check task can be run without QEMU or a target device. However
since the binutils tests do rely on a C compiler there is dependence on
both gcc and libc in order to run the tests.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Moved implementation of do_check from binutils-cross to
  binutils-cross-testsuite. This is to fix issues with target dependency
  from a cross recipe.
- Execute dejagnu directly instead of running via make
- Drop support for executing the gold and libiberty testsuites, the gold
  suite was not executing correctly and the -cross variant of libiberty
  is not used by target or -native
- No longer dependent on build directory tools, using as,ld,* from
  sysroot
- (mips64) Hack/workaround gas defaulting to n32 despite ld defaulting
  to 64
---
 .../binutils/binutils-cross-testsuite_2.32.bb      | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb

diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb
new file mode 100644
index 0000000000..e62e64e8ae
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb
@@ -0,0 +1,83 @@
+require binutils.inc
+require binutils-${PV}.inc
+
+BPN = "binutils"
+
+DEPENDS += "dejagnu-native expect-native"
+DEPENDS += "binutils-native"
+
+deltask do_compile
+deltask do_install
+
+do_configure[dirs] += "${B}/ld ${B}/bfd"
+do_configure() {
+    # create config.h, oe enables initfini-array by default
+    echo "#define HAVE_INITFINI_ARRAY" > ${B}/ld/config.h
+    # use the bfd_stdint.h from binutils-native, this is the same of the one
+    # generated by binutils-cross
+    cp ${RECIPE_SYSROOT_NATIVE}/usr/include/bfd_stdint.h ${B}/bfd/
+}
+
+# target depends
+DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
+DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}gcc"
+DEPENDS += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs"
+DEPENDS += "virtual/${MLPREFIX}libc"
+
+python check_prepare() {
+    def suffix_sys(sys):
+        if sys.endswith("-linux"):
+            return sys + "-gnu"
+        return sys
+
+    def generate_site_exp(d, suite):
+        content = []
+        content.append('set srcdir "{0}/{1}"'.format(d.getVar("S"), suite))
+        content.append('set objdir "{0}/{1}"'.format(d.getVar("B"), suite))
+        content.append('set build_alias "{0}"'.format(d.getVar("BUILD_SYS")))
+        content.append('set build_triplet {0}'.format(d.getVar("BUILD_SYS")))
+        # use BUILD here since HOST=TARGET
+        content.append('set host_alias "{0}"'.format(d.getVar("BUILD_SYS")))
+        content.append('set host_triplet {0}'.format(d.getVar("BUILD_SYS")))
+        content.append('set target_alias "{0}"'.format(d.getVar("TARGET_SYS")))
+        content.append('set target_triplet {0}'.format(suffix_sys(d.getVar("TARGET_SYS"))))
+        content.append("set development true")
+        content.append("set experimental false")
+
+        content.append(d.expand('set CXXFILT "${TARGET_PREFIX}c++filt"'))
+        content.append(d.expand('set CC "${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
+        content.append(d.expand('set CXX "${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
+        content.append(d.expand('set CFLAGS_FOR_TARGET "--sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}"'))
+
+        if suite == "ld" and d.getVar("TUNE_ARCH") == "mips64":
+            # oe patches binutils to have the default mips64 abi as 64bit, but
+            # skips gas causing issues with the ld test suite (which uses gas)
+            content.append('set ASFLAGS "-64"')
+
+        return "\n".join(content)
+
+    for i in ["binutils", "gas", "ld"]:
+        builddir = os.path.join(d.getVar("B"), i)
+        if not os.path.isdir(builddir):
+            os.makedirs(builddir)
+        with open(os.path.join(builddir, "site.exp"), "w") as f:
+            f.write(generate_site_exp(d, i))
+}
+
+CHECK_TARGETS ??= "binutils gas ld"
+
+do_check[dirs] = "${B} ${B}/binutils ${B}/gas ${B}/ld"
+do_check[prefuncs] += "check_prepare"
+do_check[nostamp] = "1"
+do_check() {
+    export LC_ALL=C
+    for i in ${CHECK_TARGETS}; do
+        (cd ${B}/$i; runtest \
+            --tool $i \
+            --srcdir ${S}/$i/testsuite \
+            --ignore 'plugin.exp' \
+            || true)
+    done
+}
+addtask check after do_configure
+
---
2.23.0.rc1

