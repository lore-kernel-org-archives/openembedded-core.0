Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 740426B9F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2013 11:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="391068608"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2013 11:04:39 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 38CB42C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:37 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:22 +0300
Message-Id: <faa5e13e5ce31b942dc438ecc50d6181b57000d3.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 12/19] lib/oeqa/utils: qemurunner: save host IP address
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:38 -0000

From: Mihai Lindner <mihaix.lindner@linux.intel.com>

Save host IP address to host_ip.
Read /proc/PID/cmdline on host to look for IPs of target and host;
instead of running 'ps'.
Also removed some extra empty lines from file.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 20bb1e5..9ae618f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -54,7 +54,6 @@ class QemuRunner:
 
     def launch(self, qemuparams = None):
 
-
         if self.display:
             os.environ["DISPLAY"] = self.display
         else:
@@ -84,12 +83,11 @@ class QemuRunner:
 
         if self.is_alive():
             bb.note("qemu started - qemu procces pid is %s" % self.qemupid)
-            pscmd = 'ps -p %s -fww | grep -o "192\.168\.7\.[0-9]*::" | awk -F":" \'{print $1}\'' % self.qemupid
-            self.ip = subprocess.Popen(pscmd,shell=True,stdout=subprocess.PIPE).communicate()[0].strip()
+            cmdline = open('/proc/%s/cmdline' % self.qemupid).read()
+            self.ip, _, self.host_ip = cmdline.split('ip=')[1].split(' ')[0].split(':')[0:3]
             if not re.search("^((?:[0-9]{1,3}\.){3}[0-9]{1,3})$", self.ip):
                 bb.note("Couldn't get ip from qemu process arguments, I got '%s'" % self.ip)
-                bb.note("Here is the ps output:\n%s" % \
-                        subprocess.Popen("ps -p %s -fww" % self.qemupid,shell=True,stdout=subprocess.PIPE).communicate()[0])
+                bb.note("Here is the ps output:\n%s" % cmdline)
                 self.kill()
                 return False
             bb.note("IP found: %s" % self.ip)
@@ -122,7 +120,6 @@ class QemuRunner:
                             sock.close()
                             stopread = True
 
-
             if not reachedlogin:
                 bb.note("Target didn't reached login boot in %d seconds" % self.boottime)
                 lines = "\n".join(self.bootlog.splitlines()[-5:])
@@ -139,7 +136,6 @@ class QemuRunner:
 
         return self.is_alive()
 
-
     def kill(self):
         if self.server_socket:
             self.server_socket.close()
@@ -207,4 +203,3 @@ class QemuRunner:
             basecmd = os.path.basename(basecmd)
             if "qemu-system" in basecmd and "-serial tcp" in commands[p]:
                 return [int(p),commands[p]]
-
-- 
1.8.3.1


