Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF8F6080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 02:08:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0K28vTo005828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:08:57 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jan 2016 18:08:56 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 10:08:16 +0800
Message-ID: <1453255696-7298-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: fix the ptest
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
X-List-Received-Date: Wed, 20 Jan 2016 02:08:57 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. the ptest should not be run by root user, otherwise test_stdio_wrappers
will failure since root can enter any dir without exec permission, but the
ptest expect the failure
   1_2.44.1-r0/glib-2.44.1/glib/tests/fileutils.c:864:test_stdio_wrappers: assertion failed: (errno == EACCES)

2. if X11 DISTRO_FEATURE is not enabled, not run gdbus-serialization.test
   #dbus-launch --autolaunch=7df84bc5a72041a581d2f44505e7e882 --binary-syntax --close-stderr
    Autolaunch requested, but X11 support not compiled in

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest | 4 +++-
 meta/recipes-core/glib-2.0/glib.inc           | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index 130ae09..5b85e8f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -1,3 +1,5 @@
 #! /bin/sh
 
-gnome-desktop-testing-runner glib
+useradd glib2-test
+su glib2-test -c gnome-desktop-testing-runner glib
+userdel glib2-test
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 785d4d7..06e6825 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -71,6 +71,12 @@ do_install_append () {
 	if [ -f ${D}${bindir}/glib-mkenums ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
 	fi
+
+	if [ -f ${D}${datadir}/installed-tests/glib/gdbus-serialization.test ]; then
+		if ${@bb.utils.contains("DISTRO_FEATURES", "x11", "false", "true", d)}; then
+			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
+		fi
+	fi
 }
 
 RDEPENDS_${PN}-ptest += "\
-- 
2.5.0


