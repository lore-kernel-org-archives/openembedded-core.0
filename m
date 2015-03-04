Return-Path: <net147@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id DBA7660144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 20:57:45 +0000 (UTC)
Received: by paceu11 with SMTP id eu11so22572716pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 12:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8mxIgBZSjJ+yPKbZbwR7OI8Wh0CeyG94gfhOsidbnzU=;
	b=Lvv5F8ZoMTLumaBOwx/1nEzsIrjjg0Y97SOShCBhgyWB506fwPh1cjyB8dCBjdOH0U
	QOgG6smfi/GHuTvHHfN/R6bkMQkbvt236RfTqGN2yFf7FfTGM6hTK/hcMPzVWj2Wlqhh
	1OIP15e5AXzoYW8rBifgwZ/4GUrFOisF64d4zH8TpBCWvjO6qGmmi3nDEwWeVcoGohhp
	tVK9nu/9qfD2YHxPf+4D6D0F7U7wd5BujCssBZVM2gjuQTs1KdL1HiMNhI9jJbRGQYfz
	tnFILSmffSngbo3PAlTRHs40jQJD6fe5gQ6qvWc7r516QlyjicyvVx73wBTI5YkYxvpV
	AuDw==
X-Received: by 10.70.42.70 with SMTP id m6mr10036611pdl.19.1425502666741;
	Wed, 04 Mar 2015 12:57:46 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id fy2sm4891207pbb.30.2015.03.04.12.57.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 12:57:45 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 07:57:39 +1100
Message-Id: <1425502659-26524-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [daisy][PATCH] qt4: add patch for BMP denial-of-service vulnerability
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
X-List-Received-Date: Wed, 04 Mar 2015 20:57:47 -0000

For further details, see:
https://bugreports.qt.io/browse/QTBUG-44547

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |  1 +
 ...ion-by-zero-when-processing-malformed-BMP.patch | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0028-Fix-a-division-by-zero-when-processing-malformed-BMP.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
index 843ad7a..f364a78 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -26,6 +26,7 @@ SRC_URI = "http://download.qt-project.org/archive/qt/4.8/${PV}/qt-everywhere-ope
            file://0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch \
            file://0025-Fix-misaligned-selection-region-with-text-when-cente.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
+           file://0028-Fix-a-division-by-zero-when-processing-malformed-BMP.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0028-Fix-a-division-by-zero-when-processing-malformed-BMP.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0028-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
new file mode 100644
index 0000000..8ff4ad5
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.5/0028-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
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
2.3.1


