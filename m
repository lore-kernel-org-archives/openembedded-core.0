Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1B11E6CBD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 10:38:25 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1W5CFN-000127-EO from Fahad_Arslan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jan 2014 02:38:25 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 20 Jan 2014 02:38:25 -0800
From: Fahad Arslan <fahad_arslan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 15:38:20 +0500
Message-Id: <1390214300-47590-1-git-send-email-fahad_arslan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 20 Jan 2014 10:38:25.0507 (UTC)
	FILETIME=[BFA88330:01CF15CB]
Subject: [PATCH] speex: configure in flaot or fixed mode based on TARGET_FPU
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
X-List-Received-Date: Mon, 20 Jan 2014 10:38:25 -0000

From: Fahad Arslan <Fahad_Arslan@mentor.com>

Decide flaot or fixed mode usage depending on whether hardware
FPU is present or not.

Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>
---
 meta/recipes-multimedia/speex/speex-fpu.inc   |    4 ++++
 meta/recipes-multimedia/speex/speex_1.2rc1.bb |    4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/speex/speex-fpu.inc

diff --git a/meta/recipes-multimedia/speex/speex-fpu.inc b/meta/recipes-multimedia/speex/speex-fpu.inc
new file mode 100644
index 0000000..2571d32
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speex-fpu.inc
@@ -0,0 +1,4 @@
+def get_speex_fpu_setting(bb, d):
+     if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+             return "--enable-fixed-point --disable-float-api --disable-vbr"
+     return ""
diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
index f1ea547..f6dc490 100644
--- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
@@ -19,5 +19,7 @@ PARALLEL_MAKE = ""
 inherit autotools pkgconfig lib_package
 
 EXTRA_OECONF = " --with-ogg-libraries=${STAGING_LIBDIR} \
-                 --enable-float-api --disable-vbr \
                  --with-ogg-includes=${STAGING_INCDIR} --disable-oggtest"
+
+require speex-fpu.inc
+EXTRA_OECONF += "${@get_speex_fpu_setting(bb, d)}
-- 
1.7.9.5


