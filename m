Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.5376.1619510882298019653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 01:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vbLgwHhI;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id f11-20020a17090a638bb02901524d3a3d48so6674973pjj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 01:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sZyR4o7Qfv1/LOZ8si3gaBf145k9vciA8wavjkRVXtk=;
        b=vbLgwHhIyWn/jJPsNHgaMcMDPP5eSeijsVXgT252b0XTkkuAp8gBitBxetF2K2K/73
         sW8zPQXV2LipefVYa2Q5qnet15Jq7BeNRY0Qj+f7sqQglKl5TE3392wimu963FX1mp51
         wz77vuQKBoZfbCfgOn6UZicsGTPOXEAUqIJaHery2xM9ez0nk51WUG4Ii9hz0Jfjn+Xp
         pbygFZO9DItTBQ43IIYTeHxxHIv6LiPucPdNTn+bw9AVaD/hMV+dawblukbGW3johU0n
         bx5rrt1er/Lc8sCHhd0AEJGa4SJipU5QInYdaMr6tGHNxRjwtR23PcphAZb9TpT5FZ9y
         ZaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sZyR4o7Qfv1/LOZ8si3gaBf145k9vciA8wavjkRVXtk=;
        b=ViJNMjaxBUbOP59gwFnJ4ngFqpVypPtfaJZunfMXmLxdiT7bMHemIOFooEhYWd6ntu
         IoJVUl2MIXX3IJqw62S4y71e0fCWh0H8NSv5rvYx0inr/HqMpelEv22pS+RrN8nzDBaL
         ovZG1u0mAk/Jh5+P77xVA4FcaS86HARBdcvcJqh2ZXExLCeOBboY99/pf/4xLliyBOMt
         n2tVxAGyHp0Yj40I/H8Oe+x9haoI4LwtwGURifHLtleE0wsDw4e4DBkPwqiVOUTYcgsA
         D3sZ1vq8mvoyuWl21EtifB6zy+ki/y0Hfy7AXGDzwA8k+ZG3dCKJ3OkM0S0AyvyJDyB3
         27aQ==
X-Gm-Message-State: AOAM5323BQnm7t4TQmmqsrRQ8CmBF1rT1zqXk6Ut4bN5cYuWwWCNASsI
	RRpHrJ8vxbygLHLB9EGjUHmHxLGhWl8Cs8m2
X-Google-Smtp-Source: ABdhPJwGvY5XApbilRwZ+UidbHqpRvRg9DVvXGXdle7hwEkpVrpgPuC8MvlIGHhbDCl9BBPL1H8DQg==
X-Received: by 2002:a17:902:d4c2:b029:ed:4a62:abda with SMTP id o2-20020a170902d4c2b02900ed4a62abdamr5031324plg.5.1619510881411;
        Tue, 27 Apr 2021 01:08:01 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id jx20sm1485759pjb.41.2021.04.27.01.07.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Apr 2021 01:08:00 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [hardknott][PATCH] qemu: fix CVE-2021-3392
Date: Tue, 27 Apr 2021 17:07:27 +0900
Message-Id: <20210427080727.1215-1-flowergom@gmail.com>
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
index a625809597..1c4866ec0c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
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

