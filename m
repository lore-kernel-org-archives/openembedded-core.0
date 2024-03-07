Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC38C54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 20:09:02 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.3487.1709842133436217347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 12:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=swOq+YUK;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1709842131; x=1710101331;
	bh=QtYkZ7Lns9EtkpWexrnKEfJKxQoHp5dqHTbckzg3qrk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=swOq+YUKchQqs/Q7+0qeJfvPJzwxAO7RZY1tdq3rIrFyXGIJaus3YClvN++VZ+kgY
	 +HUOBLj7h7saZkGOvUHwL9j5mq3pkhb5hXxXuANt+7ijB3SsaZpEUOmx0rJ+SOyy/P
	 Nv2A/NHr65vYlo8pY4GxDm9BeP6TTuNtgjeNZ8NFwhIzI+cYeEntmohRJgktiI2LBE
	 cWV04wHR8j5ntT7jEUgYFiswCRe1NaqtS4Qv54G1+zNlHNwdZ9RxfdZm8ohfbOLnoE
	 QZpT25pqbKeGb1kpxGbOYjIay3rhauJvvN9wAi7OnR1z1QpewtZaii+P8AKUmbuEEE
	 VbDSzB9jge7kA==
Date: Thu, 07 Mar 2024 20:08:35 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH] openssh: enable sshd.service by default
Message-ID: <20240307200830.221403-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 20:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196823

Socket activation is prone to DoS (denial of service) because too many
connections will permanently deactivate sshd.socket [1]. Also, since
socket units do not allow setting Restart, accepting new connections can
fail due to, for example, OOM (out of memory) [2]. Therefore, it seems
more sensible to use sshd.service by default and let sshd.socket be an
optional choice.

[1] https://bugs.archlinux.org/task/62248
[2] https://github.com/systemd/systemd/issues/11553

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb
index 1fd36a266fde..a21570ed9382 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -57,7 +57,7 @@ DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'sy=
stemd', 'systemd', '', d)
=20
 # systemd-sshd-socket-mode means installing sshd.socket
 # and systemd-sshd-service-mode corresponding to sshd.service
-PACKAGECONFIG ??=3D "systemd-sshd-socket-mode"
+PACKAGECONFIG ??=3D "systemd-sshd-service-mode"
 PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] =3D "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit"
--=20
2.44.0



