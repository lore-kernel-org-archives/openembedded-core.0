Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.3593.1625560904303527032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 01:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UvPp4UEj;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id g14so9387014qvo.7
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q2ozJlIR8TnDkF0HWVE2IOtLhGKeGRoMlrKOex2KnIw=;
        b=UvPp4UEjOCOhCIZwqX+viGbsqoqVb9sB5xItTr96DAen2qsPOUzmKhtwH+vrbKPtMA
         P2MXh/FON7ufW4rdICsvJlfT+xbXt/BZ8enzNjbefP1FJnuVF8IZ705Tcmpp21YZBVgN
         zFjJzygqX+A9F93Ur1+FO3bpIQkw+69Cc8nFM6sKNixvDI1JiJWzRUsCvjk8BLnipFP7
         Xp37w1Dd60FLNygdkDi6TgAJ+CkIb4BOWuFZnR4A/nO/iFitItdgUxGvKfKlDszgECOw
         Oq4zN1PRjt8yhIs9tRiMD/3kQsBgvipYM2VFTDKw0HOL5V4PjmxcShzCeN4x++zmCkkO
         Ym/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q2ozJlIR8TnDkF0HWVE2IOtLhGKeGRoMlrKOex2KnIw=;
        b=tBKj9zheGbDhr38AbrzyKlFkRNDg8RavQWutz/SYmMKAf5bceaIFMry7yt3g1/QIIV
         pgWbZ3iK2bobAfxop0yDnqPegmm0JuPT5eTJV8oT6Ai/kjujZSRQAER/CRxuS6VYMDZg
         hEMOpY2rBcxN/9d/0Wlxtcr5ZXY0trjFyegaecgyVhGESAseqJDeuNYN8szCnJ6xZjo3
         yzgN08rAwZp7nre+qATbNgguJDma1ix+pYvwQnrQ80T9/MjUedBLQRh75sLC03xGLHZL
         prabumgeWtwuZnSfhwHGGXLu5yblpPp6FIJFQYcUlz8QWNx4P3YySed8ZS4Y0ggldUGE
         XJNA==
X-Gm-Message-State: AOAM530sb6ZiTQK8tm1k+eo7vz7mBfzZuEgP4vdMJAXNClhoLe/MLc7e
	QrBFb3juby4Mwz9HEoQV2MdQVhy5P2fj9g5m7/A=
X-Google-Smtp-Source: ABdhPJzD0XHYXlwo0Y1DCeo4i4Oc7+yV9tkv5akQhFWKvaS2CxJ4zPFnM/AWf71yVbGTmSGvjeruZmP84OLYOPEiyYI=
X-Received: by 2002:a05:6214:1244:: with SMTP id q4mr17232880qvv.50.1625560903125;
 Tue, 06 Jul 2021 01:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625511812.git.steve@sakoman.com> <e8d6eda3435226a11f8f31ac1767892c42593a73.1625511812.git.steve@sakoman.com>
 <CA+chaQeDf-ejU-XxZggWWTQnm-oFAC34mnZBgGZh_DOkwvNQ5A@mail.gmail.com>
In-Reply-To: <CA+chaQeDf-ejU-XxZggWWTQnm-oFAC34mnZBgGZh_DOkwvNQ5A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Jul 2021 01:41:17 -0700
Message-ID: <CAMKF1soz8W1Agk7FeR8w4A5gjfsZHvohy0FcuQD8sjJJmWzy+A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 13/19] pypi: set SRC_URI with _prepend, not with +=
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 6, 2021 at 1:31 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Is this one worth backporting? It breaks some recipes in other layers (e=
.g. podman-compose in meta-virtualization http://git.yoctoproject.org/cgit/=
cgit.cgi/meta-virtualization/commit/?id=3D92f976404b7f82c97996ffce94ca2d20b=
e2dcbda) and it's only fixing issue with devtool which imho isn't so import=
ant in dunfell compared to master.

I guess it perhaps isnt bad if we can coordinate meta-virtualization
fix along with it. but there is a chance that it might break some
internal cases for users which we can't control

>
> Regards,
>
> On Tue, Jul 6, 2021 at 12:36 AM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>
>> This did not cause problems in builds, but broke some devtool
>> workflows such as version upgrades or checking the latest version
>> from upstream. Tarballs should come first, not the patches.
>>
>> (From OE-Core rev: 5cee50c25197102658e0689f635b2d567a375471)
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> (cherry picked from commit 8f17b8bce85efb0e9a7e15d0b98a5cf7b6bd9750)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/classes/pypi.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
>> index 87b4c85fc0..384a209874 100644
>> --- a/meta/classes/pypi.bbclass
>> +++ b/meta/classes/pypi.bbclass
>> @@ -19,7 +19,7 @@ PYPI_SRC_URI ?=3D "${@pypi_src_uri(d)}"
>>
>>  HOMEPAGE ?=3D "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
>>  SECTION =3D "devel/python"
>> -SRC_URI +=3D "${PYPI_SRC_URI}"
>> +SRC_URI_prepend =3D "${PYPI_SRC_URI} "
>>  S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>>
>>  UPSTREAM_CHECK_URI ?=3D "https://pypi.org/project/${PYPI_PACKAGE}/"
>> --
>> 2.25.1
>>
>>
>>
>>
>
>=20
>
