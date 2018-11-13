Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D20E600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 09:48:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 01:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,498,1534834800"; d="scan'208";a="273593272"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 13 Nov 2018 01:48:05 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 17:32:55 +0800
Message-Id: <1542101577-59901-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/4] qemurunner: Add support for slirp
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
X-List-Received-Date: Tue, 13 Nov 2018 09:48:05 -0000

Enable qemurunner for slirp. Retrieved the port from localhost
to connect to qemu.

[YOCTO#10713]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index dfab1bd..c29f6d8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -28,7 +28,8 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds, use_kvm, logger):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
+                 use_kvm, use_slirp, logger):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -51,6 +52,7 @@ class QemuRunner:
         self.logged = False
         self.thread = None
         self.use_kvm = use_kvm
+        self.use_slirp = use_slirp
         self.msg = ''
 
         self.runqemutime = 120
@@ -129,6 +131,8 @@ class QemuRunner:
                 self.logger.debug('Not using kvm for runqemu')
             if not self.display:
                 launch_cmd += ' nographic'
+            if self.use_slirp:
+                launch_cmd += ' slirp'
             launch_cmd += ' %s %s' % (self.machine, self.rootfs)
 
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
@@ -238,9 +242,14 @@ class QemuRunner:
                 # because is possible to have control characters
                 cmdline = re_control_char.sub(' ', cmdline)
             try:
-                ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
-                self.ip = ips[0]
-                self.server_ip = ips[1]
+                if self.use_slirp:
+                    tcp_ports = cmdline.split("hostfwd=tcp::")[1]
+                    host_port = tcp_ports[:tcp_ports.find('-')]
+                    self.ip = "localhost:%s" % host_port
+                else:
+                    ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
+                    self.ip = ips[0]
+                    self.server_ip = ips[1]
                 self.logger.debug("qemu cmdline used:\n{}".format(cmdline))
             except (IndexError, ValueError):
                 # Try to get network configuration from runqemu output
-- 
2.7.4


