Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T90Ba-0002ag-0P
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 22:57:26 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Sep 2012 13:45:01 -0700
Received: by wgbdr1 with SMTP id dr1so4835475wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 13:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=tkXVXo7UZ3HE3n3ALqlU2B/Wy12O6tasF36v+oy01NU=;
	b=O7VKhk9rPBBLzfJHRU1i8xm8PAtbZz7V+EMdgDUZMJyuxpUasnHcqTFRhdDO67kilg
	R9/7E+UAuoBT5ZyAJfAYsDJqJud5UZYFwCuPZzPChl2GyBSEMLg8AYe1xPHBP3yLHrfh
	T4uadNSWfmfKnZ3g/RwtWq4fejmTpwFy8Xzhi1aRg0nL1n5NBaayVBQV7YOBPh44kLQJ
	5ZEXSBC0gTorNqtExjo3vN8BREZOPcRknVlDBFFiOZ/tFMFohPsjR6+6FGf4As5Z+HGn
	xWvcP4MrYvgKbj86xUH9OD14I5yTiyLLZDZZYFkcJtIzjrwWrYbY2pXYG5rUIJnJzbcj
	YhLg==
Received: by 10.217.1.7 with SMTP id m7mr12391484wes.158.1346791495565;
	Tue, 04 Sep 2012 13:44:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j6sm39410964wiy.4.2012.09.04.13.44.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 13:44:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 21:44:11 +0100
Message-Id: <1346791451-23638-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmqZckXOLU3bdU5t0s0TmBvaY10i7/J2eE8ZMkrMPnb3KQ1K65VEnSPjYiXYP/eXVvLPyCS
Subject: [PATCH] xserver-xorg: make DRI/GLX options respect opengl distro feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 20:57:26 -0000

If the distro doesn't have the opengl feature there's no point building the DRI
or GLX support, making the mesa-dri build dependency optional.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    3 +--
 meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    5 ++++-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc        |    6 ------
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index b588c11..b4a348c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,5 +8,4 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r5"
-
+PR = "r6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 404c488..94e83ea 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -119,8 +119,11 @@ EXTRA_OECONF += "--with-fop=no \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
-PACKAGECONFIG ??= "udev"
+PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '', d)}"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
+PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
+                      --disable-dri --disable-glx,\
+                      xf86driproto dri2proto mesa-dri"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index ca7d33a..1322cfc 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,12 +1,6 @@
 require xserver-xorg-common.inc
 
-PROTO_DEPS += "xf86driproto dri2proto"
-LIB_DEPS += "mesa-dri"
-
 EXTRA_OECONF += "\
-                 --enable-dri \
-                 --enable-dri2 \
-                 --enable-glx-tls \
                  --with-pic \
                  --with-int10=x86emu \
                  --without-xmlto \
-- 
1.7.10



