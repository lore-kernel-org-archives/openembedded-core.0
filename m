Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 29311610D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 02:45:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBK2jupC000569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 18:45:56 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.208) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 19 Dec 2013 18:45:55 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Dec 2013 10:45:52 +0800
Message-ID: <e2635c59944a7c63d037add0d577b33ec71b24d1.1387507371.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1387507371.git.Qi.Chen@windriver.com>
References: <cover.1387507371.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 1/1] image.bbclass: add ability to set systemd default target
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
X-List-Received-Date: Fri, 20 Dec 2013 02:45:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add ability to set the default target for systemd images.

The default target for system is controlled by SYSTEMD_DEFAULT_TARGET.
The default value for this variable is derived from checking whether
IMAGE_FEATURES contains 'x11-base' or not. Each image could override
this value in its own recipe. For now, we don't need to do any change,
because all images that support graphical environment has 'x11-base'
in its IMAGE_FEATURES.

[YOCTO #3816]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c595721..4c63bc2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -186,6 +186,9 @@ IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTPROCESS_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
+# Set default target for systemd images
+SYSTEMD_DEFAULT_TARGET ?= '${@base_contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
@@ -596,6 +599,13 @@ postinst_enable_logging () {
 	echo "LOGFILE=${POSTINST_LOGFILE}" >> ${IMAGE_ROOTFS}${sysconfdir}/default/postinst
 }
 
+# Modify systemd default target
+set_systemd_default_target () {
+	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/systemd/system -a -e ${IMAGE_ROOTFS}${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ]; then
+		ln -sf ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
+	fi
+}
+
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
1.7.9.5


