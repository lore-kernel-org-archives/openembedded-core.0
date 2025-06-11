Return-Path: <osose.itua@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C4DC71133
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:25:51 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.1235.1749655548644547029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 08:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=fLVJiXI7;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: osose.itua@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A0C373D852DB;
	Wed, 11 Jun 2025 11:25:47 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id hAL5ohlhbFZK; Wed, 11 Jun 2025 11:25:47 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 22FD23D85715;
	Wed, 11 Jun 2025 11:25:47 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 22FD23D85715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1749655547; bh=K9LBI9+em47B8CFC5fZlC54+sW1e/p6h3odA+v70+38=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=fLVJiXI7PU7jTVO2MsyczoZY1QFJA/++fhb4hJzKnd/WU1VlyYpmNWK5aA3zeezd6
	 h+LxXbB1GABfxcvkTmtainaR5i74JqHA3Eh85hr/bjIRdiuL5XuQxhAmATxqqGCnuY
	 rx3ea9ZkJBfx6hw0qgE7tmJlG83skiTMLfqyS1crxq7qruaBuOP7gK3Td/S8syUO7E
	 adA1QluQjfOH4C93SSLM4Sgu9sEEsQk/+9JmfCIzzgzBosysA3Rs+MDehY3PHP/Drz
	 geugxJgbrEsiayO28ioivztz7y0utG9QRVOs1OSFo87KLiBiIotvT4galWNVyvjA5Z
	 e1KyqK4UbN60A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id gPxh2955Kdfz; Wed, 11 Jun 2025 11:25:47 -0400 (EDT)
Received: from oitua-pc.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 070873D852DB;
	Wed, 11 Jun 2025 11:25:47 -0400 (EDT)
From: Osose Itua <osose.itua@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Osose Itua <osose.itua@savoirfairelinux.com>,
	Anakin Childerhose <anakin.childerhose@savoirfairelinux.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] toaster.bbclass: fix toaster error caused by tabs in BBLAYERS
Date: Wed, 11 Jun 2025 11:24:22 -0400
Message-ID: <20250611152422.4038356-1-osose.itua@savoirfairelinux.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 15:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218456

Users may unknowingly put tabs in BBLAYERS instead of spaces, and this is
interpreted as a literal "\t" at the start of the filepath which causes
_get_layer_dict() function to fail at finding the filepath.

Instead of using split(" "), which restricts it to split on just spaces
replace with split() as this handles spaces, tabs and newlines.

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

Fix by using split() instead of split(" ").

Suggested-by: Anakin Childerhose <anakin.childerhose@savoirfairelinux.com=
>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Osose Itua <osose.itua@savoirfairelinux.com>
---
changes in v2:
- Remove use of .replace("\t", "") from v1 patch in toaster_layerinfo_dum=
pdata()
- Use split() instead of split(" ") to handle spaces, tabs and newlines
---
 meta/classes/toaster.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 03c4f3a930..af7c457808 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -84,7 +84,7 @@ python toaster_layerinfo_dumpdata() {
=20
     llayerinfo =3D {}
=20
-    for layer in { l for l in bblayers.strip().split(" ") if len(l) }:
+    for layer in { l for l in bblayers.strip().split() if len(l) }:
         llayerinfo[layer] =3D _get_layer_dict(layer)
=20
=20

