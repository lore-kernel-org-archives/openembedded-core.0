Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A64166114
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 06:00:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G60H1q004255
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 23:00:17 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 23:00:16 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 14:00:06 +0800
Message-ID: <7db1f38607829ca34e21cd328613706a56f7ee98.1400219191.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400219191.git.rongqing.li@windriver.com>
References: <cover.1400219191.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] subversion: fix for Security Advisory CVE-2013-4277
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
X-List-Received-Date: Fri, 16 May 2014 06:00:16 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Svnserve in Apache Subversion 1.4.0 through 1.7.12 and 1.8.0 through
1.8.1 allows local users to overwrite arbitrary files or kill arbitrary
processes via a symlink attack on the file specified by the --pid-file
option.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4277

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../subversion-1.7.10/subversion-CVE-2013-4277.patch    |   15 +++++++++++++++
 .../subversion/subversion-CVE-2013-4277.patch           |   13 +++++++++++++
 meta/recipes-devtools/subversion/subversion_1.6.15.bb   |    3 ++-
 meta/recipes-devtools/subversion/subversion_1.7.10.bb   |    1 +
 4 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
new file mode 100644
index 0000000..a5900d8
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Backport
+
+--- a/subversion/svnserve/main.c
++++ b/subversion/svnserve/main.c
+@@ -403,8 +403,9 @@ static svn_error_t *write_pid_file(const
+   const char *contents = apr_psprintf(pool, "%" APR_PID_T_FMT "\n",
+                                              getpid());
+ 
++  SVN_ERR(svn_io_remove_file2(filename, TRUE, pool));
+   SVN_ERR(svn_io_file_open(&file, filename,
+-                           APR_WRITE | APR_CREATE | APR_TRUNCATE,
++                           APR_WRITE | APR_CREATE | APR_EXCL,
+                            APR_OS_DEFAULT, pool));
+   SVN_ERR(svn_io_file_write_full(file, contents, strlen(contents), NULL,
+                                  pool));
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch
new file mode 100644
index 0000000..025865b
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch
@@ -0,0 +1,13 @@
+--- a/subversion/svnserve/main.c
++++ b/subversion/svnserve/main.c
+@@ -403,8 +403,9 @@ static svn_error_t *write_pid_file(const
+   const char *contents = apr_psprintf(pool, "%" APR_PID_T_FMT "\n",
+                                              getpid());
+ 
++  SVN_ERR(svn_io_remove_file(filename, pool));
+   SVN_ERR(svn_io_file_open(&file, filename,
+-                           APR_WRITE | APR_CREATE | APR_TRUNCATE,
++                           APR_WRITE | APR_CREATE | APR_EXCL,
+                            APR_OS_DEFAULT, pool));
+   SVN_ERR(svn_io_file_write_full(file, contents, strlen(contents), NULL,
+                                  pool));
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 042d9f1..e306ca8 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -16,7 +16,8 @@ SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://subversion-CVE-2013-1849.patch \
            file://subversion-CVE-2013-4505.patch \
            file://subversion-CVE-2013-1845.patch \
-           file://subversion-CVE-2013-1847-CVE-2013-1846.patch"
+           file://subversion-CVE-2013-1847-CVE-2013-1846.patch \
+           file://subversion-CVE-2013-4277.patch"
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
 SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d5aaa45"
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index 2d06263..e745ce7 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://neon.m4-fix-includes-and-cflags.patch \
            file://subversion-CVE-2013-4505.patch \
            file://subversion-CVE-2013-4131.patch \
+           file://subversion-CVE-2013-4277.patch \
 "
 SRC_URI[md5sum] = "4088a77e14232876c9b4ff1541e6e200"
 SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d77a8e7"
-- 
1.7.10.4


