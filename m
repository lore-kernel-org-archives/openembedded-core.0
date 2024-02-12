Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DBCC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:50:29 +0000 (UTC)
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net [87.98.172.75])
 by mx.groups.io with SMTP id smtpd.web10.8077.1707749422103272272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 87.98.172.75, mailfrom: jonathan@joggee.fr)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.139.172])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4TYS702HNVz1DGQ
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6l449 (unknown [10.110.113.115])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AF9FE1FE04
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:19 +0000 (UTC)
Received: from joggee.fr ([37.59.142.101])
	by ghost-submission-6684bf9d7b-6l449 with ESMTPSA
	id EsuLHSswymV36wAAKvzQ+Q
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:19 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G00402eb4a9e-a97f-4796-b1aa-542fa2e2d2c1,
                    C9F09FF139978B9C7604C68D153D486573A97FEF) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
Message-Id: <CZ36N8IH0R6J.ZIQATXFYOO0W@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Mon, 12 Feb 2024 14:50:18 +0000
Subject: [PATCH v4 0/3] lib/oe/package: allow to scan extra directories for
 locale files
X-Ovh-Tracer-Id: 3470867938164935803
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudefgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpedvgeduteeghfelieeltdehleetgfejhfegfeevhefhffeiuddtvdevteekteekffenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195339

Hi,

Following advice from Ross Burton, here is a new version of the patches to allow scanning extra directories for locale files.

Just to remember the full story, playing with cups I observe the main package includes localized HTML templates in ${datadir}/cups/templates. Locale packages were only looking for files in ${datadir}/locale. This serie of patches allows to add extra directories to be scanned.

Following Ross comment, now the directories to be scanned for locales are defined in the LOCALE_PATHS variable containing ${datadir}/locale by default. Recipes may then add extra paths to this list or even overrides it completely e.g. cups now adds ${datadir}/cups/templates.

Regards,
Jonathan GUILLOT

Jonathan GUILLOT (3):
  lib/oe/package: replace in place PN-locale-* packages in PACKAGES
  lib/oe/package: add LOCALE_PATHS to add define all locations for
    locales
  cups: use LOCALE_PATHS to split localized HTML templates

 meta/classes-global/package.bbclass |  1 +
 meta/conf/documentation.conf        |  1 +
 meta/lib/oe/package.py              | 36 ++++++++++++++++++-----------
 meta/recipes-extended/cups/cups.inc |  2 ++
 4 files changed, 26 insertions(+), 14 deletions(-)


base-commit: b0fdf0688109ba6b87840a0837bebee3d9a27089
-- 
2.43.0

