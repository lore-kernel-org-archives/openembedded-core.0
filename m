Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.372.1592848806887276093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=W48SYPev;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id g5so13793276otg.6
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Jc2uE+bt9k8FYTZue7024I6tTJMY0ZEPPXLzudckIHQ=;
        b=W48SYPevTUz18LZpDQ2A8I53aWmdN8sLdynyUUYNRKIUZEyxLQ1BogYEJhqiPka/NR
         +tEMlmoD2m7tZC6eJByfLz013aEQKJd4UIR11CxolEsI6j6oWsZtbaNqE3Ar4UWhNh58
         0k1SDBZRHFFJzVBDCVvQjnKy2p55ERL/rvoj5UXAQ1J5nAhqlzFeBG+03gjim/DJd+pX
         h6Z+tbgtrnkzQ+5Xfx6YhoN3zTm9HGjpP68K9Ro5EbA+BFDK1Dt3jNG6HO3xxMejxvCa
         9BL9VjcOh69zSk7ccbmc99CeZa+GZwZ3IsP+7nPAPWx5fvGIeTLs9b25hkHHGV4dEVzP
         2N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Jc2uE+bt9k8FYTZue7024I6tTJMY0ZEPPXLzudckIHQ=;
        b=a7368u4RKae7UbaBJdNl45jeJm9eRkuGPQnyhgX0184HQPEhBRbu7QxdSmuvdAHfXy
         LU3AO0K/y6YWHYWMt9ornkcW/498mkZqydjhqocxbsLIsn1rTm4FRBpZdqSY8dWfvCEN
         v4pJdMGT6LG9kb42DNLVD7s/T378Q1lJYjRJMlOoMSJkU7kTFBewCEh2oeu53HnUoIQF
         GBJurR1r3sRp3CpQdwkJgmHt02qcK8vDBAjdykeBS8cYDvUuO8fQ5hqOsYyMx2UZfoR2
         iWgvsVjqE//Dv25tfRwuEZFMlYW1mM+2EaOtz8QVmTgGUaykYbCIPssNQp0AaitH/8CZ
         W3Lg==
X-Gm-Message-State: AOAM531oiBXrXKqSWjERVUCY9L7UKq5qcwdIT6no/X6mYfa0fcahMByn
	F91pdaz/lU80LiKBeKlncntHSvAD4YgY+Q==
X-Google-Smtp-Source: ABdhPJyNicZG1dIHLUSvNcxk1dYh1R2ja8hGxgqu7ouIOiv/Q/HJtQtB2BjM6KQH7ofwXdXr+dDBHw==
X-Received: by 2002:a9d:3c8:: with SMTP id f66mr15636960otf.273.1592848805714;
        Mon, 22 Jun 2020 11:00:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/33] qemu: fix CVE-2020-13361
Date: Mon, 22 Jun 2020 07:58:03 -1000
Message-Id: <0e4985236dd7d2e92576fb30b70bc434a7ecd367.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2dcef5dfb5c4c57fd793d04ac936a9ff73aae844)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13361.patch            | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 126e7d442c..3e5006937b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://CVE-2020-11102.patch \
 	   file://CVE-2020-11869.patch \
+	   file://CVE-2020-13361.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
new file mode 100644
index 0000000000..e0acc70f3c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
@@ -0,0 +1,61 @@
+From 369ff955a8497988d079c4e3fa1e93c2570c1c69 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Fri, 15 May 2020 01:36:08 +0530
+Subject: [PATCH] es1370: check total frame count against current frame
+
+A guest user may set channel frame count via es1370_write()
+such that, in es1370_transfer_audio(), total frame count
+'size' is lesser than the number of frames that are processed
+'cnt'.
+
+    int cnt = d->frame_cnt >> 16;
+    int size = d->frame_cnt & 0xffff;
+
+if (size < cnt), it results in incorrect calculations leading
+to OOB access issue(s). Add check to avoid it.
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20200514200608.1744203-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg03983.html]
+CVE: CVE-2020-13361
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/audio/es1370.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
+index 89c4dabcd44..5f8a83ff562 100644
+--- a/hw/audio/es1370.c
++++ b/hw/audio/es1370.c
+@@ -643,6 +643,9 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
+     int csc_bytes = (csc + 1) << d->shift;
+     int cnt = d->frame_cnt >> 16;
+     int size = d->frame_cnt & 0xffff;
++    if (size < cnt) {
++        return;
++    }
+     int left = ((size - cnt + 1) << 2) + d->leftover;
+     int transferred = 0;
+     int temp = MIN (max, MIN (left, csc_bytes));
+@@ -651,7 +654,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
+     addr += (cnt << 2) + d->leftover;
+ 
+     if (index == ADC_CHANNEL) {
+-        while (temp) {
++        while (temp > 0) {
+             int acquired, to_copy;
+ 
+             to_copy = MIN ((size_t) temp, sizeof (tmpbuf));
+@@ -669,7 +672,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
+     else {
+         SWVoiceOut *voice = s->dac_voice[index];
+ 
+-        while (temp) {
++        while (temp > 0) {
+             int copied, to_copy;
+ 
+             to_copy = MIN ((size_t) temp, sizeof (tmpbuf));
-- 
2.17.1

