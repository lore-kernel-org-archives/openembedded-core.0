Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1SujCx-0003AB-3a
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:59:51 +0200
Received: by pbbrq2 with SMTP id rq2so4398931pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hsm+wb+t6b4WdIr35fDFdYECMD2FY6oZh8aIyGYqFZ8=;
	b=arA8yUbI5sRXUHSKiEgVVgylfFx/oBqrvCCRmmALNziOPAjTcKpzNhIT2HdVH1goFo
	BxH4f2LMQR6DDtiOvzmuYiNHyD7IN31XMLtCg7ZPejj5I2JI/s180gwSEvlJxR9297iY
	aeJdvbzEONBW+/8hdXxH6P1lV4TpA3oSzU7nJJTm7jdBAqfVr9bp9sarObCfyMJmKDIA
	iUgX1Mq3gwFa1zjofYQb0ckYWRqyVgH7qnJY3DhO6ZK8NTetlFFnqll25wD7htn7cUuA
	j7dYNmocUTBf+iuXTz2Pmr3z1bvubr/txB/cdAZS93tkrLJ5QXsxknDK1e/672HO3cFj
	jIHA==
Received: by 10.68.134.201 with SMTP id pm9mr13880801pbb.49.1343389698264;
	Fri, 27 Jul 2012 04:48:18 -0700 (PDT)
Received: from localhost.localdomain ([110.93.212.98])
	by mx.google.com with ESMTPS id ku7sm1782675pbc.31.2012.07.27.04.48.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:48:17 -0700 (PDT)
From: Fahad Usman <fahad.usman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 16:47:21 +0500
Message-Id: <1343389641-15641-1-git-send-email-fahad.usman@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] qemu: cflags concatination issue
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
X-List-Received-Date: Fri, 27 Jul 2012 11:59:51 -0000

From: Fahad Usman <fahad_usman@mentor.com>

add patch to fix cflags concatination issue

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 .../qemu/qemu-0.15.1/cflags-separator.patch        |   15 +++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 ++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/cflags-separator.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/cflags-separator.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/cflags-separator.patch
new file mode 100644
index 0000000..9eb9c70
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/cflags-separator.patch
@@ -0,0 +1,15 @@
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- qemu-0.15.1.orig/configure
++++ qemu-0.15.1/configure
+@@ -2550,7 +2550,7 @@ int main(int argc, char **argv)
+ }
+ EOF
+   if ! compile_prog "" "" ; then
+-    CFLAGS+="-march=i486"
++    CFLAGS+=" -march=i486"
+   fi
+ fi
+ 
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index 2cc59f6..6a4a1ec 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r9"
+PR = "r10"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
     file://dummy-gl-config.patch \
     file://0001-ppc64-Fix-linker-script.patch \
+    file://cflags-separator.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions
-- 
1.7.1



