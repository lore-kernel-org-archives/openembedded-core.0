Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AA3C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 13:21:44 +0000 (UTC)
Received: from forward104j.mail.yandex.net (forward104j.mail.yandex.net
 [5.45.198.247])
 by mx.groups.io with SMTP id smtpd.web12.91424.1638364901550642515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 05:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=pvjBF70e;
 spf=pass (domain: zhukoff.net, ip: 5.45.198.247, mailfrom: pavel@zhukoff.net)
Received: from sas1-3a6e090fdc92.qloud-c.yandex.net
 (sas1-3a6e090fdc92.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2796:0:640:3a6e:90f])
	by forward104j.mail.yandex.net (Yandex) with ESMTP id EAE6D2F9AB35;
	Wed,  1 Dec 2021 16:21:31 +0300 (MSK)
Received: from sas2-34ddad429748.qloud-c.yandex.net
 (sas2-34ddad429748.qloud-c.yandex.net [2a02:6b8:c08:b787:0:640:34dd:ad42])
	by sas1-3a6e090fdc92.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 x7dF9Ynb6X-LVduiT4k;
	Wed, 01 Dec 2021 16:21:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1638364891;
	bh=il1wOdigGVUeRQQt7DQDlWNn+4Sy8QDRthgcygCOWeA=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=pvjBF70eE/XJqGChX+GuuSmgbs+5Z61vVBaPW6MzjgzF5jhlui0dc+wH6b2JLuFoe
	 qyFTsxTmeVPMJ9hL5xu9EhEnuFXb8vbbq7/dcs4AejTt0ywv3RbIQHQJ2Hts38YJWe
	 tUpiCxdS3l46BYvvwIFIOMEFMC+GMprrVVgvzvoM=
Authentication-Results: sas1-3a6e090fdc92.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by sas2-34ddad429748.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id abmuNsZQ6f-LUPeFR1D;
	Wed, 01 Dec 2021 16:21:30 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [PATCH] patch.py: Initialize git repo before patching
Date: Wed,  1 Dec 2021 14:19:57 +0100
Message-Id: <20211201131957.20901-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 13:21:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159029

From: Pavel Zhukov <pavel.zhukov@huawei.com>

If PATCHTOOL=3D"git" has been specified but workdir is not git repo
bitbake fails to apply the patches. Fix this by initializing the repo
before patching.
This allows binary git patches to be applied.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/lib/oe/patch.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

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
--=20
2.34.0


