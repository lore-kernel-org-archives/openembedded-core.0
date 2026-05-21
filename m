Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63F4CD5BB3
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 12:58:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35793.1779368321019176384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 05:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=tZ/nlbkw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D8A0E1A3655;
	Thu, 21 May 2026 12:58:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A76B960495;
	Thu, 21 May 2026 12:58:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39A5A107E8B85;
	Thu, 21 May 2026 14:58:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779368318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jzSpae7ybM55SY7jvnFWxbdlC+q4VGtY1ooUSQL0vB0=;
	b=tZ/nlbkwBZetCgyaEc/6YEvsqICF4s2o+0Jv4ziKhYlLAyGVkGELvZ6UwZYXadGSDE9jz3
	DAGV4Kg6qVansUiBJstdwML2CJZR5Y32W+u+o8b4D3/GhiJYolLNQxy2NmA7XH1Th9usIW
	FtYz8OnBk9pXp9vjEz9mhdjkq+TW+QOnGzS5wH3i+DpyWEYP/Itjm2ZvfrF5uc4W1PXLVp
	8sN0ynNLbL9XfhAO7L5PdmmOLsWClEi+lU8VmVEEmP9ajF9cFpUv/9KVy6l+wm3xVz9wjm
	Hqw79cLDtp/dPg1h/c2R5FYSr2zalbIh4rVtYrgqZHUXEYgxIf4esEWtWKGA0A==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Ross.Burton@arm.com,
	alex.kanavin@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 0/5] Split vim and xxd in different recipes
Date: Thu, 21 May 2026 14:58:23 +0200
Message-ID: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 12:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237507

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
- archiving: the resulting tarball includes only xxd's sources, as expect=
ed

Some benchmarks as well, from a previous mail:

vim-native-9.2.0340-r0: do_configure
Elapsed time: 6.81 seconds

vim-native-9.2.0340-r0: do_compile
Elapsed time: 4.43 seconds

vim-xxd-native-9.2.0340-r0: do_configure
Elapsed time: 0.03 seconds

vim-xxd-native-9.2.0340-r0: do_compile
Elapsed time: 0.23 seconds

(this data comes from tmp/buildstats)

Everything built fine, and the core-image-minimal running with qemu also
correctly shipped vim and xxd, which executed fine as well.

Finally, regarding runtime, vim already RDEPENDs on vim-xxd, so by defaul=
t they
are installed together if you have 'vim' in IMAGE_INSTALL. After the spli=
t, it
is true that both recipes will be built, but as per the numbers above, th=
e time
spent building vim-xxd-native is minimal.

Best regards,

Changes since v1:
- added the step where vim's sources are pruned
- fixed the license information in xxd
- moved the patches from vim-sources.inc to vim's recipe, as they don't a=
pply to
  xxd
- added support to pruning in archiver.bbclass, to make things coherent
- added some benchmarks to the cover letter

Jo=C3=A3o Marcos Costa (5):
  vim: introduce vim-sources.inc file
  vim-xxd: introduce new recipe for xxd
  vim: drop references to xxd in base recipe
  vim.inc: remove xxd from the destination directory
  base.bbclass: introduce prune_source_tree function

 meta/classes-global/base.bbclass         | 49 ++++++++++++++++++++++++
 meta/classes/archiver.bbclass            |  1 +
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-support/vim/vim-sources.inc |  9 +++++
 meta/recipes-support/vim/vim-xxd_9.2.bb  | 39 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc         | 18 +++------
 meta/recipes-support/vim/vim_9.2.bb      | 13 ++-----
 7 files changed, 108 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-support/vim/vim-sources.inc
 create mode 100644 meta/recipes-support/vim/vim-xxd_9.2.bb

--=20
2.43.0


