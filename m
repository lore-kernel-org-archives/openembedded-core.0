Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9FAEB28F4
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:50:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7203.1770367809039371796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:50:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z2fb1CWu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 56333C22F44
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 08:50:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE25560729
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 08:50:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66FCB119D1A60;
	Fri,  6 Feb 2026 09:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770367806; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=al7zbKS6sCuUvZEuZ+iBxk4Xey9SIz3h/YF5Xa0EZrA=;
	b=z2fb1CWuEWUxUKCM5WDexJ764R0G4C6umgiK8AvUylgt07qu+G/SkyPu8jw6XD071zYhCJ
	th7nz8jbqZb8r13Wdgws5xNwUZgB6BrSmPR/nfxy/3T06fOWhN67xJWF7yeUuVTbXKdK59
	HnyI8EIYxkqkZOyH7OZqnQkSbCH42fp7v0tdFX5Gpcft7K/1sJTp81sH4JEAMazynBoAO8
	niTH6eDh8LOpEO87F2wmMuVmrLxCwtLHwR7KvNybpl23O/IqKL0l24HFDqO2lPSRua1K4q
	k5zryPjG9C86c84GnTmMqzmLiihBh45J146PXCG3nZ8k9vHWDFzAcU8+X+4+iA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 06 Feb 2026 09:49:56 +0100
Subject: [PATCH] openssh: replace hardcoded paths by standard paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-fix-openssh-hardcoded-paths-v1-1-5f6f91b8b2f5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTsQI63Vq4iLmPw14yIJmSpC6
 d0b6/KDx1tIUQVK126hio+o5NRwPHTko0tPsIRmssYOxpqBJ/lyLkiqkaOrweeAwMXNUfkyYvS
 nc9/DTNQOpaLl+/12/1vfjxf8/FvSum6LTtJ5fwAAAA==
X-Change-ID: 20260206-fix-openssh-hardcoded-paths-98e8c3755e0f
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1236;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vaknhHRrMSzuo6RSlPdxd/BDlezjgbLmL1tVA9xdzUE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBphas9hRU9dceG30icydsC9Dm5iaO5oVebQ3NA6
 ab8H9o+FJ6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaYWrPQAKCRDRgEFAKaOo
 NpI3EACcX8SxrKgyoO2wMynLVZ3zXl5nxeiDAdYHnJqULJv/a4qf4vwxPAOD3t8Ecr+11qM/sYb
 JUgdvk/3du+R4a3a5ejjLR8pIKxkqCdp6ugdv/MpRqprL23O2vAl1gQXBzauZoWBV5pTosJz/kU
 r81nu6xrRYtZ9T/TmvKBA9TrBPF297yZdvRTVEQIbGNJ95MO0teTfuIwsjgdsRRpXaSX3NZy2T0
 u0uG8W5XGemyIxC4Hm5MxrPdyfeLCVHntQSTDdnmMRiothOL0q2gml5REQFWdoBUy5+V4zCVixL
 p7yAMI8ChVKspOFrlRVLC0gbGTdgNgS693MIr97aE2F7+sJON7tG5xiOQH1R00uqUMw/MwEnBd3
 d6XJ8mC83t7HDeiprTS/VFxcXoQ5Z/aUUeEPiWAhKiv8OFY9xKyNxSbRJ5dz7RLX93VN9qt7W2q
 Ao9ZF8TBTnTAjpYlJ2Egl9Cj5DuKX5olgIneAYIR2txok29zpvwJFMqW/zkVkNp5Id8Ht4wY0O+
 kNULAtpv/3MuUhVp8SaqAL5Xf74/ubihavA2NwxGbuZvFM8d+Kf0PbFsnOq/UXIGT+JX2awy5iU
 DZxyQhxForLnXyfHU7oYmT/tTdn/yvW4be5lo78jOcLPJvFeYM3IKOMcLEkCJ64cKQLPNeMh+po
 gvMFlaiPG0COytg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 08:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230599

Use common definitions from bitbake.conf instead of hardcoded values for
OPENSSH_HOST_KEY_DIR and OPENSSH_HOST_KEY_DIR_READONLY_CONFIG.

Fixes: addd80ddfd89 ("openssh: add variable for key path")
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/recipes-connectivity/openssh/openssh_10.2p1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
index d8ea487ae3a..929c9e4b9fb 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
@@ -100,8 +100,8 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
 CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
 
 # This allows overriding the key location
-OPENSSH_HOST_KEY_DIR_READONLY_CONFIG ?= "/var/run/ssh"
-OPENSSH_HOST_KEY_DIR ?= "/etc/ssh"
+OPENSSH_HOST_KEY_DIR_READONLY_CONFIG ?= "${localstatedir}/run/ssh"
+OPENSSH_HOST_KEY_DIR ?= "${sysconfdir}/ssh"
 
 do_configure:prepend () {
 	export LD="${CC}"

---
base-commit: 6ce19709f7835ee5cd7915e181f89397975236c8
change-id: 20260206-fix-openssh-hardcoded-paths-98e8c3755e0f


