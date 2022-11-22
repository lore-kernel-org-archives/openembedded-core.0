Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D09C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 07:04:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13162.1669100692083755442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 23:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B07C1FB;
	Mon, 21 Nov 2022 23:04:57 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E9BB3F73D;
	Mon, 21 Nov 2022 23:04:50 -0800 (PST)
From: Diego Sueiro <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [langdale][PATCH] kernel.bbclass: Include randstruct seed assets in STAGING_KERNEL_BUILDDIR
Date: Tue, 22 Nov 2022 07:04:43 +0000
Message-Id: <86508b235df8fd9da34ab1f420c6a98f3edf2ba5.1669100497.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173670

When building with CONFIG_MODVERSIONS=3Dy and CONFIG_RANDSTRUCT=3Dy we ne=
ed
to copy the build assets generated for the randstrutc seed to
STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
generate those assets which will result in a different
RANDSTRUCT_HASHED_SEED.

(From OE-Core rev: b36303158b2e0273ff415bdedefb379f680b30fc)

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
index 7bb3449223..3834a42fb9 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -591,6 +591,22 @@ do_shared_workdir () {
 			cp tools/objtool/objtool ${kerneldir}/tools/objtool/
 		fi
 	fi
+
+	# When building with CONFIG_MODVERSIONS=3Dy and CONFIG_RANDSTRUCT=3Dy w=
e need
+	# to copy the build assets generated for the randstruct seed to
+	# STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
+	# generate those assets which will result in a different
+	# RANDSTRUCT_HASHED_SEED
+	if [ -d scripts/basic ]; then
+		mkdir -p ${kerneldir}/scripts
+		cp -r scripts/basic ${kerneldir}/scripts
+	fi
+
+	if [ -d scripts/gcc-plugins ]; then
+		mkdir -p ${kerneldir}/scripts
+		cp -r scripts/gcc-plugins ${kerneldir}/scripts
+	fi
+
 }
=20
 # We don't need to stage anything, not the modules/firmware since those =
would clash with linux-firmware
--=20
2.35.1


