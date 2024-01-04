Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB43C47079
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 14:12:02 +0000 (UTC)
Received: from 11.mo581.mail-out.ovh.net (11.mo581.mail-out.ovh.net [87.98.173.157])
 by mx.groups.io with SMTP id smtpd.web10.54763.1704377519243891277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 06:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 87.98.173.157, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.2.55])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 0D02F26030
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 14:11:56 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dpg4v (unknown [10.110.178.62])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 87D611FE9F
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 14:11:56 +0000 (UTC)
Received: from joggee.fr ([37.59.142.95])
	by ghost-submission-6684bf9d7b-dpg4v with ESMTPSA
	id Krt6Dqy8lmUrPAAAEbo37A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 14:11:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001f6477be6-dba4-4049-9175-84a9097d1789,
                    E96084CFC6176DA275D818C0F1DD071750B22EF1) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
Message-Id: <CY5ZELISQPXO.2972IEN5YAX6A@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Thu, 4 Jan 2024 14:11:55 +0000
Subject: [PATCH v3 0/3] lib/oe/package: allow to scan extra directories for
 locale files
X-Ovh-Tracer-Id: 13595241378888944763
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepvdegudetgefhleeiledtheeltefgjefhgeefveehhfffiedutddvveetkeetkeffnecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 14:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193325

- Rename LOCALEEXTRADIRS to LOCALE_EXTRA_PATHS to improve readability
- Add documentation

----

Just playing with cups and observe the main packages includes localized HTML templates in /usr/share/cups/templates. Locale packages were only looking for files in ${datadir}/locale. This serie of patches allows to add extra directories to be scanned.
For a next patch, I would also like possible FILES:${PN}-locale-* variables defined in recipe not to be overriden by the split_locales() function.

Regards,
Jonathan GUILLOT

Jonathan GUILLOT (3):
  lib/oe/package: replace in place PN-locale-* packages in PACKAGES
  lib/oe/package: add LOCALE_EXTRA_PATHS to add extra locations for
    locales
  cups: use LOCALE_EXTRA_PATHS to split localized HTML templates

 meta/conf/documentation.conf        |  1 +
 meta/lib/oe/package.py              | 33 ++++++++++++++++++++++-------
 meta/recipes-extended/cups/cups.inc |  2 ++
 3 files changed, 28 insertions(+), 8 deletions(-)


base-commit: e1bffeab27b062884f6366cde24ce1c67e7ec03e
-- 
2.43.0

