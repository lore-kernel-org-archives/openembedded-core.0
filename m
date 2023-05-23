Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66231C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:40:08 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web11.64.1684856402021237419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 08:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fris.de header.s=dkim header.b=X95kADmn;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 425D6C02F2;
	Tue, 23 May 2023 17:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1684856398; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=0SdIH+WZlrsO2Kk4dMjnK4wfdtuiH6/5Nhb0eRuJPqw=;
	b=X95kADmn9vMuzbcvEhfNH4vNMu6s2G+dqgmZaedFX51jqxaBvMVdUCFDyqkh9xGCTuKlDl
	zkMba3cmFukjowPgi353Y2H1oLfUr3KhseLgEMtK1sl6UYm99azjxQvfmGnsQNyxz5kDDq
	dxzCp5ELJNhdxSgMzdKoZqmDWBRl5Gc6aX0jt5G8kNa1UhWmXlTF9a85tTOGD41GU5Fa5n
	4RXaLoz9obJKDxE1ySpkY64hAv7En4ZAw9GO5N39/0pB2UONGsr7L9dDbVCqnoHCMHS9BG
	eLIb/GjOiyGZ62w+tuThFe+4ZaxztomWNQVvYx9ykgXemt6tbluDXJ6YoceXTg==
From: Frieder Schrempf <frieder@fris.de>
To: openembedded-core@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH v2] psmisc: Set ALTERNATIVE for pstree to resolve conflict with busybox
Date: Tue, 23 May 2023 17:39:55 +0200
Message-Id: <20230523153955.120515-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 15:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181643

From: Frieder Schrempf <frieder.schrempf@kontron.de>

If pstree in busybox is enabled there is a conflict with pstree from
psmisc resulting in:

  do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If
  the intention is to defer them to first boot, then please place
  them into pkg_postinst_ontarget:${PN} ().
  Deferring to first boot via 'exit 1' is no longer supported.

And more detailed in do_rootfs.log:

  update-alternatives: Error: not linking [...]/rootfs/usr/bin/pstree to =
/bin/busybox.nosuid since [...]/rootfs/usr/bin/pstree exists and is not a=
 link

On order to fix this set ALTERNATIVE:pstree accordingly.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* Remove vscode script
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-exten=
ded/psmisc/psmisc.inc
index a429c2ee96..23e98d21be 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -55,3 +55,5 @@ ALTERNATIVE_PRIORITY =3D "90"
 ALTERNATIVE:killall =3D "killall"
=20
 ALTERNATIVE:fuser =3D "fuser"
+
+ALTERNATIVE:pstree =3D "pstree"
--=20
2.40.1


