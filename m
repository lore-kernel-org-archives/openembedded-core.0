Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 62499772BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5EYm019639; Fri, 20 Jan 2017 18:05:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Thx37JjlUb1o; Fri, 20 Jan 2017 18:05:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5AOl019625
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdYk-0000v3-Ls; Fri, 20 Jan 2017 18:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:05:05 +0000
Message-Id: <1484935506-3419-13-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/14] wic: rebuild wic-tools if its sysroot doesn't exist
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
X-List-Received-Date: Fri, 20 Jan 2017 18:05:16 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Rebuild wic-tools if its native sysroot doesn't exist to ensure
that all required tools are available.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index f09dbc2..8918cb4 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -175,11 +175,23 @@ def wic_create_subcommand(args, usage_str):
 
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
-        native_sysroot = os.path.join(get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools"))
+        native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE",
+                                         "wic-tools", cache=False)
     else:
         if options.build_rootfs:
             print("Image name is not specified, exiting. (Use -e/--image-name to specify it)\n")
             sys.exit(1)
+        native_sysroot = options.native_sysroot
+
+    if not native_sysroot or not os.path.isdir(native_sysroot):
+        print("Building wic-tools...\n")
+        if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
+                        cookerdata.CookerConfiguration()):
+            sys.exit(1)
+        native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+        if not native_sysroot:
+            print("Unable to find the location of the native tools sysroot to use\n")
+            sys.exit(1)
 
     wks_file = args[0]
 
-- 
2.7.4


