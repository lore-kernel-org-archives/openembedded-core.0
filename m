Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: akQlWRWKbl1SuuhuLevFcscdml3t82Bz5y6Mpi1lNSFVOsL293cS1deWYGnPkowXy4u0JS+mJ1
 NjbXqE3JCXkw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818170"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818170"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:33 -0700
IronPort-SDR: ef5G8R34+upvvQg/vryt1dC3eaznOgIEVw3OuHKw5/eSAkYkV4SZ0+Z+paQ1uFxcfi4bsTYvr7
 nii3M0bbwxIQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067394"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:32 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 28/64] parselogs: ignore floppy error on qemu-system-x86 at boot stage
Date: Mon, 26 Apr 2021 08:52:59 +0800
Message-Id: <0e449143839f8de338b4a18fb27e8380d80e9b2f.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yanfei Xu <yanfei.xu@windriver.com>

We can disable floppy drive by BIOS on a hardware, but an empty floppy
drive is connected by default on qemu-system-x86. Linux usually detect
the device and modprode the matched floppy.ko at the boot stage. Due to
we don't specify a floppy deivce in qemu boot arguments, then the errors
about floppy reading comes out.

It is harmless and normal, so we could ignore this error message on
qemux86.

Seen if kernel-modules is included in the image which pulls in the
relavent kernel module.

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01402.html

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3359f23ee9351c70997d5e0a17d17d1e47d59623)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 4714741aff..1bb0425521 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -88,6 +88,8 @@ qemux86_common = [
     'tsc: HPET/PMTIMER calibration failed',
     "modeset(0): Failed to initialize the DRI2 extension",
     "glamor initialization failed",
+    "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
+    "floppy: error",
 ] + common_errors
 
 ignore_errors = {
-- 
2.30.2

