Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.4024.1629495119479304510
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 14:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17KLVw5S029501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 14:31:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 20 Aug 2021 14:31:57 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 20 Aug 2021 14:31:57 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id B747E900467; Fri, 20 Aug 2021 14:31:57 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tony.tascioglu@windriver.com>, <randy.macleod@windriver.com>
Subject: [hardknott][PATCH 4/5] ffmpeg: fix CVE-2020-22021
Date: Fri, 20 Aug 2021 14:31:56 -0700
Message-ID: <20210820213157.98104-4-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820213157.98104-1-tony.tascioglu@windriver.com>
References: <20210820213157.98104-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

avfilter/vf_yadif: Fix handing of tiny images

Fixes: out of array access
Fixes: Ticket8240
Fixes: CVE-2020-22021

Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2020-22021
Upstream-Status: Backport [7971f62120a55c141ec437aa3f0bacc1c1a3526b]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
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

