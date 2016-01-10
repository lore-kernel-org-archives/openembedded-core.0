Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 916547665F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e65so2210230pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d7aIxmBQo7yWurtyPxHQA6jMMxOv0ppzf4zK0gwOe08=;
	b=u74cDvzyywpq5Jjz3xBCOLUD9G9lyiGOdO4KpobPKwMCJGafR0qu2XhVj+8JA8vHdm
	WMNxwK2zjOBWfSfdPfkMA2W9IFT12YbqyZGDWqCDStf+mFyjOHvVBkEyDI7g4LETgDKJ
	2rSrgTy0kcxY3Z5dC1eXDb/ZszHBuM9eoc0ggNOk0+ox8Fbip+PJIaqrraiBQb7hL81t
	FaqOsVnunuP8AVgSRZKBzeNcOVjrpMTMAsepl+H6tb+2fVNgtRziwURwo8gaUvDvDfSi
	STUu3l7zoURN8O836cUYOEe28ZnACk01cP0jBBThLwOpvuVyRpMcFXqH6tQJZunU9/yL
	7XWA==
X-Received: by 10.98.72.130 with SMTP id q2mr15599752pfi.154.1452385877665;
	Sat, 09 Jan 2016 16:31:17 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	f27sm13696455pfj.0.2016.01.09.16.31.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:11 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 292F0FCC84A; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:45 -0800
Message-Id: <bbb6db9b5f8a64411a6ba58ba1ab3d240c75ef6d.1452385572.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 19/20] grub2: Fix CVE-2015-8370
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:16 -0000

From: "Belal, Awais" <Awais_Belal@mentor.com>

http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 50 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
 meta/recipes-bsp/grub/grub_2.00.bb                 |  1 +
 3 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
new file mode 100644
index 0000000..9ddd7a6
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
@@ -0,0 +1,50 @@
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
+Index: grub-2.00/grub-core/lib/crypto.c
+===================================================================
+--- grub-2.00.orig/grub-core/lib/crypto.c
++++ grub-2.00/grub-core/lib/crypto.c
+@@ -458,7 +458,8 @@ grub_password_get (char buf[], unsigned
+ 
+       if (key == '\b')
+ 	{
+-	  cur_len--;
++      if (cur_len)
++        cur_len--;
+ 	  continue;
+ 	}
+ 
+Index: grub-2.00/grub-core/normal/auth.c
+===================================================================
+--- grub-2.00.orig/grub-core/normal/auth.c
++++ grub-2.00/grub-core/normal/auth.c
+@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned
+ 
+       if (key == '\b')
+ 	{
+-	  cur_len--;
+-	  grub_printf ("\b");
++      if (cur_len)
++       {
++	     cur_len--;
++	     grub_printf ("\b");
++        }
+ 	  continue;
+ 	}
+ 
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 7674255..6822e7a 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -30,6 +30,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-2.00-add-oe-kernel.patch \
            file://grub-efi-fix-with-glibc-2.20.patch \
            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
+           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
           "
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index d4df676..94b6da9 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://fix-endianness-problem.patch \
           file://grub2-remove-sparc64-setup-from-x86-builds.patch \
           file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
+          file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
           "
 
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
-- 
1.9.1


