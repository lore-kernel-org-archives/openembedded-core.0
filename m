Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 573D56D030
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 03:30:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9H3UmJr028326
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 20:30:48 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.203) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 16 Oct 2013 20:30:48 -0700
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Oct 2013 11:30:44 +0800
Message-ID: <1381980644-28725-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] minicom: fix -v/-h return value
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
X-List-Received-Date: Thu, 17 Oct 2013 03:30:46 -0000
Content-Type: text/plain

From: Lu Chong <Chong.Lu@windriver.com>

The previous return value for '-h' and '-v' options was 1 which was
not correct. These two options should return 0 instead.

Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
---
 ...001-fix-minicom-v-h-return-value-is-not-0.patch |   37 ++++++++++++++++++++
 meta/recipes-extended/minicom/minicom_2.6.2.bb     |    1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-v-h-return-value-is-not-0.patch

diff --git a/meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-v-h-return-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-v-h-return-value-is-not-0.patch
new file mode 100644
index 0000000..0b6cd87
--- /dev/null
+++ b/meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-v-h-return-value-is-not-0.patch
@@ -0,0 +1,37 @@
+From a630a4d2acbdc727d727f5373f3d4b79ad33f7d6 Mon Sep 17 00:00:00 2001
+From: Lu Chong <Chong.Lu@windriver.com>
+Date: Thu, 17 Oct 2013 11:05:48 +0800
+Subject: [PATCH] fix minicom -v/-h return value is not 0
+
+Upstream-Status: Pending
+
+Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
+
+---
+ src/minicom.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/minicom.c b/src/minicom.c
+index e1a557b..41573b5 100644
+--- a/src/minicom.c
++++ b/src/minicom.c
+@@ -1166,14 +1166,14 @@ int main(int argc, char **argv)
+ 	         "modify it under the terms of the GNU General Public License\n"
+                  "as published by the Free Software Foundation; either version\n"
+                  "2 of the License, or (at your option) any later version.\n\n");
+-          exit(1);
++          exit(0);
+           break;
+         case 's': /* setup mode */
+           dosetup = 1;
+           break;
+         case 'h':
+           helpthem();
+-          exit(1);
++          exit(0);
+           break;
+         case 'p': /* Pseudo terminal to use. */
+           if (strncmp(optarg, "/dev/", 5) == 0)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/minicom/minicom_2.6.2.bb b/meta/recipes-extended/minicom/minicom_2.6.2.bb
index 558867d..96a2179 100644
--- a/meta/recipes-extended/minicom/minicom_2.6.2.bb
+++ b/meta/recipes-extended/minicom/minicom_2.6.2.bb
@@ -10,6 +10,7 @@ PR = "r0"
 
 SRC_URI = "http://alioth.debian.org/frs/download.php/3869/minicom-${PV}.tar.gz \
            file://allow.to.disable.lockdev.patch \
+           file://0001-fix-minicom-v-h-return-value-is-not-0.patch \
 "
 
 SRC_URI[md5sum] = "203c56c4b447f45e2301b0cc4e83da3c"
-- 
1.7.9.5


