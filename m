Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751B6C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:29:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8628.1667320154259870930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 09:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83ECC23A;
	Tue,  1 Nov 2022 09:29:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C14C73F5A1;
	Tue,  1 Nov 2022 09:29:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] oeqa/runtime/dnf: rewrite test_dnf_installroot_usrmerge
Date: Tue,  1 Nov 2022 16:29:05 +0000
Message-Id: <20221101162905.2007873-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101162905.2007873-1-ross.burton@arm.com>
References: <20221101162905.2007873-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 16:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172367

This test doesn't get exercised on the autobuilder and so it was broken:
specifically some of the ln commands silently fail and the chroot isn't
usable.

Rewrite the test case to correctly construct a chroot so the test can
pass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 32 +++++++++++-------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/c=
ases/dnf.py
index 410d456bdf1..3ccb18ce834 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -147,29 +147,21 @@ class DnfRepoTest(DnfTest):
         rootpath =3D '/home/root/chroot/test'
         #Copy necessary files to avoid errors with not yet installed too=
ls on
         #installroot directory.
-        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, r=
ootpath), 1500)
-        self.target.run('ln -sf -r %s/usr/bin %s/bin'  % (rootpath, root=
path), 1500)
-        self.target.run('ln -sf -r %s/usr/sbin %s/sbin'  % (rootpath, ro=
otpath), 1500)
-        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
+        self.target.run('mkdir -p %s/etc' % rootpath)
+        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, r=
ootpath))
+        self.target.run('ln -sf usr/bin %s/bin'  % (rootpath))
+        self.target.run('ln -sf usr/sbin %s/sbin'  % (rootpath))
+        self.target.run('mkdir -p %s/dev' % rootpath)
         #Handle different architectures lib dirs
-        self.target.run('mkdir -p %s/usr/lib' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/libx32' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/lib64' % rootpath, 1500)
-        self.target.run('cp /lib/libtinfo.so.5 %s/usr/lib' % rootpath, 1=
500)
-        self.target.run('cp /libx32/libtinfo.so.5 %s/usr/libx32' % rootp=
ath, 1500)
-        self.target.run('cp /lib64/libtinfo.so.5 %s/usr/lib64' % rootpat=
h, 1500)
-        self.target.run('ln -sf -r %s/lib %s/usr/lib' % (rootpath,rootpa=
th), 1500)
-        self.target.run('ln -sf -r %s/libx32 %s/usr/libx32' % (rootpath,=
rootpath), 1500)
-        self.target.run('ln -sf -r %s/lib64 %s/usr/lib64' % (rootpath,ro=
otpath), 1500)
-        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
-        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
-        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
-        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
+        self.target.run("for l in /lib*; do mkdir -p %s/usr/$l; ln -s us=
r/$l %s/$l; done" % (rootpath, rootpath))
+        self.target.run('cp -r /etc/rpm %s/etc' % rootpath)
+        self.target.run('cp -r /etc/dnf %s/etc' % rootpath)
+        self.target.run('cp /bin/busybox %s/bin/sh' % rootpath)
+        self.target.run('mount -o bind /dev %s/dev/' % rootpath)
         self.dnf_with_repo('install --installroot=3D%s -v -y --rpmverbos=
ity=3Ddebug busybox' % rootpath)
-        status, output =3D self.target.run('test -e %s/var/cache/dnf' % =
rootpath, 1500)
+        status, output =3D self.target.run('test -e %s/var/cache/dnf' % =
rootpath)
         self.assertEqual(0, status, output)
-        status, output =3D self.target.run('test -e %s/bin/busybox' % ro=
otpath, 1500)
+        status, output =3D self.target.run('test -e %s/bin/busybox' % ro=
otpath)
         self.assertEqual(0, status, output)
=20
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
--=20
2.34.1


