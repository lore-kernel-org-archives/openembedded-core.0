Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D7CC83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:40:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26964.1693932046527832763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F38C612FC;
	Tue,  5 Sep 2023 09:41:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A1073F64C;
	Tue,  5 Sep 2023 09:40:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] busybox: remove coreutils dependency in busybox-ptest
Date: Tue,  5 Sep 2023 17:40:42 +0100
Message-Id: <20230905164042.3263451-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187231

From: Ross Burton <ross.burton@arm.com>

A dependency on coreutils was added to busybox-ptest in oe-core 658c5ed
to fix a test failure.

The failure is because one of the start-stop-daemon tests is known to
fail if /bin/false is busybox. Instead of failing, we can check if
/bin/false is a symlink to busybox and skip the test if so.

[ YOCTO #15068 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/busybox/busybox.inc         |  2 +-
 .../busybox/busybox/start-stop-false.patch    | 35 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/start-stop-false.pa=
tch

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
index 582d87949e9..f5d7c3f9c8f 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -56,7 +56,7 @@ RDEPENDS:${PN} =3D "${@["", "busybox-inittab"][(d.getVa=
r('VIRTUAL-RUNTIME_init_man
 inherit cml1 systemd update-rc.d ptest
=20
 # busybox's unzip test case needs zip command, which busybox itself does=
 not provide
-RDEPENDS:${PN}-ptest =3D "zip coreutils"
+RDEPENDS:${PN}-ptest =3D "zip"
=20
 # internal helper
 def busybox_cfg(feature, tokens, cnf, rem):
diff --git a/meta/recipes-core/busybox/busybox/start-stop-false.patch b/m=
eta/recipes-core/busybox/busybox/start-stop-false.patch
new file mode 100644
index 00000000000..3aef68329cc
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/start-stop-false.patch
@@ -0,0 +1,35 @@
+It's known that the final start-stop-daemon test fails if /bin/false is
+actually a busybox symlink.  Instead of failing, check if false is
+busybox and adapt the expected output to match.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2=
023-August/090416.html]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/testsuite/start-stop-daemon.tests b/testsuite/start-stop-da=
emon.tests
+index 0757b1288..aa6e9cc41 100755
+--- a/testsuite/start-stop-daemon.tests
++++ b/testsuite/start-stop-daemon.tests
+@@ -27,10 +27,18 @@ testing "start-stop-daemon without -x and -a" \
+ # but at least it checks that pathname to exec() is correct
+ #
+ # NB: this fails if /bin/false is a busybox symlink:
+-# busybox looks at argv[0] and says "qwerty: applet not found"
+-testing "start-stop-daemon with both -x and -a" \
+-	'start-stop-daemon -S -x /bin/false -a qwerty false 2>&1; echo $?' \
+-	"1\n" \
+-	"" ""
++# busybox looks at argv[0] and says "qwerty: applet not found", so
++# skip the test if false is busybox.
++case $(readlink /bin/false) in
++    *busybox*)
++        echo "SKIPPED: start-stop-daemon with both -x and -a (need non-=
busybox false)"
++        ;;
++    *)
++		testing "start-stop-daemon with both -x and -a" \
++			'start-stop-daemon -S -x /bin/false -a qwerty false 2>&1; echo $?' \
++			"1\n" \
++			"" ""
++        ;;
++esac
+=20
+ exit $FAILCOUNT
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-c=
ore/busybox/busybox_1.36.1.bb
index 968dce65e45..06eb9eb9996 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys=
-ne.patch \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characte=
rs-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printa=
ble.patch \
+           file://start-stop-false.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.ht=
ml
--=20
2.34.1


