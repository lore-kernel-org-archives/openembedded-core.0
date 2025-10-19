Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F15CCD195
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 16:44:57 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.58.1760892291714497025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 09:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=IB5F57ix;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20251019164447ab29ce0a380002075c-kn6umb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251019164447ab29ce0a380002075c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 19 Oct 2025 18:44:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=U4gZQbUp4rmqAOrAJ4i3urHdg6XNfj5/g8DC+ckbIcg=;
 b=IB5F57ixixy2nWD/zExB3E6shcAY1v3tHRtsyAbNrwEic+Urlk1dQ1TloaX9jNaSWgsY0P
 2m6aYvoNax8yPxaASCiGzXsCrKo8cc2sZBXaCU25BurGWE+bDEiQL8qjp5CbG37w9g8z4Pd4
 8PQSI2izEtY/nd92shnQc5umbV+uS/8zqBj09qQFpbLhurUcEueyhFuWbH4Rdds4oMHK+bNp
 SaSBrAX9VakQahMcY/wy2GpPeyEu0zvxUN5NrTS6utj8rhuB1iMyS+WAgGuq+E8TEn7tMeXJ
 LlaR5f1pR0vR9Lxgz1HKK7E3afgoAPD73sYsYBs/xuY6ak7JXdZgPGuA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: kavinaya@qti.qualcomm.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] oe-selftest: fitimage: fix req_its_fields last field_index
Date: Sun, 19 Oct 2025 18:44:11 +0200
Message-ID: <20251019164435.3794482-2-adrian.freihofer@siemens.com>
In-Reply-To: <20251019164435.3794482-1-adrian.freihofer@siemens.com>
References: <20251019164435.3794482-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 16:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225087

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The last enrty of req_its_fields was not taken into account and the test
passed even if the last entry was not found in the its file.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 195b9ee8b59..9c2e10dd2bf 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -297,14 +297,16 @@ class FitImageTestCase(OESelftestTestCase):
         if req_its_fields:
             field_index = 0
             field_index_last = len(req_its_fields) - 1
+            found_all = False
             with open(its_file_path) as its_file:
                 for line in its_file:
                     if req_its_fields[field_index] in line:
                         if field_index < field_index_last:
-                            field_index +=1
+                            field_index += 1
                         else:
+                            found_all = True
                             break
-            self.assertEqual(field_index, field_index_last,
+            self.assertTrue(found_all,
                 "Fields in Image Tree Source File %s did not match, error in finding %s"
                 % (its_file_path, req_its_fields[field_index]))
 
-- 
2.51.0


