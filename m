Return-Path: <pjtexier@koncepto.io>
X-Greylist: delayed 506 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Feb 2020 21:34:34 UTC
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB9460FA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 21:34:34 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1001-35.w90-120.abo.wanadoo.fr
	[90.120.192.35]) by koncepto.io (Postfix) with ESMTPSA id 3D1DF60022;
	Mon, 10 Feb 2020 22:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1581369964;
	bh=qbGmIizEK6grPVyn7khRt7wVN5F8ZXhiZfUKVnwtEDU=;
	h=From:To:Cc:Subject:Date:From;
	b=oLlNw29bt28dF8hxPwFTBVVOKu16gBeWkQqOeLqXz2oG0E6ZshhNkXVf2j5tbF2bl
	TaOiGhQpXkjXsgN81W4B3sJkDA/xp5olcY/0qZ3VTHnNw4DTu3e+ipXmcsysUBUOvR
	q/z1A6LTj9W3FqCt73TQG7Bn+eiFK7UByIL59ZHzXKtEuY9bh5LT7ReYfUvbsUMk6Y
	KpojqnGNseM0fpJ5zbkbV2OFuhe0OTi4HypoM52AEMeyvWdBW/HdK0UqJEENl/DL5/
	vROurEU+cCy5dAmxtk5V1R/OUFAqpbYkaIDsE960KIJXK8lOuJWOpSDUmqrOdfxgVK
	ZfVcjGoCACS+w==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2020 22:25:59 +0100
Message-Id: <1581369959-17175-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] mtdev: upgrade 1.1.5 -> 1.1.6
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
X-List-Received-Date: Mon, 10 Feb 2020 21:34:34 -0000

Also remove patch which have been merged upstream

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...-for-64bit-time_t-for-32bit-architectures.patch | 77 ----------------------
 .../wayland/{mtdev_1.1.5.bb => mtdev_1.1.6.bb}     |  8 +--
 2 files changed, 3 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/mtdev/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
 rename meta/recipes-graphics/wayland/{mtdev_1.1.5.bb => mtdev_1.1.6.bb} (65%)

diff --git a/meta/recipes-graphics/wayland/mtdev/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch b/meta/recipes-graphics/wayland/mtdev/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
deleted file mode 100644
index a0cebe5..0000000
--- a/meta/recipes-graphics/wayland/mtdev/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From af75e8ee3d12a493b758421b2feed0351fdcbbf0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Nov 2019 13:44:32 -0800
-Subject: [PATCH] adjust for 64bit time_t for 32bit architectures
-
-libc that has support for 32 bit applications to use 64 bit
-time_t supplies __USE_TIME_BITS64 define [1]
-
-[1] https://sourceware.org/glibc/wiki/Y2038ProofnessDesign
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/core.c        |  8 +++++++-
- test/mtdev-test.c | 10 ++++++++--
- 2 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/src/core.c b/src/core.c
-index 87ef420..0d91c0b 100644
---- a/src/core.c
-+++ b/src/core.c
-@@ -31,6 +31,11 @@
- #include "evbuf.h"
- #include "match.h"
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- static inline int istouch(const struct mtdev_slot *data,
- 			  const struct mtdev *dev)
- {
-@@ -251,7 +256,8 @@ static void push_slot_changes(struct mtdev_state *state,
- 			count++;
- 	if (!count)
- 		return;
--	ev.time = syn->time;
-+	ev.input_event_sec = syn->input_event_sec;
-+	ev.input_event_usec = syn->input_event_usec;
- 	ev.type = EV_ABS;
- 	ev.code = ABS_MT_SLOT;
- 	ev.value = slot;
-diff --git a/test/mtdev-test.c b/test/mtdev-test.c
-index 1b3e4f2..773f86a 100644
---- a/test/mtdev-test.c
-+++ b/test/mtdev-test.c
-@@ -30,9 +30,15 @@
- #include <stdio.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <stdint.h>
-+
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
- 
- /* year-proof millisecond event time */
--typedef __u64 mstime_t;
-+typedef uint64_t mstime_t;
- 
- static int use_event(const struct input_event *ev)
- {
-@@ -47,7 +53,7 @@ static void print_event(const struct input_event *ev)
- {
- 	static const mstime_t ms = 1000;
- 	static int slot;
--	mstime_t evtime = ev->time.tv_usec / ms + ev->time.tv_sec * ms;
-+	mstime_t evtime = ev->input_event_usec / ms + ev->input_event_sec * ms;
- 	if (ev->type == EV_ABS && ev->code == ABS_MT_SLOT)
- 		slot = ev->value;
- 	fprintf(stderr, "%012llx %02d %01d %04x %d\n",
--- 
-2.24.0
-
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.5.bb b/meta/recipes-graphics/wayland/mtdev_1.1.6.bb
similarity index 65%
rename from meta/recipes-graphics/wayland/mtdev_1.1.5.bb
rename to meta/recipes-graphics/wayland/mtdev_1.1.6.bb
index aa8bb69..7c1cb5e 100644
--- a/meta/recipes-graphics/wayland/mtdev_1.1.5.bb
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.6.bb
@@ -11,10 +11,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
 
-SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2 \
-           file://0001-adjust-for-64bit-time_t-for-32bit-architectures.patch \
-"
-SRC_URI[md5sum] = "52c9610b6002f71d1642dc1a1cca5ec1"
-SRC_URI[sha256sum] = "6677d5708a7948840de734d8b4675d5980d4561171c5a8e89e54adf7a13eba7f"
+SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "bf8ef2482e84a00b5db8fbd3ce00e249"
+SRC_URI[sha256sum] = "15d7b28da8ac71d8bc8c9287c2045fd174267bc740bec10cfda332dc1204e0e0"
 
 inherit autotools pkgconfig
-- 
2.7.4


