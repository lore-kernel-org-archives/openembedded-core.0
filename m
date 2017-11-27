Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 7674B78347
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:49:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3725820CF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:49 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Mon, 27 Nov 2017 11:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=12QiBAZSvlR17GxxbauKDNR6dp+xDnSSb2QbiO1mwRs=; b=YqoHVYcC
	evryLacPDs6HK98dxeMJxRK9nl5ktn3E6HWvrwe+a0DS4G5ayvHEnmtn6E9JSGmJ
	W0+YEwxAdawsV45OiQZ+vYfnvtE+z/ZIakCUejbvRR+Df1K954GeZ7jaw9gIley1
	P+LCDFmiYn2AgEZd8fd0hHkz+lt1zVx6wy8UmzpO38jDPHQyKmkA3QnprEWLlx38
	0Q0fM8Jkw1nrc+dH5haESkSbsRa7gclFW1IhY8DozDpBmU3k9HGfAgNyVEgNqCuk
	oWv9t7XCWDCUkN2ddQ29q7ZzE38N4UVqUTcdMuFcIMXdP4paKCcmQBFRbp9jPN4Y
	e3KOy++C0uIoZA==
X-ME-Sender: <xms:1T8cWiefk0tYDW5BCSHTaCgcUnGYrZ1S-gIX6TFs4bhG5sb8RUt7xQ>
Received: from localhost.localdomain (unknown [192.40.95.17])
	by mail.messagingengine.com (Postfix) with ESMTPA id 985247F813
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:48 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:39:31 +0200
Message-Id: <20171127163934.31597-4-tanuk@iki.fi>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171127163934.31597-1-tanuk@iki.fi>
References: <20171127163934.31597-1-tanuk@iki.fi>
Subject: [PATCH 3/6] alsa-lib: 1.1.4.1 -> 1.1.5
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
X-List-Received-Date: Mon, 27 Nov 2017 16:49:11 -0000

Changes:
http://www.alsa-project.org/main/index.php/Changes_v1.1.4_v1.1.5

Dropped all patches. The poll.h patch is included in the release, and
the wordexp patch is not needed any more, because the wordexp function
is replaced by an internal reimplementation.

It would still be possible to enable the use of wordexp with the
--with-wordexp configure option. The option exists, because the internal
reimplementation covers only part of what wordexp can do, so not using
wordexp can in theory cause regressions. However, it seems that
regressions are quite unlikely in practice. Here's some discussion about
the topic:
http://mailman.alsa-project.org/pipermail/alsa-devel/2017-July/122667.html

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../Check-if-wordexp-function-is-supported.patch   |  51 ------
 .../avoid-including-sys-poll.h-directly.patch      | 183 ---------------------
 .../{alsa-lib_1.1.4.1.bb => alsa-lib_1.1.5.bb}     |   9 +-
 3 files changed, 3 insertions(+), 240 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.4.1.bb => alsa-lib_1.1.5.bb} (77%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch b/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
deleted file mode 100644
index 795e48ab2e..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 3408f8e78776b12f131e433749721602f87e0a70 Mon Sep 17 00:00:00 2001
-From: "Hong H. Pham" <hong.pham@windriver.com>
-Date: Fri, 29 Aug 2014 17:13:55 +0300
-Subject: [PATCH] Check if wordexp function is supported
-
-eglibc could be configured to build without wordexp, so it is not enough
-to check if wordexp.h exists (the header file could be installed, but it's
-possible that the wordexp() function is not supported).  An additional
-check if wordexp() is supported by the system C library is needed.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Hong H. Pham <hong.pham@windriver.com>
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
----
- configure.ac   | 5 ++++-
- src/userfile.c | 2 +-
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9490d39..b08a90a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -295,7 +295,10 @@ fi
- AC_SUBST(ALSA_DEPLIBS)
- 
- dnl Check for headers
--AC_CHECK_HEADERS([wordexp.h endian.h sys/endian.h sys/shm.h])
-+AC_CHECK_HEADERS([wordexp.h endian.h sys/endian.h sys/shm.h],
-+  dnl Make sure wordexp is supported by the C library
-+  AC_CHECK_FUNCS([wordexp])
-+)
- 
- dnl Check for resmgr support...
- AC_MSG_CHECKING(for resmgr support)
-diff --git a/src/userfile.c b/src/userfile.c
-index 72779da..e9d13e6 100644
---- a/src/userfile.c
-+++ b/src/userfile.c
-@@ -32,7 +32,7 @@
-  * stores the first matchine one.  The returned string is strdup'ed.
-  */
- 
--#ifdef HAVE_WORDEXP_H
-+#if (defined(HAVE_WORDEXP_H) && defined(HAVE_WORDEXP))
- #include <wordexp.h>
- #include <assert.h>
- int snd_user_file(const char *file, char **result)
--- 
-2.6.4
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
deleted file mode 100644
index 3d44585939..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-From c2c13cf0c469862cd39b2a69862002331ab7c8cb Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 9 Feb 2016 14:01:18 -0800
-Subject: [PATCH] avoid including <sys/poll.h> directly
-
-Fixes compiler warnings when building with musl libc.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- aserver/aserver.c         | 2 +-
- include/asoundlib-head.h  | 2 +-
- include/asoundlib.h       | 2 +-
- include/local.h           | 2 +-
- src/control/control.c     | 2 +-
- src/control/control_shm.c | 2 +-
- src/pcm/pcm_direct.c      | 2 +-
- src/pcm/pcm_mmap.c        | 2 +-
- src/pcm/pcm_share.c       | 2 +-
- src/pcm/pcm_shm.c         | 2 +-
- src/seq/seq.c             | 2 +-
- src/shmarea.c             | 2 +-
- 12 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/aserver/aserver.c b/aserver/aserver.c
-index ac20706..46f731a 100644
---- a/aserver/aserver.c
-+++ b/aserver/aserver.c
-@@ -20,7 +20,7 @@
- 
- #include <sys/shm.h>
- #include <sys/socket.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/un.h>
- #include <sys/uio.h>
- #include <stdio.h>
-diff --git a/include/asoundlib-head.h b/include/asoundlib-head.h
-index 1ec611e..21e32c6 100644
---- a/include/asoundlib-head.h
-+++ b/include/asoundlib-head.h
-@@ -35,6 +35,6 @@
- #include <string.h>
- #include <fcntl.h>
- #include <assert.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <errno.h>
- #include <stdarg.h>
-diff --git a/include/asoundlib.h b/include/asoundlib.h
-index 3c2766e..a546194 100644
---- a/include/asoundlib.h
-+++ b/include/asoundlib.h
-@@ -35,7 +35,7 @@
- #include <string.h>
- #include <fcntl.h>
- #include <assert.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <errno.h>
- #include <stdarg.h>
- #include <endian.h>
-diff --git a/include/local.h b/include/local.h
-index 317f2e3..6a43a47 100644
---- a/include/local.h
-+++ b/include/local.h
-@@ -47,7 +47,7 @@
- #error Header defining endianness not defined
- #endif
- #include <stdarg.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/types.h>
- #include <errno.h>
- #if defined(__linux__)
-diff --git a/src/control/control.c b/src/control/control.c
-index 6c00b8e..fd0c303 100644
---- a/src/control/control.c
-+++ b/src/control/control.c
-@@ -90,7 +90,7 @@ I/O operations.
- #include <string.h>
- #include <fcntl.h>
- #include <signal.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <stdbool.h>
- #include "control_local.h"
- 
-diff --git a/src/control/control_shm.c b/src/control/control_shm.c
-index bd07d4a..9a2e268 100644
---- a/src/control/control_shm.c
-+++ b/src/control/control_shm.c
-@@ -27,7 +27,7 @@
- #include <fcntl.h>
- #include <sys/shm.h>
- #include <sys/socket.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/un.h>
- #include <sys/uio.h>
- #include <sys/mman.h>
-diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
-index c3925cc..18f1dd5 100644
---- a/src/pcm/pcm_direct.c
-+++ b/src/pcm/pcm_direct.c
-@@ -30,7 +30,7 @@
- #include <grp.h>
- #include <sys/ioctl.h>
- #include <sys/mman.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/shm.h>
- #include <sys/sem.h>
- #include <sys/wait.h>
-diff --git a/src/pcm/pcm_mmap.c b/src/pcm/pcm_mmap.c
-index 1948289..4cf220a 100644
---- a/src/pcm/pcm_mmap.c
-+++ b/src/pcm/pcm_mmap.c
-@@ -22,7 +22,7 @@
- #include <stdio.h>
- #include <malloc.h>
- #include <string.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/mman.h>
- #ifdef HAVE_SYS_SHM_H
- #include <sys/shm.h>
-diff --git a/src/pcm/pcm_share.c b/src/pcm/pcm_share.c
-index 5d8aaf2..21a57fc 100644
---- a/src/pcm/pcm_share.c
-+++ b/src/pcm/pcm_share.c
-@@ -34,7 +34,7 @@
- #include <signal.h>
- #include <math.h>
- #include <sys/socket.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <pthread.h>
- #include "pcm_local.h"
- 
-diff --git a/src/pcm/pcm_shm.c b/src/pcm/pcm_shm.c
-index a815ac6..4ee958c 100644
---- a/src/pcm/pcm_shm.c
-+++ b/src/pcm/pcm_shm.c
-@@ -36,7 +36,7 @@
- #include <sys/ioctl.h>
- #include <sys/shm.h>
- #include <sys/socket.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/un.h>
- #include <sys/mman.h>
- #include <netinet/in.h>
-diff --git a/src/seq/seq.c b/src/seq/seq.c
-index 9279830..d2027cb 100644
---- a/src/seq/seq.c
-+++ b/src/seq/seq.c
-@@ -777,7 +777,7 @@ void event_filter(snd_seq_t *seq, snd_seq_event_t *ev)
- 
- */
- 
--#include <sys/poll.h>
-+#include <poll.h>
- #include "seq_local.h"
- 
- /****************************************************************************
-diff --git a/src/shmarea.c b/src/shmarea.c
-index 9843aa8..eaa71f0 100644
---- a/src/shmarea.c
-+++ b/src/shmarea.c
-@@ -27,7 +27,7 @@
- #include <malloc.h>
- #include <string.h>
- #include <errno.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/mman.h>
- #include <sys/shm.h>
- #include "list.h"
--- 
-2.8.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
similarity index 77%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
index acdeae13f3..c5bf107e5e 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
@@ -8,12 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
-           file://Check-if-wordexp-function-is-supported.patch \
-           file://avoid-including-sys-poll.h-directly.patch \
-"
-SRC_URI[md5sum] = "29fa3e69122d3cf3e8f0e01a0cb1d183"
-SRC_URI[sha256sum] = "91bb870c14d1c7c269213285eeed874fa3d28112077db061a3af8010d0885b76"
+SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2"
+SRC_URI[md5sum] = "a2b465c3a5265d8a57f3ff39c6c4fc29"
+SRC_URI[sha256sum] = "f4f68ad3c6da36b0b5241ac3c798a7a71e0e97d51f972e9f723b3f20a9650ae6"
 
 inherit autotools pkgconfig
 
-- 
2.14.2


