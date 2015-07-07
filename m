Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18F8A75D00
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 06:02:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6762ER1000531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 23:02:14 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 23:02:14 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jul 2015 13:56:48 +0800
Message-ID: <1436248608-29008-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] bash: define NON_INTERACTIVE_LOGIN_SHELLS
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
X-List-Received-Date: Tue, 07 Jul 2015 06:02:19 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Allow login shells to read the startup files, even if they are not
interactive.

The patch comes from:
* bash-3.2-30.fc10.src.rpm - bash-2.03-profile.patch

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../bash/bash/bash-2.03-profile.patch              | 24 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.bb             |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/bash-2.03-profile.patch

diff --git a/meta/recipes-extended/bash/bash/bash-2.03-profile.patch b/meta/recipes-extended/bash/bash/bash-2.03-profile.patch
new file mode 100644
index 0000000..a7d5fe8
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/bash-2.03-profile.patch
@@ -0,0 +1,24 @@
+bash: define NON_INTERACTIVE_LOGIN_SHELLS
+
+Allow login shells to read the startup files, even if they are not
+interactive.
+
+The patch comes from:
+* bash-3.2-30.fc10.src.rpm - bash-2.03-profile.patch
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+diff -up bash-3.2/config-top.h.profile bash-3.2/config-top.h
+--- bash-3.2/config-top.h.profile	2008-07-17 13:35:39.000000000 +0200
++++ bash-3.2/config-top.h	2008-07-17 13:42:18.000000000 +0200
+@@ -26,6 +26,8 @@
+    what POSIX.2 specifies. */
+ #define CONTINUE_AFTER_KILL_ERROR
+ 
++#define NON_INTERACTIVE_LOGIN_SHELLS
++
+ /* Define BREAK_COMPLAINS if you want the non-standard, but useful
+    error messages about `break' and `continue' out of context. */
+ #define BREAK_COMPLAINS
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 23d3197..622058a 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
+           file://bash-2.03-profile.patch \
            file://run-ptest \
            "
 
-- 
1.9.1


