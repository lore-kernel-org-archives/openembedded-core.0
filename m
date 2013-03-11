Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nE-00015R-DP
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB4kvE005764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:04:46 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:04:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:26 +0800
Message-ID: <7971f57202611202758e6ce6803a47ef065834c1.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/17] autoconf:fix autoreconf run failed on x86-64 gmae-toolchain
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
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
Content-Type: text/plain

Update autoconf runtime dependencies on perl and perl modules. And
remove RDEPENDS for nativesdk because the nativesdk-autoconf has same
dependencies with autoconf.

Then fixes autoreconf runs failed both on target and toolchain.

Bump up PR.

Cherry-pick commit 3533e801eecb26ae9f97649ed2f675c3965a797b

[Yocto 3100]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |   18 ++++++++++++++++--
 meta/recipes-devtools/autoconf/autoconf_2.69.bb |    2 +-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 315e773..3f5bffd 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -8,9 +8,23 @@ SECTION = "devel"
 DEPENDS += "m4-native"
 DEPENDS_virtclass-native = "m4-native gnu-config-native"
 DEPENDS_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
-RDEPENDS_${PN} = "m4 gnu-config"
+RDEPENDS_${PN} = "m4 gnu-config \
+		  perl \
+		  perl-module-carp \
+		  perl-module-constant \
+		  perl-module-errno \
+		  perl-module-exporter \
+		  perl-module-file-basename \
+		  perl-module-file-compare \
+		  perl-module-file-copy \
+		  perl-module-file-glob \
+		  perl-module-file-path \
+		  perl-module-file-stat \
+		  perl-module-getopt-long \
+		  perl-module-io-file \
+		  perl-module-posix \
+		 "
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 2c4c675..a4afd33 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r9"
+PR = "r10"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.10.4



