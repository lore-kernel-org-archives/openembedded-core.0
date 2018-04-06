Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9F4B75031
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 17:15:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36HFgHZ003614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 18:15:44 +0100
Message-ID: <1523034942.2942.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 06 Apr 2018 18:15:42 +0100
In-Reply-To: <CAMKF1srNsAUyzQCP6x+=vHVqp37R-HUZPSK5KYCFJaK6aQ-ysA@mail.gmail.com>
References: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
	<CAMKF1srQLn+7YKX0AeE00Y+r=7PC4R7cFUjGNm9wjEa0kVr8gA@mail.gmail.com>
	<1523029327.2942.18.camel@linuxfoundation.org>
	<CAMKF1srNsAUyzQCP6x+=vHVqp37R-HUZPSK5KYCFJaK6aQ-ysA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Split glibc and libcrypt
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
X-List-Received-Date: Fri, 06 Apr 2018 17:15:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-04-06 at 09:27 -0700, Khem Raj wrote:
> On Fri, Apr 6, 2018 at 8:42 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Fri, 2018-04-06 at 08:03 -0700, Khem Raj wrote:
> > > 
> > > this series is ok. Although dont like the fact its not upstream
> > > yet
> > > but it reduces glibc baggage for future.
> > Were you able to find out if glibc will definitely do this?
> > 
> I have started a disucussion.

Thanks.

> > I think applying this nativesdk is the only thing we can do right
> > now
> > and it does set us up well to migrate this further if glibc do go
> > for
> > this. After thinking about this a bit, the patch series needs a few
> > minor tweaks to avoid wider testing failures:
> > 
> > a) libxcrypt needs to SkipRecipe in the target case and be
> > nativesdk
> >    only
> > b) We need an RDEPENDS_${PN}_append_class-nativesdk = " libxcrypto"
> > in
> >    glibc-package.inc
> > c) The override used in glibc-pacjage.inc is wrong suggesting the
> > code
> >    can be dropped.
> I think we should apply it for target case too. It will keep things
> simple. We are
> not losing functionality as we have libxcrypt

Its not that simple sadly. These patches as they stand don't let us
build anything nativesdk other that uninative. This is because anything
needing crypt now needs to have a specific dependency. We can't really
have glibc depend on libxcrypt either since its glibc.

I think we can unravel this enough to make 2.5/sumo for nativesdk but
not in the target case, its too late to require people to change
recipes for dependencies.

I started work on a patch to make this work for nativesdk using
virtual/crypt:


diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93f57f3..60590e2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -187,6 +187,7 @@ ASSUME_PROVIDED = "\
     tar-native \
     virtual/libintl-native \
     virtual/libiconv-native \
+    virtual/crypt-native \
     texinfo-native \
     bash-native \
     sed-native \
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 1b54dd8..c4f5f8c 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -16,7 +16,7 @@ RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
-libc_baselibs_remove_class_sdk = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
+#libc_baselibs_remove_class_sdk = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 361a6fd..9e02ffd 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -35,7 +35,10 @@ siteconfig_do_siteconfig_gencache_prepend = " \
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
-PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
+
+CRYPTPROVIDES = "virtual/crypt"
+CRYPTPROVIDES_class-nativesdk = ""
+PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc ${CRYPTPROVIDES}"
 PROVIDES += "virtual/libintl virtual/libiconv"
 inherit autotools texinfo distro_features_check systemd
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
index 638e387..341bbc7 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
@@ -14,6 +14,8 @@ SRCBRANCH ?= "master"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
 
+PROVIDES = "virtual/crypt"
+
 FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowcrypt*.so.* ${libdir}/libowcrypt-*.so"
 
 S = "${WORKDIR}/git"
@@ -21,4 +23,9 @@ S = "${WORKDIR}/git"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 
-BBCLASSEXTEND = "nativesdk"
+python () {
+    if not bb.data.inherits_class('nativesdk', d):
+        raise bb.parse.SkipRecipe("Recipe only applies in nativesdk case for now")
+}
+
+BBCLASSEXTEND = "nativesdk"
\ No newline at end of file
diff --git a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch b/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
index bdf8e32..bb6c573 100644
--- a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
+++ b/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
@@ -5,6 +5,7 @@ Date:   Sat Jan 20 20:22:53 2018 +0100
     pp: Guard fix for really old bug in glibc libcrypt
 
 Upstream-Status: Pending
+Signed-off-by Richard Purdie <richard.purdie@linuxfoundation.org>
 
 diff --git a/pp.c b/pp.c
 index d50ad7ddbf..6510c7b15c 100644
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 66ccd7f..222dd88 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -1,7 +1,7 @@
 require perl.inc
 
 # We need gnugrep (for -I)
-DEPENDS = "db grep-native gdbm zlib"
+DEPENDS = "db grep-native gdbm zlib virtual/crypt"
 
 # Pick up patches from debian
 # http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.22.0-1.debian.tar.xz
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 48a3be8..673207f 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -6,8 +6,7 @@ LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
                     file://src/passwd.c;beginline=8;endline=30;md5=d83888ea14ae61951982d77125947661"
 
-DEPENDS_class-native = ""
-DEPENDS_class-nativesdk = ""
+DEPENDS = "virtual/crypt"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://shadow-4.1.3-dots-in-usernames.patch \


Cheers,

Richard

