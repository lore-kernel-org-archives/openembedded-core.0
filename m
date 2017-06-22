Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id AF4FD78229
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:34:46 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id c11so28273192wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=1tQN1Z19Dydy61/nwlC2xwdsO7a++XAYFhZUIjCHP28=;
	b=pcSm6jUbYIGTFuoJXtDPmZC5EWUllWq1+nqifdg0MX7hDf+fe6ySKhGHfUIy5FhxCj
	flo224NU0UHTVfwo8hej8hlt/0xTKiCqPwovlPaI1CISV1PzElTo5SZ8JSZ+rIpa6rqZ
	9Brwea79tCCtXkJUeVYiCfO4AMam5ukoKw+TgGnYXB70EjxrKq70bW84b4aPz+SwB2/w
	/u+ta7LDr6mt3BqMzmsMUsQvrjBmlmyVaDamiqMB6HoDLTbEu1wqXogKxYzYlByN1VdV
	Ic1voHXM1xR4NPdEB6avrv198uM/qjoctd3IMzVI9+tdrsgp7Pqqn1odXy74o84BrBnB
	yw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1tQN1Z19Dydy61/nwlC2xwdsO7a++XAYFhZUIjCHP28=;
	b=fYO07yhylC9GnAjjFo1hj3GpO7Plmo+GEyo4XewS3ZiSsyKqhfVYcWdXSB92Ucb2sG
	O4mfB1odxbDcqxdL43uA6Odqqp0QBO0uOlH1NBcizw/Y1+tNrBGXnikxSFr5pKN3+wiG
	XlwABdGsG5ii/3COqefRfCkoKax6lhDpuk4JnLbCiUin6gUhJSO5TZCMjC7vFanVRouo
	AB78PjofCAMNt9w/bGQjTps/gLpHXfpX2PTmE4aSVdyKsK0Oe7G6a8rY+mpqMCoqotcb
	1n5SziUhZjNiUJH85WGvZ0RA/03zQI2h2grC+CsevuucK1AX0UcTn0tzAJgMRpDCCP7w
	pAKQ==
X-Gm-Message-State: AKS2vOxxO1HM4drbQaOTLiZOHH/5VnadOgLMIJsvRB3ASTupbsWTQuCs
	e4L8m4e2n2DL7Crs2WI=
X-Received: by 10.28.218.149 with SMTP id r143mr2209917wmg.74.1498145686779;
	Thu, 22 Jun 2017 08:34:46 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	z101sm2271871wrb.41.2017.06.22.08.34.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jun 2017 08:34:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jun 2017 16:34:44 +0100
Message-Id: <20170622153444.28038-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] tcl: cleanups
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
X-List-Received-Date: Thu, 22 Jun 2017 15:34:47 -0000

No need to set DEPENDS_class-native explicitly as self-dependencies are ignored
now.

Don't rewrite do_configure, autotools_do_configure works.

Actually invoke the install-private-headers target (autotools_do_install doesn't
take arguments).

Remove redundant cd.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.6.bb | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.6.bb b/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
index 40cd18fb09a..5cecf65fb67 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
@@ -35,23 +35,15 @@ VER = "${PV}"
 
 inherit autotools ptest binconfig
 
-DEPENDS_class-native = "zlib-native"
-
 EXTRA_OECONF = "--enable-threads --disable-rpath --libdir=${libdir}"
 
-do_configure() {
-	cd ${S}
-	gnu-configize
-	cd ${B}
-	oe_runconf
-}
-
 do_compile_prepend() {
 	echo > ${S}/../compat/fixstrtod.c
 }
 
 do_install() {
-	autotools_do_install install-private-headers
+	autotools_do_install
+	oe_runmake 'DESTDIR=${D}' install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
 	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
@@ -59,7 +51,6 @@ do_install() {
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
-	cd ..
 	for dir in compat generic unix; do
 		install -d ${D}${includedir}/${BPN}${VER}/$dir
 		install -m 0644 ${S}/../$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
-- 
2.11.0


