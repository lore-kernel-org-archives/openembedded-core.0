Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFCCA75695
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:52:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Eq24g015188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:52:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:52:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:57 -0700
Message-ID: <70ba61d4973fc7585165bebcb1765b7f22f460a4.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] x264: r2265 -> r2491
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:06 -0000
Content-Type: text/plain

Update don-t-default-to-cortex-a9-with-neon.patch for aarch64.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../don-t-default-to-cortex-a9-with-neon.patch     |   21 ++++++++++++++------
 meta/recipes-multimedia/x264/x264_git.bb           |    4 ++--
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
index b844d88..bf72fca 100644
--- a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
+++ b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
@@ -4,13 +4,13 @@
 Upstream-Status: Pending
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: git/configure
-===================================================================
---- git.orig/configure	2013-02-10 16:26:40.666343682 +0200
-+++ git/configure	2013-02-10 16:27:49.198341677 +0200
-@@ -703,9 +703,6 @@
+diff --git a/configure b/configure
+index 2916036..f4ece40 100755
+--- a/configure
++++ b/configure
+@@ -773,9 +773,6 @@ if [ $asm = auto -a \( $ARCH = X86 -o $ARCH = X86_64 \) ] ; then
  fi
-
+ 
  if [ $asm = auto -a $ARCH = ARM ] ; then
 -    # set flags so neon is built by default
 -    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS="$CFLAGS -mcpu=cortex-a8 -mfpu=neon"
@@ -18,3 +18,12 @@ Index: git/configure
      if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE_ARMV6
          cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE_ARMV6T2
          cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE_NEON
+@@ -788,8 +785,6 @@ if [ $asm = auto -a $ARCH = ARM ] ; then
+ fi
+ 
+ if [ $asm = auto -a $ARCH = AARCH64 ] ; then
+-    # set flags so neon is built by default
+-    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu|-arch)' || CFLAGS="$CFLAGS -arch arm64 -mfpu=neon"
+ 
+     if  cc_check '' '' '__asm__("cmeq v0.8h, v0.8h, #0");' ; then define HAVE_NEON
+         ASFLAGS="$ASFLAGS -c"
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 105ccae..0a69909 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -12,9 +12,9 @@ SRC_URI = "git://git.videolan.org/x264.git \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            "
 
-SRCREV = "ffc3ad4945da69f3caa2b40e4eed715a9a8d9526"
+SRCREV = "c8a773ebfca148ef04f5a60d42cbd7336af0baf6"
 
-PV = "r2265+git${SRCPV}"
+PV = "r2491+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


