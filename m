Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UPlx2-0003pa-PQ
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 05:44:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3A3QcO3010520
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 20:26:38 -0700 (PDT)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Apr 2013 20:26:38 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2013 11:26:35 +0800
Message-ID: <1365564397-2851-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365564103.git.wenzong.fan@windriver.com>
References: <cover.1365564103.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xcursor-transparent-theme: install index.theme explicitly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 03:44:09 -0000
Content-Type: text/plain

The xcursor-transparent-theme doesn't install index.theme by default,
this might cause below command fails on target:

    $ gtk-update-icon-cache -q /usr/share/icons/xcursor-transparent
    Error: "gtk-update-icon-cache: No theme index file"

Just install index.theme explicitly to remove those error, its content
is from xcursor-transparent-theme's README file.

[YOCTO #4234]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../xcursor-transparent-theme-0.1.1/index.theme       |    2 ++
 .../xcursor-transparent-theme_0.1.1.bb                |   17 ++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/index.theme

diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/index.theme b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/index.theme
new file mode 100644
index 0000000..5300850
--- /dev/null
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/index.theme
@@ -0,0 +1,2 @@
+[Icon Theme]
+Inherits=xcursor-transparent
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
index fecc8ea..93770c1 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
@@ -6,14 +6,25 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SECTION = "x11/base"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/utils/xcursor-transparent-theme-${PV}.tar.gz \
 	   file://use-relative-symlinks.patch \
-	   file://fix_watch_cursor.patch"
+	   file://fix_watch_cursor.patch \
+	   file://index.theme"
 
 SRC_URI[md5sum] = "7b0c623049d4aab20600d6473f8aab23"
 SRC_URI[sha256sum] = "b26adf2d503d01299718390ae39dab4691a67220de09423be0364e9a060bf7e4"
-FILES_${PN} = "${datadir}/icons/xcursor-transparent/cursors/*"
+FILES_${PN} = "${datadir}/icons/xcursor-transparent/cursors/* \
+	   ${datadir}/icons/xcursor-transparent/index.theme"
 
 inherit autotools allarch
+
+# This package doesn't provide index.theme by default, this might cause
+# below command fails on target with error: "No theme index file".
+#
+#    gtk-update-icon-cache -q /usr/share/icons/xcursor-transparent
+#
+do_install_append(){
+    install -m 0644 -D ${WORKDIR}/index.theme ${D}${datadir}/icons/xcursor-transparent/index.theme
+}
-- 
1.7.10.4



