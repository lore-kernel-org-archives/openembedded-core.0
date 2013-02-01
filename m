Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U16lT-0005MU-RR
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 03:54:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r112cNKM002018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 18:38:23 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 31 Jan 2013 18:38:22 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 10:38:17 +0800
Message-ID: <fdc81a0385c2bdf7a13f9536bb59b82f8a5f904e.1359686158.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359686157.git.hongxu.jia@windriver.com>
References: <cover.1359686157.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dpkg-native:fix dpkg-scanpackages error at deb image creation time on Fedora 17
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
X-List-Received-Date: Fri, 01 Feb 2013 02:54:14 -0000
Content-Type: text/plain

Invoking dpkg-scanpackages on Fedora 17 to build deb image meets such an error:

Can't locate Dpkg.pm in @INC  (@INC contains: /usr/local/lib64/perl5 /usr/loc
al/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr
/lib64/perl5 /usr/share/perl5.) at tmp/sysroots/x86_64-linux/usr/bin/dpkg-sca
npackages line 27.

1. The dpkg-scanpackages is invoked at deb image creation time and it is built
by dpkg-native. The dpkg-scanpackages is a perl script and import module `Dpkg'.

2. The Dpkg.pm has been installed in perl's staging dir at dpkg-native compiling
time. Such as `tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/Dpkg.pm'

3. The dpkg-native uses create_wrapper to relocate to perl-native if perl-native
has been built. If perl-native isn't built, it will use the host Dpkg as default.

4. If dpkg-native is built on a new build envionment which means perl-native doesn't
exist before, and the build system doesn't install dpkg (such as Fedora 17), the
dpkg-scanpackages could not work correctly.

5. Modify dpkg-native's depends, change `perl-native-runtime' to `perl-native', Let
perl-native automatically be built before building dpkg-native.

[YOCTO #3817]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 27f69ef..8830ae7 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -8,7 +8,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
            file://ignore_extra_fields.patch"
 
 DEPENDS = "zlib bzip2 perl"
-DEPENDS_class-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native-runtime"
+DEPENDS_class-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}"
 RDEPENDS_${PN}_class-native = ""
 
-- 
1.7.10.4



