Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhiv-0007k7-Jo
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:32 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgQ3005212; Tue, 7 May 2013 13:58:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u5Bl0l5NP9Zi; Tue,  7 May 2013 13:58:43 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwcGt005188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:40 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRG-0005bz-Nl; Tue, 07 May 2013 13:56:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:55:58 +0100
Message-Id: <1367931368-21504-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/15] buildstats: Update to ensure files are closed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 13:14:39 -0000
X-List-Received-Date: Tue, 07 May 2013 13:14:39 -0000

python3 doesn't like files being left open. This updates the code style
to ensure file are closed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildstats.bbclass |   31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 6fd13a8..453c50b 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -12,12 +12,14 @@ DEVFILE = "${BUILDSTATS_BASE}/.device"
 ################################################################################
 
 def get_process_cputime(pid):
-    fields = open("/proc/%d/stat" % pid, "r").readline().rstrip().split()
+    with open("/proc/%d/stat" % pid, "r") as f:
+        fields = f.readline().rstrip().split()
     # 13: utime, 14: stime, 15: cutime, 16: cstime
     return sum(int(field) for field in fields[13:16])
 
 def get_cputime():
-    fields = open("/proc/stat", "r").readline().rstrip().split()[1:]
+    with open("/proc/stat", "r") as f:
+        fields = f.readline().rstrip().split()[1:]
     return sum(int(field) for field in fields)
 
 def set_bn(e):
@@ -26,14 +28,12 @@ def set_bn(e):
         os.remove(e.data.getVar('BNFILE', True))
     except:
         pass
-    file = open(e.data.getVar('BNFILE', True), "w")
-    file.write(os.path.join(bn, e.data.getVar('BUILDNAME', True)))
-    file.close()
+    with open(e.data.getVar('BNFILE', True), "w") as f:
+        f.write(os.path.join(bn, e.data.getVar('BUILDNAME', True)))
 
 def get_bn(e):
-    file = open(e.data.getVar('BNFILE', True))
-    bn = file.readline()
-    file.close()
+    with open(e.data.getVar('BNFILE', True)) as f:
+        bn = f.readline()
     return bn
 
 def set_device(e):
@@ -63,9 +63,10 @@ def set_device(e):
     ############################################################################
     rdev="NoLogicalDevice"
     try:
-        for line in open("/proc/diskstats", "r"):
-            if majordev == int(line.split()[0]) and minordev == int(line.split()[1]):
-                rdev=line.split()[2]
+        with open("/proc/diskstats", "r") as f:
+            for line in f:
+                if majordev == int(line.split()[0]) and minordev == int(line.split()[1]):
+                    rdev=line.split()[2]
     except:
         pass
     file = open(e.data.getVar('DEVFILE', True), "w")
@@ -85,9 +86,10 @@ def get_diskstats(dev):
     ############################################################################
     DSTAT_KEYS = ['ReadsComp', 'ReadsMerged', 'SectRead', 'TimeReads', 'WritesComp', 'SectWrite', 'TimeWrite', 'IOinProgress', 'TimeIO', 'WTimeIO']  
     try:
-        for x in open("/proc/diskstats", "r"):
-            if dev in x:
-                diskstats_val = x.rstrip().split()[4:]
+        with open("/proc/diskstats", "r") as f:
+            for x in f:
+                if dev in x:
+                    diskstats_val = x.rstrip().split()[4:]
     except IOError as e:
         return
     diskstats = dict(itertools.izip(DSTAT_KEYS, diskstats_val))
@@ -274,7 +276,6 @@ python run_buildstats () {
         file = open(build_status,"a")
         file.write(e.data.expand("Failed at: ${PF} at task: %s \n" % e.task))
         file.close()
-        
 }
 
 addhandler run_buildstats
-- 
1.7.10.4



