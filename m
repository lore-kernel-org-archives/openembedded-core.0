Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A85A62137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C80F618137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id RT6IEW-ukSNL
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 1657F18059
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 006D51BF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id E9E2B1BF0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id E86EEDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5AFkC4t031871
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5AFkCuw031865
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2016 17:46:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 17:46:10 +0200
Message-Id: <d4e799a4e5f83291df990e6871f111dafc043062.1465573515.git.pkj@axis.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1465573515.git.pkj@axis.com>
References: <cover.1465573515.git.pkj@axis.com>
In-Reply-To: <cover.1465573515.git.pkj@axis.com>
References: <cover.1465573515.git.pkj@axis.com>
Subject: [PATCHv2 1/2] useradd-staticids.bbclass: Make sure opened files are closed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 15:46:16 -0000

This avoids warnings about unclosed files with Python 3.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index a9b506d..440c0e3 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -4,6 +4,7 @@ def update_useradd_static_config(d):
     import argparse
     import itertools
     import re
+    import errno
 
     class myArgumentParser( argparse.ArgumentParser ):
         def _print_message(self, message, file=None):
@@ -30,19 +31,22 @@ def update_useradd_static_config(d):
         are set)."""
         id_table = dict()
         for conf in file_list.split():
-            if os.path.exists(conf):
-                f = open(conf, "r")
-                for line in f:
-                    if line.startswith('#'):
-                        continue
-                    # Make sure there always are at least exp_fields elements in
-                    # the field list. This allows for leaving out trailing
-                    # colons in the files.
-                    fields = list_extend(line.rstrip().split(":"), exp_fields)
-                    if fields[0] not in id_table:
-                        id_table[fields[0]] = fields
-                    else:
-                        id_table[fields[0]] = list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
+            try:
+                with open(conf, "r") as f:
+                    for line in f:
+                        if line.startswith('#'):
+                            continue
+                        # Make sure there always are at least exp_fields
+                        # elements in the field list. This allows for leaving
+                        # out trailing colons in the files.
+                        fields = list_extend(line.rstrip().split(":"), exp_fields)
+                        if fields[0] not in id_table:
+                            id_table[fields[0]] = fields
+                        else:
+                            id_table[fields[0]] = list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
+            except IOError as e:
+                if e.errno == errno.ENOENT:
+                    pass
 
         return id_table
 
-- 
2.8.3


