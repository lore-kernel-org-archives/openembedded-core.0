Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FDBC5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:40:47 +0000 (UTC)
Received: from 12.mo581.mail-out.ovh.net (12.mo581.mail-out.ovh.net [178.33.107.167])
 by mx.groups.io with SMTP id smtpd.web10.10696.1708695645229307141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 178.33.107.167, mailfrom: jonathan@joggee.fr)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.140.73])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ThB3b2rP6z15hM
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:43 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ts924 (unknown [10.110.113.248])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0C4C31FE91
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:42 +0000 (UTC)
Received: from joggee.fr ([37.59.142.109])
	by ghost-submission-6684bf9d7b-ts924 with ESMTPSA
	id T/nMMFqg2GWH6QMAedmf+A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:42 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S003cc979d02-e1d6-42d0-a363-1cbf97804dfb,
                    ADCDE1ADAEF6B8451492E3DEBD29E66FF06048D8) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
Message-Id: <CZCI1W6673HU.X4JQRJW1T18X@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Fri, 23 Feb 2024 13:40:39 +0000
Subject: [PATCH v2 0/2] lib/oe/package: fix LOCALE_PATHS scan to create locale
 packages
X-Ovh-Tracer-Id: 11554829269007010939
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeeigdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpedvgeduteeghfelieeltdehleetgfejhfegfeevhefhffeiuddtvdevteekteekffenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjohhnrghthhgrnhesjhhoghhgvggvrdhfrhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196079

Hi,

The main patch of the series ensures only the subdirectories of paths added to LOCALE_PATHS are scanned to construct the locale packages. Without the check, the CUPS recipe creates packages such as cups-locale-add-class.tmpl because of file /usr/share/cups/templates/add-class.tmpl existence.

New version now also includes a patch for the glibc-locale recipes and its /usr/share/locale/locale.alias file. Until now, the file was added to a package weirdly named glibc-locale-locale.alias package. It was automatically created by the split_locales() function during the do_package step. Now, even if the file is explictly included in a new glic-locale-alias package. Without such a patch, the glibc-locale recipe was also broken by the main LOCALE_PATHS fix.

Regards,
Jonathan GUILLOT

Jonathan GUILLOT (2):
  glibc-locale: add an explicit dedicated package for locale.alias file
  lib/oe/package: fix LOCALE_PATHS scan to create locale packages

 meta/conf/documentation.conf             |  2 +-
 meta/lib/oe/package.py                   | 14 +++++++++-----
 meta/recipes-core/glibc/glibc-locale.inc |  3 ++-
 3 files changed, 12 insertions(+), 7 deletions(-)


base-commit: 4c45f975310184a773b25b8e7d7ef50fba2f7bd6
-- 
2.43.2

