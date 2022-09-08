Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CCDC54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 18:44:36 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.435.1662662674405416071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3gQMSwwN;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id s11so25732860edd.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=95TTzwllg8K8gJM/FF3kYrU4H1OplNCmkVl6s7g4OTI=;
        b=3gQMSwwNZ/gIVHe8oiw+3/I1h8WKi+pHSRsS0GmgqhFoYhNowqV3gRdNAeYPr8IhJd
         XjULpSejPI4voOdW041bd6I/a/nmLmNewdnzsGSaiObZQQtNZaNXJBEq2WPxWSNMqunl
         qmRJB5vvXUgKhNWTSy4TYm182crljsZ1iZMBqgfczPhDyzn/VAGMGjGX7+tXx6DH9VZs
         LDeAiPni+w/BowuJl/ItZmVidUEaVgUtT3LdSWb/tr3BCv3Xn91l3ZXS3Bmxx753rfIH
         olPAHidYtrE9E7Q1KBKW6Xk7q9El+FTy3Mc+VJYryRa+fitus2LgVOmAWnPkb2kDf8B3
         +CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=95TTzwllg8K8gJM/FF3kYrU4H1OplNCmkVl6s7g4OTI=;
        b=1kSZncVUVCeHx54r30R0FbFbDLbPSQSQgfY3uQQvuJKtkixkLDB94twF+kwRVxgv+p
         ZjtM78LINyUtqzd6r1zbT400OIdRCj3wnpU4r1osRn/VydQZuZrucPMJkiGwdVY6Kfdy
         rwSYB308dml3lDuszYNBVUVWhxRz8xJyWDARqk1btFbEThg2ndfEWkHbJc6Md3R4fKaq
         6qBtyyXTi633VDpqdYmCCptN8GOVV1HzU5eTld9vch7WessOAmalWRXLlukr+UWaKD5J
         5qeC5UoyvZo1Pye1wUlwIVN+zK+wSar/gHpn8kS8mhXLWuF5S+2UnqE2k2IMaDpsAYVX
         yQ1Q==
X-Gm-Message-State: ACgBeo0tUp6lYPNkbB2ZOVV0i8rYvwCHQzm/LtjIV4WZP28o+RERIe+L
	OzTAt1GqHN8hTivjw8mEnCevXskealawH61IavTw7w==
X-Google-Smtp-Source: 
 AA6agR4jWlh8Td4NKObPuDCBWHXYimU1AawCCl3MC7Mru6vqELphVmEnO+Lg1KRrHSPh+jjZVBQsS/Ozn5lumk+VKAE=
X-Received: by 2002:a05:6402:5212:b0:446:6910:5549 with SMTP id
 s18-20020a056402521200b0044669105549mr8504071edd.345.1662662672627; Thu, 08
 Sep 2022 11:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220908050409.17606-1-virendra.thakur@kpit.com>
In-Reply-To: <20220908050409.17606-1-virendra.thakur@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 8 Sep 2022 08:44:21 -1000
Message-ID: 
 <CAOSpxdb8ijvdSSDs5v4U58saZT-aLVNykRJGLOpPfGr383kS5w@mail.gmail.com>
Subject: Re: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8/9
To: virendra.thakur@kpit.com
Cc: openembedded-core@lists.openembedded.org,
	Virendra Thakur <virendrak@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 18:44:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170469

On Wed, Sep 7, 2022 at 7:04 PM Virendra Thakur via
lists.openembedded.org
<virendra.thakur=3Dkpit.com@lists.openembedded.org> wrote:
>
> From: Virendra Thakur <virendrak@kpit.com>
>
> Add Patch to fix CVE-2022-2867, CVE-2022-2868
> CVE-2022-2869

This fails on the autobuilder:

ERROR: tiff-4.1.0-r0 do_patch: Applying patch
'CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch' on target directory
'/home/pokybuild/yocto-worker/reproducible/build/build-st-966841/reproducib=
leA/tmp/work/core2-64-poky-linux/tiff/4.1.0-r0/tiff-4.1.0'
Command Error: 'quilt --quiltrc
/home/pokybuild/yocto-worker/reproducible/build/build-st-966841/reproducibl=
eA/tmp/work/core2-64-poky-linux/tiff/4.1.0-r0/recipe-sysroot-native/etc/qui=
ltrc
push' exited with 0  Output:
Applying patch CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch
patching file tools/tiffcrop.c
Hunk #1 FAILED at 5153.
Hunk #2 succeeded at 4782 with fuzz 2 (offset -423 lines).
Hunk #4 FAILED at 5332.
Hunk #5 succeeded at 5449 with fuzz 2.
Hunk #6 succeeded at 5588 with fuzz 2.
2 out of 6 hunks FAILED -- rejects in file tools/tiffcrop.c
Patch CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch does not apply
(enforce with -f)

Perhaps your mailer is corrupting the patch?  This has been an issue
lately with other patches from kpit!

Steve

>
> Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> ---
>  ...022-2867-CVE-2022-2868-CVE-2022-2869.patch | 159 ++++++++++++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
>  2 files changed, 160 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2867-C=
VE-2022-2868-CVE-2022-2869.patch
>
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022=
-2868-CVE-2022-2869.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-=
2867-CVE-2022-2868-CVE-2022-2869.patch
> new file mode 100644
> index 0000000000..131ff94119
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-C=
VE-2022-2869.patch
> @@ -0,0 +1,159 @@
> +From 07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c Mon Sep 17 00:00:00 2001
> +From: Su Laus <sulau@freenet.de>
> +Date: Wed, 9 Feb 2022 21:31:29 +0000
> +Subject: [PATCH] tiffcrop.c: Fix issue #352 heap-buffer-overflow by corr=
ecting
> + uint32_t underflow.
> +
> +CVE: CVE-2022-2867 CVE-2022-2868 CVE-2022-2869
> +Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/0=
7d79fcac2ead271b60e32aeb80f7b4f3be9ac8c]
> +Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> +---
> +Index: tiff-4.1.0/tools/tiffcrop.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- tiff-4.1.0.orig/tools/tiffcrop.c
> ++++ tiff-4.1.0/tools/tiffcrop.c
> +@@ -5153,29 +5153,45 @@ computeInputPixelOffsets(struct crop_mas
> +       y1 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
> +       y2 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
> +       }
> +-      if (x1 < 1)
> +-        crop->regionlist[i].x1 =3D 0;
> +-      else
> +-        crop->regionlist[i].x1 =3D (uint32) (x1 - 1);
> ++      /* a) Region needs to be within image sizes 0.. width-1; 0..lengt=
h-1
> ++       * b) Corners are expected to be submitted as top-left to bottom-=
right.
> ++       *    Therefore, check that and reorder input.
> ++       * (be aware x,y are already casted to (uint32_t) and avoid (0 - =
1) )
> ++       */
> ++      uint32_t aux;
> ++      if (x1 > x2) {
> ++        aux =3D x1;
> ++        x1 =3D x2;
> ++        x2 =3D aux;
> ++      }
> ++      if (y1 > y2) {
> ++        aux =3D y1;
> ++        y1 =3D y2;
> ++        y2 =3D aux;
> ++      }
> ++      if (x1 > image->width - 1)
> ++        crop->regionlist[i].x1 =3D image->width - 1;
> ++      else if (x1 > 0)
> ++        crop->regionlist[i].x1 =3D (uint32_t)(x1 - 1);
> +
> +       if (x2 > image->width - 1)
> +         crop->regionlist[i].x2 =3D image->width - 1;
> +-      else
> +-        crop->regionlist[i].x2 =3D (uint32) (x2 - 1);
> +-      zwidth  =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
> +-
> +-      if (y1 < 1)
> +-        crop->regionlist[i].y1 =3D 0;
> +-      else
> +-        crop->regionlist[i].y1 =3D (uint32) (y1 - 1);
> ++      else if (x2 > 0)
> ++        crop->regionlist[i].x2 =3D (uint32_t)(x2 - 1);
> ++
> ++      zwidth =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
> ++
> ++      if (y1 > image->length - 1)
> ++        crop->regionlist[i].y1 =3D image->length - 1;
> ++      else if (y1 > 0)
> ++        crop->regionlist[i].y1 =3D (uint32_t)(y1 - 1);
> +
> +       if (y2 > image->length - 1)
> +         crop->regionlist[i].y2 =3D image->length - 1;
> +-      else
> +-        crop->regionlist[i].y2 =3D (uint32) (y2 - 1);
> +-
> +-      zlength =3D crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
> ++      else if (y2 > 0)
> ++        crop->regionlist[i].y2 =3D (uint32_t)(y2 - 1);
> +
> ++      zlength =3D crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
> +       if (zwidth > max_width)
> +         max_width =3D zwidth;
> +       if (zlength > max_length)
> +@@ -5205,7 +5221,7 @@ computeInputPixelOffsets(struct crop_mas
> +       }
> +       }
> +     return (0);
> +-    }
> ++    }  /* crop_mode =3D=3D CROP_REGIONS */
> +
> +   /* Convert crop margins into offsets into image
> +    * Margins are expressed as pixel rows and columns, not bytes
> +@@ -5241,7 +5257,7 @@ computeInputPixelOffsets(struct crop_mas
> +       bmargin =3D (uint32) 0;
> +       return (-1);
> +       }
> +-    }
> ++    }  /* crop_mode =3D=3D CROP_MARGINS */
> +   else
> +     { /* no margins requested */
> +     tmargin =3D (uint32) 0;
> +@@ -5332,24 +5348,23 @@ computeInputPixelOffsets(struct crop_mas
> +   off->endx   =3D endx;
> +   off->endy   =3D endy;
> +
> +-  crop_width  =3D endx - startx + 1;
> +-  crop_length =3D endy - starty + 1;
> +-
> +-  if (crop_width <=3D 0)
> ++  if (endx + 1 <=3D startx)
> +     {
> +     TIFFError("computeInputPixelOffsets",
> +                "Invalid left/right margins and /or image crop width req=
uested");
> +     return (-1);
> +     }
> ++  crop_width  =3D endx - startx + 1;
> +   if (crop_width > image->width)
> +     crop_width =3D image->width;
> +
> +-  if (crop_length <=3D 0)
> ++  if (endy + 1 <=3D starty)
> +     {
> +     TIFFError("computeInputPixelOffsets",
> +               "Invalid top/bottom margins and /or image crop length req=
uested");
> +     return (-1);
> +     }
> ++  crop_length =3D endy - starty + 1;
> +   if (crop_length > image->length)
> +     crop_length =3D image->length;
> +
> +@@ -5449,10 +5464,17 @@ getCropOffsets(struct image_data *image,
> +   else
> +     crop->selections =3D crop->zones;
> +
> +-  for (i =3D 0; i < crop->zones; i++)
> ++  /* Initialize regions iterator i */
> ++  i =3D 0;
> ++  for (int j =3D 0; j < crop->zones; j++)
> +     {
> +-    seg =3D crop->zonelist[i].position;
> +-    total =3D crop->zonelist[i].total;
> ++    seg =3D crop->zonelist[j].position;
> ++    total =3D crop->zonelist[j].total;
> ++
> ++    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip th=
at input */
> ++    if (seg =3D=3D 0 || total =3D=3D 0 || seg > total) {
> ++        continue;
> ++    }
> +
> +     switch (crop->edge_ref)
> +       {
> +@@ -5581,8 +5603,11 @@ getCropOffsets(struct image_data *image,
> +                     i + 1, (uint32)zwidth, (uint32)zlength,
> +                   crop->regionlist[i].x1, crop->regionlist[i].x2,
> +                     crop->regionlist[i].y1, crop->regionlist[i].y2);
> ++  /* increment regions iterator */
> ++  i++;
> +     }
> +-
> ++    /* set number of generated regions out of given zones */
> ++    crop->selections =3D i;
> +   return (0);
> +   } /* end getCropOffsets */
> +
> +--
> +GitLab
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.1.0.bb
> index c061d2aaac..93a35230d6 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${P=
V}.tar.gz \
>             file://CVE-2022-0924.patch \
>             file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
>             file://CVE-2022-34526.patch \
> +           file://CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch \
>            "
>  SRC_URI[md5sum] =3D "2165e7aba557463acc0664e71a3ed424"
>  SRC_URI[sha256sum] =3D "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b=
4d65c7d6775b8634"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170448): https://lists.openembedded.org/g/openembedde=
d-core/message/170448
> Mute This Topic: https://lists.openembedded.org/mt/93542683/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

