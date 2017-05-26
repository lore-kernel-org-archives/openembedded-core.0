Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 213237309A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 07:28:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19338077"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 May 2017 15:28:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BA58A47C6104
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 15:28:17 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 26 May 2017 15:28:18 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 15:28:00 +0800
Message-ID: <1495783680-1190-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: BA58A47C6104.A9B7E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] lsbinitscripts: 9.68 -> 9.72
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
X-List-Received-Date: Fri, 26 May 2017 07:28:33 -0000
Content-Type: text/plain

1) Upgrade lsbinitscripts from 9.68 to 9.72.
2) Modify one patch "functions.patch", since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../lsb/lsbinitscripts/functions.patch             | 40 ++++++++++++----------
 ...binitscripts_9.68.bb => lsbinitscripts_9.72.bb} |  6 ++--
 2 files changed, 25 insertions(+), 21 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.68.bb => lsbinitscripts_9.72.bb} (74%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
index a756d04..cdc8fa4 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
+++ b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
@@ -1,26 +1,30 @@
+From e2f4791b71f88e9dd6fed7c7cec9327d1a919d1f Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Fri, 26 May 2017 23:39:29 +0900
+Subject: [PATCH] functions
+
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+---
+ rc.d/init.d/functions | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: initscripts-9.43/rc.d/init.d/functions
-===================================================================
---- initscripts-9.43.orig/rc.d/init.d/functions
-+++ initscripts-9.43/rc.d/init.d/functions
-@@ -13,6 +13,7 @@ umask 022
- PATH="/sbin:/usr/sbin:/bin:/usr/bin"
- export PATH
- 
-+
- if [ $PPID -ne 1 -a -z "$SYSTEMCTL_SKIP_REDIRECT" ] && \
- 		( /bin/mountpoint -q /cgroup/systemd || /bin/mountpoint -q /sys/fs/cgroup/systemd ) ; then
-         case "$0" in
-@@ -54,7 +55,7 @@ systemctl_redirect () {
+diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
+index 0f627f1..a6aa092 100644
+--- a/rc.d/init.d/functions
++++ b/rc.d/init.d/functions
+@@ -59,7 +59,7 @@ systemctl_redirect () {
  [ -z "${COLUMNS:-}" ] && COLUMNS=80
  
  if [ -z "${CONSOLETYPE:-}" ]; then
--  if [ -c "/dev/stderr" -a -r "/dev/stderr" ]; then
-+  if [ -c "/dev/stderr" -a -r "/dev/stderr" -a -e /sbin/consoletype ]; then
-     CONSOLETYPE="$(/sbin/consoletype < /dev/stderr 2>/dev/null)"
-   else
-     CONSOLETYPE="serial"
+-    if [ -c "/dev/stderr" -a -r "/dev/stderr" ]; then
++    if [ -c "/dev/stderr" -a -r "/dev/stderr" -a -e /sbin/consoletype ]; then
+         CONSOLETYPE="$(/sbin/consoletype < /dev/stderr 2>/dev/null)"
+     else
+         CONSOLETYPE="serial"
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
similarity index 74%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
index 0c08fff..0263299 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
@@ -8,13 +8,13 @@ RDEPENDS_${PN} += "util-linux"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/6a51a5af38e01445f53989ed0727c3e1/initscripts-${PV}.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.gz/sha512/b6ed38f9576e9227c2ecf047e2d60e1e872f40d51d13861b0c91dddb282f10f7e6b79706a4d1435d7a57a14a0b73a1b71541cfe44c00e8e03ef96b08de19ec32/initscripts-${PV}.tar.gz \
            file://functions.patch \
            file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
           " 
 
-SRC_URI[md5sum] = "6a51a5af38e01445f53989ed0727c3e1"
-SRC_URI[sha256sum] = "2a1c6e9dbaa37a676518f4803b501e107c058bb14ef7a8db24c52b77fbcba531"
+SRC_URI[md5sum] = "d6c798f40dceb117e12126d94cb25a9a"
+SRC_URI[sha256sum] = "1793677bdd1f7ee4cb00878ce43346196374f848a4c8e4559e086040fc7487db"
 
 inherit update-alternatives
 
-- 
2.7.4




