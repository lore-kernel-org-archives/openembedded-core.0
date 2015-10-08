Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id ACE097701C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 14:22:43 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so27655555wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=cnL9k1ER1/fQ6GbRJmXHnhB43aF6VkXIgP1xpDAGf9g=;
	b=VBPhnV0RPe299fxri+6jh9PsL6LKhghHIvVn/1THjiA5NsezJYRsbHixbIn4YJ1EXl
	zTKhlKj8HDSXM+28YAtrnZQojd0qX8rAcPt/schEb2W8WksgF2ymDS7eTGMkc6GaOPw6
	HjRBuzl/lUPBsivBC9ENwacSaUIt8+feUu3eUUE1TTvePZJqorVUq9IIOphcqni1GLSp
	QtODSlMXkwDX9/YF2wNXR2fE+DST6LiU5aHxloSpdsGabS3ITVv/nh2w4qb+ybMEguJH
	+luoSxOCJX+FdJ873opN0w+3uR2xMAR2Bi3oXtJ3Z8NVLJr6ibYY4sg7ZW2KOFAd9jVE
	Kk1A==
X-Received: by 10.180.198.178 with SMTP id jd18mr4571341wic.34.1444314163202; 
	Thu, 08 Oct 2015 07:22:43 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	bh5sm46523858wjb.42.2015.10.08.07.22.42
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 07:22:42 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 8 Oct 2015 16:22:41 +0200
Message-Id: <6D8A1204-72B0-418D-B261-DE743BDD1200@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH 2/3] perl: Correct path for vendorlib, vendorarch, sitelib and sitearch
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
X-List-Received-Date: Thu, 08 Oct 2015 14:22:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


This patch corrects the path specifications when building perl
for vendorlib, vendorarch, sitelib and sitearch to allow newer
dual-life module being installed on host to satisfy configure
and build requirements of some CPAN distributions.

Additionally, fix search path order in perl wrappers.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/perl/perl-native_5.22.0.bb | 16 +++++++++-------
 meta/recipes-devtools/perl/perl_5.22.0.bb        |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb =
b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
index a9a1cab..b4dda31 100644
--- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
@@ -28,16 +28,15 @@ do_configure () {
 		-Dcf_by=3D"Open Embedded" \
 		-Dprefix=3D${prefix} \
 		-Dvendorprefix=3D${prefix} \
-		-Dvendorprefix=3D${prefix} \
 		-Dsiteprefix=3D${prefix} \
 		\
 		-Dbin=3D${STAGING_BINDIR}/${PN} \
 		-Dprivlib=3D${STAGING_LIBDIR}/perl/${PV} \
 		-Darchlib=3D${STAGING_LIBDIR}/perl/${PV} \
-		-Dvendorlib=3D${STAGING_LIBDIR}/perl/${PV} \
-		-Dvendorarch=3D${STAGING_LIBDIR}/perl/${PV} \
-		-Dsitelib=3D${STAGING_LIBDIR}/perl/${PV} \
-		-Dsitearch=3D${STAGING_LIBDIR}/perl/${PV} \
+		-Dvendorlib=3D${STAGING_LIBDIR}/perl/vendor_perl/${PV} \
+		-Dvendorarch=3D${STAGING_LIBDIR}/perl/vendor_perl/${PV} =
\
+		-Dsitelib=3D${STAGING_LIBDIR}/perl/site_perl/${PV} \
+		-Dsitearch=3D${STAGING_LIBDIR}/perl/site_perl/${PV} \
 		\
 		-Duseshrplib \
 		-Dusethreads \
@@ -95,8 +94,11 @@ do_install () {
 		install $i ${D}${libdir}/perl/${PV}/CORE
 	done
=20
-	create_wrapper ${D}${bindir}/perl =
PERL5LIB=3D'$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl:=
${STAGING_LIBDIR}/perl/site_perl/${PV}:${STAGING_LIBDIR}/perl/vendor_perl/=
${PV}'
-	create_wrapper ${D}${bindir}/perl${PV} =
PERL5LIB=3D'$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl$=
{STAGING_LIBDIR}/perl:${STAGING_LIBDIR}/perl/site_perl/${PV}:${STAGING_LIB=
DIR}/perl/vendor_perl/${PV}'
+	# Those wrappers mean that perl installed from sstate (which may =
change
+	# path location) works and that in the nativesdk case, the SDK =
can be
+	# installed to a different location from the one it was built =
for.
+	create_wrapper ${D}${bindir}/perl =
PERL5LIB=3D'$PERL5LIB:${STAGING_LIBDIR}/perl/site_perl/${PV}:${STAGING_LIB=
DIR}/perl/vendor_perl/${PV}:${STAGING_LIBDIR}/perl/${PV}'
+	create_wrapper ${D}${bindir}/perl${PV} =
PERL5LIB=3D'$PERL5LIB:${STAGING_LIBDIR}/perl/site_perl/${PV}:${STAGING_LIB=
DIR}/perl/vendor_perl/${PV}:${STAGING_LIBDIR}/perl/${PV}'
=20
 	# Use /usr/bin/env nativeperl for the perl script.
 	for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb =
b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 3ce7849..f128aca 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -245,7 +245,7 @@ do_install() {
=20
 do_install_append_class-nativesdk () {
         create_wrapper ${D}${bindir}/perl \
-            =
PERL5LIB=3D'$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl:$OEC=
ORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}:$OECORE_NATIVE_SYSROOT/$=
{libdir_nativesdk}/perl/site_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_na=
tivesdk}/perl/vendor_perl/${PV}'
+            =
PERL5LIB=3D'$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site=
_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/vendor_perl/${=
PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
 }
=20
 PACKAGE_PREPROCESS_FUNCS +=3D "perl_package_preprocess"
--=20
2.3.8 (Apple Git-58)

--=20
Jens Rehsack - rehsack@gmail.com


