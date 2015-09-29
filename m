Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 06F43762A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 13:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TDQf8j004523 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:26:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DT25ErW23FOJ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:26:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TDQRd0004517
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:26:38 +0100
Message-ID: <1443533187.5162.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Sep 2015 14:26:27 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] prelink: Allow it to work on 64 bit binaries in /lib
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
X-List-Received-Date: Tue, 29 Sep 2015 13:26:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Checks within prelink force 64 bit binaries into lib64 and n32 binaries
into lib32. We load prelink.conf with all combinations but this code
then defeats it for us and means /lib is ignored.

Comment out this code to disable it and allow our settings to work. This
allows 64 bit binaries in /lib to work. We pass in the correct dyanamic 
loader path anyhow and our binaries don't contain ld.so so this should
be safe for us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/prelink/prelink/64bitfix.patch b/meta/recipes-devtools/prelink/prelink/64bitfix.patch
new file mode 100644
index 0000000..74b1a7d
--- /dev/null
+++ b/meta/recipes-devtools/prelink/prelink/64bitfix.patch
@@ -0,0 +1,35 @@
+These checks force 64 bit binaries into lib64 and n32 binaries into lib32. We
+load prelink.conf with all combinations but this code then defeats it for us
+and means /lib is ignored.
+
+Comment out this code to disable it and allow our settings to work. This
+allows 64 bit binaries in /lib to work. We pass in the correct dyanamic 
+loader path anyhow and our binaries don't contain ld.so so this should be
+safe for us.
+
+Upstream-Status: Inappropriate
+RP 2015/9/23
+
+
+Index: trunk/src/rtld/rtld.c
+===================================================================
+--- trunk.orig/src/rtld/rtld.c
++++ trunk/src/rtld/rtld.c
+@@ -334,7 +334,7 @@ load_ld_so_conf (int use_64bit, int use_
+ 
+   /* Only use the correct machine, to prevent mismatches if we
+      have both /lib/ld.so and /lib64/ld.so on x86-64.  */
+-  if (use_64bit)
++  /*if (use_64bit)
+     {
+       dst_LIB = "lib64";
+       add_dir (&ld_dirs, "/lib64/tls", strlen ("/lib64/tls"));
+@@ -350,7 +350,7 @@ load_ld_so_conf (int use_64bit, int use_
+       add_dir (&ld_dirs, "/usr/lib32/tls", strlen ("/usr/lib32/tls"));
+       add_dir (&ld_dirs, "/usr/lib32", strlen ("/usr/lib32"));
+     }
+-  else
++  else*/
+     {
+       dst_LIB = "lib";
+       add_dir (&ld_dirs, "/lib/tls", strlen ("/lib/tls"));
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 79a5f501..0cbce36 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -27,6 +27,7 @@ FILES_${PN}-cron = "${sysconfdir}/cron.daily ${sysconfdir}/default"
 PACKAGES =+ "${PN}-cron"
 
 SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink \
+           file://64bitfix.patch \
            file://prelink.conf \
            file://prelink.cron.daily \
            file://prelink.default \



