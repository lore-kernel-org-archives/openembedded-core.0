Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 09D686E668
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2016 08:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4E8Qukm017838 for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2016 09:26:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Md1C-t4BTdPX
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2016 09:26:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4E8Qq3G017834
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2016 09:26:53 +0100
Message-ID: <1463214412.9746.140.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 14 May 2016 09:26:52 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/decorators: Use wraps consistently
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
X-List-Received-Date: Sat, 14 May 2016 08:27:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We want the decorator to leave the function names of the test unchanged. Some
decorators are already using wraps for this but not all. Fix this to be consistent
allowing inspection of the test to give the wanted values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 0d79223..d52f326 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -57,6 +57,7 @@ class skipIfFailure(object):
         self.testcase = testcase
 
     def __call__(self,f):
+        @wraps(f)
         def wrapped_f(*args, **kwargs):
             res = getResults()
             if self.testcase in (res.getFailList() or res.getErrorList()):
@@ -71,6 +72,7 @@ class skipIfSkipped(object):
         self.testcase = testcase
 
     def __call__(self,f):
+        @wraps(f)
         def wrapped_f(*args, **kwargs):
             res = getResults()
             if self.testcase in res.getSkipList():
@@ -85,6 +87,7 @@ class skipUnlessPassed(object):
         self.testcase = testcase
 
     def __call__(self,f):
+        @wraps(f)
         def wrapped_f(*args, **kwargs):
             res = getResults()
             if self.testcase in res.getSkipList() or \
@@ -97,11 +100,11 @@ class skipUnlessPassed(object):
         return wrapped_f
 
 class testcase(object):
-
     def __init__(self, test_case):
         self.test_case = test_case
 
     def __call__(self, func):
+        @wraps(func)
         def wrapped_f(*args, **kwargs):
             return func(*args, **kwargs)
         wrapped_f.test_case = self.test_case


