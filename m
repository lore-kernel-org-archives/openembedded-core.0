Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72C8C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:24:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10908.1789550675656626356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=iSJP/cXF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 87E4E1A088E
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:24:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48F7760337
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:24:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67DB811C7B022;
	Wed, 16 Sep 2026 11:24:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789550668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3wRB/09DeKNiJ79wZNfMSoPGLdzZ3OZZExESwPAXYMs=;
	b=iSJP/cXFtEumvWEhttyK1RKPFvyPD4uYAHw8qDuy/AvH+NyjTUmoPov/bn4PP1grAjBFlb
	NZmstLn4UCEOrUbhCkmYcXVnln2EdtK/80FnPS8xWDX+ekkCqxeZGx4YPcCRu2rwsxQ6k8
	Pa2GGgWy03QZ2BKYPWaOADhF0zvPuX40inL8XbEOzksQWTCFe5bUcNpBhWvJVB9CqO1h02
	dDQOLq1/0JmxDyGlr460fzyJ2cMpdumqM6BAKCl1Xnv5P47hF1x6m6U+X2cd2ugljyt9RA
	p09HRXqzXwpmQjXNp2LeL7ey/k4Xm99AFEL+4Dey8tQQPHbtyfOjoQ9Kf3cyEQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] ptest-packagelists.inc: disable zstd for RISCV64
Date: Wed, 16 Sep 2026 11:24:20 +0200
Message-ID: <20260916092420.246738-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245947

Timeouts have been observed in the autobuilder, and a bug [1] was filed a=
t
Bugzilla.

Most of the time, the cli-tests fail when running
tests/cli-tests/compression/window-resize.sh.

Disable zstd for riscv64, for the time being.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16428

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 2b5d665abe..bac4d3498c 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -163,8 +163,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools stra=
ce"
 PTESTS_SLOW:append:libc-musl =3D " libc-test"
=20
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools=
 python3-numpy perl glib-2.0"
-PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-=
tools python3-numpy perl glib-2.0"
+PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools=
 python3-numpy perl glib-2.0 zstd"
+PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-=
tools python3-numpy perl glib-2.0 zstd"
=20
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-2.0"
--=20
2.55.0


