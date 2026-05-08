Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7135FCD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 21:40:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.696.1778276441099999891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 14:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=FIbxN6oI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8CD3C5DC71
	for <openembedded-core@lists.openembedded.org>; Fri,  8 May 2026 21:41:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8AD66605D0;
	Fri,  8 May 2026 21:40:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45D2C10819DE2;
	Fri,  8 May 2026 23:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778276438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9UONEc0Mr2FOrz3zYudm5/5edR1ivT3A/1PTEK7/LAc=;
	b=FIbxN6oIMKPl5HmAZG6Ghs3WbjcMw0BDLv69EiylMaenubH35x72bpS5UYcJ137P7T47MV
	qzN0UP8ba7CwhQSsWnhAL6DV2/EOX5cGUU0DDzROUkgnmaQagOuo9obwVFYkFEutcANtxD
	pL1tYZwvknHO/kmYLC5/JbQijRxOcQC9moIGFpmm8MxrcqBEN1tn/KPwjcYEMbnQdMbNLI
	UoQzUbeASyYi6IsB5FW+7662avqBjoQGwYls0wa6fqtfV72M7r1eifl6oPrD74uv2HGpwA
	LduFydMoevNZIhCSKO8THzBr2jNrl5jTneXiCDho41bi4QmmQlyrewbzNEiNlQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 4/4] vim.inc: remove xxd from the destination directory
Date: Fri,  8 May 2026 23:40:20 +0200
Message-ID: <20260508214020.2488025-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 21:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236744

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
index 74777864e7..4a7092e4a0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -97,6 +97,10 @@ do_install() {
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


