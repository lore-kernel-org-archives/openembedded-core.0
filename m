Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1TyeYl-0002Pw-HY
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 09:22:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0P87GvN009756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 00:07:16 -0800 (PST)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 25 Jan 2013 00:07:16 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jan 2013 16:06:56 +0800
Message-ID: <06cf3d39e3067662d7cd95c7fadee3cab4a1ecb2.1359095007.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359095007.git.wenzong.fan@windriver.com>
References: <cover.1359095007.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] git: remove unpackaged perl-native files
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
X-List-Received-Date: Fri, 25 Jan 2013 08:22:52 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

${libdir} is not applicable for the install path of perl-native files,
files are always installed to /usr/lib no matter the target is 32/64
bits. After installing, remove unpackaged and unneeded perl-native
files to prevent warnings.

Fix warning:
    WARNING: For recipe git, the following files/directories were \
        installed but not shipped in any package:
    ...
    WARNING:   /usr/lib/perl-native/perl/5.14.2/Git.pm
    WARNING:   /usr/lib/perl-native/perl/5.14.2/perllocal.pod
    WARNING:   /usr/lib/perl-native/perl/5.14.2/Error.pm
    WARNING:   /usr/lib/perl-native/perl/5.14.2/auto

[YOCTO#3780]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/git/git.inc        |    6 +++++-
 meta/recipes-devtools/git/git_1.8.0.2.bb |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 82df6e3..9829eec 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -28,7 +28,11 @@ do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
-	rm -rf ${D}${libdir}/perl-native
+
+	# ${libdir} is not applicable here, perl-native files are always
+	# installed to /usr/lib on both 32/64 bits targets.
+	rm -rf ${D}/usr/lib/perl-native
+	rmdir ${D}/usr/lib || true
 }
 
 do_install_append_class-native() {
diff --git a/meta/recipes-devtools/git/git_1.8.0.2.bb b/meta/recipes-devtools/git/git_1.8.0.2.bb
index 5e5a23e..ae6fc41 100644
--- a/meta/recipes-devtools/git/git_1.8.0.2.bb
+++ b/meta/recipes-devtools/git/git_1.8.0.2.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
 SRC_URI[md5sum] = "1aca109d4a719fe5bc43d25927fbc7d9"
-- 
1.7.10.4



