Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC6ECD5BB3
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 12:58:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35643.1779368332091406096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 05:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0hglDken;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 96B941A3655;
	Thu, 21 May 2026 12:58:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D90560495;
	Thu, 21 May 2026 12:58:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FF42107E8B89;
	Thu, 21 May 2026 14:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779368329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KQWnnlLOq6/rw4oV0kqntqcUteMF4aMWDtYwCG+aXAs=;
	b=0hglDkenmanY1y2i3p+5nyzwJr+xjnUt9YX1+NWlS9SUD8cJw6tuM+RKA2b30rZDEiZBQ2
	4sdk2T/3P1RJ+C/lIO/gdXT3JKNx+K3glm3vXSOv/r5QB+noyecuHOqAHqrlmQRqXHoOox
	mqKULw/eCwrJ+Vlfqaz1k/OefB5+tfogu/a/IbBBH9dCNpQWDJ9lFNM/kvsnIi9nt0GLZ1
	hO8RJxTSnG68OI8DV6H85Z46qBQalQNv6FeQ1Oab05d/D/ZTy9vy49wkXQQzExi0gaRe4U
	F+UbtpBLVArm9cd9Ts11i6noX0oawdANGLZMsj9l+MD+HK6rIiWAZ5uHub23CA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Ross.Burton@arm.com,
	alex.kanavin@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 4/5] vim.inc: remove xxd from the destination directory
Date: Thu, 21 May 2026 14:58:27 +0200
Message-ID: <20260521125828.718050-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 12:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237511

Since the default target depends on xxd, building vim leads to building x=
xd
as well, and this raises (for instance) the error below:

error: check_data_file_clashes: Package vim wants to install file
/src/build/tmp/work/qemuriscv64-oe-linux/core-image-minimal/1.0/rootfs/us=
r/bin/xxd
But that file is already provided by package vim-xxd

This is not the ideal approach, because we are just removing something
after it is compiled instead of simply not compiling it in the first plac=
e.

That being said, merely compiling xxd does not add much (or any?) actual =
overhead.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 190953b9dd..b75fcb7696 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -99,6 +99,10 @@ do_install() {
 	# delete the block.
 	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
     fi
+
+    # FIXME: ideally, Vim's makefiles should be tweaked to not build xxd=
,
+    # considering xxd (vim-xxd) has its own recipe now
+    rm ${D}${bindir}/xxd
 }
=20
 PARALLEL_MAKEINST =3D ""
--=20
2.43.0


