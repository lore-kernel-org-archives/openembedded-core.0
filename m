Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A776F7199C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 09:46:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uAE9ksSP021348
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 01:46:54 -0800 (PST)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Mon, 14 Nov 2016 01:46:53 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2016 17:46:52 +0800
Message-ID: <1479116812-18404-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tiff: Security fix CVE-2016-3658
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
X-List-Received-Date: Mon, 14 Nov 2016 09:46:53 -0000
Content-Type: text/plain

The TIFFWriteDirectoryTagLongLong8Array function in tif_dirwrite.c in the tiffset tool
allows remote attackers to cause a denial of service (out-of-bounds read) via vectors
involving the ma variable.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3658
http://bugzilla.maptools.org/show_bug.cgi?id=2546

Patch from:
https://github.com/vadz/libtiff/commit/45c68450bef8ad876f310b495165c513cad8b67d

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../libtiff/files/CVE-2016-3658.patch              | 111 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
new file mode 100644
index 0000000..2f464cd
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
@@ -0,0 +1,111 @@
+From: 45c68450bef8ad876f310b495165c513cad8b67d
+From: Even Rouault <even.rouault@spatialys.com>
+
+* libtiff/tif_dir.c: discard values of SMinSampleValue and
+SMaxSampleValue when they have been read and the value of
+SamplesPerPixel is changed afterwards (like when reading a
+OJPEG compressed image with a missing SamplesPerPixel tag,
+and whose photometric is RGB or YCbCr, forcing SamplesPerPixel
+being 3). Otherwise when rewriting the directory (for example
+with tiffset, we will expect 3 values whereas the array had been
+allocated with just one), thus causing a out of bound read access.
+Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2500
+(CVE-2014-8127, duplicate: CVE-2016-3658)
+
+* libtiff/tif_write.c: avoid null pointer dereference on td_stripoffset
+when writing directory, if FIELD_STRIPOFFSETS was artificially set
+for a hack case	in OJPEG case.
+Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2500
+(CVE-2014-8127, duplicate: CVE-2016-3658)
+
+CVE: CVE-2016-3658
+Upstream-Status: Backport
+https://github.com/vadz/libtiff/commit/45c68450bef8ad876f310b495165c513cad8b67d
+
+Signed-off-by: Zhixiong.Chi <zhixiong.chi@windriver.com>
+
+Index: tiff-4.0.6/ChangeLog
+===================================================================
+--- tiff-4.0.6.orig/ChangeLog	2016-11-14 10:52:10.008748230 +0800
++++ tiff-4.0.6/ChangeLog	2016-11-14 16:17:46.140884438 +0800
+@@ -1,3 +1,22 @@
++2016-10-25 Even Rouault <even.rouault at spatialys.com>
++
++	* libtiff/tif_dir.c: discard values of SMinSampleValue and
++	SMaxSampleValue when they have been read and the value of
++	SamplesPerPixel is changed afterwards (like when reading a
++	OJPEG compressed image with a missing SamplesPerPixel tag,
++	and whose photometric is RGB or YCbCr, forcing SamplesPerPixel
++	being 3). Otherwise when rewriting the directory (for example
++	with tiffset, we will expect 3 values whereas the array had been
++	allocated with just one), thus causing a out of bound read access.
++	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2500
++	(CVE-2014-8127, duplicate: CVE-2016-3658)
++
++	* libtiff/tif_write.c: avoid null pointer dereference on td_stripoffset
++	when writing directory, if FIELD_STRIPOFFSETS was artificially set
++	for a hack case	in OJPEG case.
++	Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2500
++	(CVE-2014-8127, duplicate: CVE-2016-3658)
++
+ 2016-09-24  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>
+ 
+ 	* libtiff/tif_getimage.c (TIFFRGBAImageOK): Reject attempts to
+Index: tiff-4.0.6/libtiff/tif_dir.c
+===================================================================
+--- tiff-4.0.6.orig/libtiff/tif_dir.c	2015-06-01 07:11:43.000000000 +0800
++++ tiff-4.0.6/libtiff/tif_dir.c	2016-11-14 16:20:17.800885495 +0800
+@@ -254,6 +254,28 @@
+ 		v = (uint16) va_arg(ap, uint16_vap);
+ 		if (v == 0)
+ 			goto badvalue;
++		if( v != td->td_samplesperpixel )
++		{
++		    /* See http://bugzilla.maptools.org/show_bug.cgi?id=2500 */
++		    if( td->td_sminsamplevalue != NULL )
++		    {
++		        TIFFWarningExt(tif->tif_clientdata,module,
++		            "SamplesPerPixel tag value is changing, "
++		            "but SMinSampleValue tag was read with a different value. Cancelling it");
++		        TIFFClrFieldBit(tif,FIELD_SMINSAMPLEVALUE);
++		        _TIFFfree(td->td_sminsamplevalue);
++		        td->td_sminsamplevalue = NULL;
++		    }
++		    if( td->td_smaxsamplevalue != NULL )
++		    {
++		        TIFFWarningExt(tif->tif_clientdata,module,
++		            "SamplesPerPixel tag value is changing, "
++		            "but SMaxSampleValue tag was read with a different value. Cancelling it");
++		        TIFFClrFieldBit(tif,FIELD_SMAXSAMPLEVALUE);
++		        _TIFFfree(td->td_smaxsamplevalue);
++		        td->td_smaxsamplevalue = NULL;
++		    }
++		}
+ 		td->td_samplesperpixel = (uint16) v;
+ 		break;
+ 	case TIFFTAG_ROWSPERSTRIP:
+Index: tiff-4.0.6/libtiff/tif_dirwrite.c
+===================================================================
+--- tiff-4.0.6.orig/libtiff/tif_dirwrite.c	2015-05-31 08:38:46.000000000 +0800
++++ tiff-4.0.6/libtiff/tif_dirwrite.c	2016-11-14 16:23:54.688887007 +0800
+@@ -542,7 +542,19 @@
+ 			{
+ 				if (!isTiled(tif))
+ 				{
+-					if (!TIFFWriteDirectoryTagLongLong8Array(tif,&ndir,dir,TIFFTAG_STRIPOFFSETS,tif->tif_dir.td_nstrips,tif->tif_dir.td_stripoffset))
++					/* td_stripoffset might be NULL in an odd OJPEG case. See
++					 *  tif_dirread.c around line 3634.
++					 * XXX: OJPEG hack.
++					 * If a) compression is OJPEG, b) it's not a tiled TIFF,
++					 * and c) the number of strips is 1,
++					 * then we tolerate the absence of stripoffsets tag,
++					 * because, presumably, all required data is in the
++					 * JpegInterchangeFormat stream.
++					 * We can get here when using tiffset on such a file.
++					 * See http://bugzilla.maptools.org/show_bug.cgi?id=2500
++					*/
++					if (tif->tif_dir.td_stripoffset != NULL &&
++					    !TIFFWriteDirectoryTagLongLong8Array(tif,&ndir,dir,TIFFTAG_STRIPOFFSETS,tif->tif_dir.td_nstrips,tif->tif_dir.td_stripoffset))
+ 						goto bad;
+ 				}
+ 				else
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 796d86e..edd560f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2016-3991.patch \
            file://CVE-2016-3623.patch \
            file://CVE-2016-3622.patch \
+           file://CVE-2016-3658.patch \
           "
 
 SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
-- 
1.9.1


