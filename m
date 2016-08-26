Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA2173289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 02:27:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7Q2RQq3020796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 19:27:26 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 25 Aug 2016 19:27:25 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2016 10:25:47 +0800
Message-ID: <1472178349-32199-3-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
References: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] file-homedir-perl: add new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Aug 2016 02:27:27 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add file-homedir-perl recipe as glilypond which
  in groff package depends on HomeDir.pm provided
  by file-homedir-perl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/file-homedir-perl_1.00.bb                 | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/file-homedir-perl_1.00.bb

diff --git a/meta/recipes-devtools/perl/file-homedir-perl_1.00.bb b/meta/recipes-devtools/perl/file-homedir-perl_1.00.bb
new file mode 100644
index 0000000..1609b5e
--- /dev/null
+++ b/meta/recipes-devtools/perl/file-homedir-perl_1.00.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "File::HomeDir is a module for locating the directories that are \
+\"owned\" by a user (typicaly your user) and to solve the various \
+issues that arise trying \
+to find them consistently across a wide variety of platforms."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-2.0"
+PR = "r0"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/File-HomeDir"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/A/AD/ADAMK/File-HomeDir-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "aa290cab9db52e2f76280fd1febf794e"
+SRC_URI[sha256sum] = "85b94f3513093ec0a25b91f9f2571918519ae6f2b7a1e8546f8f78d09a877143"
+RDEPENDS_${PN} += "file-which-perl"
+DEPENDS += "extutils-makemaker-perl-native"
+
+S = "${WORKDIR}/File-HomeDir-${PV}"
+
+inherit cpan
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


