Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D70E07319E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEsKHo032704; Thu, 17 Dec 2015 14:54:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UNiJ6scZchLe; Thu, 17 Dec 2015 14:54:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEsERc032696
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Dec 2015 14:54:15 GMT
Message-ID: <1450364054.13505.208.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Thu, 17 Dec 2015 14:54:14 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 4/7] buildstats: Separate out the build and task data to allow improvements
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
X-List-Received-Date: Thu, 17 Dec 2015 14:54:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The combined build and task data code makes changing things hard, separate
out the functions so that changes can be made to the task data whilst the
build data remains unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 4fa6981..71469e4 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -20,17 +20,33 @@ def get_cputime():
         fields = f.readline().rstrip().split()[1:]
     return sum(int(field) for field in fields)
 
-def set_timedata(var, d, server_time=None):
-    import time
-    if server_time:
-        time = server_time
+def set_timedata(var, d, server_time):
+    cputime = get_cputime()
+    proctime = get_process_cputime(os.getpid())
+    d.setVar(var, (server_time, cputime, proctime))
+
+def get_timedata(var, d, end_time):
+    timedata = d.getVar(var, False)
+    if timedata is None:
+        return
+    oldtime, oldcpu, oldproc = timedata
+    procdiff = get_process_cputime(os.getpid()) - oldproc
+    cpudiff = get_cputime() - oldcpu
+    timediff = end_time - oldtime
+    if cpudiff > 0:
+        cpuperc = float(procdiff) * 100 / cpudiff
     else:
-        time = time.time()
+        cpuperc = None
+    return timediff, cpuperc
+
+def set_buildtimedata(var, d):
+    import time
+    time = time.time()
     cputime = get_cputime()
     proctime = get_process_cputime(os.getpid())
     d.setVar(var, (time, cputime, proctime))
 
-def get_timedata(var, d, server_time=None):
+def get_buildtimedata(var, d):
     import time
     timedata = d.getVar(var, False)
     if timedata is None:
@@ -38,10 +54,7 @@ def get_timedata(var, d, server_time=None):
     oldtime, oldcpu, oldproc = timedata
     procdiff = get_process_cputime(os.getpid()) - oldproc
     cpudiff = get_cputime() - oldcpu
-    if server_time:
-        end_time = server_time
-    else:
-        end_time = time.time()
+    end_time = time.time()
     timediff = end_time - oldtime
     if cpudiff > 0:
         cpuperc = float(procdiff) * 100 / cpudiff
@@ -81,7 +94,7 @@ python run_buildstats () {
         # set the buildname
         ########################################################################
         bb.utils.mkdirhier(bsdir)
-        set_timedata("__timedata_build", d)
+        set_buildtimedata("__timedata_build", d)
         build_time = os.path.join(bsdir, "build_stats")
         # write start of build into build_time
         with open(build_time, "a") as f:
@@ -99,7 +112,7 @@ python run_buildstats () {
             ########################################################################
             # Write build statistics for the build
             ########################################################################
-            timedata = get_timedata("__timedata_build", d)
+            timedata = get_buildtimedata("__timedata_build", d)
             if timedata:
                 time, cpu = timedata
                 # write end of build and cpu used into build_time



