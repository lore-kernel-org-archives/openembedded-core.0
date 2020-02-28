Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC0A661982
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:10 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272034"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:09 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:28 +0800
Message-Id: <fec05cd1eaaad41fd72a29d7792f1c37d2a82f3e.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 04/22] xserver-nodm-init: Fix the start failure for non-root user
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:09 -0000

From: Kevin Hao <kexin.hao@windriver.com>

In order to start the xserver, a non-root user should have the
cap_sys_admin capability to set the drm master. We try to get
the cap_sys_admin capability by setting it in both the thread
and file inheritable set. The side effect of this is that we
would have to add the "pam" to the distro features if we want
use the xserver-nodm-init for a non-root user.

[Yocto #11526]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cfd71a68a4931c8bda15357ebb1e9ebcf0e302dc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-graphics/x11-common/xserver-nodm-init/capability.conf | 2 ++
 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm   | 8 ++++++++
 meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb         | 7 +++++--
 3 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf b/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
new file mode 100644
index 0000000..7ab7460
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
@@ -0,0 +1,2 @@
+cap_sys_admin	@USER@
+none	*
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index 6c54855..116bb27 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -38,6 +38,14 @@ case "$1" in
            if [ -e /dev/hidraw0 ]; then
                chmod o+rw /dev/hidraw*
            fi
+           # Make sure that the Xorg has the cap_sys_admin capability which is
+           # needed for setting the drm master
+           if ! grep -q "^auth.*pam_cap\.so" /etc/pam.d/su; then
+               echo "auth	optional	pam_cap.so" >>/etc/pam.d/su
+           fi
+           if ! /usr/sbin/getcap $XSERVER |  grep -q cap_sys_admin; then
+               /usr/sbin/setcap cap_sys_admin+eip $XSERVER
+           fi
        fi
 
        # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index a77c564..7f4e1e2 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "file://xserver-nodm \
            file://gplv2-license.patch \
            file://xserver-nodm.service.in \
            file://xserver-nodm.conf.in \
+           file://capability.conf \
 "
 
 S = "${WORKDIR}"
@@ -19,7 +20,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit update-rc.d systemd distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 ${@oe.utils.conditional('ROOTLESS_X', '1', 'pam', '', d)}"
 
 PACKAGECONFIG ??= "blank"
 # dpms and screen saver will be on only if 'blank' is in PACKAGECONFIG
@@ -40,6 +41,8 @@ do_install() {
     if [ "${ROOTLESS_X}" = "1" ] ; then
         XUSER_HOME="/home/xuser"
         XUSER="xuser"
+        install -D capability.conf ${D}${sysconfdir}/security/capability.conf
+        sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/security/capability.conf
     else
         XUSER_HOME=${ROOT_HOME}
         XUSER="root"
@@ -60,7 +63,7 @@ do_install() {
     fi
 }
 
-RDEPENDS_${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuser-account', '', d)}"
+RDEPENDS_${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuser-account libcap libcap-bin', '', d)}"
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
-- 
2.7.4


