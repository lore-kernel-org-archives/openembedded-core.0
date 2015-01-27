Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9CA718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 15:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0RFTRNB018896; Tue, 27 Jan 2015 15:29:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e-7lx3I_oi2P; Tue, 27 Jan 2015 15:29:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0RFTBg7018889
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Jan 2015 15:29:22 GMT
Message-ID: <1422372551.19798.53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 15:29:11 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: [PATCH] image: Add missing depends on virtual/kernel for depmod data
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
X-List-Received-Date: Tue, 27 Jan 2015 15:29:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need the depmod data so that the kernel depmod command works successfully
at rootfs time. The fact this was working inconsistently is now highlighted
after the command was made to error out. A simple test case is:

bitbake virtual/kernel image
bitbake vrituak/kernel -c clean
bitbake image -c rootfs -f

We fix it by adding the missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 22b6970..5b88f53 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -72,8 +72,10 @@ LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
 LDCONFIGDEPEND_libc-uclibc = ""
 LDCONFIGDEPEND_libc-musl = ""
 
-do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
-do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
+do_rootfs[depends] += " \
+    makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND} \
+    virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot \
+    virtual/kernel:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_packagedata"
 
 def command_variables(d):



