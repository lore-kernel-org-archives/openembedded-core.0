Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618CBC5DF87
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 06:31:44 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3143.1787034700534743416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 23:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=XS15n8fK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202608180631386c6b7cbb610002077a-qnop2t@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608180631386c6b7cbb610002077a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Aug 2026 08:31:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0d7wl/WvSmWGtaa/PKeuZVaOtcmBCwvhFH5fBtTFSbQ=;
 b=XS15n8fKF6NclFOtiUsyJBPzikTt3NpHyD6opWV1KNI3l8M/in5p/FKDCIf7fr6eSWx0/q
 1AWC+Oy6Rk5p3pWQBlHKF5E6yryiwBgOPh1RgG5hb71vnzVmgiLfdkr/xRWI0kdCqNHsR6kO
 Y7P5i7Mnv+o5EA2dwsEMYGAhvFWCBTaNWz69cb2zB1Ed1U71KpXdCopKvWvW5ctapsgztrBA
 wThTlphFNJjWJhpGxwk6dQIQ9QuVZ5g4ZRsyGBNoC5fj9fdaOdNZ/DQOtaifka20yRf9pFQ/
 EgDT3ug8+NVz+xRkbQLau8d5oW3O8Owzvh6MdSYYt3Niq5mIyVHuvD3Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 06/14] ccp-example: fix PID file handling
Date: Tue, 18 Aug 2026 08:30:45 +0200
Message-ID: <20260818063120.73042-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260818063120.73042-1-adrian.freihofer@siemens.com>
References: <20260818063120.73042-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 06:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243658

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


