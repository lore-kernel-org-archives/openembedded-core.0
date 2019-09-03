Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1FFD57F2AD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:57:44 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id x3so2998635plr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=FVeyPjEOLzUuIzkK/l7yP3XZcYi/B+1bPR8Le4b79Oo=;
	b=UWOAF8SpWsVO/2Ll8ZauO/wLJqKn2RUzILdKoE/RrcZF7OVJ2FLkuo+u2lpa3w7wcW
	dW3sSYDBIEryiUUvGicCFzKjW1jQjQO3HxtDrWf2/szevP/RtnuhMtqvIPBKdwdOen4l
	W4BEJ4mstgpoE0CUZWYJQjHDE8cjb8955+0HnrfIgBttX5dZy8qCLJDV8SQc/BCTLMLG
	x/C37/QQuJtgL9LdyN5J2dFCKShv4BzZ1J8Hsca0iugc53orDEeUx9R8nkOMaFN4NQXG
	C+Xj+9814SIkdhkuRcrqkNzr3pTGyZjsrovqA7DGAOQHEv7KYI8iVbe9jNnGWy0NGnFc
	kfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=FVeyPjEOLzUuIzkK/l7yP3XZcYi/B+1bPR8Le4b79Oo=;
	b=Pqz9SeHpog2gi1kR0+rRU5tXSxfU/xPIkqTb5FPatOax8S5Wky6xhuveeszdTyoarl
	vOBTv5Kpdg29lc8LK6NAQGYgJN4Tm1vpCrXxwVN77W6gdseVUNaNmqPSpWmx+sNMN9tF
	KzjbNO50HyL2JC/IZlN/Pg21kcUhg0y7C0Ko+oo/K4vJ7W+IOyttxST/AzBMpm6F8X0V
	UvAANMAxpEkR5jA4n7XB/8F5OEEhiMn2FX6lduqM6q0HP8GcN8j7WBf9dwq3jOJeqRUf
	3WIyTw7lqlkqvXeA1twpMI/UDYFkjMnRO/o3cdxEyplvX9UPpb1xSISbXhG0E1jrXYWS
	pqXA==
X-Gm-Message-State: APjAAAXt/uHCqhin7phSHvoULYkrExP+oV0vlIT+HRC8Cj6THUiuTx+D
	LzGP07buM79FvUzvw64c8rEcQlB2GJV+kA==
X-Google-Smtp-Source: APXvYqybuZnWIgganLvWEfWIqU9FwA8WlwqMy+mOc1xauXiGykyDMGYXF2ixXmQTv+eHCstT1zKCtA==
X-Received: by 2002:a17:902:bc47:: with SMTP id
	t7mr35860681plz.329.1567529865740; 
	Tue, 03 Sep 2019 09:57:45 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	f72sm77133pjg.10.2019.09.03.09.57.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:57:45 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-5-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 05/12] glibc-testsuite: Create a recipe to implement glibc test suite
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
X-List-Received-Date: Tue, 03 Sep 2019 16:57:45 -0000
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
linux-user or ssh targets, with the same TOOLCHAIN_TEST_* variables used for
configuration.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Renamed BUILD_TEST_* to TOOLCHAIN_TEST_*
---
 meta/recipes-core/glibc/glibc-testsuite_2.30.bb  | 51 +++++++++++++++++
 meta/recipes-core/glibc/glibc/check-test-wrapper | 71 ++++++++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc-testsuite_2.30.bb
 create mode 100644 meta/recipes-core/glibc/glibc/check-test-wrapper

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.30.bb b/meta/recipes-core/glibc/glibc-testsuite_2.30.bb
new file mode 100644
index 0000000000..88764d9e2b
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
+DEPENDS += "${@'qemu-native' if d.getVar('TOOLCHAIN_TEST_TARGET') == 'user' else ''}"
+
+TOOLCHAIN_TEST_TARGET ??= "user"
+TOOLCHAIN_TEST_HOST ??= "localhost"
+TOOLCHAIN_TEST_HOST_USER ??= "root"
+TOOLCHAIN_TEST_HOST_PORT ??= "2222"
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
+        SSH_HOST="${TOOLCHAIN_TEST_HOST}" \
+        SSH_HOST_USER="${TOOLCHAIN_TEST_HOST_USER}" \
+        SSH_HOST_PORT="${TOOLCHAIN_TEST_HOST_PORT}" \
+        test-wrapper="${WORKDIR}/check-test-wrapper ${TOOLCHAIN_TEST_TARGET}" \
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

