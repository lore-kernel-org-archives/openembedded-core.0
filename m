Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC49C71135
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 23:37:20 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.800.1749685031205644206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 16:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=S21mAVal;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.173, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e4043c5b7so3024717b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 16:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749685030; x=1750289830; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fW9MZeQgDhJfpkD53mlUCX2m4wcECFtyQ1AP6fe/DZ8=;
        b=S21mAVal/E/M6qhKktFNhbg6hh0+7mGVRXzDjvXuitcElb2TY9RlVhtMlI9LrXO4ZP
         LbNdx3879m6oMCYgqQX8pMAR2rosnVBI1vYPdI99CeC1NHWhjFldt6Dl0y87cBbqmOoO
         L2TzpTLpREZOjgLTVbfDrQ+cxRbA8alcCIlHFGfUYnqLPoFyN56zMD24Nz6tCsG0vIHa
         to27127GJsAFZKi0DOKRf2rpjBFAWcEqPblwOr6mwpVnxBOnuhQgDD5LqNUxxEpT3oPJ
         uPlAu4dkOgH/qsOAmXeDW/dDXy1Ikomv4cf50z+I+tSoRm9x1kDAYRz4f+mj3stc36NN
         +8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685030; x=1750289830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fW9MZeQgDhJfpkD53mlUCX2m4wcECFtyQ1AP6fe/DZ8=;
        b=lLkHXyWlN2Tt5CmKgCQc3+0uCWSBDEiN8F8RxhQqte1Y/lR9QqUgQzgzDLlRy+W7Ys
         8aOw+cKqO+9WWpETuS3nBDlofBC8eqE2fsQZvtHe6H3cYvnSUTs3LwExp3AxUq+Fm8WK
         rq/BnIRVgTgNGMi7eQ2jhpy9hXM5XcZvIXCxTmKAMii/MbntbvuHvi1ZOJQiSi0SpPye
         gFiwjZqFpJcNmpe60woaoUgJgERs9QF0XSf2p5r0PfHHBxlevLvuUowIlc5rARtK3iiR
         Ad34I6gTbNLvWsQKWSAmcWiAY+Tv2g+yw30fs0anZn658G+8boeO4coPlvmZFvJV7EIi
         hoSg==
X-Gm-Message-State: AOJu0YzamIYc4t05Opcu0+H9k+Sm5gUX1ets6ISi/cZsGSbEIW4TblrG
	vIfS5ZtJ7ttlfLzHZaVQpTiGnxas8MU2JPltdqD8c5ll2fo7TsWcSmW3h8jRbfbFZ21dUBTsnPT
	7pFEZoTPf+EmCDV7XOvSDaG6EWflL/Iu4IdFkP34tbnD3cUHmS+bgozU=
X-Gm-Gg: ASbGncublLAcVXWopD94es3+kQPsmGLJju5a/dkPmKNIH0y/NJLiXDH55skgdNW6AeU
	gF9aF6WqbvouCkwrDqDqaNKbe8vev3jVoL7IwoEIWYTE1zvotYsvYDXHRwEgqaFifwyK2ZuHLlX
	/DnItn7OIVypLDYf9iusBXZGYAIV2vBpfIsyWkUn1iCv3IAg==
X-Google-Smtp-Source: AGHT+IFsHR+lBXdmnOmikRbRKQdejn8aVEFr5WnWWeZSMqPjnhZYfEmB7ZGXBqWO9ticUNBzHS/osVfBQz5h6ib+RGA=
X-Received: by 2002:a05:690c:b1e:b0:710:e966:bf96 with SMTP id
 00721157ae682-71150ba3087mr16422207b3.27.1749685030297; Wed, 11 Jun 2025
 16:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250611153319.54778-1-anibal@limonsoftware.com> <20250611153319.54778-3-anibal@limonsoftware.com>
In-Reply-To: <20250611153319.54778-3-anibal@limonsoftware.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Wed, 11 Jun 2025 17:36:59 -0600
X-Gm-Features: AX0GCFteAkjQWZUu8bfgSo2pTESYa6sV3YYz5i-ipDbckA4p8h0HwONRTqbBmfw
Message-ID: <CAOU5ZMs1DZM-3-h=_5-9m7nqFuU7i4VwH6ZcbzAwD2uByNt3=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] wic: plugins source bootimage/isoimage rename to have
 valid indentifier
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, Ross.Burton@arm.com, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="000000000000b330f40637544a44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 23:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218473

--000000000000b330f40637544a44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch is the previous one, only sent to note is part of the series and
can
be integrated later after layers fix plugin filenames.

Cheers!,
Anibal

On Wed, Jun 11, 2025 at 9:33=E2=80=AFAM Anibal Limon <anibal@limonsoftware.=
com>
wrote:

> Python has rules on valid identifiers and not support modules with '-'
> on the filename, change to '_';
>
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---
>  .../source/{bootimg-biosplusefi.py =3D> bootimg_biosplusefi.py}     | 0
>  scripts/lib/wic/plugins/source/{bootimg-efi.py =3D> bootimg_efi.py} | 0
>  .../plugins/source/{bootimg-partition.py =3D> bootimg_partition.py} | 0
>  .../wic/plugins/source/{bootimg-pcbios.py =3D> bootimg_pcbios.py}   | 0
>  .../source/{isoimage-isohybrid.py =3D> isoimage_isohybrid.py}       | 0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py =3D>
> bootimg_biosplusefi.py} (100%)
>  rename scripts/lib/wic/plugins/source/{bootimg-efi.py =3D> bootimg_efi.p=
y}
> (100%)
>  rename scripts/lib/wic/plugins/source/{bootimg-partition.py =3D>
> bootimg_partition.py} (100%)
>  rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py =3D>
> bootimg_pcbios.py} (100%)
>  rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py =3D>
> isoimage_isohybrid.py} (100%)
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
> b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
> rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py
> b/scripts/lib/wic/plugins/source/bootimg_efi.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/bootimg-efi.py
> rename to scripts/lib/wic/plugins/source/bootimg_efi.py
> diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py
> b/scripts/lib/wic/plugins/source/bootimg_partition.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/bootimg-partition.py
> rename to scripts/lib/wic/plugins/source/bootimg_partition.py
> diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py
> rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py
> diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> --
> 2.39.5
>
>

--000000000000b330f40637544a44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch is the previous one, only sent to note is part =
of the series and can<div>be integrated later after layers fix plugin filen=
ames.</div><div><br></div><div>Cheers!,</div><div>Anibal</div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Jun 11, 2025 at 9:33=E2=80=AFAM Anibal Limon &lt;<a href=
=3D"mailto:anibal@limonsoftware.com">anibal@limonsoftware.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Python has rul=
es on valid identifiers and not support modules with &#39;-&#39;<br>
on the filename, change to &#39;_&#39;;<br>
<br>
Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware.com"=
 target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
---<br>
=C2=A0.../source/{bootimg-biosplusefi.py =3D&gt; bootimg_biosplusefi.py}=C2=
=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0scripts/lib/wic/plugins/source/{bootimg-efi.py =3D&gt; bootimg_efi.py=
} | 0<br>
=C2=A0.../plugins/source/{bootimg-partition.py =3D&gt; bootimg_partition.py=
} | 0<br>
=C2=A0.../wic/plugins/source/{bootimg-pcbios.py =3D&gt; bootimg_pcbios.py}=
=C2=A0 =C2=A0| 0<br>
=C2=A0.../source/{isoimage-isohybrid.py =3D&gt; isoimage_isohybrid.py}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A05 files changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py =3D&gt;=
 bootimg_biosplusefi.py} (100%)<br>
=C2=A0rename scripts/lib/wic/plugins/source/{bootimg-efi.py =3D&gt; bootimg=
_efi.py} (100%)<br>
=C2=A0rename scripts/lib/wic/plugins/source/{bootimg-partition.py =3D&gt; b=
ootimg_partition.py} (100%)<br>
=C2=A0rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py =3D&gt; boot=
img_pcbios.py} (100%)<br>
=C2=A0rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py =3D&gt; =
isoimage_isohybrid.py} (100%)<br>
<br>
diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/script=
s/lib/wic/plugins/source/bootimg_biosplusefi.py<br>
similarity index 100%<br>
rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py<br>
rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py<br>
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wi=
c/plugins/source/bootimg_efi.py<br>
similarity index 100%<br>
rename from scripts/lib/wic/plugins/source/bootimg-efi.py<br>
rename to scripts/lib/wic/plugins/source/bootimg_efi.py<br>
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/=
lib/wic/plugins/source/bootimg_partition.py<br>
similarity index 100%<br>
rename from scripts/lib/wic/plugins/source/bootimg-partition.py<br>
rename to scripts/lib/wic/plugins/source/bootimg_partition.py<br>
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib=
/wic/plugins/source/bootimg_pcbios.py<br>
similarity index 100%<br>
rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py<br>
rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts=
/lib/wic/plugins/source/isoimage_isohybrid.py<br>
similarity index 100%<br>
rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py<br>
rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div>

--000000000000b330f40637544a44--

