Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TQuMj-0007Fp-4H
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 08:22:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9O69UOP006280
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2012 23:09:30 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 23 Oct 2012 23:09:28 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 24 Oct 2012 14:09:52 +0800
Message-ID: <34f4b09a2d690e4fe54944be232459d726fb595e.1351049433.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1351049433.git.kai.kang@windriver.com>
References: <cover.1351049433.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] autoconf: update runtime dependencies
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
X-List-Received-Date: Wed, 24 Oct 2012 06:22:58 -0000
Content-Type: text/plain

Update autoconf runtime dependencies on perl and perl modules. And
remove RDEPENDS for nativesdk because the nativesdk-autoconf has same
dependencies with autoconf.

Then fixes autoreconf runs failed both on target and toolchain.

Bump up PR.

[Yocto 3100]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |   19 +++++++++++++++++--
 meta/recipes-devtools/autoconf/autoconf_2.69.bb |    2 +-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 315e773..ff375cd 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -8,9 +8,24 @@ SECTION = "devel"
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
+		  perl-module-file \
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
1.7.5.4



