Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7271CC433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 03:18:57 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.4003.1642043936192722269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 19:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=olYy2pJJ;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1642043936;
  x=1673579936;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ryQLGd9AVOP/TMvIY53+n9aDTRTLJSMzXmTOPvYE2mk=;
  b=olYy2pJJCWKrEetFMQkOpMoPeR687NelT+xQjnyMWBjG+AoC8AxZB45M
   X8cKSIOiaSzgu6gJ3i2pU8Vl2+Zo6QX2oBEE8i4XEdM2L9Vzbo2r2MC5r
   /4xC5TnKItzTw/en/b9Agh0Ki+P0+A4tocD2bJK5DKnHZvDD6PbE8hEHI
   or9S8t+AyIN1F6apd+JRoR+k/Udti3AJejRFRjnBfquOcGi4Zokw7zoJS
   rHeS0wW6BXFN3Ds4iGAYctYetE1+jQIEb1sVC7nFUzRJMaKSWsHpc9uft
   oij1vZSCGJ8rSqfVOBGlk21RKgqOQQDgA1ucsYI5HC/149k6fYpcb+HVg
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: Avoid a Python deprecation warning
Date: Thu, 13 Jan 2022 04:18:50 +0100
Message-ID: <20220113031850.3350-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 03:18:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160505

This avoids the following warning:

  WARNING: .../meta/recipes-core/systemd/systemd_250.1.bb: Var
  <do_install>:1: DeprecationWarning: invalid escape sequence \$

seen when doing `devtool finish --force-patch-refresh systemd meta`.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

I have no idea why the warning is only seen when doing `devtool 
finish`...

 meta/recipes-core/systemd/systemd_250.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_250.1.bb b/meta/recipes-core/systemd/systemd_250.1.bb
index b05905b764..4dd668833a 100644
--- a/meta/recipes-core/systemd/systemd_250.1.bb
+++ b/meta/recipes-core/systemd/systemd_250.1.bb
@@ -297,8 +297,9 @@ do_install() {
 
 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
 	# for existence else it fails
-	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
-		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
+	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ] &&
+	   ! ${@bb.utils.contains('PACKAGECONFIG', 'networkd', 'true', 'false', d)}; then
+		echo 'd /run/systemd/netif/links 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 	fi
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
 		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf

