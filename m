Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E374AC5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:55:59 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20629.1780390556697063116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 01:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SVZEu+mz;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: ernstp@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bec449cf976so251008366b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780390555; cv=none;
        d=google.com; s=arc-20240605;
        b=Ds5FCk802x+A4xNd+PKx/OM/nhDafE0//aUnZ+fs9DSYtDrsW6baeu4cPDhHM4xiyd
         hpM672hHfDOmLMKLpQeEaddf2+EyVtlHcQcgzCiQRGhZSIogZVl2c7fP5s8NcHfUbAVh
         XRNWnH3l8R8smdo8aQhs7EVHcU67tXOS5HFx0AvP9WwqXqzZQvq8ahWsvgHtiNUA+O09
         g24WeihowrQgMkNqyDb+6je2HRXj/v+4NHt8OCRBUg7BQS8LcT1gmCMKUsZkTn5bqLEp
         XBO4SFYfSS5GSPuhfkkXqM1vqLcq7OHwf8iGhQUzPxrPJ6nB6jHWWdzefCLgJsl5ycPw
         hulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eE4L/6C1SnQ2KHeE4IgVGZ0YHQmUcuslD2AGGiKDkoc=;
        fh=iDP96uj99bwyV4aa9B1O3MnG71E6G7V92t995d7omPc=;
        b=Xr8gGCadUyKLLspOm1405YzSnvbP/Rj0H/PsToyHIA4xVmmqDvLqYJuaGXU0lZ9dzy
         aIfYMSI9iLeYpqOZesTFSh/ezaheHi9Bg0cuediu42xwcIF4hTHb58W+jjXRlIV7PPwE
         Qj/zijJTktNMqCJDlgzCt+zOyfPTmmjR0tWItELe7cVD4y5pTSrhadNxvOp05lnDXR6R
         IygaiNTe+VpuMGTZIJ9XW1jgNtCR/sTRTOiCnsZKzxVYe9NLsADV/1LabLXcTW+ceNGh
         qgsT5MsSqI5hitc1kQKaKvDJpI1rCGHh8qFE5GpDA2DSfDN7fvuVZWrTvVLVkQTV+y79
         ECNA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780390555; x=1780995355; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eE4L/6C1SnQ2KHeE4IgVGZ0YHQmUcuslD2AGGiKDkoc=;
        b=SVZEu+mzroUREdDnDpZGhh4h6KMMlXLMWKTb4tInlFl80ZoV8Ti+8bC5bh5EUPszaq
         h8FHwnblXwNSYcZvdfoCWsyppMuq5HbY2r/x7PMVnCLOKgDALz9dQp6pGNtU/Puc8nmY
         0C3go8NV+0W/JourjU0CDudpW+SzJkc/Y7c+2uP0iLBTmHhjYiHDWd9wf1JJcEiXLT7S
         sq1iUius4MoqZjfeGSf+/c30ufg/9R9COaF3apPm8tmnemH1t/PpAltiI3vllmJWMqT8
         gpjXZjQ5KuFUgR+9ELCYRAnguBBa4RgEdM/sMLLTiQifKtELjRpNo6yK9MPu9BzsVEbK
         9gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780390555; x=1780995355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE4L/6C1SnQ2KHeE4IgVGZ0YHQmUcuslD2AGGiKDkoc=;
        b=au0aHjlipRfKCoYINIgRQ3i6vJoST0hZzwKxlxWTLQXtnCOqy2oMJ3QXe23vWQDnxL
         fer1mVr7HTApSWsnN1OFupZdgJY8U/HtBAaSv6GU/dNH/gPZYRWx0IkPA0MGmP+N9BW+
         PsnhF+hr0x1dzG2YrI3Lfq5N0RcJSmJCZwbPct9zbdKorL23FW/Uk77cR3eDwbrfOu2v
         KEuji9Auk2ZxbP8FzLWD/75LhNF0UfBRYcMAAzC1gw1eya/RiRL1pbJMxDy0ydiuKiJ6
         53Ibs2Teoc+SKQ6URYgwqqMC2LMXfI0IUYDXwYCQPUVWD74/CV4umNZjDNi/19SUqMDq
         /XNw==
X-Gm-Message-State: AOJu0Yz7CqtFOjz2INFf7vgH/BtW9vg6hdavD8a+C8XHbqvv74CmKNL4
	RlI50djOLAmrB0wdsbK3cz6D0lAM2oqRi8DW/tKbDlK8Lesosoy+Ec3mp5Ufmqn5PgXHSZum2WZ
	VacYeC8raEEfPTas5fzItMtWvk+JO6DI=
X-Gm-Gg: Acq92OF3HmMOrUwlqr8bJ/M5MQ+TzqUbHjsCqgODfQTJF3kZsFvuLrOULi8Osyot8Sm
	ZpWYPy2+l6jxkWbCC0QF3KVvjH3oGnl2LMDVjCV07LNdY/Tg0hmRQ7+i5PD3azge2adYv/wJRR7
	FV75TzVJ4KgsMtnpacaH0AHQO5m00GXVG5Yb8CIq4p6CU5nHA0cCRgxppg5JNH4knbkABNo90bg
	L7lcXZ8iphTe+jcyfWIE/zkYZfkNHwvIoSWX7GL0W3mxNQXKDKjiaUs/g8ApXXZvrb4gxClA3xb
	BoWo4/GeMcewnKk6RNj3wIAKqMJUu2p8kGHdKYwvRmrnY5Rj7yWL4F5VcmxLcVucyKfL2fvaE14
	sFCMGiqfmk/suvqw2R9RpuRrEWTo6Zv7Bi8/p4fvD+ihCKHuGORSc4Ykzi1x77/TYHlipLpiKC5
	6vR/xCBuP04gvhCfHuZPptVXWro8rCDfZyupT7VhDor3CxCTfwm8zIhqXK10nbLPkVwn7ZFH7Cd
	zVzQcfx
X-Received: by 2002:a17:906:846d:b0:bec:2d7f:fe03 with SMTP id
 a640c23a62f3a-bec2d801603mr415681866b.17.1780390554853; Tue, 02 Jun 2026
 01:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260602080940.1053865-1-martin.jansa@gmail.com> <20260602080940.1053865-3-martin.jansa@gmail.com>
In-Reply-To: <20260602080940.1053865-3-martin.jansa@gmail.com>
From: Ernst Persson <ernstp@gmail.com>
Date: Tue, 2 Jun 2026 10:55:42 +0200
X-Gm-Features: AVHnY4JXgQ0DBdYBPFy3NdkVERSyQqTSXdkjeIMU_EhUMaFj56exffPcA-ubWLc
Message-ID: <CAD=4a=W5ctsBw=vt7SmGAS2MPhOs4fQMk_6dNiZpDExmjMuNSA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 3/3] python_setuptools_build_meta:
 clean the build directory in configure
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000009566a00653417a1b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 08:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238019

--0000000000009566a00653417a1b
Content-Type: text/plain; charset="UTF-8"

Tried the series out over here, LGTM! Checked that my buildhistory looks
good.

Den tis 2 juni 2026 kl 10:09 skrev Martin Jansa via lists.openembedded.org
<martin.jansa=gmail.com@lists.openembedded.org>:

> From: Ross Burton <ross.burton@arm.com>
>
> It's not currently possible to set the build tree to be somewhere we
> control, but we know it will always be in the build directory alongside
> the pyproject.toml so we can [cleandirs] that.
>
> MJ: this was later reverted in a532cb50151d773c1c351ffccf4d47a37f26f8aa:
>   This is not needed: setuptools.build_meta does the build under a new
>   temporary directory.
>
> but the builds in scarthgap aren't using new temporary directory yet,
> so this is still useful there:
>
> Just rebuilding python3-tqdm in the same TMPDIR after cherry-picking this:
>
> $ buildhistory-diff -p buildhistory build-minus-1 | grep PKGSIZE
> python3-tqdm/python3-tqdm: PKGSIZE changed from 3309408 to 426880 (-87%)
>
> $ wc -l
> python3-tqdm/4.66.3*/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD
>   297
> python3-tqdm/4.66.3-old/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD
>    41
> python3-tqdm/4.66.3/image/usr/lib/python3.12/site-packages/tqdm-4.66.3.dist-info/RECORD
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/classes-recipe/python_setuptools_build_meta.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass
> b/meta/classes-recipe/python_setuptools_build_meta.bbclass
> index 4c84d1e8d0..046b4ffb74 100644
> --- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
> +++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
> @@ -7,3 +7,7 @@
>  inherit setuptools3-base python_pep517
>
>  DEPENDS += "python3-setuptools-native python3-wheel-native"
> +
> +# This isn't nice, but is the best solutions to ensure clean builds for
> now.
> +# https://github.com/pypa/setuptools/issues/4732
> +do_configure[cleandirs] = "${PEP517_SOURCE_PATH}/build"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238016):
> https://lists.openembedded.org/g/openembedded-core/message/238016
> Mute This Topic: https://lists.openembedded.org/mt/119607862/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009566a00653417a1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Tried the series out over here, LGTM! Checked that my b=
uildhistory looks good.</div></div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">Den tis 2 juni 2026 kl 1=
0:09 skrev Martin Jansa via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.=
openembedded.org">gmail.com@lists.openembedded.org</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Ross Burton &lt;<a href=
=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&g=
t;<br>
<br>
It&#39;s not currently possible to set the build tree to be somewhere we<br=
>
control, but we know it will always be in the build directory alongside<br>
the pyproject.toml so we can [cleandirs] that.<br>
<br>
MJ: this was later reverted in a532cb50151d773c1c351ffccf4d47a37f26f8aa:<br=
>
=C2=A0 This is not needed: setuptools.build_meta does the build under a new=
<br>
=C2=A0 temporary directory.<br>
<br>
but the builds in scarthgap aren&#39;t using new temporary directory yet,<b=
r>
so this is still useful there:<br>
<br>
Just rebuilding python3-tqdm in the same TMPDIR after cherry-picking this:<=
br>
<br>
$ buildhistory-diff -p buildhistory build-minus-1 | grep PKGSIZE<br>
python3-tqdm/python3-tqdm: PKGSIZE changed from 3309408 to 426880 (-87%)<br=
>
<br>
$ wc -l python3-tqdm/4.66.3*/image/usr/lib/python3.12/site-packages/tqdm-4.=
66.3.dist-info/RECORD<br>
=C2=A0 297 python3-tqdm/4.66.3-old/image/usr/lib/python3.12/site-packages/t=
qdm-4.66.3.dist-info/RECORD<br>
=C2=A0 =C2=A041 python3-tqdm/4.66.3/image/usr/lib/python3.12/site-packages/=
tqdm-4.66.3.dist-info/RECORD<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-b=
riand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&=
gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/python_setuptools_build_meta.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/met=
a/classes-recipe/python_setuptools_build_meta.bbclass<br>
index 4c84d1e8d0..046b4ffb74 100644<br>
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass<br>
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass<br>
@@ -7,3 +7,7 @@<br>
=C2=A0inherit setuptools3-base python_pep517<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-native python3-wheel-native&quo=
t;<br>
+<br>
+# This isn&#39;t nice, but is the best solutions to ensure clean builds fo=
r now.<br>
+# <a href=3D"https://github.com/pypa/setuptools/issues/4732" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/pypa/setuptools/issues/4732</a><=
br>
+do_configure[cleandirs] =3D &quot;${PEP517_SOURCE_PATH}/build&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#238016): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/238016" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/238016</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119607862/494=
7266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119607862/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009566a00653417a1b--

