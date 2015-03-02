Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id DE4C07212A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 06:47:52 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so37289992pdj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2015 22:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MO72vkpSo/xDV46KpyjJRMZIsjePXyssZoOpz5oOkPc=;
	b=ES7lS6EdqD4vrp/GaXwwNy4jMETj7Gd8y+phLusE6tNRwsldQeO/8sm8aElbWNzjCh
	fvvh49YlKN7pLoFyEtJk/nPK1BzkFvksIuQgg+adY5SDx+fn5B5HgdjLBvKsDVsEeRsv
	WqrKEc1Um+M9XwfoczbRRoQcoP+ZZXHi8I8W4sQ47ezd8GkSCIgUTcOkCiZWrUTVz++a
	b2QnJbCdhOU9KoGwpXUb1Crd0EZf9/Pnzdn/eUOui31ksuEbid3Dri0U6fBghm4OeRuS
	72v3jmPghp4EV5TPabcd2LtkP6BdObXkkqIuf+DF6U26bMaOIgCYCp2zs2fknb5qr/BW
	3VyQ==
X-Received: by 10.66.97.7 with SMTP id dw7mr44540425pab.56.1425278873689;
	Sun, 01 Mar 2015 22:47:53 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	lg8sm10810288pbc.55.2015.03.01.22.47.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Mar 2015 22:47:52 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 17:47:46 +1100
Message-Id: <1425278866-6122-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] qt4: add patch for BMP denial-of-service vulnerability
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
X-List-Received-Date: Mon, 02 Mar 2015 06:47:54 -0000

For further details, see:
https://bugreports.qt.io/browse/QTBUG-44547

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |  1 +
 ...ion-by-zero-when-processing-malformed-BMP.patch | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index bd20dac..19f52a7 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -26,6 +26,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0030-aarch64_arm64_qatomic_support.patch \
            file://0031-aarch64_arm64_mkspecs.patch \
            file://0032-aarch64_add_header.patch \
+           file://0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
            file://g++.conf \
            file://linux.conf \
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
2.3.1


