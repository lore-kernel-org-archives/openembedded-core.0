Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBA1C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 09:00:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34133.1790499633807670266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 02:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ix+QNShI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026092709003296b00528af00020755-uyvrj7@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026092709003296b00528af00020755
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 11:00:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9AH/2YtKUOiJskvvgkyKpSJdf6urinxpj4Dud++dYTs=;
 b=Ix+QNShIfKM+LWO51Bg6bkIb0FGCpQ5jMBoKGibRnD7/VE3wtUNbn0cVl3TNcsTkFruJOX
 0o4RS21c/vGFQkXcl66dEJL0S1jOZdXYbOuHFvy4iPgnyUdzewjdHT7xCIxzEGJt+B6y7vsn
 5uD9elcfQiZGXtogSLOvDstc6De/w6cQ2Lu8eRSuXYJStyf8X0Hz2FIQnxtvBX7yOpwfa9eN
 aAyDGykOBPLtIPFNxxFaw/VIUeOgjiZgjMEWBWiPDWusXGJJWP6wFVZstvKEV+2GiIr61zrt
 16lIQuZYwCt8TRivR8l8If49f+RiqSKsiRx9zSZHK1DDz+T59JQ2WsPg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 8/8] pulseaudio: set status for CVE-2020-15710 and CVE-2020-16123
Date: Sun, 27 Sep 2026 10:59:36 +0200
Message-ID: <20260927085936.114900-8-peter.marko@siemens.com>
In-Reply-To: <20260927085936.114900-1-peter.marko@siemens.com>
References: <20260927085936.114900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246686

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] and [2] these are Ubuntu specific CVEs.

[1] https://security-tracker.debian.org/tracker/CVE-2020-15710
[2] https://security-tracker.debian.org/tracker/CVE-2020-16123

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: d202f8cb555f04eda34eb2793c5802aac43f58cc)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a8a5a1e074..1df24bf04b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -297,4 +297,6 @@ RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
                                   '', d)}"
 
+CVE_STATUS[CVE-2020-15710] = "not-applicable-platform: specific to Ubuntu"
+CVE_STATUS[CVE-2020-16123] = "not-applicable-platform: specific to Ubuntu"
 CVE_STATUS[CVE-2024-11586] = "not-applicable-platform: specific to Ubuntu 16.04"

