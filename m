Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C751AC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 11:15:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6579.1658488539211852618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 04:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 206EE1063;
	Fri, 22 Jul 2022 04:15:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 233F23F70D;
	Fri, 22 Jul 2022 04:15:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/selftest/context: set branch name when creating
 temporary git repo
Date: Fri, 22 Jul 2022 12:15:34 +0100
Message-Id: <20220722111534.2144462-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 11:15:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168403

Modern gits print a big note if no branch name is specified when
creating a new repository.  Silence this by explicitly naming the new
branch 'master' to match existing naming.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/c=
ontext.py
index 78c7a467e2f..76a188397aa 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -92,7 +92,7 @@ class OESelftestTestContext(OETestContext):
             if os.environ[e].endswith(builddir):
                 os.environ[e] =3D os.environ[e].replace(builddir, newbui=
lddir)
=20
-        subprocess.check_output("git init; git add *; git commit -a -m '=
initial'", cwd=3Dnewselftestdir, shell=3DTrue)
+        subprocess.check_output("git init -b master; git add *; git comm=
it -a -m 'initial'", cwd=3Dnewselftestdir, shell=3DTrue)
=20
         # Tried to used bitbake-layers add/remove but it requires recipe=
 parsing and hence is too slow
         subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%=
s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=3Dnewbuilddir, sh=
ell=3DTrue)
--=20
2.34.1


