Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 612186CF06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 07:02:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G72Hmt028093
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 00:02:17 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.203) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 16 Oct 2013 00:02:16 -0700
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Oct 2013 15:02:13 +0800
Message-ID: <1381906933-32392-1-git-send-email-Chong.Lu@windriver.com>
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
X-List-Received-Date: Wed, 16 Oct 2013 07:02:16 -0000
Content-Type: text/plain

From: Lu Chong <Chong.Lu@windriver.com>

The previous return value for '-h' and '-v' options was 1 which was
not correct. These two options should return 0 instead.

Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
---
 ...001-fix-minicom-h-v-return-value-is-not-0.patch |   35 ++++++++++++++++++++
 meta/recipes-extended/minicom/minicom_2.6.2.bb     |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-h-v-return-value-is-not-0.patch

diff --git a/meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-h-v-return-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-h-v-return-value-is-not-0.patch
new file mode 100644
index 0000000..bd8261c
--- /dev/null
+++ b/meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-h-v-return-value-is-not-0.patch
@@ -0,0 +1,35 @@
+Subject: [PATCH] fix minicom -h/-v return value is not 0
+
+Upstream-Status: Pending
+
+Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
+
+---
+ src/minicom.c |    6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/minicom.c b/src/minicom.c
+index e1a557b..730da7c 100644
+--- a/src/minicom.c
++++ b/src/minicom.c
+@@ -1166,15 +1166,13 @@ int main(int argc, char **argv)
+ 	         "modify it under the terms of the GNU General Public License\n"
+                  "as published by the Free Software Foundation; either version\n"
+                  "2 of the License, or (at your option) any later version.\n\n");
+-          exit(1);
+-          break;
++          exit(0);
+         case 's': /* setup mode */
+           dosetup = 1;
+           break;
+         case 'h':
+           helpthem();
+-          exit(1);
+-          break;
++          exit(0);
+         case 'p': /* Pseudo terminal to use. */
+           if (strncmp(optarg, "/dev/", 5) == 0)
+             optarg += 5;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/minicom/minicom_2.6.2.bb b/meta/recipes-extended/minicom/minicom_2.6.2.bb
index 558867d..bef386a 100644
--- a/meta/recipes-extended/minicom/minicom_2.6.2.bb
+++ b/meta/recipes-extended/minicom/minicom_2.6.2.bb
@@ -10,6 +10,7 @@ PR = "r0"
 
 SRC_URI = "http://alioth.debian.org/frs/download.php/3869/minicom-${PV}.tar.gz \
            file://allow.to.disable.lockdev.patch \
+           file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
 "
 
 SRC_URI[md5sum] = "203c56c4b447f45e2301b0cc4e83da3c"
-- 
1.7.9.5


