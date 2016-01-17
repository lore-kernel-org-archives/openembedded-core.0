Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BB9956FF91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBUPNX021023 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:30:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dZoCDE-jTc4W
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:30:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBUK3c021015
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:30:21 GMT
Message-ID: <1453030219.27999.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jan 2016 11:30:19 +0000
In-Reply-To: <1452940364.27999.8.camel@linuxfoundation.org>
References: <1452940364.27999.8.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH v2] image: Fix wic environment issues
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
X-List-Received-Date: Sun, 17 Jan 2016 11:30:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The wic environment function needs to run after the rootfs size is
setup. We move this code to a specific task, and depend on that task
from the wic images and other places its needed.
This fixes:

======================================================================
FAIL: test_image_env (oeqa.selftest.wic.Wic)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py", line 106, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py", line 218, in test_image_env
    self.assertTrue(var in content, "%s is not in .env file" % var)
AssertionError: False is not true : ROOTFS_SIZE is not in .env file

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 89451bd..95c7a9b 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -11,7 +11,7 @@ DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-nativ
 
 # core-image-minimal is referenced in .wks, so we need its rootfs
 # to be ready before our rootfs
-do_rootfs[depends] += "core-image-minimal:do_rootfs"
+do_rootfs[depends] += "core-image-minimal:do_rootfs_wicenv"
 
 IMAGE_ROOTFS_EXTRA_SPACE = "2000"
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cc8a23c..13b77c9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -242,8 +242,6 @@ fakeroot python do_image () {
     pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND", True)
 
     execute_pre_post_process(d, pre_process_cmds)
-
-    write_wic_env(d)
 }
 do_image[dirs] = "${TOPDIR}"
 do_image[umask] = "022"
@@ -264,7 +262,7 @@ addtask do_image_complete after do_image before do_build
 # Write environment variables used by wic
 # to tmp/sysroots/<machine>/imgdata/<image>.env
 #
-def write_wic_env(d):
+python do_rootfs_wicenv () {
     wicvars = d.getVar('WICVARS', True)
     if not wicvars:
         return
@@ -278,6 +276,10 @@ def write_wic_env(d):
             value = d.getVar(var, True)
             if value:
                 envf.write('%s="%s"\n' % (var, value.strip()))
+}
+addtask do_rootfs_wicenv after do_rootfs before do_image_wic
+do_rootfs_wicenv[vardeps] += "${WICVARS}"
+do_rootfs_wicenv[prefuncs] = 'set_image_size'
 
 def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0bf48c0..b9599d8 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -201,7 +201,6 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
 do_image_wic[file-checksums] += "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
-do_image_wic[vardeps] += "${@bb.utils.contains("USING_WIC", "1", "${WICVARS}", "", d)}"
 
 EXTRA_IMAGECMD = ""
 
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 55f6f82..df826ed 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -50,7 +50,7 @@ class Wic(oeSelfTest):
         if not Wic.image_is_ready:
             bitbake('syslinux syslinux-native parted-native gptfdisk-native '
                     'dosfstools-native mtools-native')
-            bitbake('core-image-minimal')
+            bitbake('core-image-minimal:do_image_complete core-image-minimal:do_rootfs_wicenv')
             Wic.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)



