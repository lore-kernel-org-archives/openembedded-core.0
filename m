Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrAdS-0001mT-M3
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:28:30 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 09:16:41 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so378847wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=YNRk3bzDnlQSTZydEVGSIeYVFd20g/gNGXsZBmyMB70=;
	b=dbp+dAXGjdSiSEqm47py1KrLYGAUAvuHkhHrLPome/yJasB6tI8X+xtIOC/GdtRWn+
	R5twW5dJcjVhW1O3MsSLIkQwtmz2JhXcdjyyJo7lpFeGouEJ3d+M/bDRBjw1YZoFE4kD
	9f7rSZ84RCMI7LMbU+0LTAfu9lYVc29BqZdqCRR4U5h44qTDsXAs/hk9aXXUzqHa4XB7
	ygM6OJYF2J47knAVDczSAe39yq6OkYcWWOuoG8ewCKYvSXSG4FXVyYsE9nwIMETlFBb0
	UOBkWjvd/ieirOteo1fIp8RyhLjd5r3Kd3E9Fjnacu3iR8u0ywf0uf+gutxLjzVSYEMl
	4W2A==
Received: by 10.216.42.194 with SMTP id j44mr1620774web.42.1342541800842;
	Tue, 17 Jul 2012 09:16:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm27689423wiw.9.2012.07.17.09.16.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:16:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 17:16:20 +0100
Message-Id: <1342541781-26628-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342541781-26628-1-git-send-email-ross.burton@intel.com>
References: <1342541781-26628-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkd04raw4Caej+bIKbDpWcAGFOpq8K+jInpc+ReNhI8WetiyGwOoUoRUH/SMfkRbD01zV6i
Subject: [PATCH 2/2] connman: fix crashes on startup on PPC/MIPS
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
X-List-Received-Date: Tue, 17 Jul 2012 16:28:30 -0000

It appears that when there is no existing connman state there is memory
corruption which causes free() on MIPS/PPC to abort.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.3.bb   |    5 +--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch b/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
new file mode 100644
index 0000000..c92b586
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
@@ -0,0 +1,37 @@
+From ea8c7b3efce4c1762411e073893e948de5d552d6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 17 Jul 2012 16:04:12 +0100
+Subject: [PATCH] storage: check that the string isn't empty before splitting
+
+If the string was non-NULL but empty (str="\0"), the following \0 assignment
+would write to str[-1] and thus cause memory corruption.
+
+On PPC and MIPS, this was causing crashes in glibc.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Submitted
+ 
+---
+ src/storage.c |    6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/storage.c b/src/storage.c
+index 47bd0cb..20766a3 100644
+--- a/src/storage.c
++++ b/src/storage.c
+@@ -212,7 +212,11 @@ gchar **connman_storage_get_services()
+ 	closedir(dir);
+ 
+ 	str = g_string_free(result, FALSE);
+-	if (str) {
++	if (str && str[0] != '\0') {
++		/*
++		 * Remove the trailing separator so that services doesn't end up
++		 * with an empty element.
++		 */
+ 		str[strlen(str) - 1] = '\0';
+ 		services = g_strsplit(str, "/", -1);
+ 	}
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.3.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
index a9faf74..ae688c9 100644
--- a/meta/recipes-connectivity/connman/connman_1.3.bb
+++ b/meta/recipes-connectivity/connman/connman_1.3.bb
@@ -7,6 +7,7 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             file://0001-storage.c-If-there-is-no-d_type-support-use-stat.patch \
-            file://0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch"
+            file://0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch \
+            file://storage-check-that-the-string-isn-t-empty-before-spl.patch"
 S = "${WORKDIR}/git"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
-- 
1.7.10



