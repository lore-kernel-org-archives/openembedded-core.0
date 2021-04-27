Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.5287.1619510638124553032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 01:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CwSPVMuP;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id q10so41793830pgj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 01:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nK/Vf5TGGWFeH3zvzM593AgTzh6x4nTtQArH8YGS40s=;
        b=CwSPVMuPIaV5JfKuZi20Pvfq1/NMt5HFrbQVKEP97WqlxJvNxDkU8ZAJC+PE6NLpOz
         YWLFmIiFKT5mxDCLHcNBj3FBMN9GcmwRy2mPkKPSthEj8l7Q6tJl80t7kGhAv0shCY1w
         mqQXegnVVT/8rncJ3/Pza9v2Xh9Y2ovm5DaP34JFA+zCvcJBMqqcFd3KXwKjDWY3lTGh
         3/IRPPNVddv2W7Xpjf4b8HJRopd0qTaVAwEkPv1O8amFuz6/PlV9Ky+8Q9vE31XCFzVz
         z4ObXN0TvmjA+WPxMcC4xofPHCHRvpGMX6C27zP8Utd7O97UeUmCZRYKyP4NWK51L1LG
         +9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nK/Vf5TGGWFeH3zvzM593AgTzh6x4nTtQArH8YGS40s=;
        b=NaEsHbTCFwLjSNgTv71OvBJYGotS4cDZYj3SFk2GkkxLnX43krgde8mY5g6PdRO5ei
         MWh0hGVpUuOWwWVAYN/ModJ2joWc6zcq6OzQJs6vReBsF7jyowTABSRoOCcp6mqUdBK4
         jXldJQc0jSW9nkc3SMrkPGhOt/YfYGITucMyXLcso420SzR6BGqVYt5bwP00797XIC1o
         fHI4fuNkJZY4JG/yriMFgMjCkzOcnstbcgJUMY+bte+R+fW1hLaSKXPAUQqVeLwaIq2b
         QAiyTARQO930MIwrg9ntzcOYFh7iohBZxAbn2d/AJixdg+CtQF2nCwjWQDLo9QSSRDkS
         gWxA==
X-Gm-Message-State: AOAM530Aa14gM6CyfEJ1Lxh5UyGV+zLKT+rXUorA6umQMMXp3PSrhsAw
	/EnAGI6/N3EoWLX80iaTQnaSzDEaY0QQmCeJ
X-Google-Smtp-Source: ABdhPJzEirZDTdlMR8yRBHPL/Xd8JUd9uEuOqSUWhJ7eFL4aHDGSptaQqTg0J5QcZgyMPgAvR+FBFg==
X-Received: by 2002:a63:c111:: with SMTP id w17mr20350935pgf.127.1619510637258;
        Tue, 27 Apr 2021 01:03:57 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id s22sm1685649pjs.42.2021.04.27.01.03.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Apr 2021 01:03:56 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] qemu: fix CVE-2021-3392
Date: Tue, 27 Apr 2021 17:03:45 +0900
Message-Id: <20210427080345.927-1-flowergom@gmail.com>
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
index 5797bbecf2..c8f8826423 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,6 +54,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3416_9.patch \
            file://CVE-2021-3416_10.patch \
            file://CVE-2021-20257.patch \
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

