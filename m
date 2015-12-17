Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 633A0731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEs7N2032688; Thu, 17 Dec 2015 14:54:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hQCvTYg6p5OB; Thu, 17 Dec 2015 14:54:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEs16p032685
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Dec 2015 14:54:02 GMT
Message-ID: <1450364041.13505.206.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Thu, 17 Dec 2015 14:54:01 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 2/7] buildstats: Drop get_bn/set_pn and just use BUILDNAME
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
X-List-Received-Date: Thu, 17 Dec 2015 14:54:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current setting and getting of the "name" to use for buildstats is
convoluted and not particularly interesting. We only need this for the
e.getPkgs()[0] component of the path which is the first target listed
on the commandline. This is pretty arbitrary.

If we drop that piece, we can assume BUILDNAME is common for all events
and simply use this and query it. If BUILDNAME did change, that would
be a bug and it should be fixed elsewhere.

Also take the opportunity to share some common code since the function
now has the eventmask.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 04307d8..73e0b2a 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -1,5 +1,4 @@
 BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
-BUILDSTATS_BNFILE = "${BUILDSTATS_BASE}/.buildname"
 
 ################################################################################
 # Build statistics gathering.
@@ -21,20 +20,6 @@ def get_cputime():
         fields = f.readline().rstrip().split()[1:]
     return sum(int(field) for field in fields)
 
-def set_bn(e):
-    bn = e.getPkgs()[0] + "-" + e.data.getVar('MACHINE', True)
-    try:
-        os.remove(e.data.getVar('BUILDSTATS_BNFILE', True))
-    except:
-        pass
-    with open(e.data.getVar('BUILDSTATS_BNFILE', True), "w") as f:
-        f.write(os.path.join(bn, e.data.getVar('BUILDNAME', True)))
-
-def get_bn(e):
-    with open(e.data.getVar('BUILDSTATS_BNFILE', True)) as f:
-        bn = f.readline()
-    return bn
-
 def set_timedata(var, data, server_time=None):
     import time
     if server_time:
@@ -65,7 +50,7 @@ def get_timedata(var, data, server_time=None):
     return timediff, cpuperc
 
 def write_task_data(status, logfile, e):
-    bn = get_bn(e)
+    bn = e.data.getVar('BUILDNAME', True)
     bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
     with open(os.path.join(logfile), "a") as f:
         timedata = get_timedata("__timedata_task", e.data, e.time)
@@ -87,16 +72,15 @@ python run_buildstats () {
     import bb.data
     import time, subprocess, platform
 
+    bn = e.data.getVar('BUILDNAME', True)
+    bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
+    taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
+
     if isinstance(e, bb.event.BuildStarted):
         ########################################################################
         # at first pass make the buildstats heriarchy and then
         # set the buildname
         ########################################################################
-        bb.utils.mkdirhier(e.data.getVar('BUILDSTATS_BASE', True))
-        set_bn(e)
-        bn = get_bn(e)
-
-        bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         bb.utils.mkdirhier(bsdir)
         set_timedata("__timedata_build", e.data)
         build_time = os.path.join(bsdir, "build_stats")
@@ -111,8 +95,6 @@ python run_buildstats () {
             f.write("Build Started: %0.2f \n" % time.time())
 
     elif isinstance(e, bb.event.BuildCompleted):
-        bn = get_bn(e)
-        bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         build_time = os.path.join(bsdir, "build_stats")
         with open(build_time, "a") as f:
             ########################################################################
@@ -127,9 +109,6 @@ python run_buildstats () {
                     f.write("CPU usage: %0.1f%% \n" % cpu)
 
     if isinstance(e, bb.build.TaskStarted):
-        bn = get_bn(e)
-        bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
         set_timedata("__timedata_task", e.data, e.time)
         bb.utils.mkdirhier(taskdir)
         # write into the task event file the name and start time
@@ -138,9 +117,6 @@ python run_buildstats () {
             f.write("Started: %0.2f \n" % e.time)
 
     elif isinstance(e, bb.build.TaskSucceeded):
-        bn = get_bn(e)
-        bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
         write_task_data("passed", os.path.join(taskdir, e.task), e)
         if e.task == "do_rootfs":
             bs = os.path.join(bsdir, "build_stats")
@@ -150,9 +126,6 @@ python run_buildstats () {
                 f.write("Uncompressed Rootfs size: %s" % rootfs_size)
 
     elif isinstance(e, bb.build.TaskFailed):
-        bn = get_bn(e)
-        bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
         write_task_data("failed", os.path.join(taskdir, e.task), e)
         ########################################################################
         # Lets make things easier and tell people where the build failed in



