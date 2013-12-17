Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E58C76E560
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 09:04:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBH94JjO004179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 01:04:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 17 Dec 2013 01:04:18 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2013 17:05:20 +0800
Message-ID: <81011ef08bf3b30e8ccdf7c9ee58b010d13dec77.1387271027.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1387271027.git.Qi.Chen@windriver.com>
References: <cover.1387271027.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: add ability to set systemd default target
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
X-List-Received-Date: Tue, 17 Dec 2013 09:04:19 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add ability to set the default target for systemd images.

The default value for the target is derived from checking whether
IMAGE_FEATRUES contains 'x11-base' or not. Each image could override
this value in its own recipe. For now, we don't need to do any change,
because all images that support graphical environment has 'x11-base'
in its IMAGE_FEATRUES.

[YOCTO #3816]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c595721..c8366d6 100644
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
@@ -596,6 +599,11 @@ postinst_enable_logging () {
 	echo "LOGFILE=${POSTINST_LOGFILE}" >> ${IMAGE_ROOTFS}${sysconfdir}/default/postinst
 }
 
+# Modify systemd default target
+set_systemd_default_target () {
+	ln -sf ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
+}
+
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
1.7.9.5


