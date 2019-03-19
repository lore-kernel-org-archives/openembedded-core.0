Return-Path: <Lu.Jiang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3E397CD92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 07:57:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2J7vL8n024220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 00:57:21 -0700 (PDT)
Received: from ljiang0-OptiPlex-9020.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 19 Mar 2019 00:57:20 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 15:54:51 +0800
Message-ID: <20190319075451.18823-3-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190319075451.18823-1-lu.jiang@windriver.com>
References: <20190319075451.18823-1-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [oe-core 2/2] glib-networking:enable glib-networking complie as native package
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
X-List-Received-Date: Tue, 19 Mar 2019 07:57:20 -0000
Content-Type: text/plain

Enable glib-networking compile as a native package, for it is depended by
libsoup.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 .../glib-networking/glib-networking_2.58.0.bb | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
index f3190e1cae..35b4a3fa76 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
@@ -29,3 +29,34 @@ FILES_${PN} += "\
                 "
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
+
+# Make sure we compile with ca-certificates support enabled.
+PACKAGECONFIG_append = " ca-certificates"
+
+DEPENDS += "ca-certificates"
+RDEPENDS_${PN} += "ca-certificates"
+
+# We need native version for ostree-/flatpak-native.
+BBCLASSEXTEND = "native"
+# OE-core's relocatable.bbclass assumes that every package which
+# ends up creating a ${libdir}/pkgconfig directory in its sysroot
+# will always also install .pc-files there and tries to uncondi-
+# tionally update paths in those files using globbing that fails
+# if no such files are present. This presumption is not true for
+# glib-networking which happens to create a directory by dereferencing
+# a GIO pkgconfig variable which in turn is defined relative to
+# the pkgconfig directory (${pcfiledir}/../...), causing pkgconfig
+# to get created.
+#
+# Could be worked around in the upatream recipe but since that
+# does not provide/create native versions of the package and since
+# this problem is related to native packages, we work around it here.
+#
+do_install_append_class-native () {
+    for _pc in ${D}${libdir}/pkgconfig/*.pc; do
+        case $_pc in
+            *'*.pc') rm -fr ${D}${libdir}/pkgconfig;;
+            *.pc)    break;;
+        esac
+    done
+}
-- 
2.17.1


