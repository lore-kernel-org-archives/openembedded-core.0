Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CC3CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 13:08:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39773.1792069729769819648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 06:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fhLNAltq;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so33164285e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 06:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069728; x=1792674528; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+7aBp73jUbDpm0g5qVZNAlR5hyFvkpQvTAV50K+f08=;
        b=fhLNAltql4NkE4KMEupVq3jhIaeuwbYWRtSNzMUKoRamJcahDIusNPAn2Qct/hUIif
         DlxK97GJ13FvPihXeyQ4UC+mNT49FlJ/6de11ULmyy8zbZskAXhkCA46PKSSqXO03i3L
         Pc/jVYJeN0uK6JFdXN5HMsIb4NGAtgCpK8BM74hnheMAcrmP7Z+qSkA2+KWsR1XhLid2
         19LyIqo4gbeSkaoIpid4LVrifyr1JUEATN6KrjfyZrx/muWDH9MHvy4WuB3SZzHEzvTH
         5OCt9x9rjAylaeH48sZIEWyXTzLXaPjjskTCMnAAAurwEQVDx8TuDdZy+EmdBnOZ/727
         4grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069728; x=1792674528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+7aBp73jUbDpm0g5qVZNAlR5hyFvkpQvTAV50K+f08=;
        b=FWgnr0v36sK/e9KtlDDhQ29g1gYbTNgkBbD7pSEb9Utow2QFgWAsRbc+n+YMKTkHcQ
         xtEmRcUqOsGy1qYPnH7ZHXq5Gz75wTppx5KLefs4y927feyDL1YKAzmQUFJ2/6/xfyij
         WTVbvfd/r8AXSG1QAe03nMFSsGCWPvk+X2dtSS/G9Ki4t/pyNtrRV2qTgV9gURGbWA51
         4C4mW8Y7ZS15QcUtUh9ZxUlqZ9o8KTVcLpbIj44uzSpGcI8Q21bOT3ogi77OiOKq0uuY
         d8S7MDfQ6goASShDu0CfSzNwnDf3PLb6dVkqe1jYHdf7cJXEF5oDvISLZnkj6IBHF+3p
         8roA==
X-Gm-Message-State: AFq9FYLSBXSG8wbrd8F5HsPL1bCbKInZlCc8m91/TRXk7Cjb5uMaR6XC
	EPajmMeYdT6GuVvDRj0uhLbh8unTDWZqVljXrAuoJLpWuHIFAcLkBeMv0rdRtw==
X-Gm-Gg: AYBFou3le2pKQG2i+wZR1OoVX8s09uzgyN1IViPEDI63p7a93wrVTtJ1qEKLqDvYxGy
	WfsNNDQ5sIngvYekl60gxz85p9Pmv52IxRyOGtXzbjdyrRpyBs5eybwDWJyzUKpEhtDlZI0R5eI
	s7RWA5hwlxUTKv3/5kfkNoMR3XpsP2CUX5cYZoJS5oOr8RCzBAcMZaIR4W0AxDwawCGlA+EA7my
	Rux/elU8cWHhpqYdfe1HYWd2BM1wWEDfsD+Vf6lI7AAeC3jJLFJrsleytZESnA42maOV0DxakCt
	TMUtB8K6SKdPVwCbEehxYzo7B6mJ+1kNo/t0yYAnGxRAaNIphVUlekeI8e+NAOCwOV0arXaSsG8
	b2j1olHeeAlvsIe+LcCiTi+bwaSX6Taup2Qr4HMStHR3UKm6UBVfUiSXXRTfJbgUI9QS1lZ/Pdx
	clP1k8a8PGy6xsaMs5upIoU2WZt/zu83nuq60eC96t5synl6YucnZigDV3oViJyehaAc9VB2wF6
	kNJj5dXMrHtSfLbvWVwoZdMLiMMIQjqH13yA78rHm11MFH7Cw==
X-Received: by 2002:a05:600c:8b01:b0:4a1:c4d3:2fc0 with SMTP id 5b1f17b1804b1-4a1c4d32fe7mr22144045e9.6.1792069727439;
        Thu, 15 Oct 2026 06:08:47 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17782453f8f.36.2026.10.15.06.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:08:46 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 15 Oct 2026 14:08:44 +0100
Subject: [PATCH 2/2] eudev: upgrade 3.2.14 -> 3.2.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-eudev-3-2-15-v1-2-407ba1a93edb@gmail.com>
References: <20261015-eudev-3-2-15-v1-0-407ba1a93edb@gmail.com>
In-Reply-To: <20261015-eudev-3-2-15-v1-0-407ba1a93edb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 13:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247884

Drop backported commits.

Changes:

Aitor Cuadrado Zubizarreta (1):
      Fix a mistake in the length of USEC_INITIALIZED when parsing property string

Aleksey Vasenev (1):
      ata_id: Fixed getting Response Code from SCSI Sense Data (#24921)

Andre Eikmeyer (1):
      udev: derive path ID for PNP devices from ACPI firmware node

Andrey Albershteyn (1):
      udev: enable BLKID_SUBLKS_FSINFO tags

Boian Bonev (39):
      Better wording
      use a dynamic buffer to fix 'dmi_memory_id' ressize 16384 too short
      log: return the negative error from log_*_errno() and map %m to it
      udev-event: do not overflow the argv array in udev_build_argv()
      man: RUN substitutions are performed while the rule is processed
      udevadm-hwdb: write the compatible database format by default, add hwdb_format= to udev.conf
      libudev-monitor: filter in userspace if the socket filter does not fit
      udev-rules: do not ignore rd.* kernel command line options in IMPORT{cmdline}
      udev-ctrl: NUL terminate received strings and validate the log level
      Merge hwdb from systemd
      udev-builtin-path_id: add sas_legacy_path udev.conf option
      udev-builtin-path_id: add fallbacks for USB_HUB_PR_* constants
      fido_id: fix use of uninitialized variable
      udev-builtin: size the argv array with UDEV_ARGV_MAX
      Merge suitable rules changes from systemd
      ci: build on current Devuan and supported Alpine releases
      udev-watch: do not log an error when the watched device is already gone
      udevadm-trigger: add --type=all
      README: point Gentoo users to the without-systemd overlay
      hwdb: add Chromium OS autosuspend list
      util: set the umask when declaring the cleanup variable in mk[o]stemp_safe()
      udevadm-info: check the result of dirfd() in the db cleanup helpers
      udev-watch: check the result of dirfd() when restoring watches
      udevd: drop dead stores when skipping a locked block device
      net_id: drop dead initialization of prefix
      udevadm-hwdb: do not lose entries when splitting a trie node fails
      scsi_id: do not read past the end of a config line with an unterminated quote
      ci: install libselinux-dev or libselinux1-dev on Devuan
      log: make the return value of log_oom() visible at the call site
      udev-rules: stop reading a rules file once a continued line hits EOF
      path-util: decide on the separator before reallocating the path
      libudev-monitor: initialize the address buffer for getsockname()
      udevd: assert that worker_returned() gets a valid socket
      collect: handle unexpected states explicitly in everybody()
      tree-wide: fix constness with C23 qualifier-preserving glibc functions
      configure.ac: point the bug report URL to eudev-project
      rules: put render nodes in the render group
      libudev: bump the library revision
      bump version to 3.2.15

Csókás, Bence (1):
      udev-rules: Fix compile errors with `-DDEBUG=1`

CuriouslyCurious (1):
      build: Add libtool as build-dependency for Alpine

Daniel Mack (1):
      util: fix another cunescape() regression

Daniel28972897 (1):
      libudev-device: set errno also for a cached failed parent lookup

David Herrmann (2):
      libudev-hwdb: fix child/value offset calculation
      hwdb: order properties by origin

David Milburn (1):
      udev: build by-path identifiers for ATA devices.

Davin McCall (1):
      udevd: add support for S6/dinit-compatible readiness notification

Franck Bui (1):
      udev-rules: support '-=' operator for SYMLINK

Frantisek Sumsal (2):
      shared: parse the whole /proc/cmdline
      scsi_id: use safe_atoi() instead of plain atoi()

Hendrik Brueckner (1):
      udev/path_id: correct segmentation fault due to missing NULL check

Jiri Pirko (1):
      udev-builtin-path_id: emit 'sf-<N>' token for auxiliary sub-functions

Joe Slater (1):
      80-net-name-slot.rules: consider ID_NET_NAME_MAC as a name

Johannes Nixdorf (1):
      78-sound-card.rules: Import ID_PATH early

Joshua Goins (2):
      udev: Fix some tablet pads being classified as mouse or joysticks
      udev: Don't mark as tablet if device has relative coordinates

Karel Zak (1):
      udev-builtin-blkid: add support for --hint offsets

Kay Sievers (2):
      libudev-device: translate / vs. ! in sysname and refuse non-normalized names
      get_process_environ: exit early when there is nothing to read

Keith Busch (1):
      udev/path_id: introduce support for NVMe devices

Lennart Poettering (11):
      udev-rules: proc_cmdline_get_key() FTW!
      libudev-monitor: add missing errno initialization/error propagation
      udev-rules: consider "-" and "_" equivalent in IMPORT{cmdline} keys
      mtd_probe: fix lseek() parameter order
      udev-builtin-blkid: pick up info of backing file
      udev: modernize udev-builtin-btrfs a bit
      utf8: let's update utf16_to_utf8() a bit
      process: an empty environment block should be returned as such
      fileio: try to read one byte too much in read_full_stream()
      fileio: initialize errno to zero before we do fread()
      udevadm: use xopendirat() where appropriate

Lidong Zhong (1):
      udev: rename the persistent link for ATA devices

Luca Boccassi (9):
      libudev-monitor: bound the tag filter BPF program size
      libudev-monitor: avoid 32-bit overflow in the monitor properties bounds check
      helpers: check for invalid chars in various fields received from the kernel
      scsi_id: use strscpy instead of strncpy for wwn fields
      scsi_id: null-terminate serial after append_vendor_model
      scsi_id: check for invalid chars in various fields received from the kernel
      scsi_id: check for invalid header from kernel buffer
      udev: ensure tag parsing stays within bounds
      net_id: check for invalid chars in various fields received from the kernel

Lukas Nykryn (1):
      udev: add new builtin net_driver

Marek Vasut (1):
      udev: Handle AMBA bus the same way as generic platform bus

Martin Wilck (2):
      udevadm: cleanup-db: don't delete information for kept db entries
      udev-builtin-path_id: SAS wide ports must have num_phys > 1

Masahisa Kojima (1):
      random-util.c: sync dev_urandom implementation to systemd-udev

Matthias Schiffer (1):
      rules: add mtd/by-name symlinks

Michal Schmidt (1):
      udevd: fix crash with invalid udev.log-priority

Michal Sekletar (1):
      udev-rules: allow substitutions for SECLABEL key

Mike Yuan (1):
      udev-ctrl: add missing size check of received message

Milan Kyselica (1):
      udev: fix bounds check in dev_if_packed_info()

Nate Clark (1):
      udev-builtin-blkid: Use _cleanup_blkid_free_probe_ to free probe (#6108)

Nicolas Boichat (1):
      udevadm-hwdb: Return non-zero exit code on error when --strict is used

Peter Hutterer (7):
      libudev-hwdb: fix matching for characters with an ord > 127
      udev-builtin-input_id: any i2c mouse is a pointing stick
      udev: if a tablet has BTN_0, label it as ID_INPUT_TABLET_PAD
      udev-builtin-input_id: don't label absolute mice as pointing sticks
      udev-builtin-input_id: use heuristics to detect joysticks
      udev: don't allow pointing stick sensitivities greater than 255 (#5927)
      udev: skip EVDEV_ABS override on devices without EV_ABS (#5984)

Ross Burton (1):
      udevadm-hwdb: strip the root from filenames when generating hwdb.bin

Ryan Attard (1):
      ata_id: Add support for host managed zone block devices (#14933)

Tobias Stoeckmann (1):
      udev: spot inconsistent quoting (just one single quote)

Tom Gundersen (1):
      udev: bulitin-hwdb - fix memory leak

Tomas Bzatek (1):
      ata_id: export read look-ahead values

Vicente Bergas (1):
      Add BTN_ key codes

Viktor Mihajlovski (1):
      udev: Use parent bus id for virtio disk builtin path-id (#5500)

Vito Caputo (2):
      strxcpyx: don't overflow dest on strpcpyf truncate
      fileio: fix read_full_stream() bugs (#3887)

Wenchao Hao (1):
      scsi_id: retry inquiry ioctl if host_byte is DID_TRANSPORT_DISRUPTED

Yu Watanabe (37):
      udev-rules: fix negative match rule for SYMLINK and TAG
      udev-rules: replace unsafe characters on assigning ENV{key}="val" when OPTIONS="string_escape=replace" is set
      udev-rules: support case insensitive match
      udev-rules: evaluate formatting in RUN= key earlier
      udev-rules: allow to execute longer command line
      udev-rules: protect more properties often set by kernel and internally used by udevd
      udev-rules: refuse invalid devlink
      libudev-device,udev-rules: tag must be a valid filename
      udevd: make newer event also blocked by DEVPATH_OLD and by events for the same device node
      udevd: refuse to enable inotify watch on remove event
      udev-watch: also save map from device ID to watch handle in /run/udev/watch
      udev-rules: do not import property value from truncated line of program result
      libudev-monitor: use SO_DETACH_FILTER to remove BPF program
      libudev-device: make udev_device_set_syspath() clear sysname and sysnum
      libudev-enumerate: use path_startswith() to match parent device
      libudev-enumerate: also check is_initialized match when scanning by tags or children
      libudev: check arguments of more public functions
      libudev-device: ignore failure in caching the written sysattr value
      udev: end the watch of the processed device, and drop redundant db update
      cdrom_id: check last track info
      helpers: always open with O_NOCTTY
      scsi_id: rename positional arguments
      dmi_memory_id: update table with latest SMBIOS specification
      helpers: gracefully handle ENODEV or friends in opening device node
      udev: gracefully handle ENODEV or friends in opening device node
      udev: make udevadm test and test-builtin not destructive
      udev-builtin-kmod: support to run without arguments
      udev: always open with O_NOCTTY
      udev: always create device symlinks for USB disks
      udev: support by-path devlink for multipath nvme block devices
      udev: add USB revision in ID_PATH
      udev: do not set ID_PATH and by-path symlink for nvmf disks
      udev-builtin: make btrfs builtin command only check arguments when run in test mode
      udev-builtin-btrfs: refuse to call for irrelevant device node
      net_id: fix potential buffer overflow
      udevd: use worker_free() on failure in worker_new()
      udev-event: check command is not empty before executing

Yu, Li-Yu (1):
      udev-rules: escaped string syntax e"..." in rule files

Zbigniew Jędrzejewski-Szmek (9):
      libudev-device: attempt to read db again if it wasn't found
      libudev-device: fix udev_device_set_sysattr_value()
      v4l_id: use O_CLOEXEC|O_NOCTTY
      helpers: downgrade ENOMEDIUM warnings
      scsi_id: do not ignore positive error values from set_inq_values()
      udev: change the modalias string for usb devices to include the device name
      tree-wide: make new/new0/malloc_multiply/reallocarray safe for size 0
      basic/escape: merge utf8 and non-utf8 paths in cunescape_one
      tree-wide: add bsearch_safe and use where appropriate

chenjiayi (1):
      scsi_id: distinguish host-managed zoned block in scsi_id

dongshengyuan (1):
      udev: avoid reading before empty capability masks

gaoyi (1):
      udevd: don't kill worker in worker_kill() when it's running

huyubiao (1):
      udevadm-hwdb: fix unsigned and signed comparison problem

jeffhuang (1):
      libudev-hwdb: bounds-check trie offsets against the mmap before dereferencing

jmestwa-coder (1):
      cdrom_id: zero scsi response buffers before parsing

spaette (1):
      typos

我超厉害 (1):
      ata_id: even if a device is a zac device, scsi-$ID_SERIAL will be reserved for it (#30459)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ....c-sync-dev_urandom-implementation-to-sys.patch | 138 ---------------------
 meta/recipes-core/udev/eudev/netifnames.patch      |  17 ---
 .../udev/{eudev_3.2.14.bb => eudev_3.2.15.bb}      |   4 +-
 3 files changed, 1 insertion(+), 158 deletions(-)

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
index 3e4972694ac0..2ff2370bcb5e 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.15.bb
@@ -10,13 +10,11 @@ DEPENDS = "gperf-native"
 PROVIDES = "udev"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://netifnames.patch \
            file://init \
            file://local.rules \
-           file://0001-random-util.c-sync-dev_urandom-implementation-to-sys.patch \
            "
 
-SRC_URI[sha256sum] = "8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc1927f006f"
+SRC_URI[sha256sum] = "eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3"
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 

-- 
2.43.0


