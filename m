Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 515 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Mar 2018 08:59:30 UTC
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id B82D1789A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 08:59:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3B11E21607
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:51:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Tue, 20 Mar 2018 04:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=sZN8HQYKwKaOm58d/Kf8shM2bUoMpAS2/k1bRfUhV+A=; b=P+kw2jVM
	Jv1SHiRcW7szK/Ubbyd2E7xkqXGDTY6hUGB93kmYiowJEm4ltaTpX4GcSQHoZ+Xx
	bjHtuvv25+kGJekZCwAusnCNgsiLXb/2uqfz2pkBZjtEdGzsZJoB8LZ18KsmfgcF
	Q7sdPDsebOUJU2oA/nqPdJ7s16TYJflvR0LyKWTc1sKdzCvqoy1qYluwWtO8REIR
	Su7G+guPA3ZSQSArHfsOrRHTTHDYgt/ZbfolZqoe4gcUYUkupKWCex99fU8yVB7E
	YtmfEqsAXdwTwOFp0sAdbqFCCOHDiZNTVNwqSDWNzxKdhW4vW/J2uPBu+yv/fqnx
	guodqT0SMvFHKA==
X-ME-Sender: <xms:dcuwWks_g_1D0G79SDhy1AGB_GspiDSzY3GpOsNyb3vsjZNd5CxT3Q>
Received: from localhost.localdomain (unknown [192.40.95.30])
	by mail.messagingengine.com (Postfix) with ESMTPA id A9D517E0EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:51:00 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 10:50:24 +0200
Message-Id: <20180320085024.554-4-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320085024.554-1-tanuk@iki.fi>
References: <20180320085024.554-1-tanuk@iki.fi>
Subject: [PATCH 3/3] libvorbis: CVE-2018-5146
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
X-List-Received-Date: Tue, 20 Mar 2018 08:59:31 -0000

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
index 32e92f009a..20f887c252 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://0001-configure-Check-for-clang.patch \
            file://CVE-2017-14633.patch \
            file://CVE-2017-14632.patch \
+           file://CVE-2018-5146.patch \
           "
 SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
 SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
-- 
2.16.2


