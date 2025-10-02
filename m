Return-Path: <rtie@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56FDCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 09:59:35 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web11.5053.1759399169366459554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 02:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=rtie@gmx.de header.s=s31663417 header.b=OYuRZN6g;
 spf=pass (domain: gmx.de, ip: 212.227.17.21, mailfrom: rtie@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759399167; x=1760003967; i=rtie@gmx.de;
	bh=OKJ4TCiq7Py8pm77vvg6HJSPZ3lq+UCwN+DwYzzmZ7I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OYuRZN6ggiA78SCMRO5+mzy6SGDgHr964yWQdImfgdXKOCeKCiTj6mRzMPn+nGoc
	 Fux/W6t3whfSizFX8E2ExRr8N6eqrNEG0lc9p3vOy5+JQVqZxEbT1pQRGBXqry7Ke
	 GYJxot7IIZ1DPY4p8E0XYvatCaZL6mE+bPIXZPHS7pSoVeuqrg584KXcTztV8Vd60
	 lJbKZ/F/8QrIZFWXDrbW6VhSXisccFIAOIQvYAS3wHhzkk8K/6QKRp5aADfrUdHWF
	 3XB/9BtqgLlJob8uRa7RH7qlaEdjgcZCVj+vKc4Mhjfenofvc+Vm3qVnG/jj3qr9I
	 mdGtWgW0vCVP4oJhpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from bugfish.tua.local ([87.245.7.122]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1uGsQ72cUe-00ukgz; Thu, 02
 Oct 2025 11:59:27 +0200
From: Robert Tiemann <rtie@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: Robert Tiemann <rtie@gmx.de>
Subject: [PATCH 0/2] udev-extraconf: Speed up automounter and make it safer
Date: Thu,  2 Oct 2025 11:59:23 +0200
Message-ID: <20251002095925.2521779-1-rtie@gmx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ih4TTWdhZZ1v7TOEs+PyzTosGXBgtInnsdGvvFt3obOep1o1ATo
 TWK9I5FyCz9Q1yX9zJKDkNZuS2LJ0S4PwqR4pCpbag93voQjxup1wbqeMEz/zFJ/XkdmCB2
 bYlOJPJ+T+LxuivTmeBTuzQtnE6VElJoqjsCrt6TxA6nzpWErNbp0BC3yiCs4ss5wX0zQ8M
 7vyS+McvcaaDvBESp8umg==
UI-OutboundReport: notjunk:1;M01:P0:EjDnkajD0Xo=;HuuXf/AV7sH4hoeB82gnVjAu2Mq
 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
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 09:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224345

These patches address (1) a performance issue in mount.sh, and (2) a
problem with partition labels which contain slashes.

Robert Tiemann (2):
  udev-extraconf: Speed up mount.sh
  udev-extraconf: Avoid slashes in mountpoint names

 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

=2D-=20
2.43.0


