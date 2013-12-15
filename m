Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C8ED56DDFD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:30:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBFGQciW021151 for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:30:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id B_o02irbrzsW
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:30:36 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBFGUXW9021176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:30:35 GMT
Message-ID: <1387125029.20901.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Dec 2013 16:30:29 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] qemu/local.conf.sample: Add sdl PACKAGECONFIG
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
X-List-Received-Date: Sun, 15 Dec 2013 16:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the SDL configuration option for qemu floats. This is confusing to new users
and makes the build non-determinstic. This patch adds a PACKAGECONFIG option, defaulting
to off and adds documentation to local.conf.sample leaving it on by default since this
is the configuration our quick start assumes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 885d4db..061524a 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -229,6 +229,17 @@ BB_DISKMON_DIRS = "\
 #file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
 #file://.* file:///some/local/dir/sstate/PATH"
 
+
+#
+# Qemu configuration
+#
+# By default qemu will build with a builtin VNC server where graphical output can be
+# seen. The two lines below enable the SDL backend too. This assumes there is a
+# libsdl library available on your build system.
+PACKAGECONFIG_pn-qemu-native = "sdl"
+ASSUME_PROVIDED += "libsdl-native"
+
+
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
 # this doesn't mean anything to you.
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 319dcde..740d571 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -93,6 +93,7 @@ PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
 PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+ libvte,"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
+PACKAGECONFIF[sdl] = "--enable-sdl,--disable-sdl,libsdl,"
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"



