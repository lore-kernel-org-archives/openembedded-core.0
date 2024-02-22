Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A69C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 19:45:20 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.22762.1708631110230754347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 11:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=gYRqG9MD;
 spf=pass (domain: protonmail.com, ip: 185.70.43.16, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1708631108; x=1708890308;
	bh=SxHNSQsWQFbjpYQxtg/lQGxp4cacId6XM+OoXXhoHrk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gYRqG9MDdszORDMhUHfCAWd5/mpHnVDAVC1cRbrwFAfaYcdsiKiZs9OKE8IcMJ8Ns
	 QiTleyuxdgjIyDZcLx2KOySXmuv6amtmrAt9KtTtLKsexoJ2bQusUUPtqGa8TP7U+T
	 0kC8oEaEimNmTwQiUeyyvGcrLyOeO5SnXDv/9/HvXAAFaQn1N1Na2uh/JXxSAX11VL
	 Ds05EROGh37lE/nZdABxrEBoJX+2Lrggjbfxuq+3UPIRYkJqHfpdmChbdBycgINeyC
	 yUyAGe5qWvxUyBBdizPD1CnP9zkB+7NAJ8jFRvKSmcxwGLkknteQkoDaAIZjBQrj6G
	 UhNPcmrFS3Bdw==
Date: Thu, 22 Feb 2024 19:44:59 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: emkan@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH] bluez5: remove configuration files from install task
Message-ID: <20240222194449.192209-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 19:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196040

Since be0e796299b0 ("build: ship all config files with
--enable-datafiles") in bluez, installing input.conf and network.conf
has been redundant, as the bluez5 recipe already includes
--enable-datafiles.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index e10158a6e5ea..a31d7076ba80 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -87,14 +87,6 @@ do_install:append() {
 =09install -d ${D}${INIT_D_DIR}
 =09install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
=20
-=09install -d ${D}${sysconfdir}/bluetooth/
-=09if [ -f ${S}/profiles/network/network.conf ]; then
-=09=09install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir=
}/bluetooth/
-=09fi
-=09if [ -f ${S}/profiles/input/input.conf ]; then
-=09=09install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bl=
uetooth/
-=09fi
-
 =09if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
 =09=09sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d=
/bluetooth
 =09fi
--=20
2.43.2



