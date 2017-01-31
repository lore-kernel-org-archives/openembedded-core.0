Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id EAD7F60621
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:50:52 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id j18so130321623ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UjhHBtxLMzxCFT2Zei6SQ64VeUmjGQQsDAAWU6RJnO8=;
	b=lJRajRxYUsXDyAFDqWFPhpAKNtVV4wq9v7+J0IctpfHoUKcHI2s2plqjCp2t3vWPAR
	NdL0Q0zRaEyy5pkQflsrzsGPvfnpMLKys7nq8drptrA22C+l3nVOcDD3qNOQoVvYMt7z
	pa45Aq/zt9gmfTYzIWkXJdv6vwdY1xM+pNGLQ7a+jM+uKu/0z7c1MjnfS2/V153SBJWp
	OpsY4dCZwstI7TxUdqWcluy2zO9h/GYdWPUkhmxwI8iNfNwAUG7i8GYLwR5Vv2bKrOgW
	cn6MQUolK7hrbdHyXnULNzhJiknYH18Mgr7KuJusQydhT4LQnhkSqAaBoZ7aFIGy4fqf
	MpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UjhHBtxLMzxCFT2Zei6SQ64VeUmjGQQsDAAWU6RJnO8=;
	b=DcW4QoUa2SXffKwyKZZF8WzSP+rP5fYNq6lZI8phiCYX3NEsjfP+iB24qysubrbzWb
	IacFVFkzGHBJTrZww9Tflp/PAEsnHIXhWx9rULFOgcn88zktwfrq2lBWK0Ez2KwJDwLM
	tu7lNLLyEyaM8GGGD480tSanlbo4rtonLy5IzPv4AOd5ArCPOijwINXHVhpFSHLosYmU
	YvYDoTPdscnANTn8xO3+UQlzn5I+ZXrKTgT/w3k/gGm5s67/Adugv/pJuEqrRaI6AKe/
	pGwHchyUDCcXXU88D93xSIrwNAR38wsQ83K7OimpMaQ9OfBNj1diYNR5fxzA5gBS7sXc
	WSkA==
X-Gm-Message-State: AIkVDXJmCPSz30f7AzuQfqpcXpVGUSyu4hf49mPURvyn8dfLmU8rEhdPv1xbDo5qZ4xOGpa6
X-Received: by 10.107.175.93 with SMTP id y90mr21616600ioe.12.1485867052482;
	Tue, 31 Jan 2017 04:50:52 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.50.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:50:51 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:29 +0100
Message-Id: <fc8a5aaba5a52d918abb14afd736389e9f52b0bb.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Subject: [PATCH 4/8] verify-bashisms: fix problems with tinfoil2
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
X-List-Received-Date: Tue, 31 Jan 2017 12:50:53 -0000

tinfoil2 is based on a client/server architecture, which broke the
verify-bashisms script:

- The tinfoil instance and its data proxies can't be pickled, so
  all interaction with the bitbake server has to run in the main
  script process and only processing of the plain scripts can
  be done with multiprocessing:

  _pickle.PicklingError: Can't pickle <class 'bb.tinfoil.TinfoilCookerAdapter.TinfoilRecipeCacheAdapter'>: attribute lookup TinfoilRecipeCacheAdapter on bb.tinfoil failed

- The multiprocessing pool has to be created before initializing
  tinfoil, otherwise the pool workers end up trying to communicate
  with the bitbake server during shutdown:

  ERROR: UI received SIGTERM
  Process ForkPoolWorker-2:
  Traceback (most recent call last):
    File "/usr/lib/python3.4/multiprocessing/process.py", line 257, in _bootstrap
      util._exit_function()
    File "/usr/lib/python3.4/multiprocessing/util.py", line 286, in _exit_function
      _run_finalizers(0)
    ...
    File "/usr/lib/python3.4/multiprocessing/process.py", line 131, in is_alive
      assert self._parent_pid == os.getpid(), 'can only test a child process'
   AssertionError: can only test a child process

- func() needs to defined before creating the pool to avoid:

  AttributeError: Can't get attribute 'func' on <module '__main__' from '/work/openembedded-core/scripts/verify-bashisms'>

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/verify-bashisms | 44 +++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index ed0a563..613f174 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -71,6 +71,20 @@ if __name__=='__main__':
         print("Cannot find checkbashisms.pl on $PATH, get it from https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl")
         sys.exit(1)
 
+    # The order of defining the worker function,
+    # initializing the pool and connecting to the
+    # bitbake server is crucial, don't change it.
+    def func(item):
+        fn, scripts = item
+        result = []
+        for key, script in scripts:
+            r = process(fn, key, script)
+            if r: result.extend(r)
+        return fn, result
+
+    import multiprocessing
+    pool = multiprocessing.Pool()
+
     tinfoil = get_tinfoil()
 
     # This is only the default configuration and should iterate over
@@ -83,32 +97,24 @@ if __name__=='__main__':
     else:
         initial_pns = sorted(pkg_pn)
 
-    pns = []
-    print("Generating file list...")
+    pns = {}
+    print("Generating scripts...")
     for pn in initial_pns:
         for fn in pkg_pn[pn]:
             # There's no point checking multiple BBCLASSEXTENDed variants of the same recipe
             realfn, _, _ = bb.cache.virtualfn2realfn(fn)
             if realfn not in pns:
-                pns.append(realfn)
-
-
-    def func(fn):
-        result = []
-        data = tinfoil.parse_recipe_file(fn)
-        for key in data.keys():
-            if data.getVarFlag(key, "func") and not data.getVarFlag(key, "python"):
-                script = data.getVar(key, False)
-                if not script: continue
-                #print ("%s:%s" % (fn, key))
-                r = process(fn, key, script)
-                if r: result.extend(r)
-        return fn, result
+                data = tinfoil.parse_recipe_file(realfn)
+                scripts = []
+                for key in data.keys():
+                    if data.getVarFlag(key, "func") and not data.getVarFlag(key, "python"):
+                        script = data.getVar(key, False)
+                        if script:
+                            scripts.append((key, script))
+                pns[realfn] = scripts
 
     print("Scanning scripts...\n")
-    import multiprocessing
-    pool = multiprocessing.Pool()
-    for pn,results in pool.imap(func, pns):
+    for pn, results in pool.imap(func, pns.items()):
         if results:
             print(pn)
             for message,source in results:
-- 
git-series 0.9.1

