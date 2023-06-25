Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CC3EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 04:27:12 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.6362.1687667232063130259
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jun 2023 21:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-173-175-175-24.elp.res.rr.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id E7AB121C2A31;
	Sat, 24 Jun 2023 21:27:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E7AB121C2A31
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] runqemu: Fix automated call to runqemu-ifup
Date: Sat, 24 Jun 2023 22:27:06 -0600
Message-Id: <20230625042706.3998722-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 04:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183366

When runqemu tries to call runqemu-ifup to create tap devices, it checks =
the
output of runqemu-ifup to get the newly created tap device.

The behavior of runqemu-ifup was recently modified along with its output,=
 it
no longer expects the uid parameter to be passed and it prints out a warn=
ing
if it was, since this warning was now part of the output runqemu tries to=
 parse
it and convert it to an int() which proved impossible.

Pass the correct arguments to the runqemu-ifup call and echo the warning
to stderr instead to make sure its not being parsed and used by runqemu i=
n any
case.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 scripts/runqemu      | 2 +-
 scripts/runqemu-ifup | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e1aa5a925c..62774a3b98 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1186,7 +1186,7 @@ to your build configuration.
             gid =3D os.getgid()
             uid =3D os.getuid()
             logger.info("Setting up tap interface under sudo")
-            cmd =3D ('sudo', self.qemuifup, str(uid), str(gid))
+            cmd =3D ('sudo', self.qemuifup, str(gid))
             try:
                 tap =3D subprocess.check_output(cmd).decode('utf-8').str=
ip()
             except subprocess.CalledProcessError as e:
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index c65ceaf1c8..05c9325b6b 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -30,7 +30,7 @@ if [ $EUID -ne 0 ]; then
 fi
=20
 if [ $# -eq 2 ]; then
-	echo "Warning: uid parameter is ignored. It is no longer needed."
+	echo "Warning: uid parameter is ignored. It is no longer needed." >&2
 	GROUP=3D"$2"
 elif [ $# -eq 1 ]; then
 	GROUP=3D"$1"
--=20
2.34.1


