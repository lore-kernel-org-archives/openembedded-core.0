Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E14F966114
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 07:33:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G7XgWs013869
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 00:33:43 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 16 May 2014 00:33:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 15:33:40 +0800
Message-ID: <794f2e14a9854b7af2369d4b58f0aaa3df416520.1400225425.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400225425.git.rongqing.li@windriver.com>
References: <cover.1400225425.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] screen: fix for Security Advisory CVE-2009-1215
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
X-List-Received-Date: Fri, 16 May 2014 07:33:42 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Race condition in GNU screen 4.0.3 allows local users to create or
overwrite arbitrary files via a symlink attack on the
/tmp/screen-exchange temporary file.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch  |   27 ++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.0.3.bb       |    1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch

diff --git a/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch b/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch
new file mode 100644
index 0000000..538a8fa
--- /dev/null
+++ b/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+
+This patch is a backport from screen_4.0.3-11+lenny1.diff 
+to fix CVE-2009-1215.
+
+Signed-off-by:  Shenbo Huang<shenbo.huang@windriver.com)
+---
+	properly by keeping the umask instead of dropping
+	the 'public exchange file' concept. Modify dpatch 22.
+	<http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=521123>
+---
+ fileio.c |    5 -----
+ 1 file changed, 5 deletions(-)
+--- a/fileio.c
++++ b/fileio.c
+@@ -365,11 +365,6 @@ int dump;
+   char *mode = "w";
+ #ifdef COPY_PASTE
+   int public = 0;
+-# ifdef _MODE_T
+-  mode_t old_umask;
+-# else
+-  int old_umask;
+-# endif
+ # ifdef HAVE_LSTAT
+   struct stat stb, stb2;
+   int fd, exists = 0;
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index a0aa15c..c5218ec 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
            file://configure.patch \
            file://fix-parallel-make.patch \
            file://screen-4.0.3-CVE-2009-1214.patch \
+           file://screen-4.0.2-CVE-2009-1215.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://screen.pam"
-- 
1.7.10.4


