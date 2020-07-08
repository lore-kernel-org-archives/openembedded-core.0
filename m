Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.6595.1594198370700764791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 01:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; 
   d="scan'208";a="95925563"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 16:52:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 492624CE5059
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 16:52:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 16:52:45 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libvorbis: upgrade 1.3.6 -> 1.3.7
Date: Wed, 8 Jul 2020 16:52:39 +0800
Message-ID: <1594198359-42354-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594198359-42354-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1594198359-42354-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 492624CE5059.A35CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

CVE-2017-14160.patch
CVE-2018-10392.patch
removed since they are included in 1.3.7

-License-Update: Copyright year updated to 2020.

license text: URL of Xiph.Org Foundation changed to https://xiph.org/

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libvorbis/libvorbis/CVE-2017-14160.patch  | 34 -------------------
 .../libvorbis/libvorbis/CVE-2018-10392.patch  | 34 -------------------
 ...{libvorbis_1.3.6.bb => libvorbis_1.3.7.bb} | 10 +++---
 3 files changed, 4 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-10392.patch
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.6.bb => libvorbis_1.3.7.bb} (61%)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch
deleted file mode 100644
index b7603c3b13..0000000000
--- a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 018ca26dece618457dd13585cad52941193c4a25 Mon Sep 17 00:00:00 2001
-From: Thomas Daede <daede003@umn.edu>
-Date: Wed, 9 May 2018 14:56:59 -0700
-Subject: [PATCH] CVE-2017-14160: fix bounds check on very low sample rates.
-
----
-CVE: CVE-2017-14160 CVE-2018-10393
-
-Upstream-Status: Backport [gitlab.com/Xiph.Org/Vorbis/Commits/018ca26d...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
----
- lib/psy.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/psy.c b/lib/psy.c
-index 422c6f1..1310123 100644
---- a/lib/psy.c
-+++ b/lib/psy.c
-@@ -602,8 +602,9 @@ static void bark_noise_hybridmp(int n,const long *b,
-   for (i = 0, x = 0.f;; i++, x += 1.f) {
- 
-     lo = b[i] >> 16;
--    if( lo>=0 ) break;
-     hi = b[i] & 0xffff;
-+    if( lo>=0 ) break;
-+    if( hi>=n ) break;
- 
-     tN = N[hi] + N[-lo];
-     tX = X[hi] - X[-lo];
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-10392.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-10392.patch
deleted file mode 100644
index b7936b4b4d..0000000000
--- a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-10392.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 112d3bd0aaacad51305e1464d4b381dabad0e88b Mon Sep 17 00:00:00 2001
-From: Thomas Daede <daede003@umn.edu>
-Date: Thu, 17 May 2018 16:19:19 -0700
-Subject: [PATCH] Sanity check number of channels in setup.
-
-Fixes #2335.
-
----
-CVE: CVE-2018-10392
-
-Upstream-Status: Backport [gitlab.com/Xiph.Org/Vorbis/Commits/112d3bd...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
-
- lib/vorbisenc.c |    1 +
- 1 file changed, 1 insertion(+)
-
-
-diff --git a/lib/vorbisenc.c b/lib/vorbisenc.c
-index 4fc7b62..64a51b5 100644
---- a/lib/vorbisenc.c
-+++ b/lib/vorbisenc.c
-@@ -684,6 +684,7 @@ int vorbis_encode_setup_init(vorbis_info *vi){
-   highlevel_encode_setup *hi=&ci->hi;
- 
-   if(ci==NULL)return(OV_EINVAL);
-+  if(vi->channels<1||vi->channels>255)return(OV_EINVAL);
-   if(!hi->impulse_block_p)i0=1;
- 
-   /* too low/high an ATH floater is nonsensical, but doesn't break anything */
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
similarity index 61%
rename from meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
rename to meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
index 1a3cdc2269..c5c10348c6 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
@@ -6,16 +6,14 @@ HOMEPAGE = "http://www.vorbis.com/"
 BUGTRACKER = "https://trac.xiph.org"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=70c7063491d2d9f76a098d62ed5134f1 \
-                    file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
+LIC_FILES_CHKSUM = "file://COPYING;md5=73d9c8942c60b846c3bad13cc6c2e520 \
+                    file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=c95a4ac2b4125f00a9acf61449ebb843"
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://0001-configure-Check-for-clang.patch \
-           file://CVE-2018-10392.patch \
-           file://CVE-2017-14160.patch \
           "
-SRC_URI[md5sum] = "b7d1692f275c73e7833ed1cc2697cd65"
-SRC_URI[sha256sum] = "af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415"
+SRC_URI[md5sum] = "50902641d358135f06a8392e61c9ac77"
+SRC_URI[sha256sum] = "b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589d1b1e9d20f72954b"
 
 inherit autotools pkgconfig
-- 
2.17.1



