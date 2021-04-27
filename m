Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.5331.1619511073088586006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 01:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AShj/lnI;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id p17so4531872plf.12
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mZxa2eEUBlwINDzbSCsD9/Pp+p76yiOeM89u/ITG0aA=;
        b=AShj/lnI5RIAqDYwxghiSKExK2+tzNBqbAGcH9/vCy+sdw6X/zV0vIF/i5CjdRIr9W
         uJzXCYlsTv2rIOfNEIHDMoqi+asNgqOinTbp+lMGq3x149wwnVKDBtPAkUG8tRPNUDAp
         /o31cFHz8n19ITh1rIjo15rODc/rrNpWxl3f1Pe7E5ei+4QETGSMr/6wvl8j+iXnr2g2
         ehq+Gzw2ee3RNfrR67XJBHFGR7C4QpdnIlfK0SV2sBAlwCwoc9odBKE4bN9mSJBiT0y/
         oISYiP46mQmCeEkjAfSCW9KrfIKMgRgUhOTt/umdeqYZZE4FQXoDC3Ofu25G8Wh504jF
         lWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mZxa2eEUBlwINDzbSCsD9/Pp+p76yiOeM89u/ITG0aA=;
        b=iICKoQfpcNmHZnEjzgjt/qnRh+xjIbkshf8yyNXjXXPXdKsBB1rNpXWygg8ctdvdPV
         pckeGAxXDcDbz0n0NS+rpTWeJ+o1o1+yMlsyyRGVA2jafxuUOuGbz9mVywEKbR82ldfj
         F8zKi+vapsnrx9R5li9rbTPX65lnB893oBaVv004yN8wlI7oM0D0sVrWmUjmlqGpewnv
         rrFSNy+BMsSqMRQQDbqAS7ow5HUj+xj0y2GSvaD/zJWRUf2zOoFdF30ppze9Sj+pe9Np
         D40zidored8ujmhPkyocS+/r+JjIxeBEzog98XeI6nq57zRaoAlPcbeI2gjL6Aubzs8f
         R4YQ==
X-Gm-Message-State: AOAM532WqbedaNdk1UZIhIMp6h5nVNEHFsKWKqGIP+ETA5ZBdzlC/0zY
	G2z4H4hr49qoZXg+181Wgt9miBeyXNv1wHa9
X-Google-Smtp-Source: ABdhPJz90niwYNw2pD6rb+HuH/SL5zsEor1fFcYLjlJC3qCqIFcphYvSo/sl2lHcBOZGjQ3ggkj+eQ==
X-Received: by 2002:a17:902:e541:b029:ed:3869:3f74 with SMTP id n1-20020a170902e541b02900ed38693f74mr8098044plf.7.1619511072253;
        Tue, 27 Apr 2021 01:11:12 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id r63sm1550927pjg.46.2021.04.27.01.11.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Apr 2021 01:11:11 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [gatesgarth][PATCH] qemu: fix CVE-2021-3392
Date: Tue, 27 Apr 2021 17:11:03 +0900
Message-Id: <20210427081103.1507-1-flowergom@gmail.com>
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
index 482ca3d6e5..e9a7b6fcac 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-35517.patch \
 	   file://CVE-2020-29443.patch \
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

