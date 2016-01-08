Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E17EE60290
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u08IQjKS017153 for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jan 2016 18:26:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RKfI_yQsoqVo
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:26:45 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u08IQeal017149
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jan 2016 18:26:41 GMT
Message-ID: <1452277599.7598.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jan 2016 18:26:39 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_ext: Use new --setscene-only option to bitbake instead of workarounds
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
X-List-Received-Date: Fri, 08 Jan 2016 18:26:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Rather than horrible workarounds, use the new --setscene-only option
of bitbake to pre-populate the SDK structures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/files/ext-sdk-prepare.sh b/meta/files/ext-sdk-prepare.sh
index 160c71e..b3f5d93 100644
--- a/meta/files/ext-sdk-prepare.sh
+++ b/meta/files/ext-sdk-prepare.sh
@@ -5,16 +5,4 @@
 target_sdk_dir="$1"
 sdk_targets="$2"
 
-# Avoid actually building images during this phase, but still
-# ensure all dependencies are extracted from sstate
-# This is a hack, to be sure, but we really don't need to do this here
-for sdktarget in $sdk_targets ; do
-	bbappend=`recipetool newappend $target_sdk_dir/workspace $sdktarget`
-	printf 'python do_rootfs_forcevariable () {\n    bb.utils.mkdirhier(d.getVar("IMAGE_ROOTFS", True))\n}\n' > $bbappend
-	printf 'python do_bootimg () {\n    pass\n}\n' >> $bbappend
-	printf 'python do_bootdirectdisk () {\n    pass\n}\n' >> $bbappend
-	printf 'python do_vmimg () {\n    pass\n}\n' >> $bbappend
-	printf "Created bbappend %s\n" "$bbappend"
-done
-bitbake $sdk_targets || exit 1
-rm -rf $target_sdk_dir/workspace/appends/*
+bitbake $sdk_targets --setscene-only || exit 1
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 7faefab..0872df6 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -178,7 +178,7 @@ def sdk_update(args, config, basepath, workspace):
         sdk_targets = config.get('SDK', 'sdk_targets')
         logger.info("Preparing build system... (This may take some time.)")
         try:
-            exec_build_env_command(config.init_path, basepath, 'bitbake %s' % sdk_targets)
+            exec_build_env_command(config.init_path, basepath, 'bitbake %s --setscene-only' % sdk_targets)
         except:
             logger.error('bitbake %s failed' % sdk_targets)
             return -1



