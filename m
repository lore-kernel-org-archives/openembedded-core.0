Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7ED77A50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489757646; x=1521293646;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+385zRtaQ3WosgY1KVrUZqwKGFbpB5poBWQ+/zSjUu4=;
	b=QU7PAtI5zWrzxUqa7+XBhd9XXcKsgWl9iqXSlNjn43enUz/dyIHfRdu7
	MBH1Ivweq7aT/xKdNF1ZWPDtFTS7yA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 06:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,176,1486454400"; d="scan'208";a="1109546023"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2017 06:34:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5BFD62C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 06:34:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 15:18:33 +0200
Message-Id: <19aa7b3c15baf21fda069b9210abfa69c4402810.1489755821.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489755821.git.ed.bartosh@linux.intel.com>
References: <cover.1489755821.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/4] qemurunner: get network params from runqemu output
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
X-List-Received-Date: Fri, 17 Mar 2017 13:34:04 -0000

Parsed runqemu output to get guest network configuration
if it's not present in runqemu command line.

[YOCTO #10833]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 59dc11d..7e5f588 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -37,10 +37,12 @@ class QemuRunner:
         self.runqemu = None
         # pid of the qemu process that runqemu will start
         self.qemupid = None
-        # target ip - from the command line
+        # target ip - from the command line or runqemu output
         self.ip = None
         # host ip - where qemu is running
         self.server_ip = None
+        # target ip netmask
+        self.netmask = None
 
         self.machine = machine
         self.rootfs = rootfs
@@ -192,6 +194,7 @@ class QemuRunner:
                     return False
             time.sleep(1)
 
+        out = self.getOutput(output)
         if self.is_alive():
             logger.info("qemu started - qemu procces pid is %s" % self.qemupid)
             if get_ip:
@@ -203,17 +206,23 @@ class QemuRunner:
                     cmdline = re_control_char.sub('', cmdline)
                 try:
                     ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
-                    if not ips or len(ips) != 3:
-                        raise ValueError
-                    else:
-                        self.ip = ips[0]
-                        self.server_ip = ips[1]
+                    self.ip = ips[0]
+                    self.server_ip = ips[1]
+                    logger.info("qemu cmdline used:\n{}".format(cmdline))
                 except (IndexError, ValueError):
-                    logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, self.getOutput(output)))
-                    self._dump_host()
-                    self.stop()
-                    return False
-                logger.info("qemu cmdline used:\n{}".format(cmdline))
+                    # Try to get network configuration from runqemu output
+                    match = re.match('.*Network configuration: ([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
+                                     out, re.MULTILINE|re.DOTALL)
+                    if match:
+                        self.ip, self.server_ip, self.netmask = match.groups()
+                    else:
+                        logger.error("Couldn't get ip from qemu command line and runqemu output! "
+                                     "Here is the qemu command line used:\n%s\n"
+                                     "and output from runqemu:\n%s" % (cmdline, out))
+                        self._dump_host()
+                        self.stop()
+                        return False
+
                 logger.info("Target IP: %s" % self.ip)
                 logger.info("Server IP: %s" % self.server_ip)
 
@@ -222,12 +231,11 @@ class QemuRunner:
             if not self.thread.connection_established.wait(self.boottime):
                 logger.error("Didn't receive a console connection from qemu. "
                              "Here is the qemu command line used:\n%s\nand "
-                             "output from runqemu:\n%s" % (cmdline,
-                                                           self.getOutput(output)))
+                             "output from runqemu:\n%s" % (cmdline, out))
                 self.stop_thread()
                 return False
 
-            logger.info("Output from runqemu:\n%s", self.getOutput(output))
+            logger.info("Output from runqemu:\n%s", out)
             logger.info("Waiting at most %d seconds for login banner" % self.boottime)
             endtime = time.time() + self.boottime
             socklist = [self.server_socket]
-- 
2.1.4


