Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC1586C149
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:22:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id x1so27670946wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wY/F7Nws4fwCAHLI6tnIP33ig8kecDHWmGNsVw3T18c=;
	b=M5Sb1cFvKVzRR7TJmQpiB7uS8PwQgq5Mqp5ZUx8t4xo/hLvvfAlrDhCrYcCbQuejPy
	GYFadpIayGh20uhxN9sP2cbn2X4qgqA1dsydph9MGH5IaL78nXLpwjhx+K3XQUaAPqPM
	qPP+V5dQTOLF4qgSfclDaztvpe/e9JAj8W/9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wY/F7Nws4fwCAHLI6tnIP33ig8kecDHWmGNsVw3T18c=;
	b=muc0ruhvovTucwXJWcFudRFbNy4C74q6YqJyGRQZWOeDO2tuXyPJ5VKYadOMpozICX
	Z6Ei+hiAYtK3VU9K+8Uc+UkDcAnRvnSgb8RllyRPVl1HJU4iOyoDGa+RY81CLT9e3NHd
	3rMOCVIdOAl92ktO4NaM80TC4/Va1maAY/L6RKP5f1qGMqMQpbLK2wg4EJKWPEXBvtGl
	eUI8f6Pc9gEC1KtNIywwzuYc1z5B6mvAlTbqsDfY8cWI4JjLUA6rbd6vB+YwtCsvcNJa
	kkaZOmuSBLJu7c53m12N5TISeDaekZQLLxWWTeZvjWR8u29eS3sJ+lupgCRXDJ0fksh+
	v1DA==
X-Gm-Message-State: APjAAAV/vLkrcwiILCZTA6sHlyFQqSVtGeMApx2e+J6yS77LdYSCyn/k
	Qcjm7QlLhj9Is5DlQqFzQg0vkasyID4=
X-Google-Smtp-Source: APXvYqyIZ1PZDcUkwamYpegQgu0vbj2zrjAFK3Gat5ljxvqOImMqM5gIS9lGqQ+GzRz7XbF5aZd3Qw==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr3252144wrs.152.1564759347236; 
	Fri, 02 Aug 2019 08:22:27 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r4sm46734991wrq.82.2019.08.02.08.22.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:22:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 16:22:19 +0100
Message-Id: <20190802152220.16954-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
References: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 7/8] sstate/sstatesig: Update to new form of BB_HASHCHECK_FUNCTION
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
X-List-Received-Date: Fri, 02 Aug 2019 15:22:27 -0000
Content-Transfer-Encoding: 8bit

Bitbake has updated to a cleaned up form of BB_HASHCHECK_FUNCTION,
adapt to this cleanup. This is an API breaking change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 80 ++++++++++++++++++-------------------
 meta/lib/oe/sstatesig.py    | 13 +++---
 2 files changed, 45 insertions(+), 48 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ee029196dad..aa5841446c9 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -813,29 +813,26 @@ sstate_unpack_package () {
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
-def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False, *, sq_unihash=None):
-
-    ret = []
-    missed = []
+def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, **kwargs):
+    found = set()
+    missed = set()
     extension = ".tgz"
     if siginfo:
         extension = extension + ".siginfo"
 
     def gethash(task):
-        if sq_unihash is not None:
-            return sq_unihash[task]
-        return sq_hash[task]
+        return sq_data['unihash'][task]
 
     def getpathcomponents(task, d):
         # Magic data from BB_HASHFILENAME
-        splithashfn = sq_hashfn[task].split(" ")
+        splithashfn = sq_data['hashfn'][task].split(" ")
         spec = splithashfn[1]
         if splithashfn[0] == "True":
             extrapath = d.getVar("NATIVELSBSTRING") + "/"
         else:
             extrapath = ""
-
-        tname = sq_task[task][3:]
+        
+        tname = bb.runqueue.taskname_from_tid(task)[3:]
 
         if tname in ["fetch", "unpack", "patch", "populate_lic", "preconfigure"] and splithashfn[2]:
             spec = splithashfn[2]
@@ -844,18 +841,18 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False, *,
         return spec, extrapath, tname
 
 
-    for task in range(len(sq_fn)):
+    for tid in sq_data['hash']:
 
-        spec, extrapath, tname = getpathcomponents(task, d)
+        spec, extrapath, tname = getpathcomponents(tid, d)
 
-        sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, gethash(task), d) + "_" + tname + extension)
+        sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, gethash(tid), d) + "_" + tname + extension)
 
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
-            ret.append(task)
+            found.add(tid)
             continue
         else:
-            missed.append(task)
+            missed.add(tid)
             bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
 
     mirrors = d.getVar("SSTATE_MIRRORS")
@@ -885,7 +882,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False, *,
             thread_worker.connection_cache.close_connections()
 
         def checkstatus(thread_worker, arg):
-            (task, sstatefile) = arg
+            (tid, sstatefile) = arg
 
             localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
@@ -897,22 +894,22 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False, *,
                             connection_cache=thread_worker.connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
-                ret.append(task)
-                if task in missed:
-                    missed.remove(task)
+                found.add(tid)
+                if tid in missed:
+                    missed.remove(tid)
             except:
-                missed.append(task)
+                missed.add(tid)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass
             bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
-        for task in range(len(sq_fn)):
-            if task in ret:
+        for tid in sq_data['hash']:
+            if tid in found:
                 continue
-            spec, extrapath, tname = getpathcomponents(task, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(task), d) + "_" + tname + extension)
-            tasklist.append((task, sstatefile))
+            spec, extrapath, tname = getpathcomponents(tid, d)
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), d) + "_" + tname + extension)
+            tasklist.append((tid, sstatefile))
 
         if tasklist:
             msg = "Checking sstate mirror object availability"
@@ -933,38 +930,37 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False, *,
             bb.event.fire(bb.event.ProcessFinished(msg), d)
 
     # Likely checking an individual task hash again for multiconfig sharing of sstate tasks so skip reporting
-    if len(sq_fn) == 1:
-        return ret
+    if len(sq_data['hash']) == 1:
+        return found
 
     inheritlist = d.getVar("INHERIT")
     if "toaster" in inheritlist:
         evdata = {'missed': [], 'found': []};
-        for task in missed:
-            spec, extrapath, tname = getpathcomponents(task, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(task), d) + "_" + tname + ".tgz")
-            evdata['missed'].append( (sq_fn[task], sq_task[task], gethash(task), sstatefile ) )
-        for task in ret:
-            spec, extrapath, tname = getpathcomponents(task, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(task), d) + "_" + tname + ".tgz")
-            evdata['found'].append( (sq_fn[task], sq_task[task], gethash(task), sstatefile ) )
+        for tid in missed:
+            spec, extrapath, tname = getpathcomponents(tid, d)
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), d) + "_" + tname + ".tgz")
+            evdata['missed'].append((bb.runqueue.fn_from_tid(tid), bb.runqueue.taskname_from_tid(tid), gethash(tid), sstatefile ) )
+        for tid in found:
+            spec, extrapath, tname = getpathcomponents(tid, d)
+            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), d) + "_" + tname + ".tgz")
+            evdata['found'].append((bb.runqueue.fn_from_tid(tid), bb.runqueue.taskname_from_tid(tid), gethash(tid), sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
     # Print some summary statistics about the current task completion and how much sstate
     # reuse there was. Avoid divide by zero errors.
-    total = len(sq_fn)
-    currentcount = d.getVar("BB_SETSCENE_STAMPCURRENT_COUNT") or 0
+    total = len(sq_data['hash'])
     complete = 0
     if currentcount:
-        complete = (len(ret) + currentcount) / (total + currentcount) * 100
+        complete = (len(found) + currentcount) / (total + currentcount) * 100
     match = 0
     if total:
-        match = len(ret) / total * 100
-    bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(ret), len(missed), currentcount, match, complete))
+        match = len(found) / total * 100
+    bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(found), len(missed), currentcount, match, complete))
 
     if hasattr(bb.parse.siggen, "checkhashes"):
-        bb.parse.siggen.checkhashes(missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d)
+        bb.parse.siggen.checkhashes(sq_data, missed, found, d)
 
-    return ret
+    return found
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
 
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 3f926e3e515..80aafa0c2d1 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -235,19 +235,20 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             for (pn, task, fn, taskhash) in sorted(tasks):
                 f.write('%s.%s %s %s\n' % (pn, task, fn, taskhash))
 
-    def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
+    def checkhashes(self, sq_data, missed, found, d):
         warn_msgs = []
         error_msgs = []
         sstate_missing_msgs = []
 
-        for task in range(len(sq_fn)):
-            if task not in ret:
+        for tid in sq_data['hash']:
+            if tid not in found:
                 for pn in self.lockedsigs:
-                    if sq_hash[task] in iter(self.lockedsigs[pn].values()):
-                        if sq_task[task] == 'do_shared_workdir':
+                    taskname = bb.runqueue.taskname_from_tid(tid)
+                    if sq_data['hash'][tid] in iter(self.lockedsigs[pn].values()):
+                        if taskname == 'do_shared_workdir':
                             continue
                         sstate_missing_msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
-                                               % (pn, sq_task[task], sq_hash[task]))
+                                               % (pn, taskname, sq_data['hash'][tid]))
 
         checklevel = d.getVar("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK")
         if checklevel == 'warn':
-- 
2.20.1


