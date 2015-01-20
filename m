Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB9671353
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0KLTvQt023095 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:29:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x7EAUNB6qYCf
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:29:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0KLTfB0023083
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:29:52 GMT
Message-ID: <1421789381.1798.50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jan 2015 21:29:41 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/utils/decorators: Try and improve ugly _ErrorHandler tracebacks
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
X-List-Received-Date: Tue, 20 Jan 2015 21:30:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, if one module is skipped, any other module calling skipModule
causes tracebacks about _ErrorHandler not having a _testMethodName
method.

This reworks the code in a way to avoid some of the problems by using
the id() method of the objects. It also maps to the correct name
format rather than "setupModule" or just skiping the item entirely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 2d5db24..ff5f278 100644
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



