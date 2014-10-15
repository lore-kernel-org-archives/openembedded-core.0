Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 10DC665D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 09:21:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9F9LU5c022371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 02:21:30 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 15 Oct 2014 02:21:29 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Oct 2014 17:21:34 +0800
Message-ID: <1413364894-25626-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: fix a Gcc undefined behavior
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
X-List-Received-Date: Wed, 15 Oct 2014 09:21:33 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Calling strncpy with NULL second argument, even when the size is 0,
is undefined behavior, which leads to GCC to drop the check old
variable with NULL in following code.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6743

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../files/fix-a-Gcc-undefined-behavior.patch       |   38 ++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |    1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch

diff --git a/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch b/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
new file mode 100644
index 0000000..5843ba0
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
@@ -0,0 +1,38 @@
+[PATCH] fix a Gcc undefined behavior
+
+Upstream-Status: Pending
+
+Calling strncpy with NULL second argument, even when the size is 0,
+is undefined behavior, which leads to GCC to drop the check old
+variable with NULL in following code.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=6743
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ support/export/client.c |    9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/support/export/client.c b/support/export/client.c
+index dbf47b9..a37ef69 100644
+--- a/support/export/client.c
++++ b/support/export/client.c
+@@ -482,8 +482,13 @@ add_name(char *old, const char *add)
+ 		else
+ 			cp = cp + strlen(cp);
+ 	}
+-	strncpy(new, old, cp-old);
+-	new[cp-old] = 0;
++
++	if (old) {
++		strncpy(new, old, cp-old);
++		new[cp-old] = 0;
++	} else
++		new[0] = 0;
++	
+ 	if (cp != old && !*cp)
+ 		strcat(new, ",");
+ 	strcat(new, add);
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index c813d7f..f1ef6d9 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-statd.service \
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://0001-statd-fixed-the-with-statdpath-flag.patch \
+           file://fix-a-Gcc-undefined-behavior.patch \
 "
 
 SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
-- 
1.7.10.4


