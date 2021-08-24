Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.1057.1629822352109126146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360206"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360206"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658909"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/28] ffmpeg: fix CVE-2020-22021
Date: Wed, 25 Aug 2021 00:25:06 +0800
Message-Id: <debc96860ce50f08451bc453d41a005b9d62a601.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

avfilter/vf_yadif: Fix handing of tiny images

Fixes: out of array access
Fixes: Ticket8240
Fixes: CVE-2020-22021

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-22021
Upstream-Status: Backport [7971f62120a55c141ec437aa3f0bacc1c1a3526b]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2020-22021.patch    | 87 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch
new file mode 100644
index 0000000000..05cba736ff
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch
@@ -0,0 +1,87 @@
+From 384177ca945395c8cf0ebbddd4b8b1eae64e900f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 29 May 2021 11:17:35 +0200
+Subject: [PATCH 4/5] avfilter/vf_yadif: Fix handing of tiny images
+
+Fixes: out of array access
+Fixes: Ticket8240
+Fixes: CVE-2020-22021
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2020-22021
+Upstream-Status: Backport [7971f62120a55c141ec437aa3f0bacc1c1a3526b]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ libavfilter/vf_yadif.c | 32 ++++++++++++++++++--------------
+ 1 file changed, 18 insertions(+), 14 deletions(-)
+
+diff --git a/libavfilter/vf_yadif.c b/libavfilter/vf_yadif.c
+index 43dea67add..06fd24ecfa 100644
+--- a/libavfilter/vf_yadif.c
++++ b/libavfilter/vf_yadif.c
+@@ -123,20 +123,22 @@ static void filter_edges(void *dst1, void *prev1, void *cur1, void *next1,
+     uint8_t *next2 = parity ? cur  : next;
+ 
+     const int edge = MAX_ALIGN - 1;
++    int offset = FFMAX(w - edge, 3);
+ 
+     /* Only edge pixels need to be processed here.  A constant value of false
+      * for is_not_edge should let the compiler ignore the whole branch. */
+-    FILTER(0, 3, 0)
++    FILTER(0, FFMIN(3, w), 0)
+ 
+-    dst  = (uint8_t*)dst1  + w - edge;
+-    prev = (uint8_t*)prev1 + w - edge;
+-    cur  = (uint8_t*)cur1  + w - edge;
+-    next = (uint8_t*)next1 + w - edge;
++    dst  = (uint8_t*)dst1  + offset;
++    prev = (uint8_t*)prev1 + offset;
++    cur  = (uint8_t*)cur1  + offset;
++    next = (uint8_t*)next1 + offset;
+     prev2 = (uint8_t*)(parity ? prev : cur);
+     next2 = (uint8_t*)(parity ? cur  : next);
+ 
+-    FILTER(w - edge, w - 3, 1)
+-    FILTER(w - 3, w, 0)
++    FILTER(offset, w - 3, 1)
++    offset = FFMAX(offset, w - 3);
++    FILTER(offset, w, 0)
+ }
+ 
+ 
+@@ -170,21 +172,23 @@ static void filter_edges_16bit(void *dst1, void *prev1, void *cur1, void *next1,
+     uint16_t *next2 = parity ? cur  : next;
+ 
+     const int edge = MAX_ALIGN / 2 - 1;
++    int offset = FFMAX(w - edge, 3);
+ 
+     mrefs /= 2;
+     prefs /= 2;
+ 
+-    FILTER(0, 3, 0)
++    FILTER(0,  FFMIN(3, w), 0)
+ 
+-    dst   = (uint16_t*)dst1  + w - edge;
+-    prev  = (uint16_t*)prev1 + w - edge;
+-    cur   = (uint16_t*)cur1  + w - edge;
+-    next  = (uint16_t*)next1 + w - edge;
++    dst   = (uint16_t*)dst1  + offset;
++    prev  = (uint16_t*)prev1 + offset;
++    cur   = (uint16_t*)cur1  + offset;
++    next  = (uint16_t*)next1 + offset;
+     prev2 = (uint16_t*)(parity ? prev : cur);
+     next2 = (uint16_t*)(parity ? cur  : next);
+ 
+-    FILTER(w - edge, w - 3, 1)
+-    FILTER(w - 3, w, 0)
++    FILTER(offset, w - 3, 1)
++    offset = FFMAX(offset, w - 3);
++    FILTER(offset, w, 0)
+ }
+ 
+ static int filter_slice(AVFilterContext *ctx, void *arg, int jobnr, int nb_jobs)
+-- 
+2.32.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index c9c82b0398..e68589d4c3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-20446.patch \
            file://fix-CVE-2020-20453.patch \
            file://fix-CVE-2020-22015.patch \
+           file://fix-CVE-2020-22021.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

