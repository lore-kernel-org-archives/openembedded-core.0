Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.4725.1604009370639425008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 15:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dWhuHTlr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id p17so1948748pli.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=J95cb0/NPyyyhmKkpmZwIVRTz5fmxuWhl9zJhk06C6A=;
        b=dWhuHTlrZ/vCny+wdLbke0WgUOF+fiqzpTeCgrhrQu9smSP1NIKijb/pKtlWmiA4/2
         c+vDaW5nt38mZkuttJfLmVsU3l5DNNI+zkP7Q39aRrsuWmrmpaerKzoNG689h1Hj3h/j
         Aa3yR39cDyFH/MrUY3TZ4DU2rwoxgbH3tX7cdf5nye1jm5X2Z48FX85QfbpPv97ZzrJu
         Cd+v+b8H/rDPsAApMCYEmaDxkc6m7k9Kmta7nTAtg+4MeERRFCozchfOw4PkAqtOdQ/V
         QcZSIWx4WPWTM7LNf2KT5q3vqYIjaclAaHqobJWVPYvObHRErun4x6wfUnAkqIpBREVw
         0PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=J95cb0/NPyyyhmKkpmZwIVRTz5fmxuWhl9zJhk06C6A=;
        b=SPpOEKxEHyxZ9dQaMRRzfIjxnDK73AIEKZZFjA7p3R4+5mzuyDQKXF/qNh5mj9ETy3
         uLxt/6AIo7SE81iJAUjyilU6xjJ9jPRiS1Ks3zW9KQBpNeVGRWlgLP/e2lkS+Qrp2kDA
         r55gVu2QYxmkHhds3hKEcmOn/dRYBpGof9JcMsx67SaEWsLPqOGWwYwNENVYPX+ytMZD
         Wfv9TXbsEJQVk5kTC9GjvrIGlJU0KNw+vv9ULqUFvFIZPSkPkindG8tmUqaSi390V8h/
         nhxtxucGXZVUVVOOz8GxXTf+oGsQ0HXWEzQl+rpZAPnQO5nKEmMo40aXGhD0HuU6Hh14
         Uu4Q==
X-Gm-Message-State: AOAM533u9cq0uTAH77Pc9JyPD2w2E2MbgdDI1l1pChSft/TKjptrCzB3
	aUEbJ7iaAsFJsTs7vtJzSvblnpmxXE7d+Fzj
X-Google-Smtp-Source: ABdhPJzD0ktGT4Mwccny4VQoMzaa9jliBjr+d7UNw7zCrvmiDob+hrCqwl7vipVTVHKpNd0pOR3dlQ==
X-Received: by 2002:a17:902:7249:b029:d6:4d:7d82 with SMTP id c9-20020a1709027249b02900d6004d7d82mr6139917pll.74.1604009369527;
        Thu, 29 Oct 2020 15:09:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e20sm3643638pfi.30.2020.10.29.15.09.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 15:09:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/2] qemu: fix CVE-2019-20175
Date: Thu, 29 Oct 2020 12:09:08 -1000
Message-Id: <16a293ec1707aeffba602e8453b1afb9c8f8f211.1604009130.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604009130.git.steve@sakoman.com>
References: <cover.1604009130.git.steve@sakoman.com>

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2019-20175.patch            | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-20175.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 76f97eef35..b6941403ea 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -49,6 +49,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-14415.patch \
 	   file://CVE-2020-16092.patch \
 	   file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
+	   file://CVE-2019-20175.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-20175.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-20175.patch
new file mode 100644
index 0000000000..cbbb6d094c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-20175.patch
@@ -0,0 +1,94 @@
+From ed78352a59ea7acf7520d4d47a96b9911bae7fc3 Mon Sep 17 00:00:00 2001
+From: Alexander Popov <alex.popov@linux.com>
+Date: Mon, 23 Dec 2019 20:51:16 +0300
+Subject: [PATCH] ide: Fix incorrect handling of some PRDTs in ide_dma_cb()
+
+The commit a718978ed58a from July 2015 introduced the assertion which
+implies that the size of successful DMA transfers handled in ide_dma_cb()
+should be multiple of 512 (the size of a sector). But guest systems can
+initiate DMA transfers that don't fit this requirement.
+
+For fixing that let's check the number of bytes prepared for the transfer
+by the prepare_buf() handler. The code in ide_dma_cb() must behave
+according to the Programming Interface for Bus Master IDE Controller
+(Revision 1.0 5/16/94):
+1. If PRDs specified a smaller size than the IDE transfer
+   size, then the Interrupt and Active bits in the Controller
+   status register are not set (Error Condition).
+2. If the size of the physical memory regions was equal to
+   the IDE device transfer size, the Interrupt bit in the
+   Controller status register is set to 1, Active bit is set to 0.
+3. If PRDs specified a larger size than the IDE transfer size,
+   the Interrupt and Active bits in the Controller status register
+   are both set to 1.
+
+Signed-off-by: Alexander Popov <alex.popov@linux.com>
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Message-id: 20191223175117.508990-2-alex.popov@linux.com
+Signed-off-by: John Snow <jsnow@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2019-20175
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ hw/ide/core.c | 30 ++++++++++++++++++++++--------
+ 1 file changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/hw/ide/core.c b/hw/ide/core.c
+index 754ff4dc343..80000eb7661 100644
+--- a/hw/ide/core.c
++++ b/hw/ide/core.c
+@@ -849,6 +849,7 @@ static void ide_dma_cb(void *opaque, int ret)
+     int64_t sector_num;
+     uint64_t offset;
+     bool stay_active = false;
++    int32_t prep_size = 0;
+ 
+     if (ret == -EINVAL) {
+         ide_dma_error(s);
+@@ -863,13 +864,15 @@ static void ide_dma_cb(void *opaque, int ret)
+         }
+     }
+ 
+-    n = s->io_buffer_size >> 9;
+-    if (n > s->nsector) {
+-        /* The PRDs were longer than needed for this request. Shorten them so
+-         * we don't get a negative remainder. The Active bit must remain set
+-         * after the request completes. */
++    if (s->io_buffer_size > s->nsector * 512) {
++        /*
++         * The PRDs were longer than needed for this request.
++         * The Active bit must remain set after the request completes.
++         */
+         n = s->nsector;
+         stay_active = true;
++    } else {
++        n = s->io_buffer_size >> 9;
+     }
+ 
+     sector_num = ide_get_sector(s);
+@@ -892,9 +895,20 @@ static void ide_dma_cb(void *opaque, int ret)
+     n = s->nsector;
+     s->io_buffer_index = 0;
+     s->io_buffer_size = n * 512;
+-    if (s->bus->dma->ops->prepare_buf(s->bus->dma, s->io_buffer_size) < 512) {
+-        /* The PRDs were too short. Reset the Active bit, but don't raise an
+-         * interrupt. */
++    prep_size = s->bus->dma->ops->prepare_buf(s->bus->dma, s->io_buffer_size);
++    /* prepare_buf() must succeed and respect the limit */
++    assert(prep_size >= 0 && prep_size <= n * 512);
++
++    /*
++     * Now prep_size stores the number of bytes in the sglist, and
++     * s->io_buffer_size stores the number of bytes described by the PRDs.
++     */
++
++    if (prep_size < n * 512) {
++        /*
++         * The PRDs are too short for this request. Error condition!
++         * Reset the Active bit and don't raise the interrupt.
++         */
+         s->status = READY_STAT | SEEK_STAT;
+         dma_buf_commit(s, 0);
+         goto eot;
-- 
2.17.1

