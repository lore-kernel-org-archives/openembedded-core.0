Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F8EC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 10:07:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89119.1783073235802959216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 03:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CFik/EX5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEB2B22D7
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Jul 2026 03:07:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B15D33F905
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Jul 2026 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783073235; bh=Unn4jZGJeLb+0r1txSsJKjx3Q7llXAzKYZNnVToLtPg=;
	h=From:To:Subject:Date:From;
	b=CFik/EX5LyOwaXlH9sDZZFrZ6/y/q24igyOfkD7TR6Xmd6TWTtBzzninkR2o7/XQf
	 sXdJkhOc/bNuClyEppxT3/ik4PX1iabbVg3BsllzWQNQQq9pAH83xBoWwur2JH4pFu
	 IGVLBPlAD+BureJ98hgwAdlWMdYNOk7sNET7XFNk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] classes/insane: create one CachedPath instance in qa_check_staged
Date: Fri,  3 Jul 2026 11:07:08 +0100
Message-ID: <20260703100710.2901608-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 10:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240103

There's no need to create a new CachedPath instance for every file that
we want to scan, just create one at the beginning of the function.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index a788817c89d..942b6e500d5 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -732,6 +732,10 @@ def qa_check_staged(path,d):
     workdir =3D os.path.join(tmpdir, "work")
     recipesysroot =3D d.getVar("RECIPE_SYSROOT")
=20
+    # package_qa_check_shebang_size needs the global cpath to be already=
 created
+    global cpath
+    cpath =3D oe.cachedpath.CachedPath()
+
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cr=
oss", d):
         pkgconfigcheck =3D workdir
     else:
@@ -775,10 +779,7 @@ def qa_check_staged(path,d):
                         oe.qa.handle_error("pkgconfig", error_msg, d)
=20
             if not skip_shebang_size:
-                global cpath
-                cpath =3D oe.cachedpath.CachedPath()
                 package_qa_check_shebang_size(path, "", d, None)
-                cpath =3D None
=20
 # Walk over all files in a directory and call func
 def package_qa_walk(checkfuncs, package, d):
--=20
2.43.0


