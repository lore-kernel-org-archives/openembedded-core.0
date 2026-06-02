Return-Path: <rl@karo-electronics.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D0CCD5BD1
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 14:22:47 +0000 (UTC)
Received: from dd54918.kasserver.com (dd54918.kasserver.com [85.13.167.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26853.1780410165690063523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 07:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@karo-electronics.de header.s=kas202603021246 header.b=ZcgsP9zs;
 spf=pass (domain: karo-electronics.de, ip: 85.13.167.58, mailfrom: rl@karo-electronics.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202603021246; t=1780410116;
	bh=2E/9LvTAV3dH7A0A1zWl8ISsx1KXBMZi6FsmqXt8D1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:From;
	b=ZcgsP9zsf3bmRp9/mvMrRK32vtxvzp4tAyFLtoXiV0PqTKyUnO7xfmG7p6uGcqhKM
	 4TgR2xjMz5wP3jOGa7kQo1K/T5YLQxgjix+ZYGA42dBwgW6NguxwzLL9v6ASfrrt9O
	 v7zqQAIBo9RyT5yWNUu20Bcac7g+gMD0Goji3XJXRtQK4qMe2Hm6zXS1SdZHlj3LPF
	 ujsD0hj52i7rdCD/Azv86ARWC/f25kKncNhZZeC3AxunCr4GX+CfktFLnsKCZ7lSVk
	 3ZsOn992tBE888HuVz1cYDs0dL/Fw4yqDVubEU/h/SzoYqx7M+4b/6uGOAiVvzR5I+
	 R3biGMdVus1FA==
Received: from robin-MS-7E12.ka-ro.local (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id CE610772249C;
	Tue,  2 Jun 2026 16:21:56 +0200 (CEST)
From: Robin Lintermann <rl@karo-electronics.de>
To: openembedded-core@lists.openembedded.org
Cc: Robin Lintermann <rl@karo-electronics.de>
Subject: [scarthgap][PATCH 5/5] update-alternatives.bbclass: Add a 'DISTRO_FEATURE' to create only relative symlinks
Date: Tue,  2 Jun 2026 16:21:32 +0200
Message-ID: <20260602142132.976138-5-rl@karo-electronics.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602142132.976138-1-rl@karo-electronics.de>
References: <20260602142132.976138-1-rl@karo-electronics.de>
MIME-Version: 1.0
X-Spamd-Bar: --
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 14:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238055

Currently update-alternatives will create absolute symlinks to the
target files.
This leads to confusion when looking at the resulting rootfs directory
from the host machine and makes it impossible to do a diff between two
rootfs directories staged on the host.

Add a way to let it install relative symlinks only by adding
'alternatives-symlinks-relative' to DISTRO_FEATURES.

Signed-off-by: Robin Lintermann <rl@karo-electronics.de>
---
 meta/classes-recipe/update-alternatives.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/class=
es-recipe/update-alternatives.bbclass
index b153e1b297..6cfb190c31 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -261,6 +261,8 @@ def update_alternatives_alt_targets(d, pkg):
             continue
=20
         alt_target =3D os.path.normpath(alt_target)
+        if bb.utils.contains('DISTRO_FEATURES','alternatives-symlinks-re=
lative',True,False,d):
+            alt_target =3D os.path.relpath(alt_target, os.path.dirname(a=
lt_link))
         updates.append( (alt_name, alt_link, alt_target, alt_priority) )
=20
     return updates
--=20
2.43.0


