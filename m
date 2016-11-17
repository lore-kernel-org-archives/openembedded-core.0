Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 855CE6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:08:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAH88GFl024389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 00:08:16 -0800
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 17 Nov 2016 00:08:15 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2016 16:08:09 +0800
Message-ID: <1479370090-26155-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479370090-26155-1-git-send-email-yi.zhao@windriver.com>
References: <1479370090-26155-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 1/2] tiff: Security fix CVE-2016-3658
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
X-List-Received-Date: Thu, 17 Nov 2016 08:08:15 -0000
Content-Type: text/plain

CVE-2016-3658 libtiff: The TIFFWriteDirectoryTagLongLong8Array function
in tif_dirwrite.c in the tiffset tool in LibTIFF 4.0.6 and earlier
allows remote attackers to cause a denial of service (out-of-bounds
read) via vectors involving the ma variable.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3658
http://www.openwall.com/lists/oss-security/2016/04/08/12
http://bugzilla.maptools.org/show_bug.cgi?id=2546

Patch from:
https://github.com/vadz/libtiff/commit/45c68450bef8ad876f310b495165c513cad8b67d

This git repository is a mirror of libtiff cvs repository at cvs.maptools.org
created and updated using "git cvsimport".

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/files/CVE-2016-3658.patch              | 120 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch b/meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
new file mode 100644
index 0000000..950c634
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
@@ -0,0 +1,120 @@
+From 45c68450bef8ad876f310b495165c513cad8b67d Mon Sep 17 00:00:00 2001
+From: erouault <erouault>
+Date: Tue, 25 Oct 2016 21:35:15 +0000
+Subject: [PATCH] * libtiff/tif_dir.c: discard values of SMinSampleValue and
+ SMaxSampleValue when they have been read and the value of SamplesPerPixel is
+ changed afterwards (like when reading a OJPEG compressed image with a missing
+ SamplesPerPixel tag, and whose photometric is RGB or YCbCr, forcing
+ SamplesPerPixel being 3). Otherwise when rewriting the directory (for example
+ with tiffset, we will expect 3 values whereas the array had been allocated
+ with just one), thus causing a out of bound read access. Fixes
+ http://bugzilla.maptools.org/show_bug.cgi?id=2500 (CVE-2014-8127, duplicate:
+ CVE-2016-3658)
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
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ ChangeLog              | 19 +++++++++++++++++++
+ libtiff/tif_dir.c      | 22 ++++++++++++++++++++++
+ libtiff/tif_dirwrite.c | 16 ++++++++++++++--
+ 3 files changed, 55 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 375fe02..8027964 100644
+--- a/ChangeLog
++++ b/ChangeLog
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
+diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
+index 8073480..160c5d4 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -256,6 +256,28 @@ _TIFFVSetField(TIFF* tif, uint32 tag, va_list ap)
+ 		v = (uint16) va_arg(ap, uint16_vap);
+ 		if (v == 0)
+ 			goto badvalue;
++        if( v != td->td_samplesperpixel )
++        {
++            /* See http://bugzilla.maptools.org/show_bug.cgi?id=2500 */
++            if( td->td_sminsamplevalue != NULL )
++            {
++                TIFFWarningExt(tif->tif_clientdata,module,
++                    "SamplesPerPixel tag value is changing, "
++                    "but SMinSampleValue tag was read with a different value. Cancelling it");
++                TIFFClrFieldBit(tif,FIELD_SMINSAMPLEVALUE);
++                _TIFFfree(td->td_sminsamplevalue);
++                td->td_sminsamplevalue = NULL;
++            }
++            if( td->td_smaxsamplevalue != NULL )
++            {
++                TIFFWarningExt(tif->tif_clientdata,module,
++                    "SamplesPerPixel tag value is changing, "
++                    "but SMaxSampleValue tag was read with a different value. Cancelling it");
++                TIFFClrFieldBit(tif,FIELD_SMAXSAMPLEVALUE);
++                _TIFFfree(td->td_smaxsamplevalue);
++                td->td_smaxsamplevalue = NULL;
++            }
++        }
+ 		td->td_samplesperpixel = (uint16) v;
+ 		break;
+ 	case TIFFTAG_ROWSPERSTRIP:
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 7e71818..8a3341e 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -542,8 +542,20 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
+ 			{
+ 				if (!isTiled(tif))
+ 				{
+-					if (!TIFFWriteDirectoryTagLongLong8Array(tif,&ndir,dir,TIFFTAG_STRIPOFFSETS,tif->tif_dir.td_nstrips,tif->tif_dir.td_stripoffset))
+-						goto bad;
++                    /* td_stripoffset might be NULL in an odd OJPEG case. See
++                     *  tif_dirread.c around line 3634.
++                     * XXX: OJPEG hack.
++                     * If a) compression is OJPEG, b) it's not a tiled TIFF,
++                     * and c) the number of strips is 1,
++                     * then we tolerate the absence of stripoffsets tag,
++                     * because, presumably, all required data is in the
++                     * JpegInterchangeFormat stream.
++                     * We can get here when using tiffset on such a file.
++                     * See http://bugzilla.maptools.org/show_bug.cgi?id=2500
++                    */
++                    if (tif->tif_dir.td_stripoffset != NULL &&
++                        !TIFFWriteDirectoryTagLongLong8Array(tif,&ndir,dir,TIFFTAG_STRIPOFFSETS,tif->tif_dir.td_nstrips,tif->tif_dir.td_stripoffset))
++                        goto bad;
+ 				}
+ 				else
+ 				{
+-- 
+2.7.4
+
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
2.7.4


