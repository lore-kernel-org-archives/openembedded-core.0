Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6346C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:29:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1099.1785950959601981966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=APIbbb9+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202608051729178fa16fd31700020716-bsmee6@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608051729178fa16fd31700020716
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 19:29:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=C9X9UVVjP9DUK23tyL4VsfX3dTKtNbrvsgKCoZfh6nk=;
 b=APIbbb9+TcmheyXFiozbuiGkM2GWJcByr3KsFnTT0vDc1op3W3o70YSfWOged+8bwl6rnr
 nLyI+PJKAidV/DCGQ/jWrohQV4ycuE4K0OACEXSGNuSRX8ULpjG54f1t/l7L4OiNCJ1tmHB1
 ES92TTBlEloGvZ/aM/pFjesNk3N9E/lx9sQcANJFMz0Ed4a/bC+L6R7qMwO/jKzIU4rNftWn
 r8w5C4/bmUiWMdGqsshcN2DoEcsZqh75FkpBUyJ5c7k74+Uc7mdakziCeJse6GwIbyb7KVwv
 I6eJ1Sd4fFGCil0qOmtKywdAANTIRRjxdHcFuSxKz8yljHDgm6AVaPcg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/7] pulseaudio: set status for CVE-2020-15710 and CVE-2020-16123
Date: Wed,  5 Aug 2026 19:28:37 +0200
Message-ID: <20260805172840.202825-4-peter.marko@siemens.com>
In-Reply-To: <20260805172840.202825-1-peter.marko@siemens.com>
References: <20260805172840.202825-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242883

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] and [2] these are Ubuntu specific CVEs.

[1] https://security-tracker.debian.org/tracker/CVE-2020-15710
[2] https://security-tracker.debian.org/tracker/CVE-2020-16123

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 975929918f..c7690d0e18 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -299,4 +299,6 @@ RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
                                   '', d)}"
 
+CVE_STATUS[CVE-2020-15710] = "not-applicable-platform: specific to Ubuntu"
+CVE_STATUS[CVE-2020-16123] = "not-applicable-platform: specific to Ubuntu"
 CVE_STATUS[CVE-2024-11586] = "not-applicable-platform: specific to Ubuntu 16.04"

