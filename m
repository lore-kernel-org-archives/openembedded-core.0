Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC73C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 14:15:12 +0000 (UTC)
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net [188.165.52.203])
 by mx.groups.io with SMTP id smtpd.web10.37076.1702476905197732941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 06:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 188.165.52.203, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.17.203])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 8742C304B2
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-j56hl (unknown [10.110.178.147])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 27D071FED0
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:02 +0000 (UTC)
Received: from joggee.fr ([37.59.142.106])
	by ghost-submission-6684bf9d7b-j56hl with ESMTPSA
	id wBMACWa8eWWtJQEAcHI1ww
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:02 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R006ada851b9-f30c-41fb-92af-d1bcbd321fd5,
                    8AE51020AAF3E055EAEAC9529530B6D231DC969C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CXN9OZ7FYB2C.Q33EONS2A1HX@joggee.fr>
Message-Id: <CXN9OZ7FZ2KV.2PZ94LWT7NCQ5@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 6 Dec 2023 16:06:43 +0000
Subject: [PATCH 3/3] cups: use LOCALEEXTRADIRS to split localized HTML
 templates
X-Ovh-Tracer-Id: 13575538128612953211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpegjkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeludeijeetvdevvedtgfehjefhtdehveehjefhjeejgefghefhffegtefhvdeukeenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192295

Localized HTML templates in /usr/share/cups/templates are now part of
locale packages.
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 31f686cdfd..560bd67cf6 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -110,6 +110,8 @@ CONFFILES:${PN} += "${sysconfdir}/cups/cupsd.conf"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/cups-config"
 
+LOCALEEXTRADIRS = "${datadir}/cups/templates/"
+
 SYSROOT_PREPROCESS_FUNCS += "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
 	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:' -e 's:cups_serverbin=.*:cups_serverbin=${libexecdir}/cups:'
-- 
2.43.0

