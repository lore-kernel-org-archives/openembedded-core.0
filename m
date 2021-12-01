Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E6BC433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:17:16 +0000 (UTC)
Received: from forward102o.mail.yandex.net (forward102o.mail.yandex.net
 [37.140.190.182])
 by mx.groups.io with SMTP id smtpd.web12.92174.1638368234789774222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 06:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=E7MpVfYV;
 spf=pass (domain: zhukoff.net, ip: 37.140.190.182,
 mailfrom: pavel@zhukoff.net)
Received: from iva4-d8b0e1d849e5.qloud-c.yandex.net
 (iva4-d8b0e1d849e5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:825:0:640:d8b0:e1d8])
	by forward102o.mail.yandex.net (Yandex) with ESMTP id 5F48A6FF87F1;
	Wed,  1 Dec 2021 17:17:11 +0300 (MSK)
Received: from iva8-a4a480c9f089.qloud-c.yandex.net
 (iva8-a4a480c9f089.qloud-c.yandex.net [2a02:6b8:c0c:da5:0:640:a4a4:80c9])
	by iva4-d8b0e1d849e5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 wmBjqgeMfQ-HAdCsxaL;
	Wed, 01 Dec 2021 17:17:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1638368231;
	bh=HwvA8d50W+8eQQbKVitGpxTSk/g1F5DOWSicm6Jxrb4=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=E7MpVfYVF7qHZcn2iRJcsfXckKO+AuT9UKqvcFB/D6uLFQGisNqCsGv61xHO2IIa7
	 UaIniNcw4jTO5XvffUwT1cZ4iJskaWwcGzIz3I1S6C+Bp1dsrKmmIe0om6gBO3cIWR
	 U7B4YTvEcYEJb+Dyt+e4h6M3kGfFJuoYvLc8Ui0Q=
Authentication-Results: iva4-d8b0e1d849e5.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by iva8-a4a480c9f089.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id N3e5qper4F-H9Pir7F9;
	Wed, 01 Dec 2021 17:17:10 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [meta-oe][PATCH v2] patch.py: Initialize git repo before patching
Date: Wed,  1 Dec 2021 15:15:43 +0100
Message-Id: <20211201141543.32206-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 14:17:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159031

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
index 7cd8436da5..720c6f663c 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -52,6 +52,10 @@ def runcmd(args, dir =3D None):
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
@@ -294,6 +298,19 @@ class GitApplyTree(PatchTree):
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
index d4f6a08991..8c046074f6 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -294,3 +294,9 @@ INHERIT_remove =3D \"report-error\"
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


