Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rich.dubielzig@windriver.com>) id 1UE5i0-0002zB-H7
	for Openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 23:24:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r28M7aZN010787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 8 Mar 2013 14:07:37 -0800 (PST)
Received: from ala-lpd-test3.wrs.com (147.11.105.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 8 Mar 2013 14:07:36 -0800
From: Rich Dubielzig <rich.dubielzig@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 8 Mar 2013 14:07:35 -0800
Message-ID: <1362780455-31958-1-git-send-email-rich.dubielzig@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: rich.dubielzig@windriver.com
Subject: [PATCH] eglibc: Handle QA warnings in nativesdk (denzil)
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
X-List-Received-Date: Fri, 08 Mar 2013 22:24:33 -0000
Content-Type: text/plain

/var/db/Makefile and /opt/(sdk path)/etc/ld.so.conf were not
being properly handled by the do_package task in
eglibc-nativesdk.  /var/db is now deleted and /etc/ld.so.conf
is being included in the -utils subpackage.

Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    3 ++-
 meta/recipes-core/eglibc/eglibc_2.15.bb     |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 3298dea..d51d943 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -50,7 +50,7 @@ FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
 FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
 FILES_${PN}-mtrace = "${bindir}/mtrace"
-FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
+FILES_${PN}-utils = "${bindir}/* ${sbindir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
@@ -121,5 +121,6 @@ PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
 eglibc_package_preprocess () {
 	rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
 	rm -rf ${PKGD}/${libdir}/locale
+	rm -rf ${PKGD}/var
 }
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index fe93b4b..b4bf692 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r11"
+PR = "r12"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-- 
1.7.1



