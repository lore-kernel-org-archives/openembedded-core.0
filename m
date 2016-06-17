Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDB173286
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 03:36:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5H3awwm008781
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 20:36:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 16 Jun 2016 20:36:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2016 11:36:46 +0800
Message-ID: <9cc3d71a9624333bd6c3c676ee2b855be1903568.1466134498.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1466134497.git.Qi.Chen@windriver.com>
References: <cover.1466134497.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] systemd-bootchart: add recipe
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
X-List-Received-Date: Fri, 17 Jun 2016 03:36:58 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../systemd-bootchart/systemd-bootchart_230.bb     | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
new file mode 100644
index 0000000..7c135cb
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
@@ -0,0 +1,30 @@
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https"
+
+# Modify these as desired
+PV = "230+git${SRCPV}"
+SRCREV = "dcb246b46239259ec99b3c6e6ab7d27e1a5a8a84"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libxslt-native libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool"
+RDEPENDS_${PN} += "systemd"
+
+inherit pkgconfig autotools systemd
+
+SYSTEMD_SERVICE_${PN} = "systemd-bootchart.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+do_configure_prepend() {
+    # intltool.m4 is a soft link to /usr/share/aclocal/m4, delete it and use the one in our sysroot
+    rm ${S}/m4/intltool.m4
+    cp ${STAGING_DIR_TARGET}${datadir}/aclocal/intltool.m4 ${S}/m4/intltool.m4
+}
+
+FILES_${PN} += "${systemd_unitdir}/systemd-bootchart"
+
+EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
+                 --with-rootlibdir=${base_libdir}"
-- 
1.9.1


