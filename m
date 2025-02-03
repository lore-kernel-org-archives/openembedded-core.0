Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55574C02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:00:50 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
 by mx.groups.io with SMTP id smtpd.web11.91117.1738598448016768873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmrnV5SYFzQPj;
	Mon,  3 Feb 2025 17:00:46 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmrnV2SYQzm6Y;
	Mon,  3 Feb 2025 17:00:46 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 03 Feb 2025 17:00:31 +0100
Subject: [PATCH RFC 3/6] patchtest: allow to silence non-error messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-patchtest-v1-3-ef6ee5fcdd78@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210662

From: Quentin Schulz <quentin.schulz@cherry.de>

When passing --quiet to patchtest, TinFoil and Knotty will be silenced
so almost nothing makes it to stdout/stderr if not required (e.g. an
error happens).

patchtest configures its own logger to the ERROR level for the same
effect.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/lib/patchtest/patchtest_parser.py | 4 ++++
 meta/lib/patchtest/tests/base.py       | 2 +-
 scripts/patchtest                      | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/patchtest_parser.py b/meta/lib/patchtest/patchtest_parser.py
index 2a11cb76c2364e768bdb4c1fc050c84221428a4a..66c54628466b0234f8492f0a7d8ddbe59f5f7582 100644
--- a/meta/lib/patchtest/patchtest_parser.py
+++ b/meta/lib/patchtest/patchtest_parser.py
@@ -69,6 +69,10 @@ class PatchtestParser(object):
                             action='store_true',
                             help='Enable debug output')
 
+        parser.add_argument('--quiet', '-q',
+                            action='store_true',
+                            help='Only output error messages')
+
         parser.add_argument('--log-results', 
                             action='store_true', 
                             help='Enable logging to a file matching the target patch name with ".testresult" appended')
diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 919ca136bb469eee3e5af4b145e8293588728f84..7844e1c9e9f05e0a5c19eaaaa6a4267b10f96c0f 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -170,7 +170,7 @@ class Metadata(Base):
                 return tinfoil
             os.chdir(builddir)
             tinfoil = bb.tinfoil.Tinfoil()
-            tinfoil.prepare(config_only=config_only)
+            tinfoil.prepare(config_only=config_only, quiet=2 if PatchtestParser.quiet else 0)
         except bb.tinfoil.TinfoilUIException as te:
             if tinfoil:
                 tinfoil.shutdown()
diff --git a/scripts/patchtest b/scripts/patchtest
index 66a9f6470ca860c2233fb9ace042edf4b4737c88..6efd69465ef8d8dc6fa459d05220ccd08ca28536 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -139,7 +139,7 @@ def _runner(resultklass, prefix=None):
     # if there are no test cases, just quit
     if not ntc:
         return 2
-    runner = unittest.TextTestRunner(resultclass=resultklass, verbosity=0)
+    runner = unittest.TextTestRunner(stream=open(os.devnull, 'w') if PatchtestParser.quiet else None, resultclass=resultklass, verbosity=0)
 
     try:
         result = runner.run(suite)
@@ -243,6 +243,8 @@ if __name__ == '__main__':
     # set debugging level
     if PatchtestParser.debug:
         logger.setLevel(logging.DEBUG)
+    if PatchtestParser.quiet:
+        logger.setLevel(logging.ERROR)
 
     # if topdir not define, default it to testdir
     if not PatchtestParser.topdir:

-- 
2.48.1


