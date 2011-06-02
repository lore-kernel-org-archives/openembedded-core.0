Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QS6qt-0002Ql-HS for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 14:18:15 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QS6nq-00034h-6x
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 14:15:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Organization: Phil Blundell Consulting Ltd
Date: Thu, 02 Jun 2011 13:15:05 +0100
Message-ID: <1307016905.2529.185.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] eglibc: fix mispackaging of libcidn
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
X-List-Received-Date: Thu, 02 Jun 2011 12:18:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The glob for libc_baselibs was too permissive, causing some of the libcidn
symlinks to be placed in ${PN} rather than the intended subpackage.  Worse,
the .so itself was actually landing in ${PN}-dev, so the net effect was to
make libc6-dev a dependency of libc6.

Bump PRs for both 2.12 and 2.13 as a result.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    6 +++---
 meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 1d3fa9e..76ebdc3 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -37,7 +37,7 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
 
 PACKAGES_DYNAMIC = " \
 		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* \
@@ -74,12 +74,12 @@ RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
 RPROVIDES_eglibc-thread-db = "glibc-thread-db"
 RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
 RPROVIDES_eglibc-dbg = "glibc-dbg"
-libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
+libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_ldd${PKGSUFFIX} = "${bindir}/ldd"
 FILES_libsegfault${PKGSUFFIX} = "${base_libdir}/libSegFault*"
-FILES_libcidn = "${base_libdir}/libcidn*.so"
+FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
 FILES_libmemusage = "${base_libdir}/libmemusage.so"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "/sbin/sln"
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 715b873..e69cd0f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -2,7 +2,7 @@ require eglibc.inc
 
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
-PR = "r13"
+PR = "r14"
 
 SRCREV = "11982"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 398da69..c77bf3c 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -4,7 +4,7 @@ SRCREV = "13356"
 
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
-PR = "r0"
+PR = "r1"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
-- 
1.7.2.5





