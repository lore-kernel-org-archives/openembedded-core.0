Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0930C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 13:47:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10032.1634651261565162277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 06:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A72C2F;
	Tue, 19 Oct 2021 06:47:39 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.81.119])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D33273F70D;
	Tue, 19 Oct 2021 06:47:38 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [OE-core] [PATCH] u-boot: Fix syntax error in ${UBOOT_ENV}.scr
 compilation
Date: Tue, 19 Oct 2021 14:47:27 +0100
Message-Id: <20211019134727.1543794-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 13:47:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157117

From: Peter Hoyes <Peter.Hoyes@arm.com>

A previous commit (a3d3c2d4ac421a0dde2a20825eab4434f16b2452) introduced
support for compiling a U-Boot boot script, but the logic contained a
syntax error which was only visible in the build log. Fix the error by
using separate []s for each expression in the if statement.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index ec4a3d201d1..2d5e46f4ef1 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -108,7 +108,7 @@ do_compile () {
         fi
     fi
=20
-    if [ -n "${UBOOT_ENV}" && "${UBOOT_ENV_SUFFIX}" =3D "scr" ]
+    if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" =3D "scr" ]
     then
         ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${WORKDIR=
}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_ENV_BINARY}
     fi
--=20
2.25.1


