Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B00C5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:53 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1133.1787176907030495202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=P8TLC/tD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260819220144d0e0e5c9f80002079a-febe_5@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260819220144d0e0e5c9f80002079a
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0d7wl/WvSmWGtaa/PKeuZVaOtcmBCwvhFH5fBtTFSbQ=;
 b=P8TLC/tDKL3vRfRwyWgm1By/l+FBmstwAXLxo2rEDNOGwEq4CQSvFdmvKP99XIUbvFN95k
 DSEr+8K5hf9oM6CNn1XXlGwL7+itQETx6t/uwxPoxtaXIxQJEOSN3/j7i7iV6ILu/FRtwTrB
 2w3Ms0KibsRoJx28axpHNW/5Jl/zqidNjA0ILev6YTsdALmXjTwp+7u23LiiZfawsk3IvNeC
 LSD3rYBZOhiqBx7vIh8xLa5US1az5d9nnjR3qK+UmqNOWZq6pOWFiuwEYfqBRn0hIWuHkQW9
 Ye/AHVyxaxPRZWJlo7X0B9zG+5iIKPqLGDD/TcCxy6gJxNRvI0c86Bww==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 05/14] ccp-example: fix PID file handling
Date: Thu, 20 Aug 2026 00:00:12 +0200
Message-ID: <20260819220138.4095398-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
References: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 22:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243792

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


