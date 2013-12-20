Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5BACA60F86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 16:06:42 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Vu2b5-00070g-2B from Fahad_Arslan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Dec 2013 08:06:43 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 20 Dec 2013 08:06:42 -0800
From: Fahad Arslan <fahad_arslan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 21:06:16 +0500
Message-Id: <1387555576-9567-1-git-send-email-fahad_arslan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 20 Dec 2013 16:06:42.0846 (UTC)
	FILETIME=[7961ABE0:01CEFD9D]
Subject: [PATCH] speex: Scale float input when FIXED_POINT is defined
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
X-List-Received-Date: Fri, 20 Dec 2013 16:06:42 -0000

From: Fahad Arslan <Fahad_Arslan@mentor.com>

When Speex is compiled with FIXED_POINT defined, it scales float
input to +/-32768 instead of +/-1. This was being missed at one
point causing the input to the resampler to be zeroed. As a result
there was no audio output.

Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>
---
 .../speex/speex/scaling_fix.patch                  |   12 ++++++++++++
 meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/speex/speex/scaling_fix.patch b/meta/recipes-multimedia/speex/speex/scaling_fix.patch
new file mode 100644
index 0000000..a6340d7
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speex/scaling_fix.patch
@@ -0,0 +1,12 @@
+diff -NaurbB a/libspeex/resample.c b/libspeex/resample.c
+--- a/libspeex/resample.c	2013-12-20 19:47:49.154454769 +0500
++++ b/libspeex/resample.c	2013-12-20 19:48:16.558454331 +0500
+@@ -915,7 +915,7 @@
+        if (in) {
+          for(j=0;j<ichunk;++j)
+ #ifdef FIXED_POINT
+-           x[j+st->filt_len-1]=WORD2INT(in[j*istride_save]);
++           x[j+st->filt_len-1]=WORD2INT(32768.*in[j*istride_save]);
+ #else
+            x[j+st->filt_len-1]=in[j*istride_save];
+ #endif
diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
index faf63b0..0fea51e 100644
--- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
@@ -9,7 +9,8 @@ DEPENDS = "libogg"
 
 PR = "r2"
 
-SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz"
+SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz \
+           file://scaling_fix.patch"
 
 SRC_URI[md5sum] = "c4438b22c08e5811ff10e2b06ee9b9ae"
 SRC_URI[sha256sum] = "342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6"
-- 
1.7.9.5


