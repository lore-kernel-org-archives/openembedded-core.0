Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QjoFN-0002Dt-UJ
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:04:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L80XXR017509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 01:00:33 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 01:00:33 -0700
Message-ID: <ebaad8dec0cc4643d164c8091a1d0dbd580c7219.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
Old-Date: Wed, 20 Jul 2011 10:16:47 +0800
Date: Thu, 21 Jul 2011 16:00:40 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Wenzong, openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] screen: add pam support
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
X-List-Received-Date: Thu, 21 Jul 2011 08:04:42 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

According to DISTRO_FEATURES then add screen pam support or not.
Press "Ctrl+a x" will lock the screen terminal, then unlock it will
use pam.
Add pam related configure file sceen.pamd from Fedora.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../screen/screen-4.0.3/screen.pamd                |    2 ++
 meta/recipes-extended/screen/screen_4.0.3.bb       |   14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen.pamd

diff --git a/meta/recipes-extended/screen/screen-4.0.3/screen.pamd b/meta/recipes-extended/screen/screen-4.0.3/screen.pamd
new file mode 100644
index 0000000..ff657fa
--- /dev/null
+++ b/meta/recipes-extended/screen/screen-4.0.3/screen.pamd
@@ -0,0 +1,2 @@
+#%PAM-1.0
+auth       include      common-auth
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index dac2893..c5bdf78 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -10,12 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
                     file://screen.h;endline=23;md5=9a7ae69a2aafed891bf7c38ddf9f6b7d"
 
 SECTION = "console/utils"
-DEPENDS = "ncurses"
-PR = "r0"
+DEPENDS = "ncurses \
+		${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-11+lenny1.diff.gz;name=patch \
-           file://configure.patch"
+           file://configure.patch \
+		   file://screen.pamd"
 
 SRC_URI[tarball.md5sum] = "8506fd205028a96c741e4037de6e3c42"
 SRC_URI[tarball.sha256sum] = "78f0d5b1496084a5902586304d4a73954b2bfe33ea13edceecf21615c39e6c77"
@@ -25,5 +27,9 @@ SRC_URI[patch.sha256sum] = "19130d097e9ed897c84a2c640634dd36ee3233c17b0bf5d18549
 
 inherit autotools
 
-EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5"
+EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
+                       ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
+do_install_append () {
+	install -D -m 644 ${WORKDIR}/screen.pamd ${D}/${sysconfdir}/pam.d/screen
+}
-- 
1.7.5.1.300.gc565c



