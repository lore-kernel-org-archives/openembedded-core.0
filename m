Return-Path: <sven@svenschwermer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E712C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 09:23:17 +0000 (UTC)
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
 by mx.groups.io with SMTP id smtpd.web10.3707.1665048186272059870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 02:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@svenschwermer.de
 header.s=mail header.b=KKN5O9Z5;
 spf=pass (domain: svenschwermer.de, ip: 49.12.228.226,
 mailfrom: sven@svenschwermer.de)
X-Virus-Scanned: Yes
From: Sven Schwermer <sven@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
	s=mail; t=1665048182;
	bh=OXYo/HptudY6g2GGehhbzZDpRokcQWaxWi9+wjYqF1g=;
	h=From:To:Cc:Subject;
	b=KKN5O9Z5EtPmo/caRca1c0YaGtkL7TfpRDE76AHW1Kno89J3gJR4mdG92aqnbHNTl
	 d460mlyrB76QlsGMocoShHZNN3pWGf3pCEjPrnPrq19kfZ4JjPT9CIyUPgf25Qsqa8
	 NQD0nrWDogzLHLa4kzrDKLWeEVOkVZ6w3EWTgTgHM+BicQH4cZZ0YhN3MZvDcmuIVF
	 6dvGy1kvH6Xw69VKZ4sm7hYYZVwlDd7ljxKmBm2KfGz85QvHZLTmgKgsi1LtFIhUZP
	 lzfkrwfTbQcnTqv1qq+A1cu2g8mwE9A58qFb66O6UT2r4pUR1mBWThSttDN5FMHM+j
	 8hwalG79b9nIQ==
To: openembedded-core@lists.openembedded.org
Cc: John Edward Broadbent <jebr@google.com>,
	Carson Labrado <clabrado@google.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell] [PATCH] externalsrc: git submodule--helper list unsupported
Date: Thu,  6 Oct 2022 11:22:57 +0200
Message-Id: <20221006092257.67313-1-sven@svenschwermer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 09:23:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171483

From: John Edward Broadbent <jebr@google.com>

Git has removed support for "git submodule--helper list".
https://github.com/git/git/commit/31955475d1c283120d5d84247eb3fd55d9f5fdd=
9

This change provides an alternate method for gathering the submodules
information.

Tested:
Build recipes with and without submodules

Signed-off-by: Carson Labrado <clabrado@google.com>
Signed-off-by: John Edward Broadbent <jebr@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d9364e5f3535954f65cbbc694ee7933ac1d664f)
---

Notes:
    With git 2.38.0 externalsrc does not work anymore. I hope, we can
    backport this fix to stable branches as well.

 meta/classes/externalsrc.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
index 0e0a3ae89c..291fcf5653 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -225,15 +225,16 @@ def srctree_hash_files(d, srcdir=3DNone):
             env['GIT_INDEX_FILE'] =3D tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds_d=
ir, env=3Denv)
             git_sha1 =3D subprocess.check_output(['git', 'write-tree'], =
cwd=3Ds_dir, env=3Denv).decode("utf-8")
-            submodule_helper =3D subprocess.check_output(['git', 'submod=
ule--helper', 'list'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
-            for line in submodule_helper.splitlines():
-                module_dir =3D os.path.join(s_dir, line.rsplit(maxsplit=3D=
1)[1])
-                if os.path.isdir(module_dir):
-                    proc =3D subprocess.Popen(['git', 'add', '-A', '.'],=
 cwd=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.DEVNULL, stderr=3Dsubpr=
ocess.DEVNULL)
-                    proc.communicate()
-                    proc =3D subprocess.Popen(['git', 'write-tree'], cwd=
=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.D=
EVNULL)
-                    stdout, _ =3D proc.communicate()
-                    git_sha1 +=3D stdout.decode("utf-8")
+            if os.path.exists(".gitmodules"):
+                submodule_helper =3D subprocess.check_output(["git", "co=
nfig", "--file", ".gitmodules", "--get-regexp", "path"], cwd=3Ds_dir, env=
=3Denv).decode("utf-8")
+                for line in submodule_helper.splitlines():
+                    module_dir =3D os.path.join(s_dir, line.rsplit(maxsp=
lit=3D1)[1])
+                    if os.path.isdir(module_dir):
+                        proc =3D subprocess.Popen(['git', 'add', '-A', '=
.'], cwd=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.DEVNULL, stderr=3Ds=
ubprocess.DEVNULL)
+                        proc.communicate()
+                        proc =3D subprocess.Popen(['git', 'write-tree'],=
 cwd=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.PIPE, stderr=3Dsubproce=
ss.DEVNULL)
+                        stdout, _ =3D proc.communicate()
+                        git_sha1 +=3D stdout.decode("utf-8")
             sha1 =3D hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
--=20
2.37.3


