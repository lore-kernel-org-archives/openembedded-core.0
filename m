Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0266E760
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 23:12:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s37NCPJU013460
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Apr 2014 16:12:25 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 7 Apr 2014 16:12:25 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Apr 2014 16:12:25 -0700
Message-ID: <1396912345-7880-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] vala: add dependencies on native packages
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
X-List-Received-Date: Mon, 07 Apr 2014 23:12:25 -0000
Content-Type: text/plain

We do not want to run the host xsltproc one time, and ours
another, so we add a dependency on libxslt-native.  We also
need to add a dependency on pkgconfig-native because the host
pkg-config will not see native packages we have built.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/vala/vala.inc |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index a8927d7..9d273aa 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -3,7 +3,13 @@ Vala compiles to plain C and has no runtime environment nor penalities whatsoeve
 SECTION = "devel"
 DEPENDS = "glib-2.0 dbus gtk+"
 BBCLASSEXTEND = "native"
-DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native"
+
+# libxslt provides xsltproc, which is probably on the host, but we want to use ours.
+# We need our pkg-config, too.  (Inheriting pkgconfig supplies that dependency, but
+# we clobber it here).
+#
+DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native libxslt-native pkgconfig-native"
+
 HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
@@ -12,7 +18,8 @@ INC_PR = "r1"
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
-inherit autotools
+
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-vapigen"
 
-- 
1.7.3.4


