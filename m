Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id D2ACA6A441
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 08:45:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id bb5so6211784plb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 00:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IcZPckZQUtYgQdseBis3+AX6vRGZxrgGzibbnbsfe4U=;
	b=Hi8tyAlRm/LKT8sayP9MK+a0U5YJ4meASH6qv3Oaaq+EE5FBBrdoS6sKBo05/8p8S2
	32V5weKgjx4tP3GyVwVd1WKUUxmGEPC0mw9gtsGlpZCrpDH8aBTlx9ZsCFgVDonUcsJo
	XKX6MseF7t+8hvbyBW640bQCyNQSFBTAl4Ot29Gv5iGcJxDHdSdbJ/fPTYMEWiKC5dRz
	eNQqDNGpiA716d1YvyX4xRi8UVEWMheC0eOvrTxNMWmIVxZWxZ0Fj/TjcSE8m/6UaR0M
	2DaQsQpYpbwquvL0ST/3+1nbY3TGKr/3Z8LmUY+OSERSYqJ3flANL/PMbJ3rLVp4CjQX
	CXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IcZPckZQUtYgQdseBis3+AX6vRGZxrgGzibbnbsfe4U=;
	b=iq20hha6nUpPrM9gyvoO3ZeP2W87h3FaI7ppI9wGDsHH3kKJoh7Y7RREacm3waLGWo
	zXaOa7rLYhFl+E7QmcP5SJzcoqmj10+PHQ+tPCIU3o4yb2m4J2Gj3u9F1XA2e4xqq4Lp
	3B/a8xAPdOcnqdOcIHUjj+RRD/CarC5rV6cXlzpmICsx71voG1fYs5Ern40/rM0Q96gn
	H75pq4FOdREEs0tPS6+FAzLtgKC10H50QnyHRa/aowzHT+MwJQOe3WTplizPW6R5zEe5
	kfkmKApD78MEi0Mn/JfVMHdl84/pPXJ+6IDoX5HZCMRzLq1W2ywh7rDYM19N9ME2RguZ
	Zt6w==
X-Gm-Message-State: APjAAAUIwaM/Sb4PVMZDYWnMYID8DLzT6O5ivMBR8FUMlcLkd1v1VNhe
	ulZ/xwDKwRO87h0SzL3GyVN2Lfc7dZE=
X-Google-Smtp-Source: APXvYqwj7n/Ksa5Yzd86b6IBd9m9+zMKFkW8PDH4YzDER2xtG4gkYiXYzX6DC51rCi1zpfb8vxzyhg==
X-Received: by 2002:a17:902:7287:: with SMTP id
	d7mr27855472pll.333.1574671515268; 
	Mon, 25 Nov 2019 00:45:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	136sm7472257pfb.49.2019.11.25.00.45.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 00:45:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 00:44:50 -0800
Message-Id: <20191125084452.1515325-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125084452.1515325-1-raj.khem@gmail.com>
References: <20191125084452.1515325-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] libinput: Fix build when using 64bit time_t on 32bit machines
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
X-List-Received-Date: Mon, 25 Nov 2019 08:45:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...64bit-time_t-for-32bit-architectures.patch | 386 ++++++++++++++++++
 .../wayland/libinput_1.14.3.bb                |   4 +-
 2 files changed, 389 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/libinput/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch

diff --git a/meta/recipes-graphics/wayland/libinput/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch b/meta/recipes-graphics/wayland/libinput/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
new file mode 100644
index 0000000000..344e6aaf8f
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
@@ -0,0 +1,386 @@
+From ab6ce09bfb669177c90cc5c10155eec44e9fc34b Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Sat, 23 Nov 2019 17:23:56 -0800
+Subject: [PATCH] Adjust for 64bit time_t for 32bit architectures
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/libinput/libinput/merge_requests/346]
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ meson.build                     |  1 +
+ src/evdev-mt-touchpad-buttons.c | 15 ++++---
+ src/evdev.c                     |  5 ++-
+ src/util-input-event.h          | 69 +++++++++++++++++++++++++++++++++
+ tools/libinput-record.c         | 16 +++++---
+ 5 files changed, 90 insertions(+), 16 deletions(-)
+ create mode 100644 src/util-input-event.h
+
+--- a/meson.build
++++ b/meson.build
+@@ -220,7 +220,8 @@ endif
+ ############ libinput-util.a ############
+ src_libinput_util = [
+ 		'src/libinput-util.c',
+-		'src/libinput-util.h'
++		'src/libinput-util.h',
++		'src/util-input-event.h'
+ ]
+ libinput_util = static_library('libinput-util',
+ 			       src_libinput_util,
+--- a/src/evdev-mt-touchpad-buttons.c
++++ b/src/evdev-mt-touchpad-buttons.c
+@@ -30,6 +30,7 @@
+ #include <unistd.h>
+ #include "linux/input.h"
+ 
++#include "util-input-event.h"
+ #include "evdev-mt-touchpad.h"
+ 
+ #define DEFAULT_BUTTON_ENTER_TIMEOUT ms2us(100)
+@@ -1145,14 +1146,12 @@ tp_notify_clickpadbutton(struct tp_dispa
+ 	if (tp->buttons.trackpoint) {
+ 		if (is_topbutton) {
+ 			struct evdev_dispatch *dispatch = tp->buttons.trackpoint->dispatch;
+-			struct input_event event;
+-			struct input_event syn_report = {{ 0, 0 }, EV_SYN, SYN_REPORT, 0 };
++			struct input_event event, syn_report;
++			int value;
+ 
+-			event.time = us2tv(time);
+-			event.type = EV_KEY;
+-			event.code = button;
+-			event.value = (state == LIBINPUT_BUTTON_STATE_PRESSED) ? 1 : 0;
+-			syn_report.time = event.time;
++			value = (state == LIBINPUT_BUTTON_STATE_PRESSED) ? 1 : 0;
++			event = input_event_init(time, EV_KEY, button, value);
++			syn_report = input_event_init(time, EV_SYN, SYN_REPORT, 0);
+ 			dispatch->interface->process(dispatch,
+ 						     tp->buttons.trackpoint,
+ 						     &event,
+--- a/src/evdev.c
++++ b/src/evdev.c
+@@ -44,6 +44,7 @@
+ #include "filter.h"
+ #include "libinput-private.h"
+ #include "quirks.h"
++#include "util-input-event.h"
+ 
+ #if HAVE_LIBWACOM
+ #include <libwacom/libwacom.h>
+@@ -859,7 +860,7 @@ evdev_print_event(struct evdev_device *d
+ {
+ 	static uint32_t offset = 0;
+ 	static uint32_t last_time = 0;
+-	uint32_t time = us2ms(tv2us(&e->time));
++	uint32_t time = us2ms(input_event_time(e));
+ 
+ 	if (offset == 0) {
+ 		offset = time;
+@@ -891,7 +892,7 @@ static inline void
+ evdev_process_event(struct evdev_device *device, struct input_event *e)
+ {
+ 	struct evdev_dispatch *dispatch = device->dispatch;
+-	uint64_t time = tv2us(&e->time);
++	uint64_t time = input_event_time(e);
+ 
+ #if 0
+ 	evdev_print_event(device, e);
+--- /dev/null
++++ b/src/util-input-event.h
+@@ -0,0 +1,69 @@
++/*
++ * Copyright © 2019 Red Hat, Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ */
++
++#pragma once
++
++#include "config.h"
++
++#include "util-time.h"
++#include <linux/input.h>
++
++static inline struct input_event
++input_event_init(uint64_t time,
++		 unsigned int code,
++		 unsigned int type,
++		 int value)
++{
++	struct input_event ev;
++	struct timeval tval = us2tv(time);
++
++	ev.input_event_sec = tval.tv_sec;
++	ev.input_event_usec = tval.tv_usec;
++	ev.type = type;
++	ev.code = code;
++	ev.value = value;
++
++	return ev;
++}
++
++static inline uint64_t
++input_event_time(const struct input_event *e)
++{
++	struct timeval tval;
++
++	tval.tv_sec = e->input_event_sec;
++	tval.tv_usec = e->input_event_usec;
++
++	return tv2us(&tval);
++}
++
++
++static inline void
++input_event_set_time(struct input_event *e,
++		     uint64_t time)
++{
++	struct timeval tval = us2tv(time);
++
++	e->input_event_sec = tval.tv_sec;
++	e->input_event_usec = tval.tv_usec;
++}
+--- a/tools/libinput-record.c
++++ b/tools/libinput-record.c
+@@ -41,6 +41,7 @@
+ #include <stdbool.h>
+ 
+ #include "libinput-versionsort.h"
++#include "util-input-event.h"
+ #include "libinput-util.h"
+ #include "libinput-version.h"
+ #include "libinput-git-version.h"
+@@ -196,8 +197,9 @@ print_evdev_event(struct record_context
+ 	const char *cname;
+ 	bool was_modified = false;
+ 	char desc[1024];
++	uint64_t time = input_event_time(ev) - ctx->offset;
+ 
+-	ev->time = us2tv(tv2us(&ev->time) - ctx->offset);
++	input_event_set_time(ev, time);
+ 
+ 	/* Don't leak passwords unless the user wants to */
+ 	if (!ctx->show_keycodes)
+@@ -215,7 +217,7 @@ print_evdev_event(struct record_context
+ 		static unsigned long last_ms = 0;
+ 		unsigned long time, dt;
+ 
+-		time = us2ms(tv2us(&ev->time));
++		time = us2ms(input_event_time(ev));
+ 		dt = time - last_ms;
+ 		last_ms = time;
+ 
+@@ -239,8 +241,8 @@ print_evdev_event(struct record_context
+ 
+ 	iprintf(ctx,
+ 		"- [%3lu, %6u, %3d, %3d, %6d] # %s\n",
+-		ev->time.tv_sec,
+-		(unsigned int)ev->time.tv_usec,
++		ev->input_event_sec,
++		(unsigned int)ev->input_event_usec,
+ 		ev->type,
+ 		ev->code,
+ 		ev->value,
+@@ -268,16 +270,18 @@ handle_evdev_frame(struct record_context
+ 	while (libevdev_next_event(evdev,
+ 				   LIBEVDEV_READ_FLAG_NORMAL,
+ 				   &e) == LIBEVDEV_READ_STATUS_SUCCESS) {
++		uint64_t time;
+ 
+ 		if (ctx->offset == 0)
+-			ctx->offset = tv2us(&e.time);
++			ctx->offset = input_event_time(&e);
+ 
+ 		if (d->nevents == d->events_sz)
+ 			resize(d->events, d->events_sz);
+ 
+ 		event = &d->events[d->nevents++];
+ 		event->type = EVDEV;
+-		event->time = tv2us(&e.time) - ctx->offset;
++		time = input_event_time(&e);
++		input_event_set_time(&e, time - ctx->offset);
+ 		event->u.evdev = e;
+ 		count++;
+ 
+--- a/src/libinput-private.h
++++ b/src/libinput-private.h
+@@ -39,6 +39,7 @@
+ 
+ #include "libinput.h"
+ #include "libinput-util.h"
++#include "util-time.h"
+ #include "libinput-version.h"
+ 
+ #if LIBINPUT_VERSION_MICRO >= 90
+--- a/src/libinput-util.h
++++ b/src/libinput-util.h
+@@ -206,12 +206,6 @@ clear_bit(unsigned char *array, int bit)
+ 	array[bit / 8] &= ~(1 << (bit % 8));
+ }
+ 
+-static inline void
+-msleep(unsigned int ms)
+-{
+-	usleep(ms * 1000);
+-}
+-
+ static inline bool
+ long_bit_is_set(const unsigned long *array, int bit)
+ {
+@@ -453,53 +447,6 @@ bool
+ parse_switch_reliability_property(const char *prop,
+ 				  enum switch_reliability *reliability);
+ 
+-static inline uint64_t
+-us(uint64_t us)
+-{
+-	return us;
+-}
+-
+-static inline uint64_t
+-ns2us(uint64_t ns)
+-{
+-	return us(ns / 1000);
+-}
+-
+-static inline uint64_t
+-ms2us(uint64_t ms)
+-{
+-	return us(ms * 1000);
+-}
+-
+-static inline uint64_t
+-s2us(uint64_t s)
+-{
+-	return ms2us(s * 1000);
+-}
+-
+-static inline uint32_t
+-us2ms(uint64_t us)
+-{
+-	return (uint32_t)(us / 1000);
+-}
+-
+-static inline uint64_t
+-tv2us(const struct timeval *tv)
+-{
+-	return s2us(tv->tv_sec) + tv->tv_usec;
+-}
+-
+-static inline struct timeval
+-us2tv(uint64_t time)
+-{
+-	struct timeval tv;
+-
+-	tv.tv_sec = time / ms2us(1000);
+-	tv.tv_usec = time % ms2us(1000);
+-
+-	return tv;
+-}
+-
+ static inline bool
+ safe_atoi_base(const char *str, int *val, int base)
+ {
+--- /dev/null
++++ b/src/util-time.h
+@@ -0,0 +1,84 @@
++/*
++ * Copyright © 2013-2019 Red Hat, Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ */
++
++#pragma once
++
++#include "config.h"
++
++#include <time.h>
++#include <stdint.h>
++#include <unistd.h>
++#include <linux/input.h>
++
++static inline void
++msleep(unsigned int ms)
++{
++	usleep(ms * 1000);
++}
++
++static inline uint64_t
++us(uint64_t us)
++{
++	return us;
++}
++
++static inline uint64_t
++ns2us(uint64_t ns)
++{
++	return us(ns / 1000);
++}
++
++static inline uint64_t
++ms2us(uint64_t ms)
++{
++	return us(ms * 1000);
++}
++
++static inline uint64_t
++s2us(uint64_t s)
++{
++	return ms2us(s * 1000);
++}
++
++static inline uint32_t
++us2ms(uint64_t us)
++{
++	return (uint32_t)(us / 1000);
++}
++
++static inline uint64_t
++tv2us(const struct timeval *tv)
++{
++	return s2us(tv->tv_sec) + tv->tv_usec;
++}
++
++static inline struct timeval
++us2tv(uint64_t time)
++{
++	struct timeval tv;
++
++	tv.tv_sec = time / ms2us(1000);
++	tv.tv_usec = time % ms2us(1000);
++
++	return tv;
++}
diff --git a/meta/recipes-graphics/wayland/libinput_1.14.3.bb b/meta/recipes-graphics/wayland/libinput_1.14.3.bb
index f06a8d28f8..46d46c54ee 100644
--- a/meta/recipes-graphics/wayland/libinput_1.14.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.14.3.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           file://0001-adjust-for-64bit-time_t-for-32bit-architectures.patch \
+"
 SRC_URI[md5sum] = "d052faa64eb6d2e649e582cc0fcf6e32"
 SRC_URI[sha256sum] = "0feb3a0589709cc1032893bfaf4c49150d5360bd9782bec888f9e4dd9044c5b7"
 
-- 
2.24.0


