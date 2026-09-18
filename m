Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B3BC982D9
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 09:07:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6982.1789722464217441075
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 02:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yliSl1yj;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A3EABC5846F
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:08:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E324E60649
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:07:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B49A10328E83;
	Fri, 18 Sep 2026 11:07:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789722457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lEN7SnkdLkHmCtHguSwl+nc7hy5lZyCZYK6PjDqn1Dw=;
	b=yliSl1yjQJXSk3K5OC+cDAEp0+1h7aKrgmZySAq0UhsoyvTYOynCdcggSiwsExedG0Ko6/
	MeoVgLxhtM6jyg0eMykwcD78xz1gaV8Yr404OZGbqKGCAgAtcuTkrVJsEOEJvN7n/k3gL8
	CSQNUbVmNDDnKLH0H+hh5Y7m4OUgGSw72yvQci/wjkb8JQ8UfzEIlpBG7fMcYEF4KaRVQF
	aqvPN9EdWj7Bs2njXTsu/kpjaH8v8fGmNhyiWJu9x8iIcE6klXHD2ebMGTp2eortaguXUS
	DGYOizYYcfBlH/T7QKWPjEwxkDCdx9hanD/kd6NJ7ACnKV0JqTaXJ3HR5E8/Aw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] ptest-packagelists.inc: disable gnutls for RISCV64
Date: Fri, 18 Sep 2026 11:07:31 +0200
Message-ID: <20260918090731.467954-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246201

Timeouts have been observed (very frequently in the past weeks)
in the autobuilder, and a bug [1] was filed at Bugzilla.

For now, it's not quite clear what specific test case is causing the time=
out.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 79e27f617b..9b264657bb 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -163,8 +163,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools stra=
ce"
 PTESTS_SLOW:append:libc-musl =3D " libc-test"
=20
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools=
 python3-numpy perl glib-2.0 zstd"
-PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-=
tools python3-numpy perl glib-2.0 zstd"
+PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools=
 python3-numpy perl glib-2.0 zstd gnutls"
+PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-=
tools python3-numpy perl glib-2.0 zstd gnutls"
=20
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-2.0"
--=20
2.55.0


