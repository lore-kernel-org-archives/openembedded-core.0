Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B537BC5DF7D
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15979.1786909295040431476
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=OaWg3sop;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-2026081619413291bd11458d0002074f-rwbn1n@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026081619413291bd11458d0002074f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0d7wl/WvSmWGtaa/PKeuZVaOtcmBCwvhFH5fBtTFSbQ=;
 b=OaWg3sopgzcxNmdf+Fp+zE2Mjq0lfkXoc53UIgm/MqB1CA00b35aAXbeWdsXLbnQBToUpO
 yAoXAknu/RLswPWe1O5C+IMxBiHElAVT8ehI0cyinSwPmYyjVdEB/d+dHlJVKTKXNY9wy2aD
 M+Mw0Ap6/3BXmtzI4wttiJEZTOD0qaKw4DnKsV9oEOZHIelaY53Iq73JU292cii8AG2BdKjQ
 85Hk/gEgSTT4bAVRGct7aP+hSYqHIhxoWU+ty2XyWZ8dtOJHDWvtI1Q35p0wWl55fcBMFW+r
 i2FOr4j1H2uwzyAWjFlIPzx1W2uZQocEXwWpxA6olhG+sVvrLpZB5SFA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 06/14] ccp-example: fix PID file handling
Date: Sun, 16 Aug 2026 21:40:49 +0200
Message-ID: <20260816194127.86607-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243553

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Remove the PID file if the process is not running anymore.
This can happen when a debugger kills the process it debugs.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/files/cpp-example.init | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-selftest/recipes-test/cpp/files/cpp-example.init b/meta-selftest/recipes-test/cpp/files/cpp-example.init
index c154fd1126..30b8486eeb 100644
--- a/meta-selftest/recipes-test/cpp/files/cpp-example.init
+++ b/meta-selftest/recipes-test/cpp/files/cpp-example.init
@@ -14,6 +14,11 @@ PIDFILE="/var/run/$DAEMON.pid"
 LOCK_FILE="/var/lock/subsys/$DAEMON"
 
 start() {
+    # A debugger which kills the process it debugs leaves the PID file behind
+    if [ -f $PIDFILE ] && ! kill -0 $(cat $PIDFILE) 2>/dev/null; then
+        rm -f $PIDFILE $LOCK_FILE
+    fi
+
     if [ -f $PIDFILE ]; then
         echo "$DAEMON is already running."
         return 1
-- 
2.55.0


