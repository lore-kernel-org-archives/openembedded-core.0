Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D0EB17319D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEsYX1032748; Thu, 17 Dec 2015 14:54:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Xr926cErzvwD; Thu, 17 Dec 2015 14:54:34 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEsSsr032733
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Dec 2015 14:54:29 GMT
Message-ID: <1450364068.13505.209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Thu, 17 Dec 2015 14:54:28 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 5/7] buildstats: Improve to add getrusage data and corrected IO stats
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
X-List-Received-Date: Thu, 17 Dec 2015 14:54:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add IO stats and getrusage() data to the task statistics. We
also drop the CPU percentage calculation since its pretty arbitrary
and not very accurate/useful.

In particular we can now see the user and sys times as well as the
wall clock times.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 71469e4..daf0b86 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -9,41 +9,53 @@ BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
 #
 ################################################################################
 
-def get_process_cputime(pid):
+def get_buildprocess_cputime(pid):
     with open("/proc/%d/stat" % pid, "r") as f:
         fields = f.readline().rstrip().split()
     # 13: utime, 14: stime, 15: cutime, 16: cstime
     return sum(int(field) for field in fields[13:16])
 
+def get_process_cputime(pid):
+    import resource
+    with open("/proc/%d/stat" % pid, "r") as f:
+        fields = f.readline().rstrip().split()
+    stats = { 
+        'utime'  : fields[13],
+        'stime'  : fields[14], 
+        'cutime' : fields[15], 
+        'cstime' : fields[16],  
+    }
+    iostats = {}
+    with open("/proc/%d/io" % pid, "r") as f:
+        while True:
+            i = f.readline().strip()
+            if not i:
+                break
+            i = i.split(": ")
+            iostats[i[0]] = i[1]
+    resources = resource.getrusage(resource.RUSAGE_SELF)
+    childres = resource.getrusage(resource.RUSAGE_CHILDREN)
+    return stats, iostats, resources, childres
+
 def get_cputime():
     with open("/proc/stat", "r") as f:
         fields = f.readline().rstrip().split()[1:]
     return sum(int(field) for field in fields)
 
 def set_timedata(var, d, server_time):
-    cputime = get_cputime()
-    proctime = get_process_cputime(os.getpid())
-    d.setVar(var, (server_time, cputime, proctime))
+    d.setVar(var, server_time)
 
 def get_timedata(var, d, end_time):
-    timedata = d.getVar(var, False)
-    if timedata is None:
+    oldtime = d.getVar(var, False)
+    if oldtime is None:
         return
-    oldtime, oldcpu, oldproc = timedata
-    procdiff = get_process_cputime(os.getpid()) - oldproc
-    cpudiff = get_cputime() - oldcpu
-    timediff = end_time - oldtime
-    if cpudiff > 0:
-        cpuperc = float(procdiff) * 100 / cpudiff
-    else:
-        cpuperc = None
-    return timediff, cpuperc
+    return end_time - oldtime
 
 def set_buildtimedata(var, d):
     import time
     time = time.time()
     cputime = get_cputime()
-    proctime = get_process_cputime(os.getpid())
+    proctime = get_buildprocess_cputime(os.getpid())
     d.setVar(var, (time, cputime, proctime))
 
 def get_buildtimedata(var, d):
@@ -52,7 +64,7 @@ def get_buildtimedata(var, d):
     if timedata is None:
         return
     oldtime, oldcpu, oldproc = timedata
-    procdiff = get_process_cputime(os.getpid()) - oldproc
+    procdiff = get_buildprocess_cputime(os.getpid()) - oldproc
     cpudiff = get_cputime() - oldcpu
     end_time = time.time()
     timediff = end_time - oldtime
@@ -66,13 +78,23 @@ def write_task_data(status, logfile, e, d):
     bn = d.getVar('BUILDNAME', True)
     bsdir = os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
     with open(os.path.join(logfile), "a") as f:
-        timedata = get_timedata("__timedata_task", d, e.time)
-        if timedata:
-            elapsedtime, cpu = timedata
+        elapsedtime = get_timedata("__timedata_task", d, e.time)
+        if elapsedtime:
             f.write(d.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
                                     (e.task, elapsedtime)))
+            cpu, iostats, resources, childres = get_process_cputime(os.getpid())
             if cpu:
-                f.write("CPU usage: %0.1f%% \n" % cpu)
+                f.write("utime: %s\n" % cpu['utime'])
+                f.write("stime: %s\n" % cpu['stime'])
+                f.write("cutime: %s\n" % cpu['cutime'])
+                f.write("cstime: %s\n" % cpu['cstime'])
+            for i in iostats:
+                f.write("IO %s: %s\n" % (i, iostats[i]))
+            rusages = ["ru_utime", "ru_stime", "ru_maxrss", "ru_minflt", "ru_majflt", "ru_inblock", "ru_oublock", "ru_nvcsw", "ru_nivcsw"]
+            for i in rusages:
+                f.write("rusage %s: %s\n" % (i, getattr(resources, i)))
+            for i in rusages:
+                f.write("Child rusage %s: %s\n" % (i, getattr(childres, i)))
         if status is "passed":
             f.write("Status: PASSED \n")
         else:



