Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 488C66A625
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:03:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4TF3qE2016002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:03:52 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 08:03:52 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 10:09:48 -0500
Message-ID: <1369840203-21898-7-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/21] util-linux: Add ability to compile with nativesdk
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
X-List-Received-Date: Wed, 29 May 2013 15:03:51 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

Some of the tools in the util-linux are used for disk and text file
operations in the nativesdk so as to get around different versions
that may exist on the host system.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc     | 5 ++++-
 meta/recipes-core/util-linux/util-linux_2.23.bb | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b4e64b5..0ada1a5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,6 +20,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=679af3e410ee112a5ec94de6501bf5c3
 inherit autotools gettext pkgconfig systemd
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
+DEPENDS_append_class-nativesdk = " lzo-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
@@ -94,7 +95,9 @@ RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
 
 RRECOMMENDS_${PN}_class-native = ""
+RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
 
 SYSTEMD_PACKAGES = "${PN}-uuidd"
 SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.service"
@@ -214,4 +217,4 @@ ALTERNATIVE_util-linux-reset = "reset"
 ALTERNATIVE_LINK_NAME[reset] = "${bindir}/reset"
 ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/util-linux/util-linux_2.23.bb b/meta/recipes-core/util-linux/util-linux_2.23.bb
index d80b382..5d9a8dc 100644
--- a/meta/recipes-core/util-linux/util-linux_2.23.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.23.bb
@@ -16,3 +16,4 @@ SRC_URI[sha256sum] = "19ee024b4c6678eaa928d38edc011c332b088e0ff06239575f6b7e00a1
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
+EXTRA_OECONF_class-nativesdk += "--disable-fallocate --disable-use-tty-group"
-- 
1.8.1.2.545.g2f19ada


