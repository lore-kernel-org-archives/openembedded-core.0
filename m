Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7A46E666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 08:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2T8cAlJ008705; Tue, 29 Mar 2016 09:38:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cBaG7Hb2JgeQ; Tue, 29 Mar 2016 09:38:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2T8c4AO008700
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Mar 2016 09:38:05 +0100
Message-ID: <1459240684.21672.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Mar 2016 09:38:04 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>
Subject: [PATCH] selftest/wic: Fix prebuild to build both the images and wicenv
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
X-List-Received-Date: Tue, 29 Mar 2016 08:38:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without building the images, files wic expects for hddimg aren't
present and this breaks the gummiboot and efi tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3829de2..f3185eb 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -50,7 +50,7 @@ class Wic(oeSelfTest):
         if not Wic.image_is_ready:
             bitbake('syslinux syslinux-native parted-native gptfdisk-native '
                     'dosfstools-native mtools-native')
-            bitbake('core-image-minimal -c do_rootfs_wicenv')
+            bitbake('core-image-minimal:do_rootfs_wicenv core-image-minimal')
             Wic.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)



