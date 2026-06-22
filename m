Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC08CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:21:05 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42670.1782134462683373496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=zVlSh2lP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43A4FC6220C
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:21:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D204601BB;
	Mon, 22 Jun 2026 13:21:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0C4C106C89B2;
	Mon, 22 Jun 2026 15:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782134459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=PcHZCePB+JWbJ0/gLzcAE4/Ixtv4QEE08U+zOszzfes=;
	b=zVlSh2lPmRPf+4f2gQZbsj8kNgo8whz4Zg4K+eJ4PIFge4woKygjFhIXRupDJZnLdqistv
	g74ZznHFBf/c+7uupRXLTNN3KdaHIX7MYOXZuXaT80qSiLgB0yRPCJdg54dAlTNWNdlRrQ
	q58wVHLN4hl46PP533RE94sQg44lTk6KTyz3Fph0b+iov9QJF9CGgV3VblV/zbjPmINUNd
	ZjeZnArhBDxZGxdxcfYPNb3B4sJkHqdZGkSLfjT5ujPPyYe64e/VkjDd61OnXP2BgjwYFP
	dcrCpH4ON47U1hBjjfnxV+oWQ73Wcsf7xsDjQR4G/x3srj/YiuVD8aEDTyxChg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 0/4] llvm/clang: fix some syntax issues in llvm-project-source
Date: Mon, 22 Jun 2026 15:20:17 +0200
Message-ID: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239290

Hello,

I faced some strange build issues when switching from one distro to anoth=
er
(i.e. DISTRO=3D"poky" to DISTRO=3D"foobar"), even after adding "foobar"
("foobar:foobar" actually) to CLANG_EXTRA_OE_DISTRO. I started investigat=
ing
what was wrong, and I believe the order of pathes in this series reflects=
 pretty
well what specific issue I stumbled upon and what was the next one, on an=
d on.

The error message was:

/src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysro=
ot-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld: cannot fi=
nd crtbeginS.o: No such file or directory
/src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysro=
ot-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld: cannot fi=
nd -lstdc++: No such file or directory
/src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysro=
ot-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld: cannot fi=
nd -lgcc: No such file or directory
riscv64-foobar-linux-clang++: error: linker command failed with exit code=
 1 (use -v to see invocation)

As far as I understand, this is precisely what do_preconfigure (+ some pa=
tches)
is supposed to handle, so at first it looked like a regression, but it se=
ems the
error only reproduces when switching distros.

For some context, I was building something with
PREFERRED_TOOLCHAIN_TARGET=3D"clang", using wrynose branch. If I use the =
custom
distro from the beginning (so no switching), everything works fine (as ex=
pected).

Best regards,

Jo=C3=A3o Marcos Costa (4):
  llvm-project-source.inc: fix string replacements in do_preconfigure
  llvm-project-source.inc: fix end of line in triple variable
  clang/llvm: add missing instance of Distro class in Linux.cpp
  llvm-project-source.inc: add vardeps to do_preconfigure

 ...istro-instance-to-getMultiarchTriple.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 .../clang/llvm-project-source.inc             |  7 ++--
 3 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-llvm-clang-Add=
-Distro-instance-to-getMultiarchTriple.patch

--=20
2.47.0


