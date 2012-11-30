Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TeO7z-00042C-M2
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 11:47:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAUAXC3r019552
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 02:33:12 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 30 Nov 2012 02:33:10 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Nov 2012 18:33:32 +0800
Message-ID: <f8d34130fd56c696f784cdae5b6de28e25958391.1354265260.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354265260.git.Qi.Chen@windriver.com>
References: <cover.1354265260.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/3] ghostscript: make ghostscript work with long building path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 10:47:28 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If TMPDIR has more than 256 chars, building ghostscript fails.
This violates the 410 length limit of TMPDIR.

This patch makes building ghostscript succeed by changing its
MAX_TOKEN from 256 to 512.

[YOCTO #2766]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...tscript-work-with-long-building-directory.patch |   19 +++++++++++++++++++
 .../ghostscript/ghostscript_9.05.bb                |   10 ++++------
 2 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
new file mode 100644
index 0000000..a4ce70a
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Inappropriate [distribution]
+
+Make ghost script work with long building directory
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: base/genconf.c
+==============================================================
+--- a/base/genconf.c
++++ b/base/genconf.c
+@@ -682,7 +682,7 @@ read_dev(config_t * pconf, const char *arg)
+     string_item_t *item;
+     const char *in;
+ 
+-#define MAX_TOKEN 256
++#define MAX_TOKEN 512
+     char *token = malloc(MAX_TOKEN + 1);
+     char *category = malloc(MAX_TOKEN + 1);
+     int file_index;
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index 1fdcb99..2789897 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_class-native = ""
@@ -30,7 +30,9 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.05-NOT-check-endian.patch \
            "
 
-SRC_URI_class-native = "${SRC_URI_BASE}"
+SRC_URI_class-native = "${SRC_URI_BASE} \
+		        file://0001-make-ghostscript-work-with-long-building-directory.patch \
+		        "
 
 SRC_URI[md5sum] = "f7c6f0431ca8d44ee132a55d583212c1"
 SRC_URI[sha256sum] = "593f77f7584704bdf9de41598a084a4208c3ad3b940a1de1faaf8f59a15cc207"
@@ -80,10 +82,6 @@ do_install_append () {
     chown -R root:lp ${D}${sysconfdir}/cups
 }
 
-python do_patch_class-native () {
-    pass
-}
-
 do_compile_class-native () {
     mkdir -p obj
     for i in genarch genconf mkromfs echogs gendev genht; do
-- 
1.7.9.5



