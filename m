Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.5347.1619511159665476418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 01:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q/bCJYu5;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id p2so26364059pgh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 01:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c5vQZEAV6QfqG/hkSzEDA9x+QiAhtTmsHifl+aC4bQc=;
        b=q/bCJYu5jvLFlZ0yGnXV7oJTp6RdkH05iZpgYGLnPpeyAMxKxSrsZfc1ZfJSnY6OHV
         a0wpkuCkwPoIeWv7w9ivQeeiwciXNw+QsP8Cqah33nSvUPHHX4DKL/y/v/s5dqjS2pPH
         gvesFFt1dZA6k3R4fBcE2VP48qREh2QhD3H3NYgypvAvGICCroBgzc+y291vprsuMP0Z
         cOQvY3bVm457C+SnV/dk/HgTUwRnuxsBwREifEB9DCAZ/mARnvUL0qqYbVIBhMH+sZ45
         M9tmzyK2hSyYV6p/4Xq/Ux0d7J4pYz49k5+Vr3RpqtbYNYxVIg2O5Uf1x4dDQ91LAcY2
         QG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c5vQZEAV6QfqG/hkSzEDA9x+QiAhtTmsHifl+aC4bQc=;
        b=lAVbdWOpLUZtYugH45z0os8I0F+KtkAPO+5C5fb87mV6vVFg3BYz6FFTVBfNU9rW84
         6tO+ip29kVddcO3Maat3YXXNwJF1t7Mg5dAsz4U7g0bfmFGkX7K9t+Oakzp9r7PchL7L
         okSR5YQC0AYE3JH2QhRfQu+UFXRMOoqju6hNlhbAyl/Kw2kezjos9bZHXztFN+4poz5T
         qrvsncI9XOMm+nGAQtwmavDa4z3fEr+Im5rirCfDeJPMrb+Ec6iN6ktA4LuWpHtVL7NI
         QI+dFwhzuSJ+DFyZUdyAJH8oHhTP8MHTQCZ10dGtZMrTUh+iY5qUTpeiMKkA1TxdJIdL
         zgug==
X-Gm-Message-State: AOAM530YNX0kBDA1tQTGcd1EVaCYKHAsYcwhSrLF6N/PsVqzvosWFvWo
	bhJ2/atoLL0wZbBvwUlGmxLc41rtc3JR3T6m
X-Google-Smtp-Source: ABdhPJx6p/56eHPNfhxdgamBWw0BH5UGTncO4DWjHfdzuj+rAHxMqrP0a+U9ccatJR5HEk18NVdJXA==
X-Received: by 2002:a63:fd52:: with SMTP id m18mr3873276pgj.14.1619511158800;
        Tue, 27 Apr 2021 01:12:38 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id b13sm1922746pjl.38.2021.04.27.01.12.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Apr 2021 01:12:38 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <nate.kim@lge.com>
Subject: [dunfell][PATCH] qemu: fix CVE-2021-3392
Date: Tue, 27 Apr 2021 17:12:31 +0900
Message-Id: <20210427081231.1598-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <nate.kim@lge.com>

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

