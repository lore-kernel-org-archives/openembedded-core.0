Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TeO4x-0003yO-2n
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 11:44:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAUAU2cm019516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 02:30:02 -0800 (PST)
Received: from Xouyang-Ubuntu-Desktop.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 30 Nov 2012 02:30:00 -0800
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 18:29:59 +0800
Message-ID: <1354271399-6558-1-git-send-email-Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/1] libxml-sax-base-perl: add recipe for libxml-sax-perl
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
X-List-Received-Date: Fri, 30 Nov 2012 10:44:22 -0000
Content-Type: text/plain

If libxml-sax-base-perl is not installed on the target, libxml-sax-perl
would be fail to use. So add the recipe.

    # cat > test.pl <<-EOF 
    #!/usr/bin/perl
    use XML::SAX;
    EOF
    # perl ./test.pl
    Can't locate XML/SAX/Exception.pm in @INC ...

Also inherit allarch for three perl modules.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 .../perl/libxml-namespacesupport-perl_1.11.bb      |    4 ++--
 .../perl/libxml-sax-base-perl_1.08.bb              |   24 ++++++++++++++++++++
 meta/recipes-extended/perl/libxml-sax-perl_0.99.bb |    6 ++---
 3 files changed, 29 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb

diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
index cf89cb6..9284403 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-ba
 
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=3b2b564dae8b9af9e8896e85c07dcbe5"
 
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "6d8151f0a3f102313d76b64bfd1c2d9ed46bfe63a16f038e7d860fda28
 
 S = "${WORKDIR}/XML-NamespaceSupport-${PV}"
 
-inherit cpan
+inherit cpan allarch
 
 BBCLASSEXTEND="native"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
new file mode 100644
index 0000000..d87c044
--- /dev/null
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Base class SAX Drivers and Filters"
+DESCRIPTION = "This module has a very simple task - to be a base class for \
+PerlSAX drivers and filters. It's default behaviour is to pass \
+the input directly to the output unchanged. It can be useful to \
+use this module as a base class so you don't have to, for example, \
+implement the characters() callback."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+RDEPENDS += "perl-module-extutils-makemaker"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://dist.ini;endline=5;md5=8f9c9a55340aefaee6e9704c88466446"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-Base-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "38c8c3247dfd080712596118d70dbe32"
+SRC_URI[sha256sum] = "666270318b15f88b8427e585198abbc19bc2e6ccb36dc4c0a4f2d9807330219e"
+
+S = "${WORKDIR}/XML-SAX-Base-${PV}"
+
+inherit cpan allarch
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
index 3a0873f..647cb77 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
@@ -10,8 +10,8 @@ javaness."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 DEPENDS += "libxml-namespacesupport-perl-native"
-RDEPENDS_${PN} += "libxml-namespacesupport-perl perl-module-file-temp"
-PR = "r1"
+RDEPENDS_${PN} += "libxml-namespacesupport-perl libxml-sax-base-perl perl-module-file-temp"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
 
@@ -22,6 +22,6 @@ SRC_URI[sha256sum] = "32b04b8e36b6cc4cfc486de2d859d87af5386dd930f2383c49347050d6
 
 S = "${WORKDIR}/XML-SAX-${PV}"
 
-inherit cpan
+inherit cpan allarch
 
 BBCLASSEXTEND = "native"
-- 
1.7.10.4



