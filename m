Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SKI30-0003al-CY
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 01:42:59 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 446B82FF66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 19:33:29 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 16:33:29 -0700
Message-Id: <41a0ab8337b5d29e4fe1d114bf678cb601956e1e.1334705370.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334705370.git.scott.a.garman@intel.com>
References: <cover.1334705370.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1334705370.git.scott.a.garman@intel.com>
References: <cover.1334705370.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 446B82FF66.39E04
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] qemugl: make postinst run at first boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 23:42:59 -0000

The previous postinst script was not working for images which use
RPM because do_rootfs could allow qemugl to be installed after
libgl1, and the postinst needs to run after libgl1 is installed.

Hence, it's being changed to run at first boot instead of during
do_rootfs.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-graphics/mesa/qemugl_git.bb |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-graphics/mesa/qemugl_git.bb
index 378aa65..32980d3 100644
--- a/meta/recipes-graphics/mesa/qemugl_git.bb
+++ b/meta/recipes-graphics/mesa/qemugl_git.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 SRCREV = "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
 
 PV = "0.0+git${SRCPV}"
-PR = "r10"
+PR = "r11"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -34,11 +34,17 @@ do_install () {
     fi
 }
 
+# This cannot be converted to run at pacakge install time, because
+# it depends on being run after the libgl1 package is installed,
+# and RPM cannot guarantee the order of pacakge insallation.
 pkg_postinst_${PN} () {
-    if [ "${PN}" != "qemugl-nativesdk" ]; then
-        rm -f $D${libdir}/libGL.so.1.2
-        ln -s libGL-qemu.so.1.2 $D${libdir}/libGL.so.1.2
-    fi
+#!/bin/sh -e
+if [ x"$D" = "x" ]; then
+	rm -f ${libdir}/libGL.so.1.2
+	ln -s libGL-qemu.so.1.2 ${libdir}/libGL.so.1.2
+else
+	exit 1
+fi
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.5.4



