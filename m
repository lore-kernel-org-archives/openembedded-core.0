Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4336D75681
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 21:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t51LGVYH007377 for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:16:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TyyS7v50UBxy
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 22:16:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t51LGH6L007374
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:16:28 +0100
Message-ID: <1433193377.404.179.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Jun 2015 22:16:17 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Parallelise checkstatus calls for sstate mirror
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
X-List-Received-Date: Mon, 01 Jun 2015 21:16:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the urls are checked serially which is a performance bottleneck when
looking at http:// urls in particular. This adds code to check the url status in
parallel, mirroring the way we do this elsewhere.

We need the datastore for the fetcher so we use threads, not multiprocess.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b485044..de3519a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -715,20 +715,16 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
         if localdata.getVar('BB_NO_NETWORK', True) == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) == "1":
             localdata.delVar('BB_NO_NETWORK')
 
-        for task in range(len(sq_fn)):
-            if task in ret:
-                continue
-
-            spec, extrapath, tname = getpathcomponents(task, d)
-
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + extension)
+        def checkstatus(arg):
+            (task, sstatefile) = arg
 
+            localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
             localdata.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             try:
-                fetcher = bb.fetch2.Fetch(srcuri.split(), localdata)
+                fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 ret.append(task)
@@ -739,6 +735,22 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass     
 
+        tasklist = []
+        for task in range(len(sq_fn)):
+            if task in ret:
+                continue
+            spec, extrapath, tname = getpathcomponents(task, d)
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + extension)
+            tasklist.append((task, sstatefile))
+
+        if tasklist:
+            import multiprocessing
+            nproc = min(multiprocessing.cpu_count(), len(tasklist))
+            pool = oe.utils.ThreadedPool(nproc)
+            for t in tasklist:
+                pool.add_task(checkstatus, t)
+            pool.wait_completion()
+
     inheritlist = d.getVar("INHERIT", True)
     if "toaster" in inheritlist:
         evdata = {'missed': [], 'found': []};



