Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23912C6FD1F
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 01:25:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9845.1711848342926442554
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Mar 2024 18:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VuxGGVBP;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-341b01dbebbso2708123f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 18:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711848341; x=1712453141; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC5ou7fq7Zqj8F/oYQGmgoDRlTCJV7ykwBRxNNoKbk4=;
        b=VuxGGVBP+0XRb4a8V/kn45hYogVM5I4B5RvtzefDm/GjhfAQZTBTQpMCnb96ijqefB
         D6lwFiCCaaJWLmQ8SbEsBMzcXqfV0jux6FWM7kBoYI5tb5tZflZlxSVNDthmYLtldDvq
         9upWptA1Z6Gpx68MtrcqmgEVuqp3/42qdFziqYF5SiCMfaE0sO8DRDrr/sUlmnt1i5hU
         ivmrPTG/T8AA55uOOhQux2Nx91K2FavFrBxESfZGFaNQgKdMF5Ro9ZxKBGdXkeLV0LPp
         JOS/5DGY8OytXzwx0r/BhKvuIaYnk+KopPJIHKWVIZxhWD1DDXQvRC/TxVj0HmQ8kZ6E
         ixMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711848341; x=1712453141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC5ou7fq7Zqj8F/oYQGmgoDRlTCJV7ykwBRxNNoKbk4=;
        b=QUz5vCUs2L4n6nJLF9QWkXL85IySGtzzBfijUsagZ0WAZBfYGekFCrj92mKDo3ieUw
         GTA1E2bAfhHO1zFookTGEYaIeb9QXoXy8dgr6ie8s02+A9m/hjyvibhcdhR2mkN65Ygo
         KBew5QoKTHZ20dAKFyLR0w1ZO/zsH1awwsSEXNBfr6vRKobl3f8soo3V0qmjrupcG2EJ
         xuw1Q4P6fjAd24XoyILxxPGMud9sPzIC8NrIHfXeqSfZFD34lArhR3V865mX7/PR5WPK
         fKeEwcCLw3W0WfzMLbKVrBEC3eDu+SPplm0t+6nj+A6begeS2KzCVoeEBYvipYujTL5H
         ln7w==
X-Gm-Message-State: AOJu0Ywkj7q4Mnh2jcXPbJolwiRWPaws/G9S3IPndtJcPzGZ5/LuIzc3
	xsIGsiJCiHcDhpRqWLr+6hFVXG3EQ/bWpd1oVJTXwRKgPesgYKezipvJF+BfHEoSTewQ/68ZHXb
	eLq7FYDoVMNJ+L8mIPjbAxEwMH4A=
X-Google-Smtp-Source: AGHT+IHRL9A8hempd0KqT2ZvvoKKn57LkS2UMQbHgi91K/8uXiMhUWKosX5BS4wbwSTiD3bztVT2hJUZEnByo/gtVP8=
X-Received: by 2002:a5d:5f91:0:b0:343:420a:c70b with SMTP id
 dr17-20020a5d5f91000000b00343420ac70bmr2845511wrb.62.1711848340994; Sat, 30
 Mar 2024 18:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240328075033.3800753-1-chee.yang.lee@intel.com> <20240328075033.3800753-2-chee.yang.lee@intel.com>
In-Reply-To: <20240328075033.3800753-2-chee.yang.lee@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 31 Mar 2024 03:25:29 +0200
Message-ID: <CA+chaQcMke49Zmm9iDtbH-5e9w9=afuoruyqvZgct9kVJYhVRQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 2/3] tiff: fix CVE-2023-52356 CVE-2023-6277
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197655

Please fix your Upstream-Status formatting

CVE-2023-52356.patch and all 4 CVE-2023-6277-[1-4].patch trigger:
Please correct according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status
:
Upstream-Status: Backport
ERROR: tiff-4.3.0-r0 do_patch: Malformed Upstream-Status in patch

as it is in kirkstone-nut

On Thu, Mar 28, 2024 at 8:50=E2=80=AFAM Lee Chee Yang <chee.yang.lee@intel.=
com> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> import patch from ubuntu to fix CVE-2023-52356 CVE-2023-6277
> import from
> http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6ubuntu0.8.d=
ebian.tar.xz
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../libtiff/tiff/CVE-2023-52356.patch         |  55 ++++++
>  .../libtiff/tiff/CVE-2023-6277-1.patch        | 179 ++++++++++++++++++
>  .../libtiff/tiff/CVE-2023-6277-2.patch        | 152 +++++++++++++++
>  .../libtiff/tiff/CVE-2023-6277-3.patch        |  47 +++++
>  .../libtiff/tiff/CVE-2023-6277-4.patch        |  94 +++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   5 +
>  6 files changed, 532 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.p=
atch
>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.=
patch
>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.=
patch
>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.=
patch
>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.=
patch
>
> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch b/=
meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
> new file mode 100644
> index 0000000000..6c3c5adc52
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
> @@ -0,0 +1,55 @@
> +CVE: CVE-2023-52356
> +Upstream-Status: Backport
> +[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcff=
dce534db21dbaf5d54b31638a
> +ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6u=
buntu0.8.debian.tar.xz ]
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +
> +[Ubuntu note: Backport of the following patch from upstream, with a few =
changes
> +to match the current version of the file in the present Ubuntu release:
> + . using TIFFErrorExt instead of TIFFErrorExtR (the latter did not exist=
 yet);
> +-- Rodrigo Figueiredo Zaiden]
> +
> +Backport of:
> +
> +From 51558511bdbbcffdce534db21dbaf5d54b31638a Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Tue, 31 Oct 2023 15:58:41 +0100
> +Subject: [PATCH] TIFFReadRGBAStrip/TIFFReadRGBATile: add more validation=
 of
> + col/row (fixes #622)
> +
> +---
> + libtiff/tif_getimage.c | 15 +++++++++++++++
> + 1 file changed, 15 insertions(+)
> +
> +
> +--- tiff-4.3.0.orig/libtiff/tif_getimage.c
> ++++ tiff-4.3.0/libtiff/tif_getimage.c
> +@@ -2942,6 +2942,13 @@ TIFFReadRGBAStripExt(TIFF* tif, uint32_t
> +     }
> +
> +     if (TIFFRGBAImageOK(tif, emsg) && TIFFRGBAImageBegin(&img, tif, sto=
p_on_error, emsg)) {
> ++        if (row >=3D img.height)
> ++        {
> ++            TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif),
> ++                          "Invalid row passed to TIFFReadRGBAStrip().")=
;
> ++            TIFFRGBAImageEnd(&img);
> ++            return (0);
> ++        }
> +
> +         img.row_offset =3D row;
> +         img.col_offset =3D 0;
> +@@ -3018,6 +3025,14 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t
> +           return( 0 );
> +     }
> +
> ++    if (col >=3D img.width || row >=3D img.height)
> ++    {
> ++        TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif),
> ++                      "Invalid row/col passed to TIFFReadRGBATile().");
> ++        TIFFRGBAImageEnd(&img);
> ++        return (0);
> ++    }
> ++
> +     /*
> +      * The TIFFRGBAImageGet() function doesn't allow us to get off the
> +      * edge of the image, even to fill an otherwise valid tile.  So we
> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.patch b=
/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.patch
> new file mode 100644
> index 0000000000..6882529cfb
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-1.patch
> @@ -0,0 +1,179 @@
> +CVE: CVE-2023-6277
> +Upstream-Status: Backport
> +[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/5320c9d89c054fa=
805d037d84c57da874470b01a
> +ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6u=
buntu0.8.debian.tar.xz ]
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +
> +[Ubuntu note: Backport of the following patch from upstream, with a few =
changes
> +to match the current version of the file in the present Ubuntu release:
> + . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not e=
xist yet);
> + . calling _TIFFfree(data) instead of _TIFFfreeExt(tif, data) (the latte=
r did not exist yet);
> +-- Rodrigo Figueiredo Zaiden]
> +
> +Backport of:
> +
> +From 5320c9d89c054fa805d037d84c57da874470b01a Mon Sep 17 00:00:00 2001
> +From: Su Laus <sulau@freenet.de>
> +Date: Tue, 31 Oct 2023 15:43:29 +0000
> +Subject: [PATCH] Prevent some out-of-memory attacks
> +
> +Some small fuzzer files fake large amounts of data and provoke out-of-me=
mory situations. For non-compressed data content / tags, out-of-memory can =
be prevented by comparing with the file size.
> +
> +At image reading, data size of some tags / data structures (StripByteCou=
nts, StripOffsets, StripArray, TIFF directory) is compared with file size t=
o prevent provoked out-of-memory attacks.
> +
> +See issue https://gitlab.com/libtiff/libtiff/-/issues/614#note_160268385=
7
> +---
> + libtiff/tif_dirread.c | 92 ++++++++++++++++++++++++++++++++++++++++++-
> + 1 file changed, 90 insertions(+), 2 deletions(-)
> +
> +--- tiff-4.3.0.orig/libtiff/tif_dirread.c
> ++++ tiff-4.3.0/libtiff/tif_dirread.c
> +@@ -866,6 +866,21 @@ static enum TIFFReadDirEntryErr TIFFRead
> +       datasize=3D(*count)*typesize;
> +       assert((tmsize_t)datasize>0);
> +
> ++      /* Before allocating a huge amount of memory for corrupted files,=
 check if
> ++       * size of requested memory is not greater than file size.
> ++       */
> ++      uint64_t filesize =3D TIFFGetFileSize(tif);
> ++      if (datasize > filesize)
> ++      {
> ++              TIFFWarningExt(tif->tif_clientdata, "ReadDirEntryArray",
> ++                                              "Requested memory size fo=
r tag %d (0x%x) %" PRIu32
> ++                                              " is greather than filesi=
ze %" PRIu64
> ++                                              ". Memory not allocated, =
tag not read",
> ++                                              direntry->tdir_tag, diren=
try->tdir_tag, datasize,
> ++                                              filesize);
> ++              return (TIFFReadDirEntryErrAlloc);
> ++      }
> ++
> +       if( isMapped(tif) && datasize > (uint64_t)tif->tif_size )
> +               return TIFFReadDirEntryErrIo;
> +
> +@@ -4593,6 +4608,20 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
> +         if( !_TIFFFillStrilesInternal( tif, 0 ) )
> +             return -1;
> +
> ++      /* Before allocating a huge amount of memory for corrupted files,=
 check if
> ++       * size of requested memory is not greater than file size. */
> ++      uint64_t filesize =3D TIFFGetFileSize(tif);
> ++      uint64_t allocsize =3D (uint64_t)td->td_nstrips * sizeof(uint64_t=
);
> ++      if (allocsize > filesize)
> ++      {
> ++              TIFFWarningExt(tif->tif_clientdata, module,
> ++                                              "Requested memory size fo=
r StripByteCounts of %" PRIu64
> ++                                              " is greather than filesi=
ze %" PRIu64
> ++                                              ". Memory not allocated",
> ++                                              allocsize, filesize);
> ++              return -1;
> ++      }
> ++
> +       if (td->td_stripbytecount_p)
> +               _TIFFfree(td->td_stripbytecount_p);
> +       td->td_stripbytecount_p =3D (uint64_t*)
> +@@ -4603,9 +4632,7 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
> +
> +       if (td->td_compression !=3D COMPRESSION_NONE) {
> +               uint64_t space;
> +-              uint64_t filesize;
> +               uint16_t n;
> +-              filesize =3D TIFFGetFileSize(tif);
> +               if (!(tif->tif_flags&TIFF_BIGTIFF))
> +                       space=3Dsizeof(TIFFHeaderClassic)+2+dircount*12+4=
;
> +               else
> +@@ -4913,6 +4940,20 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
> +                       dircount16 =3D (uint16_t)dircount64;
> +                       dirsize =3D 20;
> +               }
> ++              /* Before allocating a huge amount of memory for corrupte=
d files, check
> ++               * if size of requested memory is not greater than file s=
ize. */
> ++              uint64_t filesize =3D TIFFGetFileSize(tif);
> ++              uint64_t allocsize =3D (uint64_t)dircount16 * dirsize;
> ++              if (allocsize > filesize)
> ++              {
> ++                      TIFFWarningExt(
> ++                              tif->tif_clientdata, module,
> ++                              "Requested memory size for TIFF directory=
 of %" PRIu64
> ++                              " is greather than filesize %" PRIu64
> ++                              ". Memory not allocated, TIFF directory n=
ot read",
> ++                              allocsize, filesize);
> ++                      return 0;
> ++              }
> +               origdir =3D _TIFFCheckMalloc(tif, dircount16,
> +                   dirsize, "to read TIFF directory");
> +               if (origdir =3D=3D NULL)
> +@@ -5016,6 +5057,20 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
> +                                    "Sanity check on directory count fai=
led, zero tag directories not supported");
> +                       return 0;
> +               }
> ++              /* Before allocating a huge amount of memory for corrupte=
d files, check
> ++               * if size of requested memory is not greater than file s=
ize. */
> ++              uint64_t filesize =3D TIFFGetFileSize(tif);
> ++              uint64_t allocsize =3D (uint64_t)dircount16 * dirsize;
> ++              if (allocsize > filesize)
> ++              {
> ++                      TIFFWarningExt(
> ++                              tif->tif_clientdata, module,
> ++                              "Requested memory size for TIFF directory=
 of %" PRIu64
> ++                              " is greather than filesize %" PRIu64
> ++                              ". Memory not allocated, TIFF directory n=
ot read",
> ++                              allocsize, filesize);
> ++                      return 0;
> ++              }
> +               origdir =3D _TIFFCheckMalloc(tif, dircount16,
> +                                               dirsize,
> +                                               "to read TIFF directory")=
;
> +@@ -5059,6 +5114,8 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
> +                       }
> +               }
> +       }
> ++      /* No check against filesize needed here because "dir" should hav=
e same size
> ++       * than "origdir" checked above. */
> +       dir =3D (TIFFDirEntry*)_TIFFCheckMalloc(tif, dircount16,
> +                                               sizeof(TIFFDirEntry),
> +                                               "to read TIFF directory")=
;
> +@@ -5853,6 +5910,20 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEn
> +                       return(0);
> +               }
> +
> ++              /* Before allocating a huge amount of memory for corrupte=
d files, check
> ++               * if size of requested memory is not greater than file s=
ize. */
> ++              uint64_t filesize =3D TIFFGetFileSize(tif);
> ++              uint64_t allocsize =3D (uint64_t)nstrips * sizeof(uint64_=
t);
> ++              if (allocsize > filesize)
> ++              {
> ++                      TIFFWarningExt(tif->tif_clientdata, module,
> ++                                                      "Requested memory=
 size for StripArray of %" PRIu64
> ++                                                      " is greather tha=
n filesize %" PRIu64
> ++                                                      ". Memory not all=
ocated",
> ++                                                      allocsize, filesi=
ze);
> ++                      _TIFFfree(data);
> ++                      return (0);
> ++              }
> +               resizeddata=3D(uint64_t*)_TIFFCheckMalloc(tif, nstrips, s=
izeof(uint64_t), "for strip array");
> +               if (resizeddata=3D=3D0) {
> +                       _TIFFfree(data);
> +@@ -5948,6 +6019,23 @@ static void allocChoppedUpStripArrays(TI
> +     }
> +     bytecount =3D last_offset + last_bytecount - offset;
> +
> ++      /* Before allocating a huge amount of memory for corrupted files,=
 check if
> ++       * size of StripByteCount and StripOffset tags is not greater tha=
n
> ++       * file size.
> ++       */
> ++      uint64_t allocsize =3D (uint64_t)nstrips * sizeof(uint64_t) * 2;
> ++      uint64_t filesize =3D TIFFGetFileSize(tif);
> ++      if (allocsize > filesize)
> ++      {
> ++              TIFFWarningExt(tif->tif_clientdata, "allocChoppedUpStripA=
rrays",
> ++                                              "Requested memory size fo=
r StripByteCount and "
> ++                                              "StripOffsets %" PRIu64
> ++                                              " is greather than filesi=
ze %" PRIu64
> ++                                              ". Memory not allocated",
> ++                                              allocsize, filesize);
> ++              return;
> ++      }
> ++
> +     newcounts =3D (uint64_t*) _TIFFCheckMalloc(tif, nstrips, sizeof (ui=
nt64_t),
> +                                              "for chopped \"StripByteCo=
unts\" array");
> +     newoffsets =3D (uint64_t*) _TIFFCheckMalloc(tif, nstrips, sizeof (u=
int64_t),
> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.patch b=
/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.patch
> new file mode 100644
> index 0000000000..fab43c0bc6
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-2.patch
> @@ -0,0 +1,152 @@
> +CVE: CVE-2023-6277
> +Upstream-Status: Backport
> +[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/0b025324711213a=
75e38b52f7e7ba60235f108aa
> +ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6u=
buntu0.8.debian.tar.xz ]
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +
> +[Ubuntu note: Backport of the following patch from upstream, with a few =
changes
> +to match the current version of the file in the present Ubuntu release:
> + . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not e=
xist yet);
> +-- Rodrigo Figueiredo Zaiden]
> +
> +Backport of:
> +
> +From 0b025324711213a75e38b52f7e7ba60235f108aa Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Tue, 31 Oct 2023 19:47:22 +0100
> +Subject: [PATCH] tif_dirread.c: only issue TIFFGetFileSize() for large e=
nough
> + RAM requests
> +
> +Ammends 5320c9d89c054fa805d037d84c57da874470b01a
> +
> +This fixes a performance regression caught by the GDAL regression test
> +suite.
> +---
> + libtiff/tif_dirread.c | 83 +++++++++++++++++++++++++------------------
> + 1 file changed, 48 insertions(+), 35 deletions(-)
> +
> +--- tiff-4.3.0.orig/libtiff/tif_dirread.c
> ++++ tiff-4.3.0/libtiff/tif_dirread.c
> +@@ -866,19 +866,22 @@ static enum TIFFReadDirEntryErr TIFFRead
> +       datasize=3D(*count)*typesize;
> +       assert((tmsize_t)datasize>0);
> +
> +-      /* Before allocating a huge amount of memory for corrupted files,=
 check if
> +-       * size of requested memory is not greater than file size.
> +-       */
> +-      uint64_t filesize =3D TIFFGetFileSize(tif);
> +-      if (datasize > filesize)
> ++      if (datasize > 100 * 1024 * 1024)
> +       {
> +-              TIFFWarningExt(tif->tif_clientdata, "ReadDirEntryArray",
> +-                                              "Requested memory size fo=
r tag %d (0x%x) %" PRIu32
> +-                                              " is greather than filesi=
ze %" PRIu64
> +-                                              ". Memory not allocated, =
tag not read",
> +-                                              direntry->tdir_tag, diren=
try->tdir_tag, datasize,
> +-                                              filesize);
> +-              return (TIFFReadDirEntryErrAlloc);
> ++              /* Before allocating a huge amount of memory for corrupte=
d files, check
> ++               * if size of requested memory is not greater than file s=
ize.
> ++               */
> ++              const uint64_t filesize =3D TIFFGetFileSize(tif);
> ++              if (datasize > filesize)
> ++              {
> ++                      TIFFWarningExt(tif->tif_clientdata, "ReadDirEntry=
Array",
> ++                                                      "Requested memory=
 size for tag %d (0x%x) %" PRIu32
> ++                                                      " is greater than=
 filesize %" PRIu64
> ++                                                      ". Memory not all=
ocated, tag not read",
> ++                                                      direntry->tdir_ta=
g, direntry->tdir_tag, datasize,
> ++                                                      filesize);
> ++                      return (TIFFReadDirEntryErrAlloc);
> ++              }
> +       }
> +
> +       if( isMapped(tif) && datasize > (uint64_t)tif->tif_size )
> +@@ -4608,18 +4611,22 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
> +         if( !_TIFFFillStrilesInternal( tif, 0 ) )
> +             return -1;
> +
> +-      /* Before allocating a huge amount of memory for corrupted files,=
 check if
> +-       * size of requested memory is not greater than file size. */
> +-      uint64_t filesize =3D TIFFGetFileSize(tif);
> +-      uint64_t allocsize =3D (uint64_t)td->td_nstrips * sizeof(uint64_t=
);
> +-      if (allocsize > filesize)
> ++      const uint64_t allocsize =3D (uint64_t)td->td_nstrips * sizeof(ui=
nt64_t);
> ++      uint64_t filesize =3D 0;
> ++      if (allocsize > 100 * 1024 * 1024)
> +       {
> +-              TIFFWarningExt(tif->tif_clientdata, module,
> +-                                              "Requested memory size fo=
r StripByteCounts of %" PRIu64
> +-                                              " is greather than filesi=
ze %" PRIu64
> +-                                              ". Memory not allocated",
> +-                                              allocsize, filesize);
> +-              return -1;
> ++              /* Before allocating a huge amount of memory for corrupte=
d files, check
> ++               * if size of requested memory is not greater than file s=
ize. */
> ++              filesize =3D TIFFGetFileSize(tif);
> ++              if (allocsize > filesize)
> ++              {
> ++                      TIFFWarningExt(
> ++                              tif->tif_clientdata, module,
> ++                              "Requested memory size for StripByteCount=
s of %" PRIu64
> ++                              " is greater than filesize %" PRIu64 ". M=
emory not allocated",
> ++                              allocsize, filesize);
> ++                      return -1;
> ++              }
> +       }
> +
> +       if (td->td_stripbytecount_p)
> +@@ -4666,11 +4673,13 @@ EstimateStripByteCounts(TIFF* tif, TIFFD
> +                             return -1;
> +                       space+=3Ddatasize;
> +               }
> ++              if (filesize =3D=3D 0)
> ++                      filesize =3D TIFFGetFileSize(tif);
> +               if( filesize < space )
> +-                    /* we should perhaps return in error ? */
> +-                    space =3D filesize;
> +-                else
> +-                    space =3D filesize - space;
> ++                      /* we should perhaps return in error ? */
> ++                      space =3D filesize;
> ++              else
> ++                      space =3D filesize - space;
> +               if (td->td_planarconfig =3D=3D PLANARCONFIG_SEPARATE)
> +                       space /=3D td->td_samplesperpixel;
> +               for (strip =3D 0; strip < td->td_nstrips; strip++)
> +@@ -4940,19 +4949,23 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
> +                       dircount16 =3D (uint16_t)dircount64;
> +                       dirsize =3D 20;
> +               }
> +-              /* Before allocating a huge amount of memory for corrupte=
d files, check
> +-               * if size of requested memory is not greater than file s=
ize. */
> +-              uint64_t filesize =3D TIFFGetFileSize(tif);
> +-              uint64_t allocsize =3D (uint64_t)dircount16 * dirsize;
> +-              if (allocsize > filesize)
> ++              const uint64_t allocsize =3D (uint64_t)dircount16 * dirsi=
ze;
> ++              if (allocsize > 100 * 1024 * 1024)
> +               {
> +-                      TIFFWarningExt(
> +-                              tif->tif_clientdata, module,
> +-                              "Requested memory size for TIFF directory=
 of %" PRIu64
> +-                              " is greather than filesize %" PRIu64
> +-                              ". Memory not allocated, TIFF directory n=
ot read",
> +-                              allocsize, filesize);
> +-                      return 0;
> ++                      /* Before allocating a huge amount of memory for =
corrupted files,
> ++                       * check if size of requested memory is not great=
er than file size.
> ++                       */
> ++                      const uint64_t filesize =3D TIFFGetFileSize(tif);
> ++                      if (allocsize > filesize)
> ++                      {
> ++                              TIFFWarningExt(
> ++                                      tif->tif_clientdata, module,
> ++                                      "Requested memory size for TIFF d=
irectory of %" PRIu64
> ++                                      " is greater than filesize %" PRI=
u64
> ++                                      ". Memory not allocated, TIFF dir=
ectory not read",
> ++                                      allocsize, filesize);
> ++                              return 0;
> ++                      }
> +               }
> +               origdir =3D _TIFFCheckMalloc(tif, dircount16,
> +                   dirsize, "to read TIFF directory");
> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.patch b=
/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.patch
> new file mode 100644
> index 0000000000..e88fb278ef
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-3.patch
> @@ -0,0 +1,47 @@
> +CVE: CVE-2023-6277
> +Upstream-Status: Backport
> +[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/de7bfd7d4377c26=
6f81849579f696fa1ad5ba6c3
> +ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6u=
buntu0.8.debian.tar.xz ]
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +
> +Backport of:
> +
> +From de7bfd7d4377c266f81849579f696fa1ad5ba6c3 Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Tue, 31 Oct 2023 20:13:45 +0100
> +Subject: [PATCH] TIFFFetchDirectory(): remove useless allocsize vs files=
ize
> + check
> +
> +CoverityScan rightly points that the max value for dircount16 * dirsize
> +is 4096 * 20. That's small enough not to do any check
> +---
> + libtiff/tif_dirread.c | 18 ------------------
> + 1 file changed, 18 deletions(-)
> +
> +--- tiff-4.3.0.orig/libtiff/tif_dirread.c
> ++++ tiff-4.3.0/libtiff/tif_dirread.c
> +@@ -4949,24 +4949,6 @@ TIFFFetchDirectory(TIFF* tif, uint64_t d
> +                       dircount16 =3D (uint16_t)dircount64;
> +                       dirsize =3D 20;
> +               }
> +-              const uint64_t allocsize =3D (uint64_t)dircount16 * dirsi=
ze;
> +-              if (allocsize > 100 * 1024 * 1024)
> +-              {
> +-                      /* Before allocating a huge amount of memory for =
corrupted files,
> +-                       * check if size of requested memory is not great=
er than file size.
> +-                       */
> +-                      const uint64_t filesize =3D TIFFGetFileSize(tif);
> +-                      if (allocsize > filesize)
> +-                      {
> +-                              TIFFWarningExt(
> +-                                      tif->tif_clientdata, module,
> +-                                      "Requested memory size for TIFF d=
irectory of %" PRIu64
> +-                                      " is greater than filesize %" PRI=
u64
> +-                                      ". Memory not allocated, TIFF dir=
ectory not read",
> +-                                      allocsize, filesize);
> +-                              return 0;
> +-                      }
> +-              }
> +               origdir =3D _TIFFCheckMalloc(tif, dircount16,
> +                   dirsize, "to read TIFF directory");
> +               if (origdir =3D=3D NULL)
> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.patch b=
/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.patch
> new file mode 100644
> index 0000000000..2ab7e2e9da
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-4.patch
> @@ -0,0 +1,94 @@
> +CVE: CVE-2023-6277
> +Upstream-Status: Backport
> +[ upstream : https://gitlab.com/libtiff/libtiff/-/commit/dbb825a8312f30e=
63a06c272010967d51af5c35a
> +ubuntu : http://archive.ubuntu.com/ubuntu/pool/main/t/tiff/tiff_4.3.0-6u=
buntu0.8.debian.tar.xz ]
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +
> +[Ubuntu note: Backport of the following patch from upstream, with a few =
changes
> +to match the current version of the file in the present Ubuntu release:
> + . using TIFFWarningExt instead of TIFFWarningExtR (the latter did not e=
xist yet);
> + . calling _TIFFfree(data) instead of _TIFFfreeExt(tif, data) (the latte=
r did not exist yet);
> +-- Rodrigo Figueiredo Zaiden]
> +
> +Backport of:
> +
> +From dbb825a8312f30e63a06c272010967d51af5c35a Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Tue, 31 Oct 2023 21:30:58 +0100
> +Subject: [PATCH] tif_dirread.c: only issue TIFFGetFileSize() for large e=
nough
> + RAM requests
> +
> +---
> + libtiff/tif_dirread.c | 54 +++++++++++++++++++++++++------------------
> + 1 file changed, 31 insertions(+), 23 deletions(-)
> +
> +--- tiff-4.3.0.orig/libtiff/tif_dirread.c
> ++++ tiff-4.3.0/libtiff/tif_dirread.c
> +@@ -5905,19 +5905,24 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEn
> +                       return(0);
> +               }
> +
> +-              /* Before allocating a huge amount of memory for corrupte=
d files, check
> +-               * if size of requested memory is not greater than file s=
ize. */
> +-              uint64_t filesize =3D TIFFGetFileSize(tif);
> +-              uint64_t allocsize =3D (uint64_t)nstrips * sizeof(uint64_=
t);
> +-              if (allocsize > filesize)
> ++              const uint64_t allocsize =3D (uint64_t)nstrips * sizeof(u=
int64_t);
> ++              if (allocsize > 100 * 1024 * 1024)
> +               {
> +-                      TIFFWarningExt(tif->tif_clientdata, module,
> +-                                                      "Requested memory=
 size for StripArray of %" PRIu64
> +-                                                      " is greather tha=
n filesize %" PRIu64
> +-                                                      ". Memory not all=
ocated",
> +-                                                      allocsize, filesi=
ze);
> +-                      _TIFFfree(data);
> +-                      return (0);
> ++                      /* Before allocating a huge amount of memory for =
corrupted files,
> ++                       * check if size of requested memory is not great=
er than file size.
> ++                       */
> ++                      const uint64_t filesize =3D TIFFGetFileSize(tif);
> ++                      if (allocsize > filesize)
> ++                      {
> ++                              TIFFWarningExt(
> ++                                      tif->tif_clientdata, module,
> ++                                      "Requested memory size for StripA=
rray of %" PRIu64
> ++                                      " is greater than filesize %" PRI=
u64
> ++                                      ". Memory not allocated",
> ++                                      allocsize, filesize);
> ++                              _TIFFfree(data);
> ++                              return (0);
> ++                      }
> +               }
> +               resizeddata=3D(uint64_t*)_TIFFCheckMalloc(tif, nstrips, s=
izeof(uint64_t), "for strip array");
> +               if (resizeddata=3D=3D0) {
> +@@ -6018,17 +6023,20 @@ static void allocChoppedUpStripArrays(TI
> +        * size of StripByteCount and StripOffset tags is not greater tha=
n
> +        * file size.
> +        */
> +-      uint64_t allocsize =3D (uint64_t)nstrips * sizeof(uint64_t) * 2;
> +-      uint64_t filesize =3D TIFFGetFileSize(tif);
> +-      if (allocsize > filesize)
> ++      const uint64_t allocsize =3D (uint64_t)nstrips * sizeof(uint64_t)=
 * 2;
> ++      if (allocsize > 100 * 1024 * 1024)
> +       {
> +-              TIFFWarningExt(tif->tif_clientdata, "allocChoppedUpStripA=
rrays",
> +-                                              "Requested memory size fo=
r StripByteCount and "
> +-                                              "StripOffsets %" PRIu64
> +-                                              " is greather than filesi=
ze %" PRIu64
> +-                                              ". Memory not allocated",
> +-                                              allocsize, filesize);
> +-              return;
> ++              const uint64_t filesize =3D TIFFGetFileSize(tif);
> ++              if (allocsize > filesize)
> ++              {
> ++                      TIFFWarningExt(tif->tif_clientdata, "allocChopped=
UpStripArrays",
> ++                                                      "Requested memory=
 size for StripByteCount and "
> ++                                                      "StripOffsets %" =
PRIu64
> ++                                                      " is greater than=
 filesize %" PRIu64
> ++                                                      ". Memory not all=
ocated",
> ++                                                      allocsize, filesi=
ze);
> ++                      return;
> ++              }
> +       }
> +
> +     newcounts =3D (uint64_t*) _TIFFCheckMalloc(tif, nstrips, sizeof (ui=
nt64_t),
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.3.0.bb
> index d284100ab2..b4af179e76 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> @@ -48,6 +48,11 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${=
PV}.tar.gz \
>             file://CVE-2023-40745.patch \
>             file://CVE-2023-41175.patch \
>             file://CVE-2023-6228.patch \
> +           file://CVE-2023-52356.patch \
> +           file://CVE-2023-6277-1.patch \
> +           file://CVE-2023-6277-2.patch \
> +           file://CVE-2023-6277-3.patch \
> +           file://CVE-2023-6277-4.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daa=
ad1c2e89e1b37ac8"
> --
> 2.37.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197571): https://lists.openembedded.org/g/openembedde=
d-core/message/197571
> Mute This Topic: https://lists.openembedded.org/mt/105192937/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

