Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A67E7601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 11:11:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 03:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17464951"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 12 Feb 2018 03:11:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 13:05:14 +0200
Message-Id: <20180212110521.16974-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
References: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/10] lsbinitscripts: update to 9.79
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
X-List-Received-Date: Mon, 12 Feb 2018 11:11:36 -0000

Switch to github as pkgs.fedoraproject.org is down.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../lsb/lsbinitscripts/functions.patch              | 21 +++++++++++----------
 ...sbinitscripts_9.72.bb => lsbinitscripts_9.79.bb} |  8 +++++---
 2 files changed, 16 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.72.bb => lsbinitscripts_9.79.bb} (73%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
index 9c58d90c382..e912daa701a 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
+++ b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
@@ -1,7 +1,7 @@
-From 57468c5f4e364bdad556604dca09046e1afca929 Mon Sep 17 00:00:00 2001
+From e46b056282c8420f096d5c34d78c00f816788784 Mon Sep 17 00:00:00 2001
 From: Fan Xin <fan.xin@jp.fujitsu.com>
 Date: Mon, 5 Jun 2017 16:26:47 +0900
-Subject: [PATCH] Upstream-Status: Inappropriate [configuration]
+Subject: [PATCH 1/2] Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
@@ -10,23 +10,24 @@ Rebase on 9.72
 
 Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
 Upstream-Status: Pending
+
 ---
- initscripts-9.72/rc.d/init.d/functions | 2 +-
+ rc.d/init.d/functions | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/initscripts-9.72/rc.d/init.d/functions b/initscripts-9.72/rc.d/init.d/functions
-index 0f627f1..a6aa092 100644
---- a/initscripts-9.72/rc.d/init.d/functions
-+++ b/initscripts-9.72/rc.d/init.d/functions
+diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
+index 2e3da964..1a204dec 100644
+--- a/rc.d/init.d/functions
++++ b/rc.d/init.d/functions
 @@ -59,7 +59,7 @@ systemctl_redirect () {
  [ -z "${COLUMNS:-}" ] && COLUMNS=80
  
  if [ -z "${CONSOLETYPE:-}" ]; then
--    if [ -c "/dev/stderr" -a -r "/dev/stderr" ]; then
-+    if [ -c "/dev/stderr" -a -r "/dev/stderr" -a -e /sbin/consoletype ]; then
+-    if [ -c "/dev/stderr" ] && [ -r "/dev/stderr" ]; then
++    if [ -c "/dev/stderr" ] && [ -r "/dev/stderr" ] && [ -e /sbin/consoletype ]; then
          CONSOLETYPE="$(/sbin/consoletype < /dev/stderr 2>/dev/null)"
      else
          CONSOLETYPE="serial"
 -- 
-1.9.1
+2.15.1
 
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
similarity index 73%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
index 2d74a6f9d3b..46edeed8a48 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.79.bb
@@ -10,11 +10,13 @@ RCONFLICTS_${PN} = "initscripts-functions"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
-S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.gz/sha512/b6ed38f9576e9227c2ecf047e2d60e1e872f40d51d13861b0c91dddb282f10f7e6b79706a4d1435d7a57a14a0b73a1b71541cfe44c00e8e03ef96b08de19ec32/initscripts-${PV}.tar.gz \
-           file://functions.patch;striplevel=2 \
+S = "${WORKDIR}/git"
+SRC_URI = "git://github.com/fedora-sysv/initscripts \
+           file://functions.patch \
            file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
           " 
+SRCREV = "a51c1b4f7dcf55b568b2ee4c2b18078849943469"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI[md5sum] = "d6c798f40dceb117e12126d94cb25a9a"
 SRC_URI[sha256sum] = "1793677bdd1f7ee4cb00878ce43346196374f848a4c8e4559e086040fc7487db"
-- 
2.15.1


