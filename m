Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2BF6006E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 09:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8S9CUVs007105; Wed, 28 Sep 2016 10:12:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id itlPSMKm4otY; Wed, 28 Sep 2016 10:12:52 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8S9CmI9007171
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 28 Sep 2016 10:12:49 +0100
Message-ID: <1475053968.30475.63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2016 10:12:48 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] scripts/cleanup-workdir: Adapt to SDK_ARCH -> SDK_SYS chanages for crosssdk
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
X-List-Received-Date: Wed, 28 Sep 2016 09:13:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With the change of crosssdk to use SDK_SYS, we need to update the script
to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 86eae37..98769f6 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -50,12 +50,12 @@ def run_command(cmd):
 def get_cur_arch_dirs(workdir, arch_dirs):
     pattern = workdir + '/(.*?)/'
 
-    cmd = "bitbake -e | grep ^SDK_ARCH="
+    cmd = "bitbake -e | grep ^SDK_SYS="
     output = run_command(cmd)
-    sdk_arch = output.split('"')[1]
+    sdk_sys = output.split('"')[1]
 
     # select thest 5 packages to get the dirs of current arch
-    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk-' + sdk_arch, 'nativesdk-autoconf']
+    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk-' + sdk_sys, 'nativesdk-autoconf']
 
     for pkg in pkgs:
         cmd = "bitbake -e " + pkg + " | grep ^IMAGE_ROOTFS="



