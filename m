Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id C80B16F719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 15:04:12 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so2297298wiw.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=hABUyvN8nBJtmy9rYuu55EJDvHRMJYrZ/nE/jiVMvAI=;
	b=EdGbuJuGcUON5Fv8vYwzbdt16KZ7EP6f5am8aLFcoxQhohkR0WEB52lXPJOyIuSfKa
	cZ0waacu11ZVrlfApzS9kGE+75DzpdrO6Z2gWYN41X/LvMalKwC2PmjnPr8qR4rOwFrQ
	6C8J8RITYMfVpArtOjiJq2MfuUpszb5HYXopIq7YlfOEIHkFPRzM43Rbs+HB/RvVVFEe
	TFrdVzaptAFnWrQpKMUqGWvIEku+YwLMmUn6dKXB3XXnLWFvg6WTe8kOhuKsPlCOUctV
	ZHghFFUVIE/V7uVduzhWl9Y6F4wDxSXmnBbvHN6cURLuFAxFlHrTq8RzuwIvi/C3LNvq
	vt4A==
X-Gm-Message-State: ALoCoQmE9fja8Gtouuf4c3RJRfjnYu9TXhAhemlXauglVan+efYn52PwylIwXKdneyBoR6fWKYYN
X-Received: by 10.194.241.132 with SMTP id wi4mr18944132wjc.14.1395068652992; 
	Mon, 17 Mar 2014 08:04:12 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id d6sm25714387wiz.4.2014.03.17.08.04.11
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Mar 2014 08:04:12 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 8558D561008; Mon, 17 Mar 2014 15:04:11 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 15:04:10 +0000
Message-Id: <6f3acb92219b832f847d4e59342c8c4582ac5b78.1395068545.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <b01b97b0f8a67d3aeae9ed01e24c5e6bace8e43b.1395068545.git.alexandru.damian@intel.com>
References: <b01b97b0f8a67d3aeae9ed01e24c5e6bace8e43b.1395068545.git.alexandru.damian@intel.com>
In-Reply-To: <cover.1395068545.git.alexandru.damian@intel.com>
References: <cover.1395068545.git.alexandru.damian@intel.com>
Subject: [PATCH 3/3] buildstats: use TaskBase time for elapsed time
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
X-List-Received-Date: Mon, 17 Mar 2014 15:04:13 -0000

From: Marius Avram <marius.avram@intel.com>

To avoid any further inconsistencies between buildstats and buildinfohelper
from toaster, buildstats will measure task duration using the time field
from within the TaskBase events: TaskStarted and TaskSucceeded/TaskFailed.

Signed-off-by: Marius Avram <marius.avram@intel.com>
---
 meta/classes/buildstats.bbclass | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 72fff11..89ae72c 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -109,14 +109,17 @@ def get_diskdata(var, dev, data):
         diskdata["End"+key] = str(int(newdiskdata[key]))    
     return diskdata
     
-def set_timedata(var, data):
+def set_timedata(var, data, server_time=None):
     import time
-    time = time.time()
+    if server_time:
+        time = server_time
+    else:
+        time = time.time()
     cputime = get_cputime()
     proctime = get_process_cputime(os.getpid())
     data.setVar(var, (time, cputime, proctime))
 
-def get_timedata(var, data):
+def get_timedata(var, data, server_time=None):
     import time
     timedata = data.getVar(var, False)
     if timedata is None:
@@ -124,7 +127,11 @@ def get_timedata(var, data):
     oldtime, oldcpu, oldproc = timedata
     procdiff = get_process_cputime(os.getpid()) - oldproc
     cpudiff = get_cputime() - oldcpu
-    timediff = time.time() - oldtime
+    if server_time:
+        end_time = server_time
+    else:
+        end_time = time.time()
+    timediff = end_time - oldtime
     if cpudiff > 0:
         cpuperc = float(procdiff) * 100 / cpudiff
     else:
@@ -136,7 +143,7 @@ def write_task_data(status, logfile, dev, e):
     bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
     taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
     file = open(os.path.join(logfile), "a")
-    timedata = get_timedata("__timedata_task", e.data)
+    timedata = get_timedata("__timedata_task", e.data, e.time)
     if timedata:
         elapsedtime, cpu = timedata
         file.write(bb.data.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
@@ -160,7 +167,7 @@ def write_task_data(status, logfile, dev, e):
 	    file.write("Status: PASSED \n")
     else:
         file.write("Status: FAILED \n")
-    file.write("Ended: %0.2f \n" % time.time())
+    file.write("Ended: %0.2f \n" % e.time)
     file.close()
 
 python run_buildstats () {
@@ -234,7 +241,7 @@ python run_buildstats () {
         taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
         if device != "NoLogicalDevice":
             set_diskdata("__diskdata_task", device, e.data)
-        set_timedata("__timedata_task", e.data)
+        set_timedata("__timedata_task", e.data, e.time)
         try:
             bb.utils.mkdirhier(taskdir)
         except:
@@ -242,7 +249,7 @@ python run_buildstats () {
         # write into the task event file the name and start time
         file = open(os.path.join(taskdir, e.task), "a")
         file.write("Event: %s \n" % bb.event.getName(e))
-        file.write("Started: %0.2f \n" % time.time())
+        file.write("Started: %0.2f \n" % e.time)
         file.close()
 
     elif isinstance(e, bb.build.TaskSucceeded):
-- 
1.8.3.2


