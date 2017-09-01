Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEAA784A1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 14:20:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v81EKkfR014474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Sep 2017 15:20:47 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dnmoQ-0001gM-Pj; Fri, 01 Sep 2017 15:20:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Sep 2017 15:20:44 +0100
Message-Id: <1504275645-6421-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504275645-6421-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1504275645-6421-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 01 Sep 2017 15:20:47 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/3] lib/oe/utils: Handle exceptions in multiprocess_exec
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
X-List-Received-Date: Fri, 01 Sep 2017 14:20:49 -0000

Currently exceptions that happen in pool commands are ignored. Any errors
would be printed on the console but everything else is silent.

Switch to use pool.map_async which allows for an error_callback which
we can use to detect exceptions and make sure these errors are handled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 822d0cd..643ab78 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -224,25 +224,30 @@ def multiprocess_exec(commands, function):
     def init_worker():
         signal.signal(signal.SIGINT, signal.SIG_IGN)
 
+    fails = []
+
+    def failures(res):
+        fails.append(res)
+
     nproc = min(multiprocessing.cpu_count(), len(commands))
     pool = bb.utils.multiprocessingpool(nproc, init_worker)
-    imap = pool.imap(function, commands)
 
     try:
-        res = list(imap)
+        mapresult = pool.map_async(function, commands, error_callback=failures)
+
         pool.close()
         pool.join()
-        results = []
-        for result in res:
-            if result is not None:
-                results.append(result)
-        return results
-
+        results = mapresult.get()
     except KeyboardInterrupt:
         pool.terminate()
         pool.join()
         raise
 
+    if fails:
+        raise fails[0]
+
+    return results
+
 def squashspaces(string):
     import re
     return re.sub("\s+", " ", string).strip()
-- 
2.7.4


