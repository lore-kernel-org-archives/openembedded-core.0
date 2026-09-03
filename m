Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6225FC624DB
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 21:11:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78.1788469870994121415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 14:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dfU57mJY;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fe89fb333so232741f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788469869; x=1789074669; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elwdd/nITTBDg4MGbOocfFHufl6qkbUB+YyB4oDttCA=;
        b=dfU57mJY5d05uodxyzQufTlzwDlJOP4Imsk9mTW/FK0yNJ+U2J3SvgPpRyws1dMsq8
         W7ibseteUtzRBmlOq31O5p9HtfhPjiUX78SMIzm4jHP5mLnb0ZG3R7IWUlrc3Pk5T1ja
         UC9KSM5a1uUyL9FIFMSHhn/4hs7JCUAU69wv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469869; x=1789074669;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Elwdd/nITTBDg4MGbOocfFHufl6qkbUB+YyB4oDttCA=;
        b=GZtriKFW2mfuqh8lF8kujFhlMGHq+qgzOkicMJxpBMmu0HTG9MVWbgxm81sSCBtHeX
         tecC2CVA+8g5YbMi430gTHf24+tDiqotNK1jwuhMPgirxm5wo+eWrZw5p1AG7dYZo61t
         nuM+FKbJ0lYUSeM35KlGuMRp7oo/FdACwhe6BYYkxTjDE6LLgsGnq4eZ1PePaFnS7iHs
         5WC+O1bvf1IXO/n/Vs1/vij75wIev5uSdcKUoCA1sTOsSFghKgTEHPRk4KnccxG4TlUp
         xTF7PznEl7wNJTHZtLvl5Qqf6I5h63A0cTfGENGwh+QvmNZo8vx2XblrCi/9EBrL2P2Y
         28RQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5ihhFcTgHbmb9s3SkhOQVFVrhTOUWU+YE/Rr68QBIzjlG5xHTD+t1H7dUExPKSJN4s8TQdpOBWbeShja5Sio+8g==@lists.openembedded.org
X-Gm-Message-State: AFuF++mLf/KGtC4t0i0YKom3OdN/VZAEu40SPRZPWWAGY3ocBd5mTpPV
	N/9+IV2ZlKvV+xZ2DV2SUZoMqShUGi7fx/DPKMPT6IK4V1tHvL7Zr6b+IxJYG2gdWCLrlOfRkL7
	/WG0LTfc=
X-Gm-Gg: AYBFou3l6g8IMAp9C/Nj+3df2EeHRkUzK6elgA1fu9lO+wA8O2wo0F0RGMyksisw3Nu
	VP965K+x/BAbRU+jOBo2xJ5ViDepvBK60W61vbqfMuTe1p8okY4mMjoDLKnCoTCVR6KrwZ7PgMi
	egsLpauCNwrY/BzXXQT1KdqmFv1wBUVeU5LY7lNDGD5wfARH0zbJHlbYrbYqQjevNpB1i+tDU07
	HdwpbEXDD0H89IbaZ6NbwuFLfn48rjqr2X6+pw1aYP8wTNW094ndU46FaX2dXlDkn3gJve6UPpm
	58F+q2kVYuJXQXCJBhBZcE99Yg/6gvvbMu682wE4HkzTgox4jj2yKDD58Is1fBunc78UGDg6wWh
	Poob9qxJu7Y/WA/N2DYAfi8D3fyOzIe/g1/5PYog5vEx4YoiUZY5MzMprczmuqbsGc7RdTAWvYw
	kcrR6KaNMLzH4+D3/N/QwXzm9WH3OLrhS1HwzL1R44uGNCiyr7r0/H+8+0iHxhjorlAagwV7iFq
	0F8Nn9SWMbS3T4vlPALHM0/0SOn42B731biq3aSEwichzy4noDDOR+2QG8B1g==
X-Received: by 2002:a05:6000:60b:b0:484:46e9:3f99 with SMTP id ffacd0b85a97d-4858729b6bdmr3531507f8f.13.1788469868993;
        Thu, 03 Sep 2026 14:11:08 -0700 (PDT)
Received: from localhost (2a01cb001331aa00939d825f00cb3861.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:939d:825f:cb:3861])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9a67sm1165093f8f.16.2026.09.03.14.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 14:11:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 23:11:08 +0200
Message-Id: <DL5ZNN0ND074.3UFP77OL4YV24@smile.fr>
Subject: Re: [OE-core][wrynose][patch 1/3] libxfont: Fix CVE-2026-56001
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260824064944.29802-1-vanusuri@mvista.com>
In-Reply-To: <20260824064944.29802-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 21:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245043

On Mon Aug 24, 2026 at 8:49 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Pick patch according to [2]
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
> [2] https://security-tracker.debian.org/tracker/CVE-2026-56001
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../xorg-lib/libxfont/CVE-2026-56001.patch    | 84 +++++++++++++++++++
>  .../xorg-lib/libxfont_1.5.4.bb                |  3 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-5600=
1.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch=
 b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
> new file mode 100644
> index 0000000000..506a2dc22a
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
> @@ -0,0 +1,84 @@
> +From be0b08e2d354138d3222b4490e2a77c6ee42f778 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Mon, 1 Jun 2026 16:46:10 +1000
> +Subject: [PATCH] bitscale: fix integer overflow in BitmapScaleBitmaps
> + bytestoalloc
> +
> +bytestoalloc is declared as unsigned int (32-bit). When the sum of
> +per-glyph byte counts exceeds 2^32, the value wraps around and calloc()
> +allocates a buffer that is too small. The subsequent ScaleBitmap loop
> +then writes past the end of the allocated buffer.
> +
> +Change bytestoalloc from unsigned int to size_t to match the actual
> +allocation size type, and add an explicit overflow check in the
> +accumulation loop to bail out if the total would exceed SIZE_MAX.
> +
> +This vulnerability was discovered by:
> +Anonymous working with TrendAI Zero Day Initiative
> +
> +CVE-2026-56001/ZDI-CAN-30558
> +
> +Assisted-by: Claude:claude-opus-4-6
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_reque=
sts/34>
> +
> +Upstream-Status: Backport [import from debian libxfont1 1.5.2-4+deb9u1
> +Upstream commit https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commi=
t/be0b08e2d354138d3222b4490e2a77c6ee42f778]
> +CVE: CVE-2026-56001
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>

Hello,

This patch (and also the other ones in this series) was non-trivially
changes without a comment explaining why.

> +---
> + src/bitmap/bitscale.c | 24 +++++++++++++++++++++---
> + 1 file changed, 21 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/bitmap/bitscale.c b/src/bitmap/bitscale.c
> +index 13ed924..c87fa96 100644
> +--- a/src/bitmap/bitscale.c
> ++++ b/src/bitmap/bitscale.c
> +@@ -38,6 +38,7 @@ from The Open Group.
> + #include <X11/fonts/bitmap.h>
> + #include <X11/fonts/fontutil.h>
> + #include <math.h>
> ++#include <stdint.h>
              ^ This is new: I suppose to get size_t but that should be
			    explained. Also, "man size_t" tells me that size_t in
				stddef.h not stdint.h.
> +=20
> + #ifndef MAX
> + #define   MAX(a,b)    (((a)>(b)) ? a : b)
> +@@ -1459,7 +1460,7 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled =
font */
> + 		opci;
> +     FontInfoPtr pfi;
> +     int         glyph;
> +-    unsigned    bytestoalloc =3D 0;
> ++    size_t      bytestoalloc =3D 0;
> +     int		firstCol, lastCol, firstRow, lastRow;
> +=20
> +     double	xform[4], inv_xform[4];
> +@@ -1486,8 +1487,25 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled=
 font */
> +     glyph =3D pf->glyph;
> +     for (i =3D 0; i < nchars; i++)
> +     {
> +-	if ((pci =3D ACCESSENCODING(bitmapFont->encoding, i)))
> +-	    bytestoalloc +=3D BYTES_FOR_GLYPH(pci, glyph);
> ++	if ((pci =3D ACCESSENCODING(bitmapFont->encoding, i))) {
> ++	    size_t glyphsize =3D BYTES_FOR_GLYPH(pci, glyph);
> ++	    if (bytestoalloc > SIZE_MAX - glyphsize) {
> ++		fprintf(stderr,
> ++			"Error: bitmap allocation overflow for scaled font\n");
> ++		goto bail;
> ++	    }
> ++	    bytestoalloc +=3D glyphsize;
> ++	}
> ++    }
> ++
> ++    /* Reject unreasonably large bitmap allocations that could result
> ++     * from malicious fonts with extreme scale factors.  256 MiB is
> ++     * far beyond any legitimate scaled bitmap font. */
> ++#define BITMAP_SCALE_MAX_ALLOC	(256 * 1024 * 1024)
> ++    if (bytestoalloc > BITMAP_SCALE_MAX_ALLOC) {
> ++	fprintf(stderr,
> ++	       "Error: scaled bitmap size %zu exceeds limit\n", bytestoalloc);
> ++       goto bail;
         ^ This line has been reindented from upstream, that might make
		 future backports needlessly harder.

Can you send a v2 with the changes either removed or explained in the
patch message?

Thanks!
--=20
Yoann Congal
Smile ECS


