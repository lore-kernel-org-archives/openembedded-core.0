Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.8591.1603364378099203678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 03:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HXTq6qsT;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id p5so1650102ejj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iNRPQJN9LH6BcKl867oYx7RItC9OPkDruBP612zB6tY=;
        b=HXTq6qsTEoqHtmGHc7kdrJ/iXbZ70yBMrBKyf+HpEq2achDONj6mrt6x+aYaZUwPpm
         7ipyb/+3X/5uvyypN9OjmK4yA5NoO5ZO5rAQdet7f4Oi977McS3DtEIaAfgGik4p3Lfz
         tFrZhnWznlfs+dc+eHYkKNOOFTfyPQ1H0PowTDlHz80giYSJN//7Eqbk60E6nhnFeni6
         L5UsmsI018TIhyTBMX8vz6Bg9Dq4MHFZKkMLkXi6pnQiiVW96WLlCyIkAV7xrZ4fNtDn
         ZeSgZ3gNJlIz38XKG/97SNNbaaAu1/MlA10bkDH1nI+pa42s0aIMrPj9OW7FQ77RlkAB
         p09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iNRPQJN9LH6BcKl867oYx7RItC9OPkDruBP612zB6tY=;
        b=lkl6JpwFjfXjDPzhht+FtDO8vUKuUQqUWEsOTN1VMCosojBJRqL3LJnrQlV6DhXG7K
         HNtS1lR1LL93ZQtArguD26KfHIEP2oO64mMmMFLSZAXz4Ka6QYnESrd8tY6+igWcHRK/
         PCyPjLsf5X7/wQJ3Pq74bkfbPl1UUDp52LIgp+DV9WnUVKxeXSGmVH8uLIdAkD6qUnYr
         myb23H/1udIonGXMT9P4sV7TJUORdOOiz5JFp/jocydM5kbU0Hk9lTRyhp18ValfUt+J
         e1IhWOM+yOj/f5/LWTw62fClNKwyz1/2QTBeE7kKH6Ow6Yx9SJMLPQwEDPuXNs/i6C4n
         s20A==
X-Gm-Message-State: AOAM533qvvVa4dHR+2pBeqfaltBkHL0AzrVU2qtZ97tiQmbhAEb/IBJt
	jtP2tOzwaeKuMGAPNnd7hpieUCT38eIxVXJQkkw=
X-Google-Smtp-Source: ABdhPJysYrjx9FRk5cpxQiYjpNpyUG450utKU7Ovp2+hS9xen8TMwoKwERaUSihk9kuIznq8nIJPt88wEZyumBenSYc=
X-Received: by 2002:a17:906:ca54:: with SMTP id jx20mr1717186ejb.541.1603364376287;
 Thu, 22 Oct 2020 03:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602771116.git.steve@sakoman.com> <163E30094343B958.12811@lists.openembedded.org>
 <CAOSpxdbZ9yKWyLkALJctu5BCP77AX=PSNWuBffNa8snxMOEgjw@mail.gmail.com> <c4b7539b1a57fb2b32bb68345aaaa8b807a7349d.camel@linuxfoundation.org>
In-Reply-To: <c4b7539b1a57fb2b32bb68345aaaa8b807a7349d.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 22 Oct 2020 12:59:25 +0200
Message-ID: <CA+chaQdavEx8SgVLX2iVGKtHLJ3bYv2+g-vDxATTi6rP3mg4pw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 1/8] Revert "package: get_package_mapping: avoid dependency mapping if renamed package provides original name"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000181e8405b2405c75"

--000000000000181e8405b2405c75
Content-Type: text/plain; charset="UTF-8"

Looks like it's caused by wireguard setting PKG variable as:
PKG_${PN} = "kernel-module-${MODULE_NAME}-${KERNEL_VERSION}"

as discussed in:
https://github.com/openembedded/meta-openembedded/issues/285#issuecomment-714401682

it was added in
https://git.openembedded.org/meta-openembedded/commit/?id=ad0db129c7c8484520cd20cdfbb4670489125280
but the explanation there doesn't make much sense to me.

On Sat, Oct 17, 2020 at 9:55 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2020-10-16 at 04:34 -1000, Steve Sakoman wrote:
> > I've included this revert patch for comment because I have gotten
> > several requests to revert and I'd like wider discussion of the
> > issue.
> >
> > At the moment wireguard is the only known recipe that is failing and
> > there are no proposed fixes.
> >
> > If you are aware of recipes in other layers that are affected, please
> > let me know.
> >
> > And if someone would like to tackle fixing wireguard in
> > meta-openembedded that would be much preferred to a revert.
>
> It would also be good to know if the issue exists on master or not. I'm
> worried we may have the issue there as well which is a reason I'd
> favour looking into and understanding this rather than blindly
> reverting. I've not seen anyone have a full understanding of what the
> issue is as yet.
>
> Cheers,
>
> Richard
>
>
>
>
> 
>
>

--000000000000181e8405b2405c75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like it&#39;s caused by wireguard setting PKG variab=
le as:<div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,Bli=
nkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">PKG_${PN} =3D=
 &quot;kernel-module-${MODULE_NAME}-${KERNEL_VERSION}&quot;</span></div><di=
v><font color=3D"#24292e" face=3D"-apple-system, BlinkMacSystemFont, Segoe =
UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji"><span =
style=3D"font-size:14px"><br></span></font></div><div><font color=3D"#24292=
e" face=3D"-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, s=
ans-serif, Apple Color Emoji, Segoe UI Emoji"><span style=3D"font-size:14px=
">as discussed in:<br></span></font><div><a href=3D"https://github.com/open=
embedded/meta-openembedded/issues/285#issuecomment-714401682">https://githu=
b.com/openembedded/meta-openembedded/issues/285#issuecomment-714401682</a><=
br></div></div><div><br></div><div>it was added in</div><div><a href=3D"htt=
ps://git.openembedded.org/meta-openembedded/commit/?id=3Dad0db129c7c8484520=
cd20cdfbb4670489125280">https://git.openembedded.org/meta-openembedded/comm=
it/?id=3Dad0db129c7c8484520cd20cdfbb4670489125280</a><br></div><div>but the=
 explanation there doesn&#39;t make much sense to me.</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 17, =
2020 at 9:55 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2020-10-16 at 04:34=
 -1000, Steve Sakoman wrote:<br>
&gt; I&#39;ve included this revert patch for comment because I have gotten=
<br>
&gt; several requests to revert and I&#39;d like wider discussion of the<b=
r>
&gt; issue.<br>
&gt; <br>
&gt; At the moment wireguard is the only known recipe that is failing and<=
br>
&gt; there are no proposed fixes.<br>
&gt; <br>
&gt; If you are aware of recipes in other layers that are affected, please=
<br>
&gt; let me know.<br>
&gt; <br>
&gt; And if someone would like to tackle fixing wireguard in<br>
&gt; meta-openembedded that would be much preferred to a revert.<br>
<br>
It would also be good to know if the issue exists on master or not. I&#39;=
m<br>
worried we may have the issue there as well which is a reason I&#39;d<br>
favour looking into and understanding this rather than blindly<br>
reverting. I&#39;ve not seen anyone have a full understanding of what the<=
br>
issue is as yet.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000181e8405b2405c75--
