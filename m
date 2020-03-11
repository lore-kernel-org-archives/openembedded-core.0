Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD5361BB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 03:38:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02B3cMOU015201
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 20:38:22 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0;
	Tue, 10 Mar 2020 20:38:22 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2020 11:38:19 +0800
Message-ID: <20200311033819.15438-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [PATCH] nfs-utils: fix do_package error when enable PACKAGECONFIG[nfsv4]
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
X-List-Received-Date: Wed, 11 Mar 2020 03:38:25 -0000
Content-Type: text/plain

Fixes:
ERROR: nfs-utils-2.4.3-r0 do_package: QA Issue: nfs-utils:
Files/directories were installed but not shipped in any package:
/usr/lib/libnfsidmap/nsswitch.so
/usr/lib/libnfsidmap/static.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within do_install.
nfs-utils: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
index 42a4ba3dbd..9bdb6f4ae4 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
@@ -67,9 +67,9 @@ PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # libdevmapper is available in meta-oe
-PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper"
-# keyutils is available in meta-security
-PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils"
+PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
+# keyutils is available in meta-oe
+PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
 
@@ -94,7 +94,9 @@ FILES_${PN}-mount = "${base_sbindir}/*mount.nfs*"
 FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
 RDEPENDS_${PN}-stats = "python3-core"
 
-FILES_${PN} += "${systemd_unitdir}"
+FILES_${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
+
+FILES_${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/"
 
 do_configure_prepend() {
         sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-- 
2.17.1


