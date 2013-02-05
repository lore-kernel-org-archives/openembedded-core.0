Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U2jNX-0006xF-9o
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 15:20:17 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 4410E77C4CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 15:04:18 +0100 (CET)
Received: from e6520eb.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id C11C64B01A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 15:04:13 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 15:04:12 +0100
Message-Id: <1360073052-15273-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH] qt4: fix CVE-2013-0254
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 14:20:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

fix "POSIX shared memory segments created world-writeable"

more details :
http://lists.qt-project.org/pipermail/announce/2013-February/000023.html

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |   1 +
 ...ange-all-shmget-calls-to-user-only-memory.patch | 147 +++++++++++++++=
++++++
 meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb          |   2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb          |   2 +-
 4 files changed, 150 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0024-Change-all-shmget-=
calls-to-user-only-memory.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.4.inc b/meta/recipes-qt/qt4/qt4-=
4.8.4.inc
index 0bc1062..3f0f003 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.4.inc
@@ -23,6 +23,7 @@ SRC_URI =3D "http://releases.qt-project.org/qt4/source/=
qt-everywhere-opensource-sr
            file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
            file://0022-ssl-certificates-blacklist-mis-issued-turktrust-c=
ertificates.patch \
            file://0023-qtnetwork-blacklist-two-more-certificates.patch \
+           file://0024-Change-all-shmget-calls-to-user-only-memory.patch=
 \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0024-Change-all-shmget-calls-t=
o-user-only-memory.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0024-Change-all-=
shmget-calls-to-user-only-memory.patch
new file mode 100644
index 0000000..6c796a3
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0024-Change-all-shmget-calls-to-user-=
only-memory.patch
@@ -0,0 +1,147 @@
+From 20b26bdb3dd5e46b01b9a7e1ce8342074df3c89c Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Sat, 22 Dec 2012 08:32:12 -0800
+Subject: [PATCH] Change all shmget calls to user-only memory
+
+Drop the read and write permissions for group and other users in the
+system.
+
+Change-Id: I8fc753f09126651af3fb82df3049050f0b14e876
+(cherry-picked from Qt 5 commit 856f209fb63ae336bfb389a12d2a75fa886dc1c5=
)
+Reviewed-by: Richard J. Moore <rich@kde.org>
+
+Upstream-Status: Accepted http://qt.gitorious.org/qt/qt/commit/20b26bdb3=
dd5e46b01b9a7e1ce8342074df3c89c
+---
+ src/corelib/kernel/qsharedmemory_unix.cpp          |    6 +++---
+ src/corelib/kernel/qsystemsemaphore_unix.cpp       |    4 ++--
+ src/gui/image/qnativeimage.cpp                     |    2 +-
+ src/gui/image/qpixmap_x11.cpp                      |    2 +-
+ src/plugins/platforms/xcb/qxcbwindowsurface.cpp    |    2 +-
+ src/plugins/platforms/xlib/qxlibwindowsurface.cpp  |    2 +-
+ .../auto/qtipc/qsharedmemory/tst_qsharedmemory.cpp |    2 +-
+ tools/qvfb/qvfbshmem.cpp                           |    4 ++--
+ 8 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/src/corelib/kernel/qsharedmemory_unix.cpp b/src/corelib/ker=
nel/qsharedmemory_unix.cpp
+index 20d76e3..4cf3acf 100644
+--- a/src/corelib/kernel/qsharedmemory_unix.cpp
++++ b/src/corelib/kernel/qsharedmemory_unix.cpp
+@@ -238,7 +238,7 @@ bool QSharedMemoryPrivate::create(int size)
+     }
+=20
+     // create
+-    if (-1 =3D=3D shmget(unix_key, size, 0666 | IPC_CREAT | IPC_EXCL)) =
{
++    if (-1 =3D=3D shmget(unix_key, size, 0600 | IPC_CREAT | IPC_EXCL)) =
{
+         QString function =3D QLatin1String("QSharedMemory::create");
+         switch (errno) {
+         case EINVAL:
+@@ -293,7 +293,7 @@ bool QSharedMemoryPrivate::attach(QSharedMemory::Acc=
essMode mode)
+ {
+ #ifndef QT_POSIX_IPC
+     // grab the shared memory segment id
+-    int id =3D shmget(unix_key, 0, (mode =3D=3D QSharedMemory::ReadOnly=
 ? 0444 : 0660));
++    int id =3D shmget(unix_key, 0, (mode =3D=3D QSharedMemory::ReadOnly=
 ? 0400 : 0600));
+     if (-1 =3D=3D id) {
+         setErrorString(QLatin1String("QSharedMemory::attach (shmget)"))=
;
+         return false;
+@@ -381,7 +381,7 @@ bool QSharedMemoryPrivate::detach()
+     size =3D 0;
+=20
+     // Get the number of current attachments
+-    int id =3D shmget(unix_key, 0, 0444);
++    int id =3D shmget(unix_key, 0, 0400);
+     cleanHandle();
+=20
+     struct shmid_ds shmid_ds;
+diff --git a/src/corelib/kernel/qsystemsemaphore_unix.cpp b/src/corelib/=
kernel/qsystemsemaphore_unix.cpp
+index fad9acc..e77456b 100644
+--- a/src/corelib/kernel/qsystemsemaphore_unix.cpp
++++ b/src/corelib/kernel/qsystemsemaphore_unix.cpp
+@@ -153,10 +153,10 @@ key_t QSystemSemaphorePrivate::handle(QSystemSemap=
hore::AccessMode mode)
+     }
+=20
+     // Get semaphore
+-    semaphore =3D semget(unix_key, 1, 0666 | IPC_CREAT | IPC_EXCL);
++    semaphore =3D semget(unix_key, 1, 0600 | IPC_CREAT | IPC_EXCL);
+     if (-1 =3D=3D semaphore) {
+         if (errno =3D=3D EEXIST)
+-            semaphore =3D semget(unix_key, 1, 0666 | IPC_CREAT);
++            semaphore =3D semget(unix_key, 1, 0600 | IPC_CREAT);
+         if (-1 =3D=3D semaphore) {
+             setErrorString(QLatin1String("QSystemSemaphore::handle"));
+             cleanHandle();
+diff --git a/src/gui/image/qnativeimage.cpp b/src/gui/image/qnativeimage=
.cpp
+index 9654afe..fef38c5 100644
+--- a/src/gui/image/qnativeimage.cpp
++++ b/src/gui/image/qnativeimage.cpp
+@@ -176,7 +176,7 @@ QNativeImage::QNativeImage(int width, int height, QI=
mage::Format format,bool /*
+=20
+     bool ok;
+     xshminfo.shmid =3D shmget(IPC_PRIVATE, xshmimg->bytes_per_line * xs=
hmimg->height,
+-                            IPC_CREAT | 0777);
++                            IPC_CREAT | 0700);
+     ok =3D xshminfo.shmid !=3D -1;
+     if (ok) {
+         xshmimg->data =3D (char*)shmat(xshminfo.shmid, 0, 0);
+diff --git a/src/gui/image/qpixmap_x11.cpp b/src/gui/image/qpixmap_x11.c=
pp
+index 280d8bd..88c9b7b 100644
+--- a/src/gui/image/qpixmap_x11.cpp
++++ b/src/gui/image/qpixmap_x11.cpp
+@@ -193,7 +193,7 @@ static bool qt_create_mitshm_buffer(const QPaintDevi=
ce* dev, int w, int h)
+     bool ok;
+     xshminfo.shmid =3D shmget(IPC_PRIVATE,
+                              xshmimg->bytes_per_line * xshmimg->height,
+-                             IPC_CREAT | 0777);
++                             IPC_CREAT | 0700);
+     ok =3D xshminfo.shmid !=3D -1;
+     if (ok) {
+         xshmimg->data =3D (char*)shmat(xshminfo.shmid, 0, 0);
+diff --git a/src/plugins/platforms/xcb/qxcbwindowsurface.cpp b/src/plugi=
ns/platforms/xcb/qxcbwindowsurface.cpp
+index b6a42d8..0d56821 100644
+--- a/src/plugins/platforms/xcb/qxcbwindowsurface.cpp
++++ b/src/plugins/platforms/xcb/qxcbwindowsurface.cpp
+@@ -98,7 +98,7 @@ QXcbShmImage::QXcbShmImage(QXcbScreen *screen, const Q=
Size &size, uint depth, QI
+                                           0);
+=20
+     m_shm_info.shmid =3D shmget (IPC_PRIVATE,
+-          m_xcb_image->stride * m_xcb_image->height, IPC_CREAT|0777);
++          m_xcb_image->stride * m_xcb_image->height, IPC_CREAT|0600);
+=20
+     m_shm_info.shmaddr =3D m_xcb_image->data =3D (quint8 *)shmat (m_shm=
_info.shmid, 0, 0);
+     m_shm_info.shmseg =3D xcb_generate_id(xcb_connection());
+diff --git a/src/plugins/platforms/xlib/qxlibwindowsurface.cpp b/src/plu=
gins/platforms/xlib/qxlibwindowsurface.cpp
+index bf003eb..46a2f97 100644
+--- a/src/plugins/platforms/xlib/qxlibwindowsurface.cpp
++++ b/src/plugins/platforms/xlib/qxlibwindowsurface.cpp
+@@ -99,7 +99,7 @@ void QXlibWindowSurface::resizeShmImage(int width, int=
 height)
+=20
+=20
+     image_info->shminfo.shmid =3D shmget (IPC_PRIVATE,
+-          image->bytes_per_line * image->height, IPC_CREAT|0777);
++          image->bytes_per_line * image->height, IPC_CREAT|0700);
+=20
+     image_info->shminfo.shmaddr =3D image->data =3D (char*)shmat (image=
_info->shminfo.shmid, 0, 0);
+     image_info->shminfo.readOnly =3D False;
+diff --git a/tools/qvfb/qvfbshmem.cpp b/tools/qvfb/qvfbshmem.cpp
+index 7f9671f..84b6ebe 100644
+--- a/tools/qvfb/qvfbshmem.cpp
++++ b/tools/qvfb/qvfbshmem.cpp
+@@ -176,13 +176,13 @@ QShMemViewProtocol::QShMemViewProtocol(int display=
id, const QSize &s,
+     uint data_offset_value =3D sizeof(QVFbHeader);
+=20
+     int dataSize =3D bpl * h + data_offset_value;
+-    shmId =3D shmget(key, dataSize, IPC_CREAT | 0666);
++    shmId =3D shmget(key, dataSize, IPC_CREAT | 0600);
+     if (shmId !=3D -1)
+ 	data =3D (unsigned char *)shmat(shmId, 0, 0);
+     else {
+ 	struct shmid_ds shm;
+ 	shmctl(shmId, IPC_RMID, &shm);
+-	shmId =3D shmget(key, dataSize, IPC_CREAT | 0666);
++    shmId =3D shmget(key, dataSize, IPC_CREAT | 0600);
+ 	if (shmId =3D=3D -1) {
+             perror("QShMemViewProtocol::QShMemViewProtocol");
+             qFatal("Cannot get shared memory 0x%08x", key);
+--=20
+1.7.1
+
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb b/meta/recipes-qt/=
qt4/qt4-embedded_4.8.4.bb
index 6024192..286da95 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
@@ -1,7 +1,7 @@
 require qt4-${PV}.inc
 require qt4-embedded.inc
=20
-PR =3D "${INC_PR}.2"
+PR =3D "${INC_PR}.3"
=20
 QT_CONFIG_FLAGS_append_arm =3D "${@bb.utils.contains("TUNE_FEATURES", "n=
eon", "", " -no-neon" ,d)}"
=20
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb b/meta/recipes-qt/=
qt4/qt4-x11-free_4.8.4.bb
index 7de6a82..e5db30d 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt4-${PV}.inc
=20
-PR =3D "${INC_PR}.2"
+PR =3D "${INC_PR}.3"
=20
 QT_CONFIG_FLAGS_append_arm =3D "${@bb.utils.contains("TUNE_FEATURES", "n=
eon", "", " -no-neon" ,d)}"
=20
--=20
1.7.11.7



