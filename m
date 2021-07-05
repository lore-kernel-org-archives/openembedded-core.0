Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13389.1625504666975241225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 10:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 816021FB
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10DA63F694
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Jul 2021 10:04:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/5] util-linux: backport test suite fixes
Date: Mon,  5 Jul 2021 18:04:20 +0100
Message-Id: <20210705170421.533275-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705170421.533275-1-ross.burton@arm.com>
References: <20210705170421.533275-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Backport a number of fixes so the test suite passes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  6 ++
 .../util-linux/tests-blkdiscard.patch         | 31 +++++++
 .../util-linux/util-linux/tests-eject.patch   | 56 ++++++++++++
 .../util-linux/util-linux/tests-kill.patch    | 88 +++++++++++++++++++
 .../util-linux/util-linux/tests-lscpu.patch   | 42 +++++++++
 .../util-linux/util-linux/tests-ul.patch      | 35 ++++++++
 6 files changed, 258 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/tests-blkdisc=
ard.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/tests-eject.p=
atch
 create mode 100644 meta/recipes-core/util-linux/util-linux/tests-kill.pa=
tch
 create mode 100644 meta/recipes-core/util-linux/util-linux/tests-lscpu.p=
atch
 create mode 100644 meta/recipes-core/util-linux/util-linux/tests-ul.patc=
h

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
index 9d7d8a23aaa..f10d911fb1d 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,5 +36,11 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linu=
x/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://8a3a74160b96498d672e3652827aa7e6d7f3a120.patch \
+           file://tests-kill.patch \
+           file://tests-blkdiscard.patch \
+           file://tests-ul.patch \
+           file://tests-eject.patch \
+           file://tests-lscpu.patch \
            "
+
 SRC_URI[sha256sum] =3D "bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3=
dd1652d32d15cce5"
diff --git a/meta/recipes-core/util-linux/util-linux/tests-blkdiscard.pat=
ch b/meta/recipes-core/util-linux/util-linux/tests-blkdiscard.patch
new file mode 100644
index 00000000000..34b07a4b2de
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/tests-blkdiscard.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 45fe65d934df2c938701f1c3cd3e0a6f3bdf25e6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 29 Jun 2021 18:10:40 +0100
+Subject: [PATCH] tests/blkdiscard: check correct log file for errors
+
+When checking if the discard ioctl is supported, look in stderr not stdo=
ut.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/ts/blkdiscard/offsets | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/ts/blkdiscard/offsets b/tests/ts/blkdiscard/offsets
+index 9dddc35e2..5e724d51b 100755
+--- a/tests/ts/blkdiscard/offsets
++++ b/tests/ts/blkdiscard/offsets
+@@ -48,7 +48,7 @@ ts_log "testing offsets with full block size"
+ run_tscmd $TS_CMD_BLKDISCARD -v $DEVICE
+ if [ "$?" !=3D "0" ]; then
+ 	# Skip the rest? For example loop backing files on NFS seem unsupporte=
d.
+-	grep -q "BLKDISCARD ioctl failed: Operation not supported" "$TS_OUTPUT=
" \
++	grep -q "BLKDISCARD ioctl failed: Operation not supported" "$TS_ERRLOG=
" \
+ 		&& ts_skip "BLKDISCARD not supported"
+ fi
+ run_tscmd $TS_CMD_BLKDISCARD -v -o 1 $DEVICE
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/tests-eject.patch b/=
meta/recipes-core/util-linux/util-linux/tests-eject.patch
new file mode 100644
index 00000000000..51e914d5664
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/tests-eject.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Submitted [https://github.com/karelzak/util-linux/pull/=
1375]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From dd956268ba89fc1caf83c45c3c495f34d261e0e2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 1 Jul 2021 20:44:31 +0100
+Subject: [PATCH] test/eject: guard asan LD_PRELOAD with use-system-comma=
nds
+ check
+
+This test tries to add asan to LD_PRELOAD because the just-built eject
+will call the host /bin/umount, and apparently asan doesn't like this.
+
+However, if ldd isn't present, this fails as the path to asan is the
+error message saying that ldd isn't present.
+
+As the asan workaround is only needed when executing the binaries that
+have just been built and not the system binaries, only use it if the
+test is on the built binaries.
+
+Closes #1373.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/ts/eject/umount | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/tests/ts/eject/umount b/tests/ts/eject/umount
+index a829d46c0..2be281ee3 100755
+--- a/tests/ts/eject/umount
++++ b/tests/ts/eject/umount
+@@ -60,13 +60,15 @@ function deinit_device {
+ 	ts_scsi_debug_rmmod
+ }
+=20
+-# As the eject binary execl()s an uninstrumented /bin/umount binary, we=
 need
+-# to explicitly $LD_PRELOAD the ASan's runtime DSO, otherwise ASan will=
 complain.
+-# Since all three utilities used by this test (eject, fdisk, mount) are=
 just
+-# libtool wrappers, let's check the kill binary instead, which should h=
ave
+-# the needed DSO information.
+-ASAN_RT_PATH=3D"$(ts_get_asan_rt_path "$TS_CMD_KILL")"
+-[ -n "$ASAN_RT_PATH" ] && export LD_PRELOAD=3D"$ASAN_RT_PATH:$LD_PRELOA=
D"
++if [ "$TS_USE_SYSTEM_COMMANDS" !=3D "yes" ]; then
++	# As the eject binary execl()s an uninstrumented /bin/umount binary, w=
e need
++	# to explicitly $LD_PRELOAD the ASan's runtime DSO, otherwise ASan wil=
l complain.
++	# Since all three utilities used by this test (eject, fdisk, mount) ar=
e just
++	# libtool wrappers, let's check the kill binary instead, which should =
have
++	# the needed DSO information.
++	ASAN_RT_PATH=3D"$(ts_get_asan_rt_path "$TS_CMD_KILL")"
++	[ -n "$ASAN_RT_PATH" ] && export LD_PRELOAD=3D"$ASAN_RT_PATH:$LD_PRELO=
AD"
++fi
+=20
+ ts_init_subtest "by-disk"
+ init_device
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/tests-kill.patch b/m=
eta/recipes-core/util-linux/util-linux/tests-kill.patch
new file mode 100644
index 00000000000..fa49fd41421
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/tests-kill.patch
@@ -0,0 +1,88 @@
+Don't hardcode the use of /bin/kill, as this could be kill.procps.  Inst=
ead ask
+the shell what kill binary to use, which will be the symlink in
+/usr/lib/util-linux/ptest/bin/.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/pull/1=
367]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From e3f8a88cf688dffacb5f6033a8d24e2db40f75f6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 29 Jun 2021 16:34:20 +0100
+Subject: [PATCH] Don't hardcode /bin
+
+---
+ tests/ts/kill/all_processes  | 2 +-
+ tests/ts/kill/name_to_number | 2 +-
+ tests/ts/kill/options        | 2 +-
+ tests/ts/kill/print_pid      | 2 +-
+ tests/ts/kill/queue          | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tests/ts/kill/all_processes b/tests/ts/kill/all_processes
+index 0b137574d..b2280777f 100755
+--- a/tests/ts/kill/all_processes
++++ b/tests/ts/kill/all_processes
+@@ -22,7 +22,7 @@ ts_skip_nonroot
+=20
+ # make sure we do not use shell built-in command
+ if [ "$TS_USE_SYSTEM_COMMANDS" =3D=3D "yes" ]; then
+-	TS_CMD_KILL=3D"/bin/kill"
++	TS_CMD_KILL=3D"$(which kill)"
+ fi
+=20
+ ts_check_test_command "$TS_CMD_KILL"
+diff --git a/tests/ts/kill/name_to_number b/tests/ts/kill/name_to_number
+index 9f4881cb7..8a7f4bef0 100755
+--- a/tests/ts/kill/name_to_number
++++ b/tests/ts/kill/name_to_number
+@@ -20,7 +20,7 @@ ts_init "$*"
+=20
+ # make sure we do not use shell built-in command
+ if [ "$TS_USE_SYSTEM_COMMANDS" =3D=3D "yes" ]; then
+-	TS_CMD_KILL=3D"/bin/kill"
++	TS_CMD_KILL=3D"$(which kill)"
+ fi
+=20
+ ts_check_test_command "$TS_CMD_KILL"
+diff --git a/tests/ts/kill/options b/tests/ts/kill/options
+index 2788c70a2..10653a543 100755
+--- a/tests/ts/kill/options
++++ b/tests/ts/kill/options
+@@ -20,7 +20,7 @@ ts_init "$*"
+=20
+ # make sure we do not use shell built-in command
+ if [ "$TS_USE_SYSTEM_COMMANDS" =3D=3D "yes" ]; then
+-	TS_CMD_KILL=3D"/bin/kill"
++	TS_CMD_KILL=3D"$(which kill)"
+ fi
+=20
+ ts_check_test_command "$TS_CMD_KILL"
+diff --git a/tests/ts/kill/print_pid b/tests/ts/kill/print_pid
+index 6926a3714..6e2db3711 100755
+--- a/tests/ts/kill/print_pid
++++ b/tests/ts/kill/print_pid
+@@ -20,7 +20,7 @@ ts_init "$*"
+=20
+ # make sure we do not use shell built-in command
+ if [ "$TS_USE_SYSTEM_COMMANDS" =3D=3D "yes" ]; then
+-	TS_CMD_KILL=3D"/bin/kill"
++	TS_CMD_KILL=3D"$(which kill)"
+ fi
+=20
+ ts_check_test_command "$TS_CMD_KILL"
+diff --git a/tests/ts/kill/queue b/tests/ts/kill/queue
+index 18f10e8c2..6c9e9efc9 100755
+--- a/tests/ts/kill/queue
++++ b/tests/ts/kill/queue
+@@ -20,7 +20,7 @@ ts_init "$*"
+=20
+ # make sure we do not use shell built-in command
+ if [ "$TS_USE_SYSTEM_COMMANDS" =3D=3D "yes" ]; then
+-	TS_CMD_KILL=3D"/bin/kill"
++	TS_CMD_KILL=3D"$(which kill)"
+ fi
+=20
+ ts_check_test_command "$TS_CMD_KILL"
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/tests-lscpu.patch b/=
meta/recipes-core/util-linux/util-linux/tests-lscpu.patch
new file mode 100644
index 00000000000..36a19bd5a55
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/tests-lscpu.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From c2ca2837a27a3f1344904037ea691bfdbb288f02 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Fri, 2 Jul 2021 13:12:13 +0200
+Subject: [PATCH] lscpu: don't use DMI if executed with --sysroot
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ sys-utils/lscpu-arm.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/sys-utils/lscpu-arm.c b/sys-utils/lscpu-arm.c
+index d52765f9d..c7128094c 100644
+--- a/sys-utils/lscpu-arm.c
++++ b/sys-utils/lscpu-arm.c
+@@ -322,7 +322,8 @@ static void arm_decode(struct lscpu_cxt *cxt, struct=
 lscpu_cputype *ct)
+=20
+ 	arm_ids_decode(ct);
+ 	arm_rXpY_decode(ct);
+-	if (cxt->is_cluster)
++
++	if (!cxt->noalive && cxt->is_cluster)
+ 		ct->nr_socket_on_cluster =3D get_number_of_physical_sockets_from_dmi(=
);
+ }
+=20
+@@ -330,8 +331,9 @@ static int is_cluster_arm(struct lscpu_cxt *cxt)
+ {
+ 	struct stat st;
+=20
+-	if (!(strcmp(cxt->arch->name, "aarch64")) &&
+-	     (stat(_PATH_ACPI_PPTT, &st) < 0) && (cxt->ncputypes =3D=3D 1))
++	if (!cxt->noalive
++	    && strcmp(cxt->arch->name, "aarch64") =3D=3D 0
++	    && stat(_PATH_ACPI_PPTT, &st) < 0 && cxt->ncputypes =3D=3D 1)
+ 		return 1;
+ 	else
+ 		return 0;
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/tests-ul.patch b/met=
a/recipes-core/util-linux/util-linux/tests-ul.patch
new file mode 100644
index 00000000000..6896393105e
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/tests-ul.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b1c71f19ea404e74d36ca5b8fbb0484043cdaef3 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 30 Jun 2021 11:25:01 +0100
+Subject: [PATCH] tests: mark ul/ul as a known failure
+
+As with ul/basic, this test produces different output when ran under
+different terminals, which isn't very useful.
+
+Set TS_KNOWN_FAIL so that these problems don't cause the test to fail.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/ts/ul/ul | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/ts/ul/ul b/tests/ts/ul/ul
+index b856e33db..c707658ac 100755
+--- a/tests/ts/ul/ul
++++ b/tests/ts/ul/ul
+@@ -20,6 +20,9 @@ ts_init "$*"
+=20
+ ts_check_test_command "$TS_CMD_UL"
+=20
++# This test provides different result on some terminals and virtual mac=
hines
++TS_KNOWN_FAIL=3D"yes"
++
+ printf "a\x08ab\x5F\x08c\\n\\ttab\\f\\b\\r" |
+ 	$TS_CMD_UL -t xterm >> $TS_OUTPUT 2>> $TS_ERRLOG
+=20
+--=20
+2.25.1
+
--=20
2.25.1

