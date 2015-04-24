Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id BE17573D87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:46 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so14158366pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cL6TAWwC+JHU2KglIagnRG0wVITnAm0ag/mlnLzbOH4=;
	b=lCI10bkjBodWyCoSk1n6jr+ANsqtqEktQr1IRsfUl4aaUN2LN0dExD6cFJA1c6F9FG
	F2ctSLbHanZiZBjay5CwqIPK5SyDS0An5ALNEjmd+KrkaN5Vg7h/KjsUD2guFYdqa4H4
	grDzXIH7v6sKaZxDH7tWgViQmdPpeXTfx05tVh8+UQZ11I13rKQ2bYHC0NyOLJFPQnqd
	1erNfvFi1MHXMWWb28RjPtK2e2FSBRLN5aHj/gXNY3r2Z7GcE4cRe8DbdOMeU49i0Rym
	wdOBMR4JHpxcR8LN9EENu0rom4LXY7dKOiRXBKSBH4yj1dVB5mIHwkwkDJ8mDQV3UUKF
	06qA==
X-Received: by 10.70.119.36 with SMTP id kr4mr2271977pdb.39.1429846548377;
	Thu, 23 Apr 2015 20:35:48 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:28 -0700
Message-Id: <d6510b0f7e9ab4c32ded2823bdacfb9cd05d3f91.1429846256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 10/14] grub: Backport const qualifier fix for gcc-5
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:46 -0000

gcc-5 is stricter and complains about const to non-const
conversions, we backport the patch from upstream into 2.00

Change-Id: I17db365fdd253daaa1ab726e2a70ecad0ac7b2ae
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._dhcp_vendor-Add-missing-const-qualifiers.patch | 33 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch

diff --git a/meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch b/meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
new file mode 100644
index 0000000..255e3eb
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Backport
+
+Original commit: http://git.savannah.gnu.org/cgit/grub.git/commit/grub-core/net/bootp.c?id=f06c2172c0b32052f22e37523445cf8e7affaea3
+
+From 149d2a14f4723778ced23f439487201ccbf1a2c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Apr 2015 07:03:34 +0000
+Subject: [PATCH] parse_dhcp_vendor: Add missing const qualifiers.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ grub-core/net/bootp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c
+index bc07d53..44131ed 100644
+--- a/grub-core/net/bootp.c
++++ b/grub-core/net/bootp.c
+@@ -52,9 +52,9 @@ set_env_limn_ro (const char *intername, const char *suffix,
+ }
+ 
+ static void
+-parse_dhcp_vendor (const char *name, void *vend, int limit, int *mask)
++parse_dhcp_vendor (const char *name, const void *vend, int limit, int *mask)
+ {
+-  grub_uint8_t *ptr, *ptr0;
++  const grub_uint8_t *ptr, *ptr0;
+ 
+   ptr = ptr0 = vend;
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 08c0b6b..add4586 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
            file://grub-efi-fix-with-glibc-2.20.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
             "
 
 DEPENDS = "flex-native bison-native xz"
-- 
2.1.4


