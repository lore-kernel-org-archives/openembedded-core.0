Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.3700.1627679782013884093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 14:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S0aKJ+f1;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id n2so14972887eda.10
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 14:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d8xmMx8tH8rLKcKZ5ZH4j0MGEIGDaOuWLxgOLZDLhMQ=;
        b=S0aKJ+f1Be+9DKnqAC08h72jIDCkAUI6sbIot6CLFZ4zpFTLQl/35j26M/15V3NrU8
         w4Y7O+EnULUrjRsd7Yk9kGBHFNMGTIeMDWLUsQ4eoH+fz2M3dZ+SQhQr09rmQwqZCowf
         f4AZKJ+XJuzJlTmy/6BMfwMEieSNbT+O2xys/917x//L3ktJdDpJzBxMRwwuOf3pg9sl
         q8oEMcO3LiArFnNfg+VYS4iyp6TlKv/3sHFs4BnMcskAqX0tM/3nf19sGjLTx2XnHRjW
         9CK+bQ1Z/HHlCdHZ5n68OZV1Vuv3/bCR8jW+0HTbuMMwLixQwJbz/Lswnx5xQIQ47bNv
         sU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d8xmMx8tH8rLKcKZ5ZH4j0MGEIGDaOuWLxgOLZDLhMQ=;
        b=GcBZJiAvOvTKdVSsU2vC86zY7lyE914VJF8T+gTtdMvn6+FXZ92EQ2PzuxuTZi/Yzc
         eO8GQhvRfpTZ8l+xogRysf9XQDpn83dkqlw5L89dlffTsqtCaa7sjMw3Xmly4wfKum+4
         BdkPnkev8I2Fpo8A+y8ZH0wOXMAJ8yAZp7YOI94l/DID0wIwjlQE4FNDkAFqb+KPoh8l
         CdczCOuP6QywAVXmbTBB4dOeAU4yRhSOaFMsuwt2TwJodKEptByA4isvYf4KTa0JEVm8
         ExNV7KTuRSWVHy3ccc2kOwsgMZR2pnqATo9/lK/TUghx/EiwJbnNNnuZUKmdEM7W0aHN
         asJg==
X-Gm-Message-State: AOAM5333WUMpXXitubkJ3y3HgHBljlyIzhLgEk2JLV2RmO+DafS8VfL3
	Z+Ar3gBFGwIK2muYm7hEttZ/PkC291CDax6nHqQ=
X-Google-Smtp-Source: ABdhPJwEbvX0nPaqH5lPRRM9GSfqMestEJGKCCgWcqZnGTux8N7hFMLEJbbwTNLD9INCbjmaaUFU0kZ9VBs+DkUFQgk=
X-Received: by 2002:a05:6402:49a:: with SMTP id k26mr5345640edv.279.1627679780537;
 Fri, 30 Jul 2021 14:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210730190357.369782-1-bkylerussell@gmail.com>
In-Reply-To: <20210730190357.369782-1-bkylerussell@gmail.com>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Fri, 30 Jul 2021 14:16:09 -0700
Message-ID: <CABcZANk3YS-mnR8d0ScZA3E4coCa5Zze0UAueJxQjpwO1L1x6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-runtime: do_check should execute before do_build
To: bkylerussell@gmail.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000020887e05c85dbbb9"

--00000000000020887e05c85dbbb9
Content-Type: text/plain; charset="UTF-8"

This will result in a behavior change, making it so `bitbake gcc-runtime`
will run the check task. Are there implications to this?

On Fri, Jul 30, 2021 at 12:04 PM <bkylerussell@gmail.com> wrote:

> Otherwise, when rm_work is used, do_check may not execute before rm_work
> causing do_check failures if the workdir has been removed underneath it.
>
> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 59d9a24686..607971adca 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -314,5 +314,5 @@ do_check() {
>
>      oe_runmake -i ${MAKE_CHECK_TARGETS}
> RUNTESTFLAGS="${MAKE_CHECK_RUNTESTFLAGS}"
>  }
> -addtask check after do_compile do_populate_sysroot
> +addtask check after do_compile do_populate_sysroot before do_build
>
> --
> 2.25.1
>
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000020887e05c85dbbb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This will result in a behavior change, making it so `bitba=
ke gcc-runtime` will run the check task. Are there implications to this?</d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, Jul 30, 2021 at 12:04 PM &lt;<a href=3D"mailto:bkylerussell@gmail.com"=
>bkylerussell@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Otherwise, when rm_work is used, do_check may not ex=
ecute before rm_work<br>
causing do_check failures if the workdir has been removed underneath it.<b=
r>
<br>
Signed-off-by: Kyle Russell &lt;<a href=3D"mailto:bkylerussell@gmail.com" =
target=3D"_blank">bkylerussell@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devt=
ools/gcc/gcc-runtime.inc<br>
index 59d9a24686..607971adca 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
@@ -314,5 +314,5 @@ do_check() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake -i ${MAKE_CHECK_TARGETS} RUNTESTFLAGS=3D&qu=
ot;${MAKE_CHECK_RUNTESTFLAGS}&quot;<br>
=C2=A0}<br>
-addtask check after do_compile do_populate_sysroot<br>
+addtask check after do_compile do_populate_sysroot before do_build<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--00000000000020887e05c85dbbb9--
