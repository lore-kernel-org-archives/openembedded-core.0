Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.10734.1600167361220408305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 03:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fq4puFz0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id a9so2985302wmm.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 03:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdIJxrA/eZB/6w/SVPC2PsuD7lK+ggUl5cWKnMDrb1k=;
        b=fq4puFz0xsE8i55/32CwAlzxmGmPSs2nicbLIfeZJFwQYyLA31Zs0qaXUoTCFb+pm8
         wg8xd4l9l3u1RZz3ERBgW2Cxn83JUPDk8xM4KKTTeO77isLK97b8TSZQk357pcoU6xtc
         ibb09Qxhd8yOvFnOJhwpikPFRrdKKWPYuCF2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdIJxrA/eZB/6w/SVPC2PsuD7lK+ggUl5cWKnMDrb1k=;
        b=SP/eok41CkhyG2YQvURG7PKRAIYCFS9DDo4YWVY1sBwkc3jf3adGwIYbktR8DAcY3F
         1z3nCgpfsB9NJmqM1W7c3EKEHtHgAuFxI5TGDgCEowZoFPbjhp9dGgHcxNSwI70lwfRr
         A/eYR1sF9QdsnyDVzDBDyWR6uCaM/Ejso1YRk1ALYHZOVJqWye7Itcr0m31ZbANSfHGB
         Zt8IDZ6kqg52Ac0Yj7CLuwIETTneouezC+RHWsekIARDz+DYSGeHKqZdNA4Ldt2Zudu9
         TG2MmSZ/mgPXn9YL8x1LKW3h+xN8ZMUq4nNi4oUaqTcv0O6/kFru2ItWY5bUmbqR6MbS
         haBw==
X-Gm-Message-State: AOAM5335XG5I1onfitIErqY6yc1NMhEU8TG9TeIS/RBrh/vpho5XmkGy
	z0cezFKJJWd/rkxCd6BBoqThnsq3hVoAMA==
X-Google-Smtp-Source: ABdhPJyn940uX+XIViatbd3D5nhbBGhshk0jLzJnUaKBcT8q0ikFu0xKZA2Q/drbvYrkI4VARm6gsg==
X-Received: by 2002:a7b:cd08:: with SMTP id f8mr4058053wmj.124.1600167359172;
        Tue, 15 Sep 2020 03:55:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id i3sm25805694wrs.4.2020.09.15.03.55.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 03:55:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] Revert "qemu: always define unknown_lock_type"
Date: Tue, 15 Sep 2020 11:55:56 +0100
Message-Id: <20200915105557.2211949-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e442924d9ac4e202aec571b5d26bb959b5faaadd.

This was rejected upstream and its been pointed out qemu doesn't work
without optimization.

Instead we should just error if the user attempts to build it without
optimization.
---
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 ...le.h-always-define-unknown_lock_type.patch | 48 -------------------
 meta/recipes-devtools/qemu/qemu_5.1.0.bb      |  5 ++
 3 files changed, 6 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-lockable.h-always-define-unknown_lock_type.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7f7f3b59fcb..9091115caf6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,8 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://find_datadir.patch \
            file://usb-fix-setup_len-init.patch \
-	   file://0001-lockable.h-always-define-unknown_lock_type.patch \
-	   "
+           "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[sha256sum] = "c9174eb5933d9eb5e61f541cd6d1184cd3118dfe4c5c4955bc1bdc4d390fa4e5"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-lockable.h-always-define-unknown_lock_type.patch b/meta/recipes-devtools/qemu/qemu/0001-lockable.h-always-define-unknown_lock_type.patch
deleted file mode 100644
index 2f51799bc96..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-lockable.h-always-define-unknown_lock_type.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8c234bb39eb293a44ca58e15303a359bb782931f Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 9 Sep 2020 08:41:27 +0000
-Subject: [PATCH] lockable.h: always define unknown_lock_type
-
-There comes below build failure when use gcc 10.1.0 and
-"-Og" passed to compiler.
- | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:25: undefined reference to `unknown_lock_type'
- | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o: in function `fsdev_co_throttle_request':
- | /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: undefined reference to `unknown_lock_type'
- | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o:/mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: more undefined references to `unknown_lock_type' follow
- | collect2: error: ld returned 1 exit status
-
-So always define unknown_lock_type to fix the above error.
-
-Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- include/qemu/lockable.h | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
-index b620023141..e792ed9a69 100644
---- a/include/qemu/lockable.h
-+++ b/include/qemu/lockable.h
-@@ -25,17 +25,12 @@ struct QemuLockable {
- };
- 
- /* This function gives an error if an invalid, non-NULL pointer type is passed
-- * to QEMU_MAKE_LOCKABLE.  For optimized builds, we can rely on dead-code elimination
-- * from the compiler, and give the errors already at link time.
-+ * to QEMU_MAKE_LOCKABLE.
-  */
--#if defined(__OPTIMIZE__) && !defined(__SANITIZE_ADDRESS__)
--void unknown_lock_type(void *);
--#else
- static inline void unknown_lock_type(void *unused)
- {
-     abort();
- }
--#endif
- 
- static inline __attribute__((__always_inline__)) QemuLockable *
- qemu_make_lockable(void *x, QemuLockable *lockable)
--- 
-2.26.2
-
diff --git a/meta/recipes-devtools/qemu/qemu_5.1.0.bb b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
index a4018cc4485..9b094902693 100644
--- a/meta/recipes-devtools/qemu/qemu_5.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
@@ -10,6 +10,11 @@ DEPENDS = "glib-2.0 zlib pixman bison-native"
 
 RDEPENDS_${PN}_class-target += "bash"
 
+# Does not compile for -Og because that level does not clean up dead-code.
+# See lockable.h.
+#
+DEBUG_BUILD = "0"
+
 EXTRA_OECONF_append_class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF_append_class-target_mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
 EXTRA_OECONF_append_class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
-- 
2.25.1

