Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003F3CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:26:58 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.313.1759951614531937302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WptrrIwu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251008192650d88e0a048b00020765-b7xb88@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251008192650d88e0a048b00020765
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 21:26:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+QdmdkUrQqPz/aKrWEgWijo79dZStKIxOCV0HpxIbiM=;
 b=WptrrIwuqQrFdFk20OIPVJ5Ap5OsNli2O8Ci/IrzT6+UMgG1W4TI2ip3t70gNGEcZuaZBX
 SDjdnOCjSbM6gn8voZ1qL3EZiy6OO23+NdDQzpDQQBXm+xXGcApQ1nbBzbcO9iU9+ZVl7R9i
 Hv9zsSVbq4ev2lB+D172i1a3ySyfE2yA5IbPL1nWKwScyriCqsMv96/gr5DSgJ9nRpAd2DwP
 YalHamqFSoMhvRxBUdyb2IZwjmwdta/7PoL0NeOOJR0YVCTYBdLHIt1Fc0oZ+clBkrjLpNsQ
 5kLU1sbaARsiTDKvQf78l52scLqtQlwHLKhh6MJxTScM+18PndoXmUEg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] pulseaudio: ignore CVE-2024-11586
Date: Wed,  8 Oct 2025 21:26:49 +0200
Message-Id: <20251008192649.1685209-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224592

From: Peter Marko <peter.marko@siemens.com>

As per the linked ticket, this issue is related to an Ubuntu-specific
patch that we don't have.

(From OE-Core rev: dc81fdc6bdf8ab39b7f2fd994d50256430c36558)

(From OE-Core rev: 72e63e44a0c6ad5a408c4dc59a24288c36463439)

Rewritten CVE_STATUS to CVE_CHECK_IGNORE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 7b9d245c07..58d0040459 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -281,3 +281,6 @@ RDEPENDS:pulseaudio-server += "\
 RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
                                   '', d)}"
+
+# not-applicable-platform: specific to Ubuntu 16.04
+CVE_CHECK_IGNORE += "CVE-2024-11586"

