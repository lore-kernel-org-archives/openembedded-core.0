Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.51293.1584967062404559416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 05:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02NCbK5G022614
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 05:37:31 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 23 Mar
 2020 05:37:10 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>
Subject: [PATCH V2] nfs-utils: fix do_package error when enable PACKAGECONFIG[nfsv4]
Date: Mon, 23 Mar 2020 20:37:07 +0800
Message-ID: <20200323123707.8368-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311033819.15438-1-yi.zhao@windriver.com>
References: <20200311033819.15438-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Fixes:
ERROR: nfs-utils-2.4.3-r0 do_package: QA Issue: nfs-utils:
Files/directories were installed but not shipped in any package:
/usr/lib/libnfsidmap/nsswitch.so
/usr/lib/libnfsidmap/static.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within do_install.
nfs-utils: 2 installed and not shipped files. [installed-vs-shipped]

Add rdep on python3-core for PACKAGECONFIG[nfsv4] to fix:
ERROR: nfs-utils-2.4.3-r0 do_package_qa: QA Issue: /usr/sbin/clddb-tool
contained in package nfs-utils requires /usr/bin/python3, but no
providers found in RDEPENDS_nfs-utils? [file-rdeps]

Add rdep on libdevmapper for PACKAGECONFIG[nfsv41] to fix:
ERROR: nfs-utils-2.4.3-r0 do_package_qa: QA Issue: /usr/sbin/blkmapd
contained in package nfs-utils requires libdevmapper.so.1.02()(64bit),
but no providers found in RDEPENDS_nfs-utils? [file-rdeps]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
Change in V2: Add more information in commit log

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

