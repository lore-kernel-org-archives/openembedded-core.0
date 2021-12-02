Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF61C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 07:56:35 +0000 (UTC)
Received: from forward108p.mail.yandex.net (forward108p.mail.yandex.net
 [77.88.28.116])
 by mx.groups.io with SMTP id smtpd.web12.5669.1638431789550088525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 23:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=bvE0l6xL;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.116, mailfrom: pavel@zhukoff.net)
Received: from iva4-d8b0e1d849e5.qloud-c.yandex.net
 (iva4-d8b0e1d849e5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:825:0:640:d8b0:e1d8])
	by forward108p.mail.yandex.net (Yandex) with ESMTP id 24E98267C4D0;
	Thu,  2 Dec 2021 10:56:20 +0300 (MSK)
Received: from iva5-057a0d1fbbd8.qloud-c.yandex.net
 (iva5-057a0d1fbbd8.qloud-c.yandex.net [2a02:6b8:c0c:7f1c:0:640:57a:d1f])
	by iva4-d8b0e1d849e5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 fibDwoSMrG-uJd4xiOl;
	Thu, 02 Dec 2021 10:56:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1638431780;
	bh=CvI8YECtydBlTovs1IcxM5NE2yncTqzYagb4jMayzXk=;
	h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
	b=bvE0l6xLv6HgdrZ/4F9jSVskYDGgAmwMBy/UZHaKD8zUwVcsXtd3jHps+HW5KN4oj
	 NswXGsAJqrZgPuIrpxU4G+5cExVVd6aaQJoL2K4HHzkc94dobIER4pQpqgE1M4aAVW
	 BlRr3Kexw+vyvhdck5ko9JF+SoCtP3WUmnU5H8PI=
Authentication-Results: iva4-d8b0e1d849e5.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by iva5-057a0d1fbbd8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id OG4DsQY0fE-uIPW5RNA;
	Thu, 02 Dec 2021 10:56:18 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [OE-core][PATCH v5] patch.py: Initialize git repo before patching
Date: Thu,  2 Dec 2021 08:56:04 +0100
Message-Id: <20211202075604.16318-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: 
 <fb26eb6ccf73ad93d1a9cd49ca27210f57e24b6b.camel@linuxfoundation.org>
References: 
 <fb26eb6ccf73ad93d1a9cd49ca27210f57e24b6b.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 07:56:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159075

From: Pavel Zhukov <pavel.zhukov@huawei.com>

If PATCHTOOL=3D"git" has been specified but workdir is not git repo
bitbake fails to apply the patches with error message:
Command Error: 'git rev-parse --show-toplevel' exited with 0  Output:
fatal: not a git repository (or any of the parent directories): .git

Fix this by initializing the repo before patching.
This allows binary git patches to be applied.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/lib/oe/patch.py                    | 16 +++++++++++++++-
 meta/lib/oeqa/selftest/cases/bbtests.py | 15 +++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index fccbedb519..950fe723dc 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -4,6 +4,7 @@
=20
 import oe.path
 import oe.types
+import subprocess
=20
 class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
@@ -25,7 +26,6 @@ class CmdError(bb.BBHandledException):
=20
 def runcmd(args, dir =3D None):
     import pipes
-    import subprocess
=20
     if dir:
         olddir =3D os.path.abspath(os.curdir)
@@ -56,6 +56,7 @@ def runcmd(args, dir =3D None):
         if dir:
             os.chdir(olddir)
=20
+
 class PatchError(Exception):
     def __init__(self, msg):
         self.msg =3D msg
@@ -298,6 +299,19 @@ class GitApplyTree(PatchTree):
         PatchTree.__init__(self, dir, d)
         self.commituser =3D d.getVar('PATCH_GIT_USER_NAME')
         self.commitemail =3D d.getVar('PATCH_GIT_USER_EMAIL')
+        if not self._isInitialized():
+            self._initRepo()
+
+    def _isInitialized(self):
+        cmd =3D "git rev-parse --show-toplevel"
+        (status, output) =3D subprocess.getstatusoutput(cmd.split())
+        ## Make sure repo is in builddir to not break top-level git repo=
s
+        return status =3D=3D 0 and os.path.samedir(output, self.dir)
+
+    def _initRepo(self):
+        runcmd("git init".split(), self.dir)
+        runcmd("git add .".split(), self.dir)
+        runcmd("git commit -a --allow-empty -m Patching_started".split()=
, self.dir)
=20
     @staticmethod
     def extractPatchHeader(patchfile):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/self=
test/cases/bbtests.py
index 6779e62103..a74576bc02 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -297,3 +297,18 @@ INHERIT:remove =3D \"report-error\"
=20
         test_recipe_summary_after =3D get_bb_var('SUMMARY', test_recipe)
         self.assertEqual(expected_recipe_summary, test_recipe_summary_af=
ter)
+
+    def test_git_patchtool(self):
+        """ PATCHTOOL=3Dgit should work with non-git sources like tarbal=
ls
+            test recipe for the test must NOT containt git:// repository=
 in SRC_URI
+        """
+        test_recipe =3D "man-db"
+        self.write_recipeinc(test_recipe, 'PATCHTOOL=3D\"git\"')
+        src =3D get_bb_var("SRC_URI",test_recipe)
+        gitscm =3D re.search("git://", src)
+        self.assertFalse(gitscm, "test_git_patchtool pre-condition faile=
d: {} test recipe contains git repo!".format(test_recipe))
+        result =3D bitbake('man-db -c patch', ignore_status=3DFalse)
+        fatal =3D re.search("fatal: not a git repository (or any of the =
parent directories)", result.output)
+        self.assertFalse(fatal, "Failed to patch using PATCHTOOL=3D\"git=
\"")
+        self.delete_recipeinc(test_recipe)
+        bitbake('-cclean man-db')
--=20
2.34.0


