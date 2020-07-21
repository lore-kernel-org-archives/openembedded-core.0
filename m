Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.21991.1595346499191017645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 08:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=cDOnskJx;
 spf=pass (domain: burtonini.com, ip: 209.85.221.66, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f66.google.com with SMTP id z2so21728418wrp.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QjEvbXBV6qiuPv/n/MHH/uA2OfHrE7Y3TDpsN9ks8p4=;
        b=cDOnskJxRrrhN/tSzb+muCsRcyVL5jvZU+Xtu5e/xLmNHkwI5BBRhrNB2Jx25batNP
         NZujjaWXWXPp/OaIestbQtw4MVd3apb6b6QWI/p32uyaklAc6jZban/8fBA9SO/Mf7gB
         0u0fJf51hWY0Sb+u30LzjVi9F4OYpXos2yyFojYJ3Avwh3Fgk3h4EOrTgZvdhrKIpsBH
         nuwFYLO6hmCVAoF1jBm27+H2ZOhvB56Xg5Q3uMjY40FvYF9UcMzmRgbkesPLGugGV08/
         kS+pDa07Zzu43MEd/phBJgKh5YHAd+xpPGPXHA87aLe8V06IYw7nssR0NCS6fC/Mf2m3
         Bluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QjEvbXBV6qiuPv/n/MHH/uA2OfHrE7Y3TDpsN9ks8p4=;
        b=nTl1B7SfgvAc1TTGgiqGBfZNB6UkvAKCdqQZFt1jBDiqzm1mV/ITJek1bnfA4PH6qQ
         7JHExf9mvorNnnmEvL5hpZprMvwb2pMa9bqcWZFKsboK/YguEEIiREHTsTBYSJs588Eu
         sIubfcskPZFvju4dWWTquGW1/eZDeFPTxDqiYhY8HrgwkQOKx8AN/NNxqaxicTlWQ2zx
         uAkf2Kq1hUbKLQnLhyRPQP01MhSYgYzM+isUPqPhO+C0frtCpUo5i4DCzvYVaJJju5c6
         Hp4+HrvD/2ypa9Hr2iz85U1AaXYhskPVlxMfXTnmfbFt5IDFyRYCEpUZHQSRVkAAcwJn
         KL6g==
X-Gm-Message-State: AOAM533JMTjIgOcuvITk4O2ONRFj5Ml3iGmbRYrx32YaIzTzhx1RvEKx
	9R9rNSSURrCmW67cbN9Vlu1N038y0JA=
X-Google-Smtp-Source: ABdhPJxX3Ytchd2x4Gi04YEdYuhqMfe9xTpLkL/jKQi6JdQ8+AdcKAtd6Tyn+HUVoQW0WP+Hnz+szg==
X-Received: by 2002:adf:e6c1:: with SMTP id y1mr29204762wrm.116.1595346497218;
        Tue, 21 Jul 2020 08:48:17 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id w14sm37352952wrt.55.2020.07.21.08.48.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:48:16 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] startup-notification: add time_t type mismatch patch from upstream
Date: Tue, 21 Jul 2020 16:48:15 +0100
Message-Id: <20200721154815.3846936-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Backport a patch to fix issues where sizeof(time_t) != sizeof(long).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../startup-notification-0.12/time_t.patch    | 108 ++++++++++++++++++
 .../startup-notification_0.12.bb              |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-graphics/startup-notification/startup-notification-0.12/time_t.patch

diff --git a/meta/recipes-graphics/startup-notification/startup-notification-0.12/time_t.patch b/meta/recipes-graphics/startup-notification/startup-notification-0.12/time_t.patch
new file mode 100644
index 0000000000..e5dff007d4
--- /dev/null
+++ b/meta/recipes-graphics/startup-notification/startup-notification-0.12/time_t.patch
@@ -0,0 +1,108 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a7e49fefde18ea8d5bada8096d32f23bcfb5a6dc Mon Sep 17 00:00:00 2001
+From: "Federico G. Schwindt" <fgsch@openbsd.org>
+Date: Mon, 17 Feb 2014 15:48:12 +0100
+Subject: [PATCH 1/3] Fix crash on 32bit architectures where time_t is 64 bit
+
+This is an ABI change on platforms where sizeof(time_t) doesn't equal
+sizeof(long). For most platforms this change shouldn't make a difference
+at present. OpenBSD recently switched to 64bit time_t on all architectures
+to avoid time_t overflow in 2038 on 32bit machines.
+
+This fix extends to consumers of startup-notification, for instance
+the window manager of XFCE, which is how I got involved in this.
+See http://mail.xfce.org/pipermail/xfce4-dev/2014-February/030611.html
+and follow-ups. The XFCE devs pointed out that my patch to fix a
+crash in XFCE's window manager depends on this startup-notification patch.
+
+Signed-off-by: Julien Danjou <julien@danjou.info>
+---
+ libsn/sn-monitor.c | 8 ++++----
+ libsn/sn-monitor.h | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/libsn/sn-monitor.c b/libsn/sn-monitor.c
+index 2a9ad16..f419bc1 100644
+--- a/libsn/sn-monitor.c
++++ b/libsn/sn-monitor.c
+@@ -364,8 +364,8 @@ sn_startup_sequence_get_screen (SnStartupSequence *sequence)
+  **/
+ void
+ sn_startup_sequence_get_initiated_time (SnStartupSequence *sequence,
+-                                        long              *tv_sec,
+-                                        long              *tv_usec)
++                                        time_t            *tv_sec,
++                                        suseconds_t       *tv_usec)
+ {
+   if (tv_sec)
+     *tv_sec = sequence->initiation_time.tv_sec;
+@@ -386,8 +386,8 @@ sn_startup_sequence_get_initiated_time (SnStartupSequence *sequence,
+  **/
+ void
+ sn_startup_sequence_get_last_active_time (SnStartupSequence *sequence,
+-                                          long              *tv_sec,
+-                                          long              *tv_usec)
++                                          time_t            *tv_sec,
++                                          suseconds_t       *tv_usec)
+ {
+   /* for now the same as get_initiated_time */
+   if (tv_sec)
+diff --git a/libsn/sn-monitor.h b/libsn/sn-monitor.h
+index b58581f..2f639df 100644
+--- a/libsn/sn-monitor.h
++++ b/libsn/sn-monitor.h
+@@ -77,11 +77,11 @@ const char* sn_startup_sequence_get_application_id        (SnStartupSequence *se
+ int         sn_startup_sequence_get_screen                (SnStartupSequence *sequence);
+ 
+ void        sn_startup_sequence_get_initiated_time        (SnStartupSequence *sequence,
+-                                                           long              *tv_sec,
+-                                                           long              *tv_usec);
++                                                           time_t            *tv_sec,
++                                                           suseconds_t       *tv_usec);
+ void        sn_startup_sequence_get_last_active_time      (SnStartupSequence *sequence,
+-                                                           long              *tv_sec,
+-                                                           long              *tv_usec);
++                                                           time_t            *tv_sec,
++                                                           suseconds_t       *tv_usec);
+ 
+ void        sn_startup_sequence_complete                  (SnStartupSequence *sequence);
+ 
+-- 
+2.26.2
+
+From ea9f7e4cc6fd8c08d175ed7774ed2c5bd11c8ef0 Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Mon, 17 Feb 2014 14:37:09 -0500
+Subject: [PATCH 2/3] Add include of <sys/select.h> for previous patch
+
+Unfortunately while the standard says that <sys/types.h> is the
+correct header to get suseconds_t, at least with glibc, that requires
+-DXOPEN_SOURCE.  Which is problematic for a public header, because
+then all *users* of startup-notification will be required to define
+that.
+
+Poking around a bit, it looks like at least with glibc, <sys/select.h>
+will give us an unconditional define.
+
+Signed-off-by: Julien Danjou <julien@danjou.info>
+---
+ libsn/sn-monitor.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsn/sn-monitor.h b/libsn/sn-monitor.h
+index 2f639df..cea4e12 100644
+--- a/libsn/sn-monitor.h
++++ b/libsn/sn-monitor.h
+@@ -28,6 +28,7 @@
+ #define __SN_MONITOR_H__
+ 
+ #include <libsn/sn-common.h>
++#include <sys/select.h>
+ 
+ SN_BEGIN_DECLS
+ 
+-- 
+2.26.2
+
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index a26ab44fa7..d10bddb529 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -23,6 +23,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/${BPN}-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
+           file://time_t.patch \
 "
 
 SRC_URI[md5sum] = "2cd77326d4dcaed9a5a23a1232fb38e9"
-- 
2.26.2

