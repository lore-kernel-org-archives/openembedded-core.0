Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C8BFC770AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 22:14:10 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id i130so70856486wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 15:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=1RxzcOR8ZRcwEWuZl/Ss+BT9P9JOVTDY+aO75+DpkOo=;
	b=jXMvGeMha/2Imw+Pf6idGbIbWMqZxQlfuxxQIXWG4EjfMb0M92X6iKpNwahmZDlfkj
	cJL6a4GHUseNjiQG/1YleL2m+TCjcaqbvwO2JnHp5ElDfLCTFMZAlodmGyYsVmlO3vwG
	NOLqV0jFxvdLBqBkpb9vfijRgLmra7pb1mIlstAytk5Bq9l4wFhBVb4wGd//HTW6n/tG
	7Kbgz6Rm//GQ22RLl5FG4ShNr9LdAao5Z2Q0pPJIsY2HNTRbPkFx4lswpa28pcUFfNA8
	f8AChdsKb8tFXtriLHHk3tshhZ2JWqxnZVSud00RKDaq0OlSMjlcPlcEzPQgm72BhsU2
	x4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1RxzcOR8ZRcwEWuZl/Ss+BT9P9JOVTDY+aO75+DpkOo=;
	b=Zif0/YkirDVnv0BNF4toHtixrEuYD187Q3UAtCrjiqU8lguiKJJfsF18JM4BbyLta4
	rpH6oi1f+zyjBjHM4jBticc2aOdDueumgqilNmr45TZMxOamFBOCq8usB1APLYf1J+E2
	X84gy9Wyarb8LRWmuKS3TU9dK6rh3XOkJct7oi3Aaf5nE10VzW697etXo0jhneLTImrQ
	UDoysyodhhH0wwJWpxkUwwUlyftDqPAUzAF5us5aLqsUMJbvcMSlNdfgWd06rWNjvH87
	Zm/kfah77h1jT+7h4Dv4Uc5A4JSWvZo3gPJxvoKF/LTMImAkuEuWCZknYOGTUiAX9x5r
	XMnA==
X-Gm-Message-State: AE9vXwOfuxl5elAZeKr4hT4xYu6EA7CcYVyzli08fmDTs1+qR9f4EycJ8qNc2JNsam7ptm0H
X-Received: by 10.28.107.22 with SMTP id g22mr1502052wmc.31.1473891250545;
	Wed, 14 Sep 2016 15:14:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id jd4sm368785wjb.6.2016.09.14.15.14.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Sep 2016 15:14:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 23:14:07 +0100
Message-Id: <1473891247-18988-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa/oetest: show stderr when running commands
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
X-List-Received-Date: Wed, 14 Sep 2016 22:14:11 -0000

To help debug failures, redirect stderr to stdout in oeSDKTest.run() and
oeSDKExtTest.run().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/oetest.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index eb19cb6..2f565a0 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -154,13 +154,12 @@ class oeSDKTest(oeTest):
 
     @classmethod
     def hasHostPackage(self, pkg):
-
         if re.search(pkg, oeTest.tc.hostpkgmanifest):
             return True
         return False
 
     def _run(self, cmd):
-        return subprocess.check_output(". %s > /dev/null; %s;" % (self.tc.sdkenv, cmd), shell=True).decode("utf-8")
+        return subprocess.check_output(". %s > /dev/null; %s;" % (self.tc.sdkenv, cmd), shell=True, stderr=subprocess.STDOUT).decode("utf-8")
 
 class oeSDKExtTest(oeSDKTest):
     def _run(self, cmd):
@@ -172,7 +171,7 @@ class oeSDKExtTest(oeSDKTest):
         env['PATH'] = avoid_paths_in_environ(paths_to_avoid)
 
         return subprocess.check_output(". %s > /dev/null;"\
-            " %s;" % (self.tc.sdkenv, cmd), shell=True, env=env).decode("utf-8")
+            " %s;" % (self.tc.sdkenv, cmd), stderr=subprocess.STDOUT, shell=True, env=env).decode("utf-8")
 
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
-- 
2.8.1


