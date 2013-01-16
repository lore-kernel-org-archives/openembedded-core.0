Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TvPvW-0008Mq-FI
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 11:09:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0G9rZNa014159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2013 01:53:35 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 16 Jan 2013 01:53:35 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 16 Jan 2013 17:54:42 +0800
Message-ID: <7c170f98ca5e423f031a3c94ff19506f04c454d8.1358322551.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1358322551.git.kai.kang@windriver.com>
References: <cover.1358322551.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] perl: fix installed but not shipped issue
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
X-List-Received-Date: Wed, 16 Jan 2013 10:09:05 -0000
Content-Type: text/plain

It shows warning when bitbake perl:
WARNING: QA Issue: perl: Files/directories were installed but not
shipped
  /usr/lib/perl/5.14.2/auto/XS/Typemap

That because file Typemap.so is not install correctly. Fix it.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/perl/perl-tests.inc |    1 +
 meta/recipes-devtools/perl/perl_5.14.2.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-tests.inc b/meta/recipes-devtools/perl/perl-tests.inc
index e6de088..b97b467 100644
--- a/meta/recipes-devtools/perl/perl-tests.inc
+++ b/meta/recipes-devtools/perl/perl-tests.inc
@@ -25,6 +25,7 @@ do_install_append () {
 	cp -pv lib/XS/Typemap.pm ${D}${libdir}/perl/${PV}/XS/
 	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
 	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/APItest/
+	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/Typemap
 	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Typemap/
 	cp -pv cpan/Digest-MD5/README ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
 	cp -pv cpan/Digest-MD5/MD5.xs ${D}${PERL_TEST_DIR}/cpan/Digest-MD5/
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index e62e8ec..f924ebd 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r17"
+PR = "r18"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
-- 
1.7.5.4



