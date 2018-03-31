Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 852DE747BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 05:24:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id BBB9520EA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:24:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sat, 31 Mar 2018 01:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=XEi5KrBXdSx+AGJMXRPWtMkEQF34lSFBzDMZJUy4j3Y=; b=CbOslPdf
	KWDWK+LqQyhE90Q5YPOj6vsSeJBblYFGAajRozX/v2LvQxTzPDTO1/LRI1pJMMQu
	cI3Qv680i/MGCiEtDCnKPlfUhHWGdq3S9LEAGHv1nROXuyatscjKkI6XHo7jSjSZ
	YUZIjhY8Djsvfk7Z7nVwZIKFNAfi0xgAWUnAnF3KFH8n3Ct0qRrjBLdnjklzo6Qn
	CzN1ycbT3LEUkHpzA00KydJGWbgDPVdSwhQxVFWxl6wzvSfcb7r2VgDAHnCplTZk
	wnHl4N8bH5ufnysRdyBbHph7JD05qkWdD2YmkdpF/s3r3giQAk7vkDpAn7u9yyRw
	4xOuyabpeERQ1Q==
X-ME-Sender: <xms:mBu_WivioDQU5ws_WsBXLk0f7EofTlKKJDAaHDm7Fu8RjYgYPtIdHw>
Received: from localhost.localdomain (unknown [192.40.95.29])
	by mail.messagingengine.com (Postfix) with ESMTPA id 415BAE5084
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:24:40 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2018 08:24:28 +0300
Message-Id: <20180331052428.24138-4-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180331052428.24138-1-tanuk@iki.fi>
References: <20180331052428.24138-1-tanuk@iki.fi>
Subject: [morty][PATCH 3/3] libvorbis: CVE-2018-5146
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
X-List-Received-Date: Sat, 31 Mar 2018 05:24:39 -0000

Prevent out-of-bounds write in codebook decoding. The bug could allow
code execution from a specially crafted Ogg Vorbis file.

References:
https://www.debian.org/security/2018/dsa-4140
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-5146

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../libvorbis/libvorbis/CVE-2018-5146.patch        | 100 +++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch
new file mode 100644
index 0000000000..6d4052a872
--- /dev/null
+++ b/meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch
@@ -0,0 +1,100 @@
+From 3a017f591457bf6e80231b563bf83ee583fdbca8 Mon Sep 17 00:00:00 2001
+From: Thomas Daede <daede003@umn.edu>
+Date: Thu, 15 Mar 2018 14:15:31 -0700
+Subject: [PATCH] CVE-2018-5146: Prevent out-of-bounds write in codebook
+ decoding.
+
+Codebooks that are not an exact divisor of the partition size are now
+truncated to fit within the partition.
+
+Upstream-Status: Backport
+CVE: CVE-2018-5146
+
+Reference to upstream patch:
+https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=667ceb4aab60c1f74060143bb24e5f427b3cce5f
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ lib/codebook.c | 48 ++++++++++--------------------------------------
+ 1 file changed, 10 insertions(+), 38 deletions(-)
+
+diff --git a/lib/codebook.c b/lib/codebook.c
+index 8b766e8..7022fd2 100644
+--- a/lib/codebook.c
++++ b/lib/codebook.c
+@@ -387,7 +387,7 @@ long vorbis_book_decodevs_add(codebook *book,float *a,oggpack_buffer *b,int n){
+       t[i] = book->valuelist+entry[i]*book->dim;
+     }
+     for(i=0,o=0;i<book->dim;i++,o+=step)
+-      for (j=0;j<step;j++)
++      for (j=0;o+j<n && j<step;j++)
+         a[o+j]+=t[j][i];
+   }
+   return(0);
+@@ -399,41 +399,12 @@ long vorbis_book_decodev_add(codebook *book,float *a,oggpack_buffer *b,int n){
+     int i,j,entry;
+     float *t;
+ 
+-    if(book->dim>8){
+-      for(i=0;i<n;){
+-        entry = decode_packed_entry_number(book,b);
+-        if(entry==-1)return(-1);
+-        t     = book->valuelist+entry*book->dim;
+-        for (j=0;j<book->dim;)
+-          a[i++]+=t[j++];
+-      }
+-    }else{
+-      for(i=0;i<n;){
+-        entry = decode_packed_entry_number(book,b);
+-        if(entry==-1)return(-1);
+-        t     = book->valuelist+entry*book->dim;
+-        j=0;
+-        switch((int)book->dim){
+-        case 8:
+-          a[i++]+=t[j++];
+-        case 7:
+-          a[i++]+=t[j++];
+-        case 6:
+-          a[i++]+=t[j++];
+-        case 5:
+-          a[i++]+=t[j++];
+-        case 4:
+-          a[i++]+=t[j++];
+-        case 3:
+-          a[i++]+=t[j++];
+-        case 2:
+-          a[i++]+=t[j++];
+-        case 1:
+-          a[i++]+=t[j++];
+-        case 0:
+-          break;
+-        }
+-      }
++    for(i=0;i<n;){
++      entry = decode_packed_entry_number(book,b);
++      if(entry==-1)return(-1);
++      t     = book->valuelist+entry*book->dim;
++      for(j=0;i<n && j<book->dim;)
++        a[i++]+=t[j++];
+     }
+   }
+   return(0);
+@@ -471,12 +442,13 @@ long vorbis_book_decodevv_add(codebook *book,float **a,long offset,int ch,
+   long i,j,entry;
+   int chptr=0;
+   if(book->used_entries>0){
+-    for(i=offset/ch;i<(offset+n)/ch;){
++    int m=(offset+n)/ch;
++    for(i=offset/ch;i<m;){
+       entry = decode_packed_entry_number(book,b);
+       if(entry==-1)return(-1);
+       {
+         const float *t = book->valuelist+entry*book->dim;
+-        for (j=0;j<book->dim;j++){
++        for (j=0;i<m && j<book->dim;j++){
+           a[chptr++][i]+=t[j];
+           if(chptr==ch){
+             chptr=0;
+-- 
+2.16.2
+
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
index 11e1de7223..bd2321f1d6 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -13,6 +13,7 @@ DEPENDS = "libogg"
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://CVE-2017-14633.patch \
            file://CVE-2017-14632.patch \
+           file://CVE-2018-5146.patch \
           "
 SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
 SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
-- 
2.16.2


