Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TVIhA-0007UI-Oe
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 10:10:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA58uSlR025417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Nov 2012 00:56:28 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 5 Nov 2012 00:56:28 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Mon, 5 Nov 2012 16:56:48 +0800
Message-ID: <7f5360a255d26cdf97d79cd5e47de6f979bc46cb.1352101205.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1352101205.git.kai.kang@windriver.com>
References: <cover.1352101205.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] perl: update RPROVIDES and popuate_package script
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
X-List-Received-Date: Mon, 05 Nov 2012 09:10:13 -0000
Content-Type: text/plain

File warnings/register.pm has been moved to package perl, so update
RPROVIDES_perl to provides perl-module-warnings-register.

And there are some perl module packages that they have "-pm" in package
names. Update popuate_package script to remove these "-pm".

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index bfc34d5..e5a70e1 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r14"
+PR = "r15"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -250,7 +250,8 @@ FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV} \
                ${libdir}/perl/${PV}/warnings \
                ${libdir}/perl/${PV}/vars.pm \
               "
-RPROVIDES_${PN} += "perl-module-strict perl-module-vars perl-module-config perl-module-warnings"
+RPROVIDES_${PN} += "perl-module-strict perl-module-vars perl-module-config perl-module-warnings \
+		    perl-module-warnings-register"
 FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
 FILES_${PN}-lib = "${libdir}/libperl.so* \
                    ${libdir}/perl5 \
@@ -306,7 +307,8 @@ python populate_packages_prepend () {
     libdir = d.expand('${libdir}/perl/${PV}')
     do_split_packages(d, libdir, 'auto/(Encode/.[^/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'auto/([^/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, 'Module/([^\/]*).*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, 'Module/([^\/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     d.setVar("RRECOMMENDS_${PN}-modules", d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', ''))
 }
-- 
1.7.5.4



