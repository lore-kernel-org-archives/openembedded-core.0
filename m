Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC75C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 07:06:00 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.100494.1712559958926234520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 00:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=oef/ptLV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240408070555f84d88682b9918a7e0-vh1ujf@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240408070555f84d88682b9918a7e0
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Apr 2024 09:05:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=W76MIj5JdvFSceJJ3LnUPQW8oRXVbFDSwydFtZhgp6s=;
 b=oef/ptLV7qFFc8w9fgQd59q6o7MfnGFhMt1RcnTNamSuD0uCGXZZ6Xt17aHhV3QMDpW9t1
 4A/cBVxrUWidxg8MccSjMVKbRz2FGTrJ/Ni7eTKOCWOlKU+W6Fn89LIkKylTLFPGt9RzIc9u
 K2SwLpf39ve2jvb9376iFtvv1cah0=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] systemd: make predictable name mac policy opt-out
Date: Mon,  8 Apr 2024 09:04:50 +0200
Message-Id: <20240408070450.27686-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 07:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198005

From: Peter Marko <peter.marko@siemens.com>

Even the patch says it's inappropriate for upstream,
and it's also inappropriate for some downstream projects, too.
So make it possible to opt-out on it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd_255.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index 8a816c4bc1..17f28a9897 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -28,7 +28,7 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
-           file://0001-NamePolicy.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'predictable-if-mac', 'file://0001-NamePolicy.patch', '', d)} \
            "
 
 # patches needed by musl
@@ -88,6 +88,7 @@ PACKAGECONFIG ??= " \
     nss \
     nss-mymachines \
     nss-resolve \
+    predictable-if-mac \
     quotacheck \
     randomseed \
     resolved \
@@ -197,6 +198,7 @@ PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 PACKAGECONFIG[polkit_hostnamed_fallback] = ",,,,dbus-broker,polkit"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
 PACKAGECONFIG[pstore] = "-Dpstore=true,-Dpstore=false"
+PACKAGECONFIG[predictable-if-mac] = ",,,"
 PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode,,qrencode"
 PACKAGECONFIG[quotacheck] = "-Dquotacheck=true,-Dquotacheck=false"
 PACKAGECONFIG[randomseed] = "-Drandomseed=true,-Drandomseed=false"
-- 
2.30.2


