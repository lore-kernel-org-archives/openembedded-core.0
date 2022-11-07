Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DE0C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:20:02 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.3894.1667830792571265933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cH4Mb89c;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id kt23so30468415ejc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0yfc57+lPQNR0SeSCWm3q+GgbgY7anfw/5fUMsQtXE=;
        b=cH4Mb89cqDwhV3+TbDWUBag5gu9ek/lvA9w0HZCyRBbP4ougEflD3sIGjBj5YOltqo
         L7bI0zXX0YNokIA0Vts9BxgHlVBUes/8bhAAfrwO5POPTqBRObEeBQGvBMrUT4+T+JYo
         UAIrdp7N88Fe7FFrpvOZykHRKSIGA/wk/k8A+afG8FWqpI071k/Mm16XnjmUN3sjv0Va
         SzLIPNprPUVdv6J000SYvKHiyzBMgb2rIlUUganEO0uadAO42x2poP80sbWboUY51FRb
         /81UyQ2o5SD5gykmItC5GgySFVk/fUzUpKNRIW2vZGt+8o/R7zsDVlnhWekHjs3MMqoV
         PrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0yfc57+lPQNR0SeSCWm3q+GgbgY7anfw/5fUMsQtXE=;
        b=Wn7VPezL+cd2317ijk/miD2uQzvUXmlmYYYaxcXMqXQOFDFQewynSQ1aJULjDJzWfm
         /1ocoVbXFTTcVvz96dvb94XD5Ztv83le1jti7FOIp+Dx14JS26XMGiRCBPnDUoEFr9PR
         gg/3Vca8MdKh7UdKxqzr33mk0rCkmQXV1p7U157IFqVr+aH7Ieqn7yd+vM4VovA78U+C
         FUfu8WIq2Cr2MghYYNRVqairHu5FwFln1ypKomP5c844JBhGx2Hh/pxWKtE2fxHRPReS
         7VWzmpwZfjBC4ZAl3hkgz5xyHY8F5dChYLeo99ADnidiEmNZUqQAYS+58lGJMdz4MnT/
         PkWw==
X-Gm-Message-State: ACrzQf1JXETVRlsFNVG/RaLK56fiiDCMC6ALaPN7sF/7lXdiuICA/erR
	wjZjNHX9OqkXrtO2s9gzsPVIwfygxgPc0bISPly/Uw==
X-Google-Smtp-Source: AMsMyM5BDoQvqlwCnCJf+I5ZTW8PiIHVXRc7414E8b1e+JlFUnB7QKZdCc1A/LokY41qryVxdlsVqb86ZT9xYeFQTAI=
X-Received: by 2002:a17:906:3607:b0:7ad:a798:cdc0 with SMTP id
 q7-20020a170906360700b007ada798cdc0mr47318741ejb.357.1667830790534; Mon, 07
 Nov 2022 06:19:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667530733.git.steve@sakoman.com> <469ac1fc6f18f0db72a13bde2268ba54ae37da75.1667530733.git.steve@sakoman.com>
 <CAKzga+xbh7XiB-cqg9EzKKLekK2YLiS_wOZdOmeF0FFReypwGg@mail.gmail.com>
In-Reply-To: <CAKzga+xbh7XiB-cqg9EzKKLekK2YLiS_wOZdOmeF0FFReypwGg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 7 Nov 2022 04:19:38 -1000
Message-ID: <CAOSpxdZ2jgLiNa3p+VKc2+=XPYiMJG17+Wb5bGVQ_9GxfOHk2w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 06/31] tiff: fix CVE-2022-2953
To: Zheng Qiu <zheng.qiu@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	Shubham Kulkarni <skulkarni@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172846

Hello Zheng,

Could you respond to Shubham's question on your patch?

Thanks,

Steve

On Sun, Nov 6, 2022 at 11:10 PM Shubham Kulkarni <skulkarni@mvista.com> wro=
te:
>
> Hello, I am new to this community and trying to understand the CVE patch =
fixing process. Kindly correct me if I am wrong with my understanding.
>
> So, this patch is fixing the code present in the file tools/tiffcrop.c . =
I can see this patch is having combined changes from following commits:
>
> 1] https://gitlab.com/libtiff/libtiff/-/commit/e319508 - tiffcrop: Fix is=
sue #330 and some more from 320 to 349
> 2] https://gitlab.com/libtiff/libtiff/-/commit/8fe3735  - According to Ri=
chard Nolde #401 (comment 877637400)
> 3] https://gitlab.com/libtiff/libtiff/-/commit/bad48e9 - tiffcrop -S opti=
on: Make decision simpler.
>
> Debian website for this CVE (https://security-tracker.debian.org/tracker/=
CVE-2022-2953) suggests commits "2]" & "3]" as a fix. And both "2]" & "3]" =
fixes the code introduced by commit "1]". So, can we say that the vulnerabi=
lity was introduced by commit "1]" , and solved by "2]" & "3]" ?
>
> If yes, then as per my understanding, there is no need of fixing, as vuln=
erability itself is not present in current code and it's Not Affected by th=
e CVE. But this patch is introducing the vulnerability ("1]") and on top of=
 it, fixing the same ("2]" & "3]"). Is it required Or can we just say that =
this version of code/tiff package is not affected by this CVE?
> Please rectify my understanding.
>
> Thanks in Advance,
> Shubham
>
>
> On Fri, Nov 4, 2022 at 8:31 AM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> From: Zheng Qiu <zheng.qiu@windriver.com>
>>
>> While this does not happen with the tiff 4.3.0 release, it does happen w=
ith
>> the series of patches we have, so backport the two simple changes that
>> restrict the tiffcrop options to avoid the vulnerability.
>>
>> CVE-2022-2953.patch was taken from upstream, and a small typo was fixed
>> for the CVE number. The other patch is included in tiff 4.4.0 but not
>> 4.3.0, so add it as well.
>>
>> Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
>> Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  ...ue-330-and-some-more-from-320-to-349.patch | 609 ++++++++++++++++++
>>  .../libtiff/tiff/CVE-2022-2953.patch          |  87 +++
>>  meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
>>  3 files changed, 698 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-F=
ix-issue-330-and-some-more-from-320-to-349.patch
>>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.p=
atch
>>
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issu=
e-330-and-some-more-from-320-to-349.patch b/meta/recipes-multimedia/libtiff=
/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
>> new file mode 100644
>> index 0000000000..07acf5eb90
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-a=
nd-some-more-from-320-to-349.patch
>> @@ -0,0 +1,609 @@
>> +From e319508023580e2f70e6e626f745b5b2a1707313 Mon Sep 17 00:00:00 2001
>> +From: Su Laus <sulau@freenet.de>
>> +Date: Tue, 10 May 2022 20:03:17 +0000
>> +Subject: [PATCH] tiffcrop: Fix issue #330 and some more from 320 to 349
>> +Upstream-Status: Backport
>> +Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
>> +---
>> + tools/tiffcrop.c | 282 +++++++++++++++++++++++++++++++++++------------
>> + 1 file changed, 210 insertions(+), 72 deletions(-)
>> +
>> +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>> +index 77cf6ed1..791ec5e7 100644
>> +--- a/tools/tiffcrop.c
>> ++++ b/tools/tiffcrop.c
>> +@@ -63,20 +63,24 @@
>> +  *                units when sectioning image into columns x rows
>> +  *                using the -S cols:rows option.
>> +  * -X #           Horizontal dimension of region to extract expressed =
in current
>> +- *                units
>> ++ *                units, relative to the specified origin reference 'e=
dge' left (default for X) or right.
>> +  * -Y #           Vertical dimension of region to extract expressed in=
 current
>> +- *                units
>> ++ *                units, relative to the specified origin reference 'e=
dge' top (default for Y) or bottom.
>> +  * -O orient      Orientation for output image, portrait, landscape, a=
uto
>> +  * -P page        Page size for output image segments, eg letter, lega=
l, tabloid,
>> +  *                etc.
>> +  * -S cols:rows   Divide the image into equal sized segments using col=
s across
>> +  *                and rows down
>> +- * -E t|l|r|b     Edge to use as origin
>> ++ * -E t|l|r|b     Edge to use as origin (i.e. 'side' of the image not =
'corner')
>> ++ *                  top    =3D width from left, zones from top to bott=
om (default)
>> ++ *                  bottom =3D width from left, zones from bottom to t=
op
>> ++ *                  left   =3D zones from left to right, length from t=
op
>> ++ *                  right  =3D zones from right to left, length from t=
op
>> +  * -m #,#,#,#     Margins from edges for selection: top, left, bottom,=
 right
>> +  *                (commas separated)
>> +  * -Z #:#,#:#     Zones of the image designated as zone X of Y,
>> +  *                eg 1:3 would be first of three equal portions measur=
ed
>> +- *                from reference edge
>> ++ *                from reference edge (i.e. 'side' not corner)
>> +  * -N odd|even|#,#-#,#|last
>> +  *                Select sequences and/or ranges of images within file
>> +  *                to process. The words odd or even may be used to spe=
cify
>> +@@ -103,10 +107,13 @@
>> +  *                selects which functions dump data, with higher numbe=
rs selecting
>> +  *                lower level, scanline level routines. Debug reports =
a limited set
>> +  *                of messages to monitor progress without enabling dum=
p logs.
>> ++ *
>> ++ * Note:    The (-X|-Y), -Z and -z options are mutually exclusive.
>> ++ *          In no case should the options be applied to a given select=
ion successively.
>> +  */
>> +
>> +-static   char tiffcrop_version_id[] =3D "2.4.1";
>> +-static   char tiffcrop_rev_date[] =3D "03-03-2010";
>> ++static   char tiffcrop_version_id[] =3D "2.5";
>> ++static   char tiffcrop_rev_date[] =3D "02-09-2022";
>> +
>> + #include "tif_config.h"
>> + #include "libport.h"
>> +@@ -774,6 +781,9 @@ static const char usage_info[] =3D
>> + "             The four debug/dump options are independent, though it m=
akes little sense to\n"
>> + "             specify a dump file without specifying a detail level.\n=
"
>> + "\n"
>> ++"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n=
"
>> ++"             In no case should the options be applied to a given sele=
ction successively.\n"
>> ++"\n"
>> + ;
>> +
>> + /* This function could be modified to pass starting sample offset
>> +@@ -2121,6 +2131,15 @@ void  process_command_opts (int argc, char *argv=
[], char *mp, char *mode, uint32
>> +               /*NOTREACHED*/
>> +       }
>> +     }
>> ++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z=
 are mutually exclusive) --*/
>> ++    char XY, Z, R;
>> ++    XY =3D ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mo=
de & CROP_LENGTH));
>> ++    Z =3D (crop_data->crop_mode & CROP_ZONES);
>> ++    R =3D (crop_data->crop_mode & CROP_REGIONS);
>> ++    if ((XY && Z) || (XY && R) || (Z && R)) {
>> ++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z=
 and -z are mutually exclusive.->Exit");
>> ++        exit(EXIT_FAILURE);
>> ++    }
>> +   }  /* end process_command_opts */
>> +
>> + /* Start a new output file if one has not been previously opened or
>> +@@ -2746,7 +2765,7 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *=
out, uint32_t cols,
>> +                            tsample_t count, uint32_t start, uint32_t e=
nd)
>> +   {
>> +   int i, bytes_per_sample, sindex;
>> +-  uint32_t col, dst_rowsize, bit_offset;
>> ++  uint32_t col, dst_rowsize, bit_offset, numcols;
>> +   uint32_t src_byte /*, src_bit */;
>> +   uint8_t *src =3D in;
>> +   uint8_t *dst =3D out;
>> +@@ -2757,6 +2776,10 @@ extractContigSamplesBytes (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +     return (1);
>> +     }
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamplesBytes",
>> +@@ -2769,6 +2792,9 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *=
out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> +
>> +   dst_rowsize =3D (bps * (end - start) * count) / 8;
>> +
>> +@@ -2812,7 +2838,7 @@ extractContigSamples8bits (uint8_t *in, uint8_t *=
out, uint32_t cols,
>> +                            tsample_t count, uint32_t start, uint32_t e=
nd)
>> +   {
>> +   int    ready_bits =3D 0, sindex =3D 0;
>> +-  uint32_t col, src_byte, src_bit, bit_offset;
>> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
>> +   uint8_t  maskbits =3D 0, matchbits =3D 0;
>> +   uint8_t  buff1 =3D 0, buff2 =3D 0;
>> +   uint8_t *src =3D in;
>> +@@ -2824,6 +2850,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +     return (1);
>> +     }
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamples8bits",
>> +@@ -2836,7 +2866,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> +-
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> ++
>> +   ready_bits =3D 0;
>> +   maskbits =3D  (uint8_t)-1 >> (8 - bps);
>> +   buff1 =3D buff2 =3D 0;
>> +@@ -2889,7 +2922,7 @@ extractContigSamples16bits (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +                             tsample_t count, uint32_t start, uint32_t =
end)
>> +   {
>> +   int    ready_bits =3D 0, sindex =3D 0;
>> +-  uint32_t col, src_byte, src_bit, bit_offset;
>> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
>> +   uint16_t maskbits =3D 0, matchbits =3D 0;
>> +   uint16_t buff1 =3D 0, buff2 =3D 0;
>> +   uint8_t  bytebuff =3D 0;
>> +@@ -2902,6 +2935,10 @@ extractContigSamples16bits (uint8_t *in, uint8_t=
 *out, uint32_t cols,
>> +     return (1);
>> +     }
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamples16bits",
>> +@@ -2914,6 +2951,9 @@ extractContigSamples16bits (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> +
>> +   ready_bits =3D 0;
>> +   maskbits =3D (uint16_t)-1 >> (16 - bps);
>> +@@ -2978,7 +3018,7 @@ extractContigSamples24bits (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +                             tsample_t count, uint32_t start, uint32_t =
end)
>> +   {
>> +   int    ready_bits =3D 0, sindex =3D 0;
>> +-  uint32_t col, src_byte, src_bit, bit_offset;
>> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
>> +   uint32_t maskbits =3D 0, matchbits =3D 0;
>> +   uint32_t buff1 =3D 0, buff2 =3D 0;
>> +   uint8_t  bytebuff1 =3D 0, bytebuff2 =3D 0;
>> +@@ -2991,6 +3031,10 @@ extractContigSamples24bits (uint8_t *in, uint8_t=
 *out, uint32_t cols,
>> +     return (1);
>> +     }
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamples24bits",
>> +@@ -3003,6 +3047,9 @@ extractContigSamples24bits (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> +
>> +   ready_bits =3D 0;
>> +   maskbits =3D  (uint32_t)-1 >> (32 - bps);
>> +@@ -3087,7 +3134,7 @@ extractContigSamples32bits (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +                             tsample_t count, uint32_t start, uint32_t =
end)
>> +   {
>> +   int    ready_bits =3D 0, sindex =3D 0 /*, shift_width =3D 0 */;
>> +-  uint32_t col, src_byte, src_bit, bit_offset;
>> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
>> +   uint32_t longbuff1 =3D 0, longbuff2 =3D 0;
>> +   uint64_t maskbits =3D 0, matchbits =3D 0;
>> +   uint64_t buff1 =3D 0, buff2 =3D 0, buff3 =3D 0;
>> +@@ -3102,6 +3149,10 @@ extractContigSamples32bits (uint8_t *in, uint8_t=
 *out, uint32_t cols,
>> +     }
>> +
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamples32bits",
>> +@@ -3114,6 +3165,9 @@ extractContigSamples32bits (uint8_t *in, uint8_t =
*out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> +
>> +   /* shift_width =3D ((bps + 7) / 8) + 1; */
>> +   ready_bits =3D 0;
>> +@@ -3193,7 +3247,7 @@ extractContigSamplesShifted8bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,
>> +                                   int shift)
>> +   {
>> +   int    ready_bits =3D 0, sindex =3D 0;
>> +-  uint32_t col, src_byte, src_bit, bit_offset;
>> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
>> +   uint8_t  maskbits =3D 0, matchbits =3D 0;
>> +   uint8_t  buff1 =3D 0, buff2 =3D 0;
>> +   uint8_t *src =3D in;
>> +@@ -3205,6 +3259,10 @@ extractContigSamplesShifted8bits (uint8_t *in, u=
int8_t *out, uint32_t cols,
>> +     return (1);
>> +     }
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamplesShifted8bits",
>> +@@ -3217,6 +3275,9 @@ extractContigSamplesShifted8bits (uint8_t *in, ui=
nt8_t *out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> +
>> +   ready_bits =3D shift;
>> +   maskbits =3D  (uint8_t)-1 >> (8 - bps);
>> +@@ -3273,7 +3334,7 @@ extractContigSamplesShifted16bits (uint8_t *in, u=
int8_t *out, uint32_t cols,
>> +                                    int shift)
>> +   {
>> +   int    ready_bits =3D 0, sindex =3D 0;
>> +-  uint32_t col, src_byte, src_bit, bit_offset;
>> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
>> +   uint16_t maskbits =3D 0, matchbits =3D 0;
>> +   uint16_t buff1 =3D 0, buff2 =3D 0;
>> +   uint8_t  bytebuff =3D 0;
>> +@@ -3286,6 +3347,10 @@ extractContigSamplesShifted16bits (uint8_t *in, =
uint8_t *out, uint32_t cols,
>> +     return (1);
>> +     }
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamplesShifted16bits",
>> +@@ -3298,6 +3363,9 @@ extractContigSamplesShifted16bits (uint8_t *in, u=
int8_t *out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> +
>> +   ready_bits =3D shift;
>> +   maskbits =3D (uint16_t)-1 >> (16 - bps);
>> +@@ -3363,7 +3431,7 @@ extractContigSamplesShifted24bits (uint8_t *in, u=
int8_t *out, uint32_t cols,
>> +                                    int shift)
>> +   {
>> +   int    ready_bits =3D 0, sindex =3D 0;
>> +-  uint32_t col, src_byte, src_bit, bit_offset;
>> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
>> +   uint32_t maskbits =3D 0, matchbits =3D 0;
>> +   uint32_t buff1 =3D 0, buff2 =3D 0;
>> +   uint8_t  bytebuff1 =3D 0, bytebuff2 =3D 0;
>> +@@ -3376,6 +3444,16 @@ extractContigSamplesShifted24bits (uint8_t *in, =
uint8_t *out, uint32_t cols,
>> +     return (1);
>> +     }
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  /*--- Remark, which is true for all those functions extractCongigSam=
plesXXX() --
>> ++  *  The mitigation of the start/end test does not allways make sense,=
 because the function is often called with e.g.:
>> ++  *  start =3D 31; end =3D 32; cols =3D 32  to extract the last column=
 in a 32x32 sample image.
>> ++  *  If then, a worng parameter (e.g. cols =3D 10) is provided, the mi=
tigated settings would be start=3D0; end=3D1.
>> ++  *  Therefore, an error message and no copy action might be the bette=
r reaction to wrong parameter configurations.
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamplesShifted24bits",
>> +@@ -3388,6 +3466,9 @@ extractContigSamplesShifted24bits (uint8_t *in, u=
int8_t *out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> +
>> +   ready_bits =3D shift;
>> +   maskbits =3D  (uint32_t)-1 >> (32 - bps);
>> +@@ -3449,7 +3530,7 @@ extractContigSamplesShifted24bits (uint8_t *in, u=
int8_t *out, uint32_t cols,
>> +     buff2 =3D (buff2 << 8);
>> +     bytebuff2 =3D bytebuff1;
>> +     ready_bits -=3D 8;
>> +-    }
>> ++  }
>> +
>> +   return (0);
>> +   } /* end extractContigSamplesShifted24bits */
>> +@@ -3461,7 +3542,7 @@ extractContigSamplesShifted32bits (uint8_t *in, u=
int8_t *out, uint32_t cols,
>> +                                    int shift)
>> +   {
>> +   int    ready_bits =3D 0, sindex =3D 0 /*, shift_width =3D 0 */;
>> +-  uint32_t col, src_byte, src_bit, bit_offset;
>> ++  uint32_t col, src_byte, src_bit, bit_offset, numcols;
>> +   uint32_t longbuff1 =3D 0, longbuff2 =3D 0;
>> +   uint64_t maskbits =3D 0, matchbits =3D 0;
>> +   uint64_t buff1 =3D 0, buff2 =3D 0, buff3 =3D 0;
>> +@@ -3476,6 +3557,10 @@ extractContigSamplesShifted32bits (uint8_t *in, =
uint8_t *out, uint32_t cols,
>> +     }
>> +
>> +
>> ++  /* Number of extracted columns shall be kept as (end-start + 1). Oth=
erwise buffer-overflow might occur.
>> ++   * 'start' and 'col' count from 0 to (cols-1)  but 'end' is to be se=
t one after the index of the last column to be copied!
>> ++   */
>> ++  numcols =3D abs(end - start);
>> +   if ((start > end) || (start > cols))
>> +     {
>> +     TIFFError ("extractContigSamplesShifted32bits",
>> +@@ -3488,6 +3573,9 @@ extractContigSamplesShifted32bits (uint8_t *in, u=
int8_t *out, uint32_t cols,
>> +                "Invalid end column value %"PRIu32" ignored", end);
>> +     end =3D cols;
>> +     }
>> ++  if (abs(end - start) > numcols) {
>> ++      end =3D start + numcols;
>> ++  }
>> +
>> +   /* shift_width =3D ((bps + 7) / 8) + 1; */
>> +   ready_bits =3D shift;
>> +@@ -5429,7 +5517,7 @@ getCropOffsets(struct image_data *image, struct c=
rop_mask *crop, struct dump_opt
>> +   {
>> +   struct offset offsets;
>> +   int    i;
>> +-  int32_t  test;
>> ++  uint32_t uaux;
>> +   uint32_t seg, total, need_buff =3D 0;
>> +   uint32_t buffsize;
>> +   uint32_t zwidth, zlength;
>> +@@ -5510,8 +5598,13 @@ getCropOffsets(struct image_data *image, struct =
crop_mask *crop, struct dump_opt
>> +     seg =3D crop->zonelist[j].position;
>> +     total =3D crop->zonelist[j].total;
>> +
>> +-    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip t=
hat input */
>> ++    /* check for not allowed zone cases like 0:0; 4:3; or negative one=
s etc. and skip that input */
>> ++    if (crop->zonelist[j].position < 0 || crop->zonelist[j].total < 0)=
 {
>> ++        TIFFError("getCropOffsets", "Negative crop zone values %d:%d a=
re not allowed, thus skipped.", crop->zonelist[j].position, crop->zonelist[=
j].total);
>> ++        continue;
>> ++    }
>> +     if (seg =3D=3D 0 || total =3D=3D 0 || seg > total) {
>> ++        TIFFError("getCropOffsets", "Crop zone %d:%d is out of specifi=
cation, thus skipped.", seg, total);
>> +         continue;
>> +     }
>> +
>> +@@ -5524,17 +5617,23 @@ getCropOffsets(struct image_data *image, struct=
 crop_mask *crop, struct dump_opt
>> +
>> +            crop->regionlist[i].x1 =3D offsets.startx +
>> +                                   (uint32_t)(offsets.crop_width * 1.0 =
* (seg - 1) / total);
>> +-           test =3D (int32_t)offsets.startx +
>> +-                  (int32_t)(offsets.crop_width * 1.0 * seg / total);
>> +-           if (test < 1 )
>> +-             crop->regionlist[i].x2 =3D 0;
>> +-           else
>> +-           {
>> +-           if (test > (int32_t)(image->width - 1))
>> ++           /* FAULT: IMHO in the old code here, the calculation of x2 =
was based on wrong assumtions. The whole image was assumed and 'endy' and '=
starty' are not respected anymore!*/
>> ++           /* NEW PROPOSED Code: Assumption: offsets are within image =
with top left corner as origin (0,0) and 'start' <=3D 'end'. */
>> ++           if (crop->regionlist[i].x1 > offsets.endx) {
>> ++                crop->regionlist[i].x1 =3D offsets.endx;
>> ++           } else if (crop->regionlist[i].x1 >=3D image->width) {
>> ++               crop->regionlist[i].x1 =3D image->width - 1;
>> ++           }
>> ++
>> ++           crop->regionlist[i].x2 =3D offsets.startx + (uint32_t)(offs=
ets.crop_width * 1.0 * seg / total);
>> ++           if (crop->regionlist[i].x2 > 0) crop->regionlist[i].x2 =3D =
crop->regionlist[i].x2 - 1;
>> ++           if (crop->regionlist[i].x2 < crop->regionlist[i].x1) {
>> ++               crop->regionlist[i].x2 =3D crop->regionlist[i].x1;
>> ++           } else if (crop->regionlist[i].x2 > offsets.endx) {
>> ++               crop->regionlist[i].x2 =3D offsets.endx;
>> ++           } else if (crop->regionlist[i].x2 >=3D image->width) {
>> +                crop->regionlist[i].x2 =3D image->width - 1;
>> +-             else
>> +-             crop->regionlist[i].x2 =3D test - 1;
>> +-             }
>> ++           }
>> +            zwidth =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 =
 + 1;
>> +
>> +          /* This is passed to extractCropZone or extractCompositeZones=
 */
>> +@@ -5549,22 +5648,27 @@ getCropOffsets(struct image_data *image, struct=
 crop_mask *crop, struct dump_opt
>> +          crop->regionlist[i].x1 =3D offsets.startx;
>> +            crop->regionlist[i].x2 =3D offsets.endx;
>> +
>> +-           test =3D offsets.endy - (uint32_t)(offsets.crop_length * 1.=
0 * seg / total);
>> +-           if (test < 1 )
>> +-           crop->regionlist[i].y1 =3D 0;
>> +-           else
>> +-           crop->regionlist[i].y1 =3D test + 1;
>> ++           /* FAULT: IMHO in the old code here, the calculation of y1/=
y2 was based on wrong assumtions. The whole image was assumed and 'endy' an=
d 'starty' are not respected anymore!*/
>> ++           /* NEW PROPOSED Code: Assumption: offsets are within image =
with top left corner as origin (0,0) and 'start' <=3D 'end'. */
>> ++           uaux =3D (uint32_t)(offsets.crop_length * 1.0 * seg / total=
);
>> ++           if (uaux <=3D offsets.endy + 1) {
>> ++               crop->regionlist[i].y1 =3D offsets.endy - uaux + 1;
>> ++           } else {
>> ++               crop->regionlist[i].y1 =3D 0;
>> ++           }
>> ++           if (crop->regionlist[i].y1 < offsets.starty) {
>> ++               crop->regionlist[i].y1 =3D offsets.starty;
>> ++           }
>> +
>> +-           test =3D offsets.endy - (offsets.crop_length * 1.0 * (seg -=
 1) / total);
>> +-           if (test < 1 )
>> +-             crop->regionlist[i].y2 =3D 0;
>> +-           else
>> +-           {
>> +-             if (test > (int32_t)(image->length - 1))
>> +-               crop->regionlist[i].y2 =3D image->length - 1;
>> +-             else
>> +-               crop->regionlist[i].y2 =3D test;
>> +-           }
>> ++           uaux =3D (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) /=
 total);
>> ++           if (uaux <=3D offsets.endy) {
>> ++               crop->regionlist[i].y2 =3D offsets.endy - uaux;
>> ++           } else {
>> ++               crop->regionlist[i].y2 =3D 0;
>> ++           }
>> ++           if (crop->regionlist[i].y2 < offsets.starty) {
>> ++               crop->regionlist[i].y2 =3D offsets.starty;
>> ++           }
>> +            zlength =3D crop->regionlist[i].y2 - crop->regionlist[i].y1=
 + 1;
>> +
>> +          /* This is passed to extractCropZone or extractCompositeZones=
 */
>> +@@ -5575,32 +5679,42 @@ getCropOffsets(struct image_data *image, struct=
 crop_mask *crop, struct dump_opt
>> +            crop->combined_width =3D (uint32_t)zwidth;
>> +            break;
>> +       case EDGE_RIGHT: /* zones from right to left, length from top */
>> +-           zlength =3D offsets.crop_length;
>> +-         crop->regionlist[i].y1 =3D offsets.starty;
>> +-           crop->regionlist[i].y2 =3D offsets.endy;
>> +-
>> +-           crop->regionlist[i].x1 =3D offsets.startx +
>> +-                                  (uint32_t)(offsets.crop_width * (tot=
al - seg) * 1.0 / total);
>> +-           test =3D offsets.startx +
>> +-                (offsets.crop_width * (total - seg + 1) * 1.0 / total)=
;
>> +-           if (test < 1 )
>> +-             crop->regionlist[i].x2 =3D 0;
>> +-           else
>> +-           {
>> +-           if (test > (int32_t)(image->width - 1))
>> +-               crop->regionlist[i].x2 =3D image->width - 1;
>> +-             else
>> +-               crop->regionlist[i].x2 =3D test - 1;
>> +-             }
>> +-           zwidth =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 =
 + 1;
>> ++                zlength =3D offsets.crop_length;
>> ++                crop->regionlist[i].y1 =3D offsets.starty;
>> ++                crop->regionlist[i].y2 =3D offsets.endy;
>> ++
>> ++                crop->regionlist[i].x1 =3D offsets.startx +
>> ++                        (uint32_t)(offsets.crop_width * (total - seg) =
* 1.0 / total);
>> ++          /* FAULT: IMHO from here on, the calculation of y2 are based=
 on wrong assumtions. The whole image is assumed and 'endy' and 'starty' ar=
e not respected anymore!*/
>> ++          /* NEW PROPOSED Code: Assumption: offsets are within image w=
ith top left corner as origin (0,0) and 'start' <=3D 'end'. */
>> ++          uaux =3D (uint32_t)(offsets.crop_width * 1.0 * seg / total);
>> ++          if (uaux <=3D offsets.endx + 1) {
>> ++              crop->regionlist[i].x1 =3D offsets.endx - uaux + 1;
>> ++          } else {
>> ++              crop->regionlist[i].x1 =3D 0;
>> ++          }
>> ++          if (crop->regionlist[i].x1 < offsets.startx) {
>> ++              crop->regionlist[i].x1 =3D offsets.startx;
>> ++          }
>> +
>> +-         /* This is passed to extractCropZone or extractCompositeZones=
 */
>> +-           crop->combined_length =3D (uint32_t)zlength;
>> +-           if (crop->exp_mode =3D=3D COMPOSITE_IMAGES)
>> +-             crop->combined_width +=3D (uint32_t)zwidth;
>> +-           else
>> +-             crop->combined_width =3D (uint32_t)zwidth;
>> +-           break;
>> ++          uaux =3D (uint32_t)(offsets.crop_width * 1.0 * (seg - 1) / t=
otal);
>> ++          if (uaux <=3D offsets.endx) {
>> ++              crop->regionlist[i].x2 =3D offsets.endx - uaux;
>> ++          } else {
>> ++              crop->regionlist[i].x2 =3D 0;
>> ++          }
>> ++          if (crop->regionlist[i].x2 < offsets.startx) {
>> ++              crop->regionlist[i].x2 =3D offsets.startx;
>> ++          }
>> ++          zwidth =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 +=
 1;
>> ++
>> ++                /* This is passed to extractCropZone or extractComposi=
teZones */
>> ++                crop->combined_length =3D (uint32_t)zlength;
>> ++                if (crop->exp_mode =3D=3D COMPOSITE_IMAGES)
>> ++                        crop->combined_width +=3D (uint32_t)zwidth;
>> ++                else
>> ++                        crop->combined_width =3D (uint32_t)zwidth;
>> ++                break;
>> +       case EDGE_TOP: /* width from left, zones from top to bottom */
>> +       default:
>> +            zwidth =3D offsets.crop_width;
>> +@@ -5608,6 +5722,14 @@ getCropOffsets(struct image_data *image, struct =
crop_mask *crop, struct dump_opt
>> +            crop->regionlist[i].x2 =3D offsets.endx;
>> +
>> +            crop->regionlist[i].y1 =3D offsets.starty + (uint32_t)(offs=
ets.crop_length * 1.0 * (seg - 1) / total);
>> ++           if (crop->regionlist[i].y1 > offsets.endy) {
>> ++               crop->regionlist[i].y1 =3D offsets.endy;
>> ++           } else if (crop->regionlist[i].y1 >=3D image->length) {
>> ++               crop->regionlist[i].y1 =3D image->length - 1;
>> ++           }
>> ++
>> ++           /* FAULT: IMHO from here on, the calculation of y2 are base=
d on wrong assumtions. The whole image is assumed and 'endy' and 'starty' a=
re not respected anymore!*/
>> ++           /* OLD Code:
>> +            test =3D offsets.starty + (uint32_t)(offsets.crop_length * =
1.0 * seg / total);
>> +            if (test < 1 )
>> +              crop->regionlist[i].y2 =3D 0;
>> +@@ -5618,6 +5740,18 @@ getCropOffsets(struct image_data *image, struct =
crop_mask *crop, struct dump_opt
>> +              else
>> +              crop->regionlist[i].y2 =3D test - 1;
>> +            }
>> ++           */
>> ++                 /* NEW PROPOSED Code: Assumption: offsets are within =
image with top left corner as origin (0,0) and 'start' <=3D 'end'. */
>> ++                 crop->regionlist[i].y2 =3D offsets.starty + (uint32_t=
)(offsets.crop_length * 1.0 * seg / total);
>> ++           if (crop->regionlist[i].y2 > 0)crop->regionlist[i].y2 =3D c=
rop->regionlist[i].y2 - 1;
>> ++                 if (crop->regionlist[i].y2 < crop->regionlist[i].y1) =
{
>> ++                         crop->regionlist[i].y2 =3D crop->regionlist[i=
].y1;
>> ++                 } else if (crop->regionlist[i].y2 > offsets.endy) {
>> ++                         crop->regionlist[i].y2 =3D offsets.endy;
>> ++                 } else if (crop->regionlist[i].y2 >=3D image->length)=
 {
>> ++                         crop->regionlist[i].y2 =3D image->length - 1;
>> ++                 }
>> ++
>> +            zlength =3D crop->regionlist[i].y2 - crop->regionlist[i].y1=
 + 1;
>> +
>> +          /* This is passed to extractCropZone or extractCompositeZones=
 */
>> +@@ -7551,7 +7685,8 @@ processCropSelections(struct image_data *image, s=
truct crop_mask *crop,
>> +     total_width =3D total_length =3D 0;
>> +     for (i =3D 0; i < crop->selections; i++)
>> +       {
>> +-      cropsize =3D crop->bufftotal;
>> ++
>> ++        cropsize =3D crop->bufftotal;
>> +       crop_buff =3D seg_buffs[i].buffer;
>> +       if (!crop_buff)
>> +         crop_buff =3D (unsigned char *)limitMalloc(cropsize);
>> +@@ -7640,6 +7775,9 @@ processCropSelections(struct image_data *image, s=
truct crop_mask *crop,
>> +
>> +       if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as i=
t can reallocate the buffer */
>> +         {
>> ++          /* rotateImage() changes image->width, ->length, ->xres and =
->yres, what it schouldn't do here, when more than one section is processed=
.
>> ++           * ToDo: Therefore rotateImage() and its usage has to be rew=
orked (e.g. like mirrorImage()) !!
>> ++           */
>> +       if (rotateImage(crop->rotation, image, &crop->regionlist[i].widt=
h,
>> +                       &crop->regionlist[i].length, &crop_buff))
>> +           {
>> +@@ -7655,8 +7793,8 @@ processCropSelections(struct image_data *image, s=
truct crop_mask *crop,
>> +         seg_buffs[i].size =3D (((crop->regionlist[i].width * image->bp=
s + 7 ) / 8)
>> +                                * image->spp) * crop->regionlist[i].len=
gth;
>> +         }
>> +-      }
>> +-    }
>> ++      }  /* for crop->selections loop */
>> ++    }  /* Separated Images (else case) */
>> +   return (0);
>> +   } /* end processCropSelections */
>> +
>> +--
>> +2.33.0
>> +
>> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch b/=
meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
>> new file mode 100644
>> index 0000000000..3a3a915688
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
>> @@ -0,0 +1,87 @@
>> +CVE: CVE-2022-2953
>> +Upstream-Status: Backport
>> +Signed-off-by: Ross Burton <ross.burton@arm.com>
>> +Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
>> +
>> +From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00 2001
>> +From: Su_Laus <sulau@freenet.de>
>> +Date: Mon, 15 Aug 2022 22:11:03 +0200
>> +Subject: [PATCH] =3D?UTF-8?q?According=3D20to=3D20Richard=3D20Nolde=3D2=
0https://gitl?=3D
>> + =3D?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=3D5F877637400=3D2=
0the=3D20ti?=3D
>> + =3D?UTF-8?q?ffcrop=3D20option=3D20=3DE2=3D80=3D9E-S=3DE2=3D80=3D9C=3D2=
0is=3D20also=3D20mutually?=3D
>> + =3D?UTF-8?q?=3D20exclusive=3D20to=3D20the=3D20other=3D20crop=3D20optio=
ns=3D20(-X|-Y),=3D20-?=3D
>> + =3D?UTF-8?q?Z=3D20and=3D20-z.?=3D
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +This is now checked and ends tiffcrop if those arguments are not mutual=
ly exclusive.
>> +
>> +This MR will fix the following tiffcrop issues: #349, #414, #422, #423,=
 #424
>> +---
>> + tools/tiffcrop.c | 31 ++++++++++++++++---------------
>> + 1 file changed, 16 insertions(+), 15 deletions(-)
>> +
>> +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
>> +index 90286a5e..c3b758ec 100644
>> +--- a/tools/tiffcrop.c
>> ++++ b/tools/tiffcrop.c
>> +@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] =3D "02-09-2022=
";
>> + #define ROTATECW_270 32
>> + #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
>> +
>> +-#define CROP_NONE     0
>> +-#define CROP_MARGINS  1
>> +-#define CROP_WIDTH    2
>> +-#define CROP_LENGTH   4
>> +-#define CROP_ZONES    8
>> +-#define CROP_REGIONS 16
>> ++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page->ro=
ws/->cols !=3D 0 */
>> ++#define CROP_MARGINS  1     /* "-m" */
>> ++#define CROP_WIDTH    2     /* "-X" */
>> ++#define CROP_LENGTH   4     /* "-Y" */
>> ++#define CROP_ZONES    8     /* "-Z" */
>> ++#define CROP_REGIONS 16     /* "-z" */
>> + #define CROP_ROTATE  32
>> + #define CROP_MIRROR  64
>> + #define CROP_INVERT 128
>> +@@ -316,7 +316,7 @@ struct crop_mask {
>> + #define PAGE_MODE_RESOLUTION   1
>> + #define PAGE_MODE_PAPERSIZE    2
>> + #define PAGE_MODE_MARGINS      4
>> +-#define PAGE_MODE_ROWSCOLS     8
>> ++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
>> +
>> + #define INVERT_DATA_ONLY      10
>> + #define INVERT_DATA_AND_TAG   11
>> +@@ -781,7 +781,7 @@ static const char usage_info[] =3D
>> + "             The four debug/dump options are independent, though it m=
akes little sense to\n"
>> + "             specify a dump file without specifying a detail level.\n=
"
>> + "\n"
>> +-"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n=
"
>> ++"Note:        The (-X|-Y), -Z, -z and -S options are mutually exclusiv=
e.\n"
>> + "             In no case should the options be applied to a given sele=
ction successively.\n"
>> + "\n"
>> + ;
>> +@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char *arg=
v[], char *mp, char *mode, uint32
>> +               /*NOTREACHED*/
>> +       }
>> +     }
>> +-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z=
 are mutually exclusive) --*/
>> +-    char XY, Z, R;
>> ++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z an=
d -S are mutually exclusive) --*/
>> ++    char XY, Z, R, S;
>> +     XY =3D ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mo=
de & CROP_LENGTH));
>> +     Z =3D (crop_data->crop_mode & CROP_ZONES);
>> +     R =3D (crop_data->crop_mode & CROP_REGIONS);
>> +-    if ((XY && Z) || (XY && R) || (Z && R)) {
>> +-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z=
 and -z are mutually exclusive.->Exit");
>> ++    S =3D (page->mode & PAGE_MODE_ROWSCOLS);
>> ++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) ||=
 (R && S)) {
>> ++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z=
, -z and -S are mutually exclusive.->Exit");
>> +         exit(EXIT_FAILURE);
>> +     }
>> +   }  /* end process_command_opts */
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipe=
s-multimedia/libtiff/tiff_4.3.0.bb
>> index f84057c46b..29a2c38d8e 100644
>> --- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>> +++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>> @@ -25,6 +25,8 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${=
PV}.tar.gz \
>>             file://CVE-2022-2869.patch \
>>             file://CVE-2022-2867.patch \
>>             file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
>> +           file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to=
-349.patch \
>> +           file://CVE-2022-2953.patch \
>>             "
>>
>>  SRC_URI[sha256sum] =3D "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5da=
aad1c2e89e1b37ac8"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172667): https://lists.openembedded.org/g/openembedd=
ed-core/message/172667
>> Mute This Topic: https://lists.openembedded.org/mt/94799048/7032091
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [s=
kulkarni@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

