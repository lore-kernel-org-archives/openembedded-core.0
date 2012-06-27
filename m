Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Sjndb-0005Su-0L
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 10:30:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5R8JH4G013624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 01:19:17 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 27 Jun 2012 01:19:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jun 2012 16:19:53 +0800
Message-ID: <63976f811fe5cb0c5688fe6847975499ac2d9e51.1340773014.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1340773014.git.liezhi.yang@windriver.com>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] icu 3.6: do_install failed: Segmentation fault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 08:30:11 -0000
Content-Type: text/plain

There is a "Segmentation fault" error when the tmpdir is longer than 470
(or less), this is because it used "char cmd[1024]" which is not enough
for the command line. Allocate a larger memory size should fix this problem.

[YOCTO #2664]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../icu/files/larger-cmd-size.patch                |   27 ++++++++++++++++++++
 meta/recipes-support/icu/icu-3.6.inc               |    1 +
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 3 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch

diff --git a/meta/recipes-support/icu/files/larger-cmd-size.patch b/meta/recipes-support/icu/files/larger-cmd-size.patch
new file mode 100644
index 0000000..4b5f73d
--- /dev/null
+++ b/meta/recipes-support/icu/files/larger-cmd-size.patch
@@ -0,0 +1,27 @@
+Allocate a larger memory size for cmd
+
+The length of the command line can be longer than 1024 sometimes,
+which will cause a "Segmentation fault" error.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ tools/pkgdata/pkgdata.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/pkgdata/pkgdata.c b/tools/pkgdata/pkgdata.c
+--- a/tools/pkgdata/pkgdata.c
++++ b/tools/pkgdata/pkgdata.c
+@@ -439,7 +439,7 @@ main(int argc, char* argv[]) {
+ /* POSIX - execute makefile */
+ static int executeMakefile(const UPKGOptions *o)
+ {
+-    char cmd[1024];
++    char cmd[BUFSIZ];
+     /*char pwd[1024];*/
+     const char *make;
+     int rc;
+-- 
+1.7.10.2
+
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index d3391fe..d969caa 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -6,6 +6,7 @@ BASE_SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-
            file://gccfix.patch \
            file://fix-parallel-build.patch \
            file://use-g++-for-linking.patch \
+           file://larger-cmd-size.patch \
            "
 SRC_URI = "${BASE_SRC_URI} \
            file://noldlibpath.patch \
diff --git a/meta/recipes-support/icu/icu_3.6.bb b/meta/recipes-support/icu/icu_3.6.bb
index d7be522..f941acf 100644
--- a/meta/recipes-support/icu/icu_3.6.bb
+++ b/meta/recipes-support/icu/icu_3.6.bb
@@ -1,6 +1,6 @@
 require icu-3.6.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
 SRC_URI[sha256sum] = "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"
-- 
1.7.1



