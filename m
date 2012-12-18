Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TkuRy-0003nc-UL
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 11:31:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBIAFfDE006450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Dec 2012 02:15:41 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 18 Dec 2012 02:15:41 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Tue, 18 Dec 2012 18:16:28 +0800
Message-ID: <1cc4eb94e2bdb054e28ffe7b1bac166774080579.1355825643.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1355825643.git.kai.kang@windriver.com>
References: <cover.1355825643.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] perl: add sub-package perl-tests
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
X-List-Received-Date: Tue, 18 Dec 2012 10:31:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

In perl source code, run "make test" will run perl test cases. Put these
cases into a seprated sub-package then we can run the perl test on
target.

Add following module to nonxs_ext to install extra modules that required
by perl test cases:
CPAN/Meta CPAN/Meta/YAML Dumpvalue Env File/CheckTree HTTP/Tiny I18N/Collat=
e
JSON/PP Perl/OSType Version/Requirements

Commands to run test:
cd /opt/perl-tests/t && ./TEST

[Yocto 3296]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/perl/perl-5.14.2/config.sh |   18 +++++++++++-
 meta/recipes-devtools/perl/perl-tests.inc        |   34 ++++++++++++++++++=
++++
 meta/recipes-devtools/perl/perl_5.14.2.bb        |    3 +-
 3 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-tests.inc

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipe=
s-devtools/perl/perl-5.14.2/config.sh
index d1db02e..324a67c 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
@@ -847,7 +847,23 @@ netdb_net_type=3D'in_addr_t'
 nm=3D'nm'
 nm_opt=3D''
 nm_so_opt=3D'--dynamic'
-nonxs_ext=3D'Archive/Extract Archive/Tar Attribute/Handlers AutoLoader B/D=
ebug B/Deparse B/Lint CGI CPAN CPANPLUS CPANPLUS/Dist/Build Class/ISA Devel=
/SelfStubber Digest Errno ExtUtils/CBuilder ExtUtils/Command ExtUtils/Const=
ant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/ParseXS =
File/Fetch File/Path File/Temp FileCache Filter/Simple Getopt/Long I18N/Lan=
gTags IO/Compress IO/Zlib IPC/Cmd IPC/Open2 IPC/Open3 Locale/Codes Locale/M=
aketext Locale/Maketext/Simple Log/Message Log/Message/Simple Math/BigInt M=
ath/BigRat Math/Complex Memoize Module/Build Module/CoreList Module/Load Mo=
dule/Load/Conditional Module/Loaded Module/Pluggable NEXT Net/Ping Object/A=
ccessor Package/Constants Params/Check Parse/CPAN/Meta PerlIO/via/QuotedPri=
nt Pod/Escapes Pod/Html Pod/LaTeX Pod/Parser Pod/Perldoc Pod/Plainer Pod/Si=
mple Safe SelfLoader Shell Switch Term/ANSIColor Term/Cap Term/UI Test Test=
/Harness Test/Simple Text/Balanced Text/ParseWords Text/Tabs Thread/Queue T=
hread/Semaphore Tie/File Tie/Hash/NamedCapture Tie/Memoize Tie/RefHash Time=
/Local Unicode/Collate XSLoader autodie autouse base bignum constant encodi=
ng/warnings if lib libnet parent podlators'
+nonxs_ext=3D'Archive/Extract Archive/Tar Attribute/Handlers AutoLoader B/D=
ebug \
+B/Deparse B/Lint CGI CPAN CPAN/Meta CPAN/Meta/YAML CPANPLUS CPANPLUS/Dist/=
Build \
+Class/ISA Devel/SelfStubber Digest Dumpvalue Env Errno ExtUtils/CBuilder \
+ExtUtils/Command ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker \
+ExtUtils/Manifest ExtUtils/ParseXS File/CheckTree File/Fetch File/Path Fil=
e/Temp \
+FileCache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags \
+IO/Compress IO/Zlib IPC/Cmd IPC/Open2 IPC/Open3 JSON/PP Locale/Codes \
+Locale/Maketext Locale/Maketext/Simple Log/Message Log/Message/Simple \
+Math/BigInt Math/BigRat Math/Complex Memoize Module/Build Module/CoreList =
\
+Module/Load Module/Load/Conditional Module/Loaded Module/Pluggable NEXT Ne=
t/Ping \
+Object/Accessor Package/Constants Params/Check Parse/CPAN/Meta Perl/OSType=
 \
+PerlIO/via/QuotedPrint Pod/Escapes Pod/Html Pod/LaTeX Pod/Parser Pod/Perld=
oc \
+Pod/Plainer Pod/Simple Safe SelfLoader Shell Switch Term/ANSIColor Term/Ca=
p \
+Term/UI Test Test/Harness Test/Simple Text/Balanced Text/ParseWords Text/T=
abs \
+Thread/Queue Thread/Semaphore Tie/File Tie/Hash/NamedCapture Tie/Memoize \
+Tie/RefHash Time/Local Unicode/Collate Version/Requirements XSLoader autod=
ie \
+autouse base bignum constant encoding/warnings if lib libnet parent podlat=
ors'
 nroff=3D'nroff'
 nvEUformat=3D'"E"'
 nvFUformat=3D'"F"'
diff --git a/meta/recipes-devtools/perl/perl-tests.inc b/meta/recipes-devto=
ols/perl/perl-tests.inc
new file mode 100644
index 0000000..c968eb6
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-tests.inc
@@ -0,0 +1,34 @@
+PACKAGES +=3D "perl-tests"
+PERL_TEST_DIR =3D "/opt/perl-tests"
+
+do_install_append () {
+	mkdir -p ${D}${PERL_TEST_DIR}
+	cp -pv TestInit.pm MANIFEST config.sh ${D}${PERL_TEST_DIR}/
+
+	tar -cf - t/ | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
+	ln -sf ${bindir}/perl ${D}${PERL_TEST_DIR}/t/
+	ln -sf ${libdir}/perl/${PV} ${D}${PERL_TEST_DIR}/lib
+
+	for dir in `find ext/ dist/ cpan/ -maxdepth 2 -type d -name t ` ; do
+	    tar -cf - $dir | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
+	done
+	for file in `find ext dist cpan -name \*.t -o -name \test.pl`;  do
+	    tar -cf - $file | ( cd ${D}${PERL_TEST_DIR} && tar -xf - )
+	done
+
+	# Tweaks to make tests pass
+	cp -pv lib/unicore/TestProp.pl ${D}${libdir}/perl/${PV}/unicore/
+	cp -pv lib/AnyDBM_File.t ${D}${libdir}/perl/${PV}/
+
+	mkdir -p ${D}${libdir}/perl/${PV}/XS
+	cp -pv lib/XS/{APItest,Typemap}.pm ${D}${libdir}/perl/${PV}/XS/
+	mkdir -p ${D}${libdir}/perl/${PV}/auto/XS/APItest
+	cp -pv lib/auto/XS/APItest/APItest.so ${D}${libdir}/perl/${PV}/auto/XS/AP=
Itest/
+	cp -pv lib/auto/XS/Typemap/Typemap.so ${D}${libdir}/perl/${PV}/auto/XS/Ty=
pemap/
+
+	cp -pv cpan/Digest-MD5/{README,MD5.xs} ${D}${PERL_TEST_DIR}/cpan/Digest-M=
D5/
+}
+
+FILES_${PN}-tests =3D "${PERL_TEST_DIR} \
+                     ${libdir}/perl/${PV}/AnyDBM_File.t"
+RDEPENDS_${PN}-tests =3D "${PN}-modules ${PN}-doc ${PN}-misc"
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devto=
ols/perl/perl_5.14.2.bb
index 4dac5ce..8cff7f5 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbdee4=
69f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS =3D "virtual/db grep-native"
 DEPENDS +=3D "gdbm zlib"
-PR =3D "r15"
+PR =3D "r16"
=20
 # 5.10.1 has Module::Build built-in
 PROVIDES +=3D "libmodule-build-perl"
@@ -319,6 +319,7 @@ RPROVIDES_perl-lib =3D "perl-lib"
 require perl-rdepends_${PV}.inc
 require perl-rprovides.inc
 require perl-rprovides_${PV}.inc
+include perl-tests.inc
=20
 SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
=20
--=20
1.7.5.4



