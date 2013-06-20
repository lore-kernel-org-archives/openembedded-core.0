Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C28D96AD47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:18:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5KBIp17004893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 04:18:51 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 20 Jun 2013 04:18:50 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2013 19:18:45 +0800
Message-ID: <cca4cd08deeb925b7097989c54f05c9e61e724e5.1371726748.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1371726748.git.jackie.huang@windriver.com>
References: <cover.1371726748.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 v2] consolekit: move libck-connector to base_libdir
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
X-List-Received-Date: Thu, 20 Jun 2013 11:18:49 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

move libck-connector.so.* to base_libdir and move
pam_ck_connector.la to libdir to kill two warnings:

    WARNING: QA Issue: consolekit: /lib64/security/pam_ck_connector.so,
    installed in the base_prefix, requires a shared library under
    exec_prefix (/usr): libck-connector.so.0 => /usr/lib64/
    libck-connector.so.0 (0x00000000dead300

    WARNING: QA Issue: lib32-consolekit: Found a reference to /usr/ in
     /buildarea1/jhuang0/t_multilib/p_x64_0217/bitbake_build/tmp/work/
    x86-wrsmllib32-linux/lib32-consolekit-0.4.5-r10/packages-split/i
    lib32-consolekit/lib/security/pam_ck_connector.la
    WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir
    should not reference anything in exec_prefix

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 7d66b39..fdeb0f5 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r10"
+PR = "r11"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -19,6 +19,7 @@ SRC_URI[md5sum] = "f2657f93761206922d558471a936fbc3"
 SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b223686b9c38"
 
 
+DISTRO_FEATURES += 'pam'
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
@@ -41,4 +42,15 @@ RDEPENDS_pam-plugin-ck-connector += "${PN}"
 do_install_append() {
 	# Remove /var/run from package as console-kit-daemon will populate it on startup
 	rm -fr "${D}${localstatedir}/run"
+	# Moving libck-connector to base_libdir
+	# and moving pam_ck_connector.la to libdir
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+	        mkdir -p ${D}/${base_libdir}/
+	        mv -f ${D}${libdir}/libck-connector.so.0* ${D}${base_libdir}/
+	        rel_lib_prefix=${@os.path.relpath(d.getVar('base_libdir', True), d.getVar('libdir', True))}
+	        ln -sf ${rel_lib_prefix}/libck-connector.so.0.0.0 ${D}${libdir}/libck-connector.so
+	        if [ -f ${D}${base_libdir}/security/pam_ck_connector.la ]; then
+	                mv -f ${D}${base_libdir}/security/pam_ck_connector.la ${D}${libdir}/
+	        fi
+	fi
 }
-- 
1.7.4.1


