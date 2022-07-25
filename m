Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77538C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 15:53:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29921.1658764427381204441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 08:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E0F32B;
	Mon, 25 Jul 2022 08:53:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5677C3F73D;
	Mon, 25 Jul 2022 08:53:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] oeqa/gotoolchain: put writable files in the Go module
 cache
Date: Mon, 25 Jul 2022 16:53:43 +0100
Message-Id: <20220725155344.427398-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 15:53:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168488

By default 'go mod' creates read-only files, but that just complicates
things.  Add -modcacherw to make the cache read/write, so it can be
cleaned up without needing to chmod.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/=
selftest/cases/gotoolchain.py
index c809d7c9b14..345f533379c 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -43,12 +43,6 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
=20
     @classmethod
     def tearDownClass(cls):
-        # Go creates file which are readonly
-        for dirpath, dirnames, filenames in os.walk(cls.tmpdir_SDKQA):
-            for filename in filenames + dirnames:
-                f =3D os.path.join(dirpath, filename)
-                if not os.path.islink(f):
-                    os.chmod(f, 0o775)
         shutil.rmtree(cls.tmpdir_SDKQA, ignore_errors=3DTrue)
         super(oeGoToolchainSelfTest, cls).tearDownClass()
=20
@@ -56,6 +50,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
         cmd =3D "cd %s/src/%s/%s; " % (self.go_path, proj, name)
         cmd =3D cmd + ". %s; " % self.env_SDK
         cmd =3D cmd + "export GOPATH=3D%s; " % self.go_path
+        cmd =3D cmd + "export GOFLAGS=3D-modcacherw; "
         cmd =3D cmd + "${CROSS_COMPILE}go %s" % gocmd
         return runCmd(cmd).status
=20
--=20
2.34.1


