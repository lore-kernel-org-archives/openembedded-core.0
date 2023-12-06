Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ED0C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:50:29 +0000 (UTC)
Received: from 18.mo561.mail-out.ovh.net (18.mo561.mail-out.ovh.net [87.98.172.162])
 by mx.groups.io with SMTP id smtpd.web11.8123.1707749422408314971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 87.98.172.162, mailfrom: jonathan@joggee.fr)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.2.211])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4TYS7043ylz1CR0
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6l449 (unknown [10.110.113.115])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 20F0B1FEC1
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:20 +0000 (UTC)
Received: from joggee.fr ([37.59.142.101])
	by ghost-submission-6684bf9d7b-6l449 with ESMTPSA
	id YC4lBiwwymV36wAAKvzQ+Q
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:20 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004713e14bd-f55a-4de9-b1e1-ac9940aaa94b,
                    C9F09FF139978B9C7604C68D153D486573A97FEF) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CZ36N8IH0R6J.ZIQATXFYOO0W@joggee.fr>
Message-Id: <CZ36N8IH1TRF.3LXKZ2C2DTGIN@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 6 Dec 2023 16:06:43 +0000
Subject: [PATCH v4 3/3] cups: use LOCALE_PATHS to split localized HTML
 templates
X-Ovh-Tracer-Id: 3471149414068587643
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 21
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudefgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecuffgrthgvuchinhcuphgrshhtucdlvddumdenucfjughrpegjkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeludeijeetvdevvedtgfehjefhtdehveehjefhjeejgefghefhffegtefhvdeukeenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195342

Localized HTML templates in /usr/share/cups/templates are now part of
locale packages.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 31f686cdfd..b70ba3ae58 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -110,6 +110,8 @@ CONFFILES:${PN} += "${sysconfdir}/cups/cupsd.conf"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/cups-config"
 
+LOCALE_PATHS += "${datadir}/cups/templates"
+
 SYSROOT_PREPROCESS_FUNCS += "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
 	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:' -e 's:cups_serverbin=.*:cups_serverbin=${libexecdir}/cups:'
-- 
2.43.0

