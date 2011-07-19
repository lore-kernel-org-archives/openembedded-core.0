Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjCnm-0004ZC-8E
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 18:05:42 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjCjr-0002Qq-1F
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 18:01:39 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2011 17:01:38 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311091299.30326.38.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] uclibc: improve packaging granularity
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
X-List-Received-Date: Tue, 19 Jul 2011 16:05:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Put each of the libraries into its own package rather than dumping them
all into libc0.  This saves ~300kB on the installed size of an i586 micro-base-image
and avoids the need to set the hated LEAD_SONAME.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/uclibc/uclibc.inc |   31 ++++++++++++++++---------------
 1 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 23a8ecb..222c34f 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -13,7 +13,7 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r2"
+INC_PR = "r4"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
@@ -49,27 +49,28 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 INHIBIT_DEFAULT_DEPS = "1"
 
 PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
-
-LEAD_SONAME = "libc.so"
+PACKAGES =+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm"
+PACKAGES =+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
+
+FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
+FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
+FILES_uclibc-libnsl = "${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so"
+FILES_uclibc-libresolv = "${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so"
+FILES_uclibc-libm = "${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so"
+FILES_uclibc-libdl = "${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so"
+FILES_uclibc-libutil = "${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so"
+FILES_uclibc-libpthread = "${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so"
+FILES_uclibc-librt = "${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so"
 
 # The last line (gdb and lib1) is for uclinux-uclibc builds
-uclibc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so \
-                   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
-                   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
-                   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
-                   ${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
+uclibc_baselibs = "${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
                    ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
-                   ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
-                   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
-                   ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
-                   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
-                   ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so \
                    ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
                   "
 FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
                ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
 FILES_ldd = "${bindir}/ldd"
-FILES_uclibc-dev_append = "\
+FILES_${PN}-dev_append = "\
         ${libdir}/lib*.so \
         ${libdir}/*_nonshared.a \
         ${libdir}/[S]*crt[1in].o \
@@ -84,7 +85,7 @@ FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
 FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
 FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
 
-RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
+RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
-- 
1.7.4.1





