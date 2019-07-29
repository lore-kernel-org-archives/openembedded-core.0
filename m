Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D26197EC4D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:17:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y4so60574662wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 00:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Df2JWGFDs62sEUYA47qa8LfNUUoYD76g0m7/q+vpEUg=;
	b=tgNN8FRHCuPT9lCBL6pdzxQquvFqwSwI6q8iKQepsN+/TcP4NhZSzalg32VHwlgnnn
	dAbGvdKVg++ztl9KvYp8pvqNvt47EGKKbOC+ThjOpenXt0HDONKM81AsET5Dhk7WvKPu
	yOXuAwqNek/gQvOOecargARF2xJAWLCa/+PGHbtE9y8fIQtonfs6UD/Xu6YgciUtoASq
	ughma8p9Cmb3LgCMs4eSHqj/sD62FZNVmczel0F4kwyo3f6/d/GGkEczR+8OpmPUXKK/
	SiAl9mlzfC1lp4T4kDb2mqx6+Tmabn7V2xc2fd6Mhdp+khNqw3f3RGoDZ38JUWEkGrCd
	SimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Df2JWGFDs62sEUYA47qa8LfNUUoYD76g0m7/q+vpEUg=;
	b=fCETYDaoopKvZ2mF+qhcfezEBPjj8o8RFAMkO45Nclp7pS5gaj3uV3VtdVuURyd3wr
	MGbdsPZg+vJfocWF42Ptesy1YbvmIfsE+fLCDpYrDiZJBPf/a9QvAx2TCyahvRzXss6Y
	v9YsJ3Cgd0jIsB2NQjjZFrqY/wMhRzWHtICO24JMG78XLGwDnYYUcNUyjMtOOWtPYC7a
	p8JYdvljE1XwL4qZcFQFgOOBHfzyC3HUI0pQtCDHHSWT3Cill7ynYHVOio6UWW9/Uoze
	6UsMG3hPB4eyQVCvyphRB/Kj5jbj5IjOohXowEZ+QVLtKpYs2rUeOOoHPmYd3NsIOfKF
	HMig==
X-Gm-Message-State: APjAAAWUgWJbEGrZtpDLwjx5ur+6iNcNsUoiWtsyVsyKRqagezvn+s3P
	MIcpLuUeCe/zrc9wTTB2ImI=
X-Google-Smtp-Source: APXvYqzMfJbzvv9nND/Zc4N5dNhWctbhHuuwoCm1e/0z25LybtWIaClA0P/bFZMqN6DOPKa4Js+Uxg==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr9288502wrs.105.1564384622250; 
	Mon, 29 Jul 2019 00:17:02 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id
	y12sm40479245wru.30.2019.07.29.00.17.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 00:17:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 09:17:00 +0200
Message-Id: <20190729071700.31314-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2] qemu: add a patch fixing the native build on newer kernels
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
X-List-Received-Date: Mon, 29 Jul 2019 07:17:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The build fails on qemu-native if we're using kernels after commit
0768e17073dc527ccd18ed5f96ce85f9985e9115. This adds an upstream
patch that fixes the issue.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- fixed authorship which was accidentally changed when backporting

 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...o-handle-variably-sized-SIOCGSTAMP-w.patch | 339 ++++++++++++++++++
 2 files changed, 340 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7f0b3a7a73..46c40b7d4f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -24,6 +24,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            file://0013-target-arm-Fix-vector-operation-segfault.patch \
+           file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
 	   file://CVE-2019-12155.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
new file mode 100644
index 0000000000..f7939b84bf
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
@@ -0,0 +1,339 @@
+From 8104018ba4c66e568d2583a3a0ee940851ee7471 Mon Sep 17 00:00:00 2001
+From: Daniel P. Berrangé <berrange@redhat.com>
+Date: Tue, 23 Jul 2019 17:50:00 +0200
+Subject: [PATCH] linux-user: fix to handle variably sized SIOCGSTAMP with new
+ kernels
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The SIOCGSTAMP symbol was previously defined in the
+asm-generic/sockios.h header file. QEMU sees that header
+indirectly via sys/socket.h
+
+In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
+the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
+Instead it provides only SIOCGSTAMP_OLD, which only uses a
+32-bit time_t on 32-bit architectures.
+
+The linux/sockios.h header then defines SIOCGSTAMP using
+either SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. If
+SIOCGSTAMP_NEW is used, then the tv_sec field is 64-bit even
+on 32-bit architectures
+
+To cope with this we must now convert the old and new type from
+the target to the host one.
+
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+Reviewed-by: Arnd Bergmann <arnd@arndb.de>
+Message-Id: <20190718130641.15294-1-laurent@vivier.eu>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+---
+Uptream-status: Backport (upstream commit: 6d5d5dde9adb5acb32e6b8e3dfbf47fff0f308d2)
+
+ linux-user/ioctls.h        |  21 +++++-
+ linux-user/syscall.c       | 140 +++++++++++++++++++++++++++++--------
+ linux-user/syscall_defs.h  |  30 +++++++-
+ linux-user/syscall_types.h |   6 --
+ 4 files changed, 159 insertions(+), 38 deletions(-)
+
+diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
+index ae8951625f..e6a27ad9d6 100644
+--- a/linux-user/ioctls.h
++++ b/linux-user/ioctls.h
+@@ -219,8 +219,25 @@
+   IOCTL(SIOCGRARP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_arpreq)))
+   IOCTL(SIOCGIWNAME, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_char_ifreq)))
+   IOCTL(SIOCGPGRP, IOC_R, MK_PTR(TYPE_INT)) /* pid_t */
+-  IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
+-  IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
++
++  /*
++   * We can't use IOCTL_SPECIAL() because it will set
++   * host_cmd to XXX_OLD and XXX_NEW and these macros
++   * are not defined with kernel prior to 5.2.
++   * We must set host_cmd to the same value as in target_cmd
++   * otherwise the consistency check in syscall_init()
++   * will trigger an error.
++   * host_cmd is ignored by the do_ioctl_XXX() helpers.
++   * FIXME: create a macro to define this kind of entry
++   */
++  { TARGET_SIOCGSTAMP_OLD, TARGET_SIOCGSTAMP_OLD,
++    "SIOCGSTAMP_OLD", IOC_R, do_ioctl_SIOCGSTAMP },
++  { TARGET_SIOCGSTAMPNS_OLD, TARGET_SIOCGSTAMPNS_OLD,
++    "SIOCGSTAMPNS_OLD", IOC_R, do_ioctl_SIOCGSTAMPNS },
++  { TARGET_SIOCGSTAMP_NEW, TARGET_SIOCGSTAMP_NEW,
++    "SIOCGSTAMP_NEW", IOC_R, do_ioctl_SIOCGSTAMP },
++  { TARGET_SIOCGSTAMPNS_NEW, TARGET_SIOCGSTAMPNS_NEW,
++    "SIOCGSTAMPNS_NEW", IOC_R, do_ioctl_SIOCGSTAMPNS },
+ 
+   IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
+   IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 96cd4bf86d..6df480e13d 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -37,6 +37,7 @@
+ #include <sched.h>
+ #include <sys/timex.h>
+ #include <sys/socket.h>
++#include <linux/sockios.h>
+ #include <sys/un.h>
+ #include <sys/uio.h>
+ #include <poll.h>
+@@ -1139,8 +1140,9 @@ static inline abi_long copy_from_user_timeval(struct timeval *tv,
+ {
+     struct target_timeval *target_tv;
+ 
+-    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 1))
++    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 1)) {
+         return -TARGET_EFAULT;
++    }
+ 
+     __get_user(tv->tv_sec, &target_tv->tv_sec);
+     __get_user(tv->tv_usec, &target_tv->tv_usec);
+@@ -1155,8 +1157,26 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
+ {
+     struct target_timeval *target_tv;
+ 
+-    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0))
++    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0)) {
++        return -TARGET_EFAULT;
++    }
++
++    __put_user(tv->tv_sec, &target_tv->tv_sec);
++    __put_user(tv->tv_usec, &target_tv->tv_usec);
++
++    unlock_user_struct(target_tv, target_tv_addr, 1);
++
++    return 0;
++}
++
++static inline abi_long copy_to_user_timeval64(abi_ulong target_tv_addr,
++                                             const struct timeval *tv)
++{
++    struct target__kernel_sock_timeval *target_tv;
++
++    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0)) {
+         return -TARGET_EFAULT;
++    }
+ 
+     __put_user(tv->tv_sec, &target_tv->tv_sec);
+     __put_user(tv->tv_usec, &target_tv->tv_usec);
+@@ -1166,6 +1186,48 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
+     return 0;
+ }
+ 
++static inline abi_long target_to_host_timespec(struct timespec *host_ts,
++                                               abi_ulong target_addr)
++{
++    struct target_timespec *target_ts;
++
++    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1)) {
++        return -TARGET_EFAULT;
++    }
++    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
++    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
++    unlock_user_struct(target_ts, target_addr, 0);
++    return 0;
++}
++
++static inline abi_long host_to_target_timespec(abi_ulong target_addr,
++                                               struct timespec *host_ts)
++{
++    struct target_timespec *target_ts;
++
++    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0)) {
++        return -TARGET_EFAULT;
++    }
++    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
++    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
++    unlock_user_struct(target_ts, target_addr, 1);
++    return 0;
++}
++
++static inline abi_long host_to_target_timespec64(abi_ulong target_addr,
++                                                 struct timespec *host_ts)
++{
++    struct target__kernel_timespec *target_ts;
++
++    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0)) {
++        return -TARGET_EFAULT;
++    }
++    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
++    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
++    unlock_user_struct(target_ts, target_addr, 1);
++    return 0;
++}
++
+ static inline abi_long copy_from_user_timezone(struct timezone *tz,
+                                                abi_ulong target_tz_addr)
+ {
+@@ -4790,6 +4852,54 @@ static abi_long do_ioctl_kdsigaccept(const IOCTLEntry *ie, uint8_t *buf_temp,
+     return get_errno(safe_ioctl(fd, ie->host_cmd, sig));
+ }
+ 
++static abi_long do_ioctl_SIOCGSTAMP(const IOCTLEntry *ie, uint8_t *buf_temp,
++                                    int fd, int cmd, abi_long arg)
++{
++    struct timeval tv;
++    abi_long ret;
++
++    ret = get_errno(safe_ioctl(fd, SIOCGSTAMP, &tv));
++    if (is_error(ret)) {
++        return ret;
++    }
++
++    if (cmd == (int)TARGET_SIOCGSTAMP_OLD) {
++        if (copy_to_user_timeval(arg, &tv)) {
++            return -TARGET_EFAULT;
++        }
++    } else {
++        if (copy_to_user_timeval64(arg, &tv)) {
++            return -TARGET_EFAULT;
++        }
++    }
++
++    return ret;
++}
++
++static abi_long do_ioctl_SIOCGSTAMPNS(const IOCTLEntry *ie, uint8_t *buf_temp,
++                                      int fd, int cmd, abi_long arg)
++{
++    struct timespec ts;
++    abi_long ret;
++
++    ret = get_errno(safe_ioctl(fd, SIOCGSTAMPNS, &ts));
++    if (is_error(ret)) {
++        return ret;
++    }
++
++    if (cmd == (int)TARGET_SIOCGSTAMPNS_OLD) {
++        if (host_to_target_timespec(arg, &ts)) {
++            return -TARGET_EFAULT;
++        }
++    } else{
++        if (host_to_target_timespec64(arg, &ts)) {
++            return -TARGET_EFAULT;
++        }
++    }
++
++    return ret;
++}
++
+ #ifdef TIOCGPTPEER
+ static abi_long do_ioctl_tiocgptpeer(const IOCTLEntry *ie, uint8_t *buf_temp,
+                                      int fd, int cmd, abi_long arg)
+@@ -6160,32 +6270,6 @@ static inline abi_long target_ftruncate64(void *cpu_env, abi_long arg1,
+ }
+ #endif
+ 
+-static inline abi_long target_to_host_timespec(struct timespec *host_ts,
+-                                               abi_ulong target_addr)
+-{
+-    struct target_timespec *target_ts;
+-
+-    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1))
+-        return -TARGET_EFAULT;
+-    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
+-    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
+-    unlock_user_struct(target_ts, target_addr, 0);
+-    return 0;
+-}
+-
+-static inline abi_long host_to_target_timespec(abi_ulong target_addr,
+-                                               struct timespec *host_ts)
+-{
+-    struct target_timespec *target_ts;
+-
+-    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0))
+-        return -TARGET_EFAULT;
+-    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
+-    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
+-    unlock_user_struct(target_ts, target_addr, 1);
+-    return 0;
+-}
+-
+ static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
+                                                  abi_ulong target_addr)
+ {
+diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
+index 12c8407144..c918419306 100644
+--- a/linux-user/syscall_defs.h
++++ b/linux-user/syscall_defs.h
+@@ -208,16 +208,34 @@ struct target_linger {
+     abi_int l_linger;       /* How long to linger for       */
+ };
+ 
++#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
++struct target_timeval {
++    abi_long tv_sec;
++    abi_int tv_usec;
++};
++#define target__kernel_sock_timeval target_timeval
++#else
+ struct target_timeval {
+     abi_long tv_sec;
+     abi_long tv_usec;
+ };
+ 
++struct target__kernel_sock_timeval {
++    abi_llong tv_sec;
++    abi_llong tv_usec;
++};
++#endif
++
+ struct target_timespec {
+     abi_long tv_sec;
+     abi_long tv_nsec;
+ };
+ 
++struct target__kernel_timespec {
++    abi_llong tv_sec;
++    abi_llong tv_nsec;
++};
++
+ struct target_timezone {
+     abi_int tz_minuteswest;
+     abi_int tz_dsttime;
+@@ -743,8 +761,16 @@ struct target_pollfd {
+ #define TARGET_SIOCATMARK      0x8905
+ #define TARGET_SIOCGPGRP       0x8904
+ #endif
+-#define TARGET_SIOCGSTAMP      0x8906          /* Get stamp (timeval) */
+-#define TARGET_SIOCGSTAMPNS    0x8907          /* Get stamp (timespec) */
++#if defined(TARGET_SH4)
++#define TARGET_SIOCGSTAMP_OLD   TARGET_IOR('s', 100, struct target_timeval)
++#define TARGET_SIOCGSTAMPNS_OLD TARGET_IOR('s', 101, struct target_timespec)
++#else
++#define TARGET_SIOCGSTAMP_OLD   0x8906
++#define TARGET_SIOCGSTAMPNS_OLD 0x8907
++#endif
++
++#define TARGET_SIOCGSTAMP_NEW   TARGET_IOR(0x89, 0x06, abi_llong[2])
++#define TARGET_SIOCGSTAMPNS_NEW TARGET_IOR(0x89, 0x07, abi_llong[2])
+ 
+ /* Networking ioctls */
+ #define TARGET_SIOCADDRT       0x890B          /* add routing table entry */
+diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
+index b98a23b0f1..4e36983826 100644
+--- a/linux-user/syscall_types.h
++++ b/linux-user/syscall_types.h
+@@ -14,12 +14,6 @@ STRUCT(serial_icounter_struct,
+ STRUCT(sockaddr,
+        TYPE_SHORT, MK_ARRAY(TYPE_CHAR, 14))
+ 
+-STRUCT(timeval,
+-       MK_ARRAY(TYPE_LONG, 2))
+-
+-STRUCT(timespec,
+-       MK_ARRAY(TYPE_LONG, 2))
+-
+ STRUCT(rtentry,
+        TYPE_ULONG, MK_STRUCT(STRUCT_sockaddr), MK_STRUCT(STRUCT_sockaddr), MK_STRUCT(STRUCT_sockaddr),
+        TYPE_SHORT, TYPE_SHORT, TYPE_ULONG, TYPE_PTRVOID, TYPE_SHORT, TYPE_PTRVOID,
+-- 
+2.21.0
+
-- 
2.21.0


