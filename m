Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD233FD8744
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 11:25:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73770.1773746727734805659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 04:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Kwm8jwBD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kory.maincent@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 74D00C55044
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75BA25FC9A
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:25:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1906B10450448;
	Tue, 17 Mar 2026 12:25:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773746724; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=C1he3MiHpPjfMhlVfd/r+ig8/OXDOi84P8yBF7n0UoA=;
	b=Kwm8jwBDhjLFAiHT5W3cnWizD9iiI2YuujD8lBbi6V+BY+xVaNVzxucy4omPTMhqnEmZHc
	mcl9sWsArZNV3vUTtXeDwDJgll8J4wISelLRmDj4F3sbcaz4+JxScBiYsKLvEA4AIsRKzt
	HxCx/aaAH7LT1meu1dzrGrWhoJ0Opx1Y6/3ElzBBfsGm6PrC1Q8J6t0aANM9cKoyeYS2py
	BtKaecsDs7WRsaY2i8Lu1tAoHG+6yYycI01nS2qsdA3EpHF6qE879Nk4RiUPFeDaiP8/Py
	ppgFp6ES2ECJVnFCA7aPQT36JyuIB4sfWR8iWDEV692CbNpoAH43Ww/L+MkKEA==
From: Kory Maincent <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [OE-core][PATCH] default-providers: switch pkgconfig provider to pkgconf
Date: Tue, 17 Mar 2026 12:24:07 +0100
Message-ID: <20260317112407.312819-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233317

pkg-config has been unmaintained since 2017. Major Linux distributions
such as Fedora, Debian, Alpine, and Arch Linux have all switched to
pkgconf as their default pkg-config implementation. Upstream projects
no longer use or recommend pkg-config. There is no reason for Yocto
to keep lagging behind and continue using a dead tool.

Switch the preferred providers for pkgconfig, nativesdk-pkgconfig and
pkgconfig-native to pkgconf, aligning with the broader ecosystem.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

There is also the question of the pkgconf wrappers:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/pkgconf/pkgconf

Should we keep making pkgconf emulate the legacy pkg-config behavior?
At this point, projects have had sufficient time to adopt native pkgconf
compatibility, so it may be worth dropping the wrappers and letting
pkgconf behave as its own tool.
---
 meta/conf/distro/include/default-providers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
index 5101ad78f8..c0a5d1c75e 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -56,9 +56,9 @@ PREFERRED_PROVIDER_getopt ?=3D "util-linux-getopt"
 PREFERRED_PROVIDER_openssl ?=3D "openssl"
 PREFERRED_PROVIDER_openssl-native ?=3D "openssl-native"
 PREFERRED_PROVIDER_nativesdk-openssl ?=3D "nativesdk-openssl"
-PREFERRED_PROVIDER_pkgconfig ?=3D "pkgconfig"
-PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D "nativesdk-pkgconfig"
-PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-native"
+PREFERRED_PROVIDER_pkgconfig ?=3D "pkgconf"
+PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D "nativesdk-pkgconf"
+PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconf-native"
 PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
=20
 PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
--=20
2.43.0


