Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TNj6z-00070A-P6
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 13:45:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9FBWGKI010195
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2012 04:32:17 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 15 Oct 2012 04:32:16 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Oct 2012 19:32:39 +0800
Message-ID: <b2e451207c62285312f27eb6a6d2003ecbc534f2.1350300631.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1350300631.git.kai.kang@windriver.com>
References: <cover.1350300631.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/2] nativesdk-perl: fix dependecy
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
X-List-Received-Date: Mon, 15 Oct 2012 11:45:34 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

perl use variable "PACKAGES" to calculate dependency of perl-modules. It
works for target perl-modules package, but doesn't work for
nativesdk-perl-modules.

It seems value of "PACKAGES" is cached and doesn't be re-calculate for
nativesdk build. The root cause is still searching.

This patch is a work around to add each single nativesdk perl modules to
be nativesdk-perl-modules's dependencies.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index d9206d8..643ec0d 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r11"
+PR = "r12"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -294,7 +294,6 @@ FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
 # packages (actually the non modules packages and not created too)
 ALLOW_EMPTY_perl-modules = "1"
 PACKAGES_append = " perl-modules "
-RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
 
 python populate_packages_prepend () {
     libdir = d.expand('${libdir}/perl/${PV}')
@@ -302,6 +301,7 @@ python populate_packages_prepend () {
     do_split_packages(d, libdir, 'auto/([^/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'Module/([^\/]*).*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    d.setVar("RRECOMMENDS_${PN}-modules", d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', ''))
 }
 
 PACKAGES_DYNAMIC = "perl-module-*"
-- 
1.7.5.4



