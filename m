Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9ACC4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 15:07:23 +0000 (UTC)
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
 by mx.groups.io with SMTP id smtpd.web10.38427.1702480039926472576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 07:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 178.33.251.173, mailfrom: jonathan@joggee.fr)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.176.72])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id A338C30F9D
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-s8sv4 (unknown [10.110.178.109])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 835AC1FE91
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000 (UTC)
Received: from joggee.fr ([37.59.142.102])
	by ghost-submission-6684bf9d7b-s8sv4 with ESMTPSA
	id SJRPH6XIeWXXtQAAm3lx3g
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R004c6886dec-77ea-4c21-84a6-624d53695faf,
                    8AE51020AAF3E055EAEAC9529530B6D231DC969C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CXNASYPMN4HU.28KB1ZM3347U5@joggee.fr>
Message-Id: <CXNASYPMO258.10FQBXN3ZW5G9@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Wed, 6 Dec 2023 16:06:43 +0000
Subject: [PATCH v2 3/3] cups: use LOCALEEXTRADIRS to split localized HTML
 templates
X-Ovh-Tracer-Id: 14457962178906360955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpegjkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeludeijeetvdevvedtgfehjefhtdehveehjefhjeejgefghefhffegtefhvdeukeenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192301

Localized HTML templates in /usr/share/cups/templates are now part of
locale packages.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
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

