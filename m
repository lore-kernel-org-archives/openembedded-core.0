Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3FF5783E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:36:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7P9aM75015652
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:36:25 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 24 Aug 2017 17:41:51 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 08:42:38 +0800
Message-ID: <1503621758-17158-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] bash: memleak bug fix for builtin command read
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
X-List-Received-Date: Fri, 25 Aug 2017 09:36:24 -0000
Content-Type: text/plain

From: Zhang Xiao <xiao.zhang@windriver.com>

Built in command "read" with "-e" use Readline to obtain the line
in an interactive shell. In this process, a string "rlbuf" is
just allocated without free operation thus cause memory leak.

This patch had been submitted to upstream:
http://lists.gnu.org/archive/html/bug-bash/2017-02/msg00061.html

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-memleak-bug-fix-for-builtin-command-read.patch | 35 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.4.bb             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch

diff --git a/meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch b/meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch
new file mode 100644
index 0000000..9fb6ba9
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/bash-memleak-bug-fix-for-builtin-command-read.patch
@@ -0,0 +1,35 @@
+From d3b6303a6853f612a56848ee4e59eaa0b0ab9489 Mon Sep 17 00:00:00 2001
+From: Zhang Xiao <xiao.zhang@windriver.com>
+Date: Tue, 21 Feb 2017 11:30:14 +0800
+Subject: [PATCH] bash: memleak bug fix for builtin command read
+
+Built in command "read" with "-e" use Readline to obtain the line
+in an interactive shell. In this process, a string "rlbuf" is
+just allocated without free operation thus cause memory leak. Fix it.
+
+Upstream-Status: Submitted [http://lists.gnu.org/archive/html/bug-bash/2017-02/msg00061.html]
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ builtins/read.def | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/builtins/read.def b/builtins/read.def
+index 4397154..ee0c5a6 100644
+--- a/builtins/read.def
++++ b/builtins/read.def
+@@ -674,6 +674,11 @@ add_char:
+   input_string[i] = '\0';
+   CHECK_ALRM;
+ 
++#if defined (READLINE)
++  if (edit)
++    xfree (rlbuf);
++#endif
++
+   if (retval < 0)
+     {
+       t_errno = errno;
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/bash/bash_4.4.bb b/meta/recipes-extended/bash/bash_4.4.bb
index b602afe..e544d07 100644
--- a/meta/recipes-extended/bash/bash_4.4.bb
+++ b/meta/recipes-extended/bash/bash_4.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://run-ptest \
            file://fix-run-builtins.patch \
            file://0001-help-fix-printf-format-security-warning.patch \
+           file://bash-memleak-bug-fix-for-builtin-command-read.patch \
            "
 
 SRC_URI[tarball.md5sum] = "148888a7c95ac23705559b6f477dfe25"
-- 
2.7.4


