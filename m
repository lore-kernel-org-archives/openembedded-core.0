Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 29BA373FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 09:42:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4D9g4LO029638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 02:42:04 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 13 May 2015 02:42:04 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 May 2015 17:41:51 +0800
Message-ID: <1431510111-13714-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Wed, 13 May 2015 09:42:05 -0000
Content-Type: text/plain

When update-alternatives is moved from opkg to opkg-utils, a line in
the file is changed
from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
 in oe-core build by configuring --with-opkglibdir.
opkg-utils can't get the var value in opkg, so here change back the
directory in update-alternatives only.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...Change-alternatives-lib-path-from-usr-lib.patch |   36 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch
new file mode 100644
index 0000000..60d2a1f
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch
@@ -0,0 +1,36 @@
+From 5ca5f2f4a6b1bd82a1349542f4541c017cb5c132 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Wed, 13 May 2015 15:12:10 +0800
+Subject: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/opkg
+ to /var/lib/opkg
+
+When update-alternatives is moved from opkg to opkg-utils, a line in
+the file is changed
+from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
+to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
+But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
+ in oe-core build by configuring --with-opkglibdir.
+opkg-utils can't get the var value in opkg, so here change back the
+directory in update-alternatives only.
+Upstream-Status: Inappropriate [It is related with oe-core configuration.]
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ update-alternatives |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/update-alternatives b/update-alternatives
+index c332309..b08ecc0 100644
+--- a/update-alternatives
++++ b/update-alternatives
+@@ -21,7 +21,7 @@
+ set -e
+ 
+ # admin dir
+-ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"
++ad="$OPKG_OFFLINE_ROOT/var/lib/opkg/alternatives"
+ 
+ usage() {
+ 	echo "update-alternatives: $*
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 2800a5d..68d9a19 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -10,7 +10,9 @@ PROVIDES += "virtual/update-alternatives"
 SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
 PV = "0.1.8+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils"
+SRC_URI = "git://git.yoctoproject.org/opkg-utils \
+           file://0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


