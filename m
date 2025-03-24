Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E4BC36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:20:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45387.1742836815015187985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 10:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDB5516F3
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:20:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 371793F58B
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:20:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] acl: improve ptest packaging
Date: Mon, 24 Mar 2025 17:20:08 +0000
Message-ID: <20250324172008.3110176-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324172008.3110176-1-ross.burton@arm.com>
References: <20250324172008.3110176-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 17:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213564

As there's a small number of  test binaries in acl, instead of
installing large chunks of the build tree we can install just those and
use a boilerplate test runner.

Drop 0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch and
replace with an explicit -DBASEDIR=3D flag passed at build time.

Drop 0001-test-patch-out-failing-bits.patch and delete the tests that
fail entirely, as the lines that were being deleted in the patch were
the key parts of the test.

Backport a patch from upstream so that some tests don't use excessive
amounts of memory.

Add a patch to disable a single test which makes assumptions about how
stdout and stderr interleave when read, which is dependent on the libc
implementation. The tests assume glibc and musl behaves different, so
instead of deleting the entire test file just remove the single test.

Clean up dependencies now that we're not shipping the build system.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...t_uid-fix-memory-wasting-loop-if-use.patch | 49 +++++++++++++++
 .../0001-test-patch-out-failing-bits.patch    | 60 ------------------
 ...dcode-the-build-path-into-a-helper-l.patch | 24 -------
 meta/recipes-support/attr/acl/run-ptest       | 37 +++++++----
 .../attr/acl/tests-not-musl.patch             | 47 ++++++++++++++
 meta/recipes-support/attr/acl_2.3.2.bb        | 62 +++++++------------
 6 files changed, 145 insertions(+), 134 deletions(-)
 create mode 100644 meta/recipes-support/attr/acl/0001-libmisc-__acl_get_=
uid-fix-memory-wasting-loop-if-use.patch
 delete mode 100644 meta/recipes-support/attr/acl/0001-test-patch-out-fai=
ling-bits.patch
 delete mode 100644 meta/recipes-support/attr/acl/0001-tests-do-not-hardc=
ode-the-build-path-into-a-helper-l.patch
 create mode 100644 meta/recipes-support/attr/acl/tests-not-musl.patch

diff --git a/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix=
-memory-wasting-loop-if-use.patch b/meta/recipes-support/attr/acl/0001-li=
bmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
new file mode 100644
index 00000000000..5052bdaa2f1
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory=
-wasting-loop-if-use.patch
@@ -0,0 +1,49 @@
+From 56abe432b65801f31277fb9a3bca0f9e31502315 Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Thu, 25 Apr 2024 12:43:49 +0200
+Subject: [PATCH] libmisc: __acl_get_uid(): fix memory wasting loop if us=
er
+ does not exist
+
+I noticed that `acl_from_text()` unexpectedly returns ENOMEM for invalid
+user names. The reason for this is a missing break statement in the for
+loop in `__acl_get_uid()`, which causes the loop to act as if ERANGE was
+returned from `getpwnam_r()`, thereby exponentially increasing the
+buffer size to (in my case) multiple gigabytes, until `grow_buffer()`
+reports ENOMEM, which terminates the `__acl_get_uid()` function.
+
+This is a pretty costly "no such user" lookup that can disturb a
+process's heap memory management, but can also cause a process to fail
+e.g. if it is multithreaded and other threads encounter an ENOMEM,
+before `__acl_get_uid()` frees the gigantic heap buffer and returns.
+The allocated memory isn't actually used. Therefore on Linux it should
+not affect other processes by default, due to its overcommit memory
+and lazy memory allocation strategy.
+
+Fix this by properly terminating the for loop on any conditions except
+an ERANGE error being reported. The same break statement correctly
+exists in `__acl_get_gid()` already.
+
+Fixes: 3737f00 ("use thread-safe getpwnam_r and getgrnam_r")
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libmisc/uid_gid_lookup.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libmisc/uid_gid_lookup.c b/libmisc/uid_gid_lookup.c
+index a4f21f6..74baab4 100644
+--- a/libmisc/uid_gid_lookup.c
++++ b/libmisc/uid_gid_lookup.c
+@@ -91,6 +91,7 @@ __acl_get_uid(const char *token, uid_t *uid_p)
+ 		if (err =3D=3D ERANGE)
+ 			continue;
+ 		errno =3D err ? err : EINVAL;
++		break;
+ 	}
+ 	free(buffer);
+ 	return result ? 0 : -1;
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bi=
ts.patch b/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits=
.patch
deleted file mode 100644
index 219feaccd07..00000000000
--- a/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patc=
h
+++ /dev/null
@@ -1,60 +0,0 @@
-From 7dec6fa3b3494a55120402ff1ea3eb96b67138e8 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 12 Dec 2019 15:47:49 +0100
-Subject: [PATCH] test: patch out failing bits
-
-I have confirmed on the host distro (Ubuntu 18.04) that they
-fail as well; upstream probably haven't noticed because the
-test is only executed under sudo.
-
-Upstream-Status: Inappropriate [disabling tests instead of fixing them p=
roperly]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- test/root/permissions.test | 13 -------------
- 1 file changed, 13 deletions(-)
-
-diff --git a/test/root/permissions.test b/test/root/permissions.test
-index 8f8f825..21e8a95 100644
---- a/test/root/permissions.test
-+++ b/test/root/permissions.test
-@@ -50,10 +50,6 @@ User daemon is a member in the owning group, which ha=
s only read access.
- Verify this.
-=20
- 	$ su daemon
--	$ cat f
--	> root
--	> bin
--
- 	$ echo daemon >> f
- 	>~ .*f: Permission denied$
-=20
-@@ -146,8 +142,6 @@ the owning group, he should still have no write acce=
ss.
- 	$ setfacl -x g:daemon f
-=20
- 	$ su daemon
--	$ echo daemon4 >> f
--	>~ .*f: Permission denied$
-=20
-=20
- Change the owning group. The other permissions should now grant user
-@@ -158,12 +152,6 @@ daemon write access.
-=20
- 	$ su daemon
- 	$ echo daemon5 >> f
--	$ cat f
--	> root
--	> bin
--	> daemon
--	> daemon2
--	> daemon5
-=20
-=20
- Verify that permissions in separate matching ACL entries do not
-@@ -173,7 +161,6 @@ accumulate.
- 	$ setfacl -m g:bin:r,g:daemon:w f
-=20
- 	$ su daemon
--	$ : < f
- 	$ : > f
- 	$ : <> f
- 	>~ .*f: Permission denied$
diff --git a/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the=
-build-path-into-a-helper-l.patch b/meta/recipes-support/attr/acl/0001-te=
sts-do-not-hardcode-the-build-path-into-a-helper-l.patch
deleted file mode 100644
index 748f37f3e7e..00000000000
--- a/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-=
path-into-a-helper-l.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 42ae3f8a5e32ba0681ccd1552a203ddad8748a6e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 12 Dec 2019 13:45:52 +0100
-Subject: [PATCH] tests: do not hardcode the build path into a helper lib=
rary
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- test/Makemodule.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/Makemodule.am b/test/Makemodule.am
-index e1d715d..cffe732 100644
---- a/test/Makemodule.am
-+++ b/test/Makemodule.am
-@@ -30,7 +30,7 @@ EXTRA_DIST +=3D \
- check_LTLIBRARIES =3D libtestlookup.la
-=20
- libtestlookup_la_SOURCES =3D test/test_passwd.c test/test_group.c
--libtestlookup_la_CFLAGS =3D -DBASEDIR=3D\"$(abs_srcdir)\"
-+libtestlookup_la_CFLAGS =3D -DBASEDIR=3D\"/tmp/acl-ptest\"
- libtestlookup_la_LDFLAGS =3D -rpath $(abs_builddir)
-=20
- # Make sure translations don't break tests when matching output.
diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-suppo=
rt/attr/acl/run-ptest
index 3af75c84fea..f28d8c12122 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -1,16 +1,31 @@
 #!/bin/sh
-#
-#This script is used to run acl test suites
=20
-#umask 077
+failed=3D0
+all=3D0
=20
-mkdir -p /tmp/acl-ptest/test
-cp test/test.* /tmp/acl-ptest/test
=20
-set +e
-make test-suite.log
-exitcode=3D$?
-if [ $exitcode -ne 0 -a -e test-suite.log ]; then
-    cat test-suite.log
+for f in *.test; do
+    LD_PRELOAD=3D$(pwd)/libtestlookup.so ./run $f
+    case "$?" in
+        0)
+            echo "PASS: $f"
+            all=3D$((all + 1))
+            ;;
+        77)
+            echo "SKIP: $f"
+            ;;
+        *)
+            echo "FAIL: $f"
+            failed=3D$((failed + 1))
+            all=3D$((all + 1))
+            ;;
+    esac
+done
+
+if [ "$failed" -eq 0 ] ; then
+    echo "All $all tests passed"
+    exit 0
+else
+    echo "$failed of $all tests failed"
+    exit 1
 fi
-exit $exitcode
diff --git a/meta/recipes-support/attr/acl/tests-not-musl.patch b/meta/re=
cipes-support/attr/acl/tests-not-musl.patch
new file mode 100644
index 00000000000..8e2c57fb80a
--- /dev/null
+++ b/meta/recipes-support/attr/acl/tests-not-musl.patch
@@ -0,0 +1,47 @@
+Disable a test which fails under musl as the runner makes assumptions ab=
out how
+stdout and stderr are interleaved, and musl doesn't behave the same as g=
libc.
+
+Underlying issue reported at https://savannah.nongnu.org/bugs/?66944.
+
+Upstream-Status: Inappropriate [musl-specific]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/test/misc.test w/test/misc.test
+index 06b3136..736cfbb 100644
+--- i/test/misc.test
++++ w/test/misc.test
+@@ -427,34 +427,6 @@ Now, chmod should change the group_obj entry
+=20
+ 	$ rmdir d
+=20
+-Dangling symlink test https://savannah.nongnu.org/bugs/?28131
+-
+-	$ mkdir d
+-	$ ln -s d/a d/b
+-	$ getfacl -R d
+-	> # file: d
+-	> # owner: %TUSER
+-	> # group: %TGROUP
+-	> user::rwx
+-	> group::rwx
+-	> other::r-x
+-	>=20
+-	$ setfacl -R -m u:bin:rw d
+-	$ getfacl -RL d
+-	> getfacl: d/b: No such file or directory
+-	> # file: d
+-	> # owner: %TUSER
+-	> # group: %TGROUP
+-	> user::rwx
+-	> user:bin:rw-
+-	> group::rwx
+-	> mask::rwx
+-	> other::r-x
+-	>=20
+-	$ setfacl -RL -m u:bin:rw d
+-	> setfacl: d/b: No such file or directory
+-	$ rm -R d
+-
+ Handle escaped literal backslash followed by numeric username
+ 	$ mkdir d
+ 	$ touch d/f
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-suppor=
t/attr/acl_2.3.2.bb
index dd959a5051b..c56c67dbf59 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -16,10 +16,10 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Dc781d7=
0ed2b4d48995b790403217a249 \
 DEPENDS =3D "attr"
=20
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
+           file://0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-=
use.patch \
            file://run-ptest \
-           file://0001-tests-do-not-hardcode-the-build-path-into-a-helpe=
r-l.patch \
-           file://0001-test-patch-out-failing-bits.patch \
            "
+SRC_URI:append:libc-musl =3D " file://tests-not-musl.patch"
=20
 SRC_URI[sha256sum] =3D "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de520=
5bac0bf6058a2f7c"
=20
@@ -31,57 +31,41 @@ PACKAGES =3D+ "lib${BPN}"
=20
 FILES:lib${BPN} =3D "${libdir}/lib*${SOLIBS}"
=20
-PTEST_BUILD_HOST_FILES =3D "builddefs"
-PTEST_BUILD_HOST_PATTERN =3D "^RPM"
-
 do_compile_ptest() {
-        oe_runmake libtestlookup.la
+        oe_runmake libtestlookup.la libtestlookup_la_CFLAGS=3D-DBASEDIR=3D=
\\\"${PTEST_PATH}\\\"
 }
=20
 do_install_ptest() {
-	cp -rf ${S}/test/ ${D}${PTEST_PATH}
-	cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}
-        mkdir -p ${D}${PTEST_PATH}/.libs
-	cp -rf ${B}/.libs/libtestlookup* ${D}${PTEST_PATH}/.libs
-        cp ${B}/Makefile ${D}${PTEST_PATH}
+        install -m755 ${S}/test/run ${S}/test/sort-getfacl-output ${D}${=
PTEST_PATH}/
+        install -m644 ${S}/test/*.acl ${D}${PTEST_PATH}/
=20
-        sed -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
-            -e 's|${DEBUG_PREFIX_MAP}||g' \
-            -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-            -i ${D}${PTEST_PATH}/Makefile
+        # Install the tests
+        for t in $(makefile-getvar ${S}/test/Makemodule.am TESTS); do
+                install -m644 ${S}/$t ${D}${PTEST_PATH}/
+        done
+        # Remove the tests that are expected to fail (they need a NFS se=
rver configured)
+        for t in $(makefile-getvar ${S}/test/Makemodule.am XFAIL_TESTS);=
 do
+                rm ${D}${PTEST_PATH}/$(basename $t)
+        done
+        # These tests skip if they're not root but fail if they're run a=
s root
+        # (https://savannah.nongnu.org/bugs/index.php?66927)
+        rm -f ${D}${PTEST_PATH}/getfacl.test ${D}${PTEST_PATH}/permissio=
ns.test ${D}${PTEST_PATH}/restore.test ${D}${PTEST_PATH}/setfacl.test
=20
-        sed -e "s|^srcdir =3D.*|srcdir =3D .|" \
-	    -e "s|^abs_srcdir =3D.*|abs_srcdir =3D .|" \
-	    -e "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D ..|" \
-	    -e "s|^Makefile:.*|Makefile:|" \
-	    -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
-	    -i ${D}${PTEST_PATH}/Makefile
-
-        rm ${D}${PTEST_PATH}/.libs/libtestlookup.lai
-}
-
-do_install_ptest:append:libc-musl() {
-        sed -i -e '/test\/misc.test/d' ${D}${PTEST_PATH}/Makefile
+        ${B}/libtool --mode=3Dinstall install ${B}/libtestlookup.la ${D}=
${PTEST_PATH}/
+        rm -f ${D}${PTEST_PATH}/*.la
+        install -d ${D}${PTEST_PATH}/test
+        install -m644 ${S}/test/test.passwd ${S}/test/test.group ${D}${P=
TEST_PATH}/test
 }
=20
 RDEPENDS:${PN}-ptest =3D "acl \
-                        bash \
                         coreutils \
                         perl \
-                        perl-module-constant \
-                        perl-module-filehandle \
-                        perl-module-getopt-std \
-                        perl-module-posix \
-                        shadow \
-                        make \
-                        gawk \
-                        e2fsprogs-mke2fs \
                         perl-module-cwd \
                         perl-module-file-basename \
                         perl-module-file-path \
-                        perl-module-file-spec \
+                        perl-module-filehandle \
+                        perl-module-getopt-std \
+                        perl-module-posix \
                        "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


