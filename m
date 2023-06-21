Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B4AEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 00:36:50 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.6575.1687307802299874768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 17:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 46B6821C202E;
	Tue, 20 Jun 2023 17:36:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 46B6821C202E
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] runqemu: Stop passing bindir to the runqemu-ifup call
Date: Tue, 20 Jun 2023 18:36:32 -0600
Message-Id: <20230621003632.2284998-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 00:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183164

Since https://git.yoctoproject.org/poky/commit/?id=3D51063c1e6ac
we need to pass exactly 2 arguments to runqemu-ifup, otherwise
the script will return an error since bindir is no longer being
used.

However the call to runqemu-ifup from runqemu is still passing
bindir as an argument resulting in the error mentioned above,
remove the bindir argument to fix this issue.

[YOCTO #15150]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7c6f1cb964..bd1f8366b6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1182,7 +1182,7 @@ to your build configuration.
             gid =3D os.getgid()
             uid =3D os.getuid()
             logger.info("Setting up tap interface under sudo")
-            cmd =3D ('sudo', self.qemuifup, str(uid), str(gid), self.bin=
dir_native)
+            cmd =3D ('sudo', self.qemuifup, str(uid), str(gid))
             try:
                 tap =3D subprocess.check_output(cmd).decode('utf-8').str=
ip()
             except subprocess.CalledProcessError as e:
--=20
2.34.1


