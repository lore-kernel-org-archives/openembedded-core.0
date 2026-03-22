Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196E0FC72DC
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 15:13:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32198.1774192414256260630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 08:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=IS/pIcjf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202603221513310e9edfcd7d00020737-5ajnyj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202603221513310e9edfcd7d00020737
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Mar 2026 16:13:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IL6pWSrSkB7eUOwiByHTaIEidz0YIwg8zyFUkkzrP/o=;
 b=IS/pIcjf6deeDohACqOQawPMCbFUvlX62dRYxf1tazdwcy5QefAP02mpxyt5m9kuqVF5o/
 1gJ1cVKY8DAoDyJS1haA+1U//Emz8OQUMpWfp3Uu7A4H4V4W3R6vLkhMYf3rIElOe7lXkR9a
 jyMUmt4riwq/pPH4RkIrcCJseKEFBO7dHpSO45sNdeIYt8Zvt0yVIw2EwACT7MaKE0AzI2i4
 xjZIA5s20Vt3ZvGR+9Wa6tPXgraYh+JBJ6R3Uvoor+BvvsqHN964ePZJe+NOIiUQkdJ6rtbF
 ACBOEVLRuagZNxbt5Dlgvtq1JPbGs/dOSQk+crMeaCC4SeJO06SSVb7Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/9] oe-selftest: devtool: GDB breakpoint after std::vector is constructed
Date: Sun, 22 Mar 2026 16:12:53 +0100
Message-ID: <20260322151320.661246-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260322151320.661246-1-adrian.freihofer@siemens.com>
References: <20260322151320.661246-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 15:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233674

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


