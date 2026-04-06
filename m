Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A995FB5175
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 22:12:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66607.1775513516591621009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 15:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=cbeifGR5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260406221153cda5a852a100020760-glqycr@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260406221153cda5a852a100020760
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Apr 2026 00:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IL6pWSrSkB7eUOwiByHTaIEidz0YIwg8zyFUkkzrP/o=;
 b=cbeifGR5gcb1ZZB//kiu5/O0wH4TUsEU/xbpG9ZPMBUZuYqKb6KyEmUOdWxosH8GW4u/cs
 0WER/z6qfr2zAb7VB78YCjUMmKShVLnkq0J6sAapnSltnHBvrvvjjnHaae+QPU98lgGuIyzR
 j6WA7+ck5t/+gNpdU5fYJjgwlJc7WqV9VqIgPFKNcL3qI5EafDVMPqx8LTVHkU8tHZTWWTu7
 vmQV8tuwv7Z9+1GUJ/0Gs6SqXp/AyOynU+nVsdo30f79A+8mefcv/ctDKzjlTXYuj+1S+yfk
 VktPI/7J89AWs96B8L00uiJxnamB6l6ViCaA/FZeHvg0OkXoUtQsuWQg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/6] oe-selftest: devtool: GDB breakpoint after std::vector is constructed
Date: Tue,  7 Apr 2026 00:10:30 +0200
Message-ID: <20260406221133.2769152-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
References: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 22:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234690

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


