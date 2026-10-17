Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4DFCCF2C7
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 16:02:04 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8835.1792252918743393446
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 09:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AwgozQFA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso383666f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252917; x=1792857717; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UG42tRgJJOaWDP9rl28aEXCxsYduKXXekqcL3lgqLBg=;
        b=AwgozQFAB0PFVBJlLxNKrC4IXQLnaHAW08ji06CLOSrSMGz9FcujLdijt9DABUQqCA
         hPqqAtxh66bkWdEz9X1qJMmXhc7tnO4A7aZI925rc+D7i/7vSqALuZuqHZYrob2U/0hH
         GBI2bg3ArQFB+pmA9hY9PqTliabiUeZUlpOmE0V34XhymH80MfUqcIeKfPQJkdLuSP+X
         ApB7zCVVDUatpU4yi/Hv77xklG7rL8OjOEbBynYLUwbWUsCY3CV1PO13I52iJYdzpXtG
         XQ+p6TZvUJRCB1k/pzJxtY3UulT4QeoqCE77odNYZHB5eU89jd6MQQjgdchNaK8pFdk8
         BtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252917; x=1792857717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UG42tRgJJOaWDP9rl28aEXCxsYduKXXekqcL3lgqLBg=;
        b=0fq3M4FhAQuJ/k5LWKPMuHlkHB80MTFbn0uRLz4ozTsZhcdGFgozreQwWygb+U7GUF
         Wy1mnU9AMDWwVDPJxmmcvi6B+ef4/m8Tkod7AyAvC8JbxqLbUckKIHH3vBtc3WP5DTb9
         xfehJTJ5MvOvud1/qGck+O2nHx6cUODXZZJ+4xUwQ1lVJSAn5RGMKAFKVf05sEGQgu6l
         8y6SLF4ZNrIB17jLwLj4d9tRvOswFqsurLsz9faB5G9a7y5NFHJBGxn5M7xbh0wIchS4
         LD4CRN1nFe6R8bRaDXxMrxA6HHgpSYTIHdw5mXwfI0X9laKDHs8q0lN2eSUNvUiJ2GZ3
         ohUA==
X-Gm-Message-State: AFq9FYLjM1TCy66KSsfoxPZhJPD2+nXM29PE9DQWNsaSIFLLHY32o6Rg
	afZMKbXeA66ZAgS7sVGIpoKtGFCW5ymzZr4oQVr5s+8QxkQ2EjluKN5rwB4BYQ==
X-Gm-Gg: AYBFou0hV5IFHVRhni3EXL5+c7ORvh0+K9wp17TEel0lYCvZvFhvYncN3I7aaGkJcHV
	QGKY9CPYCdvrgPt/eq3AC2ljphuW8ITeBgfgzBzhDJh1CZUBZHTJDgHb6nrwCXYdx8MpVNT9+Ta
	ryr0Y78ZdF5TTcNimTJwbAjkD9cuTPly5TWpluVX8ddqKyTE2jbdec50+HIKEyLEznOJry2tSxl
	pZsjp6V15rev0GSW7LGJaanM2qAaRk2aCFM8OXDgu+UegcGwjL9jJq5GKyuNIIw0PSE18Xmh6L+
	LHic+C3snxAj7hXI4K2m2IQSglpG9jd7GzCwzfSkEP4QWM4PKfCz1GisPiN56U6sT6pMtsCkYr0
	MX+hBbysqNJwGyYVeoZzcUqfHN/id6kcEF+Rz+X9VWD1FzM9pq5MqYpgC/kQ5iq4BwZG0HV5+ZE
	adBbCWzR3qGTKi0UONdXPBd8reiLy5QlcX8CfiXwXcJBCBt4mK2ca8yTJvned34Qyox6f7qIGVj
	SVH6omSOB89eDHsP3uQ87vn9s+3FizLWskrhnpLOL1wmtrx6J0Zlv4TCVf7
X-Received: by 2002:adf:e194:0:b0:48e:1c2:55a1 with SMTP id ffacd0b85a97d-48e07fa4046mr5617009f8f.52.1792252916701;
        Sat, 17 Oct 2026 09:01:56 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm11773542f8f.29.2026.10.17.09.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:01:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 17 Oct 2026 17:01:50 +0100
Subject: [PATCH v2 2/2] eudev: upgrade 3.2.14 -> 3.2.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-eudev-3-2-15-v2-2-489cff4613f3@gmail.com>
References: <20261017-eudev-3-2-15-v2-0-489cff4613f3@gmail.com>
In-Reply-To: <20261017-eudev-3-2-15-v2-0-489cff4613f3@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 16:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248091

Release notes: https://github.com/eudev-project/eudev/releases/tag/v3.2.15

Drop netifnames.patch and the random-util backport, both now upstream.

Add a fix, submitted upstream, for a use-after-free new in 3.2.15 that
intermittently crashes udevd during coldplug on musl.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ....c-sync-dev_urandom-implementation-to-sys.patch | 138 ---------------------
 ...01-udevd-keep-a-copy-of-the-event-devnode.patch | 101 +++++++++++++++
 meta/recipes-core/udev/eudev/netifnames.patch      |  17 ---
 .../udev/{eudev_3.2.14.bb => eudev_3.2.15.bb}      |   5 +-
 4 files changed, 103 insertions(+), 158 deletions(-)

diff --git a/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch b/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch
deleted file mode 100644
index 668aa731aca1..000000000000
--- a/meta/recipes-core/udev/eudev/0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 95c871b7b912f39539777ac222ef7f8798bb0225 Mon Sep 17 00:00:00 2001
-From: Masahisa Kojima <kojima.masahisa@socionext.com>
-Date: Thu, 25 Apr 2024 17:23:10 +0900
-Subject: [PATCH] random-util.c: sync dev_urandom implementation to
- systemd-udev
-
-Current dev_urandom() assumes that reading /dev/urandom
-will never block regardless if the random pool is fully
-initialized or not.
-This assumption is no longer applicable since linux kerrnel
-enforces the /dev/urandom entropy initialization from
-v5.18-rc2 with the commit:
-48bff1053c17 ("random: opportunistically initialize on /dev/urandom reads").
-
-With this, when we use the linux v5.18-rc2 or later,
-dev_urandom() will block if enough random pool is not supplied.
-It causes the boot delay, typically 1024msec(4msec * 256 = 1024msec)
-delay to fill the 256 bits entropy for the case CONFIG_HZ=250.
-
-To prevent this boot delay, this commit syncs dev_urandom()
-implementation to the systemd-udev.
-The systemd-udev implementation of reading /dev/urandom is as follows.
- - Try to get random with calling getrandom(GRND_INSECURE)
- - If kernel does not support GRND_INSECURE, fallback to GRND_NONBLOCK
- - If enough entropy is not supplied, fallback to reading /dev/urandom,
-   this will block when the kernel version is v5.18-rc2 or later
-
-With this modification, dev_urandom() tries not to block
-as much as possible.
-
-This modification still keeps the backword compatibility,
-dev_random() will never block if the commit(48bff1053c17) is not
-applied to the linux kernel, the behavior is same as before
-in this case.
-
-Upstream-Status: Backport [a49a3aaa460add6ae7ea208b4cac630e56fe1180]
-Signed-off-by: Masahisa Kojima <kojima.masahisa@socionext.com>
----
- src/shared/missing.h     |  4 +++
- src/shared/random-util.c | 70 ++++++++++++++++++----------------------
- 2 files changed, 35 insertions(+), 39 deletions(-)
-
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index 1967840cdbf3..1caec0f9207c 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -79,6 +79,10 @@ static inline int getrandom(void *buffer, size_t count, unsigned flags) {
- #define GRND_RANDOM 0x0002
- #endif
- 
-+#ifndef GRND_INSECURE
-+#define GRND_INSECURE 0x0004
-+#endif
-+
- #ifndef BTRFS_IOCTL_MAGIC
- #define BTRFS_IOCTL_MAGIC 0x94
- #endif
-diff --git a/src/shared/random-util.c b/src/shared/random-util.c
-index 01a28c8ef4e9..852b00e4ce2b 100644
---- a/src/shared/random-util.c
-+++ b/src/shared/random-util.c
-@@ -31,45 +31,37 @@
- #include "util.h"
- 
- int dev_urandom(void *p, size_t n) {
--        static int have_syscall = -1;
--
--        _cleanup_close_ int fd = -1;
--        int r;
--
--        /* Gathers some randomness from the kernel. This call will
--         * never block, and will always return some data from the
--         * kernel, regardless if the random pool is fully initialized
--         * or not. It thus makes no guarantee for the quality of the
--         * returned entropy, but is good enough for or usual usecases
--         * of seeding the hash functions for hashtable */
--
--        /* Use the getrandom() syscall unless we know we don't have
--         * it, or when the requested size is too large for it. */
--        if (have_syscall != 0 || (size_t) (int) n != n) {
--                r = getrandom(p, n, GRND_NONBLOCK);
--                if (r == (int) n) {
--                        have_syscall = true;
--                        return 0;
--                }
--
--                if (r < 0) {
--                        if (errno == ENOSYS)
--                                /* we lack the syscall, continue with
--                                 * reading from /dev/urandom */
--                                have_syscall = false;
--                        else if (errno == EAGAIN)
--                                /* not enough entropy for now. Let's
--                                 * remember to use the syscall the
--                                 * next time, again, but also read
--                                 * from /dev/urandom for now, which
--                                 * doesn't care about the current
--                                 * amount of entropy.  */
--                                have_syscall = true;
--                        else
--                                return -errno;
--                } else
--                        /* too short read? */
--                        return -ENODATA;
-+        static bool have_getrandom = true, have_grndinsecure = true;
-+        _cleanup_close_ int fd = -EBADF;
-+
-+        if (n == 0)
-+                return 0;
-+
-+        for (;;) {
-+                ssize_t l;
-+
-+                if (!have_getrandom)
-+                        break;
-+
-+                l = getrandom(p, n, have_grndinsecure ? GRND_INSECURE : GRND_NONBLOCK);
-+                if (l > 0) {
-+                        if ((size_t) l == n)
-+                                return 0; /* Done reading, success. */
-+                        p = (uint8_t *) p + l;
-+                        n -= l;
-+                        continue; /* Interrupted by a signal; keep going. */
-+                } else if (l == 0)
-+                        break; /* Weird, so fallback to /dev/urandom. */
-+                else if (errno == ENOSYS) {
-+                        have_getrandom = false;
-+                        break; /* No syscall, so fallback to /dev/urandom. */
-+                } else if (errno == EINVAL && have_grndinsecure) {
-+                        have_grndinsecure = false;
-+                        continue; /* No GRND_INSECURE; fallback to GRND_NONBLOCK. */
-+                } else if (errno == EAGAIN && !have_grndinsecure)
-+                        break; /* Will block, but no GRND_INSECURE, so fallback to /dev/urandom. */
-+
-+                break; /* Unexpected, so just give up and fallback to /dev/urandom. */
-         }
- 
-         fd = open("/dev/urandom", O_RDONLY|O_CLOEXEC|O_NOCTTY);
diff --git a/meta/recipes-core/udev/eudev/0001-udevd-keep-a-copy-of-the-event-devnode.patch b/meta/recipes-core/udev/eudev/0001-udevd-keep-a-copy-of-the-event-devnode.patch
new file mode 100644
index 000000000000..498bdda2bb50
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/0001-udevd-keep-a-copy-of-the-event-devnode.patch
@@ -0,0 +1,101 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sat, 17 Oct 2026 14:23:21 +0100
+Subject: [PATCH] udevd: keep a copy of the event devnode
+
+Commit 4b83740d95be added a devnode check to is_devpath_busy(), caching
+the pointer returned by udev_device_get_devnode() in struct event. That
+string belongs to the udev_device and can be freed while the event is
+still queued: dispatching an event to an idle worker calls
+udev_monitor_send_device(), whose udev_device_get_devtype() re-reads the
+uevent file for devices without DEVTYPE, and the DEVNAME line replaces
+(frees) the devnode string via udev_device_set_devnode().
+
+The next is_devpath_busy() then strcmp()s freed memory. Under musl,
+whose mallocng returns freed memory to the kernel, this segfaults the
+main daemon; elsewhere it silently compares stale data. valgrind
+(qemuarm64, musl) reports it on the first coldplug:
+
+  Invalid read of size 1
+     at strcmp
+     by streq_ptr (util.c:97)
+     by is_devpath_busy (udevd.c:578)
+     by event_queue_start (udevd.c:602)
+   Address 0x54eeaf0 is 0 bytes inside a block of size 10 free'd
+     at free
+     by udev_device_set_devnode (libudev-device.c:1750)
+     by udev_device_read_uevent_file (libudev-device.c:706)
+     by udev_device_get_devtype (libudev-device.c:248)
+     by udev_monitor_send_device (libudev-monitor.c:822)
+     by event_run (udevd.c:462)
+   Block was alloc'd at
+     at malloc
+     by asprintf
+     by udev_device_set_devnode (libudev-device.c:1752)
+     by udev_device_new_from_nulstr (libudev-device.c:2151)
+     by udev_monitor_receive_device (libudev-monitor.c:762)
+
+The systemd code this was ported from is not affected: sd_device seals
+devices received from netlink, so device_read_uevent_file() never
+re-reads them and the cached devname stays the DEVNAME the event arrived
+with for as long as the event is queued.
+
+Store a copy of the devnode in struct event, which keeps those
+semantics. Looking the devnode up from the device at comparison time
+would avoid the allocation, but would compare whatever a later uevent
+re-read left there rather than the event's own DEVNAME, which is what
+the check relies on for a remove and add queued for the same node.
+Stopping udev_device_get_devtype() re-reading the uevent file would
+remove the trigger instead, but changes public libudev behaviour.
+
+Fixes: 4b83740d95be ("udevd: make newer event also blocked by DEVPATH_OLD and by events for the same device node")
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+AI-Generated: Claude Opus 5.5 (Claude Code)
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
+Upstream-Status: Submitted [https://github.com/eudev-project/eudev/pull/304]
+---
+ src/udev/udevd.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/udev/udevd.c b/src/udev/udevd.c
+index 93d9466e0d2d..6ba3efa52555 100644
+--- a/src/udev/udevd.c
++++ b/src/udev/udevd.c
+@@ -97,7 +97,7 @@ struct event {
+         unsigned long long int seqnum;
+         const char *devpath;
+         const char *devpath_old;
+-        const char *devnode;
++        char *devnode;
+         dev_t devnum;
+         int ifindex;
+         bool is_block;
+@@ -140,6 +140,7 @@ static void event_free(struct event *event) {
+         udev_list_node_remove(&event->node);
+         udev_device_unref(event->dev);
+         udev_device_unref(event->dev_kernel);
++        free(event->devnode);
+ 
+         if (event->worker)
+                 event->worker->event = NULL;
+@@ -495,7 +496,18 @@ static int event_queue_insert(struct udev_device *dev) {
+         event->seqnum = udev_device_get_seqnum(dev);
+         event->devpath = udev_device_get_devpath(dev);
+         event->devpath_old = udev_device_get_devpath_old(dev);
+-        event->devnode = udev_device_get_devnode(dev);
++        /* Keep our own copy of the DEVNAME the event arrived with: unlike
++         * systemd's sealed sd_device, libudev may re-read the uevent file
++         * later (udev_monitor_send_device() -> udev_device_get_devtype()),
++         * which frees and replaces the device's devnode string. */
++        if (udev_device_get_devnode(dev) != NULL) {
++                event->devnode = strdup(udev_device_get_devnode(dev));
++                if (event->devnode == NULL) {
++                        udev_device_unref(event->dev_kernel);
++                        free(event);
++                        return -1;
++                }
++        }
+         event->devnum = udev_device_get_devnum(dev);
+         event->is_block = streq("block", udev_device_get_subsystem(dev));
+         event->ifindex = udev_device_get_ifindex(dev);
diff --git a/meta/recipes-core/udev/eudev/netifnames.patch b/meta/recipes-core/udev/eudev/netifnames.patch
deleted file mode 100644
index 4f8e54d12d4a..000000000000
--- a/meta/recipes-core/udev/eudev/netifnames.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-eudev: consider ID_NET_NAME_MAC as an interface name
-
-eudev might not create names based on slot or path.
-
-Upstream-Status: Backport [github.com/eudev-project/eudev/pull/274]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
---- a/rules/80-net-name-slot.rules
-+++ b/rules/80-net-name-slot.rules
-@@ -10,5 +10,6 @@ ENV{net.ifnames}=="0", GOTO="net_name_sl
- NAME=="", ENV{ID_NET_NAME_ONBOARD}!="", NAME="$env{ID_NET_NAME_ONBOARD}"
- NAME=="", ENV{ID_NET_NAME_SLOT}!="", NAME="$env{ID_NET_NAME_SLOT}"
- NAME=="", ENV{ID_NET_NAME_PATH}!="", NAME="$env{ID_NET_NAME_PATH}"
-+NAME=="", ENV{ID_NET_NAME_MAC}!="", NAME="$env{ID_NET_NAME_MAC}"
- 
- LABEL="net_name_slot_end"
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.15.bb
similarity index 93%
rename from meta/recipes-core/udev/eudev_3.2.14.bb
rename to meta/recipes-core/udev/eudev_3.2.15.bb
index 3e4972694ac0..956ab3f6c2dc 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.15.bb
@@ -10,13 +10,12 @@ DEPENDS = "gperf-native"
 PROVIDES = "udev"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://netifnames.patch \
            file://init \
            file://local.rules \
-           file://0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch \
+           file://0001-udevd-keep-a-copy-of-the-event-devnode.patch \
            "
 
-SRC_URI[sha256sum] = "8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc1927f006f"
+SRC_URI[sha256sum] = "eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3"
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 

-- 
2.43.0


