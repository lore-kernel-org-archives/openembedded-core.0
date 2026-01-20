Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A41D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:34:14 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4364.1768908851933994460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z53OMOz3;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so3617250f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768908850; cv=none;
        d=google.com; s=arc-20240605;
        b=a6Vsog/Z6QdNuPRng4AFYKt+/M/xvdc8EpwmIWOicw1jP0KX9BaHNq12vLuKAu+QCL
         nWlg8moURYmRmvYzjwoQQQC+jC/3rXiZ5ZXCrwEkLejEvDDfkr/XB2WFI7avaZsWeyhY
         9V09uJD4b24RQIYpFbVe8vbvW51DXeidsYAqreABzk5CbnXNPErwlyQwCwsayw6O3vvn
         qfJYN2RGKPk9r3ul7ebZbKmUT4uDfvWyGp6FRwqI7lhSO/amXAj9oHm1RFeFVB0PFlZ8
         hKV/pW0HvqqEwpVOAtHnRneob12YXnr0x/U29adIEET1njJKkUl86DRC90QQLpyuVqMy
         5aMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mgfhY9RloAbbx2yLm6FLRruUPZ4/f+SRLV4j9rk4gfE=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=J+rYyHvs+YlrBK8npGEs8W/bPIXE9n3Eg5IpVIUW5ZU0/NmDT/J9c0b0kXrPr3o54V
         lHevA6J6dEZu2oiZy3XFW6Us09w5PLQEyxHViIFMKrqubFyxWBrs2+aLF54tMn365IjH
         CYYHVKRx2kqyfNDmK3ScmW2EUKb6Q9peX1zibK6k8cpeUFnNwxVtQvYY/39VrJiTZBt8
         A/8xb60FuJH7//SM102gRKzJ81HToK2PsRhshDw2iJnf7HqyPhK1mbmp1afu7EndVMM/
         76PPf15MFALZDHi2bYxEYFpBcmYvBuG2dSnVyyfgkotYX088r09IdDA4eOkpnOZs9BZr
         437w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908850; x=1769513650; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgfhY9RloAbbx2yLm6FLRruUPZ4/f+SRLV4j9rk4gfE=;
        b=z53OMOz3LXFqw5fwJAl2HRGgCQPZnfZJd316fvtj31f0UGzC7fScjvupGLbWTK3Wpw
         DY9/PeQPaXLIP5IFyxhnavpoZh23BnjACXjZHDZZSKGL/WNW7TpNBLgL+IiSsQJussEz
         bd7BXWryxp2m8tW1y6uVIPL/Y1xNXT6NxVrZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908850; x=1769513650;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgfhY9RloAbbx2yLm6FLRruUPZ4/f+SRLV4j9rk4gfE=;
        b=MHZMimW+D3WnqcGR4xA2XzHtqGZfLbsyIvWTbmjcvCHQ0afy4YSPKxYEthlSvcUG9W
         ScDcMmtChYobhoh8ceuu1vIq5PfdJzbsCcAUCQT0bv3FRarwrvMqHl1fN5KPgfacnXk8
         542RfS7raHSQHBUceSfSedkFq2aMqtLLyFbbzP4eD7BYRQHxoBkn0ZS316y5Gtm9ZeZE
         vbhOLqGmr2k1ZYHCEDictyKoWQEBVYD1WNsQyGcKDtWNWZaj4CqV3G2/RwUQzs2yNzng
         MIitT96inwztIy8uNZ6Fr9z8l1D0ma8ucM1mOcgZz8RjtMP/sQJQWaUMwxh8NRciPfay
         bEuw==
X-Gm-Message-State: AOJu0YwPR80Dizpw3VagqTDKMdyePNpgUB6zRykWjlVrn9U81M4KEmjh
	ZSu87sbpLJy9SC/MUXz/i1vk4nYMru7p0cavRApmqKhvNFrEB+GnAEUmbFuVEGmFB8JkMjUy/R6
	imY1951X7sD47aPJk3G++ZT24Zxg8YJA2PLL8BS51LavWY9y7iCh5W70=
X-Gm-Gg: AZuq6aJeg14Wdnr+u+KhqN5l3oBQXp/LVJsb6X/rKgrOnq7xd0JD1f5bk3PNSjmyoar
	4Mxwdh4P2Mo3o4s1SsgktCXBTn96ajZsDidZ9TXsDUa+6VU2inPTCsmZLOjbPRDjWmvGLOO6B6h
	N4HVVwJSQ7Mld9DvrCQoyuN8DMuXueVZN2oZyGFmmYfWj/afSCEduD/K4/VTTvMW1KEWcSOq9/F
	F6ELVcwa1oyU5k/8S0B6YXXoMLtjl9skQ8VExURCTD1NdrQBwYh2bP9XoEf3uT/uXx1PwJgTA==
X-Received: by 2002:a05:6000:1842:b0:432:852d:5662 with SMTP id
 ffacd0b85a97d-4356a072156mr17542407f8f.63.1768908849602; Tue, 20 Jan 2026
 03:34:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768906687.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 20 Jan 2026 12:33:43 +0100
X-Gm-Features: AZwV_QiKvWb8M-8-z4eBOX_24v4ASlms5VWNbMO0CcZbuUz-qpGWkEt-EhNqrww
Message-ID: <CAMSfU+7xC24_hHJeAd31jzxnp9AEWMPhQH=H9zA7JtPCTNctiA@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 00/15] Patch review
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009efa740648d02ff2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229676

--0000000000009efa740648d02ff2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 janv. 2026 =C3=A0 12:24, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> Please review this set of changes for whinlatter and have comments back b=
y
> end of day Thursday, January 22.
>
> This whinlatter patch review request is aimed at getting kirkstone
> 4.0.33 built on monday:
> * Ensuring fixes in kirkstone have their equivalent in more recent
>   stable branches.
> * pseudo upgrade to fix 16117 =E2=80=93 AB-INT: do_package: Error executi=
ng a
> python function in exec_func_python() autogenerated
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16117
> * ffmpeg patches to fix 16000 =E2=80=93 AB-INT: ffmpeg build failing
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16000
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3092
>
>
> The following changes since commit
> dd10706cfafb5574b7cf316fca2300d166ef71b0:
>
>   build-appliance-image: Update to whinlatter head revisions (2026-01-12
> 10:58:53 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/whinlatter-nut
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wh=
inlatter-nut


That should have been the "stable/whinlatter-next" branch.
I've since pushed these commits on stable/whinlatter-next.
Sorry I got this mixed up.


> for you to fetch changes up to e7891f39ae90d1c23bfcb59af0064591513a671d:
>
>   libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-19 23:29:16 +0100)
>
> ----------------------------------------------------------------
>
> Alexander Kanavin (3):
>   libpng: upgrade 1.6.52 -> 1.6.53
>   ffmpeg: add a (possible) build race fix
>   ffmpeg: fix a build race, hopefully for real this time
>
> Paul Barker (1):
>   selftest: devtool: Set PATH when running pseudo
>
> Peter Marko (9):
>   util-linux: patch CVE-2025-14104
>   gnupg: patch CVE-2025-68973
>   curl: patch CVE-2025-13034
>   curl: patch CVE-2025-14017
>   curl: patch CVE-2025-14524
>   curl: patch CVE-2025-14819
>   curl: patch CVE-2025-15079
>   curl: patch CVE-2025-15224
>   libarchive: upgrade 3.8.4 -> 3.8.5
>
> Richard Purdie (2):
>   pseudo: Update to pull in openat2 and efault return code changes
>   pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
>
>  meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
>  meta/recipes-core/util-linux/util-linux.inc   |   2 +
>  .../util-linux/CVE-2025-14104-01.patch        |  33 +++++
>  .../util-linux/CVE-2025-14104-02.patch        |  28 +++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
>  ...ibarchive_3.8.4.bb =3D> libarchive_3.8.5.bb} |   2 +-
>  ...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++
>  ...s-Fix-double-build-by-disabling-.d-f.patch |  78 ++++++++++++
>  ...ak-ensure-target-directories-are-cre.patch |  43 +++++++
>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   6 +-
>  .../{libpng_1.6.52.bb =3D> libpng_1.6.53.bb}    |   2 +-
>  .../curl/curl/CVE-2025-13034.patch            |  37 ++++++
>  .../curl/curl/CVE-2025-14017.patch            | 116 ++++++++++++++++++
>  .../curl/curl/CVE-2025-14524.patch            |  40 ++++++
>  .../curl/curl/CVE-2025-14819.patch            |  73 +++++++++++
>  .../curl/curl/CVE-2025-15079.patch            |  32 +++++
>  .../curl/curl/CVE-2025-15224.patch            |  31 +++++
>  meta/recipes-support/curl/curl_8.17.0.bb      |   6 +
>  .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ++++++++++++++++
>  meta/recipes-support/gnupg/gnupg_2.5.11.bb    |   1 +
>  20 files changed, 745 insertions(+), 6 deletions(-)
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
>  rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb =3D>
> libarchive_3.8.5.bb} (96%)
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild-commonmak-Consolidate-=
pattern-rules-for-comp.patch
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools-resources-Fix-double-b=
uild-by-disabling-.d-f.patch
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-targ=
et-directories-are-cre.patch
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb =3D>
> libpng_1.6.53.bb} (97%)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch
>  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
>
>

--=20
Yoann Congal
Smile ECS

--0000000000009efa740648d02ff2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20=
 janv. 2026 =C3=A0=C2=A012:24, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Please review this set of c=
hanges for whinlatter and have comments back by<br>
end of day Thursday, January 22.<br>
<br>
This whinlatter patch review request is aimed at getting kirkstone<br>
4.0.33 built on monday:<br>
* Ensuring fixes in kirkstone have their equivalent in more recent<br>
=C2=A0 stable branches.<br>
* pseudo upgrade to fix 16117 =E2=80=93 AB-INT: do_package: Error executing=
 a python function in exec_func_python() autogenerated<br>
=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16117=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D16117</a><br>
* ffmpeg patches to fix 16000 =E2=80=93 AB-INT: ffmpeg build failing<br>
=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16000=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D16000</a><br>
<br>
Passed a-full on autobuilder:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3092" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/3092</a><br>
<br>
<br>
The following changes since commit dd10706cfafb5574b7cf316fca2300d166ef71b0=
:<br>
<br>
=C2=A0 build-appliance-image: Update to whinlatter head revisions (2026-01-=
12 10:58:53 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/whinlatter-nut<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/whinlatter-nut" rel=3D"noreferrer" target=3D"_blank">https://=
git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/whinlatter-n=
ut</a></blockquote><div><br></div><div>That should have been the &quot;stab=
le/whinlatter-next&quot; branch.</div><div>I&#39;ve since pushed these comm=
its on stable/whinlatter-next.</div><div>Sorry I got this mixed up.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
for you to fetch changes up to e7891f39ae90d1c23bfcb59af0064591513a671d:<br=
>
<br>
=C2=A0 libarchive: upgrade 3.8.4 -&gt; 3.8.5 (2026-01-19 23:29:16 +0100)<br=
>
<br>
----------------------------------------------------------------<br>
<br>
Alexander Kanavin (3):<br>
=C2=A0 libpng: upgrade 1.6.52 -&gt; 1.6.53<br>
=C2=A0 ffmpeg: add a (possible) build race fix<br>
=C2=A0 ffmpeg: fix a build race, hopefully for real this time<br>
<br>
Paul Barker (1):<br>
=C2=A0 selftest: devtool: Set PATH when running pseudo<br>
<br>
Peter Marko (9):<br>
=C2=A0 util-linux: patch CVE-2025-14104<br>
=C2=A0 gnupg: patch CVE-2025-68973<br>
=C2=A0 curl: patch CVE-2025-13034<br>
=C2=A0 curl: patch CVE-2025-14017<br>
=C2=A0 curl: patch CVE-2025-14524<br>
=C2=A0 curl: patch CVE-2025-14819<br>
=C2=A0 curl: patch CVE-2025-15079<br>
=C2=A0 curl: patch CVE-2025-15224<br>
=C2=A0 libarchive: upgrade 3.8.4 -&gt; 3.8.5<br>
<br>
Richard Purdie (2):<br>
=C2=A0 pseudo: Update to pull in openat2 and efault return code changes<br>
=C2=A0 pseudo: Update to pull in &#39;makewrappers: Fix EFAULT implementati=
on&#39;<br>
<br>
=C2=A0meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +-<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../util-linux/CVE-2025-14104-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 33 +++++<br>
=C2=A0.../util-linux/CVE-2025-14104-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 28 +++++<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
=C2=A0...<a href=3D"http://ibarchive_3.8.4.bb" rel=3D"noreferrer" target=3D=
"_blank">ibarchive_3.8.4.bb</a> =3D&gt; <a href=3D"http://libarchive_3.8.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...k-Consolidate-pattern-rules-for-comp.patch | 106 ++++++++++++++++<=
br>
=C2=A0...s-Fix-double-build-by-disabling-.d-f.patch |=C2=A0 78 ++++++++++++=
<br>
=C2=A0...ak-ensure-target-directories-are-cre.patch |=C2=A0 43 +++++++<br>
=C2=A0meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_8.0.bb</a>=C2=A0 |=C2=A0 =C2=A06 +=
-<br>
=C2=A0.../{<a href=3D"http://libpng_1.6.52.bb" rel=3D"noreferrer" target=3D=
"_blank">libpng_1.6.52.bb</a> =3D&gt; <a href=3D"http://libpng_1.6.53.bb" r=
el=3D"noreferrer" target=3D"_blank">libpng_1.6.53.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../curl/curl/CVE-2025-13034.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 37 ++++++<br>
=C2=A0.../curl/curl/CVE-2025-14017.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 116 ++++++++++++++++++<br>
=C2=A0.../curl/curl/CVE-2025-14524.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 40 ++++++<br>
=C2=A0.../curl/curl/CVE-2025-14819.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 73 +++++++++++<br>
=C2=A0.../curl/curl/CVE-2025-15079.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 32 +++++<br>
=C2=A0.../curl/curl/CVE-2025-15224.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 31 +++++<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_8.17.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_8.17.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A06 +<br>
=C2=A0.../gnupg/gnupg/CVE-2025-68973.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 108 ++++++++++++++++<br>
=C2=A0meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.11.bb" rel=3D"=
noreferrer" target=3D"_blank">gnupg_2.5.11.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A020 files changed, 745 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-1=
4104-01.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-1=
4104-02.patch<br>
=C2=A0rename meta/recipes-extended/libarchive/{<a href=3D"http://libarchive=
_3.8.4.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.4.bb</a> =3D=
&gt; <a href=3D"http://libarchive_3.8.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">libarchive_3.8.5.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-ffbuild=
-commonmak-Consolidate-pattern-rules-for-comp.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-fftools=
-resources-Fix-double-build-by-disabling-.d-f.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild=
-common.mak-ensure-target-directories-are-cre.patch<br>
=C2=A0rename meta/recipes-multimedia/libpng/{<a href=3D"http://libpng_1.6.5=
2.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.52.bb</a> =3D&gt; <a =
href=3D"http://libpng_1.6.53.bb" rel=3D"noreferrer" target=3D"_blank">libpn=
g_1.6.53.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14819.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.pa=
tch<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000009efa740648d02ff2--

