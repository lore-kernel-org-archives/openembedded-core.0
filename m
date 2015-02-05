Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3292772E30
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:22 +0000 (UTC)
Received: by pdbfl12 with SMTP id fl12so8544648pdb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=45JGKTkk4o0qs8vjuYTayjiuEg8i53QBayr0/1rY30E=;
	b=0ykJjjqwGWKOLIx1aCx75BRtyB0dL0UGwR6zG8v23psIveh7bzoNBoduk54ja/JoqR
	sI0yPSDMeIrv/j5nzy3OUxm6BRpvJmRxsMw2YbHLwUIwWLDj7k+lksPkGCaV12LwEwcj
	6eVnXK9YhbMJd9Vav4VjW87brKfthAVwz7BlaboJ48vlT/JzEQzXAw1MZmfZgU6QuRkr
	x5wQzCycsscdEPK4IoaYU4QMKci/A1Sm9D0x9O1kOa8GqkL+3fHqhIINqKW41hdcqor+
	hoRIHJcK9k36QH7CTG+cMdA7H+oxNwhT4OMacyooMvp1KzJQqRvlZdwnx1BKwqJZoH6n
	ErjQ==
X-Received: by 10.66.162.41 with SMTP id xx9mr6050067pab.68.1423152323813;
	Thu, 05 Feb 2015 08:05:23 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:43 -0800
Message-Id: <96ad0b9b0f96c8453729d6f8d938fb29e1dbd1a5.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 35/61] oeqa/utils/decorators: Try and improve ugly _ErrorHandler tracebacks
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:22 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, if one module is skipped, any other module calling skipModule
causes tracebacks about _ErrorHandler not having a _testMethodName
method.

This reworks the code in a way to avoid some of the problems by using
the id() method of the objects. It also maps to the correct name
format rather than "setupModule" or just skiping the item entirely.

(From OE-Core rev: 78d3bf2e4c88779df32b9dfbe8362dc24e9ad080)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/decorators.py | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 7f845db..40bd4ef 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -18,14 +18,21 @@ class getResults(object):
         upperf = sys._current_frames().values()[0]
         while (upperf.f_globals['__name__'] != 'unittest.case'):
             upperf = upperf.f_back
-        self.faillist = [ seq[0]._testMethodName for seq in upperf.f_locals['result'].failures ]
-        self.errorlist = [ seq[0]._testMethodName for seq in upperf.f_locals['result'].errors ]
-        #ignore the _ErrorHolder objects from the skipped tests list
-        self.skiplist = []
-        for seq in upperf.f_locals['result'].skipped:
-            try:
-                self.skiplist.append(seq[0]._testMethodName)
-            except: pass
+
+        def handleList(items):
+            ret = []
+            # items is a list of tuples, (test, failure) or (_ErrorHandler(), Exception())
+            for i in items:
+                s = i[0].id()
+                #Handle the _ErrorHolder objects from skipModule failures
+                if "setUpModule (" in s:
+                    ret.append(s.replace("setUpModule (", "").replace(")",""))
+                else:
+                    ret.append(s)
+            return ret
+        self.faillist = handleList(upperf.f_locals['result'].failures)
+        self.errorlist = handleList(upperf.f_locals['result'].errors)
+        self.skiplist = handleList(upperf.f_locals['result'].skipped)
 
     def getFailList(self):
         return self.faillist
-- 
1.9.1


