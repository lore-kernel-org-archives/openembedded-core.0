Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8DAC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:17:48 +0000 (UTC)
Received: from forward100p.mail.yandex.net (forward100p.mail.yandex.net
 [77.88.28.100])
 by mx.groups.io with SMTP id smtpd.web08.3120.1645471066558236584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=UYT6hwOn;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.100, mailfrom: pavel@zhukoff.net)
Received: from iva4-98ce99fc8d83.qloud-c.yandex.net
 (iva4-98ce99fc8d83.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:788a:0:640:98ce:99fc])
	by forward100p.mail.yandex.net (Yandex) with ESMTP id EFBB34F08B36;
	Mon, 21 Feb 2022 22:17:42 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net
 (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
	by iva4-98ce99fc8d83.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 sa3GQjb5DQ-HgdCZkH6;
	Mon, 21 Feb 2022 22:17:42 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1645471062;
	bh=ZCa7fXU8wHHa+fQHTPK/PexUzEHRgq/akgwFM3O6gzU=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=UYT6hwOngl57i9DC3k9mCT3xaSlRi7TiAygR3cRJDmhaZZ/FGcuUEFAKcUB/AHnkt
	 AFcqrsUYgW/ZfK2ZJdSHepjaSvTlp4hENbH8LyMAib6Sv1zGPGvYSIyuov648rpYft
	 gVDcF71tBehb2ijnqk3KBSai0j6HQwkfBQQe7vws=
Authentication-Results: iva4-98ce99fc8d83.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id cagiXIi5qA-HfHuqig7;
	Mon, 21 Feb 2022 22:17:41 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: ceggers@arri.de,
	pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH v3] patch.py: Prevent git repo reinitialization
Date: Mon, 21 Feb 2022 20:17:29 +0100
Message-Id: <20220221191728.445-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:17:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162066

There were few bugs in the _isInitialized() function which might trigger
git repo to be reinitialized and patches failing to apply.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../recipes-test/gitrepotest/gitrepotest.bb   | 16 ++++++++++++++++
 .../gitrepotest/0001-testpatch.patch          |  9 +++++++++
 meta/lib/oe/patch.py                          | 11 ++++++++---
 meta/lib/oeqa/selftest/cases/bbtests.py       | 19 +++++++++++++++++--
 4 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
 create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest/00=
01-testpatch.patch

diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta=
-selftest/recipes-test/gitrepotest/gitrepotest.bb
new file mode 100644
index 0000000000..f1b6c55833
--- /dev/null
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Test recipe for git repo initialization"
+HOMEPAGE =3D "https://git.yoctoproject.org/git/matchbox-panel-2"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+PATCHTOOL=3D"git"
+
+SRC_URI =3D "git://git.yoctoproject.org/git/matchbox-panel-2;branch=3Dma=
ster;protocol=3Dhttps \
+           file://0001-testpatch.patch \
+          "
+
+SRCREV =3D "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
+
+S =3D "${WORKDIR}/git"
diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-test=
patch.patch b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-tes=
tpatch.patch
new file mode 100644
index 0000000000..bccda17ee9
--- /dev/null
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.p=
atch
@@ -0,0 +1,9 @@
+diff --git a/Makefile.am b/Makefile.am
+index 432a9b4..bbf7c74 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,3 +1,4 @@
++## This is useless comment to test if patch works
+ ACLOCAL_AMFLAGS =3D -I m4
+=20
+ SUBDIRS =3D matchbox-panel applets data po
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dc..9034fcae03 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -304,14 +304,19 @@ class GitApplyTree(PatchTree):
=20
     def _isInitialized(self):
         cmd =3D "git rev-parse --show-toplevel"
-        (status, output) =3D subprocess.getstatusoutput(cmd.split())
+        try:
+            output =3D runcmd(cmd.split(), self.dir).strip()
+        except CmdError as err:
+            ## runcmd returned non-zero which most likely means 128
+            ## Not a git directory
+            return False
         ## Make sure repo is in builddir to not break top-level git repo=
s
-        return status =3D=3D 0 and os.path.samedir(output, self.dir)
+        return os.path.samefile(output, self.dir)
=20
     def _initRepo(self):
         runcmd("git init".split(), self.dir)
         runcmd("git add .".split(), self.dir)
-        runcmd("git commit -a --allow-empty -m Patching_started".split()=
, self.dir)
+        runcmd("git commit -a --allow-empty -m bitbake_patching_started"=
.split(), self.dir)
=20
     @staticmethod
     def extractPatchHeader(patchfile):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/self=
test/cases/bbtests.py
index ce72c4bcc6..35ad9f3cd6 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -307,11 +307,26 @@ INHERIT:remove =3D \"report-error\"
         src =3D get_bb_var("SRC_URI",test_recipe)
         gitscm =3D re.search("git://", src)
         self.assertFalse(gitscm, "test_git_patchtool pre-condition faile=
d: {} test recipe contains git repo!".format(test_recipe))
-        result =3D bitbake('man-db -c patch', ignore_status=3DFalse)
+        result =3D bitbake('{} -c patch'.format(test_recipe), ignore_sta=
tus=3DFalse)
         fatal =3D re.search("fatal: not a git repository (or any of the =
parent directories)", result.output)
         self.assertFalse(fatal, "Failed to patch using PATCHTOOL=3D\"git=
\"")
         self.delete_recipeinc(test_recipe)
-        bitbake('-cclean man-db')
+        bitbake('-cclean {}'.format(test_recipe))
+
+    def test_git_patchtool2(self):
+        """ Test if PATCHTOOL=3Dgit works with git repo and doesn't rein=
itialize it
+        """
+        test_recipe =3D "gitrepotest"
+        src =3D get_bb_var("SRC_URI",test_recipe)
+        gitscm =3D re.search("git://", src)
+        self.assertTrue(gitscm, "test_git_patchtool pre-condition failed=
: {} test recipe doesn't contains git repo!".format(test_recipe))
+        result =3D bitbake('{} -c patch'.format(test_recipe), ignore_sta=
tus=3DFalse)
+        srcdir =3D get_bb_var('S', test_recipe)
+        result =3D runCmd("git log", cwd =3D srcdir)
+        self.assertFalse("bitbake_patching_started" in result.output, ms=
g =3D "Repository has been reinitialized. {}".format(srcdir))
+        self.delete_recipeinc(test_recipe)
+        bitbake('-cclean {}'.format(test_recipe))
+
=20
     def test_git_unpack_nonetwork(self):
         """
--=20
2.34.1


