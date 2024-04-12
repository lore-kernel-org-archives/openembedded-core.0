Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D47BC04FFE
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 16:58:46 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.52518.1712941114867026384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 09:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=L5JDhmDT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240412165832692558c5954f78c87b-hvcp83@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240412165832692558c5954f78c87b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 12 Apr 2024 18:58:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+NvPsegLnQ93bTMs6cAIbog/DRIW3b7RTRPqb96aots=;
 b=L5JDhmDTbnlzsxqx4+K3/yAvxsSM2CPRYoKIibY66qYSEafUDzNiP5dDYWy31SaousDPpL
 FAHZEfL5gGAYElwJd10veDipzy8HAgGUlVERD/R39TN+vX/OX5UC91uNiGiaUn9sKTD43V8E
 AQjOBJr7+5sCOJXNvMqTYATjbRsNQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/3] kbd: split gpl-3 keymap to separate package
Date: Fri, 12 Apr 2024 18:57:12 +0200
Message-Id: <20240412165714.8951-2-peter.marko@siemens.com>
In-Reply-To: <20240412165714.8951-1-peter.marko@siemens.com>
References: <20240412165714.8951-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 16:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198179

From: Peter Marko <peter.marko@siemens.com>

Pine keymap was added with GPL-3 license.
https://github.com/legionus/kbd/commit/1589e9e1019756b5287b41dddcd7285271c5990e

Split this GPL-3 keymap and install it via recommendation
so it is easy to remove it by excluding recommendations.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/kbd/kbd_2.6.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.6.4.bb b/meta/recipes-core/kbd/kbd_2.6.4.bb
index 790055aa96..1a7b6b552b 100644
--- a/meta/recipes-core/kbd/kbd_2.6.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.4.bb
@@ -24,13 +24,16 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
 
 PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
 
-PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
+PACKAGES += "${PN}-consolefonts ${PN}-keymaps-pine ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
 
 FILES:${PN}-consolefonts = "${datadir}/consolefonts"
 FILES:${PN}-consoletrans = "${datadir}/consoletrans"
+FILES:${PN}-keymaps-pine = "${datadir}/keymaps/pine"
 FILES:${PN}-keymaps = "${datadir}/keymaps"
 FILES:${PN}-unimaps = "${datadir}/unimaps"
 
+RRECOMMENDS:${PN}-keymaps = "${PN}-keymaps-pine"
+
 do_install:append () {
     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)}" = "yes" ] \
     && [ -f ${D}${sysconfdir}/pam.d/vlock ]; then
-- 
2.30.2


