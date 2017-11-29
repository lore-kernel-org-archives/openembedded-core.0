Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F28D465D35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 05:11:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30566771"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Nov 2017 13:11:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 21C15487F167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 13:11:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 29 Nov 2017 13:11:04 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Nov 2017 13:10:33 +0800
Message-ID: <1511932233-21738-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: 21C15487F167.A4935
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libyui
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
X-List-Received-Date: Wed, 29 Nov 2017 05:11:06 -0000
Content-Type: text/plain

Add a new recipe libyui.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/libyui/libyui_git.bb | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/recipes-graphics/libyui/libyui_git.bb

diff --git a/meta/recipes-graphics/libyui/libyui_git.bb b/meta/recipes-graphics/libyui/libyui_git.bb
new file mode 100644
index 0000000..3edb0c6
--- /dev/null
+++ b/meta/recipes-graphics/libyui/libyui_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Libyui is a widget abstraction library providing Qt, GTK and ncurses frontends."
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                   "
+
+SRC_URI = "git://github.com/libyui/libyui.git \
+           "
+
+PV = "3.3.3+git"
+SRCREV = "f4ccea39f6b6f37eabd0a4df49db5f9bcb3c013a"
+
+S = "${WORKDIR}/git"
+
+inherit cmake gettext pkgconfig
+
+DEPENDS += "boost"
+
+BBCLASSEXTEND = "nativesdk"
+
+RDEPENDS_${PN} += "boost"
+
+do_configure_prepend () {
+        cp ${S}/buildtools/CMakeLists.common ${S}/CMakeLists.txt
+}
+
+do_install_append () {
+        rm -rf ${D}${datadir}/libyui
+        if [ ${libdir} = "/usr/lib" ]; then
+            mv ${D}/usr/lib64 ${D}/usr/lib
+        fi
+}
+
+FILES_${PN}-dev = "${libdir}/* ${includedir}/yui*"
+
-- 
2.7.4




