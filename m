Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UAFuy-000799-Dp
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:29:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q8DFqj015161
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 00:13:15 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 26 Feb 2013 00:13:15 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 16:14:27 +0800
Message-ID: <eeda769365a1e535067b0b80a8f87d66620d48f5.1361866257.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361866256.git.kai.kang@windriver.com>
References: <cover.1361866256.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/5] dpkg: save output of postinstall scripts when image firstboot
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
X-List-Received-Date: Tue, 26 Feb 2013 08:30:29 -0000
X-List-Received-Date: Tue, 26 Feb 2013 08:30:29 -0000
Content-Type: text/plain

When image feature "debug-tweaks" enabled, save output of postinstall
scripts to log file /var/log/postinstall.log when image first boot. And
the log file can be configured.

It also needs image feature "package-management" enabled. If not,
package run-postinsts will be installed and then all packages will be
configured by it. Command 'dpkg --configure' outputs nothing.

[YOCTO #3223]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index fd26c8a..0bc1ae8 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Package maintenance system for Debian."
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
            file://ignore_extra_fields.patch"
@@ -35,13 +35,15 @@ do_configure () {
     autotools_do_configure
 }
 
+POSTLOG ?= "/var/log/postinstall.log"
+REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
 
 DPKG_INIT_POSITION ?= "98"
 do_install_prepend () {
 	install -d ${D}/${sysconfdir}/rcS.d
 	# this happens at S98 where our good 'ole packages script used to run
-	printf "#!/bin/sh
-dpkg --configure -a
+	echo "#!/bin/sh
+dpkg --configure -a ${REDIRECT_CMD}
 rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 " > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
-- 
1.7.5.4



