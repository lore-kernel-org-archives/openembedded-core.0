Received: from mail-ie0-f177.google.com ([209.85.223.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsKe0-0007wr-5d
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 22:54:13 +0100
Received: by mail-ie0-f177.google.com with SMTP id k13so24812082iea.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 13:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=SwmX5gJxLpGnplkiEn9Fz5iWnTakVQoPnkgECwCRNQ4=;
	b=uEev8+twYv1bmRCdv7IdpBvlFeccBJwRLAgqHmojkeLZb/XRXUiVSO7BgWx7sI6IRN
	p/8mMuSWzSjUSTC5Wo2HAk4yUF5V5DwuukiNSnl9hw6F15X3i4MjiV4Di90WU2E5yhzF
	Cl8DO3VTv3M6OUVGUW/AHjk5hfpTpKOfnY4UWCrpH6cwiE8k9wWmo1L3pYTVyMcgBpTU
	nryDYp+zgAFj7dFBua/ykM39KRhM5/L/6W65AeTvKfr8nsA/vUsJ1corF6X3yOL8Qjjg
	m7GmD1zkJocWTo0f0KuOyg1fedBQE7OoY+PvzYkLrYDu4Pj4xrbBKdRtrxzettIb0ZI4
	rpBw==
X-Received: by 10.50.1.200 with SMTP id 8mr6793116igo.76.1357594737912;
	Mon, 07 Jan 2013 13:38:57 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br ([187.23.158.26])
	by mx.google.com with ESMTPS id k5sm8756832igq.9.2013.01.07.13.38.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 13:38:57 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 19:42:39 -0200
Message-Id: <1357594959-31124-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] perl: Remove bashism from perl-tests.inc
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
X-List-Received-Date: Mon, 07 Jan 2013 21:54:14 -0000

The perl-tests.inc file where using the constructs:

 cp {a,b} to/

but this is not supported in every shell so we cannot use it. This
patch fixes it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/perl/perl-tests.inc |    7 ++++---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-tests.inc b/meta/recipes-devtools/perl/perl-tests.inc
index c968eb6..e6de088 100644
--- a/meta/recipes-devtools/perl/perl-tests.inc
+++ b/meta/recipes-devtools/perl/perl-tests.inc
@@ -21,12 +21,13 @@ do_install_append () {
 	cp -pv lib/AnyDBM_File.t ${D}${libdir}/perl/${PV}/
 
 	mkdir -p ${D}${libdir}/perl/${PV}/XS
-	cp -pv lib/XS/{APItest,Typemap}.pm ${D}${libdir}/perl/${PV}/XS/
+	cp -pv lib/XS/APItest.pm ${D}${libdir}/perl/${PV}/XS/
+	cp -pv lib/XS/Typemap.pm ${D}${libdir}/perl/${PV}/XS/
 	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
 	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/APItest/
 	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Typemap/
-
-	cp -pv cpan/Digest-MD5/{README,MD5.xs} ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
+	cp -pv cpan/Digest-MD5/README ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
+	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
 }
 
 FILES_${PN}-tests = "${PERL_TEST_DIR} \
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 8678e76..e62e8ec 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r16"
+PR = "r17"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
-- 
1.7.10.4



