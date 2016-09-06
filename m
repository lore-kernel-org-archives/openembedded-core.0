Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 031EA7751C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 13:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u86Dgg4R029632 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 14:42:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e6jDR0kJBeb0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 14:42:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u86Dgeut029629
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 14:42:41 +0100
Message-ID: <1473169360.20226.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Sep 2016 14:42:40 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] scripts/runqemu: Add snapshot support
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
X-List-Received-Date: Tue, 06 Sep 2016 13:42:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Allow access to the snapshot option of qemu to simplify some of our runtime
testing to avoid copying images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/runqemu b/scripts/runqemu
index a94cc65..867e818 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -160,7 +160,8 @@ class BaseConfig(object):
         self.custombiosdir = ''
         self.lock = ''
         self.lock_descriptor = ''
-        self. bitbake_e = ''
+        self.bitbake_e = ''
+        self.snapshot = False
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs', 'cpio.gz', 'cpio', 'ramfs')
         self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'vmdk', 'qcow2', 'vdi', 'iso')
 
@@ -312,6 +313,8 @@ class BaseConfig(object):
                 self.vhost_enabled = True
             elif arg == 'slirp':
                 self.slirp_enabled = True
+            elif arg == 'snapshot':
+                self.snapshot = True
             elif arg == 'publicvnc':
                 self.qemu_opt_script += ' -vnc :0'
             elif arg.startswith('tcpserial='):
@@ -750,6 +753,9 @@ class BaseConfig(object):
         # Enable virtio RNG else we can run out of entropy in guests
         self.qemu_opt += " -device virtio-rng-pci"
 
+        if self.snapshot:
+            self.qemu_opt += " -snapshot"
+
         if self.serialstdio:
             logger.info("Interrupt character is '^]'")
             cmd = "stty intr ^]"



