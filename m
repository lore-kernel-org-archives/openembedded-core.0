Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F675C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 19:16:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.3792.1677525356035722146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 11:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=t826Vj1l;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3CF9385162;
	Mon, 27 Feb 2023 20:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1677525353;
	bh=6MNf67jiVrbiVBlWerjZJVTN5sqNmAO4UgOSbI3GabQ=;
	h=From:To:Cc:Subject:Date:From;
	b=t826Vj1lWy47YqSDQukVhvIAKmo7mw8W+I1T9CRHJVwlX8amr5O5V4I75I0zhAyGc
	 wlQJiDiMIg5x5K/PxQlwBQtDTqZnHL/FJ5ib9mUhlyyj7DMwd0MXBWxAl9xEYLWXsb
	 SvM7iDakc7fA2embuX/ETkKJz9IbEn5RQKjLlcjH/uPuZWeS0D6mEND0yrv6+2uCN9
	 DsJQWkgROnRyoR+3DHQf/JKe7LxNbYADowzlSv2AYtBMGxW5z8yP4ESY+WT+GolcqL
	 oKJQpqQpQ5APoadhxlKL7VUE6jVzdRo/LwrW/feY5TaFVHHw4lTXMyuw3T7q0YKYEp
	 uPrzjXBQ6MbbA==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Armin Kuster <akuster808@gmail.com>,
	Bob Henz <robert_henz@jabil.com>,
	Kristian Klausen <kristian@klausen.dk>,
	Nick Potenski <nick.potenski@garmin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] systemd-systemctl: Create machine-id with "uninitialized" text in it
Date: Mon, 27 Feb 2023 20:15:48 +0100
Message-Id: <20230227191548.95504-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 19:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177804

Instead of creating empty /etc/machine-id file using touch, write
text "uninitialized" into it. Systemd requires "uninitialized" in
the /etc/machine-id file to trigger systemd-firstboot .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Armin Kuster <akuster808@gmail.com>
Cc: Bob Henz <robert_henz@jabil.com>
Cc: Kristian Klausen <kristian@klausen.dk>
Cc: Nick Potenski <nick.potenski@garmin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta=
/recipes-core/systemd/systemd-systemctl/systemctl
index cddae75a06..45b29671ee 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -302,7 +302,7 @@ def preset_all(root):
     # For the stateless configuration, where /etc is generated at runtim=
e
     # (for example on a tmpfs), this script shouldn't run at all and we
     # allow systemd to completely populate /etc.
-    (root / SYSCONFDIR / "machine-id").touch()
+    (root / SYSCONFDIR / "machine-id").write_text("uninitialized")
=20
=20
 def main():
--=20
2.39.2


