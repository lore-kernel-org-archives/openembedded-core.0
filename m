Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96DE07467A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:46:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2U6krqF028829
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 23:46:54 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 23:46:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2018 02:46:29 -0400
Message-ID: <2d4f384b4fb087522d45a3aa822e6cd913ce5a91.1522392229.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1522392229.git.hongxu.jia@windriver.com>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] bash: 4.4.12 -> 4.4.18
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
X-List-Received-Date: Fri, 30 Mar 2018 06:46:53 -0000
Content-Type: text/plain

- Drop bash-memleak-bug-fix-for-builtin-command-read.patch which has
  been accepted since 4.4.17

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-memleak-bug-fix-for-builtin-command-read.patch | 35 ----------------------
 .../bash/{bash_4.4.12.bb => bash_4.4.18.bb}        |  6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch
 rename meta/recipes-extended/bash/{bash_4.4.12.bb => bash_4.4.18.bb} (74%)

diff --git a/meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch b/meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch
deleted file mode 100644
index 9fb6ba9..0000000
--- a/meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d3b6303a6853f612a56848ee4e59eaa0b0ab9489 Mon Sep 17 00:00:00 2001
-From: Zhang Xiao <xiao.zhang@windriver.com>
-Date: Tue, 21 Feb 2017 11:30:14 +0800
-Subject: [PATCH] bash: memleak bug fix for builtin command read
-
-Built in command "read" with "-e" use Readline to obtain the line
-in an interactive shell. In this process, a string "rlbuf" is
-just allocated without free operation thus cause memory leak. Fix it.
-
-Upstream-Status: Submitted [http://lists.gnu.org/archive/html/bug-bash/2017-02/msg00061.html]
-
-Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
----
- builtins/read.def | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/builtins/read.def b/builtins/read.def
-index 4397154..ee0c5a6 100644
---- a/builtins/read.def
-+++ b/builtins/read.def
-@@ -674,6 +674,11 @@ add_char:
-   input_string[i] = '\0';
-   CHECK_ALRM;
- 
-+#if defined (READLINE)
-+  if (edit)
-+    xfree (rlbuf);
-+#endif
-+
-   if (retval < 0)
-     {
-       t_errno = errno;
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/bash/bash_4.4.12.bb b/meta/recipes-extended/bash/bash_4.4.18.bb
similarity index 74%
rename from meta/recipes-extended/bash/bash_4.4.12.bb
rename to meta/recipes-extended/bash/bash_4.4.18.bb
index 9382a77..0b22ca7 100644
--- a/meta/recipes-extended/bash/bash_4.4.12.bb
+++ b/meta/recipes-extended/bash/bash_4.4.18.bb
@@ -13,12 +13,10 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://run-ptest \
            file://fix-run-builtins.patch \
            file://0001-help-fix-printf-format-security-warning.patch \
-           file://bash-memleak-bug-fix-for-builtin-command-read.patch \
            file://pathexp-dep.patch \
            "
 
-SRC_URI[tarball.md5sum] = "7c112970cbdcadfc331e10eeb5f6aa41"
-SRC_URI[tarball.sha256sum] = "57d8432be54541531a496fd4904fdc08c12542f43605a9202594fa5d5f9f2331"
-
+SRC_URI[tarball.md5sum] = "518e2c187cc11a17040f0915dddce54e"
+SRC_URI[tarball.sha256sum] = "604d9eec5e4ed5fd2180ee44dd756ddca92e0b6aa4217bbab2b6227380317f23"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.8.1


