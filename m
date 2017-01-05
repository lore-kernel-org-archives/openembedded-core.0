Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1D471B2F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:41 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 3so51662204oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=199n+J2dB0uYB5XS6jTdyAP7x+XpLODSk/zFFeQvNIY=;
	b=cf+F+DkPjQgxDQufiw24OzinNxcM7C6T4IhcoWqdZ7jYEg9y7chwYKr1enadpXO4F7
	gW3QvyjTqqnLqaS1KepWmUwLXE82JOujtxQTnI+0O9rI81EOW9valJIIfLKRaPGxT6dU
	tmAtokc1pR4bEO+80PDVJg6fzeCbtWeTEh2Cj79jhZUD3iF/a2LVoFHBplZ2qfzkJHFf
	tiuyRVdBed34SWn0NellMTlvHy5QVXF/fSPxEGi5Plo8N2PVOvX5/ODEq79MJ2W2f0i0
	XYnlQYr94+d2RiMe2TLiRZFmP3ox/tk/pZUshmTs5Qq6eZGEVa/XPHSGokELF3ff50yI
	Zd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=199n+J2dB0uYB5XS6jTdyAP7x+XpLODSk/zFFeQvNIY=;
	b=Jb/KS3h5BHtglHyJcm314/aqyiN0goUZHr3mhKwc7WFNoI2GCqYyYYMbOl/qZe2RbA
	E8jxA9ZTVR+fzZ7WeGjHSwUiC5bBlxFCTCom9hGSRyOw4NK2ID88y3M637B6B4j/Dfz2
	AwbL1TaxlQ3ZfcYKrvSY41mZuiiCibgJA2Hb5r9vXAJl4QOiOqVOsiEX2dmr/q/KsDQG
	s+E8bjgCRUWi+qq879L5csrvYDhr7hZOV2pxg7r1hxq6yME7Sl0jlHGZA+HJ3RFF/6y0
	Zsakz06XR+81EEj9TM4cu6BgxYVFQQGXWlXWL+RaIZ8n41AbTImh8TJql6NFyj85i+67
	fVaQ==
X-Gm-Message-State: AIkVDXIYpLjI3uCpbgOnCYu5v8Mfq8s+DZOnsxu7IMWb11o+r4achkfPx8BCRlbg2AgAuA==
X-Received: by 10.157.5.6 with SMTP id 6mr2045158otw.209.1483645601518;
	Thu, 05 Jan 2017 11:46:41 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:40 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:19 -0700
Message-Id: <e64971be06930fba176bdfaf254fe17eebd1e8cc.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 07/16] gummiboot: fix for x32 from systemd-boot
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../gummiboot/configure-allow-setting-EFI_CC.patch | 28 ++++++++++++++++++++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot/configure-allow-setting-EFI_CC.patch

diff --git a/meta/recipes-bsp/gummiboot/gummiboot/configure-allow-setting-EFI_CC.patch b/meta/recipes-bsp/gummiboot/gummiboot/configure-allow-setting-EFI_CC.patch
new file mode 100644
index 0000000..59997f2
--- /dev/null
+++ b/meta/recipes-bsp/gummiboot/gummiboot/configure-allow-setting-EFI_CC.patch
@@ -0,0 +1,28 @@
+From e18c86d8eb1fb6166b8c386446123790e503d28c Mon Sep 17 00:00:00 2001
+From: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
+Date: Wed, 8 Apr 2015 22:33:53 +0200
+Subject: [PATCH] configure: allow setting EFI_CC
+
+Upstream-Status: Backport [from systemd-boot]
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 27bbe1d..3efb810 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -37,8 +37,7 @@ AC_SYS_LARGEFILE
+ AC_PROG_CC
+ 
+ dnl Don't try to use things like -std=c99 for efi compilation
+-EFI_CC=$CC
+-AC_SUBST([EFI_CC])
++AC_CHECK_TOOL(EFI_CC, gcc)
+ 
+ AC_PROG_CC_C99
+ AM_PROG_CC_C_O
+-- 
+2.8.0
+
diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index c684b83..d7d6c28 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -14,6 +14,7 @@ SRCREV = "2bcd919c681c952eb867ef1bdb458f1bc49c2d55"
 SRC_URI = "git://anongit.freedesktop.org/gummiboot \
            file://fix-objcopy.patch \
            file://0001-console-Fix-C-syntax-errors-for-function-declaration.patch \
+           file://configure-allow-setting-EFI_CC.patch \
           "
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
-- 
2.8.0


