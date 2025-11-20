Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36B5CF64A7
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 02:40:52 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24605.1763606448379178417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 18:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsmLEgb7;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78a712cfbc0so3949387b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 18:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763606447; x=1764211247; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qK2A5DD2uzmciEiwoPuO2hJNcbf0jOLz9DxaC58itwE=;
        b=NsmLEgb7WWXeaQidPlbsA00qr+nrs0URXsaHEzRJIuqdYmZWiEbmTwETqMNXfXEhg6
         kjWFnMIqUbf+IoSQXoUchSB+/JqqTqsf19Bls9FbJ6XGJikPjbn1WGoJzMB1558IgDYK
         2TSCMdpafzdrKHIPFCcXgoHQooykkS6ZX0OnUzpMKozTnC13kovAb8iIzs3wZ1C40I5D
         +8Zh2MO0azKTGPmWzZxNWOYB7NI+p5OsW+y8dxotI4gEGKT67rOJ/rKtnJxm2WFkwSV/
         87GPkNPyZ8HNVp1+y5UBP+nbi0G+QAbmie827WyJdQ2eHT4GnF/2L7x67jdFpishgJpg
         pwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763606447; x=1764211247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK2A5DD2uzmciEiwoPuO2hJNcbf0jOLz9DxaC58itwE=;
        b=oivfsZfwojQQ5hXpLceKXV/7HQWXBAZgn0vAnkp7ESWuYjpGyOQiPv6xcmsHuTEtCj
         ecaGNO2c/16XzT+mGdq4OSmTNyMLe0xo0V1e5AzXwbvmKuBam79iknGxiYmLMLop4iBk
         CFkienSPKoUlWFRPgR41Xh5iQQ9LmwncNNuUJvkRYbA0/eqaC1w3iDFNELwsE/tgqxLt
         1ul2E9FjVsc1M4kZhuwKvYspfYYuRMxL8OWHee/CgR7IMceTWLTUMVQC8QdM8d0/Tu2x
         68ZHcCxox2w42SQvQ8peD83PnZc2juHjeCtxKKt2K5CX4wmQxf2i+pStSjQ1OcQvZsmn
         TnUA==
X-Forwarded-Encrypted: i=1; AJvYcCVvy2kqPOnyyCOMIcrkxYrP0ngRAVMrMKwiPFvOhStvFYwCxv63S2TI2BQNhL5Cb6NU3vSuqgPwsOV93iBRgpC7Yw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxGPIDyMEQeUq9J/XTfT9KGsimWrT8ryPYPxY3Fu1Vku7uWRII
	oyPSK4dzYYDtmQoOBJ0+LxgcrH8j6l71sUey1zOL5+5Po4V3y8+FQzni0+6XLalS4t+BQZwAx9/
	rHy2O16VA4SiRbsRJXNQVsCxPHA1aEYg=
X-Gm-Gg: ASbGncvvLLDPE3+QQQiemv1K1hLsYEgQgdQvc9ac2TcZuZeXX7b5aFBjBfYnWc8d5wY
	a1UD+Y4s9ddEJuoVQq9YeOR45gvqvmXW2F7cdrfT8h91/AcKhRDRPSzuLHzdPM3+kdZBQvMaXQg
	NlGiUa39L1Mmzfr2XPSOEG1SKOezXLdeaNhGtFkih1ag/8fxP4B4QzERTh8nRGJdFtweF5HRmEE
	eWUZ+rUeO6KBGrLq3OVNyAaRxcnSoZ1LbNWuIHO05Ir5JiUf/2nX6T3gfzExTtdFSqGv2JddcRZ
	fL9XooL7XFG9obsJqA1M55be0XnWZ3aa4ShyawqMu0AS9R7YIBOf72xOnHkn1KI0BmO9silKJrL
	bGYn5boEkixdu2fFZ1asbl9jhABQ=
X-Google-Smtp-Source: AGHT+IFZWevFGdcBUbnRzwJvp0aCJGuemBjGw2jTDF4U7YtCBo5eZ9gVC9wT2wBK6YRp71Pa5W3zc7756BGabmAXaGk=
X-Received: by 2002:a05:690c:fc3:b0:788:f56:afa7 with SMTP id
 00721157ae682-78a7abecd12mr9540337b3.40.1763606447435; Wed, 19 Nov 2025
 18:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20251119101959.2603691-1-skandigraun@gmail.com>
 <e327cbe3-7980-4806-8a1e-69d3910d3eb4@gmail.com> <CAMKF1sr9jnTiyAAue6LeGWT5aGganW3zoSCKapGV_dCcrBL93A@mail.gmail.com>
 <331d9c70b2bd4a23790efae7726ac626656e4234.camel@linuxfoundation.org>
In-Reply-To: <331d9c70b2bd4a23790efae7726ac626656e4234.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Nov 2025 18:40:18 -0800
X-Gm-Features: AWmQ_bkW_kli4viAU3eEUz7TDR2bZC45M0qFoRKh606BYs6elarD61Q39OIVJjU
Message-ID: <CAMKF1sqh+kj7vtYHWREOXYPT6zUzR1fUsxxhKogqd4C4230Vcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add canon-prefix-map to DEBUG_PREFIX_MAP
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d2b32f0643fd9fe3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 02:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226602

--000000000000d2b32f0643fd9fe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 10:17=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2025-11-19 at 09:29 -0800, Khem Raj via lists.openembedded.org
> wrote:
> > On Wed, Nov 19, 2025 at 9:20=E2=80=AFAM Gyorgy Sarvari <skandigraun@gma=
il.com>
> wrote:
> > > Hmm, I just noticed that this flag wasn't omitted accidentally at all=
,
> > > but because clang doesn't support it.
> > >
> > > Please ignore this patch, will try to come up with some conditional
> > > patch or something like that.
> > >
> >
> >
> >
> > Right, the intention was to keep the DEBUG_PREFIX_MAP to be generic
> > and I was hoping that packages won't need -fcanon-prefix-map but that's
> > not the case. In any case I think we now have toolchain classes and the=
se
> > options are compiler specific so we could either move the whole
> > assignment out of bitbake.conf and into toolchain classes
> > or define addon variable in gcc.bbclass
> >
> > DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
> >
> > and prepend it to DEBUG_PREFIX_MAP in bitbake.conf
> >
> > That will allow it to be overridden cleanly in recipes if needed.
> >
> > Third option is to keep it as such and add
> >
> > DEBUG_PREFIX_MAP =3D+
> "-fcanon-prefix-map" meta/classes/toolchain/gcc.bbclass
> >
> > also keep in mind that this option is only available in gcc-13+
> > so DEBUG_PREFIX_MAP if used on native recipes might fail for hosts with
> > gcc < 13
> >
>
> There is an additional issue in rust too, e.g.:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2773
>
>
Right, as I noted above in my reply, ibuild host is running debian-12 and
the gcc version on debian-12 is GCC-12 which does not
have this option implemented. We need atleast gcc 13. Perhaps we should
follow option 2 or 3, that will address the provlem
surgically.


> Cheers,
>
> Richard
>

--000000000000d2b32f0643fd9fe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 19,=
 2025 at 10:17=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2025-11-1=
9 at 09:29 -0800, Khem Raj via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On Wed, Nov 19, 2025 at 9:20=E2=80=AFAM Gyorgy Sarvari &lt;<a href=3D"=
mailto:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&g=
t; wrote:<br>
&gt; &gt; Hmm, I just noticed that this flag wasn&#39;t omitted accidentall=
y at all,<br>
&gt; &gt; but because clang doesn&#39;t support it.<br>
&gt; &gt; <br>
&gt; &gt; Please ignore this patch, will try to come up with some condition=
al<br>
&gt; &gt; patch or something like that.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Right, the intention was to keep the DEBUG_PREFIX_MAP to be generic<br=
>
&gt; and I was hoping that packages won&#39;t=C2=A0need -fcanon-prefix-map =
but that&#39;s<br>
&gt; not the case. In any case I think we now have toolchain classes and th=
ese<br>
&gt; options are compiler specific=C2=A0so we could either move the whole<b=
r>
&gt; assignment out of bitbake.conf and into toolchain classes<br>
&gt; or define addon variable in gcc.bbclass<br>
&gt; <br>
&gt; DEBUG_PREFIX_MAP_EXTRA =3D &quot;-fcanon-prefix-map&quot;<br>
&gt; <br>
&gt; and prepend it to DEBUG_PREFIX_MAP in bitbake.conf<br>
&gt; <br>
&gt; That will allow it to be overridden=C2=A0cleanly in recipes if needed.=
<br>
&gt; <br>
&gt; Third option is to keep it as such and add<br>
&gt; <br>
&gt; DEBUG_PREFIX_MAP =3D+ &quot;-fcanon-prefix-map&quot;=C2=A0meta/classes=
/toolchain/gcc.bbclass<br>
&gt; <br>
&gt; also keep in mind that this option is only available in gcc-13+<br>
&gt; so DEBUG_PREFIX_MAP if used on native recipes might fail for hosts wit=
h<br>
&gt; gcc &lt; 13<br>
&gt; <br>
<br>
There is an additional issue in rust too, e.g.:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/buil=
ds/2773" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/22/builds/2773</a><br>
<br></blockquote><div><br></div><div>Right, as I noted above in my reply, i=
build host is running debian-12 and the gcc version on debian-12 is GCC-12 =
which does not</div><div>have this option implemented. We need atleast gcc =
13. Perhaps we should follow option 2 or 3, that will address the provlem</=
div><div>surgically.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000d2b32f0643fd9fe3--

