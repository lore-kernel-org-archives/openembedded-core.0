Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 49E09746BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 05:21:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2A004213DB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:21:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Sat, 31 Mar 2018 01:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=8Vz3GpfEeX/Rp3eo2kBTXtiQsMhauwLWcE3l+y2sjtM=; b=fwC/g1xf
	6wWz1I0WCclSgnwG9GkomPOh5EjWwqNAfF+dAFGFwcpebLMg2tCDqgMJ18GwNbc7
	hvAu0ND8SP8/weZeuNbt32+h9P44XQGahrhca2Kq9UNkKZyCvPtzd+vRfWsyjI3q
	FONH2extHpjOQNb66CAzorOAtXQ5hMV+gXymIcgqzPm+j5atECz9r/UXQ7oNJMQx
	3xsgNFLzaCZd2pYNZkc2DEDegCsbSTfRm4i25M7aAhp0rlOeyR9LRI55l+ExR7Nd
	gUGkerTlTrapkavevUpR9lz+fsYDwDJHwIELjtQvtj/mbLhXC0fdLFM6qdpSYUY7
	KGmuT4hH1ApeDg==
X-ME-Sender: <xms:6Bq_WhrMoQICBVKZFvDiak7Rw9elatJnLTEe75UWsvVQLDRcOISltw>
Received: from localhost.localdomain (unknown [192.40.95.29])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9BC8810252
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:21:43 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2018 08:21:31 +0300
Message-Id: <20180331052132.23841-3-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180331052132.23841-1-tanuk@iki.fi>
References: <20180331052132.23841-1-tanuk@iki.fi>
Subject: [rocko][pyro][PATCH 2/3] libvorbis: CVE-2017-14632
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
X-List-Received-Date: Sat, 31 Mar 2018 05:21:43 -0000

Xiph.Org libvorbis 1.3.5 allows Remote Code Execution upon freeing
uninitialized memory in the function vorbis_analysis_headerout() in
info.c when vi->channels<=0, a similar issue to Mozilla bug 550184.

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-14632

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../libvorbis/libvorbis/CVE-2017-14632.patch       | 62 ++++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
new file mode 100644
index 0000000000..4036b966fe
--- /dev/null
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
@@ -0,0 +1,62 @@
+From 39704ce16835e5c019bb03f6a94dc1f0677406c5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
+Date: Wed, 15 Nov 2017 18:22:59 +0100
+Subject: [PATCH] CVE-2017-14632: vorbis_analysis_header_out: Don't clear opb
+ if not initialized
+
+If the number of channels is not within the allowed range
+we call oggback_writeclear altough it's not initialized yet.
+
+This fixes
+
+    =23371== Invalid free() / delete / delete[] / realloc()
+    ==23371==    at 0x4C2CE1B: free (vg_replace_malloc.c:530)
+    ==23371==    by 0x829CA31: oggpack_writeclear (in /usr/lib/x86_64-linux-gnu/libogg.so.0.8.2)
+    ==23371==    by 0x84B96EE: vorbis_analysis_headerout (info.c:652)
+    ==23371==    by 0x9FBCBCC: ??? (in /usr/lib/x86_64-linux-gnu/sox/libsox_fmt_vorbis.so)
+    ==23371==    by 0x4E524F1: ??? (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
+    ==23371==    by 0x4E52CCA: sox_open_write (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
+    ==23371==    by 0x10D82A: open_output_file (sox.c:1556)
+    ==23371==    by 0x10D82A: process (sox.c:1753)
+    ==23371==    by 0x10D82A: main (sox.c:3012)
+    ==23371==  Address 0x68768c8 is 488 bytes inside a block of size 880 alloc'd
+    ==23371==    at 0x4C2BB1F: malloc (vg_replace_malloc.c:298)
+    ==23371==    by 0x4C2DE9F: realloc (vg_replace_malloc.c:785)
+    ==23371==    by 0x4E545C2: lsx_realloc (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
+    ==23371==    by 0x9FBC9A0: ??? (in /usr/lib/x86_64-linux-gnu/sox/libsox_fmt_vorbis.so)
+    ==23371==    by 0x4E524F1: ??? (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
+    ==23371==    by 0x4E52CCA: sox_open_write (in /usr/lib/x86_64-linux-gnu/libsox.so.2.0.1)
+    ==23371==    by 0x10D82A: open_output_file (sox.c:1556)
+    ==23371==    by 0x10D82A: process (sox.c:1753)
+    ==23371==    by 0x10D82A: main (sox.c:3012)
+
+as seen when using the testcase from CVE-2017-11333 with
+008d23b782be09c8d75ba8190b1794abd66c7121 applied. However the error was
+there before.
+
+Upstream-Status: Backport
+CVE: CVE-2017-14632
+
+Reference to upstream patch:
+https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=c1c2831fc7306d5fbd7bc800324efd12b28d327f
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ lib/info.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/info.c b/lib/info.c
+index 81b7557..4d82568 100644
+--- a/lib/info.c
++++ b/lib/info.c
+@@ -584,6 +584,7 @@ int vorbis_analysis_headerout(vorbis_dsp_state *v,
+   private_state *b=v->backend_state;
+ 
+   if(!b||vi->channels<=0||vi->channels>256){
++    b = NULL;
+     ret=OV_EFAULT;
+     goto err_out;
+   }
+-- 
+2.16.2
+
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
index 73f9d1af2c..32e92f009a 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -13,6 +13,7 @@ DEPENDS = "libogg"
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://0001-configure-Check-for-clang.patch \
            file://CVE-2017-14633.patch \
+           file://CVE-2017-14632.patch \
           "
 SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
 SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
-- 
2.16.2


