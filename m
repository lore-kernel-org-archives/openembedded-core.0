Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE4160851
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0GAWm0H004049 for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:32:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N2RmLEWmicqp
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:32:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0GAWiue004046
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:32:45 GMT
Message-ID: <1452940364.27999.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Jan 2016 10:32:44 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image: Fix wic environment issues
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
X-List-Received-Date: Sat, 16 Jan 2016 10:32:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The wic environment function needs to run after the rootfs size is
setup. This fixes:

======================================================================
FAIL: test_image_env (oeqa.selftest.wic.Wic)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py", line 106, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py", line 218, in test_image_env
    self.assertTrue(var in content, "%s is not in .env file" % var)
AssertionError: False is not true : ROOTFS_SIZE is not in .env file

Ultimately this code can move to the main wic image task but this 
fixes things for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cc8a23c..8ff157a 100644
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
+python write_wic_env () {
     wicvars = d.getVar('WICVARS', True)
     if not wicvars:
         return
@@ -278,6 +276,7 @@ def write_wic_env(d):
             value = d.getVar(var, True)
             if value:
                 envf.write('%s="%s"\n' % (var, value.strip()))
+}
 
 def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
@@ -393,6 +392,9 @@ python () {
         d.setVarFlag('do_image_%s' % t, 'subimages', subimages)
         d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
 
+        if realt == "wic":
+            d.appendVarFlag('do_image_%s' % t, 'prefuncs', ' write_wic_env')
+
         after = 'do_image'
         for dep in typedeps[t]:
             after += ' do_image_%s' % dep



