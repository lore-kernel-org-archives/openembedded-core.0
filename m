Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B57C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:56:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11205.1651852568670672552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 449BA1042;
	Fri,  6 May 2022 08:56:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDF4A3F885;
	Fri,  6 May 2022 08:56:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/5] oeqa/selftest: add test for git working correctly inside
 pseudo
Date: Fri,  6 May 2022 16:56:00 +0100
Message-Id: <20220506155604.2401829-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 15:56:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165344

The fix for CVE-2022-24765 in git[1] breaks any use of git inside
pseudo. Add a simple test case to oe-selftest to verify that at least
basic uses of git work fine under pseudo.

[1] https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb=
7e7d9

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../git-submodule-test/git-submodule-test.bb      | 15 +++++++++++++++
 meta/lib/oeqa/selftest/cases/git.py               | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/git.py

diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-=
test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-tes=
t.bb
index cc5d7eae5a..fa3041b7d8 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -7,3 +7,18 @@ INHIBIT_DEFAULT_DEPS =3D "1"
=20
 SRC_URI =3D "gitsm://git.yoctoproject.org/git-submodule-test;branch=3Dma=
ster"
 SRCREV =3D "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+
+S =3D "${WORKDIR}/git"
+
+do_test_git_as_user() {
+    cd ${S}
+    git status
+}
+addtask test_git_as_user after do_unpack
+
+fakeroot do_test_git_as_root() {
+    cd ${S}
+    git status
+}
+do_test_git_as_root[depends] +=3D "virtual/fakeroot-native:do_populate_s=
ysroot"
+addtask test_git_as_root after do_unpack
diff --git a/meta/lib/oeqa/selftest/cases/git.py b/meta/lib/oeqa/selftest=
/cases/git.py
new file mode 100644
index 0000000000..f12874dc7d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/git.py
@@ -0,0 +1,15 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class GitCheck(OESelftestTestCase):
+    def test_git_intercept(self):
+        """
+        Git binaries with CVE-2022-24765 fixed will refuse to operate on=
 a
+        repository which is owned by a different user. This breaks our
+        do_install task as that runs inside pseudo, so the git repositor=
y is
+        owned by the build user but git is running as (fake)root.
+
+        We have an intercept which disables pseudo, so verify that it wo=
rks.
+        """
+        bitbake("git-submodule-test -c test_git_as_user")
+        bitbake("git-submodule-test -c test_git_as_root")
--=20
2.25.1


