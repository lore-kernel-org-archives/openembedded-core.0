Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QjoFR-0002E3-HY
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:04:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L80b35017523
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 01:00:37 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 01:00:37 -0700
Message-ID: <32d1cb41db60871d067df99d7b24b46a3fe8297e.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
Old-Date: Wed, 20 Jul 2011 11:17:07 +0800
Date: Thu, 21 Jul 2011 16:00:44 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Wenzong, openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] sudo: add pam support
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
X-List-Received-Date: Thu, 21 Jul 2011 08:04:46 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

According to DISTRO_FEATURES to add pam support for sudo, and import
configure file from Fedora.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/sudo/files/sudo.pamd |    6 ++++++
 meta/recipes-extended/sudo/sudo_1.8.1p2.bb |   11 ++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/sudo.pamd

diff --git a/meta/recipes-extended/sudo/files/sudo.pamd b/meta/recipes-extended/sudo/files/sudo.pamd
new file mode 100644
index 0000000..5bc26e7
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/sudo.pamd
@@ -0,0 +1,6 @@
+#%PAM-1.0
+auth       include      common-auth
+account    include      common-account
+password   include      common-password
+session    required     pam_keyinit.so revoke
+session    required     pam_limits.so
diff --git a/meta/recipes-extended/sudo/sudo_1.8.1p2.bb b/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
index 7eba307..529a44b 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
@@ -1,11 +1,16 @@
 require sudo.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
-           file://libtool.patch"
+           file://libtool.patch \
+           file://sudo.pamd"
 
 SRC_URI[md5sum] = "e8330f0e63b0ecb2e12b5c76922818cc"
 SRC_URI[sha256sum] = "281f90c80547cf22132e351e7f61c25ba4ba9cf393438468f318f9a7884026fb"
 
-EXTRA_OECONF += " --with-pam=no"
+EXTRA_OECONF += " ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
+
+do_install_append () {
+	install -D -m 664 ${WORKDIR}/sudo.pamd ${D}/${sysconfdir}/pam.d/sudo
+}
-- 
1.7.5.1.300.gc565c



