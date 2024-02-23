Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5712C54E41
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:40:47 +0000 (UTC)
Received: from 13.mo550.mail-out.ovh.net (13.mo550.mail-out.ovh.net [178.33.253.128])
 by mx.groups.io with SMTP id smtpd.web11.10638.1708695645486873986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 178.33.253.128, mailfrom: jonathan@joggee.fr)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.9.185])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ThB3b4qkjz1J22
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:43 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ts924 (unknown [10.110.113.248])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3F07E1FEBB
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:43 +0000 (UTC)
Received: from joggee.fr ([37.59.142.109])
	by ghost-submission-6684bf9d7b-ts924 with ESMTPSA
	id wG+pDVug2GWH6QMAedmf+A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:43 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S0035ea4b485-1a48-41b5-8b0a-95ba7946b9bc,
                    ADCDE1ADAEF6B8451492E3DEBD29E66FF06048D8) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CZCI1W6673HU.X4JQRJW1T18X@joggee.fr>
Message-Id: <CZCI1W667B90.1ILUHXMGAWBP1@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Fri, 23 Feb 2024 09:51:45 +0000
Subject: [PATCH v2 1/2] glibc-locale: add an explicit dedicated package for
 locale.alias file
X-Ovh-Tracer-Id: 11554829270377172091
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeeigdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepjgfkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepleduieejtedvveevtdfgheejhfdtheevheejhfejjeeggfehhfffgeethfdvueeknecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhonhgrthhhrghnsehjohhgghgvvgdrfhhrpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196080

Until now, ${datadir}/locale/locale.alias file were automatically added
to a weird glibc-locale-locale.alias package by split_locales() during
do_package task.
Create an explicit package name in recipe for this file.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/recipes-core/glibc/glibc-locale.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 289f58d4df..c63c9edd76 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -28,7 +28,7 @@ LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
 PROVIDES = "virtual/libc-locale"
 
-PACKAGES = "localedef ${PN}-dbg"
+PACKAGES = "localedef ${PN}-dbg ${LOCALEBASEPN}-locale-alias"
 
 PACKAGES_DYNAMIC = "^locale-base-.* \
                     ^glibc-gconv-.* ^glibc-charmap-.* ^glibc-localedata-.* ^glibc-binary-localedata-.* \
@@ -61,6 +61,7 @@ DESCRIPTION:localedef = "glibc: compile locale definition files"
 # Explicitly add ${MLPREFIX} for FILES:glibc-gconv.
 FILES:${MLPREFIX}glibc-gconv = "${libdir}/gconv/*"
 FILES:localedef = "${bindir}/localedef"
+FILES:${LOCALEBASEPN}-locale-alias = "${datadir}/locale/locale.alias"
 
 LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
-- 
2.43.2



