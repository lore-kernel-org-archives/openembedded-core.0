Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RfD1VMEaKVXNkOjmqZ7R1wA16mmhNpaL59KDxSqd5kkOz+paqb0jnr2giW5iqbPQkILIkB6H3e
 /RanLFaHGqjA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794816"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794816"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:24 -0700
IronPort-SDR: I/z8dPl8BQosUcQxMK1HeYCEeZmnVeqciid0xgVsp7YcLfHghz2fRmtwEQn1zj3N6u4a+p8RLT
 ark+B0ZTMxJQ==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331706"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 25/31] qemu: fix CVE-2021-3392
Date: Fri,  7 May 2021 15:02:37 +0800
Message-Id: <147bed3b6c591c2b20b4ac31f806ee153cc23322.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a0257aee7d80fc67c92877e2de1e4b98ece54174)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3392.patch             | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f090cb402f..8b8cecd7a0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -56,6 +56,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-20257.patch \
            file://CVE-2020-27821.patch \
            file://CVE-2021-20263.patch \
+           file://CVE-2021-3392.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
new file mode 100644
index 0000000000..af94cff7e8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
@@ -0,0 +1,89 @@
+From 3791642c8d60029adf9b00bcb4e34d7d8a1aea4d Mon Sep 17 00:00:00 2001
+From: Michael Tokarev <mjt@tls.msk.ru>
+Date: Mon, 19 Apr 2021 15:42:47 +0200
+Subject: [PATCH] mptsas: Remove unused MPTSASState 'pending' field
+ (CVE-2021-3392)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
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
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
+Message-id: 20210419134247.1467982-1-f4bug@amsat.org
+Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
+Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
+Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
+BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
+Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
+[PMD: Reworded description, added more tags]
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+CVE: CVE-2021-3392
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=3791642c8d60029adf9b00bcb4e34d7d8a1aea4d]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ hw/scsi/mptsas.c | 6 ------
+ hw/scsi/mptsas.h | 1 -
+ 2 files changed, 7 deletions(-)
+
+diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
+index 7416e7870614..db3219e7d206 100644
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
+index b85ac1a5fcc7..c046497db719 100644
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
-- 
2.30.2

