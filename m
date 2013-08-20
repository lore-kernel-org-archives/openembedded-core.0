Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 25D0D61013
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 02:48:59 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so5697305pbb.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HD8I1Y9Tbm27w3x64+CvAL19AfZ8TXsP0/frFwD/WKY=;
	b=fxBspu1wtoB6+UFmIJbjrXHCWLFqLlz8l42/XHOLcsog4c7NU8M7gjgyLqSb3tTGR2
	zacbP67x/q1q6KlKkDlQGcu7J1UuhKzdfycSmsv9zZyPzpGwSW7aDoh7thvWg5A652wF
	LhzR4htlzBYDeMdN1+15CUVCu6RlFukFbHdUf6uyjAzsA7I+eqnOeFe77968tYTMsBb/
	U+G6ZysyReQEVD9fZPeuj/LKTNin8PHB7M2dizpJvVrWtdJ5jKfernggdeY4jHVA1GhU
	uO4Z9MndX5nuy9NeLN8jtaTW6ahhKOCdvwQYnF7cFQPCalOykOgHOrtQhHLWzHMo21nR
	2z7Q==
X-Received: by 10.66.161.229 with SMTP id xv5mr1040766pab.87.1376966939777;
	Mon, 19 Aug 2013 19:48:59 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id uw6sm3939068pbc.8.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 19 Aug 2013 19:48:58 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Aug 2013 19:48:00 -0700
Message-Id: <1376966880-4557-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] oe.types: add 'path' type
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
X-List-Received-Date: Tue, 20 Aug 2013 02:48:59 -0000

From: Christopher Larson <chris_larson@mentor.com>

- path normalization ('normalize' flag, defaults to enabled)
- existence verification for paths we know should exist ('mustexist' flag)
- supports clean handling of relative paths ('relativeto' flag)

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oe/types.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index 5dac9de..7f47c17 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -1,4 +1,7 @@
+import errno
 import re
+import os
+
 
 class OEList(list):
     """OpenEmbedded 'list' type
@@ -133,3 +136,18 @@ def float(value, fromhex='false'):
         return _float.fromhex(value)
     else:
         return _float(value)
+
+def path(value, relativeto='', normalize='true', mustexist='false'):
+    value = os.path.join(relativeto, value)
+
+    if boolean(normalize):
+        value = os.path.normpath(value)
+
+    if boolean(mustexist):
+        try:
+            open(value, 'r')
+        except IOError as exc:
+            if exc.errno == errno.ENOENT:
+                raise ValueError("{0}: {1}".format(value, os.strerror(errno.ENOENT)))
+
+    return value
-- 
1.8.3.4


