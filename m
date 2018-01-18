Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E4DA378268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 02:29:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35429482"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2018 10:29:40 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 308FE486A76E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 10:29:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 18 Jan 2018 10:29:38 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jan 2018 10:29:37 +0800
Message-ID: <1516242577-2466-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 308FE486A76E.AD63F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] tiff: 4.0.8 -> 4.0.9
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
X-List-Received-Date: Thu, 18 Jan 2018 02:29:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

1.Upgrade tiff from 4.0.8 to 4.0.9.
2.Delete CVE-2017-10688.patch, CVE-2017-11335.patch, CVE-2017-13726.patch, CVE-2017-13727.patch, CVE-2017-9147.patch, CVE-2017-9936.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libtiff/files/CVE-2017-10688.patch             |  91 ---------
 .../libtiff/files/CVE-2017-11335.patch             |  54 ------
 .../libtiff/files/CVE-2017-13726.patch             |  54 ------
 .../libtiff/files/CVE-2017-13727.patch             |  65 -------
 .../libtiff/files/CVE-2017-9147.patch              | 206 ---------------------
 .../libtiff/files/CVE-2017-9936.patch              |  49 -----
 .../libtiff/{tiff_4.0.8.bb => tiff_4.0.9.bb}       |  10 +-
 7 files changed, 2 insertions(+), 527 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-13726.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-13727.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.8.bb => tiff_4.0.9.bb} (81%)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch
deleted file mode 100644
index b0db969..0000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 333ba5599e87bd7747516d7863d61764e4ca2d92 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Fri, 30 Jun 2017 17:29:44 +0000
-Subject: [PATCH] * libtiff/tif_dirwrite.c: in
- TIFFWriteDirectoryTagCheckedXXXX() functions associated with LONG8/SLONG8
- data type, replace assertion that the file is BigTIFF, by a non-fatal error.
- Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2712 Reported by team
- OWL337
-
-Upstream-Status: Backport
-[https://github.com/vadz/libtiff/commit/6173a57d39e04d68b139f8c1aa499a24dbe74ba1]
-
-CVE: CVE-2017-10688
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- ChangeLog              |  8 ++++++++
- libtiff/tif_dirwrite.c | 20 ++++++++++++++++----
- 2 files changed, 24 insertions(+), 4 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 0240f0b..42eaeb7 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,11 @@
-+2017-06-30  Even Rouault <even.rouault at spatialys.com>
-+
-+	* libtiff/tif_dirwrite.c: in TIFFWriteDirectoryTagCheckedXXXX()
-+	functions associated with LONG8/SLONG8 data type, replace assertion that
-+	the file is BigTIFF, by a non-fatal error.
-+	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2712
-+	Reported by team OWL337
-+
- 2017-06-26  Even Rouault <even.rouault at spatialys.com>
- 
- 	* libtiff/tif_jbig.c: fix memory leak in error code path of JBIGDecode()
-diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
-index 2967da5..8d6686b 100644
---- a/libtiff/tif_dirwrite.c
-+++ b/libtiff/tif_dirwrite.c
-@@ -2111,7 +2111,10 @@ TIFFWriteDirectoryTagCheckedLong8(TIFF* tif, uint32* ndir, TIFFDirEntry* dir, ui
- {
- 	uint64 m;
- 	assert(sizeof(uint64)==8);
--	assert(tif->tif_flags&TIFF_BIGTIFF);
-+	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
-+		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","LONG8 not allowed for ClassicTIFF");
-+		return(0);
-+	}
- 	m=value;
- 	if (tif->tif_flags&TIFF_SWAB)
- 		TIFFSwabLong8(&m);
-@@ -2124,7 +2127,10 @@ TIFFWriteDirectoryTagCheckedLong8Array(TIFF* tif, uint32* ndir, TIFFDirEntry* di
- {
- 	assert(count<0x20000000);
- 	assert(sizeof(uint64)==8);
--	assert(tif->tif_flags&TIFF_BIGTIFF);
-+	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
-+		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","LONG8 not allowed for ClassicTIFF");
-+		return(0);
-+	}
- 	if (tif->tif_flags&TIFF_SWAB)
- 		TIFFSwabArrayOfLong8(value,count);
- 	return(TIFFWriteDirectoryTagData(tif,ndir,dir,tag,TIFF_LONG8,count,count*8,value));
-@@ -2136,7 +2142,10 @@ TIFFWriteDirectoryTagCheckedSlong8(TIFF* tif, uint32* ndir, TIFFDirEntry* dir, u
- {
- 	int64 m;
- 	assert(sizeof(int64)==8);
--	assert(tif->tif_flags&TIFF_BIGTIFF);
-+	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
-+		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","SLONG8 not allowed for ClassicTIFF");
-+		return(0);
-+	}
- 	m=value;
- 	if (tif->tif_flags&TIFF_SWAB)
- 		TIFFSwabLong8((uint64*)(&m));
-@@ -2149,7 +2158,10 @@ TIFFWriteDirectoryTagCheckedSlong8Array(TIFF* tif, uint32* ndir, TIFFDirEntry* d
- {
- 	assert(count<0x20000000);
- 	assert(sizeof(int64)==8);
--	assert(tif->tif_flags&TIFF_BIGTIFF);
-+	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
-+		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","SLONG8 not allowed for ClassicTIFF");
-+		return(0);
-+	}
- 	if (tif->tif_flags&TIFF_SWAB)
- 		TIFFSwabArrayOfLong8((uint64*)value,count);
- 	return(TIFFWriteDirectoryTagData(tif,ndir,dir,tag,TIFF_SLONG8,count,count*8,value));
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch
deleted file mode 100644
index d08e7612..0000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From e8b15ccf8c9c593000f8202cf34cc6c4b936d01e Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 15 Jul 2017 11:13:46 +0000
-Subject: [PATCH] * tools/tiff2pdf.c: prevent heap buffer overflow write in
- "Raw" mode on PlanarConfig=Contig input images. Fixes
- http://bugzilla.maptools.org/show_bug.cgi?id=2715 Reported by team OWL337
-
-Upstream-Status: Backport
-[https://github.com/vadz/libtiff/commit/69bfeec247899776b1b396651adb47436e5f1556]
-
-CVE: CVE-2017-11355
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- ChangeLog        | 7 +++++++
- tools/tiff2pdf.c | 7 ++++++-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 42eaeb7..6980da8 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,10 @@
-+2017-07-15  Even Rouault <even.rouault at spatialys.com>
-+
-+	* tools/tiff2pdf.c: prevent heap buffer overflow write in "Raw"
-+	mode on PlanarConfig=Contig input images.
-+	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2715
-+	Reported by team OWL337
-+
- 2017-06-30  Even Rouault <even.rouault at spatialys.com>
- 
- 	* libtiff/tif_dirwrite.c: in TIFFWriteDirectoryTagCheckedXXXX()
-diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
-index db196e0..cd1e235 100644
---- a/tools/tiff2pdf.c
-+++ b/tools/tiff2pdf.c
-@@ -1737,7 +1737,12 @@ void t2p_read_tiff_data(T2P* t2p, TIFF* input){
- 	    return;
- 
- 	t2p->pdf_transcode = T2P_TRANSCODE_ENCODE;
--	if(t2p->pdf_nopassthrough==0){
-+        /* It seems that T2P_TRANSCODE_RAW mode doesn't support separate->contig */
-+        /* conversion. At least t2p_read_tiff_size and t2p_read_tiff_size_tile */
-+        /* do not take into account the number of samples, and thus */
-+        /* that can cause heap buffer overflows such as in */
-+        /* http://bugzilla.maptools.org/show_bug.cgi?id=2715 */
-+	if(t2p->pdf_nopassthrough==0 && t2p->tiff_planar!=PLANARCONFIG_SEPARATE){
- #ifdef CCITT_SUPPORT
- 		if(t2p->tiff_compression==COMPRESSION_CCITTFAX4  
- 			){
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-13726.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-13726.patch
deleted file mode 100644
index c60ffa6..0000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-13726.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 5317ce215936ce611846557bb104b49d3b4c8345 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Wed, 23 Aug 2017 13:21:41 +0000
-Subject: [PATCH] * libtiff/tif_dirwrite.c: replace assertion related to not
- finding the SubIFD tag by runtime check. Fixes
- http://bugzilla.maptools.org/show_bug.cgi?id=2727 Reported by team OWL337
-
-Upstream-Status: Backport
-[https://github.com/vadz/libtiff/commit/f91ca83a21a6a583050e5a5755ce1441b2bf1d7e]
-
-CVE: CVE-2017-13726
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- ChangeLog              | 7 +++++++
- libtiff/tif_dirwrite.c | 7 ++++++-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 6980da8..3e299d9 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,10 @@
-+2017-08-23  Even Rouault <even.rouault at spatialys.com>
-+
-+	* libtiff/tif_dirwrite.c: replace assertion related to not finding the
-+	SubIFD tag by runtime check.
-+	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2727
-+	Reported by team OWL337
-+
- 2017-07-15  Even Rouault <even.rouault at spatialys.com>
- 
- 	* tools/tiff2pdf.c: prevent heap buffer overflow write in "Raw"
-diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
-index 8d6686b..14090ae 100644
---- a/libtiff/tif_dirwrite.c
-+++ b/libtiff/tif_dirwrite.c
-@@ -821,7 +821,12 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
- 			TIFFDirEntry* nb;
- 			for (na=0, nb=dir; ; na++, nb++)
- 			{
--				assert(na<ndir);
-+				if( na == ndir )
-+                                {
-+                                    TIFFErrorExt(tif->tif_clientdata,module,
-+                                                 "Cannot find SubIFD tag");
-+                                    goto bad;
-+                                }
- 				if (nb->tdir_tag==TIFFTAG_SUBIFD)
- 					break;
- 			}
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-13727.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-13727.patch
deleted file mode 100644
index e228c2f..0000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-13727.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From a5e8245cc67646f7b448b4ca29258eaac418102c Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Wed, 23 Aug 2017 13:33:42 +0000
-Subject: [PATCH] * libtiff/tif_dirwrite.c: replace assertion to tag value not
- fitting on uint32 when selecting the value of SubIFD tag by runtime check (in
- TIFFWriteDirectoryTagSubifd()). Fixes
- http://bugzilla.maptools.org/show_bug.cgi?id=2728 Reported by team OWL337
-
-SubIFD tag by runtime check (in TIFFWriteDirectorySec())
-
-Upstream-Status: Backport
-[https://github.com/vadz/libtiff/commit/b6af137bf9ef852f1a48a50a5afb88f9e9da01cc]
-
-CVE: CVE-2017-13727
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- ChangeLog              | 10 +++++++++-
- libtiff/tif_dirwrite.c |  9 ++++++++-
- 2 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 3e299d9..8f5efe9 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,7 +1,15 @@
- 2017-08-23  Even Rouault <even.rouault at spatialys.com>
- 
-+	* libtiff/tif_dirwrite.c: replace assertion to tag value not fitting
-+	on uint32 when selecting the value of SubIFD tag by runtime check
-+	(in TIFFWriteDirectoryTagSubifd()).
-+	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2728
-+	Reported by team OWL337
-+
-+2017-08-23  Even Rouault <even.rouault at spatialys.com>
-+
- 	* libtiff/tif_dirwrite.c: replace assertion related to not finding the
--	SubIFD tag by runtime check.
-+	SubIFD tag by runtime check (in TIFFWriteDirectorySec())
- 	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2727
- 	Reported by team OWL337
- 
-diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
-index 14090ae..f0a4baa 100644
---- a/libtiff/tif_dirwrite.c
-+++ b/libtiff/tif_dirwrite.c
-@@ -1949,7 +1949,14 @@ TIFFWriteDirectoryTagSubifd(TIFF* tif, uint32* ndir, TIFFDirEntry* dir)
- 		for (p=0; p < tif->tif_dir.td_nsubifd; p++)
- 		{
-                         assert(pa != 0);
--			assert(*pa <= 0xFFFFFFFFUL);
-+
-+                        /* Could happen if an classicTIFF has a SubIFD of type LONG8 (which is illegal) */
-+                        if( *pa > 0xFFFFFFFFUL)
-+                        {
-+                            TIFFErrorExt(tif->tif_clientdata,module,"Illegal value for SubIFD tag");
-+                            _TIFFfree(o);
-+                            return(0);
-+                        }
- 			*pb++=(uint32)(*pa++);
- 		}
- 		n=TIFFWriteDirectoryTagCheckedIfdArray(tif,ndir,dir,TIFFTAG_SUBIFD,tif->tif_dir.td_nsubifd,o);
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch
deleted file mode 100644
index 3392285..0000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch
+++ /dev/null
@@ -1,206 +0,0 @@
-From 0acf01fea714af573b814e10cf105c3359a236c3 Mon Sep 17 00:00:00 2001
-From: erouault <erouault>
-Date: Thu, 1 Jun 2017 12:44:04 +0000
-Subject: [PATCH] * libtiff/tif_dirinfo.c, tif_dirread.c: add _TIFFCheckFieldIsValidForCodec(),
-and use it in TIFFReadDirectory() so as to ignore fields whose tag is a
-codec-specified tag but this codec is not enabled. This avoids TIFFGetField()
-to behave differently depending on whether the codec is enabled or not, and
-thus can avoid stack based buffer overflows in a number of TIFF utilities
-such as tiffsplit, tiffcmp, thumbnail, etc.
-Patch derived from 0063-Handle-properly-CODEC-specific-tags.patch
-(http://bugzilla.maptools.org/show_bug.cgi?id=2580) by Raphaël Hertzog.
-Fixes:
-http://bugzilla.maptools.org/show_bug.cgi?id=2580
-http://bugzilla.maptools.org/show_bug.cgi?id=2693
-http://bugzilla.maptools.org/show_bug.cgi?id=2625 (CVE-2016-10095)
-http://bugzilla.maptools.org/show_bug.cgi?id=2564 (CVE-2015-7554)
-http://bugzilla.maptools.org/show_bug.cgi?id=2561 (CVE-2016-5318)
-http://bugzilla.maptools.org/show_bug.cgi?id=2499 (CVE-2014-8128)
-http://bugzilla.maptools.org/show_bug.cgi?id=2441
-http://bugzilla.maptools.org/show_bug.cgi?id=2433
-
-Upstream-Status: Backport
-[https://github.com/vadz/libtiff/commit/4d4fa0b68ae9ae038959ee4f69ebe288ec892f06]
-
-CVE: CVE-2017-9147
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- ChangeLog             |  20 ++++++++++
- libtiff/tif_dir.h     |   1 +
- libtiff/tif_dirinfo.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++
- libtiff/tif_dirread.c |   4 ++
- 4 files changed, 128 insertions(+)
-
-diff --git a/ChangeLog b/ChangeLog
-index ee8d9d0..5739292 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,23 @@
-+2017-06-01  Even Rouault <even.rouault at spatialys.com>
-+
-+	* libtiff/tif_dirinfo.c, tif_dirread.c: add _TIFFCheckFieldIsValidForCodec(),
-+	and use it in TIFFReadDirectory() so as to ignore fields whose tag is a
-+	codec-specified tag but this codec is not enabled. This avoids TIFFGetField()
-+	to behave differently depending on whether the codec is enabled or not, and
-+	thus can avoid stack based buffer overflows in a number of TIFF utilities
-+	such as tiffsplit, tiffcmp, thumbnail, etc.
-+	Patch derived from 0063-Handle-properly-CODEC-specific-tags.patch
-+	(http://bugzilla.maptools.org/show_bug.cgi?id=2580) by Raphaël Hertzog.
-+	Fixes:
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2580
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2693
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2625 (CVE-2016-10095)
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2564 (CVE-2015-7554)
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2561 (CVE-2016-5318)
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2499 (CVE-2014-8128)
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2441
-+	http://bugzilla.maptools.org/show_bug.cgi?id=2433
-+
- 2017-05-21  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
- 
- 	* configure.ac: libtiff 4.0.8 released.
-diff --git a/libtiff/tif_dir.h b/libtiff/tif_dir.h
-index e12b44b..5206be4 100644
---- a/libtiff/tif_dir.h
-+++ b/libtiff/tif_dir.h
-@@ -291,6 +291,7 @@ struct _TIFFField {
- extern int _TIFFMergeFields(TIFF*, const TIFFField[], uint32);
- extern const TIFFField* _TIFFFindOrRegisterField(TIFF *, uint32, TIFFDataType);
- extern  TIFFField* _TIFFCreateAnonField(TIFF *, uint32, TIFFDataType);
-+extern int _TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag);
- 
- #if defined(__cplusplus)
- }
-diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
-index 0c8ef42..97c0df0 100644
---- a/libtiff/tif_dirinfo.c
-+++ b/libtiff/tif_dirinfo.c
-@@ -956,6 +956,109 @@ TIFFMergeFieldInfo(TIFF* tif, const TIFFFieldInfo info[], uint32 n)
- 	return 0;
- }
- 
-+int
-+_TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag)
-+{
-+	/* Filter out non-codec specific tags */
-+	switch (tag) {
-+	    /* Shared tags */
-+	    case TIFFTAG_PREDICTOR:
-+	    /* JPEG tags */
-+	    case TIFFTAG_JPEGTABLES:
-+	    /* OJPEG tags */
-+	    case TIFFTAG_JPEGIFOFFSET:
-+	    case TIFFTAG_JPEGIFBYTECOUNT:
-+	    case TIFFTAG_JPEGQTABLES:
-+	    case TIFFTAG_JPEGDCTABLES:
-+	    case TIFFTAG_JPEGACTABLES:
-+	    case TIFFTAG_JPEGPROC:
-+	    case TIFFTAG_JPEGRESTARTINTERVAL:
-+	    /* CCITT* */
-+	    case TIFFTAG_BADFAXLINES:
-+	    case TIFFTAG_CLEANFAXDATA:
-+	    case TIFFTAG_CONSECUTIVEBADFAXLINES:
-+	    case TIFFTAG_GROUP3OPTIONS:
-+	    case TIFFTAG_GROUP4OPTIONS:
-+		break;
-+	    default:
-+		return 1;
-+	}
-+	/* Check if codec specific tags are allowed for the current
-+	 * compression scheme (codec) */
-+	switch (tif->tif_dir.td_compression) {
-+	    case COMPRESSION_LZW:
-+		if (tag == TIFFTAG_PREDICTOR)
-+		    return 1;
-+		break;
-+	    case COMPRESSION_PACKBITS:
-+		/* No codec-specific tags */
-+		break;
-+	    case COMPRESSION_THUNDERSCAN:
-+		/* No codec-specific tags */
-+		break;
-+	    case COMPRESSION_NEXT:
-+		/* No codec-specific tags */
-+		break;
-+	    case COMPRESSION_JPEG:
-+		if (tag == TIFFTAG_JPEGTABLES)
-+		    return 1;
-+		break;
-+	    case COMPRESSION_OJPEG:
-+		switch (tag) {
-+		    case TIFFTAG_JPEGIFOFFSET:
-+		    case TIFFTAG_JPEGIFBYTECOUNT:
-+		    case TIFFTAG_JPEGQTABLES:
-+		    case TIFFTAG_JPEGDCTABLES:
-+		    case TIFFTAG_JPEGACTABLES:
-+		    case TIFFTAG_JPEGPROC:
-+		    case TIFFTAG_JPEGRESTARTINTERVAL:
-+			return 1;
-+		}
-+		break;
-+	    case COMPRESSION_CCITTRLE:
-+	    case COMPRESSION_CCITTRLEW:
-+	    case COMPRESSION_CCITTFAX3:
-+	    case COMPRESSION_CCITTFAX4:
-+		switch (tag) {
-+		    case TIFFTAG_BADFAXLINES:
-+		    case TIFFTAG_CLEANFAXDATA:
-+		    case TIFFTAG_CONSECUTIVEBADFAXLINES:
-+			return 1;
-+		    case TIFFTAG_GROUP3OPTIONS:
-+			if (tif->tif_dir.td_compression == COMPRESSION_CCITTFAX3)
-+			    return 1;
-+			break;
-+		    case TIFFTAG_GROUP4OPTIONS:
-+			if (tif->tif_dir.td_compression == COMPRESSION_CCITTFAX4)
-+			    return 1;
-+			break;
-+		}
-+		break;
-+	    case COMPRESSION_JBIG:
-+		/* No codec-specific tags */
-+		break;
-+	    case COMPRESSION_DEFLATE:
-+	    case COMPRESSION_ADOBE_DEFLATE:
-+		if (tag == TIFFTAG_PREDICTOR)
-+		    return 1;
-+		break;
-+	   case COMPRESSION_PIXARLOG:
-+		if (tag == TIFFTAG_PREDICTOR)
-+		    return 1;
-+		break;
-+	    case COMPRESSION_SGILOG:
-+	    case COMPRESSION_SGILOG24:
-+		/* No codec-specific tags */
-+		break;
-+	    case COMPRESSION_LZMA:
-+		if (tag == TIFFTAG_PREDICTOR)
-+		    return 1;
-+		break;
-+
-+	}
-+	return 0;
-+}
-+
- /* vim: set ts=8 sts=8 sw=8 noet: */
- 
- /*
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 1d4f0b9..f1dc3d7 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -3580,6 +3580,10 @@ TIFFReadDirectory(TIFF* tif)
- 							goto bad;
- 						dp->tdir_tag=IGNORE;
- 						break;
-+                                        default:
-+                                            if( !_TIFFCheckFieldIsValidForCodec(tif, dp->tdir_tag) )
-+                                                dp->tdir_tag=IGNORE;
-+                                            break;
- 				}
- 			}
- 		}
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch
deleted file mode 100644
index fc99363..0000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 62efea76592647426deec5592fd7274d5c950646 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Mon, 26 Jun 2017 15:19:59 +0000
-Subject: [PATCH] * libtiff/tif_jbig.c: fix memory leak in error code path of
- JBIGDecode() Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2706 Reported
- by team OWL337
-
-* libtiff/tif_jpeg.c: error out at decoding time if anticipated libjpeg
-
-Upstream-Status: Backport
-[https://github.com/vadz/libtiff/commit/fe8d7165956b88df4837034a9161dc5fd20cf67a]
-
-CVE: CVE-2017-9936
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- ChangeLog          | 6 ++++++
- libtiff/tif_jbig.c | 1 +
- 2 files changed, 7 insertions(+)
-
-diff --git a/ChangeLog b/ChangeLog
-index 5739292..0240f0b 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,9 @@
-+2017-06-26  Even Rouault <even.rouault at spatialys.com>
-+
-+	* libtiff/tif_jbig.c: fix memory leak in error code path of JBIGDecode()
-+	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2706
-+	Reported by team OWL337
-+
- 2017-06-01  Even Rouault <even.rouault at spatialys.com>
- 
- 	* libtiff/tif_dirinfo.c, tif_dirread.c: add _TIFFCheckFieldIsValidForCodec(),
-diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
-index 5f5f75e..c75f31d 100644
---- a/libtiff/tif_jbig.c
-+++ b/libtiff/tif_jbig.c
-@@ -94,6 +94,7 @@ static int JBIGDecode(TIFF* tif, uint8* buffer, tmsize_t size, uint16 s)
- 			     jbg_strerror(decodeStatus)
- #endif
- 			     );
-+		jbg_dec_free(&decoder);
- 		return 0;
- 	}
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
similarity index 81%
rename from meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
index cb91baa..57bf740 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
@@ -6,16 +6,10 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
-           file://CVE-2017-9147.patch \
-           file://CVE-2017-9936.patch \
-           file://CVE-2017-10688.patch \
-           file://CVE-2017-11335.patch \
-           file://CVE-2017-13726.patch \
-           file://CVE-2017-13727.patch \
           "
 
-SRC_URI[md5sum] = "2a7d1c1318416ddf36d5f6fa4600069b"
-SRC_URI[sha256sum] = "59d7a5a8ccd92059913f246877db95a2918e6c04fb9d43fd74e5c3390dac2910"
+SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"
+SRC_URI[sha256sum] = "6e7bdeec2c310734e734d19aae3a71ebe37a4d842e0e23dbb1b8921c0026cfcd"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.7.4




