Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC36C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 06:29:42 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.28576.1641796181031041611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 22:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 31E1620B7179;
	Sun,  9 Jan 2022 22:29:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 31E1620B7179
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 2/2] tclibc-baremetal: Supply missing /bin/sh target in the
 baremetal sdk
Date: Sun,  9 Jan 2022 23:29:38 -0700
Message-Id: <20220110062938.3999900-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 06:29:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160337

SDK recipes now require a provider for /bin/sh, this
should come from nativesdk-sdk-provides-dummy which
is added by default to Linux SDKs, however tclibc-baremetal
requires us to explicitly add its new dependency to
TOOLCHAIN_HOST_TASK, otherwise we get a packaging error
while generating an SDK.

e.g.
package packagegroup-cross-canadian-qemuriscv32-1.0-r0.x86_64_nativesdk
requires gdb-cross-canadian-riscv32, but none of the providers
can be installed
  - conflicting requests
  - nothing provides /bin/sh needed by
    gdb-cross-canadian-riscv32-11.1-r0.x86_64_nativesdk

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/di=
stro/include/tclibc-baremetal.inc
index 86ff93fbdf..f3d27bbaae 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -27,7 +27,7 @@ BASEDEPENDS:remove:class-target =3D "virtual/${TARGET_P=
REFIX}compilerlibs"
 TARGET_OS =3D "elf"
 TARGET_OS:arm =3D "eabi"
=20
-TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE} natives=
dk-qemu"
+TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE} natives=
dk-qemu nativesdk-sdk-provides-dummy"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?=3D ""
 TOOLCHAIN_TARGET_TASK ?=3D "libgcc-dev"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove =3D "virtual/${MLPREFIX}libc zlib=
 ncurses"
--=20
2.25.1


