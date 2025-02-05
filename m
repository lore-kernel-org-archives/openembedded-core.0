Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998B0C02199
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:05:48 +0000 (UTC)
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
 by mx.groups.io with SMTP id smtpd.web11.14155.1738767938660940041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 07:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yp3Sw6P0dznfn;
	Wed,  5 Feb 2025 16:05:36 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yp3Sw1ScQzSkc;
	Wed,  5 Feb 2025 16:05:36 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v3 0/2] add basic b4 config file
Date: Wed, 05 Feb 2025 16:05:22 +0100
Message-Id: <20250205-b4-support-v3-0-f8b1456ae1c2@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADJ+o2cC/22MQQ6CMBAAv0L27JptSwU9+Q/jodCt9AKkxUZC+
 LuFi5p4nElmFogcPEe4FAsETj76oc+gDgW0nekfjN5mBklSkxAVNiXG5zgOYUJBlpVQTqumghy
 MgZ1/7bPbPXPn4zSEeX8nsdm/myRQoOOqNNpp4uZ0bTsOYT5ahm2T5CeVpH5SiYR1WRPVxsozm
 +90Xdc3J9Rr4N8AAAA=
X-Change-ID: 20250117-b4-support-10de313f53b7
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 15:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210855

This adds very basic support for using b4 in OE-Core. This essentially
just automatically adds the proper mailing list when running b4 prep
--auto-to-cc.

This also adds the b4 wrapper script that poky will need to use in order
to identify which mailing list a patch needs to be sent to and do some
additional per-patch checks that aren't necessary when running from
vanilla OE-Core.

Once this is merged, poky will need to merge OE-Core into itself and
override with its own .b4-config that makes use of that script.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v3:
- populate To recipient list instead of Cc to follow what's asked in our
  READMEs,
- put yocto-docs ML in Cc if there's a patch to bitbake/doc directory,
- the wrapper script needed to be adapted to handle both Cc and To
  recipient lists,
- explicit that an address can only appear once and the recipient list
  it'll make it to is the one appropriate for the first patch that needs
  to be sent to it,
- Link to v2: https://lore.kernel.org/r/20250203-b4-support-v2-0-848008ad29ea@cherry.de

Changes in v2:
- add mention to first patch that running patchtest for b4 prep --check
  is what we're eventually aiming for,
- add poky b4 wrapper script (it used to be in the patch series for
  poky, c.f. https://lore.kernel.org/poky/20250123-b4-support-v1-1-4841f52eccbb@cherry.de/T/#m95d6aa25cc42352416da477cf07d7b3cbd671231
- poky b4 wrapper script properly identifies patches with files modified
  in both OE-Core and other repos part of poky,
- poky b4 wrapper script pretty prints when there's more than one
  project modified by a script, instead of lazily printing a Python
  list,
- Link to v1: https://lore.kernel.org/r/20250117-b4-support-v1-1-fe74a5f50eb6@cherry.de

---
Quentin Schulz (2):
      add basic b4 config file
      scripts: add b4-wrapper for poky

 .b4-config                 |   3 +
 scripts/b4-wrapper-poky.py | 177 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+)
---
base-commit: 7e2d743e4809d6cbaa8e441dc42624eb65daad63
change-id: 20250117-b4-support-10de313f53b7

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


