Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 543D76A99A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 22:30:58 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id d10so2744088eaj.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2Z9GZvJKXYMGrDsjjFhV8hFH2RSadyT+TKx/yf0SlHs=;
	b=nTmsJefX6A6EQvea6yq6Ii1n81wqXs5yzYjoKSAdfZUh1Zo5RB1SIxK/vFsE5W1wZG
	sZBEbaGRlCME7xroSxEFm1DxLDbb1z0XwdrFAUC8fctcigNK4ouZqFSns18mGZFP0Zcj
	wQLb5G3//d30P4l6xwAP7Mlm9qoNuj2h5IdEx4NIcKP3LT5QDVoBuyuQzSu4usc/nEZA
	qVZCyGFfoJrk6lG0T4i2es+xMnLhFFKrp2YjvCcW549k7VKiDHdpWd13ayT/MUN2Th7q
	O32osEPBnaWjThg1DbodWdLS0y72cgK81nuffKRdUKX8Fa2gq8oRtx97fIEryVqS2f3n
	9dlA==
X-Received: by 10.14.99.71 with SMTP id w47mr18637010eef.140.1370989858413;
	Tue, 11 Jun 2013 15:30:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	s43sm33056563eem.13.2013.06.11.15.30.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 15:30:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 00:31:16 +0200
Message-Id: <1370989876-20531-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
References: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
Subject: [RFC][PATCH] gcc-4.8: Backport fix for ICE triggered in pixman
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
X-List-Received-Date: Tue, 11 Jun 2013 22:30:58 -0000

* http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57329

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc/gcc-4.8/0036-PR-target-56102.patch         | 83 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 6664f1c..bfdb766 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -65,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
 	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
 	   file://0035-wcast-qual-PR-55383.patch \
+	   file://0036-PR-target-56102.patch \
 	   file://gcc-4.8-PR56797.patch \
 	   file://gcc-4.8-build-args.patch \
 	  "
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
new file mode 100644
index 0000000..a9498fc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
@@ -0,0 +1,83 @@
+From fa049b3584a1cc36c250205e3d5841e6a40ff677 Mon Sep 17 00:00:00 2001
+From: amker <amker@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 27 Mar 2013 08:16:54 +0000
+Subject: [PATCH] PR target/56102
+
+* config/arm/arm.c (thumb1_rtx_costs, thumb1_size_rtx_costs): Fix rtx costs for SET/ASHIFT/ASHIFTRT/LSHIFTRT/ROTATERT patterns with mult-word mode.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@197155 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57329
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ gcc/config/arm/arm.c | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+index 460d333..edf850d 100644
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -7094,7 +7094,7 @@ static inline int
+ thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
+ {
+   enum machine_mode mode = GET_MODE (x);
+-  int total;
++  int total, words;
+ 
+   switch (code)
+     {
+@@ -7102,6 +7102,8 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
+     case ASHIFTRT:
+     case LSHIFTRT:
+     case ROTATERT:
++      return (mode == SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSNS (2);
++
+     case PLUS:
+     case MINUS:
+     case COMPARE:
+@@ -7125,7 +7127,10 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
+       return COSTS_N_INSNS (1) + 16;
+ 
+     case SET:
+-      return (COSTS_N_INSNS (1)
++      /* A SET doesn't have a mode, so let's look at the SET_DEST to get
++	 the mode.  */
++      words = ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))));
++      return (COSTS_N_INSNS (words)
+ 	      + 4 * ((MEM_P (SET_SRC (x)))
+ 		     + MEM_P (SET_DEST (x))));
+ 
+@@ -7822,6 +7827,7 @@ static inline int
+ thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
+ {
+   enum machine_mode mode = GET_MODE (x);
++  int words;
+ 
+   switch (code)
+     {
+@@ -7829,6 +7835,8 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
+     case ASHIFTRT:
+     case LSHIFTRT:
+     case ROTATERT:
++      return (mode == SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSNS (2);
++
+     case PLUS:
+     case MINUS:
+     case COMPARE:
+@@ -7847,7 +7855,10 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
+       return COSTS_N_INSNS (1);
+ 
+     case SET:
+-      return (COSTS_N_INSNS (1)
++      /* A SET doesn't have a mode, so let's look at the SET_DEST to get
++	 the mode.  */
++      words = ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))));
++      return (COSTS_N_INSNS (words)
+               + 4 * ((MEM_P (SET_SRC (x)))
+                      + MEM_P (SET_DEST (x))));
+ 
+-- 
+1.8.2.1
+
-- 
1.8.2.1


