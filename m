Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 843FC7F367
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 02:54:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,353,1559491200"; d="scan'208";a="73112657"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 10:54:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 31E0C4CDFCD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:54:29 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 10:54:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2019 10:53:45 +0800
Message-ID: <20190807025345.24426-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 31E0C4CDFCD7.AB17C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] flac:upgrade 1.3.2 -> 1.3.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Aug 2019 02:54:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-flac/CVE-2017-6888.patch
 Removed since this is included in 1.3.3.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../flac/flac/CVE-2017-6888.patch                  | 37 ----------------------
 .../flac/{flac_1.3.2.bb => flac_1.3.3.bb}          |  7 ++--
 2 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
 rename meta/recipes-multimedia/flac/{flac_1.3.2.bb => flac_1.3.3.bb} (91%)

diff --git a/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch b/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
deleted file mode 100644
index f017916..0000000
--- a/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 43ecb6431077ff54e9df27f71737e6e96d6c039f Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 21 Aug 2018 14:46:43 +0800
-Subject: [PATCH] From 5f47b63e9c971e6391590caf00a0f2a5ed612e67 Mon Sep 17
- 00:00:00 2001 From: Erik de Castro Lopo <erikd@mega-nerd.com> Date: Sat, 8
- Apr 2017 18:34:49 +1000 Subject: [PATCH] stream_decoder.c: Fix a memory leak
-
-Leak reported by Secunia Research.
-
-Upstream-Status: Backport[https://git.xiph.org/?p=flac.git;a=commit;
-                 h=4f47b63e9c971e6391590caf00a0f2a5ed612e67]
-
-Update patch to version 1.3.2
-CVE: CVE-2017-6888
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/libFLAC/stream_decoder.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
-index d364b0c..ebf93da 100644
---- a/src/libFLAC/stream_decoder.c
-+++ b/src/libFLAC/stream_decoder.c
-@@ -1759,6 +1759,9 @@ FLAC__bool read_metadata_vorbiscomment_(FLAC__StreamDecoder *decoder, FLAC__Stre
- 					}
- 					memset (obj->comments[i].entry, 0, obj->comments[i].length) ;
- 					if (!FLAC__bitreader_read_byte_block_aligned_no_crc(decoder->private_->input, obj->comments[i].entry, obj->comments[i].length)) {
-+						/* Current i-th entry is bad, so we delete it. */\
-+						free (obj->comments[i].entry) ;
-+						obj->comments[i].entry = NULL ;						
- 						obj->num_comments = i;
- 						goto skip;
- 					}
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/flac/flac_1.3.2.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
similarity index 91%
rename from meta/recipes-multimedia/flac/flac_1.3.2.bb
rename to meta/recipes-multimedia/flac/flac_1.3.3.bb
index e8599f6..ed82e25 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -15,11 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
-           file://CVE-2017-6888.patch "
+          "
 
-
-SRC_URI[md5sum] = "454f1bfa3f93cc708098d7890d0499bd"
-SRC_URI[sha256sum] = "91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f"
+SRC_URI[md5sum] = "26703ed2858c1fc9ffc05136d13daa69"
+SRC_URI[sha256sum] = "213e82bd716c9de6db2f98bcadbc4c24c7e2efe8c75939a1a84e28539c4e1748"
 
 CVE_PRODUCT = "libflac flac"
 
-- 
2.7.4




