Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC90732E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 18:32:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2015 10:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,551,1418112000"; d="scan'208";a="683814285"
Received: from flopezex-desk.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.zpn.intel.com) ([10.219.4.140])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2015 10:32:04 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2015 12:32:14 -0600
Message-Id: <280d35a5f2fd514aaebd4e146ac9b380167d43c0.1423593058.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423593058.git.anibal.limon@linux.intel.com>
References: <cover.1423593058.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1423593058.git.anibal.limon@linux.intel.com>
References: <cover.1423593058.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] xserver-xorg: Improvments in systemd-logind disable
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
X-List-Received-Date: Tue, 10 Feb 2015 18:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add packageconfig for systemd-logind instead of hard disable in
EXTRA_OECONF this allows users to use packageconfig also add
dependency of dbus because systemd-logind require it for communicate
with systemd.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6154295..f0da488 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -114,7 +114,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --with-xkb-output=/var/lib/xkb \
                  --with-sha1=libcrypto \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
-                 --disable-systemd-logind \
 "
 
 PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
@@ -128,6 +127,7 @@ PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtua
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
1.9.1


