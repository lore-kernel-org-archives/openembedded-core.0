Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C482A6072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 10:40:12 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aDVDp-0006y2-Ic from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Dec 2015 02:40:13 -0800
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Mon, 28 Dec 2015 10:40:12 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Dec 2015 15:40:01 +0500
Message-ID: <1451299201-4745-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [fido][PATCH] grub2: Fix CVE-2015-8370
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
X-List-Received-Date: Mon, 28 Dec 2015 10:40:12 -0000
Content-Type: text/plain

http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
new file mode 100644
index 0000000..1661f64
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Accepted
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+
+From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001
+From: Hector Marco-Gisbert <hecmargi@upv.es>
+Date: Wed, 16 Dec 2015 04:57:18 +0000
+Subject: Fix security issue when reading username and password
+
+This patch fixes two integer underflows at:
+  * grub-core/lib/crypto.c
+  * grub-core/normal/auth.c
+
+CVE-2015-8370
+
+Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>
+Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>
+Also-By: Andrey Borzenkov <arvidjaar@gmail.com>
+---
+diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
+index 010e550..683a8aa 100644
+--- a/grub-core/lib/crypto.c
++++ b/grub-core/lib/crypto.c
+@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned buf_size)
+
+       if (key == '\b')
+       {
+-        cur_len--;
++        if (cur_len)
++          cur_len--;
+         continue;
+       }
+
+diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c
+index c6bd96e..8615c48 100644
+--- a/grub-core/normal/auth.c
++++ b/grub-core/normal/auth.c
+@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned buf_size)
+
+       if (key == '\b')
+       {
+-        cur_len--;
+-        grub_printf ("\b");
++        if (cur_len)
++          {
++            cur_len--;
++            grub_printf ("\b");
++          }
+         continue;
+       }
+
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 8e733ec..c281098 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
            file://grub-efi-fix-with-glibc-2.20.patch \
            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
+           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
             "
 
 DEPENDS = "flex-native bison-native xz"
-- 
1.9.1


