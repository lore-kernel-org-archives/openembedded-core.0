Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 616D06AD47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:18:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5KBImdw023333
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 04:18:49 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 20 Jun 2013 04:18:48 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2013 19:18:44 +0800
Message-ID: <3ef249426f06250a0cb952abaa4f2f0bce40c1c5.1371726748.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1371726748.git.jackie.huang@windriver.com>
References: <cover.1371726748.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2 v2] dbus: move libdbus-1.so* to base_libdir
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
X-List-Received-Date: Thu, 20 Jun 2013 11:18:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

move libdbus-1.so* to base_libdir to kill a warning:

    WARNING: QA Issue: lib32-consolekit: /lib/security/
    pam_ck_connector.so, installed in the base_prefix,
    requires a shared library under exec_prefix (/usr):
    libdbus-1.so.3 => /usr/lib/libdbus-1.so.3 (0xdead3000)

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/dbus/dbus.inc |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 8055824..919d17e 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -12,7 +12,7 @@ DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
 RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
 RDEPENDS_class-native = ""
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -116,6 +116,14 @@ do_install() {
 
 	# Remove /var/run as it is created on startup
 	rm -rf ${D}${localstatedir}/run
+
+	# Move libdbus-1.so.3* to base_libdir
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+	        mkdir -p ${D}/${base_libdir}/
+	        mv -f ${D}${libdir}/libdbus-1.so.3* ${D}${base_libdir}/
+	        rel_lib_prefix=${@os.path.relpath(d.getVar('base_libdir', True), d.getVar('libdir', True))}
+	        ln -sf ${rel_lib_prefix}/libdbus-1.so.3.7.2 ${D}${libdir}/libdbus-1.so
+	fi
 }
 
 do_install_class-native() {
-- 
1.7.4.1


