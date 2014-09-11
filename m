Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2F33710C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:04:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8BF4eoN025872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Sep 2014 08:04:41 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 11 Sep 2014 08:04:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 11 Sep 2014 23:04:27 +0800
Message-ID: <d33777c82a7b5e08f054da3dd9b2cd42da54be6d.1410446513.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410446513.git.hongxu.jia@windriver.com>
References: <cover.1410446513.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] Richard Purdie : siggen/runqueue/bitbake-worker: Improve siggen data transfer interface
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
X-List-Received-Date: Thu, 11 Sep 2014 15:04:44 -0000
Content-Type: text/plain

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need to transfer some of the siggen data from the core/cooker into
the worker instances. There was a partial API created for this but
its ugly and its not possible to extend it from the siggen class.

This patch completes the interface/abstraction for the data and
means the class can extend/customise it in any siggen class.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/bin/bitbake-worker | 2 +-
 bitbake/lib/bb/runqueue.py | 4 +---
 bitbake/lib/bb/siggen.py   | 9 +++++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/bitbake/bin/bitbake-worker b/bitbake/bin/bitbake-worker
index c7992f7..b2935f6 100755
--- a/bitbake/bin/bitbake-worker
+++ b/bitbake/bin/bitbake-worker
@@ -168,7 +168,7 @@ def fork_off_task(cfg, data, workerdata, fn, task, taskname, appends, taskdepdat
             data.setVar("BUILDNAME", workerdata["buildname"])
             data.setVar("DATE", workerdata["date"])
             data.setVar("TIME", workerdata["time"])
-            bb.parse.siggen.set_taskdata(workerdata["hashes"], workerdata["hash_deps"], workerdata["sigchecksums"])
+            bb.parse.siggen.set_taskdata(workerdata["sigdata"])
             ret = 0
             try:
                 the_data = bb.cache.Cache.loadDataFull(fn, appends, data)
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 39df794..6d9cf3f 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -879,9 +879,7 @@ class RunQueue:
             "fakerootenv" : self.rqdata.dataCache.fakerootenv,
             "fakerootdirs" : self.rqdata.dataCache.fakerootdirs,
             "fakerootnoenv" : self.rqdata.dataCache.fakerootnoenv,
-            "hashes" : bb.parse.siggen.taskhash,
-            "hash_deps" : bb.parse.siggen.runtaskdeps,
-            "sigchecksums" : bb.parse.siggen.file_checksum_values,
+            "sigdata" : bb.parse.siggen.get_taskdata(),
             "runq_hash" : self.rqdata.runq_hash,
             "logdefaultdebug" : bb.msg.loggerDefaultDebugLevel,
             "logdefaultverbose" : bb.msg.loggerDefaultVerbose,
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 548f50d..86d9ca0 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -197,10 +197,11 @@ class SignatureGeneratorBasic(SignatureGenerator):
         #d.setVar("BB_TASKHASH_task-%s" % task, taskhash[task])
         return h
 
-    def set_taskdata(self, hashes, deps, checksums):
-        self.runtaskdeps = deps
-        self.taskhash = hashes
-        self.file_checksum_values = checksums
+    def get_taskdata(self):
+       return (self.runtaskdeps, self.taskhash, self.file_checksum_values)
+
+    def set_taskdata(self, data):
+        self.runtaskdeps, self.taskhash, self.file_checksum_values = data
 
     def dump_sigtask(self, fn, task, stampbase, runtime):
         k = fn + "." + task
-- 
1.9.1


