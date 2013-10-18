Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70F7F6CD55
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 11:11:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9IBBi8u015046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 04:11:44 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 18 Oct 2013 04:11:43 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Oct 2013 19:11:38 +0800
Message-ID: <1382094700-17805-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH V3 1/3] base-files: move shells generating process to pkg_postinst
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
X-List-Received-Date: Fri, 18 Oct 2013 11:11:42 -0000
Content-Type: text/plain

The "shells" file lists several valid login shells, of which some might be
not present in a particular rootfs, this is unreasonable.

Fix it by moving "shells" file generating process to pkg_postinst, for other
shells must do the same thing to register themselves to this file.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-core/base-files/base-files/shells    |    8 --------
 meta/recipes-core/base-files/base-files_3.0.14.bb |   20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/shells

diff --git a/meta/recipes-core/base-files/base-files/shells b/meta/recipes-core/base-files/base-files/shells
deleted file mode 100644
index ce39b3d..0000000
--- a/meta/recipes-core/base-files/base-files/shells
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/shells: valid login shells
-/bin/sh
-/bin/ash
-/bin/bash
-/bin/dash
-/bin/ksh
-/usr/bin/ksh
-/usr/bin/screen
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 054fefa..8e8ee9b 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -16,7 +16,6 @@ SRC_URI = "file://rotation \
            file://inputrc \
            file://host.conf \
            file://profile \
-           file://shells \
            file://fstab \
            file://filesystems \
            file://issue.net \
@@ -92,7 +91,6 @@ do_install () {
 	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
 	sed -i "s#ROOTHOME#${ROOT_HOME}#" ${WORKDIR}/profile
 	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
-	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
 	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
 	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
 	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
@@ -137,6 +135,24 @@ do_install_append_linuxstdbase() {
         done
 }
 
+pkg_postinst_${PN} () {
+	if [ ! -f $D${sysconfdir}/shells ]; then
+		touch $D${sysconfdir}/shells
+	fi
+
+	grep -q "^/bin/sh$" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
+}
+
+pkg_postrm_${PN} () {
+	if [ -f $D${sysconfdir}/shells ]; then
+		printf "$(grep -v "^/bin/sh$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
+
+		if [ ! -s $D${sysconfdir}/shells ]; then
+			rm $D${sysconfdir}/shells
+		fi
+	fi
+}
+
 PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
 FILES_${PN} = "/"
 FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
-- 
1.7.1


