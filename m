Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8E7CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 08:39:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2450.1782290348461625113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 01:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=xXpKCzYc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3970E4E407AE
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 08:39:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E140601C5
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 08:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 269A8106C841A;
	Wed, 24 Jun 2026 10:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782290345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Pa8z+bE2IiqEaAWm8Tps6+Zog5MweETtTPtLye2ujWI=;
	b=xXpKCzYcsEHusrjsfCnjl8C1A7t2cg0QYCMLziPQDCcTGz1D+M5N1vqJfWGfJp3GsiXALz
	m/49kTeJo0MQ07EZJlL5AruHNQto9EzHnoSE2Szlvvl9oICjFC4uta+jzrMTQsL4/G9G7a
	k7DMZVDVwx8r2cMutWFHt52rOhSluErCmvyS/xx6UjnYsbNcCobBRTXUt7ekBz0oSBwXMz
	oNzA8g/Mr2aLClIhcFKnWcv0FF+/Rtmeg9jOvKur/UTBHnpVHY5R47oMTLQ4u/YDubnxuL
	k21rCKRlEoQMh70uPyoCGvyYps0DSzyJyeMNiKGsKW+VUcdFXZCGccJjcMOs6Q==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] ptest-packagelists.inc: disable glib-2.0 for RISCV64
Date: Wed, 24 Jun 2026 10:38:54 +0200
Message-ID: <20260624083854.190049-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 08:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239480

Timeouts and other intermittent failures have been observed in the
autobuilder, and they are tracked in different entries at Bugzilla:

- https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15891
- https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16230

They also happen when musl is enabled, but not only.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index f0950bcc99..de64a80ec3 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -157,8 +157,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools stra=
ce"
 PTESTS_SLOW:append:libc-musl =3D " libc-test"
=20
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools=
 python3-numpy perl"
-PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-=
tools python3-numpy perl"
+PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools=
 python3-numpy perl glib-2.0"
+PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-=
tools python3-numpy perl glib-2.0"
=20
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-2.0"
--=20
2.47.0


