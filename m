Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6164F78293
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 00:57:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M0vpqJ028840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 17:57:52 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 21 Aug 2017 17:57:50 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Aug 2017 08:58:35 +0800
Message-ID: <1503363515-28585-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] tiff: Security fixes
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
X-List-Received-Date: Tue, 22 Aug 2017 00:57:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fix CVE-2017-9147, CVE-2017-9936, CVE-2017-10668, CVE-2017-11335

References:
https://nvd.nist.gov/vuln/detail/CVE-2017-9147
https://nvd.nist.gov/vuln/detail/CVE-2017-9936
https://nvd.nist.gov/vuln/detail/CVE-2017-10668
https://nvd.nist.gov/vuln/detail/CVE-2017-11335

Patches from:
CVE-2017-9147:
https://github.com/vadz/libtiff/commit/4d4fa0b68ae9ae038959ee4f69ebe288ec892f06
CVE-2017-9936:
https://github.com/vadz/libtiff/commit/fe8d7165956b88df4837034a9161dc5fd20cf67a
CVE-2017-10688:
https://github.com/vadz/libtiff/commit/6173a57d39e04d68b139f8c1aa499a24dbe74ba1
CVE-2017-11355:
https://github.com/vadz/libtiff/commit/69bfeec247899776b1b396651adb47436e5f1556

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2017-10688.patch             |  91 +++++++++
 .../libtiff/files/CVE-2017-11335.patch             |  54 ++++++
 .../libtiff/files/CVE-2017-9147.patch              | 206 +++++++++++++++++++++
 .../libtiff/files/CVE-2017-9936.patch              |  49 +++++
 meta/recipes-multimedia/libtiff/tiff_4.0.8.bb      |   4 +
 5 files changed, 404 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch
new file mode 100644
index 0000000..b0db969
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-10688.patch
@@ -0,0 +1,91 @@
+From 333ba5599e87bd7747516d7863d61764e4ca2d92 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Fri, 30 Jun 2017 17:29:44 +0000
+Subject: [PATCH] * libtiff/tif_dirwrite.c: in
+ TIFFWriteDirectoryTagCheckedXXXX() functions associated with LONG8/SLONG8
+ data type, replace assertion that the file is BigTIFF, by a non-fatal error.
+ Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2712 Reported by team
+ OWL337
+
+Upstream-Status: Backport
+[https://github.com/vadz/libtiff/commit/6173a57d39e04d68b139f8c1aa499a24dbe74ba1]
+
+CVE: CVE-2017-10688
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ChangeLog              |  8 ++++++++
+ libtiff/tif_dirwrite.c | 20 ++++++++++++++++----
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 0240f0b..42eaeb7 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2017-06-30  Even Rouault <even.rouault at spatialys.com>
++
++	* libtiff/tif_dirwrite.c: in TIFFWriteDirectoryTagCheckedXXXX()
++	functions associated with LONG8/SLONG8 data type, replace assertion that
++	the file is BigTIFF, by a non-fatal error.
++	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2712
++	Reported by team OWL337
++
+ 2017-06-26  Even Rouault <even.rouault at spatialys.com>
+ 
+ 	* libtiff/tif_jbig.c: fix memory leak in error code path of JBIGDecode()
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 2967da5..8d6686b 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -2111,7 +2111,10 @@ TIFFWriteDirectoryTagCheckedLong8(TIFF* tif, uint32* ndir, TIFFDirEntry* dir, ui
+ {
+ 	uint64 m;
+ 	assert(sizeof(uint64)==8);
+-	assert(tif->tif_flags&TIFF_BIGTIFF);
++	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
++		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","LONG8 not allowed for ClassicTIFF");
++		return(0);
++	}
+ 	m=value;
+ 	if (tif->tif_flags&TIFF_SWAB)
+ 		TIFFSwabLong8(&m);
+@@ -2124,7 +2127,10 @@ TIFFWriteDirectoryTagCheckedLong8Array(TIFF* tif, uint32* ndir, TIFFDirEntry* di
+ {
+ 	assert(count<0x20000000);
+ 	assert(sizeof(uint64)==8);
+-	assert(tif->tif_flags&TIFF_BIGTIFF);
++	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
++		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","LONG8 not allowed for ClassicTIFF");
++		return(0);
++	}
+ 	if (tif->tif_flags&TIFF_SWAB)
+ 		TIFFSwabArrayOfLong8(value,count);
+ 	return(TIFFWriteDirectoryTagData(tif,ndir,dir,tag,TIFF_LONG8,count,count*8,value));
+@@ -2136,7 +2142,10 @@ TIFFWriteDirectoryTagCheckedSlong8(TIFF* tif, uint32* ndir, TIFFDirEntry* dir, u
+ {
+ 	int64 m;
+ 	assert(sizeof(int64)==8);
+-	assert(tif->tif_flags&TIFF_BIGTIFF);
++	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
++		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","SLONG8 not allowed for ClassicTIFF");
++		return(0);
++	}
+ 	m=value;
+ 	if (tif->tif_flags&TIFF_SWAB)
+ 		TIFFSwabLong8((uint64*)(&m));
+@@ -2149,7 +2158,10 @@ TIFFWriteDirectoryTagCheckedSlong8Array(TIFF* tif, uint32* ndir, TIFFDirEntry* d
+ {
+ 	assert(count<0x20000000);
+ 	assert(sizeof(int64)==8);
+-	assert(tif->tif_flags&TIFF_BIGTIFF);
++	if( !(tif->tif_flags&TIFF_BIGTIFF) ) {
++		TIFFErrorExt(tif->tif_clientdata,"TIFFWriteDirectoryTagCheckedLong8","SLONG8 not allowed for ClassicTIFF");
++		return(0);
++	}
+ 	if (tif->tif_flags&TIFF_SWAB)
+ 		TIFFSwabArrayOfLong8((uint64*)value,count);
+ 	return(TIFFWriteDirectoryTagData(tif,ndir,dir,tag,TIFF_SLONG8,count,count*8,value));
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch
new file mode 100644
index 0000000..d08e7612
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-11335.patch
@@ -0,0 +1,54 @@
+From e8b15ccf8c9c593000f8202cf34cc6c4b936d01e Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 15 Jul 2017 11:13:46 +0000
+Subject: [PATCH] * tools/tiff2pdf.c: prevent heap buffer overflow write in
+ "Raw" mode on PlanarConfig=Contig input images. Fixes
+ http://bugzilla.maptools.org/show_bug.cgi?id=2715 Reported by team OWL337
+
+Upstream-Status: Backport
+[https://github.com/vadz/libtiff/commit/69bfeec247899776b1b396651adb47436e5f1556]
+
+CVE: CVE-2017-11355
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ChangeLog        | 7 +++++++
+ tools/tiff2pdf.c | 7 ++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 42eaeb7..6980da8 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,10 @@
++2017-07-15  Even Rouault <even.rouault at spatialys.com>
++
++	* tools/tiff2pdf.c: prevent heap buffer overflow write in "Raw"
++	mode on PlanarConfig=Contig input images.
++	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2715
++	Reported by team OWL337
++
+ 2017-06-30  Even Rouault <even.rouault at spatialys.com>
+ 
+ 	* libtiff/tif_dirwrite.c: in TIFFWriteDirectoryTagCheckedXXXX()
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index db196e0..cd1e235 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -1737,7 +1737,12 @@ void t2p_read_tiff_data(T2P* t2p, TIFF* input){
+ 	    return;
+ 
+ 	t2p->pdf_transcode = T2P_TRANSCODE_ENCODE;
+-	if(t2p->pdf_nopassthrough==0){
++        /* It seems that T2P_TRANSCODE_RAW mode doesn't support separate->contig */
++        /* conversion. At least t2p_read_tiff_size and t2p_read_tiff_size_tile */
++        /* do not take into account the number of samples, and thus */
++        /* that can cause heap buffer overflows such as in */
++        /* http://bugzilla.maptools.org/show_bug.cgi?id=2715 */
++	if(t2p->pdf_nopassthrough==0 && t2p->tiff_planar!=PLANARCONFIG_SEPARATE){
+ #ifdef CCITT_SUPPORT
+ 		if(t2p->tiff_compression==COMPRESSION_CCITTFAX4  
+ 			){
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch
new file mode 100644
index 0000000..3392285
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-9147.patch
@@ -0,0 +1,206 @@
+From 0acf01fea714af573b814e10cf105c3359a236c3 Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Thu, 1 Jun 2017 12:44:04 +0000
+Subject: [PATCH] * libtiff/tif_dirinfo.c, tif_dirread.c: add _TIFFCheckFieldIsValidForCodec(),
+and use it in TIFFReadDirectory() so as to ignore fields whose tag is a
+codec-specified tag but this codec is not enabled. This avoids TIFFGetField()
+to behave differently depending on whether the codec is enabled or not, and
+thus can avoid stack based buffer overflows in a number of TIFF utilities
+such as tiffsplit, tiffcmp, thumbnail, etc.
+Patch derived from 0063-Handle-properly-CODEC-specific-tags.patch
+(http://bugzilla.maptools.org/show_bug.cgi?id=2580) by Raphaël Hertzog.
+Fixes:
+http://bugzilla.maptools.org/show_bug.cgi?id=2580
+http://bugzilla.maptools.org/show_bug.cgi?id=2693
+http://bugzilla.maptools.org/show_bug.cgi?id=2625 (CVE-2016-10095)
+http://bugzilla.maptools.org/show_bug.cgi?id=2564 (CVE-2015-7554)
+http://bugzilla.maptools.org/show_bug.cgi?id=2561 (CVE-2016-5318)
+http://bugzilla.maptools.org/show_bug.cgi?id=2499 (CVE-2014-8128)
+http://bugzilla.maptools.org/show_bug.cgi?id=2441
+http://bugzilla.maptools.org/show_bug.cgi?id=2433
+
+Upstream-Status: Backport
+[https://github.com/vadz/libtiff/commit/4d4fa0b68ae9ae038959ee4f69ebe288ec892f06]
+
+CVE: CVE-2017-9147
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ChangeLog             |  20 ++++++++++
+ libtiff/tif_dir.h     |   1 +
+ libtiff/tif_dirinfo.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ libtiff/tif_dirread.c |   4 ++
+ 4 files changed, 128 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index ee8d9d0..5739292 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,23 @@
++2017-06-01  Even Rouault <even.rouault at spatialys.com>
++
++	* libtiff/tif_dirinfo.c, tif_dirread.c: add _TIFFCheckFieldIsValidForCodec(),
++	and use it in TIFFReadDirectory() so as to ignore fields whose tag is a
++	codec-specified tag but this codec is not enabled. This avoids TIFFGetField()
++	to behave differently depending on whether the codec is enabled or not, and
++	thus can avoid stack based buffer overflows in a number of TIFF utilities
++	such as tiffsplit, tiffcmp, thumbnail, etc.
++	Patch derived from 0063-Handle-properly-CODEC-specific-tags.patch
++	(http://bugzilla.maptools.org/show_bug.cgi?id=2580) by Raphaël Hertzog.
++	Fixes:
++	http://bugzilla.maptools.org/show_bug.cgi?id=2580
++	http://bugzilla.maptools.org/show_bug.cgi?id=2693
++	http://bugzilla.maptools.org/show_bug.cgi?id=2625 (CVE-2016-10095)
++	http://bugzilla.maptools.org/show_bug.cgi?id=2564 (CVE-2015-7554)
++	http://bugzilla.maptools.org/show_bug.cgi?id=2561 (CVE-2016-5318)
++	http://bugzilla.maptools.org/show_bug.cgi?id=2499 (CVE-2014-8128)
++	http://bugzilla.maptools.org/show_bug.cgi?id=2441
++	http://bugzilla.maptools.org/show_bug.cgi?id=2433
++
+ 2017-05-21  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
+ 
+ 	* configure.ac: libtiff 4.0.8 released.
+diff --git a/libtiff/tif_dir.h b/libtiff/tif_dir.h
+index e12b44b..5206be4 100644
+--- a/libtiff/tif_dir.h
++++ b/libtiff/tif_dir.h
+@@ -291,6 +291,7 @@ struct _TIFFField {
+ extern int _TIFFMergeFields(TIFF*, const TIFFField[], uint32);
+ extern const TIFFField* _TIFFFindOrRegisterField(TIFF *, uint32, TIFFDataType);
+ extern  TIFFField* _TIFFCreateAnonField(TIFF *, uint32, TIFFDataType);
++extern int _TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag);
+ 
+ #if defined(__cplusplus)
+ }
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index 0c8ef42..97c0df0 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -956,6 +956,109 @@ TIFFMergeFieldInfo(TIFF* tif, const TIFFFieldInfo info[], uint32 n)
+ 	return 0;
+ }
+ 
++int
++_TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag)
++{
++	/* Filter out non-codec specific tags */
++	switch (tag) {
++	    /* Shared tags */
++	    case TIFFTAG_PREDICTOR:
++	    /* JPEG tags */
++	    case TIFFTAG_JPEGTABLES:
++	    /* OJPEG tags */
++	    case TIFFTAG_JPEGIFOFFSET:
++	    case TIFFTAG_JPEGIFBYTECOUNT:
++	    case TIFFTAG_JPEGQTABLES:
++	    case TIFFTAG_JPEGDCTABLES:
++	    case TIFFTAG_JPEGACTABLES:
++	    case TIFFTAG_JPEGPROC:
++	    case TIFFTAG_JPEGRESTARTINTERVAL:
++	    /* CCITT* */
++	    case TIFFTAG_BADFAXLINES:
++	    case TIFFTAG_CLEANFAXDATA:
++	    case TIFFTAG_CONSECUTIVEBADFAXLINES:
++	    case TIFFTAG_GROUP3OPTIONS:
++	    case TIFFTAG_GROUP4OPTIONS:
++		break;
++	    default:
++		return 1;
++	}
++	/* Check if codec specific tags are allowed for the current
++	 * compression scheme (codec) */
++	switch (tif->tif_dir.td_compression) {
++	    case COMPRESSION_LZW:
++		if (tag == TIFFTAG_PREDICTOR)
++		    return 1;
++		break;
++	    case COMPRESSION_PACKBITS:
++		/* No codec-specific tags */
++		break;
++	    case COMPRESSION_THUNDERSCAN:
++		/* No codec-specific tags */
++		break;
++	    case COMPRESSION_NEXT:
++		/* No codec-specific tags */
++		break;
++	    case COMPRESSION_JPEG:
++		if (tag == TIFFTAG_JPEGTABLES)
++		    return 1;
++		break;
++	    case COMPRESSION_OJPEG:
++		switch (tag) {
++		    case TIFFTAG_JPEGIFOFFSET:
++		    case TIFFTAG_JPEGIFBYTECOUNT:
++		    case TIFFTAG_JPEGQTABLES:
++		    case TIFFTAG_JPEGDCTABLES:
++		    case TIFFTAG_JPEGACTABLES:
++		    case TIFFTAG_JPEGPROC:
++		    case TIFFTAG_JPEGRESTARTINTERVAL:
++			return 1;
++		}
++		break;
++	    case COMPRESSION_CCITTRLE:
++	    case COMPRESSION_CCITTRLEW:
++	    case COMPRESSION_CCITTFAX3:
++	    case COMPRESSION_CCITTFAX4:
++		switch (tag) {
++		    case TIFFTAG_BADFAXLINES:
++		    case TIFFTAG_CLEANFAXDATA:
++		    case TIFFTAG_CONSECUTIVEBADFAXLINES:
++			return 1;
++		    case TIFFTAG_GROUP3OPTIONS:
++			if (tif->tif_dir.td_compression == COMPRESSION_CCITTFAX3)
++			    return 1;
++			break;
++		    case TIFFTAG_GROUP4OPTIONS:
++			if (tif->tif_dir.td_compression == COMPRESSION_CCITTFAX4)
++			    return 1;
++			break;
++		}
++		break;
++	    case COMPRESSION_JBIG:
++		/* No codec-specific tags */
++		break;
++	    case COMPRESSION_DEFLATE:
++	    case COMPRESSION_ADOBE_DEFLATE:
++		if (tag == TIFFTAG_PREDICTOR)
++		    return 1;
++		break;
++	   case COMPRESSION_PIXARLOG:
++		if (tag == TIFFTAG_PREDICTOR)
++		    return 1;
++		break;
++	    case COMPRESSION_SGILOG:
++	    case COMPRESSION_SGILOG24:
++		/* No codec-specific tags */
++		break;
++	    case COMPRESSION_LZMA:
++		if (tag == TIFFTAG_PREDICTOR)
++		    return 1;
++		break;
++
++	}
++	return 0;
++}
++
+ /* vim: set ts=8 sts=8 sw=8 noet: */
+ 
+ /*
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 1d4f0b9..f1dc3d7 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -3580,6 +3580,10 @@ TIFFReadDirectory(TIFF* tif)
+ 							goto bad;
+ 						dp->tdir_tag=IGNORE;
+ 						break;
++                                        default:
++                                            if( !_TIFFCheckFieldIsValidForCodec(tif, dp->tdir_tag) )
++                                                dp->tdir_tag=IGNORE;
++                                            break;
+ 				}
+ 			}
+ 		}
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch
new file mode 100644
index 0000000..fc99363
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2017-9936.patch
@@ -0,0 +1,49 @@
+From 62efea76592647426deec5592fd7274d5c950646 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 26 Jun 2017 15:19:59 +0000
+Subject: [PATCH] * libtiff/tif_jbig.c: fix memory leak in error code path of
+ JBIGDecode() Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2706 Reported
+ by team OWL337
+
+* libtiff/tif_jpeg.c: error out at decoding time if anticipated libjpeg
+
+Upstream-Status: Backport
+[https://github.com/vadz/libtiff/commit/fe8d7165956b88df4837034a9161dc5fd20cf67a]
+
+CVE: CVE-2017-9936
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ChangeLog          | 6 ++++++
+ libtiff/tif_jbig.c | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 5739292..0240f0b 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2017-06-26  Even Rouault <even.rouault at spatialys.com>
++
++	* libtiff/tif_jbig.c: fix memory leak in error code path of JBIGDecode()
++	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2706
++	Reported by team OWL337
++
+ 2017-06-01  Even Rouault <even.rouault at spatialys.com>
+ 
+ 	* libtiff/tif_dirinfo.c, tif_dirread.c: add _TIFFCheckFieldIsValidForCodec(),
+diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
+index 5f5f75e..c75f31d 100644
+--- a/libtiff/tif_jbig.c
++++ b/libtiff/tif_jbig.c
+@@ -94,6 +94,7 @@ static int JBIGDecode(TIFF* tif, uint8* buffer, tmsize_t size, uint16 s)
+ 			     jbg_strerror(decodeStatus)
+ #endif
+ 			     );
++		jbg_dec_free(&decoder);
+ 		return 0;
+ 	}
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
index 4a7aecc..c8ad5d5 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.8.bb
@@ -6,6 +6,10 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
+           file://CVE-2017-9147.patch \
+           file://CVE-2017-9936.patch \
+           file://CVE-2017-10688.patch \
+           file://CVE-2017-11335.patch \
           "
 
 SRC_URI[md5sum] = "2a7d1c1318416ddf36d5f6fa4600069b"
-- 
2.7.4


