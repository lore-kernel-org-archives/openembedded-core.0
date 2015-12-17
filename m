Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 951F57319A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEsvcQ000310; Thu, 17 Dec 2015 14:54:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2dmLgSpBupXL; Thu, 17 Dec 2015 14:54:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEsrJQ000304
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Dec 2015 14:54:54 GMT
Message-ID: <1450364093.13505.210.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, "toaster@yoctoproject.org"
	<toaster@yoctoproject.org>, "Flanagan, Elizabeth"
	<elizabeth.flanagan@intel.com>
Date: Thu, 17 Dec 2015 14:54:53 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 6/7] toaster: Update for buildstats changes
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
X-List-Received-Date: Thu, 17 Dec 2015 14:54:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This updates the toaster class to use the new data format from buildstats.
This does mean it will no longer read IO data from older builds, however
since that data is completely useless anyway, I don't consider that to be
an issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index d63cff5..7af495e 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -199,8 +199,6 @@ python toaster_collect_task_stats() {
     def _read_stats(filename):
         cpu_usage = 0
         disk_io = 0
-        startio = '0'
-        endio = '0'
         started = '0'
         ended = '0'
         pn = ''
@@ -215,11 +213,11 @@ python toaster_collect_task_stats() {
         if "CPU usage" in statinfo:
             cpu_usage = str(statinfo["CPU usage"]).strip('% \n\r')
 
-        if "EndTimeIO" in statinfo:
-            endio = str(statinfo["EndTimeIO"]).strip('% \n\r')
+        if "IO write_bytes" in statinfo:
+            disk_io = disk_io + str(statinfo["IO write_bytes"]).strip('% \n\r')
 
-        if "StartTimeIO" in statinfo:
-            startio = str(statinfo["StartTimeIO"]).strip('% \n\r')
+        if "IO read_bytes" in statinfo:
+            disk_io = disk_io + str(statinfo["IO read_bytes"]).strip('% \n\r')
 
         if "Started" in statinfo:
             started = str(statinfo["Started"]).strip('% \n\r')
@@ -227,8 +225,6 @@ python toaster_collect_task_stats() {
         if "Ended" in statinfo:
             ended = str(statinfo["Ended"]).strip('% \n\r')
 
-        disk_io = int(endio) - int(startio)
-
         elapsed_time = float(ended) - float(started)
 
         cpu_usage = float(cpu_usage)



