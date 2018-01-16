Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 003F0784E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 06:53:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0G6rck4001147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 22:53:38 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 15 Jan 2018 22:53:38 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jan 2018 14:51:15 +0800
Message-ID: <45b3381408f1791004f5d8a01fc84a3772b8d607.1516084922.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1516084922.git.jackie.huang@windriver.com>
References: <cover.1516084922.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glibc: re-package for libnss-db
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
X-List-Received-Date: Tue, 16 Jan 2018 06:53:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

On other distros like ubuntu/centos, libnss-db usually provides:
- The libraries
- The Makefile to create database
  (in /var/db for centos, /var/lib/misc/ for ubuntu)
- The makedb command (it's in glibc-common for centos7)

What we had is:
- The libraries are in glibc-extra-nss
- The Makefile is removed
- The makedb command is in glibc-utils (lack of dependency)

So when glibc-extra-nss is installed but glibc-utils is not,
we see error like:
nscd[165]: 165 checking for monitored file `/var/db/group.db': No such file or directory
nscd[165]: 165 checking for monitored file `/var/db/passwd.db': No such file or directory

And there is not an easy way to create these databases.

To fix the issue:
- Re-package the libraries into libnss-db
- Don't remove the Makefile and add it in libnss-db
- Add RDEPENDS on glibc-utils for libnss-db, and add RSUGGESTS on make
  since it's optional to generate the db with make.

Notes:
For external toolchain, an extra package 'libnss-db' need to be provided
If replacing glibc from core.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 817d850358..6ee33e61e6 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
@@ -23,6 +23,9 @@ FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
 FILES_libmemusage = "${base_libdir}/libmemusage.so"
+FILES_libnss-db = "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_db-*.so ${localstatedir}/db/Makefile"
+RDEPENDS_libnss-db = "${PN}-utils"
+RSUGGESTS_libnss-db = "make"
 FILES_glibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
 FILES_sln = "${base_sbindir}/sln"
 FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
@@ -59,7 +62,6 @@ inherit libc-common multilib_header
 
 do_install_append () {
 	rm -f ${D}${sysconfdir}/localtime
-	rm -rf ${D}${localstatedir}
 
 	# remove empty glibc dir
 	if [ -d ${D}${libexecdir} ]; then
-- 
2.11.0


