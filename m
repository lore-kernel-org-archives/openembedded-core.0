Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA213CD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 21:40:36 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8395.1779140431392230805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 14:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KM43NDyI;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-448528f4e69so1834200f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 14:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779140430; cv=none;
        d=google.com; s=arc-20240605;
        b=iZdPawyfE3s7iMEAYDrHXvETvk/aFR3Ve3S++SEFwQwg6CMmp3EbXMyOSZFY/vDxZg
         rVp+I62ob8h5BD6udLLnuQhhonYzPTOuM1GlQh8ETm8Ad4VNc6fuqfuIUHYYNU3rl8XA
         M40Eo+adFaz8/YialO7v8wCAFcC/WWAMsL7rXVlBl33UN75P+A058aB3sMSrnRwKfgLe
         DQK8K1KsnhSQiwGPW9vXSlw5Bau6oFpxC0c4jdfQgY5n0G92KCDU/VoAOUK5TmQene4o
         vpfh1HkspgZKOmXHWLwGDQOTUJbAADOGJdULM9cOk6+qfbWyAi12he81qm6jQX6Wv16r
         bttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=APtfilTyxJ//E3ZOZF8+Qh3sz4Mo+/++kuI14GIkZvg=;
        fh=QxFLePuMzrsmPFCnKhradZcPB2JLq0Oz9Jogm4zj3UQ=;
        b=DravIGzTsJdhWjKDx9Xoufbf1AROaALR9VsZq8HjPzEWqGsbdlwQheOS2u0zroJ3V5
         u+xH525N48r4+XGDKQNFx65UT5pu94xRy9cKsWdjVz4zVfeYUcmDKKfnKhYKs+3K5XRp
         DkzyWfrqqbcdK4hrKASxL+63EqhslgvGiLbR5X7KKavep2IPe2qA3blqBrplT3LDkWB7
         Ja0KTejNzyFJSEIEGUhuNMuQX0o4U3jsTHcE8+ZXDR6kiJv3tZaSH3QTb+cHLu6QJrvU
         mbR36wZNtdfUnRYjY9ZdC1Xmv0ppiOToKUcMWBVJJUJ9QsfPg5DcoWkvP7ELLCRZjY0S
         hcRA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779140430; x=1779745230; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=APtfilTyxJ//E3ZOZF8+Qh3sz4Mo+/++kuI14GIkZvg=;
        b=KM43NDyIwCSxqAXJMixUrEPOV7FGWDgetVmzYw300A80C7b9178rL0WAa8a5LTWnTt
         ENldjaQrVbxZ85Q0Xw2wgIuiYURW4zwiojxH8HdQAgFXGYgChZzIDxgiWQ3vxs4EtUEs
         TZQ/Omdb1yvc3pWGsqMaGXb0YXigF9/FigNCE/J3p+4U4r97ljsc4FXAqGSp0EiavgTY
         y+hZ88NGuIaGrGzYqpOsBSNthsXI4XldMjBoXUqxwKlaim/1dQKDZ46umwZcP7SgHYi9
         Ey1rjwJUC/lux8cDik6IewQjv+jhwnay9/36a8Wmoanr8QklDTmVG37MEoTPG5SXT/cB
         BasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140430; x=1779745230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APtfilTyxJ//E3ZOZF8+Qh3sz4Mo+/++kuI14GIkZvg=;
        b=Td2kpBwdkVs8P3i1DT4q0Jj5AVdCNMo6J75F7zsJShOEAXiptJqsJg0q21J/qc7jaU
         4Ez9NZvI3AT0r//RlnN98dlpHYLA8m+uoMdQ0o/cu0W/ek2LuCmAYzpeZvRH8ThOcAYt
         EwIiZajZwBd954WzKOkR8DvstU/HHlzfKh9aDAlWfjdbgleR527G24jwFzpIeCOjTZCo
         K3NzVqbDgVCwHAgLeMKV79WwXJ3twlkrxFGAbmoEvKNbthyx8tzVma8Q3LzqrN7bcyq7
         dw+OxxfvHqMBvP1ay2yInYkJQXK76HIdL8TGo4rLXny/KsHlu0UW1JcGG4ZaHT9E88W3
         DmJg==
X-Gm-Message-State: AOJu0YyiSDW9UEcHDO4f79MaxWs6qPcNwsPQjLH/o5uT8PYrWLuqsj9a
	r78v+ODHT4yixmtikq6zoOsUiz1XINy+FWREJMPScJm3tUyP4kh3UvU6p52SQAjuVw9vUCf2KuG
	Sm7MGto/2herjtskq+AIrBfjzCoJcJEC64Q==
X-Gm-Gg: Acq92OHOKMRg/855IAsl7XHfqEgDvdNeDA9XvWXF8c32j3MVY1OF9a0VyoXgn2qw6xb
	9u7bBmMwHj7lpwW0+jWpQuc6Z6dAZZUBNkTLUO2kOxXssz1jeVmN3EQP2hxQDDOAbH6grQsgOn0
	6UStn66gECGHzNoWQbG+2Lu9nMZt375Ssyo0/chqZLhD7J4TiTKyXmdTINeTrBrmyTXbqejA3aK
	Di7OROkSflLYS4AmPUumSNctYhgyQ+OweuYTJuYkSKKKTIamIiCHG0XFvDG8C7Sb7D41LXFjdnj
	Kutp5JS3
X-Received: by 2002:a05:6000:310c:b0:43e:a73e:cc8a with SMTP id
 ffacd0b85a97d-45e5c5d88fcmr28031766f8f.36.1779140429446; Mon, 18 May 2026
 14:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260515094251.433364-1-jamin_lin@aspeedtech.com> <f8757960b4f15bf66d30fad45ab7b0a1512b036a.camel@pbarker.dev>
In-Reply-To: <f8757960b4f15bf66d30fad45ab7b0a1512b036a.camel@pbarker.dev>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Mon, 18 May 2026 23:40:18 +0200
X-Gm-Features: AVHnY4KSgLwcQBBl-0uCsohhvozU-cwphHD2Y2f8IZKJUy-BaysRxdUCZ1kZ9H8
Message-ID: <CAB3asfiuneQrWbw28UeBf_+63xyuGdM0F6GdKE6wa+sSPoKqRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1] kernel-fit-image: Check signing key files
 based on algorithm
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Troy Lee <troy_lee@aspeedtech.com>, Vince Chang <vince_chang@aspeedtech.com>, paul@pbarker.dev
Content-Type: multipart/alternative; boundary="0000000000004d80a406521e6937"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 21:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237262

--0000000000004d80a406521e6937
Content-Type: text/plain; charset="UTF-8"

Hi Jasmin

Probably Paul is right: pem versus crt + key is a different thing than ECS
versus RSA.

The its specification mentions only crt + key:
https://fitspec.osfw.foundation/#configuration-signature-nodes. Are you
sure that mkimage works with pem but not with crt + key?
My guess is that converting the pem somehow like
https://stackoverflow.com/questions/13732826/convert-pem-to-crt-and-key
would work as well.

If Yocto should get support for pem files it should support it for both
formats and this should be covered by tests as well. But since the fit spec
and the mkimage documentation do not mention pem files also on that side
some investigation would probably be needed to ensure this is officially
supported.

Regards
Adrian

Paul Barker via lists.openembedded.org <paul=
pbarker.dev@lists.openembedded.org> schrieb am Mo., 18. Mai 2026, 19:39:

> On Fri, 2026-05-15 at 09:42 +0000, Jamin Lin wrote:
> > The key file validation in run_mkimage_sign() unconditionally required
> > .key and .crt regardless of the signing algorithm. This prevented ECDSA
> > signing which uses a single .pem file.
> >
> > Extract the check into _check_sign_key_files() and detect the algorithm
> > from the algo string (e.g. "sha256,ecdsa384") by scanning all
> > comma-separated parts so field order does not matter:
> > - ECDSA: requires <keyname>.pem
> > - RSA  : requires <keyname>.key and <keyname>.crt
>
> Hi Jamin,
>
> This contradicts my understanding of cryptographic algorithms and file
> formats. To my knowledge, ECDSA & RSA are algorithms, PEM vs .key/.crt
> are file formats. You can have an RSA certificate in PEM format, and you
> can store the key & cert for use in ECDSA in .key & .crt files if you
> want to.
>
> Am I misunderstanding something here?
>
> Best regards,
>
> --
> Paul Barker
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237254):
> https://lists.openembedded.org/g/openembedded-core/message/237254
> Mute This Topic: https://lists.openembedded.org/mt/119327152/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004d80a406521e6937
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Jasmin</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Probably Paul is right: pem versus crt + key is a different thing=
 than ECS versus RSA.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
e its specification mentions only crt + key:=C2=A0<a href=3D"https://fitspe=
c.osfw.foundation/#configuration-signature-nodes" target=3D"_blank" rel=3D"=
noreferrer">https://fitspec.osfw.foundation/#configuration-signature-nodes<=
/a>. Are you sure that mkimage works with pem but not with crt + key?</div>=
<div dir=3D"auto">My guess is that converting the pem somehow like=C2=A0<a =
href=3D"https://stackoverflow.com/questions/13732826/convert-pem-to-crt-and=
-key">https://stackoverflow.com/questions/13732826/convert-pem-to-crt-and-k=
ey</a> would work as well.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">If Yocto should get support for pem files it should support it for both =
formats and this should be covered by tests as well. But since the fit spec=
 and the mkimage documentation do not mention pem files also on that side s=
ome investigation would probably be needed to ensure this is officially sup=
ported.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards</div><di=
v dir=3D"auto">Adrian</div><div dir=3D"auto"><br><div class=3D"gmail_quote"=
 dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Paul Barker via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">lists.openembedded.org</a> &lt;paul=3D<a href=3D"mailto:=
pbarker.dev@lists.openembedded.org" rel=3D"noreferrer noreferrer noreferrer=
" target=3D"_blank">pbarker.dev@lists.openembedded.org</a>&gt; schrieb am M=
o., 18. Mai 2026, 19:39:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, =
2026-05-15 at 09:42 +0000, Jamin Lin wrote:<br>
&gt; The key file validation in run_mkimage_sign() unconditionally required=
<br>
&gt; .key and .crt regardless of the signing algorithm. This prevented ECDS=
A<br>
&gt; signing which uses a single .pem file.<br>
&gt; <br>
&gt; Extract the check into _check_sign_key_files() and detect the algorith=
m<br>
&gt; from the algo string (e.g. &quot;sha256,ecdsa384&quot;) by scanning al=
l<br>
&gt; comma-separated parts so field order does not matter:<br>
&gt; - ECDSA: requires &lt;keyname&gt;.pem<br>
&gt; - RSA=C2=A0 : requires &lt;keyname&gt;.key and &lt;keyname&gt;.crt<br>
<br>
Hi Jamin,<br>
<br>
This contradicts my understanding of cryptographic algorithms and file<br>
formats. To my knowledge, ECDSA &amp; RSA are algorithms, PEM vs .key/.crt<=
br>
are file formats. You can have an RSA certificate in PEM format, and you<br=
>
can store the key &amp; cert for use in ECDSA in .key &amp; .crt files if y=
ou<br>
want to.<br>
<br>
Am I misunderstanding something here?<br><br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237254): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237254" rel=3D"noreferrer noreferrer noreferrer nor=
eferrer noreferrer" target=3D"_blank">https://lists.openembedded.org/g/open=
embedded-core/message/237254</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119327152/445=
4582" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/mt/119327152/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank"=
>openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" targe=
t=3D"_blank">https://lists.openembedded.org/g/openembedded-core/unsub</a> [=
<a href=3D"mailto:adrian.freihofer@gmail.com" rel=3D"noreferrer noreferrer =
noreferrer noreferrer" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br=
>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000004d80a406521e6937--

