Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7108EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 23:31:35 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2703.1687563089355944680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 16:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-173-175-175-24.elp.res.rr.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id 13DF221C2544;
	Fri, 23 Jun 2023 16:31:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 13DF221C2544
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-helloworld: Fix race condition
Date: Fri, 23 Jun 2023 17:31:22 -0600
Message-Id: <20230623233122.2262504-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 23:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183354

There was a race condition during the Makefile execution in
between the assemble and compile targets, only the assemble
target had a dependency on creating the build directory.
If the compile target was executed first, an error was thrown
by bitbake since the build directory did not exist yet:

| Assembler messages:
| Fatal error: can't create build/hello_baremetal_aarch64.o:
  No such file or directory

Update the SRCREV to reflect the latest changes serializing
the makefile targets to avoid such race condition from happening.

[YOCTO #15146]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld=
_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_gi=
t.bb
index 4182372057..c5d3e04ed5 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "These are introductory examples to showc=
ase the use of QEMU to ru
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39346640a23c701e4f459e05f56f4=
449"
=20
-SRCREV =3D "ea7f59b02467ed1fb36c3b4c6d5cabe702df26ec"
+SRCREV =3D "fc7c43d138185028b6ac14c83f6492fce26eca95"
 PV =3D "0.1+git${SRCPV}"
=20
 SRC_URI =3D "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=3D=
https;branch=3Dmaster"
--=20
2.34.1


