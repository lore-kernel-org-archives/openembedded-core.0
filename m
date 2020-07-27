Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.57652.1595862645389780867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NyANbQ85;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id b9so8145929plx.6
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8XM8jzQl9K6SGZvAri/ks0pdMcZG30TgiK5ychYNRhc=;
        b=NyANbQ85CfRywNVAiWIMEXpovhpTrzAllH+4nYGon5KRWgqxfXIW8cZhE50fG0yqAm
         ikfwq0rTzEE3mfqKWr2EYr0TSv4/ZAIWnL0I7cKkBlWibLAoxNS08mt0D+5rlmYnYciO
         ZHifIL8cDRV3PPm/qQV/i+2E/SYAcvYmxXd6pvRZwgrDYDtB4VXMwg/NfoyLTy8vDG3R
         aLRcIsTtVc10ehzMZnBtTG+UMv1bPsE3AW1PJo8B+f1jdqK+o+mdRqa8T5xZosO12Loy
         ZxxxkMqyaf9vosFdNCQQuqgbMz2JPVRGKMXSHZqcyqxJjBJoBV0oxnUk0JxT+1ZL8Hf7
         MEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8XM8jzQl9K6SGZvAri/ks0pdMcZG30TgiK5ychYNRhc=;
        b=c4tiIg7BKopO2hIt2leMWcmrDeMyFEaTHyXd8Kar4nidiobBnTY/wOfE6sn4Cny+0q
         4AW72X+G5D/bPzo1YVzA2QMjy3zPcUkK4Y9F08P4nFdNHKTZB85mrUn16bPg/uDYnr07
         cMuA0MFSyjUTxi593zEoqgPDE1HqZa/AGAKUXEgCfOo8+CSyHhU52gWVVGWCb3/eBpfC
         vSKRTex8ybcsSaupFlvY7hX5BmSkoHI2uihPYFA2uk4TO1fOCI7Ry9J3eoYNPB4tEAYz
         UgHkuWq8MsL3jQxJaK0T0EroMr6QeRTHVLMLuhBCLbG+1zoo2r5zgvOa1UEezu8+MyE4
         w7DQ==
X-Gm-Message-State: AOAM530cv+OtS0UxPwq/zSMeo4hyltXQ9KVM/trOa4w5y2FBKegTU71E
	XfEN2K2QcOOZXjDLfHCbxxX//8fe/TM=
X-Google-Smtp-Source: ABdhPJw4z10v2euauXJKnbUW1rRp621I4shpLPe/VQhbFUvMTk/pyh48kOoAj/GMnqZFIFlA1DUi1Q==
X-Received: by 2002:a17:90a:1387:: with SMTP id i7mr19970517pja.3.1595862644143;
        Mon, 27 Jul 2020 08:10:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/18] startup-notification: add time_t type mismatch patch from upstream
Date: Mon, 27 Jul 2020 05:09:52 -1000
Message-Id: <0590fbf6d76e1d0c4601529884c4c171be6e27af.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

Backport a patch to fix issues where sizeof(time_t) != sizeof(long).

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f9c3a6d74765e636a8038fe3aaa5dfc8b550590a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

