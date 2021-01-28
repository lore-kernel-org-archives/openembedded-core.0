Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web08.322.1611853675924045179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 09:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NWrm4SvG;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id q129so6332433iod.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 09:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MUZejXbiu8WLR51Daf+gJPVkeRwSxLuJ67hnC1VaYRU=;
        b=NWrm4SvGuNnL/Lg6PS/8c8aWcHgcq0j92KXcEJwW8UE3q2DrOPBx2eEuuxOaVzWNW1
         GzbLteppS+bN4jRFk0TR8O2v5NDHtzdCE3LSMj891hz44BxN56hafA9B1ZrtBLVaXNi6
         en5Sn4qSdx+9GHOzwyIr3uWIMyhnNvY92AaMOizzN6zxjkp9F8d6EH5BndQMzE69AV4U
         iz/slvcsFJAXbqeiu0xq41g9ypHnv7nvWj2baI49tBd6ht/XcOB9BDAFm7EhNB1FBbBp
         V5/yTOzQZl3DM7nEAcF9nkd3Pc28eIzA/gMmkYoLXL8i3Qqb4GNWLmr2c6L4JTCJQE93
         kMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MUZejXbiu8WLR51Daf+gJPVkeRwSxLuJ67hnC1VaYRU=;
        b=d3uN0tQRsPsedRPtJEDfqE0vmEbw8I84nIGpu7NMhuSdURFOwOdmVHmjDitad8uixt
         hxDWAiWv1eeGVTw0avB0mQSyWXFRH+HkmrDeoNCPLvahL1Yq6OmmtEP/d/OEpvGnUp3G
         F0G76ei0QVq3Sb3gmFgpERee8hT4pgKliUYRg0Z5QToKe4SepzGr0TNGOUFV4jdpS2pV
         AJV55GFn5kisaUcTfWodYoyq7QYmSkXiQqzjgWAYzmREZ9/s52Lf9Tm/yBhCq8CsuQ0s
         HfQ7hKqTJBPK/AH5HEuDoGKC8Gaeu/hHgqP50r8larwFnspHrSI8ClNCnOq043nLk+n5
         Z6YQ==
X-Gm-Message-State: AOAM530zKUJPfTPB7PP52JjnFR+ykJ5OaGiwd+BsmsPi+Vjuxmi+0meQ
	g/vWaLiRBzFzTzT+0TbL336hV0T3E+cX3RzgUjA=
X-Google-Smtp-Source: ABdhPJwWHPf2irT2U9lrd2GMaiH01Mao6zP/2n9U7RrATrhFbTM560JOu9KNY6+JZ80JhY5e+77bEx9Q1ncnLlzcYg0=
X-Received: by 2002:a05:6638:35a3:: with SMTP id v35mr277883jal.36.1611853675263;
 Thu, 28 Jan 2021 09:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20210128155534.7104-1-tomasz.dziendzielski@gmail.com>
 <224352e6-e15e-cace-6f8d-7a5bda5757b3@gmail.com> <165E7276DD8A1A13.32571@lists.openembedded.org>
In-Reply-To: <165E7276DD8A1A13.32571@lists.openembedded.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Thu, 28 Jan 2021 18:09:08 +0100
Message-ID: <CAJkqNs25uGE0puQX-sHyg=-tgtTua3TBXNwxyS4cch9CzvJdQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: Don't treat mc recipe (Midnight Commander) as a multiconfig target
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000be790205b9f8edb2"

--000000000000be790205b9f8edb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It seems that I don't need to modify showEnvironment() in lib/bb/cooker.py,
that is only used for "bitbake -e", and without changing this one line I
have both "devtool build mc" and "bitbake -e mc:foo" working correctly.
I compared the output of environment dump before and after my change and i=
t
was the same (with exception of hashes and timestamps).
I will submit a new patchset.

Best regards,
Tomasz Dziendzielski

czw., 28 sty 2021 o 17:33 Tomasz Dziendzielski via lists.openembedded.org
<tomasz.dziendzielski=3Dgmail.com@lists.openembedded.org> napisa=C5=82(a):

> >Hmm, this might be problematic, since "bitbake -e mc:foo" needs to keep
> working to dump the base environment for the "foo" multiconfig, and I th=
ink
> this patch will break that (although I didn't test it to verify)
>
> You're right. I just checked and with this patch "bitbake -e mc:foo"
> returns "ERROR: Nothing PROVIDES 'mc:foo'". I will try to find a solutio=
n
> to keep it working for the environment dump.
>
> Best regards,
> Tomasz Dziendzielski
>
>=20
>
>

--000000000000be790205b9f8edb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>It seems that I don&#39;t need to modify  showEn=
vironment() in lib/bb/cooker.py, that is only used for &quot;bitbake -e&quo=
t;, and without changing this one line I have both &quot;devtool build mc&q=
uot; and &quot;<span class=3D"gmail-im">bitbake -e mc:foo&quot; working cor=
rectly.<br></span></div><span class=3D"gmail-im">I compared the output of e=
nvironment dump before and after my change and it was the same (with except=
ion of hashes and timestamps).<br></span></div><div><span class=3D"gmail-im=
">I will submit a new patchset.</span></div><div><span class=3D"gmail-im"><=
br></span></div><div><span class=3D"gmail-im">Best regards,</span></div><di=
v><span class=3D"gmail-im">Tomasz Dziendzielski<br></span></div><div><span =
class=3D"gmail-im"></span></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">czw., 28 sty 2021 o 17:33=C2=A0Tomasz Dzien=
dzielski via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;tomasz.dziendzielski=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org">gmail.com@lists.openembedded.org</a>&gt; napisa=C5=82(a):<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
dir=3D"ltr"><div>&gt;Hmm, this might be problematic, since &quot;bitbake -e=
 mc:foo&quot; needs
      to keep working to dump the base environment for the &quot;foo&quot;
      multiconfig, and I think this patch will break that (although I
      didn&#39;t test it to verify)</div><div><br></div><div>You&#39;re ri=
ght. I just checked and with this patch &quot;bitbake -e mc:foo&quot; retur=
ns &quot;ERROR: Nothing PROVIDES &#39;mc:foo&#39;&quot;. I will try to find=
 a solution to keep it working for the environment dump.</div><div><br></di=
v><div>Best regards,</div><div>Tomasz Dziendzielski<br></div></div></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000be790205b9f8edb2--
