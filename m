Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id ED817762B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 18:10:29 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vy10so1802586pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aVXfwdNcfLj778MdCu1++BHMZ7yVoif2ZMJqxCZz324=;
	b=dL6QfWtHxTJuC0x80AkBFk1WoZypl6M4zImnboMFWxiyMVN7hLzzSsEPam53Z3UPyW
	L/mElH86urMEa5ZMiPq//4sbAZwW5EXcJryA/S/xZmKk82fTN9BuyHNMjALwzgFNqyjb
	y6iElQ3GyzpCQjjBnZXMr2Q02DO87BQL73rMOBY6f92RFxvs2fXaH4VVGT2JlhscaBOu
	z3R9Qap8F85AdQdjgwrxPXEkguBhRK0y+kRbg6hYILsPx5jNbgnwS80MLz1rURlNnFkS
	HhbPW6OVnqOrk6J4Q8fbEO6oAdgGZFvqcCCmNJhbUSMmidhVh6slpb0VfCagyRiP95df
	YqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aVXfwdNcfLj778MdCu1++BHMZ7yVoif2ZMJqxCZz324=;
	b=dgwfv8s1WfGH/XuFC7IDgvFsOD/a6Hm8pDx+tmBZpqVKRiPBvycfbri2H8JearyJsH
	MAIi3Z9gxctIsIslO3ynu+eFMMjbzMKrN/6kRc1TiBKLxL3XjIxC35RCmLUO3cDa01T+
	U32WuJk2Fqn3ge+LePdAT+z6bbAnxIE7uCrjxaRKh/KKIlyh1WwCN+r56y/teFbG8X1E
	Fj1Ea3mz7hOLAzt/Ikjk+vXAc2l/4csOqj79RVi0kYGCbdecPHrgkrTOfgMzo4stmG96
	usJU+P+jUn8NArI4IxK2TgLGNS+mJrokRQpo2EZed7zuazI+aeh1kSn6Nm6wGOxL6UiY
	L00g==
X-Gm-Message-State: AEkooutcR65cpdjj0gpjhsAElJovoXG33U4qBOqi/N2jEhyyDR1KeVPM1Mqmuke+7z3vOQ==
X-Received: by 10.66.123.105 with SMTP id lz9mr30011077pab.56.1471025430131;
	Fri, 12 Aug 2016 11:10:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i137sm14624884pfe.64.2016.08.12.11.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 11:10:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 11:10:22 -0700
Message-Id: <20160812181022.28742-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [PATCH] gmp: Fix wrong detection of -march flag
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
X-List-Received-Date: Fri, 12 Aug 2016 18:10:32 -0000

Configure detects -march flag based upon target
triplet, it wrongly passes -march=armv4 for all
arm, this is unearthed when compiling with clang
since it errors out with flags like

/tmp/kraj01/a-0c2038.s:27: Error: selected processor does not support `bx r0' in ARM mode

since it does not pass --fix-v4bx along with
-march=armv4, which does not happen with gcc
toolchain since this flag is passed impicitly hence
this error was indetected

Fixed thusly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...re.ac-Believe-the-cflags-from-environment.patch | 52 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.1.1.bb              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-6.1.1/0001-confiure.ac-Believe-the-cflags-from-environment.patch

diff --git a/meta/recipes-support/gmp/gmp-6.1.1/0001-confiure.ac-Believe-the-cflags-from-environment.patch b/meta/recipes-support/gmp/gmp-6.1.1/0001-confiure.ac-Believe-the-cflags-from-environment.patch
new file mode 100644
index 0000000..6653676
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-6.1.1/0001-confiure.ac-Believe-the-cflags-from-environment.patch
@@ -0,0 +1,52 @@
+From ae1a4c37417a3bbbf8ea1cab198982b0cad47e29 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Aug 2016 17:08:13 +0000
+Subject: [PATCH] confiure.ac: Believe the cflags from environment
+
+In some toolchains e.g. OpenEmbedded -march options
+are passed on compiler cmdline, it does not use
+the expected target triplets to make these decision
+during configure.
+
+Secondly, dont set armv4 for march when no selection
+is made, since it is passed from cmdline
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Inappropriate[OE-Specific]
+
+ configure.ac | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 857ea3b..359e919 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -607,15 +607,6 @@ case $host in
+     GMP_INCLUDE_MPN(arm/arm-defs.m4)
+     CALLING_CONVENTIONS_OBJS='arm32call.lo arm32check.lo'
+ 
+-    # This is needed for clang, which is not content with flags like -mfpu=neon
+-    # alone.
+-    case $host in
+-      *-*-*eabi)
+-        gcc_cflags_fpmode="-mfloat-abi=softfp" ;;
+-      *-*-*eabihf)
+-        gcc_cflags_fpmode="-mfloat-abi=hard" ;;
+-    esac
+-
+     # FIXME: We make mandatory compiler options optional here.  We should
+     # either enforce them, or organise to strip paths as the corresponding
+     # options fail.
+@@ -686,8 +677,6 @@ case $host in
+ 	;;
+       *)
+ 	path="arm"
+-	gcc_cflags_arch="-march=armv4"
+-	GMP_DEFINE_RAW(["define(<NOTHUMB>,1)"])
+ 	;;
+     esac
+     ;;
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gmp/gmp_6.1.1.bb b/meta/recipes-support/gmp/gmp_6.1.1.bb
index 1df9b06..303c3ef 100644
--- a/meta/recipes-support/gmp/gmp_6.1.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://amd64.patch \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
+           file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
            "
 
 SRC_URI[md5sum] = "4c175f86e11eb32d8bf9872ca3a8e11d"
-- 
2.9.2


