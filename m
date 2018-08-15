Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5D57914C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 23:13:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7FNDSVY013345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 16:13:28 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 15 Aug 2018 16:13:26 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2018 16:13:26 -0700
Message-ID: <20180815231326.243646-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] libvorbis: 3 CVE fixes
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
X-List-Received-Date: Wed, 15 Aug 2018 23:13:28 -0000
Content-Type: text/plain

CVE-2017-14160, CVE-2018-10393 (same as 14160), and CVE-2018-10392.
These fixes should be in libvorbis 1.3.7.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libvorbis/libvorbis/CVE-2017-14160.patch       | 34 ++++++++++++++++++++++
 .../libvorbis/libvorbis/CVE-2018-10392.patch       | 34 ++++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.6.bb                   |  2 ++
 3 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-10392.patch

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch
new file mode 100644
index 0000000..b7603c3
--- /dev/null
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14160.patch
@@ -0,0 +1,34 @@
+From 018ca26dece618457dd13585cad52941193c4a25 Mon Sep 17 00:00:00 2001
+From: Thomas Daede <daede003@umn.edu>
+Date: Wed, 9 May 2018 14:56:59 -0700
+Subject: [PATCH] CVE-2017-14160: fix bounds check on very low sample rates.
+
+---
+CVE: CVE-2017-14160 CVE-2018-10393
+
+Upstream-Status: Backport [gitlab.com/Xiph.Org/Vorbis/Commits/018ca26d...]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+---
+ lib/psy.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/psy.c b/lib/psy.c
+index 422c6f1..1310123 100644
+--- a/lib/psy.c
++++ b/lib/psy.c
+@@ -602,8 +602,9 @@ static void bark_noise_hybridmp(int n,const long *b,
+   for (i = 0, x = 0.f;; i++, x += 1.f) {
+ 
+     lo = b[i] >> 16;
+-    if( lo>=0 ) break;
+     hi = b[i] & 0xffff;
++    if( lo>=0 ) break;
++    if( hi>=n ) break;
+ 
+     tN = N[hi] + N[-lo];
+     tX = X[hi] - X[-lo];
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-10392.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-10392.patch
new file mode 100644
index 0000000..b7936b4
--- /dev/null
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-10392.patch
@@ -0,0 +1,34 @@
+From 112d3bd0aaacad51305e1464d4b381dabad0e88b Mon Sep 17 00:00:00 2001
+From: Thomas Daede <daede003@umn.edu>
+Date: Thu, 17 May 2018 16:19:19 -0700
+Subject: [PATCH] Sanity check number of channels in setup.
+
+Fixes #2335.
+
+---
+CVE: CVE-2018-10392
+
+Upstream-Status: Backport [gitlab.com/Xiph.Org/Vorbis/Commits/112d3bd...]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+
+ lib/vorbisenc.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+
+diff --git a/lib/vorbisenc.c b/lib/vorbisenc.c
+index 4fc7b62..64a51b5 100644
+--- a/lib/vorbisenc.c
++++ b/lib/vorbisenc.c
+@@ -684,6 +684,7 @@ int vorbis_encode_setup_init(vorbis_info *vi){
+   highlevel_encode_setup *hi=&ci->hi;
+ 
+   if(ci==NULL)return(OV_EINVAL);
++  if(vi->channels<1||vi->channels>255)return(OV_EINVAL);
+   if(!hi->impulse_block_p)i0=1;
+ 
+   /* too low/high an ATH floater is nonsensical, but doesn't break anything */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
index bd46451..cbda6dc 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
@@ -12,6 +12,8 @@ DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://0001-configure-Check-for-clang.patch \
+           file://CVE-2018-10392.patch \
+           file://CVE-2017-14160.patch \
           "
 SRC_URI[md5sum] = "b7d1692f275c73e7833ed1cc2697cd65"
 SRC_URI[sha256sum] = "af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415"
-- 
2.7.4


