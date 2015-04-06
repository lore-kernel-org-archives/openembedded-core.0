Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 354F473D2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:05 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so30390702ied.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4uo3ntLGyx2VwS334kIy6OxNvsTa/Hubsqf56SiaJLQ=;
	b=VVs7Nmx6bNVZhoMjEVBBUwo68kLiCxyit5lG9PUw47qlqVIGmCvXXrnwyLZQTzxv1g
	URKJ1Tc1JBLs4ZXRt9KNxV2+7RFBKay0TLkdYglXjRvH4DTe8g4jYGx/hvbKsvDfaZf+
	whYfesPNbBo2UDYnblvAtstY4gH1DWyimKPhY/GUiy+wMJ4OVNsbow90T/H6ekhGqlWP
	+0BPQN5vrlSTxx30R3OQraKwyA2RtD9AixzpgQGn5wkuSkLqmaSiwoaiwF1McCCR4Jzf
	S6izjNwbgs+nd9Ef5lGXBAFID5kXmUIm6CLgw4ZPENEa6zWicu5ppR8c2p+R8JljdO6x
	ucSQ==
X-Received: by 10.50.29.109 with SMTP id j13mr49013026igh.2.1428341827026;
	Mon, 06 Apr 2015 10:37:07 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:35 +0000
Message-Id: <34481dfe6c7e69fb4a195a83dd5def984f38ba4c.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 07/24] binutils: Fix linking issue for R_ARM_REL32 relocs
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:07 -0000

This issue is surfaces with gcc 5.0 but its a real issue in gold
errors are like

https://sourceware.org/ml/binutils/2010-12/msg00473.html
is the test case

Change-Id: I44806e9fb75a164745e52f0040b7efc9be624ae6
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.25.inc   |  1 +
 ...1-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.25.inc b/meta/recipes-devtools/binutils/binutils-2.25.inc
index 6f76530..269bcbb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.25.inc
@@ -31,6 +31,7 @@ SRC_URI = "\
      file://0011-Change-default-emulation-for-mips64-linux.patch \
      file://0012-Add-XLP-instructions-support.patch \
      file://0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch \
+     file://0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch \
      "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch b/meta/recipes-devtools/binutils/binutils/0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
new file mode 100644
index 0000000..e024302
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
@@ -0,0 +1,25 @@
+From ebe26d855452d07e0152bd78d4966475d2de1de8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 5 Mar 2015 07:30:31 +0000
+Subject: [PATCH] gold/arm: Skip pic check for R_ARM_REL32
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gold/arm.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gold/arm.cc b/gold/arm.cc
+index 6c472bb..fb80435 100644
+--- a/gold/arm.cc
++++ b/gold/arm.cc
+@@ -7829,6 +7829,7 @@ Target_arm<big_endian>::Scan::check_non_pic(Relobj* object,
+     case elfcpp::R_ARM_TLS_DTPMOD32:
+     case elfcpp::R_ARM_TLS_DTPOFF32:
+     case elfcpp::R_ARM_TLS_TPOFF32:
++    case elfcpp::R_ARM_REL32:
+       return;
+ 
+     default:
+-- 
+2.1.4
+
-- 
2.1.4


