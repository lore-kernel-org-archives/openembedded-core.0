Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9340CAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:20 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.12673.1758809174773334691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ulyXy9Ay;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250925140612c9da336b71000207f3-qbwe82@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250925140612c9da336b71000207f3
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kQkHbNuNqZ+TEbA+dqGJEwPVhLS/7TrSTPgP03DOnOo=;
 b=ulyXy9AyLAF1C8ZPGWIlVwOjHjVxocmbazEu4FlHmMqq5rPneVnp189pdxFOztk/fReAcW
 ZnIo0Zq6e7t6vf32M5bWE3nnAbcm+67aMN4BeTMUM0fevw0qCxxXY+ZdSgtl0u1nJUhc9bTi
 ZqQ8+/OCg054PHXcYvUS6TXRW+RM6LMD0kShEIBM68CxSelTAoXeby9eBGpH49IWvQlgWZbj
 ChPIkffvAhI9dUl6QhbwZ+1qmzJuOw7yQhvkXJP3N0lBphAaaKqrwVAdjhx9i8RKYR0OW2Wt
 EFfTOhfUKdOOx/IdxU+61LSmWEo9U/XXYcvPjC1sKgWgWygL2dIEqEEA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 04/10] pulseaudio: ignore CVE-2024-11586
Date: Thu, 25 Sep 2025 16:05:08 +0200
Message-Id: <20250925140514.1103300-4-peter.marko@siemens.com>
In-Reply-To: <20250925140514.1103300-1-peter.marko@siemens.com>
References: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224033

From: Ross Burton <ross.burton@arm.com>

As per the linked ticket, this issue is related to an Ubuntu-specific
patch that we don't have.

(From OE-Core rev: dc81fdc6bdf8ab39b7f2fd994d50256430c36558)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4708145bb96..9aa40a4779a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -282,3 +282,5 @@ RDEPENDS:pulseaudio-server += "\
 RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
                                   '', d)}"
+
+CVE_STATUS[CVE-2024-11586] = "not-applicable-platform: specific to Ubuntu 16.04"

