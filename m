Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC4660846
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 19:13:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2013 12:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,947,1367996400"; d="scan'208";a="391470077"
Received: from unknown (HELO [10.255.15.65]) ([10.255.15.65])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2013 12:13:03 -0700
Message-ID: <521905BF.4010908@linux.intel.com>
Date: Sat, 24 Aug 2013 12:13:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Eric Nelson <eric.nelson@boundarydevices.com>
References: <1377362952-29061-1-git-send-email-eric.nelson@boundarydevices.com>
In-Reply-To: <1377362952-29061-1-git-send-email-eric.nelson@boundarydevices.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipes-qt: add fix for QWSLock on qt4e
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
X-List-Received-Date: Sat, 24 Aug 2013 19:13:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2013 09:49 AM, Eric Nelson wrote:
> This patch adds a patch for Qt-Embedded to only
> destroy semaphores in the process which created
> them.
>
> Original patch by Neil Jerram for the OpenMoko project:
> 	http://lists.openmoko.org/pipermail/community/2012-November/067806.html
>
> See also Bug 31254:
> https://bugreports.qt-project.org/browse/QTBUG-31254
>
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
Besides this, we need an Upstream-Status: Tag, this is either a Backport 
or Submitted maybe?

Sau!

> ---
>   meta/recipes-qt/qt4/qt4-4.8.5.inc                  |  1 +
>   ...-Only-destroy-semaphores-in-process-owner.patch | 77 ++++++++++++++++++++++
>   2 files changed, 78 insertions(+)
>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch
>
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
> index 95a14f3..be16bff 100644
> --- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
> +++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
> @@ -24,6 +24,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
>              file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
>              file://0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
>              file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
> +           file://0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch \
>              file://g++.conf \
>              file://linux.conf \
>              "
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch
> new file mode 100644
> index 0000000..d67a746
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt4-4.8.5/0028-QWSLock-Only-destroy-semaphores-in-process-owner.patch
> @@ -0,0 +1,77 @@
> +From 9af565935d16ecf8a8c04b5ea850ddb34a7c1294 Mon Sep 17 00:00:00 2001
> +From: Eric Nelson <eric.nelson@boundarydevices.com>
> +Date: Mon, 12 Aug 2013 11:54:05 -0700
> +Subject: [PATCH] QWSLock: Only destroy semaphores in process owner
> +
> +This fixes the case when QT_POSIX_IPC is not defined.
> +
> +Original patch by Neil Jerram for the OpenMoko project:
> +	http://lists.openmoko.org/pipermail/community/2012-November/067806.html
> +
> +See also Bug 31254:
> +	https://bugreports.qt-project.org/browse/QTBUG-31254
> +
> +Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
> +---
> + src/gui/embedded/qwslock.cpp | 13 +++++++++----
> + src/gui/embedded/qwslock_p.h |  2 +-
> + 2 files changed, 10 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/gui/embedded/qwslock.cpp b/src/gui/embedded/qwslock.cpp
> +index 3f8f306..cd6a48d 100644
> +--- a/src/gui/embedded/qwslock.cpp
> ++++ b/src/gui/embedded/qwslock.cpp
> +@@ -83,9 +83,12 @@ QWSLock::QWSLock(int id) : semId(id)
> +     QWSSignalHandler::instance()->addWSLock(this);
> + #endif
> +
> ++    owned = false;
> ++
> + #ifndef QT_POSIX_IPC
> +     if (semId == -1) {
> +         semId = semget(IPC_PRIVATE, 3, IPC_CREAT | 0666);
> ++        owned = true;
> +         if (semId == -1) {
> +             perror("QWSLock::QWSLock");
> +             qFatal("Unable to create semaphore");
> +@@ -100,7 +103,6 @@ QWSLock::QWSLock(int id) : semId(id)
> +     }
> + #else
> +     sems[0] = sems[1] = sems[2] = SEM_FAILED;
> +-    owned = false;
> +
> +     if (semId == -1) {
> +         // ### generate really unique IDs
> +@@ -134,9 +136,12 @@ QWSLock::~QWSLock()
> +
> +     if (semId != -1) {
> + #ifndef QT_POSIX_IPC
> +-        qt_semun semval;
> +-        semval.val = 0;
> +-        semctl(semId, 0, IPC_RMID, semval);
> ++
> ++        if (owned) {
> ++            qt_semun semval;
> ++            semval.val = 0;
> ++            semctl(semId, 0, IPC_RMID, semval);
> ++        }
> +         semId = -1;
> + #else
> +         // emulate the SEM_UNDO behavior for the BackingStore lock
> +diff --git a/src/gui/embedded/qwslock_p.h b/src/gui/embedded/qwslock_p.h
> +index ead7b89..d16b3d5 100644
> +--- a/src/gui/embedded/qwslock_p.h
> ++++ b/src/gui/embedded/qwslock_p.h
> +@@ -86,8 +86,8 @@ private:
> +     int lockCount[2];
> + #ifdef QT_POSIX_IPC
> +     sem_t *sems[3];
> +-    bool owned;
> + #endif
> ++    bool owned;
> + };
> +
> + QT_END_NAMESPACE
> +--
> +1.8.1.2
> +
>

