Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.951.1602094917282456808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 11:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BABDF1509
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2020 11:21:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6734C3F71F
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2020 11:21:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] selftest: add test for recipes with patches in overrides
Date: Wed,  7 Oct 2020 19:21:51 +0100
Message-Id: <20201007182152.1331417-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007182152.1331417-1-ross.burton@arm.com>
References: <20201007182152.1331417-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

devtool doesn't quite behave right when a recipe has patches applied in o=
verrides, so
add a test case to exercise that behaviour.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../devtool/devtool-patch-overrides.bb        |  8 ++++++++
 .../devtool-patch-overrides/qemuarm/arm.patch |  5 +++++
 .../devtool-patch-overrides/qemux86/x86.patch |  5 +++++
 .../devtool/devtool-patch-overrides/source    |  1 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 20 +++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-patch-over=
rides.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-patch-over=
rides/qemuarm/arm.patch
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-patch-over=
rides/qemux86/x86.patch
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-patch-over=
rides/source

diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides.b=
b b/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb
new file mode 100644
index 0000000000..d36c9edee4
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb
@@ -0,0 +1,8 @@
+SUMMARY =3D "devtool test for overrides and patches"
+LICENSE =3D "CLOSED"
+INHIBIT_DEFAULT_DEPS =3D "1"
+EXCLUDE_FROM_WORLD =3D "1"
+
+SRC_URI =3D "file://source;subdir=3D${BP}"
+SRC_URI_append_qemuarm =3D " file://arm.patch;striplevel=3D0"
+SRC_URI_append_qemux86 =3D " file://x86.patch;striplevel=3D0"
diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/q=
emuarm/arm.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overr=
ides/qemuarm/arm.patch
new file mode 100644
index 0000000000..e33a2753f9
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/=
arm.patch
@@ -0,0 +1,5 @@
+--- source.orig	2020-10-06 13:26:10.792688630 +0100
++++ source	2020-10-06 13:26:18.853424694 +0100
+@@ -1 +1 @@
+-This is a test for something
++This is a test for qemuarm
diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/q=
emux86/x86.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overr=
ides/qemux86/x86.patch
new file mode 100644
index 0000000000..1a0a175fa8
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/=
x86.patch
@@ -0,0 +1,5 @@
+--- source.orig	2020-10-06 13:26:10.792688630 +0100
++++ source	2020-10-06 13:26:18.853424694 +0100
+@@ -1 +1 @@
+-This is a test for something
++This is a test for qemux86
diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/s=
ource b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/source
new file mode 100644
index 0000000000..cc14ce627c
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/source
@@ -0,0 +1 @@
+This is a test for something
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index 2c9ff7a95a..0185e670ad 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -784,6 +784,26 @@ class DevtoolModifyTests(DevtoolBase):
         self._check_src_repo(tempdir)
         # This is probably sufficient
=20
+    def test_devtool_modify_overrides(self):
+        # Try modifying a recipe with patches in overrides
+        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
+        result =3D runCmd('devtool modify devtool-patch-overrides -x %s'=
 % (tempdir))
+
+        self._check_src_repo(tempdir)
+        source =3D os.path.join(tempdir, "source")
+        def check(branch, expected):
+            runCmd('git -C %s checkout %s' % (tempdir, branch))
+            with open(source, "rt") as f:
+                content =3D f.read()
+            self.assertEquals(content, expected)
+        check('devtool', 'This is a test for something\n')
+        check('devtool-no-overrides', 'This is a test for something\n')
+        check('devtool-override-qemuarm', 'This is a test for qemuarm\n'=
)
+        check('devtool-override-qemux86', 'This is a test for qemux86\n'=
)
+
 class DevtoolUpdateTests(DevtoolBase):
=20
     def test_devtool_update_recipe(self):
--=20
2.25.1

