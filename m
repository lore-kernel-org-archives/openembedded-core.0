Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nR-000163-HH
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB4xtM018174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:04:59 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:04:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:37 +0800
Message-ID: <fa876e94726d8107fcb68424cbf1886bc16bd29e.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/17] automake_1.12.3.bb: update dependencies
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
X-List-Received-Date: Mon, 11 Mar 2013 11:21:59 -0000
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

Cherry-pick commit d93898b2c530681362e42d1b0477fa593a625046

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/automake/automake_1.12.3.bb |   20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

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
1.7.10.4



