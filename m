Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.11129.1620730754987893592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 03:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: cBh4mPXC5+jG+ROUFUMpPL88HNq3cyMDz3kQThqlEi6+fi8bTBLSxVe6qEXH16nW5Gc8A9hQ/C
 GZQ32HsPMSmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179006557"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="179006557"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 03:59:14 -0700
IronPort-SDR: Qy2uPw/vVDu6ABbw8+XijlbmuMZI63M0vY/ylEEE6ecAag317aWNVI7Gbxu+hXgbKHkCgFgTRC
 0ssl5YyN75Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="430252137"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2021 03:59:13 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 3/4] qemu: fix CVE-2021-3392
Date: Tue, 11 May 2021 18:59:09 +0800
Message-Id: <20210511105910.3052-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511105910.3052-1-chee.yang.lee@intel.com>
References: <20210511105910.3052-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.17.1

