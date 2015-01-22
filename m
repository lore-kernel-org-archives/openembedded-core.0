Return-Path: <Yue.Tao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED3871144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:29:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0M8TDRu020635
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 00:29:13 -0800 (PST)
Received: from pek-ytao-l1.corp.ad.wrs.com (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 22 Jan 2015 00:29:12 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 16:29:12 +0800
Message-ID: <1421915352-8485-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: yue.tao@windriver.com
Subject: [PATCH] mmc-utils: set the optimization to -O2
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
X-List-Received-Date: Thu, 22 Jan 2015 08:29:22 -0000
Content-Type: text/plain

From: Yue Tao <yue.tao@windriver.com>

The _FORTIFY_SOURCE > 0 must be used with optimization > 0, so force
the optimization 2.

The build error (_FORTIFY_SOURCE=2 with -O0)

"warning _FORTIFY_SOURCE requires compiling with optimization (-O)"

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 2015-01-22

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../mmc/mmc-utils/0001-mmc-utils-force-O2.patch    |   42 ++++++++++++++++++++
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |    3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc-utils-force-O2.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc-utils-force-O2.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc-utils-force-O2.patch
new file mode 100644
index 0000000..07dfa78
--- /dev/null
+++ b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc-utils-force-O2.patch
@@ -0,0 +1,42 @@
+From 77d73c3ac400d44e3e59283856152916d87ab055 Mon Sep 17 00:00:00 2001
+From: wrlbuild <wrlbuild@57965124ebf1.(none)>
+Date: Thu, 22 Jan 2015 05:57:10 +0000
+Subject: [PATCH] mmc-utils: set the optimization to -O2
+
+The _FORTIFY_SOURCE > 0 must be used with optimization > 0, so force
+the optimization 2.
+
+The build error (_FORTIFY_SOURCE=2 with -O0)
+
+"warning _FORTIFY_SOURCE requires compiling with optimization (-O)"
+
+Upstream-Status: Pending
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ae846e2..120d422 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,13 +1,13 @@
+ CC ?= gcc
+ AM_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2
+-CFLAGS ?= -g -O2
++CFLAGS_append = -g -O2
+ objects = mmc.o mmc_cmds.o
+ 
+ CHECKFLAGS = -Wall -Werror -Wuninitialized -Wundef
+ 
+ DEPFLAGS = -Wp,-MMD,$(@D)/.$(@F).d,-MT,$@
+ 
+-override CFLAGS := $(CHECKFLAGS) $(AM_CFLAGS) $(CFLAGS)
++override CFLAGS := $(CHECKFLAGS) $(AM_CFLAGS) $(CFLAGS_append)
+ 
+ INSTALL = install
+ prefix ?= /usr/local
+-- 
+1.7.1
+
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index d88520c..771eede 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -9,7 +9,8 @@ SRCREV = "11f2ceabc4ad3f0dd568e0ce68166e4803e0615b"
 PV = "0.1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;protocol=git;branch=${BRANCH} \
-           file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
+           file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch \
+           file://0001-mmc-utils-force-O2.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


