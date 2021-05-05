Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.2478.1620181240800385476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 19:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /6ttu6B9MxLnQQMFE7ez/wvTASB1IUL9th29JRUo7wI5xugifcI3MBFlxcDHWUFstkNlvuNKfE
 CIpV6qJIUKhg==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="262063970"
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; 
   d="scan'208";a="262063970"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 19:20:39 -0700
IronPort-SDR: DHLXy9NOim/npNbOiQmMEWgy2h0ppekKfssdubS70cve/MpY5noGhYA5UfzCxPdSJ1PxebHfAy
 d8HhJeOMvb0g==
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; 
   d="scan'208";a="531392212"
Received: from teohzhiq-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.150.148])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 19:20:38 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] Revert "qemu: fix CVE-2021-3392"
Date: Wed,  5 May 2021 10:20:33 +0800
Message-Id: <20210505022034.337915-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 5e8e08df8b5d0040ad911d3c51f63e7fec1858b4.

This is an incomplete fix.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 -
 .../qemu/qemu/CVE-2021-3392.patch             | 45 -------------------
 2 files changed, 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 062d7907cf..46b784241e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,7 +54,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3416_9.patch \
            file://CVE-2021-3416_10.patch \
            file://CVE-2021-20257.patch \
-	   file://CVE-2021-3392.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
deleted file mode 100644
index 1c688827db..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 3431b01b43584de5f710c40605fe3251f81c0e11 Mon Sep 17 00:00:00 2001
-From: Minjae Kim <flowergom@gmail.com>
-Date: Tue, 27 Apr 2021 02:09:49 +0000
-Subject: [PATCH] scsi: mptsas: dequeue request object in case of an error
- (CVE-2021-3392)
-
-From: Prasad J Pandit <pjp@fedoraproject.org>
-
-While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
-the Megaraid emulator appends new MPTSASRequest object 'req' to
-the 's->pending' queue. In case of an error, this same object gets
-dequeued in mptsas_free_request() only if SCSIRequest object
-'req->sreq' is initialised. This may lead to a use-after-free issue.
-Unconditionally dequeue 'req' object from 's->pending' to avoid it.
-
-Fixes: CVE-2021-3392
-Buglink: https://bugs.launchpad.net/qemu/+bug/1914236
-Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-
-Upstream-Status: Acepted
-[https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00488.html]
-CVE: CVE-2021-3392
-Signed-off-by: Minjae Kim <flowergom@gmail.com>
----
- hw/scsi/mptsas.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
-index f86616544..adff5b0bf 100644
---- a/hw/scsi/mptsas.c
-+++ b/hw/scsi/mptsas.c
-@@ -257,8 +257,8 @@ static void mptsas_free_request(MPTSASRequest *req)
-         req->sreq->hba_private = NULL;
-         scsi_req_unref(req->sreq);
-         req->sreq = NULL;
--        QTAILQ_REMOVE(&s->pending, req, next);
-     }
-+    QTAILQ_REMOVE(&s->pending, req, next);
-     qemu_sglist_destroy(&req->qsg);
-     g_free(req);
- }
--- 
-2.17.1
-
-- 
2.30.2

