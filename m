Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob10.myregisteredsite.com
	(atl4mhob10.myregisteredsite.com [209.17.115.48])
	by mail.openembedded.org (Postfix) with ESMTP id 87A7172843
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 10:36:58 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob10.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t06Aavj8027427 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jan 2015 05:36:57 -0500
Received: (qmail 6721 invoked by uid 0); 6 Jan 2015 10:36:57 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 6 Jan 2015 10:36:57 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 11:36:51 +0100
Message-Id: <1420540611-9110-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2] qt4: Fix QT4 applications spamming "QWSLock::down(): Invalid argument"
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
X-List-Received-Date: Tue, 06 Jan 2015 10:37:07 -0000

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
v2: The actual patch file was missing in the commit, added it.

 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |    1 +
 .../Fix-QWSLock-invalid-argument-logs.patch        |   94 ++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/Fix-QWSLock-invalid-argument-logs.patch

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
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/Fix-QWSLock-invalid-argument-logs.patch b/meta/recipes-qt/qt4/qt4-4.8.6/Fix-QWSLock-invalid-argument-logs.patch
new file mode 100644
index 0000000..8832c6c
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/Fix-QWSLock-invalid-argument-logs.patch
@@ -0,0 +1,94 @@
+From 52c34001bad85c3032618070b1d6b2a3c6880715 Mon Sep 17 00:00:00 2001
+From: Neil Jerram <n...@ossau.homelinux.net>
+Date: Thu, 8 Nov 2012 08:18:32 +0000
+Subject: [PATCH] Fix QWSLock "invalid argument" logs
+
+There was no known actual problem associated with these logs, but they
+were spamming the log, so I thought it worth trying to understand and
+fix them.
+
+The confusion is that there are two different ways of creating QWSLock
+objects.  "QWSLock()" creates an object that creates a new set of
+semaphores, whereas "QWSLock(id)" creates an object that aliases the
+existing set of semaphores with ID id.  What seems to happen is that
+each application creates a semaphore set scoped to that
+application (QWSDisplay::Data::clientLock in qapplication_qws.cpp),
+then this semaphore set is passed by complex means to
+places (QWSClientPrivate and QWSMemorySurface) that use the semaphores
+for a short period and then delete their QWSLock objects.
+
+The problem was that the QWSLock destructor always destroyed the
+semaphore set, even when that QWSLock hadn't create the semaphores
+itself, hence making the semaphores invalid for other QWSLock objects
+still referencing the same set.
+
+Clearly a QWSLock object shouldn't destroy the semaphore set if it
+didn't create it itself, and that is confirmed by the fact that one of
+the implementations inside QWSLock already implements this logic, with
+the 'owned' flag.  The fix is to implement this for the #ifndef
+QT_POSIX_IPC case - which is what is used in QtMoko - just as is
+already implemented for the #ifdef QT_POSIX_IPC case.
+
+Modified by Mike Looijmans to remove the commented-out debug statements.
+
+---
+
+diff --git a/src/gui/embedded/qwslock.cpp b/src/gui/embedded/qwslock.cpp
+index 9914a24..1055785 100644
+--- a/src/gui/embedded/qwslock.cpp
++++ b/src/gui/embedded/qwslock.cpp
+@@ -83,9 +83,13 @@ QWSLock::QWSLock(int id) : semId(id)
+     QWSSignalHandler::instance()->addWSLock(this);
+ #endif
+ 
++    owned = false;
++
+ #ifndef QT_POSIX_IPC
+     if (semId == -1) {
+         semId = semget(IPC_PRIVATE, 3, IPC_CREAT | 0666);
++        owned = true;
++	//qDebug("QWSLock::QWSLock(): %p, %d", this, (int)semId);
+         if (semId == -1) {
+             perror("QWSLock::QWSLock");
+             qFatal("Unable to create semaphore");
+@@ -100,7 +104,6 @@ QWSLock::QWSLock(int id) : semId(id)
+     }
+ #else
+     sems[0] = sems[1] = sems[2] = SEM_FAILED;
+-    owned = false;
+ 
+     if (semId == -1) {
+         // ### generate really unique IDs
+@@ -134,9 +137,12 @@ QWSLock::~QWSLock()
+ 
+     if (semId != -1) {
+ #ifndef QT_POSIX_IPC
+-        qt_semun semval;
+-        semval.val = 0;
+-        semctl(semId, 0, IPC_RMID, semval);
++	if (owned) {
++	    qt_semun semval;
++	    semval.val = 0;
++	    semctl(semId, 0, IPC_RMID, semval);
++	}
++	//qDebug("QWSLock::~QWSLock(): %p, %d", this, (int)semId);
+         semId = -1;
+ #else
+         // emulate the SEM_UNDO behavior for the BackingStore lock
+diff --git a/src/gui/embedded/qwslock_p.h b/src/gui/embedded/qwslock_p.h
+index d324e4f..d867d20 100644
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
+ 
+-- 
+1.7.10.4
-- 
1.7.9.5


