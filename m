Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAF6C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:30:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146671.1783326637696025079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GU4zJTrb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260706083019fd14a2d86c000207ca-jznl44@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260706083019fd14a2d86c000207ca
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Jul 2026 10:30:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LL+KFR6HIOcgGs3FesjM9vPNnEF4KrRHC3VImywz3SU=;
 b=GU4zJTrbjcNElXLHmzhobIGH8ThslcdShtvvlPTwWhEfQI+i+DjaF92O0gAc2Ivay+wgS9
 oZ0e3ymXDpDShTxyPntKpDS1uiKb4R3T0ETZTY6ajI5BM5Ny5JbXxWieRP5l1E1HVW0kha6n
 Uwds185G08wUOqzN361A9GEfn3SK4je9RPcxyBGJT2PdCqjoCKFzfx53H1qcIvb9OZP3WNBt
 IBaDip09wP3si50wBJXcB1Ws25F+HNDQhKpX79zpGYyzNSguv+jjB/z7Br65XBtyfqpB6TmH
 tIYfGM2/0CKxBX9SQIb597JtGcAynXUBOTPxnQCpV9VhhjUnKFNDc1Bg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] flac: fix buildpaths with doxygen enabled
Date: Mon,  6 Jul 2026 10:30:09 +0200
Message-ID: <20260706083010.184735-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 08:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240221

From: Peter Marko <peter.marko@siemens.com>

When documentation is built, buildpaths errors occur.
There is one path to S and one to UNPACKDIR.
We can have a single sed rule to fix both.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index 2f43b4e84b..a667ea9f62 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -44,6 +44,6 @@ FILES:libflac++ = "${libdir}/libFLAC++.so.*"
 do_install:append() {
     # make the links in documentation relative to avoid buildpaths reproducibility problem
     sed -i "s#${S}/include#${includedir}#g" ${D}${docdir}/flac/FLAC.tag ${D}${docdir}/flac/api/*.html
-    # there is also one root path without trailing slash
-    sed -i "s#${S}#/#g" ${D}${docdir}/flac/api/*.html
+    # there are also some root paths in API titles
+    sed -i "s#${UNPACKDIR}#sources#g" ${D}${docdir}/flac/api/*.html
 }

