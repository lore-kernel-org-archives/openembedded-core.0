Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.8247.1620831468555941019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QVQg01uR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso20793336otg.9
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HjjDc3SROjGkqpI0mx1KWBsfnzHgq1Vhb+KkAC28RHY=;
        b=QVQg01uRUPj6tr5J8SCnQvyF7C+v+12TpvMxUv57AV1REex3He0A1LrLRDnIM6YNRY
         IAibqIeWCSgovGgSW1NbLeHge+uz62WkWJjdXw+f7FsfGhKa0uyQJzzW7e+0yGL66kLR
         a9kQaVsh4bPY7nnVVL00WVrnQ3QHqdICPPumfS293Bmoo9UtmrdbDGeb5ek3W+doGibx
         I/Z12KT7DlT+8+5EJDHhq0za7GYjDgL/E2fBCjGpFcl0oP8W4JQIaBkB1uHRmN2R4uvU
         wGoPIKUJArLZU2erfZqAARTb3zgoX6O1ZX/JE3xj0h8u9qasmjMQr7EXiz6DSLBVYi63
         8vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HjjDc3SROjGkqpI0mx1KWBsfnzHgq1Vhb+KkAC28RHY=;
        b=slyVpqUR2oJaSmFQp1BTe3GAqUtLHIOGP91ZAxTWEmx3DN3H5eFF0W8skNJcAfMFnx
         Ad1Te4oDbPJ4TwfNTWcBeY8PVwn0EPYSJEckAaNy7pboZ6yy8s/J/FfmJt25XDUc/fSg
         N2ixsXPKQ5W4pG31PGEfeRRLaXfoJrtbUfewyUHj+EgqpgUvVzqUUV7+NW743ju20TNK
         QC4ZykYgkQhn6fazt4qaKWVRw+xDF4WuYq5ph2rHVxjiyTTgxa7qZlzAniTsVR85+qTY
         v7TQytwxDYv9NXRI6WQDhoHOn+QIeGEqyC38MIi2XxQCf3JbX2VG2C0tBUDO5QozZF1f
         RyYQ==
X-Gm-Message-State: AOAM530SuRaQVWpoV+4X79i5P+mB1sFLq1GcLVEP8tLN5wA71EdbxNTM
	ZFvgoJTMJkQvq1Bi2GHp8qUZT92Y24yA5ggu1ts=
X-Google-Smtp-Source: ABdhPJwF5kLSYnX6br2l26GXHvSeQ+9hBnVdOMg231exjVFIuAnM/Vy8TVb+AApq5V1KDHBLDxxkYg==
X-Received: by 2002:a05:6830:1205:: with SMTP id r5mr5226910otp.359.1620831467459;
        Wed, 12 May 2021 07:57:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.57.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:57:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/22] qemu: fix CVE-2021-3392
Date: Wed, 12 May 2021 04:56:41 -1000
Message-Id: <59d7473be278f477e93484d97392a3557da34d5d.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3392.patch             | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5e8d3e09ff..7647e44726 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,6 +54,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-24352.patch \
 	   file://CVE-2020-25723.patch \
 	   file://CVE-2021-20203.patch \
+	   file://CVE-2021-3392.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
new file mode 100644
index 0000000000..45b8a4f1dd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
@@ -0,0 +1,92 @@
+From 3791642c8d60029adf9b00bcb4e34d7d8a1aea4d Mon Sep 17 00:00:00 2001
+From: Michael Tokarev <mjt@tls.msk.ru>
+Date: Mon, 19 Apr 2021 15:42:47 +0200
+Subject: [PATCH] mptsas: Remove unused MPTSASState 'pending' field
+ (CVE-2021-3392)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
+the Megaraid emulator appends new MPTSASRequest object 'req' to
+the 's->pending' queue. In case of an error, this same object gets
+dequeued in mptsas_free_request() only if SCSIRequest object
+'req->sreq' is initialised. This may lead to a use-after-free issue.
+
+Since s->pending is actually not used, simply remove it from
+MPTSASState.
+
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Reviewed-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
+Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
+Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
+Message-id: 20210419134247.1467982-1-f4bug@amsat.org
+Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
+Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
+Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
+BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
+Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
+[PMD: Reworded description, added more tags]
+Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport [ https://git.qemu.org/?p=qemu.git;a=commit;h=3791642c8d60029adf9b00bcb4e34d7d8a1aea4d ]
+CVE: CVE-2021-3392
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/scsi/mptsas.c | 6 ------
+ hw/scsi/mptsas.h | 1 -
+ 2 files changed, 7 deletions(-)
+
+diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
+index 7416e78..db3219e 100644
+--- a/hw/scsi/mptsas.c
++++ b/hw/scsi/mptsas.c
+@@ -251,13 +251,10 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
+ 
+ static void mptsas_free_request(MPTSASRequest *req)
+ {
+-    MPTSASState *s = req->dev;
+-
+     if (req->sreq != NULL) {
+         req->sreq->hba_private = NULL;
+         scsi_req_unref(req->sreq);
+         req->sreq = NULL;
+-        QTAILQ_REMOVE(&s->pending, req, next);
+     }
+     qemu_sglist_destroy(&req->qsg);
+     g_free(req);
+@@ -303,7 +300,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
+     }
+ 
+     req = g_new0(MPTSASRequest, 1);
+-    QTAILQ_INSERT_TAIL(&s->pending, req, next);
+     req->scsi_io = *scsi_io;
+     req->dev = s;
+ 
+@@ -1319,8 +1315,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
+ 
+     s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
+ 
+-    QTAILQ_INIT(&s->pending);
+-
+     scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
+ }
+ 
+diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
+index b85ac1a..c046497 100644
+--- a/hw/scsi/mptsas.h
++++ b/hw/scsi/mptsas.h
+@@ -79,7 +79,6 @@ struct MPTSASState {
+     uint16_t reply_frame_size;
+ 
+     SCSIBus bus;
+-    QTAILQ_HEAD(, MPTSASRequest) pending;
+ };
+ 
+ void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
+-- 
+1.8.3.1
+
-- 
2.25.1

