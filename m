Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TQuMk-0007Fy-Tr
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 08:22:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9O69UYh011485
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2012 23:09:30 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 23 Oct 2012 23:09:30 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 24 Oct 2012 14:09:53 +0800
Message-ID: <7b245ca2d14a40b26224a5ba8466709e770c5ce9.1351049433.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1351049433.git.kai.kang@windriver.com>
References: <cover.1351049433.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] automake: update dependencies
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
X-List-Received-Date: Wed, 24 Oct 2012 06:22:59 -0000
Content-Type: text/plain

Remove the RDEPENDS for nativesdk because the nativesdk-automake also
needs perl modules.

Add dependencies perl-module-thread-queue and perl-module-threads.

Remove redundant dependencies that they are already required by autoconf
and autoconf is required by automake.

In this removed list, "-->" present "required by":

  perl-module-cwd --> perl-module-file-path --> autoconf
  perl-module-dynaloader --> perl-module-xsloader --> perl-module-fcntl
    			--> perl-module-file-stat --> autoconf
  perl-module-exporter-heavy --> perl-module-exporter --> autoconf
  perl-module-constant --> autoconf
  perl-module-errno --> autoconf
  perl-module-file-basename --> autoconf
  perl-module-file-compare --> autoconf
  perl-module-file-copy --> autoconf
  perl-module-file-glob --> autoconf
  perl-module-file-spec-unix --> perl-module-file-spec
    			    --> perl-module-io-file --> autoconf
  perl-module-file-stat --> autoconf
  perl-module-getopt-long --> autoconf
  perl-module-io --> perl-module-IO-handle --> perl-module-IO-seekable
    		--> perl-module-io-file --> autoconf
  perl-module-io-file --> autoconf
  perl-module-posix --> autoconf

Bump up PR.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/automake/automake_1.12.3.bb |   20 +++-----------------
 1 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/automake/automake_1.12.3.bb b/meta/recipes-devtools/automake/automake_1.12.3.bb
index af99dfa..362500c 100644
--- a/meta/recipes-devtools/automake/automake_1.12.3.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.3.bb
@@ -7,28 +7,14 @@ RDEPENDS_${PN} += "\
     autoconf \
     perl \
     perl-module-bytes \
-    perl-module-constant \
-    perl-module-cwd \
     perl-module-data-dumper \
-    perl-module-dynaloader \
-    perl-module-errno \
-    perl-module-exporter-heavy \
-    perl-module-file-basename \
-    perl-module-file-compare \
-    perl-module-file-copy \
-    perl-module-file-glob \
-    perl-module-file-spec-unix \
-    perl-module-file-stat \
-    perl-module-getopt-long \
-    perl-module-io \
-    perl-module-io-file \
-    perl-module-posix \
     perl-module-strict \
     perl-module-text-parsewords \
+    perl-module-thread-queue \
+    perl-module-threads \
     perl-module-vars "
 
 RDEPENDS_${PN}_virtclass-native = "autoconf-native perl-native-runtime"
-RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-autoconf"
 
 PATHFIXPATCH = "file://path_prog_fixes.patch"
 PATHFIXPATCH_virtclass-native = ""
@@ -42,7 +28,7 @@ SRC_URI += "${PATHFIXPATCH} \
 SRC_URI[md5sum] = "d2af8484de94cdee16d89c50aaa1c729"
 SRC_URI[sha256sum] = "095ffaa3ac887d1eb3511bf13d7f1fc9ec0503c6a06aeae05c93730cdda9a5a0"
 
-PR = "r1"
+PR = "r2"
 
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
-- 
1.7.5.4



