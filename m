Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2557874242
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 14:21:23 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so30765916wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=5V9s4980mDxTAuuyA3yty/py3y3PFSQ97aOecChMAjA=;
	b=T3ZopwCAtXDsDpAozV+7R0LYYALJtuChbFa0LLTaz5zBo8IxJkBwWwI9IwG8gt2lKE
	phS+QrOhyCau9D5CANiOlf5FCNP2WdW4OeUIJLqQpO61mFeGz03zq0ms2RJrUm+pVR9l
	evKWn37DeyViAa3bIJGlcFxyuOzF/b2CSPEWbguiN0FHR2in982iDPwNwhRP3AoYqIBC
	q2dRcNEDnHu9TL4RpH/tPpQ5wT4DYNr/FYeeINlziw95fGV7xL90ZuqgavHXNec9V0ZT
	TCRx6BJpTWUo4eod/ihpih1XnJCkeX7jhT46J8LOyFgFjmienahVtfHcS1ks0QG+wskq
	QVpQ==
X-Received: by 10.194.21.199 with SMTP id x7mr8937570wje.63.1444314083169;
	Thu, 08 Oct 2015 07:21:23 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id d8sm5068113wiy.1.2015.10.08.07.21.22
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 07:21:22 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 8 Oct 2015 16:21:21 +0200
Message-Id: <C5B806CA-2384-4924-8FA7-8BC6F146416A@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH 1/3] perl: fix Perl5 module builds
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
X-List-Received-Date: Thu, 08 Oct 2015 14:21:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This patch fixes some issues in classes providing cpan module build =
support:

* add support even for xs modules with more than 3 levels as
  B::Hooks::End::Of::Scope or Math::Random::ISAAC::XS
* correct handling of Module::Build (as far as stolen from pkgsrc
  and my humble knowledge)
* configure to install to vendor_libs as default, even when
  inherited do_install remains unused (overwritten do_install)

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/cpan-base.bbclass  |  4 ++++
 meta/classes/cpan.bbclass       |  2 +-
 meta/classes/cpan_build.bbclass | 13 +++++++++++--
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cpan-base.bbclass =
b/meta/classes/cpan-base.bbclass
index d9817ba..7810a4d 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -49,7 +49,11 @@ PERLVERSION[vardepvalue] =3D ""
 FILES_${PN}-dbg +=3D "${PERLLIBDIRS}/auto/*/.debug \
                     ${PERLLIBDIRS}/auto/*/*/.debug \
                     ${PERLLIBDIRS}/auto/*/*/*/.debug \
+                    ${PERLLIBDIRS}/auto/*/*/*/*/.debug \
+                    ${PERLLIBDIRS}/auto/*/*/*/*/*/.debug \
                     =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/.debug \
                     =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/.debug \
                     =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/.debug \
+                    =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/*/.debug \
+                    =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/*/*/.debug \
                     "
diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index e2bbd2f..8e079e0 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -17,7 +17,7 @@ export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_vers
=20
 cpan_do_configure () {
 	export PERL5LIB=3D"${PERL_ARCHLIB}"
-	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL ${EXTRA_CPANFLAGS}
+	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
${EXTRA_CPANFLAGS}
=20
 	# Makefile.PLs can exit with success without generating a
 	# Makefile, e.g. in cases of missing configure time
diff --git a/meta/classes/cpan_build.bbclass =
b/meta/classes/cpan_build.bbclass
index 4f648a6..3653748 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -8,6 +8,7 @@ EXTRA_CPAN_BUILD_FLAGS ?=3D ""
 # Env var which tells perl if it should use host (no) or target (yes) =
settings
 export PERLCONFIGTARGET =3D "${@is_target(d)}"
 export PERL_ARCHLIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
 export LD =3D "${CCLD}"
=20
 cpan_build_do_configure () {
@@ -24,14 +25,22 @@ cpan_build_do_configure () {
 				--install_path bindoc=3D${mandir}/man1 \
 				--install_path libdoc=3D${mandir}/man3 \
                                 ${EXTRA_CPAN_BUILD_FLAGS}
+
+	# Build.PLs can exit with success without generating a
+	# Build, e.g. in cases of missing configure time
+	# dependencies. This is considered a best practice by
+	# cpantesters.org. See:
+	#  * http://wiki.cpantesters.org/wiki/CPANAuthorNotes
+	#  * =
http://www.nntp.perl.org/group/perl.qa/2008/08/msg11236.html
+	[ -e Build ] || bbfatal "No Build was generated by Build.PL"
 }
=20
 cpan_build_do_compile () {
-        perl Build
+        perl Build verbose=3D1
 }
=20
 cpan_build_do_install () {
-	perl Build install
+	perl Build install --destdir ${D}
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile do_install
--=20
2.3.8 (Apple Git-58)

--=20
Jens Rehsack - rehsack@gmail.com


