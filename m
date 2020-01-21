Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0AEF67FCCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:47:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so4006722wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=waZMEsJKOrsadn92+xEBwE5fVy5g+jdZz8n/XrxpL1g=;
	b=PR6/Qw6WwGie8ARMfUAwQNGfWDHUMnqVqaBN9jD8A6Hty39o03vfQ0pfD3LyFvaAYi
	AsHZm/a5JMy8ev2SifIdE9mFKEij0qOOJP+PAodcQJ2vPH3+FVLhfaxNYGDHOtBFvpz6
	dcDh3OmmWg/S6zYlmKzJ/sSgPem8DSEYKT70TX1XEjgfBKR84CvX1HKng0hh8cIcbodj
	MD7fi+Bivhc19cR8qoYHcag1e9e/MxN4/AVCrb0v8384xM3308GnKJFamoXCLS+BIN5s
	0nbpwEyCUbWuBJ7dH3s0whTDIquSGf065ceEpevG6UJ6zjwHsaEaq6Nz55QfBLIAEhh1
	E5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=waZMEsJKOrsadn92+xEBwE5fVy5g+jdZz8n/XrxpL1g=;
	b=YCoGP8MamDLdUNR79wYPyUgQwaB3g89Q+oTOKmuMJ7nyiEiQvEV1KpmL1tR5TyrhXA
	uLO3udr7dXrpH5d94iu4PBQPVCqMVpKGNVezQPvau4ztIHRjwhu7y3ZF383YCHM6UHrL
	ZYhCZ4jP95DfbS5jCVddcHRmIJgZI9LyZZUni7WIGNT3tLoBosid3w+FibG9Xx2yenY4
	iYPrl2M6iZMG25/UMP+msiSvGvdwI7mEVw/dHE9lRah92NHRfY1eRclkR/qcW9Q/q+kk
	Y2kGRC9sXg2Pf2y60c6th2BCLseduX9HoXbqbdUD0tThbJV9JXIu7TDiR63M2lBk/apU
	+Q+A==
X-Gm-Message-State: APjAAAVoEvrwXRljGQHO9x+ZB+z+3yM9AhI6VJjvIvDBMnrTPdCGPJd4
	1H3uH4k/RR8HplhpQy2qa5vXrCc9ohU=
X-Google-Smtp-Source: APXvYqwitVKQ7RrKYsQyoPIB8G6aR2uCpP3BUBT7fFCfN/eCtYUUlNGnczxSwfQ048GXt9M9g8w8ZA==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr6000611wro.209.1579625221377; 
	Tue, 21 Jan 2020 08:47:01 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	s65sm4776759wmf.48.2020.01.21.08.47.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 08:47:00 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 17:46:41 +0100
Message-Id: <20200121164641.3443-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH v3] perl: support cpan versions of core modules
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
X-List-Received-Date: Tue, 21 Jan 2020 16:47:01 -0000

Most of perl core modules are dual-life modules which exists on CPAN
as well as they do in perl core. Sometime, fixes are uploaded to CPAN
before a new perl is released which contains the fix of the core
module. Also, some modules recent releases aren't fully backported
to earlier releases (out of support, lack of specific feature, ...),
which makes it up to the distribution build to choose between core
or CPAN version, respectively.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 47 +++++++++++++++++++----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 90a9fad68b..3634122686 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -181,13 +181,13 @@ perl_package_preprocess () {
                -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
                -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
                -e 's:${RECIPE_SYSROOT}::g' \
-            ${PKGD}${bindir}/h2xs \
-            ${PKGD}${bindir}/h2ph \
-            ${PKGD}${bindir}/pod2man \
-            ${PKGD}${bindir}/pod2text \
-            ${PKGD}${bindir}/pod2usage \
-            ${PKGD}${bindir}/podchecker \
-            ${PKGD}${bindir}/podselect \
+            ${PKGD}${bindir}/h2xs.perl \
+            ${PKGD}${bindir}/h2ph.perl \
+            ${PKGD}${bindir}/pod2man.perl \
+            ${PKGD}${bindir}/pod2text.perl \
+            ${PKGD}${bindir}/pod2usage.perl \
+            ${PKGD}${bindir}/podchecker.perl \
+            ${PKGD}${bindir}/podselect.perl \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/config.h \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/perl.h \
             ${PKGD}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/pp.h \
@@ -202,6 +202,39 @@ perl_package_preprocess () {
             ${PKGD}${libdir}/perl5/config.sh
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-misc = "corelist cpan enc2xs encguess h2ph h2xs instmodsh json_pp libnetcfg \
+                     piconv pl2pm pod2html pod2man pod2text pod2usage podchecker podselect \
+                     prove ptar ptardiff ptargrep shasum splain xsubpp zipdetails"
+ALTERNATIVE_LINK_NAME[corelist] = "${bindir}/corelist"
+ALTERNATIVE_LINK_NAME[cpan] = "${bindir}/cpan"
+ALTERNATIVE_LINK_NAME[enc2xs] = "${bindir}/enc2xs"
+ALTERNATIVE_LINK_NAME[encguess] = "${bindir}/encguess"
+ALTERNATIVE_LINK_NAME[h2ph] = "${bindir}/h2ph"
+ALTERNATIVE_LINK_NAME[h2xs] = "${bindir}/h2xs"
+ALTERNATIVE_LINK_NAME[instmodsh] = "${bindir}/instmodsh"
+ALTERNATIVE_LINK_NAME[json_pp] = "${bindir}/json_pp"
+ALTERNATIVE_LINK_NAME[libnetcfg] = "${bindir}/libnetcfg"
+ALTERNATIVE_LINK_NAME[piconv] = "${bindir}/piconv"
+ALTERNATIVE_LINK_NAME[pl2pm] = "${bindir}/pl2pm"
+ALTERNATIVE_LINK_NAME[pod2html] = "${bindir}/pod2html"
+ALTERNATIVE_LINK_NAME[pod2man] = "${bindir}/pod2man"
+ALTERNATIVE_LINK_NAME[pod2text] = "${bindir}/pod2text"
+ALTERNATIVE_LINK_NAME[pod2usage] = "${bindir}/pod2usage"
+ALTERNATIVE_LINK_NAME[podchecker] = "${bindir}/podchecker"
+ALTERNATIVE_LINK_NAME[podselect] = "${bindir}/podselect"
+ALTERNATIVE_LINK_NAME[prove] = "${bindir}/prove"
+ALTERNATIVE_LINK_NAME[ptar] = "${bindir}/ptar"
+ALTERNATIVE_LINK_NAME[ptardiff] = "${bindir}/ptardiff"
+ALTERNATIVE_LINK_NAME[ptargrep] = "${bindir}/ptargrep"
+ALTERNATIVE_LINK_NAME[shasum] = "${bindir}/shasum"
+ALTERNATIVE_LINK_NAME[splain] = "${bindir}/splain"
+ALTERNATIVE_LINK_NAME[xsubpp] = "${bindir}/xsubpp"
+ALTERNATIVE_LINK_NAME[zipdetails] = "${bindir}/zipdetails"
+
 require perl-ptest.inc
 
 FILES_${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/libperl.so* \
-- 
2.17.1


