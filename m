Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7CCCD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 12:08:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19593.1782216516081917639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 05:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=cKY5CI/E;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FD28C6B385;
	Tue, 23 Jun 2026 12:08:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 02DAD601C2;
	Tue, 23 Jun 2026 12:08:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1A9C106C83D2;
	Tue, 23 Jun 2026 14:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782216513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3CWm6TLNsHuK4qLa9HeRwSwY8gT6RFo/A3G5UJrjnVQ=;
	b=cKY5CI/E5DT1lwYZUpQ5/3fnZWyNzkUQVF7O+Kx+3jwkX7hTXLSPajkbdsq0qnSpQr35sA
	Jni0Y8XsMWI+IL6qskY4hbJwHdDhWi5yak/zaQEDVVnzoB6BTXY5OkOosAuUt/M9WPpslS
	qTCpFmj8dCMvu6OymfWKaQ4x+Bepr8hovYHM/cVjg49qj8+nAzwq4cORiYOk4pedISX7qO
	FiXhtMjw6RRBeVcgkGWDEGI53doUPuogFQKz39dpQRLZHKLJZacktvDktkDyeIiqVXCK8A
	qS3bABPkv5MpQP0rhQzlppRYDdDvzD2obShOFmcwvjjH2arcDOUq6QDUl1vDgQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 0/5] llvm/clang: fix some syntax issues in llvm-project-source
Date: Tue, 23 Jun 2026 14:08:13 +0200
Message-ID: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239359

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

Changes in v2:
- squashed the patch* into 0016-llvm-clang-Insert-anchor-for-adding-OE-di=
stro-vendor.patch
- added vardeps to do_unpack as well (5th patch)

* 0001-llvm-clang-Add-Distro-instance-to-getMultiarchTriple.patch

Jo=C3=A3o Marcos Costa (5):
  llvm-project-source.inc: fix string replacements in do_preconfigure
  llvm-project-source.inc: fix end of line in triple variable
  clang/llvm: add missing instance of Distro class in Linux.cpp
  llvm-project-source.inc: add vardeps to do_preconfigure
  llvm-project-source.inc: add vardeps to do_unpack

 ...t-anchor-for-adding-OE-distro-vendor.patch | 35 ++++++++++++++-----
 .../clang/llvm-project-source.inc             |  8 +++--
 2 files changed, 31 insertions(+), 12 deletions(-)

--=20
2.43.0


