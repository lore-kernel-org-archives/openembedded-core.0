Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0216A441
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 08:45:11 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id bb19so2729504pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 00:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4SKIDH0sqGTuFaZn4M9zHIxOiiBf7XTfqFozQDpEtvE=;
	b=tcQu6ml8zDcn4lhqsegvm5F6iTjS666l+4CntOgzY9WpPY+ES/6HzLAqqNp7JxVzHc
	3vtE4K4YlAxZhWfY5IKFit6fKXvBQfNP/3cd022hB2TC78Ej9+Tnc6UoV9trjzwdmwlG
	aXf82tup9a7tkHDxmP21SP5wvOtU5GT4wBZ/qd4eBA4inKXP04WD6acHsnhz6aoMYWj2
	mHeTMCexQPpXXNGwdxn9qRyJp9Me2KLoyTujTAH6BD+Ox0sfjInKoVZ7XzxMDJs3QoLn
	X2Nvy/qwwIpbNbMcOOtNJDtV6eBdHU5AdxrCtIKf6uZtuwGECztfB192pYScU8Ib9W3z
	vtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4SKIDH0sqGTuFaZn4M9zHIxOiiBf7XTfqFozQDpEtvE=;
	b=N/Zu6lfupxiowm7xha7+pVtoRKjdW1jjTuIwOoFQhclCnzIvZU4IeMPM1Da6u7ytCc
	QteWNPBYNs3ZUJQTT9P/KBsPi0SLKHxaPGmFu9SGCCSz1OTZJtFMbdPSOlmoiAfEL4h2
	CQiyQ2Q6FublsWos5ZlsGtAkoMDSnUat9q7q8cDZFZsuMir1AK3xUg2gVxjPTt8NOw6Q
	ONFofdaKboo7H8PEwheq59HDG6mWjQW2BwCl18WdgKzhznbOClzC2eUySl4B3jm/Agxh
	f4rZ/+COWN+H0jEhIVCQGHjx6RpJnMEyUuUSJ5JIL0yeRENZUSHr3G9GW8DOZJGINzKU
	MDAA==
X-Gm-Message-State: APjAAAVVzMFufJXOP82bOzVJ+lDpQ7DuX2odyYS9swG3N2aSVP2n8xBx
	HEobe5bpcYmH41I0oIg25BjyprhK/6A=
X-Google-Smtp-Source: APXvYqxInY6Et1WTh9WXky/hO2QujEFJNxvJO+/fbOK3JPi1UyYURuuXarZfkHmSnxBfF3gk3nRlYw==
X-Received: by 2002:a17:90a:eb0f:: with SMTP id
	j15mr37783224pjz.97.1574671511934; 
	Mon, 25 Nov 2019 00:45:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	136sm7472257pfb.49.2019.11.25.00.45.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 00:45:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 00:44:49 -0800
Message-Id: <20191125084452.1515325-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH 1/4] mtdev: Fix build when using 64bit time_t on 32bit machines
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
X-List-Received-Date: Mon, 25 Nov 2019 08:45:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...64bit-time_t-for-32bit-architectures.patch | 77 +++++++++++++++++++
 meta/recipes-graphics/wayland/mtdev_1.1.5.bb  |  4 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/mtdev/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch

diff --git a/meta/recipes-graphics/wayland/mtdev/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch b/meta/recipes-graphics/wayland/mtdev/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
new file mode 100644
index 0000000000..a0cebe5283
--- /dev/null
+++ b/meta/recipes-graphics/wayland/mtdev/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
@@ -0,0 +1,77 @@
+From af75e8ee3d12a493b758421b2feed0351fdcbbf0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Nov 2019 13:44:32 -0800
+Subject: [PATCH] adjust for 64bit time_t for 32bit architectures
+
+libc that has support for 32 bit applications to use 64 bit
+time_t supplies __USE_TIME_BITS64 define [1]
+
+[1] https://sourceware.org/glibc/wiki/Y2038ProofnessDesign
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/core.c        |  8 +++++++-
+ test/mtdev-test.c | 10 ++++++++--
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/src/core.c b/src/core.c
+index 87ef420..0d91c0b 100644
+--- a/src/core.c
++++ b/src/core.c
+@@ -31,6 +31,11 @@
+ #include "evbuf.h"
+ #include "match.h"
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ static inline int istouch(const struct mtdev_slot *data,
+ 			  const struct mtdev *dev)
+ {
+@@ -251,7 +256,8 @@ static void push_slot_changes(struct mtdev_state *state,
+ 			count++;
+ 	if (!count)
+ 		return;
+-	ev.time = syn->time;
++	ev.input_event_sec = syn->input_event_sec;
++	ev.input_event_usec = syn->input_event_usec;
+ 	ev.type = EV_ABS;
+ 	ev.code = ABS_MT_SLOT;
+ 	ev.value = slot;
+diff --git a/test/mtdev-test.c b/test/mtdev-test.c
+index 1b3e4f2..773f86a 100644
+--- a/test/mtdev-test.c
++++ b/test/mtdev-test.c
+@@ -30,9 +30,15 @@
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <stdint.h>
++
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
+ 
+ /* year-proof millisecond event time */
+-typedef __u64 mstime_t;
++typedef uint64_t mstime_t;
+ 
+ static int use_event(const struct input_event *ev)
+ {
+@@ -47,7 +53,7 @@ static void print_event(const struct input_event *ev)
+ {
+ 	static const mstime_t ms = 1000;
+ 	static int slot;
+-	mstime_t evtime = ev->time.tv_usec / ms + ev->time.tv_sec * ms;
++	mstime_t evtime = ev->input_event_usec / ms + ev->input_event_sec * ms;
+ 	if (ev->type == EV_ABS && ev->code == ABS_MT_SLOT)
+ 		slot = ev->value;
+ 	fprintf(stderr, "%012llx %02d %01d %04x %d\n",
+-- 
+2.24.0
+
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.5.bb b/meta/recipes-graphics/wayland/mtdev_1.1.5.bb
index ccd0ebbfce..aa8bb69966 100644
--- a/meta/recipes-graphics/wayland/mtdev_1.1.5.bb
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.5.bb
@@ -11,7 +11,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
 
-SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2"
+SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2 \
+           file://0001-adjust-for-64bit-time_t-for-32bit-architectures.patch \
+"
 SRC_URI[md5sum] = "52c9610b6002f71d1642dc1a1cca5ec1"
 SRC_URI[sha256sum] = "6677d5708a7948840de734d8b4675d5980d4561171c5a8e89e54adf7a13eba7f"
 
-- 
2.24.0


