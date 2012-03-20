Received: from bluegiga.fi ([194.100.31.45] helo=blue-gw.bluegiga.fi)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lauri.hintsala@bluegiga.com>) id 1S9ymJ-0007Of-BM
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 14:07:07 +0100
Received: from bgtlh.bgt.local (unknown [10.1.1.28])
	by blue-gw.bluegiga.fi (Postfix) with ESMTP id 5EBA07BE26E;
	Tue, 20 Mar 2012 14:58:16 +0200 (EET)
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 14:58:02 +0200
Message-Id: <1332248282-5226-1-git-send-email-lauri.hintsala@bluegiga.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/1] xserver-kdrive: compile xserver without dtrace support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 13:07:07 -0000

Cross compiling of xserver-kdrive fails if dtrace is enabled. Configure
script enables dtrace automatically if dtrace binary exists. xserver-kdrive
compiling was failed if systemtap package was builded beforehand because
systemtap provides dtrace binary.

Signed-off-by: Lauri Hintsala <lauri.hintsala@bluegiga.com>
---
This issue has been existed also with xserver-xorg. It was already fixed
to xserver-xorg by commit 01c1a0f7.
---
 .../xorg-xserver/xserver-kdrive.inc                |    1 +
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
index 52b63ed..58dee27 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
@@ -102,6 +102,7 @@ EXTRA_OECONF = "--enable-composite --enable-kdrive \
                 --disable-xkb --disable-xnest --disable-xvfb \
                 --disable-xevie --disable-xprint --disable-xtrap \
                 --disable-dmx \
+                --without-dtrace \
                 --with-default-font-path=built-ins \
                 --enable-tslib --enable-xcalibrate \
                 ac_cv_file__usr_share_X11_sgml_defs_ent=no"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
index 3b3a004..360a0f3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xkeyboard-config"
 EXTRA_OECONF += "--disable-glx"
 
 PE = "1"
-PR = "r28"
+PR = "r29"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	file://extra-kmodes.patch \
-- 
1.7.4.1



