Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB03CC6FA83
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 00:32:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.3520.1663029127616196178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 17:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZdZtM3Ck;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663029127; x=1694565127;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YesnYAhf6TlPtrZ5H3vl3lGGlWCQUrozbFowTZ2hGk8=;
  b=ZdZtM3CkejY02YKaAHsLNMSIsqEZBswEq7lL6r5qmWu/cV+hjNc1Yh+d
   3/d1W1X71HJHUTVoQc3ykBi7xU5ZjJPIk/scdPHJS64jeOQSRnawlJwPC
   2AuKpQgOjGT9X59SGXTUUjwxpIiwwcXEZvJH9KmLYHNEho6GQcGm1bFjD
   wJSfskNTIt909Dn4h1oxSGXz1assocCQkGzeGqau/IxVBhpYHgUPAf5Sr
   /jZJp4crCm+UjgIvF3Lmkd6CMZF4dbhVp1pSkKBdIxVx//MUWkckpIecA
   4HzWSoaTOc2rUjRTiqkXgvAWsDbICVxShd6wBeIzfO9uk5Jiov4rUp96l
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="298005295"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200";
   d="scan'208";a="298005295"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200";
   d="scan'208";a="567375192"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 17:32:05 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] tiff: Security fixes CVE-2022-1354 and CVE-2022-1355
Date: Tue, 13 Sep 2022 08:32:05 +0800
Message-Id: <20220913003205.86537-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 00:32:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170550

From: Yi Zhao <yi.zhao@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-1354
https://security-tracker.debian.org/tracker/CVE-2022-1354

https://nvd.nist.gov/vuln/detail/CVE-2022-1355
https://security-tracker.debian.org/tracker/CVE-2022-1355

Patches from:

CVE-2022-1354:
https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798

CVE-2022-1355:
https://gitlab.com/libtiff/libtiff/-/commit/c1ae29f9ebacd29b7c3e0c7db671af7db3584bc2

(From OE-Core rev: 6c373c041f1dd45458866408d1ca16d47cacbd86)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../libtiff/tiff/CVE-2022-1354.patch          | 212 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-1355.patch          |  62 +++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   2 +
 3 files changed, 276 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
new file mode 100644
index 0000000000..71b85cac10
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
@@ -0,0 +1,212 @@
+From 87881e093691a35c60b91cafed058ba2dd5d9807 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 5 Dec 2021 14:37:46 +0100
+Subject: [PATCH] TIFFReadDirectory: fix OJPEG hack (fixes #319)
+
+to avoid having the size of the strip arrays inconsistent with the
+number of strips returned by TIFFNumberOfStrips(), which may cause
+out-ouf-bounds array read afterwards.
+
+One of the OJPEG hack that alters SamplesPerPixel may influence the
+number of strips. Hence compute tif_dir.td_nstrips only afterwards.
+
+CVE: CVE-2022-1354
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libtiff/tif_dirread.c | 162 ++++++++++++++++++++++--------------------
+ 1 file changed, 83 insertions(+), 79 deletions(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 8f434ef5..14c031d1 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -3794,50 +3794,7 @@ TIFFReadDirectory(TIFF* tif)
+ 		MissingRequired(tif,"ImageLength");
+ 		goto bad;
+ 	}
+-	/*
+-	 * Setup appropriate structures (by strip or by tile)
+-	 */
+-	if (!TIFFFieldSet(tif, FIELD_TILEDIMENSIONS)) {
+-		tif->tif_dir.td_nstrips = TIFFNumberOfStrips(tif);  
+-		tif->tif_dir.td_tilewidth = tif->tif_dir.td_imagewidth;
+-		tif->tif_dir.td_tilelength = tif->tif_dir.td_rowsperstrip;
+-		tif->tif_dir.td_tiledepth = tif->tif_dir.td_imagedepth;
+-		tif->tif_flags &= ~TIFF_ISTILED;
+-	} else {
+-		tif->tif_dir.td_nstrips = TIFFNumberOfTiles(tif);
+-		tif->tif_flags |= TIFF_ISTILED;
+-	}
+-	if (!tif->tif_dir.td_nstrips) {
+-		TIFFErrorExt(tif->tif_clientdata, module,
+-		    "Cannot handle zero number of %s",
+-		    isTiled(tif) ? "tiles" : "strips");
+-		goto bad;
+-	}
+-	tif->tif_dir.td_stripsperimage = tif->tif_dir.td_nstrips;
+-	if (tif->tif_dir.td_planarconfig == PLANARCONFIG_SEPARATE)
+-		tif->tif_dir.td_stripsperimage /= tif->tif_dir.td_samplesperpixel;
+-	if (!TIFFFieldSet(tif, FIELD_STRIPOFFSETS)) {
+-#ifdef OJPEG_SUPPORT
+-		if ((tif->tif_dir.td_compression==COMPRESSION_OJPEG) &&
+-		    (isTiled(tif)==0) &&
+-		    (tif->tif_dir.td_nstrips==1)) {
+-			/*
+-			 * XXX: OJPEG hack.
+-			 * If a) compression is OJPEG, b) it's not a tiled TIFF,
+-			 * and c) the number of strips is 1,
+-			 * then we tolerate the absence of stripoffsets tag,
+-			 * because, presumably, all required data is in the
+-			 * JpegInterchangeFormat stream.
+-			 */
+-			TIFFSetFieldBit(tif, FIELD_STRIPOFFSETS);
+-		} else
+-#endif
+-        {
+-			MissingRequired(tif,
+-				isTiled(tif) ? "TileOffsets" : "StripOffsets");
+-			goto bad;
+-		}
+-	}
++
+ 	/*
+ 	 * Second pass: extract other information.
+ 	 */
+@@ -4042,41 +3999,6 @@ TIFFReadDirectory(TIFF* tif)
+ 			} /* -- if (!dp->tdir_ignore) */
+ 		} /* -- for-loop -- */
+ 
+-        if( tif->tif_mode == O_RDWR &&
+-            tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 &&
+-            tif->tif_dir.td_stripoffset_entry.tdir_count == 0 &&
+-            tif->tif_dir.td_stripoffset_entry.tdir_type == 0 &&
+-            tif->tif_dir.td_stripoffset_entry.tdir_offset.toff_long8 == 0 &&
+-            tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 &&
+-            tif->tif_dir.td_stripbytecount_entry.tdir_count == 0 &&
+-            tif->tif_dir.td_stripbytecount_entry.tdir_type == 0 &&
+-            tif->tif_dir.td_stripbytecount_entry.tdir_offset.toff_long8 == 0 )
+-        {
+-            /* Directory typically created with TIFFDeferStrileArrayWriting() */
+-            TIFFSetupStrips(tif);
+-        }
+-        else if( !(tif->tif_flags&TIFF_DEFERSTRILELOAD) )
+-        {
+-            if( tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 )
+-            {
+-                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripoffset_entry),
+-                                         tif->tif_dir.td_nstrips,
+-                                         &tif->tif_dir.td_stripoffset_p))
+-                {
+-                    goto bad;
+-                }
+-            }
+-            if( tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 )
+-            {
+-                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripbytecount_entry),
+-                                         tif->tif_dir.td_nstrips,
+-                                         &tif->tif_dir.td_stripbytecount_p))
+-                {
+-                    goto bad;
+-                }
+-            }
+-        }
+-
+ 	/*
+ 	 * OJPEG hack:
+ 	 * - If a) compression is OJPEG, and b) photometric tag is missing,
+@@ -4147,6 +4069,88 @@ TIFFReadDirectory(TIFF* tif)
+ 		}
+ 	}
+ 
++	/*
++	 * Setup appropriate structures (by strip or by tile)
++	 * We do that only after the above OJPEG hack which alters SamplesPerPixel
++	 * and thus influences the number of strips in the separate planarconfig.
++	 */
++	if (!TIFFFieldSet(tif, FIELD_TILEDIMENSIONS)) {
++		tif->tif_dir.td_nstrips = TIFFNumberOfStrips(tif);  
++		tif->tif_dir.td_tilewidth = tif->tif_dir.td_imagewidth;
++		tif->tif_dir.td_tilelength = tif->tif_dir.td_rowsperstrip;
++		tif->tif_dir.td_tiledepth = tif->tif_dir.td_imagedepth;
++		tif->tif_flags &= ~TIFF_ISTILED;
++	} else {
++		tif->tif_dir.td_nstrips = TIFFNumberOfTiles(tif);
++		tif->tif_flags |= TIFF_ISTILED;
++	}
++	if (!tif->tif_dir.td_nstrips) {
++		TIFFErrorExt(tif->tif_clientdata, module,
++		    "Cannot handle zero number of %s",
++		    isTiled(tif) ? "tiles" : "strips");
++		goto bad;
++	}
++	tif->tif_dir.td_stripsperimage = tif->tif_dir.td_nstrips;
++	if (tif->tif_dir.td_planarconfig == PLANARCONFIG_SEPARATE)
++		tif->tif_dir.td_stripsperimage /= tif->tif_dir.td_samplesperpixel;
++	if (!TIFFFieldSet(tif, FIELD_STRIPOFFSETS)) {
++#ifdef OJPEG_SUPPORT
++		if ((tif->tif_dir.td_compression==COMPRESSION_OJPEG) &&
++		    (isTiled(tif)==0) &&
++		    (tif->tif_dir.td_nstrips==1)) {
++			/*
++			 * XXX: OJPEG hack.
++			 * If a) compression is OJPEG, b) it's not a tiled TIFF,
++			 * and c) the number of strips is 1,
++			 * then we tolerate the absence of stripoffsets tag,
++			 * because, presumably, all required data is in the
++			 * JpegInterchangeFormat stream.
++			 */
++			TIFFSetFieldBit(tif, FIELD_STRIPOFFSETS);
++		} else
++#endif
++        {
++			MissingRequired(tif,
++				isTiled(tif) ? "TileOffsets" : "StripOffsets");
++			goto bad;
++		}
++	}
++
++        if( tif->tif_mode == O_RDWR &&
++            tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 &&
++            tif->tif_dir.td_stripoffset_entry.tdir_count == 0 &&
++            tif->tif_dir.td_stripoffset_entry.tdir_type == 0 &&
++            tif->tif_dir.td_stripoffset_entry.tdir_offset.toff_long8 == 0 &&
++            tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 &&
++            tif->tif_dir.td_stripbytecount_entry.tdir_count == 0 &&
++            tif->tif_dir.td_stripbytecount_entry.tdir_type == 0 &&
++            tif->tif_dir.td_stripbytecount_entry.tdir_offset.toff_long8 == 0 )
++        {
++            /* Directory typically created with TIFFDeferStrileArrayWriting() */
++            TIFFSetupStrips(tif);
++        }
++        else if( !(tif->tif_flags&TIFF_DEFERSTRILELOAD) )
++        {
++            if( tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 )
++            {
++                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripoffset_entry),
++                                         tif->tif_dir.td_nstrips,
++                                         &tif->tif_dir.td_stripoffset_p))
++                {
++                    goto bad;
++                }
++            }
++            if( tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 )
++            {
++                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripbytecount_entry),
++                                         tif->tif_dir.td_nstrips,
++                                         &tif->tif_dir.td_stripbytecount_p))
++                {
++                    goto bad;
++                }
++            }
++        }
++
+ 	/*
+ 	 * Make sure all non-color channels are extrasamples.
+ 	 * If it's not the case, define them as such.
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
new file mode 100644
index 0000000000..e59f5aad55
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
@@ -0,0 +1,62 @@
+From fb1db384959698edd6caeea84e28253d272a0f96 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sat, 2 Apr 2022 22:33:31 +0200
+Subject: [PATCH] tiffcp: avoid buffer overflow in "mode" string (fixes #400)
+
+CVE: CVE-2022-1355
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/c1ae29f9ebacd29b7c3e0c7db671af7db3584bc2]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ tools/tiffcp.c | 25 ++++++++++++++++++++-----
+ 1 file changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index fd129bb7..8d944ff6 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -274,19 +274,34 @@ main(int argc, char* argv[])
+ 			deftilewidth = atoi(optarg);
+ 			break;
+ 		case 'B':
+-			*mp++ = 'b'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode) - 1))
++			{
++				*mp++ = 'b'; *mp = '\0';
++			}
+ 			break;
+ 		case 'L':
+-			*mp++ = 'l'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode) - 1))
++			{
++				*mp++ = 'l'; *mp = '\0';
++			}
+ 			break;
+ 		case 'M':
+-			*mp++ = 'm'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode) - 1))
++			{
++				*mp++ = 'm'; *mp = '\0';
++			}
+ 			break;
+ 		case 'C':
+-			*mp++ = 'c'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode) - 1))
++			{
++				*mp++ = 'c'; *mp = '\0';
++			}
+ 			break;
+ 		case '8':
+-			*mp++ = '8'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode)-1))
++			{
++				*mp++ = '8'; *mp = '\0';
++			}
+ 			break;
+ 		case 'x':
+ 			pageInSeq = 1;
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index c061d2aaac..e5c226b5cd 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -26,6 +26,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-0924.patch \
            file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
            file://CVE-2022-34526.patch \
+           file://CVE-2022-1354.patch \
+           file://CVE-2022-1355.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.36.1


