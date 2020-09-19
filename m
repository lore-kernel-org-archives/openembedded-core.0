Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.11098.1600521198263037417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2020 06:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HmVfvbxM;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id y15so8139792wmi.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2020 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YrkIKzzPQ1qgUIkBza+IcuL0PGWqYsPeShuNqpB3BdQ=;
        b=HmVfvbxMzOyWPCwwTHpmCpyGX0IhBB3anHcSisxjk0X+9G50Q3V5kMoy27RgWu44Cf
         F2EHaSxZJ4yzkjs9rx2wKlstjSAJLUcAXssyfVv6rwIpmRvT2eVDWs+u2NJsyXpdKNLX
         cDSC+VPLC/iFsJNUvab51Bw62eLs2HdxELD0gLUgMpU0lXjx59LGHtxh8iTatQg3T49m
         kjlgNRmiBgpmafLS0/gbFYoiiWXVjurY818mLCoXfNUuRs4e7AsU8b1oe/IaXkS83HpB
         uNdd4GuID9YB4r5du5oZcjXnALDhGet83ihF54fNhqmCRLN2UWLATBeVbF+b6eifDyzq
         GXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YrkIKzzPQ1qgUIkBza+IcuL0PGWqYsPeShuNqpB3BdQ=;
        b=gNmbej9dMHB8zrsLnDBy7MMkOYh9hJKo+d/3517K43wzaUY7hYAgjecJ0UE1ynzWPR
         6WmRcTAkSv0r8qAuIRfrvOAGKJiSMZXwawU5FWt5P/1/ULs85Yv0seNxh8ghMhT0S3cK
         CTAntauKV9M69gp8tJ7dasrV7z8pVXzhiS1xeP86MurczWR2qI3Z3Idi6XksBZezzWLE
         qhP4DpJf1xw422uaN1guPZt2SyKmuzJdCZEW7V0jqnzbrlh0/mSN9Vcij9Bq/7flULni
         XafT9bxTQ0caRqAWPIUWs2/vLbmpGYhik7Qzygt4l3ThXkFndOUbq0qZFBTRW005PhYz
         pX+w==
X-Gm-Message-State: AOAM532XY23F7Ixosrn7Vg5KfLHPqI3RQh/Vx8eApza9/LLKt8GNtPGy
	uYkY5HJghqKtsj6GmLheC7LUGSYyfjiPXNaD41E=
X-Google-Smtp-Source: ABdhPJwDF/Ij0gTNzI31V1BVoTI7z6mEqZf0T6PPJdNiSPmq7J5npUM4OI6pXS3g6PtPfn31VfWqcEQlKAthTIpgt5Q=
X-Received: by 2002:a1c:bad5:: with SMTP id k204mr21285135wmf.111.1600521196653;
 Sat, 19 Sep 2020 06:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200919001608.1241434-1-raj.khem@gmail.com>
In-Reply-To: <20200919001608.1241434-1-raj.khem@gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Sat, 19 Sep 2020 08:13:07 -0500
Message-ID: <CAJdd5GYZ2yfjLLPrYwNjBrmV_Bvbi9U51NPFk+uW3-stVG8-BA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Disable support for shadow group
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000061d06705afaa618a"

--00000000000061d06705afaa618a
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 18, 2020, 7:16 PM Khem Raj <raj.khem@gmail.com> wrote:

> enabling shadow drags sshd key generation service into boot path and
> serial console launch over getty gets delayed until ssh key generation
> is done, on slowers platforms eg. non-kvm qemu this can take minutes to
> get ssh keys service to finish on first boot.
>

Hmm, I don't recall this being the case, particularly after we reniced ssh
key generation, but maybe I need to try again


> On qemumips
> 56.963s sshdgenkeys.service
>
> Disabling shadow, pulls this out of boot chain, and ssh keys are still
> generated but this time it will happen when ssh'ing first time into the
> machine.
>
> [YOCTO #13646]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_246.2.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_246.2.bb
> b/meta/recipes-core/systemd/systemd_246.2.bb
> index af10e4212b..e3a7cd4971 100644
> --- a/meta/recipes-core/systemd/systemd_246.2.bb
> +++ b/meta/recipes-core/systemd/systemd_246.2.bb
> @@ -66,7 +66,6 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>      backlight \
>      binfmt \
> -    gshadow \
>      hibernate \
>      hostnamed \
>      idn \
> --
> 2.28.0
>
>
> 
>
>

--00000000000061d06705afaa618a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Sep 18, 2020, 7:16 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">enabling sha=
dow drags sshd key generation service into boot path and<br>
serial console launch over getty gets delayed until ssh key generation<br>
is done, on slowers platforms eg. non-kvm qemu this can take minutes to<br=
>
get ssh keys service to finish on first boot.<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Hmm, I don&#39;t recall this =
being the case, particularly after we reniced ssh key generation, but maybe=
 I need to try again</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
On qemumips<br>
56.963s sshdgenkeys.service<br>
<br>
Disabling shadow, pulls this out of boot chain, and ssh keys are still<br>
generated but this time it will happen when ssh&#39;ing first time into th=
e<br>
machine.<br>
<br>
[YOCTO #13646]<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_246.2.bb" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">systemd_246.2.bb</a> |=
 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_246.2.bb"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">systemd_246.2.b=
b</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd_246.2.bb" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">systemd_246.2.bb</=
a><br>
index af10e4212b..e3a7cd4971 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_246.2.bb" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">systemd_246.2.bb</a><b=
r>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_246.2.bb" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">systemd_246.2.bb</a><b=
r>
@@ -66,7 +66,6 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x=
11&#39;, &#39;xkbcommon&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0backlight \<br>
=C2=A0 =C2=A0 =C2=A0binfmt \<br>
-=C2=A0 =C2=A0 gshadow \<br>
=C2=A0 =C2=A0 =C2=A0hibernate \<br>
=C2=A0 =C2=A0 =C2=A0hostnamed \<br>
=C2=A0 =C2=A0 =C2=A0idn \<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000061d06705afaa618a--
