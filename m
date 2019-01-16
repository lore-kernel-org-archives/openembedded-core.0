Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14F836BC44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 08:33:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0G8XNIT001222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 00:33:24 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 16 Jan 2019 00:33:22 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2019 16:15:42 +0800
Message-ID: <1547626542-681-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] ptest-runner: pass libdir to DEFAULT_DIRECTORY when compiling
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
X-List-Received-Date: Wed, 16 Jan 2019 08:33:23 -0000
Content-Type: text/plain

Ptest data are installed to PTEST_PATH ?= "${libdir}/${BPN}/ptest".
When libdir isn't "/usr/lib", it will cause "No ptests found" error
when running "ptest-runner" command. Here pass libdir to
DEFAULT_DIRECTORY when compiling to avoid that error.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...r-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch | 36 ++++++++++++++++++++++
 .../ptest-runner/ptest-runner_2.3.bb               |  5 +--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch

diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch b/meta/recipes-support/ptest-runner/ptest-runner/0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch
new file mode 100644
index 0000000..56e1f96
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner/0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch
@@ -0,0 +1,36 @@
+From 6a663ac38c71108890e42f451f3a7b22afee0a40 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Wed, 16 Jan 2019 15:00:17 +0800
+Subject: [PATCH] ptest-runner: remove DEFAULT_DIRECTORY's hard coded
+ initialization
+
+Ptest data are installed to PTEST_PATH ?= "${libdir}/${BPN}/ptest".
+Here make DEFAULT_DIRECTORY be able to be defined outside of c code,
+in case libdir isn't "/usr/lib", which will cause "No ptests found"
+error when running "ptest-runner" command. We will pass libdir to
+DEFAULT_DIRECTORY when compiling to avoid that error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ main.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/main.c b/main.c
+index 83600b7..e963efe 100644
+--- a/main.c
++++ b/main.c
+@@ -37,7 +37,9 @@
+ 
+ #include "utils.h"
+ 
++#ifndef DEFAULT_DIRECTORY
+ #define DEFAULT_DIRECTORY "/usr/lib"
++#endif
+ #define DEFAULT_TIMEOUT 300
+ 
+ static inline void
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
index 26add9b..9866d1a 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
@@ -10,12 +10,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "80712583732b4a809532f644fb09e7d2e812d7ba"
 PV = "2.3+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
+           file://0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch"
 S = "${WORKDIR}/git"
 
 FILES_${PN} = "${bindir}/ptest-runner"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE = "-e MAKEFLAGS= CFLAGS="${CFLAGS} -DDEFAULT_DIRECTORY=\\\"${libdir}\\\"""
 
 do_compile () {
 	oe_runmake
-- 
1.9.1


