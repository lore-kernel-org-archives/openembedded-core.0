Return-Path: <eric.nelson@boundarydevices.com>
Received: from fed1rmfepo102.cox.net (fed1rmfepo102.cox.net [68.230.241.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1ED61013
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 16:49:13 +0000 (UTC)
Received: from fed1rmimpo110 ([68.230.241.159]) by fed1rmfepo102.cox.net
	(InterMail vM.8.01.05.09 201-2260-151-124-20120717) with ESMTP
	id <20130824164913.XCXJ3896.fed1rmfepo102.cox.net@fed1rmimpo110>
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 12:49:13 -0400
Received: from localhost.localdomain ([98.167.230.131])
	by fed1rmimpo110 with cox
	id GgpD1m00V2ql3AS01gpDMa; Sat, 24 Aug 2013 12:49:13 -0400
X-CT-Class: Clean
X-CT-Score: 0.00
X-CT-RefID: str=0001.0A020202.5218E409.00DD,ss=1,re=0.000,fgs=0
X-CT-Spam: 0
X-Authority-Analysis: v=2.0 cv=KYMMR3kD c=1 sm=1
	a=np+gEjoI14f0/4viqHkTOw==:17 a=2bLghuLI4UkA:10 a=rcTfVT_afHIA:10
	a=R_N1NMmAAAAA:8 a=HPwy993xoGEA:10 a=OCGuPPFrAAAA:8 a=1pLMaboaAAAA:8
	a=Smoysqs_eyLD0UPY1x8A:9 a=uxzo5znrcxgA:10 a=QOiTB_lUNkwA:10
	a=np+gEjoI14f0/4viqHkTOw==:117
X-CM-Score: 0.00
Authentication-Results: cox.net; none
From: Eric Nelson <eric.nelson@boundarydevices.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Aug 2013 09:49:12 -0700
Message-Id: <1377362952-29061-1-git-send-email-eric.nelson@boundarydevices.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] recipes-qt: add fix for QWSLock on qt4e
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
X-List-Received-Date: Sat, 24 Aug 2013 16:49:13 -0000

This patch adds a patch for Qt-Embedded to only
destroy semaphores in the process which created
them.

Original patch by Neil Jerram for the OpenMoko project:
	http://lists.openmoko.org/pipermail/community/2012-November/067806.html

See also Bug 31254:
https://bugreports.qt-project.org/browse/QTBUG-31254

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |  1 +
 ...-Only-destroy-semaphores-in-process-owner.patch | 77 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
index 95a14f3..be16bff 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -24,6 +24,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
            file://0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
+           file://0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch
new file mode 100644
index 0000000..d67a746
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.5/0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch
@@ -0,0 +1,77 @@
+From 9af565935d16ecf8a8c04b5ea850ddb34a7c1294 Mon Sep 17 00:00:00 2001
+From: Eric Nelson <eric.nelson@boundarydevices.com>
+Date: Mon, 12 Aug 2013 11:54:05 -0700
+Subject: [PATCH] QWSLock: Only destroy semaphores in process owner
+
+This fixes the case when QT_POSIX_IPC is not defined.
+
+Original patch by Neil Jerram for the OpenMoko project:
+	http://lists.openmoko.org/pipermail/community/2012-November/067806.html
+
+See also Bug 31254:
+	https://bugreports.qt-project.org/browse/QTBUG-31254
+
+Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
+---
+ src/gui/embedded/qwslock.cpp | 13 +++++++++----
+ src/gui/embedded/qwslock_p.h |  2 +-
+ 2 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/src/gui/embedded/qwslock.cpp b/src/gui/embedded/qwslock.cpp
+index 3f8f306..cd6a48d 100644
+--- a/src/gui/embedded/qwslock.cpp
++++ b/src/gui/embedded/qwslock.cpp
+@@ -83,9 +83,12 @@ QWSLock::QWSLock(int id) : semId(id)
+     QWSSignalHandler::instance()->addWSLock(this);
+ #endif
+ 
++    owned = false;
++
+ #ifndef QT_POSIX_IPC
+     if (semId == -1) {
+         semId = semget(IPC_PRIVATE, 3, IPC_CREAT | 0666);
++        owned = true;
+         if (semId == -1) {
+             perror("QWSLock::QWSLock");
+             qFatal("Unable to create semaphore");
+@@ -100,7 +103,6 @@ QWSLock::QWSLock(int id) : semId(id)
+     }
+ #else
+     sems[0] = sems[1] = sems[2] = SEM_FAILED;
+-    owned = false;
+ 
+     if (semId == -1) {
+         // ### generate really unique IDs
+@@ -134,9 +136,12 @@ QWSLock::~QWSLock()
+ 
+     if (semId != -1) {
+ #ifndef QT_POSIX_IPC
+-        qt_semun semval;
+-        semval.val = 0;
+-        semctl(semId, 0, IPC_RMID, semval);
++
++        if (owned) {
++            qt_semun semval;
++            semval.val = 0;
++            semctl(semId, 0, IPC_RMID, semval);
++        }
+         semId = -1;
+ #else
+         // emulate the SEM_UNDO behavior for the BackingStore lock
+diff --git a/src/gui/embedded/qwslock_p.h b/src/gui/embedded/qwslock_p.h
+index ead7b89..d16b3d5 100644
+--- a/src/gui/embedded/qwslock_p.h
++++ b/src/gui/embedded/qwslock_p.h
+@@ -86,8 +86,8 @@ private:
+     int lockCount[2];
+ #ifdef QT_POSIX_IPC
+     sem_t *sems[3];
+-    bool owned;
+ #endif
++    bool owned;
+ };
+ 
+ QT_END_NAMESPACE
+-- 
+1.8.1.2
+
-- 
1.8.1.2


