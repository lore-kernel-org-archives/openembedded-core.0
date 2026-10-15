Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07504CCA464
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 19:07:14 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5364.1792091224302995763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 12:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=P1wfyKl6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202610151907002f8044e475000207f2-vvvyec@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202610151907002f8044e475000207f2
        for <openembedded-core@lists.openembedded.org>;
        Thu, 15 Oct 2026 21:07:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=lBXjmn+65nQ4Wqx/eDWpI9p5ZiHJ034o0ypFlXF428o=;
 b=P1wfyKl6RllfBQ6qMNTVtyNsicZjLkNLRuwpStQ5MWcasXkec3aGvYfKc3BoDH1kCvifBO
 ULwrms1g9gKPJwUv9gwu7pL227RwtclrEWx3cAbuabG1pk9RuYSihUj+foO2ykVOObZwxy3M
 CEuveiy5vN6MbGS5x09Rps396gnpu6B/D6MOltkIvmzjKpo5RJJjPzhBdG5N5UDtc53YtoD2
 UUWT/a0eVuyn9vRunUTSQHrQ08Xh3eWs0NY4U9V2C7/3PuKBWVKngLUO7Mtl6aqhAQz/7ewl
 S9Oo4+/0r3YDR6DYdf06I/sg9AD1IJYDnmqtBFb5jUkeZBFaW2BMQkQA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] systemd: add iproute2-devlink runtime dependency to udev
Date: Thu, 15 Oct 2026 21:06:49 +0200
Message-ID: <20261015190649.3380415-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 19:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247893

From: Peter Marko <peter.marko@siemens.com>

Service file ${nonarch_libdir}/udev/rules.d/81-net-bridge.rules executes
/usr/sbin/devlink which causes errors seen in journal on systems which
don't install this package explicitly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd_262.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.bb
index d613f01c58..46ef655420 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -772,6 +772,7 @@ FILES:libsystemd-shared = "${libdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
+RDEPENDS:udev += "iproute2-devlink"
 RDEPENDS:udev-bash-completion += "bash-completion"
 RDEPENDS:udev-hwdb += "udev"
 

