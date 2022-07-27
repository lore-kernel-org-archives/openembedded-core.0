Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C42C19F2A
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:26 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.14386.1658882481481615181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4XfwvdlV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 70so14736650pfx.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jw/GYF7cy3IYOnD5Otkg5Vc8NyXpsCWg7bDxfgMv/Mw=;
        b=4XfwvdlVwuFbkNt8kShchCbjtPx9L/aXK1ubPdlJo16mE5g9Vp0gMiXTysNyYYeqLT
         PXRm4d7pr7WTYMg8mzJvApR/DzRLhFTrpMRkzTJMvJ8oMjc/MuqMiuNufYmgc+/hHaKO
         Kd58tW0iZmgPwLhqNy4LmvW9gZ3JfDZfZMIn4+aW7g/jMP9a46XJZ8wGqkpBZ9EkPNBP
         HeUTui7TTTE2eKVel886e5MgHeMI0NZnENp/c5sb9W4eROtXb9yRVFGRN1pbiqr0IkYp
         9Ne7amSO/mMO1zg3TCxdIiJ0YkG6Hh4l/RGEGhrR4aG/URj93dQ5EeKrgqsqh5DiZN+A
         rmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jw/GYF7cy3IYOnD5Otkg5Vc8NyXpsCWg7bDxfgMv/Mw=;
        b=I3J7YsoxUxFrZJbTJhLZ/LyYTRibiGAXokcO7jscNKpl+3JGf8wZm38vx8/fPDfaWl
         9xxBB8LOUoCXrbgHt3E802e2e+01/KL+D4b6gQEF9unD1rbhWx614JKSP4AjmCDOtB9j
         TMHyNfGxB8sP40z1c/5yA8topYJ+rTx4CejyPSNOg6MP7AEsr9ThJgbFvGUectAmohcf
         SXpRJd/WRqcNq0S0bs/zq64lUaVYNaC2LmxGNYAPUxFHGKbuL0fMDLPH0ulnV8JJ8PtE
         dvBKNHtEHF4f8qkAa+B459sv1ZxaIGcznKG+KkSj0K0PzSdj7kK6xrcOLxuMX0aM46qj
         4cVA==
X-Gm-Message-State: AJIora+MDKUg93K7e7l01yInViBUqip/KQ7JtvQldlRMpmri0FuRfmNE
	4G6RfS6K/FM2qY+my0elcL3ApV+8Um3pEnyI
X-Google-Smtp-Source: 
 AGRyM1sqPq7AFKvZ5ZcPVg7vSqHMVNcPrQho8v9P58yKO3fn+g2NTuNsf6HWGg1LmLFeODXCtN4E2g==
X-Received: by 2002:a63:4cf:0:b0:41a:617f:e195 with SMTP id
 198-20020a6304cf000000b0041a617fe195mr16453127pge.89.1658882480248;
        Tue, 26 Jul 2022 17:41:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] tiff: Security fixes CVE-2022-1354 and
 CVE-2022-1355
Date: Tue, 26 Jul 2022 14:40:33 -1000
Message-Id: 
 <6c373c041f1dd45458866408d1ca16d47cacbd86.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168525

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

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2022-1354.patch          | 212 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-1355.patch          |  62 +++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index c2d4b35d49..149516508f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0005-fix-the-FPE-in-tiffcrop-393.patch \
            file://0006-fix-heap-buffer-overflow-in-tiffcp-278.patch \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
+           file://CVE-2022-1354.patch \
+           file://CVE-2022-1355.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


