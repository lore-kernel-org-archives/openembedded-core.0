Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6B9739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 08:48:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t668mk0p001299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 01:48:46 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 6 Jul 2015 01:48:45 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jul 2015 16:47:51 +0800
Message-ID: <51025622cf3d8ae07bbf858b4ea9f55cda576fea.1436172370.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436172370.git.kai.kang@windriver.com>
References: <cover.1436172370.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] initscripts: add /sbin/sushell for systemd service debug-shell
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
X-List-Received-Date: Mon, 06 Jul 2015 08:48:46 -0000
Content-Type: text/plain

Add file /sbin/sushell for systemd service debug-shell which starts with
/bin/sushell when SELinux is enabled. Copy and add sushell file from
Fedora 22.

Add runtime dependency bash as well when systemd is enabled to eliminate
QA warning:

WARNING: QA Issue: /sbin/sushell_initscripts contained in package initscripts
requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/sushell |  5 +++++
 meta/recipes-core/initscripts/initscripts_1.0.bb      | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/sushell

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sushell b/meta/recipes-core/initscripts/initscripts-1.0/sushell
new file mode 100644
index 0000000..7d96941
--- /dev/null
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sushell
@@ -0,0 +1,5 @@
+#!/bin/bash
+
+[ -z "$SUSHELL" ] && SUSHELL=/bin/bash
+
+exec $SUSHELL
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index a086591..c2e815f 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "file://functions \
            file://GPLv2.patch \
            file://dmesg.sh \
            file://logrotate-dmesg.conf \
+           ${@bb.utils.contains('DISTRO_FEATURES','systemd','file://sushell','',d)} \
 "
 
 S = "${WORKDIR}"
@@ -46,7 +47,9 @@ DEPENDS_append = " update-rc.d-native"
 DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 
 PACKAGES =+ "${PN}-functions"
-RDEPENDS_${PN} = "${PN}-functions"
+RDEPENDS_${PN} = "${PN}-functions \
+                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','bash','',d)} \
+		 "
 FILES_${PN}-functions = "${sysconfdir}/init.d/functions*"
 
 ALTERNATIVE_PRIORITY_${PN}-functions = "90"
@@ -104,6 +107,11 @@ do_install () {
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
 	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}/${base_sbindir}
+		install -m 0755 ${WORKDIR}/sushell ${D}/${base_sbindir}
+	fi
 #
 # Install device dependent scripts
 #
-- 
1.9.1


