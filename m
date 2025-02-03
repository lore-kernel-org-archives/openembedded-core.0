Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55628C0219A
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:00:50 +0000 (UTC)
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
 by mx.groups.io with SMTP id smtpd.web11.91118.1738598448370553525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmrnW0ns3z6sD;
	Mon,  3 Feb 2025 17:00:47 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmrnV5NsKzlpj;
	Mon,  3 Feb 2025 17:00:46 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 03 Feb 2025 17:00:32 +0100
Subject: [PATCH RFC 4/6] patchtest: allow to not print summary
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-patchtest-v1-4-ef6ee5fcdd78@cherry.de>
References: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
In-Reply-To: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
 openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210663

From: Quentin Schulz <quentin.schulz@cherry.de>

The summary is printed even when quiet is passed if an error happens.
However, in the case when only one patch is passed to patchtest, this
summary isn't useful at all. That is the case for b4 with patchtest used
for b4 prep --check, where patchtest will be executed on each patch
individually so this summary will be redundant.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/lib/patchtest/patchtest_parser.py | 4 ++++
 scripts/patchtest                      | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/patchtest_parser.py b/meta/lib/patchtest/patchtest_parser.py
index 66c54628466b0234f8492f0a7d8ddbe59f5f7582..27ab1d464a58c5747f400921e8388029996d483b 100644
--- a/meta/lib/patchtest/patchtest_parser.py
+++ b/meta/lib/patchtest/patchtest_parser.py
@@ -73,6 +73,10 @@ class PatchtestParser(object):
                             action='store_true',
                             help='Only output error messages')
 
+        parser.add_argument('--no-summary',
+                            action='store_true',
+                            help='Do not output summary of tests')
+
         parser.add_argument('--log-results', 
                             action='store_true', 
                             help='Enable logging to a file matching the target patch name with ".testresult" appended')
diff --git a/scripts/patchtest b/scripts/patchtest
index 6efd69465ef8d8dc6fa459d05220ccd08ca28536..82ce665c1a5c950dfaf02cda9ed70b935a9bfe25 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -165,7 +165,9 @@ def run(patch, logfile=None):
     postmerge_resultklass = getResult(patch, True, logfile)
     postmerge_result = _runner(postmerge_resultklass, 'test')
 
-    print_result_message(premerge_result, postmerge_result)
+    if not PatchtestParser.no_summary:
+        print_result_message(premerge_result, postmerge_result)
+
     return premerge_result or postmerge_result
 
 def print_result_message(preresult, postresult):

-- 
2.48.1


