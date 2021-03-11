Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.7702.1615476112185238594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: cnZ4T8o8QRMU/FBD9XyXFIBP7MeFfi8zHOnTIUxfscHiMiVWXHQzURzMRgrrGjZ0kkLqU6ZkpW
 ZDDgNfWQOIYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="188047483"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="188047483"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 07:21:29 -0800
IronPort-SDR: SbKNNM7sLyPx2V5XNtHwhwnVQi/CmO7q+HQIbgj7SfTOhCxlYAUSTTeQxGAtMrbjPInG8wysxW
 2TiTE6zZ6Pxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="603569276"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga005.fm.intel.com with ESMTP; 11 Mar 2021 07:21:28 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH] glibc: Fix CVE-2021-27645
Date: Thu, 11 Mar 2021 23:21:28 +0800
Message-Id: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

CVE:
CVE-2021-27645

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../glibc/glibc/CVE-2021-27645.patch          | 51 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-27645.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
new file mode 100644
index 0000000000..26c5c0d2a9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
@@ -0,0 +1,51 @@
+From dca565886b5e8bd7966e15f0ca42ee5cff686673 Mon Sep 17 00:00:00 2001
+From: DJ Delorie <dj@redhat.com>
+Date: Thu, 25 Feb 2021 16:08:21 -0500
+Subject: [PATCH] nscd: Fix double free in netgroupcache [BZ #27462]
+
+In commit 745664bd798ec8fd50438605948eea594179fba1 a use-after-free
+was fixed, but this led to an occasional double-free.  This patch
+tracks the "live" allocation better.
+
+Tested manually by a third party.
+
+Related: RHBZ 1927877
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=dca565886b5e8bd7966e15f0ca42ee5cff686673]
+
+CVE: CVE-2021-27645
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
+---
+ nscd/netgroupcache.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nscd/netgroupcache.c b/nscd/netgroupcache.c
+index dba6ceec1b..ad2daddafd 100644
+--- a/nscd/netgroupcache.c
++++ b/nscd/netgroupcache.c
+@@ -248,7 +248,7 @@ addgetnetgrentX (struct database_dyn *db, int fd, request_header *req,
+ 					     : NULL);
+ 				    ndomain = (ndomain ? newbuf + ndomaindiff
+ 					       : NULL);
+-				    buffer = newbuf;
++				    *tofreep = buffer = newbuf;
+ 				  }
+ 
+ 				nhost = memcpy (buffer + bufused,
+@@ -319,7 +319,7 @@ addgetnetgrentX (struct database_dyn *db, int fd, request_header *req,
+ 		    else if (status == NSS_STATUS_TRYAGAIN && e == ERANGE)
+ 		      {
+ 			buflen *= 2;
+-			buffer = xrealloc (buffer, buflen);
++			*tofreep = buffer = xrealloc (buffer, buflen);
+ 		      }
+ 		    else if (status == NSS_STATUS_RETURN
+ 			     || status == NSS_STATUS_NOTFOUND
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index c47826a51e..d0a290822b 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -45,6 +45,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
            file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch \
+           file://CVE-2021-27645.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.29.0

