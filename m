Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B02CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 21:40:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.668.1778276432758692276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 14:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=O9IX/408;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ED32EC5DC71;
	Fri,  8 May 2026 21:41:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96229605D0;
	Fri,  8 May 2026 21:40:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D417D10819DBA;
	Fri,  8 May 2026 23:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778276430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=C91fusBJM/tC0U6tJckQfaL/kEqKbHaBlkuGsH0adLw=;
	b=O9IX/408pGoHCRiC9pvkEk5JsYdpMz+iiYx5lyu/UiPFdVPhXqKFuT3iErX16UHzBqtf9J
	bNV+IVJEWJ2tgfZizqOkBqbqHFhG7yI/O67I5dGrWaTkIqa6LRGYydnLba+q4pZimSw1p5
	Sdejo8qFHRebYd2huJfzvoTQVJ1p452L6lzlYC93frS8no/WPs3R1Ok8QJTr+nSfJTYw0j
	51gdHiBRu5p5op7ghUxt5falH+a4jznIR7bwISJn7dihymNaxZ6t0OCoYjdYtMF2xBzC8Q
	J8vniJHXVsSBEj5bPJ/6yvjQK7ACpd++abkcr6NQS3LhAoNcnweiwBnZdiREoQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 0/4] Split vim and xxd in different recipes
Date: Fri,  8 May 2026 23:40:16 +0200
Message-ID: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 21:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236741

Hello,

Honestly, my main motivation to send this series comes from a time when
I was building u-boot (meta-freescale) and I saw vim-native in Bitbake's
tasks. It blew my mind that a bootloader somehow dependend on a text
editor (yes, only to be built, not to be executed, I know), and the whole
text editor was being built to provide nothing more than xxd.

Just to be clear, what bothers me is NOT u-boot depending on xxd. It is
actually configuring and compiling Vim (considering the overhead this
represents) only to use a single tiny piece of it.

As for the tests I performed:

- machine: qemuriscv64
- toolchains: clang and gcc
- classes (xxd, vim-xxd): target, native, nativesdk
- classes (vim): target, native, nativesdk

Everything built fine, and the core-image-minimal running with qemu also
correctly shipped vim and xxd, which executed fine as well.

Best regards,

Jo=C3=A3o Marcos Costa (4):
  vim: introduce vim-sources.inc file
  vim-xxd: introduce new recipe for xxd
  vim: drop references to xxd in base recipe
  vim.inc: remove xxd from the destination directory

 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-support/vim/vim-sources.inc | 16 +++++++++++++
 meta/recipes-support/vim/vim-xxd_9.2.bb  | 29 ++++++++++++++++++++++++
 meta/recipes-support/vim/vim.inc         | 21 ++++-------------
 meta/recipes-support/vim/vim_9.2.bb      | 10 --------
 5 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-support/vim/vim-sources.inc
 create mode 100644 meta/recipes-support/vim/vim-xxd_9.2.bb

--=20
2.43.0


