Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6630C6B3A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 09:42:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8B9uYpD026278 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:56:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pDBiR8r4-umR
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:56:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8B9uWAn026273
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:56:33 +0100
Message-ID: <1378892564.3484.172.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 10:42:44 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] image/populate_sdk: Ensure symlinks in target sysroot are relative
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
X-List-Received-Date: Wed, 11 Sep 2013 09:42:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In the target sysroot of an SDK we can have target system absolute links
which don't make sense. This adds a script which fixes them up to become relative
paths instead.

[YOCTO #5020]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4a0946c..f1e62f14 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -4,7 +4,7 @@ inherit populate_sdk_base
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
-POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_install_complementary populate_sdk; "
+POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_install_complementary populate_sdk; rootfs_sysroot_relativelinks; "
 
 inherit gzipnative
 
@@ -617,6 +617,11 @@ rootfs_trim_schemas () {
 	done
 }
 
+# Make any absolute links in a sysroot relative
+rootfs_sysroot_relativelinks () {
+	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
+}
+
 EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
 
 do_fetch[noexec] = "1"
diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
new file mode 100755
index 0000000..2e13744
--- /dev/null
+++ b/scripts/sysroot-relativelinks.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python
+import sys
+import os
+
+# Take a sysroot directory and turn all the abolute symlinks and turn them into
+# relative ones such that the sysroot is usable within another system.
+
+if len(sys.argv) != 2:
+    print("Usage is " + sys.argv[0] + "<directory>")
+    sys.exit(1)
+
+topdir = sys.argv[1]
+topdir = os.path.abspath(topdir)
+
+def handlelink(filep, subdir):
+    link = os.readlink(filep)
+    if link[0] != "/":
+        return
+    if link.startswith(topdir):
+        return
+    #print("Replacing %s with %s for %s" % (link, topdir+link, filep))
+    print("Replacing %s with %s for %s" % (link, os.path.relpath(topdir+link, subdir), filep))
+    os.unlink(filep)
+    os.symlink(os.path.relpath(topdir+link, subdir), filep)
+
+for subdir, dirs, files in os.walk(topdir):
+    for f in files:
+        filep = os.path.join(subdir, f)
+        if os.path.islink(filep):
+            #print("Considering %s" % filep)
+            handlelink(filep, subdir)




