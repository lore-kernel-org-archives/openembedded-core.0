Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406311088E49
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:38:33 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27347.1773873511005508456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 15:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=DQfuxRMv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202603182238277a62e978e3000207f2-5x4upi@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202603182238277a62e978e3000207f2
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Mar 2026 23:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IL6pWSrSkB7eUOwiByHTaIEidz0YIwg8zyFUkkzrP/o=;
 b=DQfuxRMvk0GyypDvN8c++P7kCJtsl6+M7GefDO4ZHIvjvC09MDayHqJp9zZ/+ZVncQ90zp
 tlgbQQVTDPhRP0iHHEE/99jDli+jXmUts8R0uhdiOgslLU3hl8wnkfjG19neK7aQUZoM9jFT
 ARO1v2pcq5alx91GhYXKU6dVVviOYiRLwTtNWD7/M+6W74+u++N5eF4J12hFVPHoyg7rKzpR
 W4pxtJLApnbJiEIC6087O/bTwhrrTzlssvqwIZ/T5l9dJin3U2EFC81yAjyJUbX9GfdvLiva
 +6AVsTT1m/3biNLGHVHhZvScy2hpWaIT6i4c2QJyJvsSHXbB5EUZWOWg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/9] oe-selftest: devtool: GDB breakpoint after std::vector is constructed
Date: Wed, 18 Mar 2026 23:36:10 +0100
Message-ID: <20260318223736.3414885-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
References: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233443

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Change the GDB breakpoint from line 55 to 56 in cpp-example.cpp so that
the std::vector constructor has already executed when GDB stops. This
ensures that inspecting the vector with GDB works as intended also with
older GDB versions (e.g. on scarthgap).

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 9d8ffcc786..297dda7457 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2772,7 +2772,9 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
         # check if resolving std::vector works with python scripts
         gdb_batch_cmd += " -ex 'list cpp-example.cpp:55,55'"
-        gdb_batch_cmd += " -ex 'break cpp-example.cpp:55'"
+        # Break on line 56 (the std::cout after the declaration) so the vector
+        # constructor on line 55 has already run when GDB stops.
+        gdb_batch_cmd += " -ex 'break cpp-example.cpp:56'"
         gdb_batch_cmd += " -ex 'continue'"
         gdb_batch_cmd += " -ex 'print numbers'"
         gdb_batch_cmd += " -ex 'continue'"
-- 
2.53.0


