Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (unknown [209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3EEA46FA55
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:53:04 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id lj1so525462pab.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sasOfKgp56WhiC5JuL9+2WPo+WRoBr8NRVtxBbMSgCY=;
	b=NDuOApK77CvtmwOUtQSCmI50zNq40dMWBAKm5v0jz/gaPHxk1hi/HyylZ0h4a5jT5j
	LNNsQicsW1x8Qwz/wEEY8708T3b/nwS91D4pdfoT4CUAOqjvytl4T+m1GSrXtqspcwEd
	1hmBNEBLkLgfHudiEFmvIVL1ifPum1r80H2T+/gN3q7sjjfwcfvy2+tLMH/XAI8wmKnq
	cX4YsF9LqRjnZG3/IvencEY8g9hKjeJeUDUEkCoaOvdAc1uKUnWzd/OdKEt4uaKIMT6K
	nBxSUGn1QAoprdmqpE2rAUdoESOtuXcPZFWFQidBiRpmdUWFZgkDU57hSLA6jY1mtG5V
	vX6w==
X-Received: by 10.69.25.105 with SMTP id ip9mr5931256pbd.145.1401346386076;
	Wed, 28 May 2014 23:53:06 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	wl5sm31727089pbc.13.2014.05.28.23.53.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:53:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 23:55:46 -0700
Message-Id: <1401346546-29533-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH V2 1/2] eglibc: Fix configure when re-building with gold
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
X-List-Received-Date: Thu, 29 May 2014 06:53:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.19/grok_gold.patch             | 34 ++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.19.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/grok_gold.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/grok_gold.patch b/meta/recipes-core/eglibc/eglibc-2.19/grok_gold.patch
new file mode 100644
index 0000000..d46737a
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.19/grok_gold.patch
@@ -0,0 +1,34 @@
+Make ld --version output matching grok gold's output
+
+adapted from from upstream branch roland/gold-vs-libc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+
+Index: libc/configure
+===================================================================
+--- libc.orig/configure
++++ libc/configure
+@@ -4654,7 +4654,7 @@ else
+   # Found it, now check the version.
+   { $as_echo "$as_me:${as_lineno-$LINENO}: checking version of $LD" >&5
+ $as_echo_n "checking version of $LD... " >&6; }
+-  ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
++  ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU [Bbinutilsd][^.]* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+     2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*)
+Index: libc/configure.ac
+===================================================================
+--- libc.orig/configure.ac
++++ libc/configure.ac
+@@ -990,7 +990,7 @@ AC_CHECK_PROG_VER(AS, $AS, --version,
+ 		  [GNU assembler.* \([0-9]*\.[0-9.]*\)],
+ 		  [2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*], AS=: critic_missing="$critic_missing as")
+ AC_CHECK_PROG_VER(LD, $LD, --version,
+-		  [GNU ld.* \([0-9][0-9]*\.[0-9.]*\)],
++		  [GNU [Bbinutilsd][^.]* \([0-9][0-9]*\.[0-9.]*\)],
+ 		  [2.1[0-9][0-9]*|2.[2-9][0-9]*|[3-9].*|[1-9][0-9]*], LD=: critic_missing="$critic_missing ld")
+ 
+ # These programs are version sensitive.
diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
index 1ddce82..10b4bb1 100644
--- a/meta/recipes-core/eglibc/eglibc_2.19.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
            file://ppce6500-32b_slow_ieee754_sqrt.patch \
+           file://grok_gold.patch \
           "
 SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
 SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
-- 
1.9.3


