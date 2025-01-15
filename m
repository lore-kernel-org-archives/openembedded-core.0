Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F650C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:35:54 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.22589.1736951748351056577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GcsnhjM8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202501151435449a56bb0c25517dbee5-erbso4@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202501151435449a56bb0c25517dbee5
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jan 2025 15:35:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1K948dHL8G6qcOa4zmJrdNHqTuh0myk5ntvTcjMmuE4=;
 b=GcsnhjM8H7wPkL6Lta1VAXQQ6SwNKJmfP4+dMaDAmOx7PRbxDGaI2L0pQ7uUMkKxazvpw4
 bBmhPovlPg2I4KWraGNf+Zr17/hZCaITfyxTWqd6MTBm4gnMwrWfeycUV4iNO/VsBbhS+PyG
 eEkGg+3IafV6UY0fPiQZClaxb3C57sNUi5IcaTUKyxi6HKEFLIFJiMrUXlajuH0F/mMPl2Qc
 T4EW/S55YCdBiRP5evnKcZjYQLjLXnMPawCrj/yAGHQGi/vA9KKHaw1PN9/2BYC2xJ2UPf1z
 j0+ZNTCGutVSo025YVKItUPG9n3WZfDfsxSIN4ToYMnccJoAAFrDdHwQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 0/1] backport raw ssh output patch
Date: Wed, 15 Jan 2025 15:34:42 +0100
Message-Id: <20250115143443.24741-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209903

Currently we see following warning if testimage fails on scarthgap:
WARNING: some-image-sdk-1.0-r0 do_testimage: Can not retrieve artifacts from test target: OESSHTarget.run() got an unexpected keyword argument 'raw'

https://git.openembedded.org/openembedded-core/commit/?h=scarthgap&id=8b5c66c91d94f4c8521fe9443e65d86063dba5e5
backported to scarthgap uses code:
(status, output) = target.run(cmd, raw = True)
This code requires support for argument raw, which needs to be
backported, too.

Alexis Lothoré (1):
  oeqa/ssh: allow to retrieve raw, unformatted ouput

 meta/lib/oeqa/core/target/ssh.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.30.2


