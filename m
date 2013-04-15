Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1URhWq-0007lm-8R
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:25:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7c89003452; Mon, 15 Apr 2013 12:07:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NMkE1mP7SBZB; Mon, 15 Apr 2013 12:07:40 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7ZxT003439
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 15 Apr 2013 12:07:37 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1URhFh-0006VO-Ko; Mon, 15 Apr 2013 12:07:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 12:07:08 +0100
Message-Id: <1366024028-24911-8-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/7] allarch: Drop various problematic allarch usages
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
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000

In each of these cases allarch is used where the package in question has a
dependency on things which are not allach and change when MACHINE is changed.

This leads to a rebuild of the package each time MACHINE is switched and
the sstate checksum changes. The dependencies in question are not suited
be being marked as ABISAFE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/udev/udev-extraconf_1.0.bb               |    2 --
 meta/recipes-devtools/devel-config/anjuta-remote-run.bb    |    2 --
 meta/recipes-devtools/devel-config/distcc-config.bb        |    2 --
 meta/recipes-devtools/devel-config/nfs-export-root.bb      |    2 --
 meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb   |    2 +-
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb |    2 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb         |    2 --
 7 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
index ea95a60..fd9a333 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
@@ -4,8 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-inherit allarch
-
 PR = "r8"
 
 SRC_URI = " \
diff --git a/meta/recipes-devtools/devel-config/anjuta-remote-run.bb b/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
index 51fdf9e..b9cded7 100644
--- a/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
+++ b/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
@@ -15,5 +15,3 @@ do_install() {
 PACKAGES = "${PN}"
 RDEPENDS_${PN} = "dbus rsync"
 
-inherit allarch
-
diff --git a/meta/recipes-devtools/devel-config/distcc-config.bb b/meta/recipes-devtools/devel-config/distcc-config.bb
index 8deaa66..c9c024d 100644
--- a/meta/recipes-devtools/devel-config/distcc-config.bb
+++ b/meta/recipes-devtools/devel-config/distcc-config.bb
@@ -21,5 +21,3 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "distcc"
-
-inherit allarch
diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
index 4d9f6dd..5fa8cb3 100644
--- a/meta/recipes-devtools/devel-config/nfs-export-root.bb
+++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
@@ -15,5 +15,3 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "packagegroup-core-nfs-server"
-
-inherit allarch
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index a34825a..c99521f 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "fontconfig-utils"
 PR = "r4"
 PE = "1"
 
-inherit allarch fontcache
+inherit fontcache
 
 FONT_PACKAGES = "${PN}"
 
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index ccd865c..75f78a2 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
 PR = "r7"
 RDEPENDS_${PN} = "fontconfig-utils"
 
-inherit allarch fontcache
+inherit fontcache
 
 FONT_PACKAGES = "${PN}"
 
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 49de5a3..2df1347 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -9,8 +9,6 @@ SRC_URI = "file://etc \
 
 S = "${WORKDIR}"
 
-inherit allarch
-
 do_install() {
 	cp -R ${S}/etc ${D}${sysconfdir}
 	chmod -R 755 ${D}${sysconfdir}
-- 
1.7.10.4



