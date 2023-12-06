Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E7AC4707C
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 14:12:02 +0000 (UTC)
Received: from 3.mo550.mail-out.ovh.net (3.mo550.mail-out.ovh.net [46.105.60.232])
 by mx.groups.io with SMTP id smtpd.web10.54765.1704377519594756156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 06:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.60.232, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.17.219])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 7EFA02D23A
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 14:11:57 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dpg4v (unknown [10.110.178.62])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 39BAE1FEC6
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 14:11:57 +0000 (UTC)
Received: from joggee.fr ([37.59.142.95])
	by ghost-submission-6684bf9d7b-dpg4v with ESMTPSA
	id +Fj+Ba28lmUrPAAAEbo37A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 14:11:57 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001374101e2-69ce-40fc-b90f-0ddbe4830e00,
                    E96084CFC6176DA275D818C0F1DD071750B22EF1) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CY5ZELISQPXO.2972IEN5YAX6A@joggee.fr>
Message-Id: <CY5ZELISRNG8.3467W96ZU2AUT@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 6 Dec 2023 16:06:43 +0000
Subject: [PATCH v3 3/3] cups: use LOCALE_EXTRA_PATHS to split localized HTML
 templates
X-Ovh-Tracer-Id: 13595522852447718523
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 21
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucffrghtvgcuihhnuchprghsthculddvuddmnecujfgurhepjgfkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepleduieejtedvveevtdfgheejhfdtheevheejhfejjeeggfehhfffgeethfdvueeknecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 14:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193327

Localized HTML templates in /usr/share/cups/templates are now part of
locale packages.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 31f686cdfd..d0b77823a9 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -110,6 +110,8 @@ CONFFILES:${PN} += "${sysconfdir}/cups/cupsd.conf"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/cups-config"
 
+LOCALE_EXTRA_PATHS = "${datadir}/cups/templates/"
+
 SYSROOT_PREPROCESS_FUNCS += "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
 	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:' -e 's:cups_serverbin=.*:cups_serverbin=${libexecdir}/cups:'
-- 
2.43.0

