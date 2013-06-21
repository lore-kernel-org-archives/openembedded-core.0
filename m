Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71574608BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 02:02:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5L22GsX016814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 19:02:16 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 20 Jun 2013 19:02:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2013 10:02:12 +0800
Message-ID: <f5a626a7c73e449e9511d1d1f37827ecccf7e290.1371779031.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1371779031.git.jackie.huang@windriver.com>
References: <cover.1371779031.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 v3] consolekit: move libck-connector to base_libdir
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
X-List-Received-Date: Fri, 21 Jun 2013 02:02:15 -0000
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
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 7d66b39..5feb14f 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r10"
+PR = "r11"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -41,4 +41,15 @@ RDEPENDS_pam-plugin-ck-connector += "${PN}"
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


