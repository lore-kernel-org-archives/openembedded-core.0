Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlm-0000Hr-RL
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:47 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321782"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:37 -0700
Message-Id: <f2a14cb5adc91266290bfda029220d5a1a3a7caa.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/23] run-postinsts: fix opkg data path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2012 08:07:47 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dpkg/run-postinsts/run-postinsts               |    4 ++--
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
index 584a92e..5f6442c 100755
--- a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
@@ -8,8 +8,8 @@
 PKGSYSTEM=/var/lib/dpkg
 
 if [ ! -e $PKGSYSTEM/status ]; then
-  if [ -e /usr/lib/opkg/status ]; then
-    PKGSYSTEM=/usr/lib/opkg
+  if [ -e /var/lib/opkg/status ]; then
+    PKGSYSTEM=/var/lib/opkg
   else
     echo "No package system found"
     exit 1
diff --git a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
index d92200b..18a0492 100644
--- a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
+++ b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
@@ -11,7 +11,7 @@ BEGIN {
   if (rc==0)
     pkgdir="/var/lib/dpkg/info"
   else
-    pkgdir="/usr/lib/opkg/info"
+    pkgdir="/var/lib/opkg/info"
   package=""
 }
 /Package:.*/ {
diff --git a/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb b/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
index f8f3368..7438a10 100644
--- a/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Run postinstall scripts on device using awk"
 SECTION = "devel"
-PR = "r7"
+PR = "r8"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-- 
1.7.7.6



