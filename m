Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13439.1625504667544932184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 10:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 144671042
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B303B3F694
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:26 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/5] util-linux: rewrite the ptest integration
Date: Mon,  5 Jul 2021 18:04:21 +0100
Message-Id: <20210705170421.533275-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705170421.533275-1-ross.burton@arm.com>
References: <20210705170421.533275-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of duplicating logic, we can use the run.sh that the test suite
installs.

Unless told otherwise, the util-linux test suite assumes that it is
running in a build tree and looks for binaries to run, but we're on
target so pass --use-system-commands (drops ~180 skips to tens).

Add --show-diff so that debugging can be done from the logs alone.

Remove redundant path manipulation that is now done upstream.

If PAM is disabled, delete the chfn test: it will run the chfn from
shadow which has different output, and the test will fail.

[ YOCTO #14244 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../util-linux/util-linux/run-ptest           | 23 ++---------------
 .../util-linux/util-linux_2.37.bb             | 25 ++++---------------
 2 files changed, 7 insertions(+), 41 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/rec=
ipes-core/util-linux/util-linux/run-ptest
index e135ee583bd..3a910be1218 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -13,31 +13,12 @@ current_path=3D$(readlink -f $0)
 export bindir=3D$(dirname $current_path)
 export PATH=3D$bindir/bin:$PATH
=20
-cd tests || exit 1                                                      =
   =20
-
-comps=3D$(find ts/ -type f -perm -111 -regex ".*/[^\.~]*" |  sort)
-
-
-echo
-echo "-------------------- util-linux regression tests -----------------=
---"
-echo
-echo "                    For development purpose only.                 =
   "
-echo "                 Don't execute on production system!              =
   "
-echo
-
-res=3D0
-count=3D0
-for ts in $comps;=20
-do=20
-   $ts | sed -u '{       =20
+./tests/run.sh --use-system-commands --parsable --show-diff | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                          =
   =20
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/            =
   =20
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/           =
   =20
-   }'=20
-done
-
+   }'
=20
 if [ "x$UDEV_PID" !=3D "x" ]; then
     /etc/init.d/udev start
 fi
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.bb b/meta/recip=
es-core/util-linux/util-linux_2.37.bb
index 48b6208612e..399f66d6a01 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.bb
@@ -280,25 +280,10 @@ do_install_ptest() {
     cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
     cp ${WORKDIR}/build/config.h ${D}${PTEST_PATH}
=20
-    # The original paths of executables to be tested point to a local fo=
lder containing
-    # the executables. We want to test the installed executables, not th=
e local copies.
-    # So strip the paths, the executables will be located via "which"
-    sed  -i \
-         -e '/^TS_CMD/ s|$top_builddir/||g' \
-         -e '/^TS_HELPER/ s|$top_builddir|${PTEST_PATH}|g' \
-         ${D}${PTEST_PATH}/tests/commands.sh
-
-    # Change 'if [ ! -x "$1" ]' to 'if [ ! -x "`which $1 2>/dev/null`"]'
-    sed -i -e \
-        '/^\tif[[:space:]]\[[[:space:]]![[:space:]]-x[[:space:]]"$1"/s|$=
1|`which $1 2>/dev/null`|g' \
-         ${D}${PTEST_PATH}/tests/functions.sh
-
-    # Running "kill" without the the complete path would use the shell's=
 built-in kill
-    sed -i -e \
-         '/^TS_CMD_KILL/ s|kill|${PTEST_PATH}/bin/kill|g' \
-         ${D}${PTEST_PATH}/tests/commands.sh
-
-
-    sed -i 's|@base_sbindir@|${base_sbindir}|g'       ${D}${PTEST_PATH}/=
run-ptest
+    sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-pt=
est
=20
+    # chfn needs PAM
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d=
)}; then
+        rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
+    fi
 }
--=20
2.25.1

