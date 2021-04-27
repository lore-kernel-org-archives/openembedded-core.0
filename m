Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.5450.1619511915763244571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 01:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IJ1D9I6K;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id m12so1091981pgr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LuT8RqR6isoEF8TBDnBJhUvjmMX1NCSxz7geMYRuPis=;
        b=IJ1D9I6KCc0G2UIqAvx42Z5TAE7kwc6oRi6sD0CBjjtdKXK+7URSRLHqQCYBvwhBMh
         LizFD0ZJnByZRciWArQlG628hjI6MXG8Sv7xzoqpSZ/t3fm2f5QyQGRhAm6Lg8QYWGKB
         Zh6M1P8mKszQpbFijjoOzM4ZdhHlTsQvUuggNcNVSHMQKvvWAlfo/KuqEH25ZVC+IYzS
         4tmH52dMv+UZl2aWOoywIjZbflnF1SZNFTNtR/EH1JNGfFwwVOX83A+y9xDG9Gxjt/Nf
         8ZwZnIFsPvgme8H7XNpJjTUcGsMSOCm4zuZSYmZOs+OHDcWMZ0cCedNFWNURQK2xfAiu
         5uLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LuT8RqR6isoEF8TBDnBJhUvjmMX1NCSxz7geMYRuPis=;
        b=FwOD7WUo/omM47bkhRwUB5bCOHh36QvA9RULZXy2URVD82Gy/irIi/j4WNHA/G/mUJ
         nTi9HVVL8oDLeys/TSgPEPzRXMH9DWmvw6BWn/2nqgS1srwgDWwH91f7GkHAMTzzLJZS
         qqnDfXmaU/TxaUp6C6SrzzAGO32vXrVG8i3gV8UEda18qBCfyY64pwo74HNhTazK3o0r
         E2DvsDfYIphiD5mdyXx3BL6z2yRTE5oRnb70yeeYXq8mhTFlSwlrewkY9jmIrnhZlzz4
         rfCwnicpCqM2qSJjz9G+nvb4UlnBhRS+v7hcEAPPACZM3wLa6bM9ksIShO9rKuScAPd/
         lmRQ==
X-Gm-Message-State: AOAM530tTNyjuw8UYybl/VLMAWq3Qa94d5BJ1L9qw/4HXMdVfEBCUudb
	nGwKBa1NtZY92TcEZP3Mw7yPOA44f2PJqyaT
X-Google-Smtp-Source: ABdhPJxEMaSWWpXO9Wi9oYii0JNgYtIBYc5SRtRJyB7/e+AU8UGAGKJYBfPuFdZFC4ow/Rc0d5mLIw==
X-Received: by 2002:a65:5801:: with SMTP id g1mr20197589pgr.322.1619511914801;
        Tue, 27 Apr 2021 01:25:14 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id 63sm1790728pfx.202.2021.04.27.01.25.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Apr 2021 01:25:14 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [gatesgarth][PATCH v2] qemu: fix CVE-2021-3392
Date: Tue, 27 Apr 2021 17:25:01 +0900
Message-Id: <20210427082501.1737-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scsi: use-after-free in mptsas_process_scsi_io_request() of mptsas1068 emulator
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3392.patch             | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
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
index 0000000000..1c688827db
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
@@ -0,0 +1,45 @@
+From 3431b01b43584de5f710c40605fe3251f81c0e11 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Tue, 27 Apr 2021 02:09:49 +0000
+Subject: [PATCH] scsi: mptsas: dequeue request object in case of an error
+ (CVE-2021-3392)
+
+From: Prasad J Pandit <pjp@fedoraproject.org>
+
+While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
+the Megaraid emulator appends new MPTSASRequest object 'req' to
+the 's->pending' queue. In case of an error, this same object gets
+dequeued in mptsas_free_request() only if SCSIRequest object
+'req->sreq' is initialised. This may lead to a use-after-free issue.
+Unconditionally dequeue 'req' object from 's->pending' to avoid it.
+
+Fixes: CVE-2021-3392
+Buglink: https://bugs.launchpad.net/qemu/+bug/1914236
+Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+
+Upstream-Status: Acepted
+[https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00488.html]
+CVE: CVE-2021-3392
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ hw/scsi/mptsas.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
+index f86616544..adff5b0bf 100644
+--- a/hw/scsi/mptsas.c
++++ b/hw/scsi/mptsas.c
+@@ -257,8 +257,8 @@ static void mptsas_free_request(MPTSASRequest *req)
+         req->sreq->hba_private = NULL;
+         scsi_req_unref(req->sreq);
+         req->sreq = NULL;
+-        QTAILQ_REMOVE(&s->pending, req, next);
+     }
++    QTAILQ_REMOVE(&s->pending, req, next);
+     qemu_sglist_destroy(&req->qsg);
+     g_free(req);
+ }
+-- 
+2.17.1
+
-- 
2.24.3 (Apple Git-128)

