Return-Path: <osose.itua@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4104EC677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 21:43:22 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.454.1749591797798099503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 14:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=iUYK1v6T;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: osose.itua@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DFA9A3D875FA
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 17:43:16 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id KD26UbQRzyUy; Tue, 10 Jun 2025 17:43:16 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4C4343D8760A;
	Tue, 10 Jun 2025 17:43:16 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 4C4343D8760A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1749591796; bh=2rbJZ3jLZ+CsR/XUVDwyOO2owfcaUqvkLZgdiyAR9LQ=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=iUYK1v6TtcUSz16sCezgbq2XtUmF5GgeF63y/xmEcqmGLYViHvlXG7BgQlZPjwQpy
	 LT/DrTe8hssijT6CUKk2dViPQ82H9trScooV67vpM/XHihqapuiAzTEPT0PgiGx3ea
	 KRnA0yrGMp0v+RAjGECwx2c4WPwgEujwk9oxsF8MfkLq2TqQUpD+tGuk3FN7sTdiDO
	 3CzlUTbE1UjAqCVYfoId+PqMrjM/katUIlk4H3u4YpZBKPADhYVeE/gSur6BCS9LQD
	 eJOkmI0b6LYwo7koUSOoh7/AAV8nE9IOPMSnWwf/DxEl0ODxN1VR4xXFgEI6tcr+r3
	 FpxX99F+FxowQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 5ue6Fp5v9_mw; Tue, 10 Jun 2025 17:43:16 -0400 (EDT)
Received: from oitua-pc.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 26AAB3D875FA;
	Tue, 10 Jun 2025 17:43:16 -0400 (EDT)
From: Osose Itua <osose.itua@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Osose Itua <osose.itua@savoirfairelinux.com>,
	Anakin Childerhose <anakin.childerhose@savoirfairelinux.com>
Subject: [PATCH] toaster.bbclass: fix toaster error caused by tabs in BBLAYERS
Date: Tue, 10 Jun 2025 17:42:06 -0400
Message-ID: <20250610214206.3584227-1-osose.itua@savoirfairelinux.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 21:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218439

Users may unknowingly put tabs in BBLAYERS instead of spaces, and this is
interpreted as a literal "\t" at the start of the filepath which causes
_get_layer_dict() function to fail at finding the filepath.

Replace any tabs found with an empty string to resolve this.

Min steps to reproduce:
- Clone the poky repo:
    git clone git://git.yoctoproject.org/poky
    cd poky
    source oe-init-build-env
- Insert tabs in the BBLAYERS variable in bblayers.conf
  - Note: tab needs to be in the recipe that is being built for the error=
 to be observed
  - Ex: `	/home/<user>/src/poky/meta-skeleton \`
- Start toaster
  source toaster start
  bitbake hello

Error message:
FileNotFoundError: [Errno 2] No such file or directory: '\t/home/<user>/s=
rc/poky/meta-skeleton=E2=80=99

Fix by removing tabs and replacing them with empty strings.

Suggested-by: Anakin Childerhose <anakin.childerhose@savoirfairelinux.com=
>
Signed-off-by: Osose Itua <osose.itua@savoirfairelinux.com>
---
 meta/classes/toaster.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 03c4f3a930..fab22fd0b9 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -80,7 +80,7 @@ python toaster_layerinfo_dumpdata() {
         return layer_info
=20
=20
-    bblayers =3D e.data.getVar("BBLAYERS")
+    bblayers =3D e.data.getVar("BBLAYERS").replace("\t", "")
=20
     llayerinfo =3D {}
=20

