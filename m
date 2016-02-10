Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id E9B9162137
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 04:15:14 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id ba1so11313453obb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 20:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=I86yDl1e8/bRwbZqWfoQH0rCZfjeSxzgxnTpSnWv7JQ=;
	b=JRFwoP2Nid/iaI68Mg+P07BRBAA3G9nsXehtxeR7sdQKBhnY48tmKKY/7gK9WZNAzN
	gP5RRVgPK+jG+bCvpQiXRWKtcHDWuySS5bbcDn2crsJYIe/6p19G8d8/4f3RsDee9Okp
	/urIlcxtmY98auKePFAoFcmD9u1wHOQpQqjOqY/hXxL32zxEczAwlxLuXblJpk1sbsZH
	zcaZlk7mXSz/CpTzq4XtrV3lsSYtLTjcmzCs2Ol9qvnc7xCmd1wbBBBaF0gHqdHPrUvd
	LzVsrCB7hlzggKd2fTlDIclnG1Q1e1lB9RW5wpy9qzC0/1YOp+UkSjyVOUa7pC80R4bL
	JP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I86yDl1e8/bRwbZqWfoQH0rCZfjeSxzgxnTpSnWv7JQ=;
	b=XMQ1DscITUnhFoBdPhI0YwVj4Z0Aa8Yt2JjeQySF0mtQNGkjGR6dKdxS/nRkRSYhUL
	BfKPgw0mQiTJe86tl52RbwNHRyrIzRC18zF9v9ftkjI8MpBQGPQ+NS7TZgJJ8LRIvfk9
	jDtXmRuhurfL1b3RlZvynxLaK1ZFyrDKBKtclGH3GWCeRTHs4frXt9c6EjgnTNkNIs9R
	2y9e/uax5+oBU3cOmv5mU7ZRUS5urO+xu49lHDpGjEf85DNg5XlojL1X+3ofj7HEwWun
	Pu/BABip48B2y/7mC8rru2CK4ijvPij33Z7JSoSUX/eYIwEHNPLCPsKmmtjRxRKHVXfj
	hElg==
X-Gm-Message-State: AG10YOTK1jLgwvBYYe/95RZeLAYk70L7NRUaZX42mY8JLoiaYMaFg/3MJFgegSiCp3cFuQ==
X-Received: by 10.60.73.170 with SMTP id m10mr35723318oev.51.1455077715192;
	Tue, 09 Feb 2016 20:15:15 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	e129sm750888oih.17.2016.02.09.20.15.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 20:15:14 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 20:15:09 -0800
Message-Id: <1455077709-2745-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] alsa-lib: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Wed, 10 Feb 2016 04:15:15 -0000

musl libc generates warnings if <sys/poll.h> is included directly.

Although alsa-lib does not build with -Werror enabled, other packages
which include the alsa-lib public header files (ie libasound.h) might.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../avoid-including-sys-poll.h-directly.patch      | 183 +++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb     |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
new file mode 100644
index 0000000..161619b
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
@@ -0,0 +1,183 @@
+From 7dcf46969e85c881c901df4b49309e9091cad16a Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 9 Feb 2016 14:01:18 -0800
+Subject: [PATCH] avoid including <sys/poll.h> directly
+
+Fixes compiler warnings when building with musl libc.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ aserver/aserver.c         | 2 +-
+ include/asoundlib-head.h  | 2 +-
+ include/asoundlib.h       | 2 +-
+ include/local.h           | 2 +-
+ src/control/control.c     | 2 +-
+ src/control/control_shm.c | 2 +-
+ src/pcm/pcm_direct.c      | 2 +-
+ src/pcm/pcm_mmap.c        | 2 +-
+ src/pcm/pcm_share.c       | 2 +-
+ src/pcm/pcm_shm.c         | 2 +-
+ src/seq/seq.c             | 2 +-
+ src/shmarea.c             | 2 +-
+ 12 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/aserver/aserver.c b/aserver/aserver.c
+index 1579da7..ef64248 100644
+--- a/aserver/aserver.c
++++ b/aserver/aserver.c
+@@ -20,7 +20,7 @@
+ 
+ #include <sys/shm.h>
+ #include <sys/socket.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/un.h>
+ #include <sys/uio.h>
+ #include <stdio.h>
+diff --git a/include/asoundlib-head.h b/include/asoundlib-head.h
+index 1ec611e..21e32c6 100644
+--- a/include/asoundlib-head.h
++++ b/include/asoundlib-head.h
+@@ -35,6 +35,6 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <assert.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <errno.h>
+ #include <stdarg.h>
+diff --git a/include/asoundlib.h b/include/asoundlib.h
+index 3c2766e..a546194 100644
+--- a/include/asoundlib.h
++++ b/include/asoundlib.h
+@@ -35,7 +35,7 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <assert.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <errno.h>
+ #include <stdarg.h>
+ #include <endian.h>
+diff --git a/include/local.h b/include/local.h
+index b429f5d..e05898f 100644
+--- a/include/local.h
++++ b/include/local.h
+@@ -47,7 +47,7 @@
+ #error Header defining endianness not defined
+ #endif
+ #include <stdarg.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/types.h>
+ #include <errno.h>
+ #include <linux/types.h>
+diff --git a/src/control/control.c b/src/control/control.c
+index 4a28cf6..071c5db 100644
+--- a/src/control/control.c
++++ b/src/control/control.c
+@@ -48,7 +48,7 @@ and IEC958 structure.
+ #include <string.h>
+ #include <fcntl.h>
+ #include <signal.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include "control_local.h"
+ 
+ /**
+diff --git a/src/control/control_shm.c b/src/control/control_shm.c
+index bd07d4a..9a2e268 100644
+--- a/src/control/control_shm.c
++++ b/src/control/control_shm.c
+@@ -27,7 +27,7 @@
+ #include <fcntl.h>
+ #include <sys/shm.h>
+ #include <sys/socket.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/un.h>
+ #include <sys/uio.h>
+ #include <sys/mman.h>
+diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
+index fd3877c..52ac093 100644
+--- a/src/pcm/pcm_direct.c
++++ b/src/pcm/pcm_direct.c
+@@ -30,7 +30,7 @@
+ #include <grp.h>
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/shm.h>
+ #include <sys/sem.h>
+ #include <sys/wait.h>
+diff --git a/src/pcm/pcm_mmap.c b/src/pcm/pcm_mmap.c
+index 5c4fbe1..2cfa7db 100644
+--- a/src/pcm/pcm_mmap.c
++++ b/src/pcm/pcm_mmap.c
+@@ -22,7 +22,7 @@
+ #include <stdio.h>
+ #include <malloc.h>
+ #include <string.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/mman.h>
+ #ifdef HAVE_SYS_SHM_H
+ #include <sys/shm.h>
+diff --git a/src/pcm/pcm_share.c b/src/pcm/pcm_share.c
+index 5d8aaf2..21a57fc 100644
+--- a/src/pcm/pcm_share.c
++++ b/src/pcm/pcm_share.c
+@@ -34,7 +34,7 @@
+ #include <signal.h>
+ #include <math.h>
+ #include <sys/socket.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <pthread.h>
+ #include "pcm_local.h"
+ 
+diff --git a/src/pcm/pcm_shm.c b/src/pcm/pcm_shm.c
+index a815ac6..4ee958c 100644
+--- a/src/pcm/pcm_shm.c
++++ b/src/pcm/pcm_shm.c
+@@ -36,7 +36,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/shm.h>
+ #include <sys/socket.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/un.h>
+ #include <sys/mman.h>
+ #include <netinet/in.h>
+diff --git a/src/seq/seq.c b/src/seq/seq.c
+index 620ca3f..681cef1 100644
+--- a/src/seq/seq.c
++++ b/src/seq/seq.c
+@@ -777,7 +777,7 @@ void event_filter(snd_seq_t *seq, snd_seq_event_t *ev)
+ 
+ */
+ 
+-#include <sys/poll.h>
++#include <poll.h>
+ #include "seq_local.h"
+ 
+ /****************************************************************************
+diff --git a/src/shmarea.c b/src/shmarea.c
+index 9843aa8..eaa71f0 100644
+--- a/src/shmarea.c
++++ b/src/shmarea.c
+@@ -27,7 +27,7 @@
+ #include <malloc.h>
+ #include <string.h>
+ #include <errno.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/mman.h>
+ #include <sys/shm.h>
+ #include "list.h"
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
index d62c1fc..c0bf9ac 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
@@ -16,6 +16,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
+           file://avoid-including-sys-poll.h-directly.patch \
 "
 SRC_URI[md5sum] = "69515ca73c3c4a212ef45160dea846c1"
 SRC_URI[sha256sum] = "dfde65d11e82b68f82e562ab6228c1fb7c78854345d3c57e2c68a9dd3dae1f15"
-- 
1.9.1


