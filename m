Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5335D7611B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:49 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so77377362pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=NRd3OkW126WSPGFaImYjcq+6indgRXNKusj//P7oLp4=;
	b=n3O3AVuPNFd7yiDcg+BGCtXQd25A4avPk9njJL+H98ZWnoNDtX7DOOoCfHCEywhGGU
	TWS2hGMyRwqOT9zx/pgQTSy0WQhDNrPCOCvPaS5BCmSIodJbGDYYVD+JJ2p19aI5SjoK
	kAb9zLLsedZbjylEB8lIWEcOTjKKELT3JVvvkRnHV8H1XEtY/B0sAA2BwMA4mp2VRmF/
	qUD1Fx+u1CYfxG3fr7O0ZuEV3RcGK7Y3rt3cZMFpA0pinwrxCucDR9k1KDFbnO+JvMuT
	7/1metKQEiy8UNYFjK72migMbbUaL8W2R0Km9fVC19Mw8xliFlCE2Dhr7svvgqWm3Zeh
	Jhmw==
X-Received: by 10.66.55.66 with SMTP id q2mr40313520pap.94.1437232610236;
	Sat, 18 Jul 2015 08:16:50 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ra10sm14681226pab.19.2015.07.18.08.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id A5E70FC12F2; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:17 -0700
Message-Id: <14c7d1f15243e974c156b5bc840a0630bf42098b.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 10/25] qt4: add patch for BMP denial-of-service vulnerability
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:50 -0000

From: Jonathan Liu <net147@gmail.com>

did not include aarch64 patches.

For further details, see:
https://bugreports.qt.io/browse/QTBUG-44547

(From OE-Core rev: 840fccf8ec7691f03deeb167487cde941ebea8bf)

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Conflicts:
	meta/recipes-qt/qt4/qt4-4.8.6.inc
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |  1 +
 ...ion-by-zero-when-processing-malformed-BMP.patch | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index ae6692b..3134214 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -22,6 +22,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
            file://0028-Don-t-crash-on-broken-GIF-images.patch \
+           file://0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
new file mode 100644
index 0000000..8ff4ad5
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
@@ -0,0 +1,44 @@
+From e50aa2252cdd5cb53eef7d8c4503c7edff634f68 Mon Sep 17 00:00:00 2001
+From: "Richard J. Moore" <rich@kde.org>
+Date: Tue, 24 Feb 2015 19:02:35 +0000
+Subject: [PATCH] Fix a division by zero when processing malformed BMP files.
+
+This fixes a division by 0 when processing a maliciously crafted BMP
+file. No impact beyond DoS.
+
+Backport of 661f6bfd032dacc62841037732816a583640e187
+
+Upstream-Status: Backport
+
+Task-number: QTBUG-44547
+Change-Id: I43f06e752b11cb50669101460902a82b885ae618
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/gui/image/qbmphandler.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/gui/image/qbmphandler.cpp b/src/gui/image/qbmphandler.cpp
+index b22e842..30fa9e0 100644
+--- a/src/gui/image/qbmphandler.cpp
++++ b/src/gui/image/qbmphandler.cpp
+@@ -319,10 +319,16 @@ static bool read_dib_body(QDataStream &s, const BMP_INFOHDR &bi, int offset, int
+         }
+     } else if (comp == BMP_BITFIELDS && (nbits == 16 || nbits == 32)) {
+         red_shift = calc_shift(red_mask);
++        if (((red_mask >> red_shift) + 1) == 0)
++            return false;
+         red_scale = 256 / ((red_mask >> red_shift) + 1);
+         green_shift = calc_shift(green_mask);
++        if (((green_mask >> green_shift) + 1) == 0)
++            return false;
+         green_scale = 256 / ((green_mask >> green_shift) + 1);
+         blue_shift = calc_shift(blue_mask);
++        if (((blue_mask >> blue_shift) + 1) == 0)
++            return false;
+         blue_scale = 256 / ((blue_mask >> blue_shift) + 1);
+     } else if (comp == BMP_RGB && (nbits == 24 || nbits == 32)) {
+         blue_mask = 0x000000ff;
+-- 
+2.3.1
+
-- 
1.9.1


