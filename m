Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A242E9D3ED
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:37:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21782.1770215862025167528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32011339;
	Wed,  4 Feb 2026 06:37:35 -0800 (PST)
Received: from MGC575JXM4.emea.arm.com (MGC575JXM4.nice.Arm.com [10.34.111.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAFBC3F632;
	Wed,  4 Feb 2026 06:37:40 -0800 (PST)
From: Clement Faure <clement.faure@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: saul.wold@windriver.com,
	Clement Faure <clement.faure@arm.com>
Subject: [PATCH 2/2] oeqa/selftest/devtool: add devtool modify testcase for nested gitsm
Date: Wed,  4 Feb 2026 15:37:32 +0100
Message-ID: <20260204143732.94832-3-clement.faure@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260204143732.94832-1-clement.faure@arm.com>
References: <20260204143732.94832-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230538

Add a selftest that exercises devtool modify against git repositories
that contain nested git repositories with submodules.

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
 .../devtool/devtool-test-git-gitsm_git.bb     | 10 ++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       | 25 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-git-g=
itsm_git.bb

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-git-gitsm_gi=
t.bb b/meta-selftest/recipes-test/devtool/devtool-test-git-gitsm_git.bb
new file mode 100644
index 0000000000..ad50c7f13c
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-git-gitsm_git.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Test recipe for fetching git submodules as second repo"
+HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/git-submodule-te=
st/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+SRC_URI =3D "git://git.yoctoproject.org/git-submodule-test;branch=3Dmast=
er;name=3Drepo-git \
+    gitsm://git.yoctoproject.org/git-submodule-test;branch=3Dmaster;name=
=3Drepo-gitsm;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/nested/repo-gitsm=
"
+SRCREV_repo-git =3D "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+SRCREV_repo-gitsm =3D "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+SRCREV_FORMAT =3D "repo-git_repo-gitsm"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index cf5ac6e9d7..cdfcf4f813 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1153,6 +1153,31 @@ class DevtoolModifyTests(DevtoolBase):
         result =3D bitbake(testrecipe)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s=
, output %s" % (result.status, result.output))
=20
+    def test_devtool_modify_nested_gitsm(self):
+        """Checks that a recipe with multiple sources including a git re=
po with a nested git repo with
+        submodules can be used with devtool modify
+        """
+        testrecipe =3D 'devtool-test-git-gitsm'
+        src_uri =3D get_bb_var('SRC_URI', testrecipe)
+        self.assertIn('git://', src_uri, 'This test expects the %s recip=
e to fetch a git source' % testrecipe)
+        self.assertIn('gitsm://', src_uri, 'This test expects the %s rec=
ipe to fetch a gitsm source' % testrecipe)
+        # Try modifying a recipe
+        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
+        result =3D runCmd('devtool modify %s -x %s' % (testrecipe, tempd=
ir))
+        self.assertEqual(result.status, 0, "Could not modify recipe %s. =
Output: %s" % (testrecipe, result.output))
+        # Test devtool status
+        result =3D runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Submodules in repo-gitsm should be extracted
+        source_repo_gitsm_gitmodules =3D os.path.join(tempdir, 'nested/r=
epo-gitsm')
+        self.assertExists(source_repo_gitsm_gitmodules, 'Nested repo rep=
o-gitsm not found')
+        self.assertExists(os.path.join(source_repo_gitsm_gitmodules, 'bi=
tbake'), 'Submodule not found')
+        self.assertExists(os.path.join(source_repo_gitsm_gitmodules, 'bi=
tbake-gitsm-test1'), 'Submodule not found')
+
 class DevtoolUpdateTests(DevtoolBase):
=20
     def test_devtool_update_recipe(self):
--=20
2.43.0


