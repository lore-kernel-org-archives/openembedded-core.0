Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob15.myregisteredsite.com
	(atl4mhob15.myregisteredsite.com [209.17.115.53])
	by mail.openembedded.org (Postfix) with ESMTP id A4152727B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 10:34:34 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.210])
	by atl4mhob15.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t06AYX72010398 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jan 2015 05:34:33 -0500
Received: (qmail 30322 invoked by uid 0); 6 Jan 2015 10:34:31 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 6 Jan 2015 10:34:31 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 11:34:28 +0100
Message-Id: <1420540468-9062-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] qt4: Fix QT4 applications spamming "QWSLock::down(): Invalid argument"
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
X-List-Received-Date: Tue, 06 Jan 2015 10:34:37 -0000

If you run a QT server application, and a client in a separate process, it will
spam the log with "QWSLock::down(): Invalid argument" messages because of an old
bug in the locking code. There's a patch on the net that fixes it, which I manually
adapted by removing the commented-out debug statements.

We have been using this patch for about half a year without problems, and the QT people
apparently don't care about the bug, hence there's no upstream status. Including this
into OE core will at least save other people the trouble of having to find and apply
it for themselves.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index 074e82d..a2c0688 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -26,6 +26,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0030-aarch64_arm64_qatomic_support.patch \
            file://0031-aarch64_arm64_mkspecs.patch \
            file://0032-aarch64_add_header.patch \
+           file://Fix-QWSLock-invalid-argument-logs.patch \
            file://g++.conf \
            file://linux.conf \
            "
-- 
1.7.9.5


