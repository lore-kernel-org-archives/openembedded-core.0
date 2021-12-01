Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D89C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 15:55:45 +0000 (UTC)
Received: from forward108p.mail.yandex.net (forward108p.mail.yandex.net
 [77.88.28.116])
 by mx.groups.io with SMTP id smtpd.web08.93715.1638374143457412278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 07:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=GnPFkkwz;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.116, mailfrom: pavel@zhukoff.net)
Received: from iva4-d8b0e1d849e5.qloud-c.yandex.net
 (iva4-d8b0e1d849e5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:825:0:640:d8b0:e1d8])
	by forward108p.mail.yandex.net (Yandex) with ESMTP id 43F2F267AEDD;
	Wed,  1 Dec 2021 18:55:40 +0300 (MSK)
Received: from iva4-50c21cb1cb18.qloud-c.yandex.net
 (iva4-50c21cb1cb18.qloud-c.yandex.net [2a02:6b8:c0c:1510:0:640:50c2:1cb1])
	by iva4-d8b0e1d849e5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 WemXXgcKQp-tddCEYZT;
	Wed, 01 Dec 2021 18:55:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1638374140;
	bh=P7kKEyiN+NAXrvZS1NrVk2NjZRe/szlW+34VtLNfm3I=;
	h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
	b=GnPFkkwzdgROd3HmCSYaSpSLCJi/M4CvxA9oOcXH+leU5lxT6yHxIJ7H7u6T21TgT
	 q+a6RzXt8Zpalr78qe4YLUryBVmqZyvHylvf7Pase+gBrQUl+SrSUdEWPtXQAMVZkp
	 nGHmzVfROK7LFgfJsbGQCx8FIpofXCaGc6mf3yQQ=
Authentication-Results: iva4-d8b0e1d849e5.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by iva4-50c21cb1cb18.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id kDu6DnCg6M-tcR4xX8F;
	Wed, 01 Dec 2021 18:55:38 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [OE-core][PATCH v3] patch.py: Initialize git repo before patching
Date: Wed,  1 Dec 2021 16:54:12 +0100
Message-Id: <20211201155412.5456-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <16BCA762306627AB.4083@lists.openembedded.org>
References: <16BCA762306627AB.4083@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 15:55:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159037

From: Pavel Zhukov <pavel.zhukov@huawei.com>

If PATCHTOOL=3D"git" has been specified but workdir is not git repo
bitbake fails to apply the patches. Fix this by initializing the repo
before patching.
This allows binary git patches to be applied.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/lib/oe/patch.py                    | 17 +++++++++++++++++
 meta/lib/oeqa/selftest/cases/bbtests.py |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index fccbedb519..8326cb55bc 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -56,6 +56,10 @@ def runcmd(args, dir =3D None):
         if dir:
             os.chdir(olddir)
=20
+def getstatusoutput(cmd):
+    import subprocess
+    return subprocess.getstatusoutput(cmd.split())
+
 class PatchError(Exception):
     def __init__(self, msg):
         self.msg =3D msg
@@ -298,6 +302,19 @@ class GitApplyTree(PatchTree):
         PatchTree.__init__(self, dir, d)
         self.commituser =3D d.getVar('PATCH_GIT_USER_NAME')
         self.commitemail =3D d.getVar('PATCH_GIT_USER_EMAIL')
+        if not self._isInitialized():
+            self._initRepo()
+
+    def _isInitialized(self):
+        cmd =3D "git rev-parse --show-toplevel"
+        (status, output) =3D getstatusoutput(cmd)
+        ## Make sure we're in builddir to not break top-level git repos
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
index 6779e62103..2c3defc6b7 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -297,3 +297,9 @@ INHERIT:remove =3D \"report-error\"
=20
         test_recipe_summary_after =3D get_bb_var('SUMMARY', test_recipe)
         self.assertEqual(expected_recipe_summary, test_recipe_summary_af=
ter)
+
+    def test_git_patchtool(self):
+        self.write_recipeinc('man-db', 'PATCHTOOL=3D\"git\"')
+        result =3D bitbake('man-db -c patch', ignore_status=3DFalse)
+        self.delete_recipeinc('man-db')
+        bitbake('-cclean man-db')
--=20
2.34.0


