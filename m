Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D972AC25B78
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 05:48:36 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.33225.1716097711777354968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 22:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from localhost.localdomain (unknown [37.19.221.174])
	by linux.microsoft.com (Postfix) with ESMTPSA id DC87320B915B;
	Sat, 18 May 2024 22:48:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DC87320B915B
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 3/4] tclibc-newlib: update security cflags override
Date: Sat, 18 May 2024 23:50:49 -0600
Message-ID: <20240519055050.2331637-3-alejandro@enedino.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240519055050.2331637-1-alejandro@enedino.org>
References: <20240519055050.2331637-1-alejandro@enedino.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 05:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199546

It appears that it is no longer necessary to disable security cflags for
newlib targets, with the exception of RISCV architectures where the linke=
r
does not support PIE

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/conf/distro/include/tclibc-newlib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distr=
o/include/tclibc-newlib.inc
index 238b430e49..34318b2454 100644
--- a/meta/conf/distro/include/tclibc-newlib.inc
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -42,6 +42,6 @@ TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-$=
{MACHINE} nativesdk-qemu na
 TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D "zlib ncurses"
=20
-# disable pie security flags by default
-SECURITY_CFLAGS:libc-newlib =3D "${SECURITY_NOPIE_CFLAGS}"
-SECURITY_LDFLAGS:libc-newlib =3D ""
+# disable pie security flags by default since RISCV linker doesnt suppor=
t them
+SECURITY_CFLAGS:libc-newlib:qemuriscv32 =3D "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_CFLAGS:libc-newlib:qemuriscv64 =3D "${SECURITY_NOPIE_CFLAGS}"
--=20
2.45.1


