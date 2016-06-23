Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37DA673174
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:16:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5N8GWoZ017637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 01:16:32 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 23 Jun 2016 01:16:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2016 16:16:30 +0800
Message-ID: <04d8fc3e44c11f3690fed9a4e5a98e5f5c67d440.1466669684.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1466669684.git.Qi.Chen@windriver.com>
References: <cover.1466669684.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] systemd-bootchart: add recipe
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
X-List-Received-Date: Thu, 23 Jun 2016 08:16:32 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../systemd-bootchart/systemd-bootchart_230.bb     | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
new file mode 100644
index 0000000..3e437f9
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
@@ -0,0 +1,28 @@
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
+DEPENDS = "systemd libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool"
+
+inherit pkgconfig autotools systemd
+
+# Kernel config CONFIG_SCHEDSTAT needs to be enabled for this service to work.
+SYSTEMD_SERVICE_${PN} = "systemd-bootchart.service"
+
+do_configure_prepend() {
+    # intltool.m4 is a soft link to /usr/share/aclocal/m4, delete it and use the one in our sysroot
+    rm -f ${S}/m4/intltool.m4
+}
+
+FILES_${PN} += "${systemd_unitdir}/systemd-bootchart"
+
+EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
+                 --with-rootlibdir=${base_libdir}"
-- 
1.9.1


