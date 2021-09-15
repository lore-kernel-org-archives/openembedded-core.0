Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.3933.1631747749606685057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 16:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220565596"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="220565596"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="433597400"
Received: from chgan-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.238.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:16:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/17] ffmpeg: fix CVE-2021-38171
Date: Thu, 16 Sep 2021 07:15:39 +0800
Message-Id: <130af0502d1ae6fe3721b83ff5218e3aa48dbf0d.1631747352.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631747352.git.anuj.mittal@intel.com>
References: <cover.1631747352.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kiran Surendran <Kiran.Surendran@windriver.com>

backport from upstream

Signed-off-by: Kiran Surendran <Kiran.Surendran@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-38171.patch    | 40 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
new file mode 100644
index 0000000000..8775acd8c5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38171.patch
@@ -0,0 +1,40 @@
+CVE: CVE-2021-38171
+Upstream-Status: Backport
+Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
+
+From d5373a9efb10c1fa87698ee41370fb04dc2e410b Mon Sep 17 00:00:00 2001
+From: maryam ebrahimzadeh <me22bee@outlook.com>
+Date: Wed, 4 Aug 2021 16:15:18 -0400
+Subject: [PATCH] avformat/adtsenc: return value check for init_get_bits in
+ adts_decode_extradata
+
+As the second argument for init_get_bits (buf) can be crafted, a return value check for this function call is necessary.
+'buf' is  part of  'AVPacket pkt'.
+replace init_get_bits with init_get_bits8.
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+---
+ libavformat/adtsenc.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/adtsenc.c b/libavformat/adtsenc.c
+index d937e2bea9..a1593515e1 100644
+--- a/libavformat/adtsenc.c
++++ b/libavformat/adtsenc.c
+@@ -50,9 +50,11 @@ static int adts_decode_extradata(AVFormatContext *s, ADTSContext *adts, const ui
+     GetBitContext gb;
+     PutBitContext pb;
+     MPEG4AudioConfig m4ac;
+-    int off;
++    int off, ret;
+ 
+-    init_get_bits(&gb, buf, size * 8);
++    ret = init_get_bits8(&gb, buf, size);
++    if (ret < 0)
++        return ret;
+     off = avpriv_mpeg4audio_get_config2(&m4ac, buf, size, 1, s);
+     if (off < 0)
+         return off;
+-- 
+2.31.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 3e7ceb859f..3162617336 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-22021.patch \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
            file://fix-CVE-2021-38291.patch \
+           file://fix-CVE-2021-38171.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

