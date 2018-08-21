Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C92257901C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 08:25:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L8Pl3p008823
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 01:25:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 21 Aug 2018 01:25:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2018 16:25:45 +0800
Message-ID: <1534839945-264601-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] flac: patch for CVE-2017-6888
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
X-List-Received-Date: Tue, 21 Aug 2018 08:25:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../flac/flac/CVE-2017-6888.patch                  | 36 ++++++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.2.bb         |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch

diff --git a/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch b/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
new file mode 100644
index 0000000..0977f30
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac/CVE-2017-6888.patch
@@ -0,0 +1,36 @@
+From 43ecb6431077ff54e9df27f71737e6e96d6c039f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 21 Aug 2018 14:46:43 +0800
+Subject: [PATCH] From 5f47b63e9c971e6391590caf00a0f2a5ed612e67 Mon Sep 17
+ 00:00:00 2001 From: Erik de Castro Lopo <erikd@mega-nerd.com> Date: Sat, 8
+ Apr 2017 18:34:49 +1000 Subject: [PATCH] stream_decoder.c: Fix a memory leak
+
+Leak reported by Secunia Research.
+
+Upstream-Status: Backport[https://git.xiph.org/?p=flac.git;a=commit;
+                 h=4f47b63e9c971e6391590caf00a0f2a5ed612e67]
+
+Update patch to version 1.3.2
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/libFLAC/stream_decoder.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/libFLAC/stream_decoder.c b/src/libFLAC/stream_decoder.c
+index d364b0c..ebf93da 100644
+--- a/src/libFLAC/stream_decoder.c
++++ b/src/libFLAC/stream_decoder.c
+@@ -1759,6 +1759,9 @@ FLAC__bool read_metadata_vorbiscomment_(FLAC__StreamDecoder *decoder, FLAC__Stre
+ 					}
+ 					memset (obj->comments[i].entry, 0, obj->comments[i].length) ;
+ 					if (!FLAC__bitreader_read_byte_block_aligned_no_crc(decoder->private_->input, obj->comments[i].entry, obj->comments[i].length)) {
++						/* Current i-th entry is bad, so we delete it. */\
++						free (obj->comments[i].entry) ;
++						obj->comments[i].entry = NULL ;						
+ 						obj->num_comments = i;
+ 						goto skip;
+ 					}
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/flac/flac_1.3.2.bb b/meta/recipes-multimedia/flac/flac_1.3.2.bb
index 8315ab5..92ef897 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.2.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
+SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://CVE-2017-6888.patch "
+
 
 SRC_URI[md5sum] = "454f1bfa3f93cc708098d7890d0499bd"
 SRC_URI[sha256sum] = "91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f"
-- 
2.7.4


