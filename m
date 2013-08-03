Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1F16A59D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 08:02:38 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id bv13so1445970pdb.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 01:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IcC02iN6UL2Do6mdimL3pbGLr+2AYlDGjTErrUR9A6U=;
	b=o6V7GbAikSRY64C51FJ/EJEQ+iIQ3dh9Qrh/p2s68KWqHeVov0JUD+suJyC8jtvrVO
	5tByRgm3uKoBq7hIbvuERtOL5hkK/JRi2jYvbLJqp/6gdjIVyAAoSx3nqKHfx5q17it7
	wrRYCynsHlWdYay3WBohqSpD1ghomCAF23N3nuPGeL3uD1WJElBfmIF3WMb1oJBTq13S
	2CFRjNqr0QM/oluqgDoQ0+C0Ry0G/ZaewoHgpdkkzwbkVz/sKGfIXJlO0rxPb5Ir0oFi
	hNmWhXhkD585Rt0MmN7TzuRhX4Ou5oxmME6dtcIDTqLSGDycP1/IjU/WzIZ9V3XZKdgy
	7xlw==
X-Received: by 10.66.221.8 with SMTP id qa8mr11846890pac.188.1375516959132;
	Sat, 03 Aug 2013 01:02:39 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	bp12sm15175430pac.1.2013.08.03.01.02.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 01:02:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Aug 2013 17:56:43 +1000
Message-Id: <1375516603-9720-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] qt4: add upstream QTBUG-32534 patch for QHttpMultiPart upload corruption
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
X-List-Received-Date: Sat, 03 Aug 2013 08:02:39 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |  1 +
 ...art-fix-data-corruption-in-readData-metho.patch | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
index d05b174..95a14f3 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -22,6 +22,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
            file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
+           file://0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
            file://g++.conf \
            file://linux.conf \
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
new file mode 100644
index 0000000..c3c002e
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
@@ -0,0 +1,43 @@
+From 1f40ed553e618c3b0511c7db4b4fd26c2d2b65bf Mon Sep 17 00:00:00 2001
+From: Peter Hartmann <phartmann@blackberry.com>
+Date: Thu, 25 Jul 2013 12:05:29 -0400
+Subject: [PATCH] QHttpMultiPart: fix data corruption in readData method
+
+When readData() is called repeatedly, we need to keep track which
+part of the multipart message we are currently reading from.
+Hereby we also need to take the boundary size into account, and not
+only the size of the multipart; otherwise we would skip a not
+completely read part. This would then later lead to advancing the
+read pointer by negative indexes and data loss.
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,61861]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Task-number: QTBUG-32534
+Change-Id: Ibb6dff16adaf4ea67181d23d1d0c8459e33a0ed0
+Reviewed-by: Jonathan Liu <net147@gmail.com>
+Reviewed-by: Shane Kearns <shane.kearns@accenture.com>
+(cherry picked from qtbase/af96c6fed931564c95037539f07e9c8e33c69529)
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+---
+ src/network/access/qhttpmultipart.cpp          |  3 +-
+ tests/auto/qnetworkreply/tst_qnetworkreply.cpp | 44 ++++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/access/qhttpmultipart.cpp b/src/network/access/qhttpmultipart.cpp
+index 635129a..b25e917 100644
+--- a/src/network/access/qhttpmultipart.cpp
++++ b/src/network/access/qhttpmultipart.cpp
+@@ -488,7 +488,8 @@ qint64 QHttpMultiPartIODevice::readData(char *data, qint64 maxSize)
+ 
+     // skip the parts we have already read
+     while (index < multiPart->parts.count() &&
+-           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size())
++           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size()
++           + multiPart->boundary.count() + 6) // 6 == 2 boundary dashes, \r\n after boundary, \r\n after multipart
+         index++;
+ 
+     // read the data
+-- 
+1.8.3.4
+
-- 
1.8.3.4


