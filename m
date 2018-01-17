Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 329A778711
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:22:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0HFMWIK021246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 17 Jan 2018 15:22:33 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ebpXs-0004j6-66; Wed, 17 Jan 2018 15:22:32 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:22:27 +0000
Message-Id: <1516202549-18121-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516202549-18121-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1516202549-18121-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/4] lttng-ust: upgrade 2.9.1 -> 2.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 15:22:34 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb | 37 +++++++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb  | 37 ---------------------------
 2 files changed, 37 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
new file mode 100644
index 0000000..d79a479
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.x"
+DESCRIPTION = "The LTTng UST 2.x package contains the userspace tracer library to trace userspace codes."
+HOMEPAGE = "http://lttng.org/ust"
+BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
+
+LICENSE = "LGPLv2.1+ & MIT & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
+                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
+                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
+
+inherit autotools lib_package manpages
+
+DEPENDS = "liburcu util-linux"
+RDEPENDS_${PN}-bin = "python3-core"
+
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "lttng2-ust"
+RREPLACES_${PN} = "lttng2-ust"
+RCONFLICTS_${PN} = "lttng2-ust"
+
+PE = "2"
+
+SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
+           file://lttng-ust-doc-examples-disable.patch \
+          "
+SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
+SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
+
+CVE_PRODUCT = "ust"
+
+PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
+
+do_install_append() {
+        # Patch python tools to use Python 3; they should be source compatible, but
+        # still refer to Python 2 in the shebang
+        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/lttng-gen-tp
+}
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
deleted file mode 100644
index 03da4ca..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust_2.9.1.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.x"
-DESCRIPTION = "The LTTng UST 2.x package contains the userspace tracer library to trace userspace codes."
-HOMEPAGE = "http://lttng.org/ust"
-BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
-
-LICENSE = "LGPLv2.1+ & MIT & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
-                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
-                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
-
-inherit autotools lib_package manpages
-
-DEPENDS = "liburcu util-linux"
-RDEPENDS_${PN}-bin = "python3-core"
-
-# For backwards compatibility after rename
-RPROVIDES_${PN} = "lttng2-ust"
-RREPLACES_${PN} = "lttng2-ust"
-RCONFLICTS_${PN} = "lttng2-ust"
-
-PE = "2"
-
-SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
-           file://lttng-ust-doc-examples-disable.patch \
-          "
-SRC_URI[md5sum] = "5a5636fc3d9aa370f65b25a802a79e6e"
-SRC_URI[sha256sum] = "b891d267cdbbbd11cf34751f66c21c4a7fdc0eec3c1b53be2c40dca073b7daa4"
-
-CVE_PRODUCT = "ust"
-
-PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
-
-do_install_append() {
-        # Patch python tools to use Python 3; they should be source compatible, but
-        # still refer to Python 2 in the shebang
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/lttng-gen-tp
-}
-- 
2.7.4


