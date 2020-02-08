Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF89760647
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 12:49:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 018CnXdU028845
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Feb 2020 04:49:44 -0800
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 8 Feb 2020 04:49:23 -0800
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 8 Feb 2020 20:36:42 +0800
Message-ID: <20200208123642.12567-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] xserver-nodm-init: Fix the start failure for non-root user
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
X-List-Received-Date: Sat, 08 Feb 2020 12:49:54 -0000
Content-Type: text/plain

In order to start the xserver, a non-root user should have the
cap_sys_admin capability to set the drm master. We try to get
the cap_sys_admin capability by setting it in both the thread
and file inheritable set. The side effect of this is that we
would have to add the "pam" to the distro features if we want
use the xserver-nodm-init for a non-root user.

[Yocto #11526]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../x11-common/xserver-nodm-init/capability.conf          | 2 ++
 .../x11-common/xserver-nodm-init/xserver-nodm             | 8 ++++++++
 meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb | 7 +++++--
 3 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf b/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
new file mode 100644
index 000000000000..7ab7460816a8
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
@@ -0,0 +1,2 @@
+cap_sys_admin	@USER@
+none	*
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index 6c548551b870..116bb278bc9b 100755
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
index 385fea5e8399..c2995f99ffe1 100644
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
 
 inherit update-rc.d systemd features_check
 
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
2.21.1


