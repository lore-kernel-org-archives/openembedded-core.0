Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48931ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:20 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.1749.1663122370963869442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gGJvNxo9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id ge9so1593162pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=EGuODVjeiMZwsADkvMEE6BU8xs4FiR95UuWj0+pnYgM=;
        b=gGJvNxo9GPfRC8zzOL8TJpJjJWAOj77JH+FzfA9eULduSEzBlSPuX0MEYWOWjXoYRH
         jMiXceWHAx5nDM2ywtuzAYGKFhybOx4z51OQhOH5yN4Po5P5Ft1gQjp5YY8A/i6ZAKk0
         pKxJy9mUTvBrlvGIEW/lvo7/rIkZKgFTqNsXFqeiH9DDQ+eI8wuc61F9sim4u3UQYilr
         zyHuMuadEqPdsUjUu9EVeLk0UOCHoaon6ZdlA9YKxeiZjjB20+hjxx/jcsjG6uP5ixKa
         5iXSezViN3AEGEf4TQBb47twcrqcZavxzou/xiATASsxRWI2qY6EqloxTKvC7FE7NZs9
         L/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EGuODVjeiMZwsADkvMEE6BU8xs4FiR95UuWj0+pnYgM=;
        b=MEkU9IM6Jt2twnM+lhSarUAO1WTq/iZNi/FaSu/bomxwBSj7z4yhfZA0h6B6GLtYtQ
         lQ8KbU6HyUZASQH3gBfKZVaK5d8otqNpbQHF0I7ny6zpR0Ym1ukArtJZMQQ7U4NScqaI
         IFByvILQF68kiI49FDi2iuG/VAXyMansXnJX4QizLYicYTM9UDtv3gLRfpsUuM9tF9l7
         3Qhl0vvBG6utUESpOHRvUdq/IxV1fhKLL0T68DyYtYJZFwWnGdxeNti4pvLh4ygb0vwj
         FqAyhHxZPVlSeKie0hAvEuSDnJYRydS9MaU00tyexelukMZpuqQyI/v9hRcmbNT7mwZ2
         8kcA==
X-Gm-Message-State: ACgBeo17cKpHadXqLIzjfig4+je8GM8BpwiKuYM9FYrcysCkqEEfNeB/
	RGBX9dDg8Ont7mZjuclyDQxq/APiTiJuV+WQ
X-Google-Smtp-Source: 
 AA6agR5e4C3JIVZv3tR5sUt2zjqe5Kt1ZjsaBRpWRxHlsXlHTaOpQyZjCKGHl/bRp9YHqLBEZfCchg==
X-Received: by 2002:a17:902:e751:b0:178:2976:41a0 with SMTP id
 p17-20020a170902e75100b00178297641a0mr15061449plf.12.1663122369875;
        Tue, 13 Sep 2022 19:26:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/9] tiff: Security fixes CVE-2022-1354 and
 CVE-2022-1355
Date: Tue, 13 Sep 2022 16:25:13 -1000
Message-Id: 
 <8414d39f3f89cc1176bd55c9455ad942db8ea4b1.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170621

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 93a35230d6..74ececb113 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch \
+           file://CVE-2022-1354.patch \
+           file://CVE-2022-1355.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


