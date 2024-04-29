Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08AEC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 19:47:20 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.31548.1714420036302203375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 12:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FrZfEpEj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4537420007;
	Mon, 29 Apr 2024 19:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714420034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KgJ+kmmpcxEYMbO59dB+SBdwn1mvvW2cuhuI0ZvwtjY=;
	b=FrZfEpEjY2UxVjG27xKketNdcDu3vVkFn61yF26EFZ/ek3kOK+qZact4LAnSm8d2zbwL9S
	tWUKedWHEiVQtPCfyC9nD5UrkMESacvLKrKNwyNWUT4leqLk0Wi2L+S2RHzSRao0iselna
	89lgZqwJkdAxAFDUI6r1L7dBcjUvkZ9K2MgB5d9pp78hxGb75jwpNrMOuxaCV1gAuuJ3iD
	b8y0VxNGehJbNOPoQpi6vothQNa3Py3Hp7AKeyO5jA9tsqSuyAUlqMnec8eoV/jgYp9itg
	DyngMF3CX6mF0aY3VamfOKtNGqN8Te3RDNIjIxLwVKkHC0tcmvcugEeA+ZsM8w==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH RESEND] oeqa/selftest/prservice: support non integer PR values
Date: Mon, 29 Apr 2024 21:46:56 +0200
Message-Id: <20240429194656.655509-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 300
X-GND-Status: SPAM
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 19:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198752

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Support non integer x.y.z PR values, for when the PR server
supports upstream PR servers.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Note that regular integer PR values are still supported.
This code has also been tested on master (as of Apr. 29, 2024),
without the proposed PR server changes.
---
 meta/classes/primport.bbclass             |  2 +-
 meta/lib/oe/prservice.py                  | 17 ++++++++++++-----
 meta/lib/oeqa/selftest/cases/prservice.py |  9 +++++++--
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/meta/classes/primport.bbclass b/meta/classes/primport.bbclass
index 00924174c1..1ff09c8785 100644
--- a/meta/classes/primport.bbclass
+++ b/meta/classes/primport.bbclass
@@ -17,7 +17,7 @@ python primport_handler () {
             bb.fatal("import failed!")
 
         for (version, pkgarch, checksum, value) in imported:
-            bb.note("imported (%s,%s,%s,%d)" % (version, pkgarch, checksum, value))
+            bb.note("imported (%s,%s,%s,%s)" % (version, pkgarch, checksum, value))
     elif isinstance(e, bb.event.ParseStarted):
         import oe.prservice
         oe.prservice.prserv_check_avail(e.data)
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index c41242c878..d7920fc511 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -4,6 +4,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import re
+
+def is_legal_prvalue(str):
+    pattern = r'^[0-9]+([.][0-9]+)*$'
+    return bool(re.match(pattern, str))
+
 def prserv_make_conn(d, check = False):
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
@@ -59,14 +65,15 @@ def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksu
                (filter_pkgarch and filter_pkgarch != pkgarch) or \
                (filter_checksum and filter_checksum != checksum):
                continue
-            try:
-                value = int(d.getVar(remain + '$' + version + '$' + pkgarch + '$' + checksum))
-            except BaseException as exc:
+
+            value = d.getVar(remain + '$' + version + '$' + pkgarch + '$' + checksum)
+            if not is_legal_prvalue(value):
                 bb.debug("Not valid value of %s:%s" % (v,str(exc)))
                 continue
-            ret = conn.importone(version,pkgarch,checksum,value)
+
+            ret = str(conn.importone(version, pkgarch, checksum, value))
             if ret != value:
-                bb.error("importing(%s,%s,%s,%d) failed. DB may have larger value %d" % (version,pkgarch,checksum,value,ret))
+                bb.error("importing(%s,%s,%s,%s) failed. DB may have larger value %s" % (version,pkgarch,checksum,value,ret))
             else:
                imported.append((version,pkgarch,checksum,value))
     conn.close()
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 8da3739c57..0e2ca0c5ab 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -16,6 +16,11 @@ from oeqa.utils.network import get_free_port
 
 import bb.utils
 
+def rev_minor(rev):
+    """Returns the last number of an x.y.z revision number"""
+    fields=str(rev).split('.')
+    return int(fields[-1])
+
 class BitbakePrTests(OESelftestTestCase):
 
     @classmethod
@@ -78,7 +83,7 @@ class BitbakePrTests(OESelftestTestCase):
         pr_2 = self.get_pr_version(package_name)
         stamp_2 = self.get_task_stamp(package_name, track_task)
 
-        self.assertTrue(pr_2 - pr_1 == 1, "New PR %s did not increment as expected (from %s), difference should be 1" % (pr_2, pr_1))
+        self.assertTrue(rev_minor(pr_2) - rev_minor(pr_1) == 1, "New PR %s did not increment as expected (from %s), difference should be 1" % (pr_2, pr_1))
         self.assertTrue(stamp_1 != stamp_2, "Different pkg rev. but same stamp: %s" % stamp_1)
 
         self.cleanup()
@@ -104,7 +109,7 @@ class BitbakePrTests(OESelftestTestCase):
         self.increment_package_pr(package_name)
         pr_2 = self.get_pr_version(package_name)
 
-        self.assertTrue(pr_2 - pr_1 == 1, "New PR %s did not increment as expected (from %s), difference should be 1" % (pr_2, pr_1))
+        self.assertTrue(rev_minor(pr_2) - rev_minor(pr_1) == 1, "New PR %s did not increment as expected (from %s), difference should be 1" % (pr_2, pr_1))
 
         self.cleanup()
 
-- 
2.34.1


