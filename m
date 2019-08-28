Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 25E407E830
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:06 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id w10so739645pgj.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=EwqN8dQUoLOhjOnoUls/GuRoDDoqgIEqGPkOgJreMQI=;
	b=GTgwMEc4HMOdLtzB7jd2nz1t6ojaBqcjb2YHpL/Rycp5iPgTJtAfIOGrtiuv23gJad
	hu4/IfXkAf2aRzwWHdd95MYFurueNnH61QkSf8fd7ATxD0FM1aQJKdmbh6DTwIpbO7V8
	yb4EU4ZF1PW72CD9so1ko34sgE34crY2ygrPzKgAUM/0l252zLJKylaXLfcoPPYS+Gxv
	zJIR5xVLHe6KzUWRAyOdv2QBLtf0wKf2Z84SaUwtTQCUAKKdU6NCgELumXqzgf3U//W8
	h7C4GBdR5KHeAQYEQeYWBVwGnCUVbID1HvQ6SNZ8dDTM0cnb1E5TG9FQEu44kWX+lHof
	Kcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=EwqN8dQUoLOhjOnoUls/GuRoDDoqgIEqGPkOgJreMQI=;
	b=J0PeG4VOeaR5YAz8QHkbGJKeHQwJcZDhoq5VNiK5zp0aopXYIgIyy6saxU4KTRE72T
	vtNqWlN3RbMozitl1yzhYqp1fpf0y8jQ97yVpKip0BUx2dgvWYLORHDzKiw3OO/Z/MTl
	B1PMilxyxQfIspjnVIxNiyt6xpWpYMEubmCxlqSIvPmHpyO2B6Ofi8Kh3dU03weBhth5
	KUmoyUW3u7Hos2n7PadZdXgZ4U3hqCkjRnmP8HP/2JAXCLDT+RoMhgubbuw+dYHH3AuJ
	usqFnTv6MFdPkB48mcSVkHW3cDECrrsAACJ0B/Z7kYvBDpluBs94/X1cRleJa5yucXp1
	pMaA==
X-Gm-Message-State: APjAAAWPCcbiPw3pfu8VAvJGaYkt1q9rloI0W0H3dpbCiHY+0ctusDVb
	HjVL3sl888fUbRN4AOOuETBmIw==
X-Google-Smtp-Source: APXvYqzT+KYgndnUn+jWLWHpBwO00INpxnli9KQ6tlPNPuWBB6FoUIZNsYZqZwXdL5+TUil2aBUarw==
X-Received: by 2002:aa7:98da:: with SMTP id e26mr2591666pfm.34.1566968828185; 
	Tue, 27 Aug 2019 22:07:08 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	ce20sm911563pjb.16.2019.08.27.22.07.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:07:07 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-5-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 5/11] glibc-testsuite: Create a recipe to implement glibc test suite
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
X-List-Received-Date: Wed, 28 Aug 2019 05:07:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

A recipe needs to be created for the test suite due to the dependency
chain between libgcc -> glibc -> libgcc-initial, and the requirements of
the test suite to have libgcc for compilation and execution.

The glibc test suite does not use dejagnu like the gcc test suites do.
Instead a test wrapper script is used along with the assumed dependency
of having the same filesystem available on build host and target. For
qemu linux-user the same filesystem is inherently available, for remote
targets NFS is used. Separate test wrapper scripts are created for qemu
linux-user or ssh targets, with the same BUILD_TEST_* variables used for
configuration.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.30.bb  | 51 +++++++++++++++++
 meta/recipes-core/glibc/glibc/check-test-wrapper | 71 ++++++++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc-testsuite_2.30.bb
 create mode 100644 meta/recipes-core/glibc/glibc/check-test-wrapper

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
new file mode 100644
index 0000000000..665619377d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
@@ -0,0 +1,51 @@
+require glibc_${PV}.bb
+
+# handle PN differences
+FILESEXTRAPATHS_prepend := "${THISDIR}/glibc:"
+
+# strip provides
+PROVIDES = ""
+# setup depends
+INHIBIT_DEFAULT_DEPS = ""
+
+DEPENDS += "glibc-locale libgcc gcc-runtime"
+
+# remove the initial depends
+DEPENDS_remove = "libgcc-initial"
+
+inherit qemu
+
+SRC_URI += "file://check-test-wrapper"
+
+DEPENDS += "${@'qemu-native' if d.getVar('BUILD_TEST_TARGET') == 'user' else ''}"
+
+BUILD_TEST_TARGET ??= "user"
+BUILD_TEST_HOST ??= "localhost"
+BUILD_TEST_HOST_USER ??= "root"
+BUILD_TEST_HOST_PORT ??= "2222"
+
+do_check[dirs] += "${B}"
+do_check[nostamp] = "1"
+do_check () {
+    chmod 0755 ${WORKDIR}/check-test-wrapper
+
+    # clean out previous test results
+    oe_runmake tests-clean
+    # makefiles don't clean entirely (and also sometimes fails due to too many args)
+    find ${B} -type f -name "*.out" -delete
+    find ${B} -type f -name "*.test-result" -delete
+    find ${B}/catgets -name "*.cat" -delete
+    find ${B}/conform -name "symlist-*" -delete
+    [ ! -e ${B}/timezone/testdata ] || rm -rf ${B}/timezone/testdata
+
+    oe_runmake -i \
+        QEMU_SYSROOT="${RECIPE_SYSROOT}" \
+        QEMU_OPTIONS="${@qemu_target_binary(d)} ${QEMU_OPTIONS}" \
+        SSH_HOST="${BUILD_TEST_HOST}" \
+        SSH_HOST_USER="${BUILD_TEST_HOST_USER}" \
+        SSH_HOST_PORT="${BUILD_TEST_HOST_PORT}" \
+        test-wrapper="${WORKDIR}/check-test-wrapper ${BUILD_TEST_TARGET}" \
+        check
+}
+addtask do_check after do_compile
+
diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
new file mode 100644
index 0000000000..f8e04e02d2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
@@ -0,0 +1,71 @@
+#!/usr/bin/env python3
+import sys
+import os
+import subprocess
+
+env = os.environ.copy()
+args = sys.argv[1:]
+targettype = args.pop(0)
+
+if targettype == "user":
+    qemuargs = os.environ.get("QEMU_OPTIONS", "").split()
+    if not os.path.exists(qemuargs[0]):
+        # ensure qemu args has a valid absolute path
+        for i in os.environ.get("PATH", "").split(":"):
+            if os.path.exists(os.path.join(i, qemuargs[0])):
+                qemuargs[0] = os.path.join(i, qemuargs[0])
+                break
+    sysroot = os.environ.get("QEMU_SYSROOT", None)
+    if not sysroot:
+        sys.exit(-1)
+    libpaths = [sysroot + "/usr/lib", sysroot + "/lib"]
+
+    if args[0] == "env":
+        args.pop(0)
+        if len(args) == 0:
+            args = ["env"]
+        else:
+            # process options
+            while args[0].startswith("-"):
+                opt = args.pop(0).lstrip("-")
+                if "i" in opt:
+                    env.clear()
+            # process environment vars
+            while "=" in args[0]:
+                key, val = args.pop(0).split("=", 1)
+                if key == "LD_LIBRARY_PATH":
+                    libpaths += val.split(":")
+                else:
+                    env[key] = val
+    if args[0] == "cp":
+        # ignore copies, the filesystem is the same
+        sys.exit(0)
+
+    qemuargs += ["-L", sysroot]
+    qemuargs += ["-E", "LD_LIBRARY_PATH={}".format(":".join(libpaths))]
+    command = qemuargs + args
+elif targettype == "ssh":
+    host = os.environ.get("SSH_HOST", None)
+    user = os.environ.get("SSH_HOST_USER", None)
+    port = os.environ.get("SSH_HOST_PORT", None)
+
+    command = ["ssh", "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no"]
+    if port:
+        command += ["-p", str(port)]
+    if not host:
+        sys.exit(-1)
+    command += ["{}@{}".format(user, host) if user else host]
+
+    # wrap and replace quotes for correct transformation on ssh
+    wrapped = " ".join(["'{0}'".format(i.replace("'", r"'\''")) for i in ["cd", os.getcwd()]]) + "; "
+    wrapped += " ".join(["'{0}'".format(i.replace("'", r"'\''")) for i in args])
+    command += ["sh", "-c", "\"{}\"".format(wrapped)]
+else:
+    sys.exit(-1)
+
+try:
+    r = subprocess.run(command, timeout = 1800, env = env)
+    sys.exit(r.returncode)
+except subprocess.TimeoutExpired:
+    sys.exit(-1)
+
---
2.23.0.rc1

