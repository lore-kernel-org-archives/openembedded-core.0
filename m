Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56A9774EC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 08:57:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4U8uxF1005054
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 01:57:14 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 01:56:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 17:04:01 +0800
Message-ID: <509cedca74034ccb305042ec33a8aa7480ef747b.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/16] glibc: re-package for libnss-db
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
X-List-Received-Date: Wed, 30 May 2018 08:57:23 -0000
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
- Add RDEPENDS for libnss-db on glibc-utils and make

Notes:
For external toolchain, an extra package 'libnss-db' need to be provided
If replacing glibc from core.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ae3f2f6..ad0c6d5 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
@@ -23,6 +23,8 @@ FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
 FILES_libmemusage = "${base_libdir}/libmemusage.so"
+FILES_libnss-db = "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_db-*.so ${localstatedir}/db/Makefile"
+RDEPENDS_libnss-db = "${PN}-utils make"
 FILES_glibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
 FILES_sln = "${base_sbindir}/sln"
 FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
@@ -59,7 +61,6 @@ inherit libc-common multilib_header
 
 do_install_append () {
 	rm -f ${D}${sysconfdir}/localtime
-	rm -rf ${D}${localstatedir}
 
 	# remove empty glibc dir
 	if [ -d ${D}${libexecdir} ]; then
-- 
2.7.4


