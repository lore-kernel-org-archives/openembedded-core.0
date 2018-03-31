Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id A056B747CE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 05:24:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id DD23220C00
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:24:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sat, 31 Mar 2018 01:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=nZa8ZZN/ZnI5VgLYGylCPYcXvO96D7IR+EiqKVuiHdk=; b=MC00tzD7
	QrGol+EGh1ocVvNd4NApEdHGO0H2FzHG5Fh1Xi7J0VngmEhxsp3179dFC/totCo1
	gD1uvNTEvLvAooxQYa3709PeoQc7SOC1+5wtI7+HcrJ82w7guOJh5R04mQy3Tkc2
	i/CqB7x3hCzHlwe7Ba7t2ycjz6KH2tKHd9Lrq3NrsJgw4oPKgrmMp/BRK+RKpjQm
	QDCFhoCnEVign6uJ2fBoHDnETeO3EBuUXl3auN0vOFUF5pZwUPUSS/hA6y+GVWGK
	Kq9uTvh6bg477SroH05JJv+V5OPdUTZZVhMS/CVHTqXeP684SoGQ8kA+nBYjuL/Z
	4/NozUZ+1SAJhA==
X-ME-Sender: <xms:lRu_Wqb3MLh4DlBHNEhks80_dbR1oEGReB4Rz4a4KxD0wwMAgdb8_Q>
Received: from localhost.localdomain (unknown [192.40.95.29])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6464FE4437
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:24:37 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2018 08:24:26 +0300
Message-Id: <20180331052428.24138-2-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180331052428.24138-1-tanuk@iki.fi>
References: <20180331052428.24138-1-tanuk@iki.fi>
Subject: [morty][PATCH 1/3] libvorbis: CVE-2017-14633
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
X-List-Received-Date: Sat, 31 Mar 2018 05:24:37 -0000

In Xiph.Org libvorbis 1.3.5, an out-of-bounds array read vulnerability
exists in the function mapping0_forward() in mapping0.c, which may lead
to DoS when operating on a crafted audio file with vorbis_analysis().

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-14633

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../libvorbis/libvorbis/CVE-2017-14633.patch       | 42 ++++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |  4 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
new file mode 100644
index 0000000000..9c9e688d43
--- /dev/null
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
@@ -0,0 +1,42 @@
+From 07eda55f336e5c44dfc0e4a1e21628faed7255fa Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
+Date: Tue, 31 Oct 2017 18:32:46 +0100
+Subject: [PATCH] CVE-2017-14633: Don't allow for more than 256 channels
+
+Otherwise
+
+ for(i=0;i<vi->channels;i++){
+      /* the encoder setup assumes that all the modes used by any
+         specific bitrate tweaking use the same floor */
+      int submap=info->chmuxlist[i];
+
+overreads later in mapping0_forward since chmuxlist is a fixed array of
+256 elements max.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14633
+
+Reference to upstream patch:
+https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=667ceb4aab60c1f74060143bb24e5f427b3cce5f
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ lib/info.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/info.c b/lib/info.c
+index e447a0c..81b7557 100644
+--- a/lib/info.c
++++ b/lib/info.c
+@@ -583,7 +583,7 @@ int vorbis_analysis_headerout(vorbis_dsp_state *v,
+   oggpack_buffer opb;
+   private_state *b=v->backend_state;
+ 
+-  if(!b||vi->channels<=0){
++  if(!b||vi->channels<=0||vi->channels>256){
+     ret=OV_EFAULT;
+     goto err_out;
+   }
+-- 
+2.16.2
+
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
index 636e0f307b..75c2038800 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d2c487d2fc7dd3e3c7c465a5b7f6217 \
                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
 DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz"
+SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
+           file://CVE-2017-14633.patch \
+          "
 SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
 SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
 
-- 
2.16.2


