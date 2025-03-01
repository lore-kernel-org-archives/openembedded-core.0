Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B91C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 09:44:16 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.6029.1740822246757710923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 01:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Gm6mI2MH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202503010944025f452cc1c55d786e01-ob6d7j@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202503010944025f452cc1c55d786e01
        for <openembedded-core@lists.openembedded.org>;
        Sat, 01 Mar 2025 10:44:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rLq3zQ5QrCSE3DVmLPe3stwCXxJy5tDU98+sdGGNcdM=;
 b=Gm6mI2MH54W3jBgjV7Mih+A23VROj9k8L6Z0y4I1/WhO/2OFcrMoNMJXnpOphjnTyEw1q8
 Ij8I+UGbrUN3b90rNLOdxy97f/Qo28QLsDYTQVYjjvraNEnTCbWrk6Pc/7jnO4YZLWFcWCl5
 W5lwIXEZhvusDAzMehmxGAu/cPIb+muVNFWm3pR5AWXqbFtqvsrs2RdI+UXVPYXWiC8xmr7A
 V8+Bw2vLaeoD+UjhuQjRQ1EiGdw7E+9O9/uWpHrkhboV26EQiOj6rHoYQk+dlLpGznqxG4rZ
 I53AfVxBhs6YQ/6Xx+aySvTxHy5xPo1VLHmdmdfsUkAE6Y4P8oF/O8gA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][styhead][scarthgap][kirkstone][PATCH] puzzles: set CVE product
Date: Sat,  1 Mar 2025 10:43:03 +0100
Message-Id: <20250301094303.10707-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 09:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212092

From: Peter Marko <peter.marko@siemens.com>

CVE reports now show 3 CVEs for this component.
They are for "The Puzzles theme for WordPress" with cpe like
"cpe:2.3:a:themerex:puzzles:*:*:*:*:*:wordpress:*:*".

Setting vendor solves these false positives.
Vendor is set per git path "git://git.tartarus.org/simon/puzzles.git".
This may be wrong value, but since we don't support negative regex, this
is the best we can do now if we don't want to start marking all with
cpe-incorrect status one by one.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 677a9e291e0..df2491ec850 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -20,6 +20,8 @@ inherit cmake features_check pkgconfig
 
 DEPENDS += "gtk+3"
 
+CVE_PRODUCT = "simon:puzzles"
+
 do_install:append () {
     # net conflicts with Samba, so rename it
     mv ${D}${bindir}/net ${D}${bindir}/puzzles-net

