Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBA477583
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 13:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u86Dijh7030072 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 14:44:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id utK3kz_mEidC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 14:44:45 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u86DifJb030013
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 14:44:42 +0100
Message-ID: <1473169481.20226.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Sep 2016 14:44:41 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa: Use snapshot instead of copying the rootfs image
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
X-List-Received-Date: Tue, 06 Sep 2016 13:44:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Rather than copying images, use the snapshot option to qemu. This fixes a regression
caused by the recent runqemu changes where the wrong images were being testes since
the image is copied without the qemuboot.conf file. This means the latest image is
found by runqemu rather than the specified one, leading to various confused testing
results.

It could be fixed by copying more files but use snapshot mode instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 3209ef0..24669f4 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -119,8 +119,7 @@ class QemuTarget(BaseTarget):
 
         self.image_fstype = self.get_image_fstype(d)
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
-        self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
-        self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
+        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
         self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
         dump_target_cmds = d.getVar("testimage_dump_target", True)
         dump_host_cmds = d.getVar("testimage_dump_host", True)
@@ -166,11 +165,7 @@ class QemuTarget(BaseTarget):
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
 
     def deploy(self):
-        try:
-            bb.utils.mkdirhier(self.testdir)
-            shutil.copyfile(self.origrootfs, self.rootfs)
-        except Exception as e:
-            bb.fatal("Error copying rootfs: %s" % e)
+        bb.utils.mkdirhier(self.testdir)
 
         qemuloglink = os.path.join(self.testdir, "qemu_boot_log")
         if os.path.islink(qemuloglink):
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 2158d69..9783ff8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -134,7 +134,7 @@ class QemuRunner:
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        launch_cmd = 'runqemu '
+        launch_cmd = 'runqemu snapshot '
         if self.use_kvm:
             logger.info('Using kvm for runqemu')
             launch_cmd += 'kvm '



