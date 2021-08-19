Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.66629.1629361779935985588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 01:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MAAOZGSc;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id x11so11306894ejv.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bia7KawZqhrGSkmD9WwMzjJOJjJd4PH7unnQTeYt26I=;
        b=MAAOZGSciO/dkmNoj7xQG458JieYBXgxgBDNcF7Tu6OOB1hPyqsM5Z0esYdhFDZKnO
         aAHYfLqTNBkID0So/GT4zfWFSNePsP+qAmaxPBzDJc038O95FFwriUSLC8S/5AiGDlWD
         M2hKNNbQj5e516m+p9udZ7v73uHM9VEPlco6OGle535JA7r3YJ20m0WwfoeIwTd5ukF1
         yEBoZl3RTkp4VK7sNOBsyG1x05plHonM7kjt/ApmW3lHWgNVKoujnwtZuok3Oq6lQqCS
         QvKaAZc28y8eALb5loAVgYLplS3ZGLMf0vl1Z12+YVyPB8Q1hQ3iS8NtRUhwHCdrWuDt
         pARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bia7KawZqhrGSkmD9WwMzjJOJjJd4PH7unnQTeYt26I=;
        b=UgvJtvhl5rmun/+PCSOQCjG7xyqijh9gPeHFg8zdnJOhTruljZnyrZcCefWfHbDWkH
         niXuxkd1nX6kNSvldPP6jIkKRB7vUCm3nYbtG66aIXrMYvY2TzBxRsw2Z5w+v/MAc4yj
         WeTqsfXbOOVWd63PKQrFbFqeDM1CTsK51xXHo+GdHR9irr259uUxp5Nz+vjvTlLy94iD
         OxAApk8HGAycVGv39oI08dAdvT0Z1Flm8GXhY1iOXgha9fMD5mr3O9MBld3UjS8v5xOs
         eAKDyzOrO+tX79Nuqh2SvyFe19xWVQsOjEFwXYZHQmf/RZkCWBQWY0w89mFmW+qHz8tB
         Gaaw==
X-Gm-Message-State: AOAM530QMB26lQfrdoYA9d1MXybg4My8Z9HtZNvyp88556s0mOYjvmR9
	evg4F2b+PNoSPtoAgNOCD0pG2k2/jXjHDYpX3wM=
X-Google-Smtp-Source: ABdhPJzLRyZXYe9wLsaNzLN0DwvT85CUlWZsFsePQL39MqbJiC8/q48tkDxaZB3VIfSODJcfCc1oLN/yeHnM6vtsFJQ=
X-Received: by 2002:a17:907:7883:: with SMTP id ku3mr14928781ejc.453.1629361778220;
 Thu, 19 Aug 2021 01:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <169CA5F083F04B64.9306@lists.openembedded.org>
In-Reply-To: <169CA5F083F04B64.9306@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 19 Aug 2021 09:29:27 +0100
Message-ID: <CANPvuR=gzSsaCjTp1sdOVfuq3qh+t27kGFVafktD5A-LqPJb0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] patch.bbclass: check if patchdir exist before appling the patch
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It only makes sense to check if the patchdir exists when it is
defined, fixed in V3

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
quinta, 19/08/2021 =C3=A0(s) 08:53:
>
> if the user specifies a relative path on 'patchdir' that don't exist,
> the patch will fail and there are no message that indicates the real caus=
e.
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/patch.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 559c6f45bd..4b38be7e3f 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -134,6 +134,9 @@ python patch_do_patch() {
>          else:
>              patchdir =3D s
>
> +        if not os.path.isdir(patchdir):
> +            bb.fatal("Patch source directory don't found '%s'" % patchdi=
r)
> +
>          if not patchdir in classes:
>              patchset =3D cls(patchdir, d)
>              resolver =3D rcls(patchset, oe_terminal)
> --
> 2.33.0
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
